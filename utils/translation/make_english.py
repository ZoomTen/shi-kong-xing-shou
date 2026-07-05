#!/usr/bin/env python3
"""Generate English .txt files (data/text DSL) from a translated worklist CSV.

Reverse of gen_text_csv.py: reads the CSV (with the `en` column filled in) and
writes one .txt per source `file`, substituting the English text. Each row
becomes one block:

    @org $bank, $addr (label):
        init NAME_x, PIC_y;     ; only when name/pic are set
        text "<first line>";
        line "<next line>";     ; single \\n = line break (text->line->cont...)
        para "<new page>";      ; blank line (\\n\\n) = new textbox
        done;

English line breaks come from 13-glyph line-limiting + automatic hyphenation
(pyphen), ported from english2's tools/csv2asm.py, so a long English string is
wrapped to fit the textbox the same way the real en build does. Author line
breaks are honoured first, then each line is wrapped. A single \\n is a line
break within the box; a blank line (\\n\\n) opens a new textbox (para). Inline
`<itemname2>`-style markers become their directive (see INLINE_COMMANDS).

This is a translation *scaffold*, not a byte-exact rebuild. The CSV collapsed
everything except name/pic and line breaks, so choices (getchoice), forcemap,
raw db glyphs and the exact terminator (done vs return) are NOT recovered. init
values are re-prefixed with NAME_/PIC_ unless they already start with `$`. Inline
command markers (`<itemname2>`, `⟨name⟩`, ...) in the en cell ARE emitted as
their directives -- see INLINE_COMMANDS.

Untranslated rows (empty `en`) are NOT reconstructed: their original block is
copied *verbatim* from the matching source file under --source-dir (text/ or
lang_zh/text/), keyed by `@org $bank, $addr`, so the original glyphs/directives
survive untouched (no mojibake). Translated rows are reconstructed and get an
`english;` directive injected -- after the `init`, or before the first `text`
directive when there is no init -- to switch the engine to the perma-English
character set for that dialog. (If the source block can't be found, the row
falls back to reconstruction with a `# TODO untranslated` comment.)
"""
import argparse
import csv
import importlib.util
import os
import re
import sys

WRAP_LIMIT = 13                  # glyphs per line (matches csv2asm.py)
ORG_RE = re.compile(r'^@org \$([0-9a-fA-F]+), \$([0-9a-fA-F]+)')  # block header

# Apostrophe-contractions and ellipsis collapse to a single glyph/tile, so they
# must count as ONE column when limiting width. We substitute them to a private
# 1-char token before wrapping, then substitute back for the readable output
# (verbatim from csv2asm.py so the wrap matches the real en build).
CONTRACTIONS = {
    "'d": "\U0001d609", "'l": "\U0001d611", "'s": "\U0001d618", "'t": "\U0001d619",
    "'v": "\U0001d61b", "'r": "\U0001d617", "'m": "\U0001d612", "'e": "\U0001d60a",
    "'a": "\U0001d606", "'i": "\U0001d60e", "'o": "\U0001d614", "'u": "\U0001d61a",
    "...": "⋯",
    "'é": "\U0001d5f2", "'â": "\U0001d41a", "'ê": "\U0001d41e",
    "'î": "\U0001d422", "'ô": "\U0001d428", "'û": "\U0001d42e",
    "'à": "\U0001d44e", "'è": "\U0001d452", "'ì": "\U0001d456",
    "'ò": "\U0001d45c", "'ù": "\U0001d462", "'ë": "\U0001d486",
    "'ï": "\U0001d48a", "'ü": "\U0001d496",
}
_HAVE_PYPHEN = importlib.util.find_spec('pyphen') is not None

# Inline commands: a `<token>` or `⟨token⟩` in the en cell is emitted as the
# mapped directive instead of wrapped as literal text, so a translated block can carry
# the item-name / battle inserts that sit mid-string. Covers the dialog item-name
# macros (itemname/itemname2) that gen_csv drops, and the raw control bytes it surfaces
# as ⟨...⟩ tokens in the zh column. Both bracket styles are accepted.
INLINE_COMMANDS = {
    'itemname':  'itemname',   # $e3  dialog: item name
    'itemname2': 'itemname2',  # $ea  dialog: item name (shop / found)
    'name':      'db $e7',     # battle: insert name
    'name2':     'db $e8',     # battle: insert name (variant)
    'trainer':   'db $e9',     # battle: insert trainer name
    'num':       'db $e1',     # battle: insert number
    'e5':        'db $e5',     # raw control byte
    'e6':        'db $e6',     # raw control byte
    'even':      'db $ef',     # composed-menu: flush the VWF glyph to the next
                               # whole tile so labels don't share a tile
}
# <token> or ⟨token⟩; longest keys first so `itemname2` beats `itemname`.
MARKER_RE = re.compile(
    r'[<\u27e8](' +
    '|'.join(sorted((re.escape(k) for k in INLINE_COMMANDS), key=len, reverse=True)) +
    r')[>\u27e9]')


# --- VWF pixel-aware wrapping (Pass 3) ------------------------------------
# Wrap by summed VWF advance widths (english_vwf_widths.asm, the same table the ROM
# uses) instead of a flat glyph count, so proportional lines fill the 14-tile box.
WRAP_PX = 110   # per-line pixel budget (14-tile dialog text area = 112px; ~2px margin)
# Several menu boxes are 18 tiles wide = 144px (the ShowBattleMessage box and the
# character/monster description boxes), so their menu-rendered (para-breaking)
# blocks get a wider budget. `_active_wrap_px` is set per-block in emit_block from
# the block's file+type and read by the wrap helpers below; it defaults to
# WRAP_PX for every other box.
WRAP_PX_WIDE = 142
WIDE_FILES = {'battle_messages', 'personality_desc', 'mon_descriptions'}
_active_wrap_px = WRAP_PX


def _load_char_px():
    """char / contraction-placeholder -> VWF advance width in px. Reads the generated
    english_vwf_widths.asm (code->width) + the english charmap (token->code); no PIL
    needed. Returns None on any failure so wrap() falls back to the glyph-count wrap."""
    here = os.path.dirname(os.path.abspath(__file__))
    repo = os.path.dirname(os.path.dirname(here))
    wpath = os.path.join(repo, "lang_en", "gfx", "character_set", "english_vwf_widths.asm")
    cpath = os.path.join(repo, "charmap.asm")
    try:
        widths, started = [], False
        with open(wpath, encoding="utf-8", errors="replace") as f:
            for ln in f:
                if "VWFWidths::" in ln:
                    started = True
                    continue
                if not started:
                    continue
                m = re.match(r"\s*db\s+(.+)", ln)
                if not m:
                    if widths:
                        break
                    continue
                for tok in m.group(1).split(","):
                    tok = tok.strip().split(";")[0].strip()
                    if tok.startswith("$"):
                        widths.append(int(tok[1:], 16))
        cm, in_en = {}, False
        with open(cpath, encoding="utf-8", errors="replace") as f:
            for ln in f:
                s = ln.strip()
                if s.startswith("NEWCHARMAP english"):
                    in_en = True
                    continue
                if in_en and s.startswith("NEWCHARMAP"):
                    break
                if not in_en:
                    continue
                m = re.match(r'charmap\s+"(.*)",\s*\$([0-9a-fA-F]+)', s)
                if m:
                    cm[m.group(1)] = int(m.group(2), 16)
        if not widths or not cm:
            return None
        px = {}
        for tok, code in cm.items():
            if code < len(widths):
                px[tok] = widths[code]
        for og, glyph in CONTRACTIONS.items():
            if og in cm and cm[og] < len(widths):
                px[glyph] = widths[cm[og]]
        return px
    except (OSError, ValueError):
        return None


CHAR_PX = _load_char_px()
_DEFAULT_PX = 6
_HYPHEN_PX = (CHAR_PX or {}).get("-", 3)


def _line_px(s):
    return sum(CHAR_PX.get(ch, _DEFAULT_PX) for ch in s)


def _hyph_fragments(word, wrapper):
    """Break an over-long word into hyphenated fragments, each <= WRAP_PX px."""
    pts = sorted(set([0] + list(wrapper.positions(word)) + [len(word)]))
    frags, start = [], 0
    while start < len(word):
        best = None
        for p in pts:
            if p <= start:
                continue
            last = (p == len(word))
            if _line_px(word[start:p]) + (0 if last else _HYPHEN_PX) <= _active_wrap_px:
                best = p
            elif best is not None:
                break
        if best is None:
            nxt = [p for p in pts if p > start]
            best = nxt[0] if nxt else len(word)
        last = (best == len(word))
        frags.append(word[start:best] + ("" if last else "-"))
        start = best
    return frags


def wrap(text, lang, warnings):
    """Pixel-aware greedy word wrap using VWF advance widths (WRAP_PX budget).
    Contractions arrive as single-char placeholders. Falls back to the legacy
    glyph-count wrap (_wrap_count) if the VWF width table is unavailable."""
    if CHAR_PX is None:
        return _wrap_count(text, lang, warnings)
    wrapper = None
    if _HAVE_PYPHEN:
        import pyphen
        wrapper = pyphen.Pyphen(lang=pyphen.language_fallback(lang))
    lines = [""]
    for word in re.split(r" +", text):
        if word == "":
            continue
        cand = word if lines[-1] == "" else lines[-1] + " " + word
        if _line_px(cand) <= _active_wrap_px:
            lines[-1] = cand
            continue
        if lines[-1] != "" and _line_px(word) <= _active_wrap_px:
            lines.append(word)
            continue
        if lines[-1] != "":
            lines.append("")
        if wrapper:
            warnings.append("XXX Automatic hyphenation, please check")
            for k, frag in enumerate(_hyph_fragments(word, wrapper)):
                if k == 0:
                    lines[-1] = frag
                else:
                    lines.append(frag)
        else:
            warnings.append("XXX pyphen not installed, long word may clip!")
            lines[-1] = word
    lines = [l for l in lines if l != ""]
    over = [l for l in lines if _line_px(l) > _active_wrap_px]
    if over:
        warnings.append("XXX Text overflows (px>%d) on: %r" % (_active_wrap_px, over))
    return lines


def _wrap_count(text, lang, warnings):
    """13-glyph line limit + pyphen auto-hyphenation. Ported from csv2asm.py.

    Appends any `XXX` advisories to `warnings` instead of printing them, so the
    caller can emit them as `#` comments in the .txt.
    """
    wrapped = [ln.strip() for ln in
               re.findall(r'.{1,' + str(WRAP_LIMIT) + r'}(?:\s+|$|-)', text)]
    if ' '.join(wrapped) != text:
        # the simple greedy split clipped a word -> try hyphenation
        if _HAVE_PYPHEN:
            import pyphen
            warnings.append('XXX Automatic hyphenation, please check')
            wrapper = pyphen.Pyphen(lang=pyphen.language_fallback(lang))
            split_txt = [ln.strip() for ln in re.findall(r'.+?(?:\s+|$|-)', text)]
            printed = 0
            joined = ['']
            for i in range(len(split_txt)):
                cur = split_txt[i]
                if i != len(split_txt) - 1 and cur[-1:] != '-':
                    cur += ' '
                need = len(cur)
                if printed + need < WRAP_LIMIT:
                    joined[-1] += cur
                    printed += need
                elif printed + need == WRAP_LIMIT:
                    joined[-1] += cur
                    printed = 0
                    joined.append('')
                else:
                    hyph = wrapper.wrap(cur, WRAP_LIMIT - printed)
                    if hyph:
                        for part in hyph:
                            if part != hyph[0]:
                                joined.append(part)
                                printed = len(part)
                            else:
                                joined[-1] += part
                    else:  # nothing to hyphenate, push to a fresh line
                        joined.append(cur)
                        printed = len(cur)
            wrapped = [x.strip() for x in joined if x.strip() != '']
        else:
            warnings.append('XXX pyphen not installed, text may be clipped!')
    overflow = [x for x in wrapped if len(x) > WRAP_LIMIT]
    if overflow:
        warnings.append('XXX Text overflows on: %s' % overflow)
    return wrapped


def reprefix(val, prefix):
    if not val or val.startswith('$'):
        return val
    return prefix + val


_SOURCE_CACHE = {}   # source_dir -> {fname -> {(bank, addr) -> [verbatim lines]}}


def load_source_blocks(source_dir, fname):
    """Return {(bank_int, addr_int): [lines]} for one source .txt, cached.

    A block runs from its `@org` header to just before the next header (or EOF),
    trailing blank lines stripped. EOL is normalised to LF (splitlines), so a
    CRLF source copies cleanly into the LF output. Missing file -> {}.
    """
    by_file = _SOURCE_CACHE.setdefault(source_dir, {})
    if fname in by_file:
        return by_file[fname]
    blocks = {}
    path = os.path.join(source_dir, fname + '.txt')
    try:
        with open(path, encoding='utf-8') as fh:
            text = fh.read()
    except FileNotFoundError:
        by_file[fname] = blocks
        return blocks
    key = None
    cur = None
    for line in text.splitlines():
        m = ORG_RE.match(line)
        if m:
            key = (int(m.group(1), 16), int(m.group(2), 16))
            cur = blocks.setdefault(key, [])
        if cur is not None:
            cur.append(line)
    for k, lns in blocks.items():
        while lns and lns[-1].strip() == '':
            lns.pop()
    by_file[fname] = blocks
    return blocks


def emit_verbatim(row, source_dir, warnings):
    """Copy the untranslated block verbatim from --source-dir, or None if absent.

    No `english;` is injected: the original glyphs/directives are left untouched
    so the engine keeps rendering them with the source character set.
    """
    blocks = load_source_blocks(source_dir, row['file_resolved'])
    try:
        key = (int(row['bank'], 16), int(row['addr'], 16))
    except (ValueError, KeyError):
        return None
    lns = blocks.get(key)
    if lns is None:
        warnings.append('no source block for $%s, $%s in %s/%s.txt'
                        % (row.get('bank'), row.get('addr'),
                           source_dir, row['file_resolved']))
        return None
    return list(lns)


def inject_english(lines):
    """Insert `\\tenglish;` as the block's first directive, right after the @org
    header (lines[0]) and BEFORE any `init`.

    English mode must be active before the textbox opens, because `init` loads
    and draws the speaker name immediately -- if the switch came after `init`,
    an English name would be drawn in the wrong (Chinese) mode. In the final ROM
    this lands right after each non-stub label (repointed bodies carry it; the
    `tfarjump` stubs do not)."""
    lines.insert(1, '\tenglish;')
    return lines


def emit_text_run(lines, text, nowrap, lang, warnings, starter, sub,
                  keep_lead=False, keep_trail=False, append=False, menu=False):
    """Wrap one text run and append its text/line/cont lines; return the new sub
    count. `append` keeps the run's first piece on the current visual line (`text`),
    for text that follows an inline marker so it does not force a new line. A space
    touching an inline-command marker is preserved (e.g. `Found <itemname2>`)."""
    if text == '':
        return sub
    # Strip ONLY the space touching a marker (carried by lead/trail); a marker-free
    # run passes through unchanged so wrap() behaves exactly as before this feature.
    lead = trail = ''
    if keep_lead and text[:1] == ' ':
        lead, text = ' ', text.lstrip(' ')
    if keep_trail and text[-1:] == ' ':
        trail, text = ' ', text.rstrip(' ')
    work = text
    for og, glyph in CONTRACTIONS.items():
        work = work.replace(og, glyph)
    pieces = [work.strip()] if nowrap else wrap(work, lang, warnings)
    pieces = [p for p in pieces if p != '']
    if not pieces:
        if lead or trail:
            if append:
                lines.append('\ttext " ";')
            else:
                sub += 1
                kw = starter if sub == 1 else ('para' if menu else 'line' if sub == 2 else 'cont')
                lines.append('\t%s " ";' % kw)
        return sub
    out = []
    for piece in pieces:
        for og, glyph in CONTRACTIONS.items():
            piece = piece.replace(glyph, og)
        out.append(piece)
    out[0] = lead + out[0]
    out[-1] = out[-1] + trail
    for i, piece in enumerate(out):
        if append and i == 0:
            kw = 'text'  # continue the current line after the marker, no forced break
        else:
            sub += 1
            kw = starter if sub == 1 else ('para' if menu else 'line' if sub == 2 else 'cont')
        lines.append('\t%s "%s";' % (kw, piece))
    return sub


def open_visual_line(lines, box, sub, menu):
    """A marker is the first content of a new visual line, so emit the break directive a
    leading text run would have carried. Box 1's line 1 is opened by the textbox itself,
    so nothing. Menu blocks use `para` for every break. Returns sub."""
    sub += 1
    if sub == 1:
        if box > 1:
            lines.append('\tpara;')
    elif menu:
        lines.append('\tpara;')
    else:
        lines.append('\tline;' if sub == 2 else '\tcont;')
    return sub


def emit_block(row, lang, keep_zh_comment, mark_english=False):
    lines = []
    hdr = '@org $%s, $%s' % (row['bank'], row['addr'])
    if row.get('label'):
        hdr += ' (%s)' % row['label']
    lines.append(hdr + ':')

    name = reprefix(row.get('name', ''), 'NAME_')
    pic = reprefix(row.get('pic', ''), 'PIC_')
    if name or pic:
        lines.append('\tinit %s, %s;' % (name or '0', pic or '0'))

    en = row.get('en', '')
    if en == '' and keep_zh_comment:
        zh = row.get('zh', '').replace('\\n', ' ').replace('\n', ' ')
        lines.append('\t# TODO untranslated -- zh: %s' % zh)

    # `nowrap` (any value) skips the 13-glyph wrap -- e.g. names, which are
    # rendered by readers that don't line-wrap; author \n breaks still apply.
    nowrap = bool(row.get('nowrap', ''))
    # Menu-read blocks (names/menu items/descriptions, terminated by `line`) reach the
    # menu interpreter, where line=Done and cont=Skip -- only `para` is a line break
    # there (MenuText_ec). So emit every break as `para` for them.
    menu = (row.get('textend') or '').strip().startswith('line')
    # Menu blocks bound for an 18-tile box (144px) -- battle messages, character &
    # monster descriptions -- get the wider wrap budget. Dialogue-style blocks
    # (line/cont, menu=False, e.g. the rival pre-battle dialogue in battle_messages)
    # keep the default 14-tile width.
    global _active_wrap_px
    _active_wrap_px = (WRAP_PX_WIDE if menu and row.get('file_resolved') in WIDE_FILES
                       else WRAP_PX)
    # Box/line structure: a blank line (`\n\n`) starts a new textbox (`para`); a single
    # `\n` forces a line break within the box, walking text -> line -> cont -> cont...
    # just as the 13-glyph auto-wrap does. Inline-command markers (`<itemname2>`) are
    # emitted as their own directive, splitting the surrounding text. Literal `\\n` in
    # the cell is accepted as a newline too.
    en_quoted = en.replace('\\n', '\n').replace('"', "'")
    box = 0
    for para_seg in en_quoted.split('\n\n'):
        box += 1
        warnings = []
        sub = 0
        for line_seg in para_seg.split('\n'):
            line_content = False  # has this visual line's opening directive been emitted?
            pos = 0
            for m in MARKER_RE.finditer(line_seg):
                starter = 'para' if box > 1 and sub == 0 else 'text'
                before = sub
                sub = emit_text_run(lines, line_seg[pos:m.start()], nowrap, lang, warnings,
                                    starter, sub, keep_lead=pos > 0, keep_trail=True,
                                    append=pos > 0, menu=menu)
                if sub > before:
                    line_content = True
                if not line_content:
                    sub = open_visual_line(lines, box, sub, menu)  # marker leads the line
                    line_content = True
                lines.append('\t%s;' % INLINE_COMMANDS[m.group(1)])
                pos = m.end()
            starter = 'para' if box > 1 and sub == 0 else 'text'
            sub = emit_text_run(lines, line_seg[pos:], nowrap, lang, warnings,
                                starter, sub, keep_lead=pos > 0, append=pos > 0, menu=menu)
        for w in warnings:
            lines.append('\t# %s' % w)
    # `textend` is the block's terminating command, derived per-block from the
    # source by gen_csv (line/done/return/...); defaults to done for old CSVs.
    lines.append('\t%s;' % (row.get('textend') or 'done'))
    if mark_english:
        inject_english(lines)
    return lines


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--csv', default='translation/text.csv', help='translated worklist CSV')
    ap.add_argument('--out-dir', default='lang_en/text',
                    help='directory to write the per-file English .txt into')
    ap.add_argument('--source-dir', default='lang_zh/text',
                    help='directory of original .txt to copy untranslated blocks'
                         ' from verbatim (e.g. text, lang_zh/text)')
    ap.add_argument('--lang', default='en_US',
                    help='language for hyphenation (pyphen), e.g. en_US, fr, de')
    ap.add_argument('--skip-untranslated', action='store_true',
                    help='omit rows whose en cell is empty')
    ap.add_argument('--no-zh-comment', action='store_true',
                    help='do not leave a "TODO -- zh: ..." comment on empty en rows')
    args = ap.parse_args()

    # group rows by source file, carrying the sparse `file` column forward
    files = {}            # fname -> list of row dicts (insertion-ordered)
    order = []
    cur_file = None
    with open(args.csv, encoding='utf-8', newline='') as fh:
        for row in csv.DictReader(fh):
            f = row.get('file') or cur_file
            if f is None:
                sys.stderr.write('ERROR: first data row has no file name\n')
                return 1
            cur_file = f
            row['file_resolved'] = f   # carry the resolved name for verbatim lookup
            if f not in files:
                files[f] = []
                order.append(f)
            files[f].append(row)

    os.makedirs(args.out_dir, exist_ok=True)
    written = 0
    rows_out = 0
    skipped = 0
    verbatim = 0
    missing = 0
    for f in order:
        blocks = []
        for row in files[f]:
            untranslated = row.get('en', '') == ''
            if args.skip_untranslated and untranslated:
                skipped += 1
                continue
            if untranslated:
                warnings = []
                lns = emit_verbatim(row, args.source_dir, warnings)
                if lns is not None:
                    blocks.append('\n'.join(lns))
                    verbatim += 1
                    rows_out += 1
                    continue
                # source block absent -> reconstruct (no english;) and flag it
                for w in warnings:
                    sys.stderr.write('WARNING: %s\n' % w)
                missing += 1
                blocks.append('\n'.join(
                    emit_block(row, args.lang, not args.no_zh_comment)))
                rows_out += 1
                continue
            blocks.append('\n'.join(
                emit_block(row, args.lang, not args.no_zh_comment,
                           mark_english=True)))
            rows_out += 1
        if not blocks:
            continue
        path = os.path.join(args.out_dir, f + '.txt')
        # atomic, guarded: never leave a truncated file behind
        text = '\n\n'.join(blocks) + '\n'
        tmp = path + '.tmp'
        with open(tmp, 'w', encoding='utf-8') as out:
            out.write(text)
        os.replace(tmp, path)
        written += 1

    sys.stderr.write('wrote %d file(s), %d block(s) to %s '
                     '[%d verbatim, %d english, %d missing-source%s]\n'
                     % (written, rows_out, args.out_dir, verbatim,
                        rows_out - verbatim - missing, missing,
                        (', %d skipped' % skipped) if skipped else ''))
    return 0


if __name__ == '__main__':
    sys.exit(main())
