#!/usr/bin/env python3
"""Generate a translation worklist CSV from all in-game text in data/text.

Every text block is enumerated straight from the high-level `.txt` decodes in
data/text -- no build or `.asm` needed; the `.txt` headers already carry
bank/addr/label. One row = one whole text label: a block that produces no text
and does not terminate (a bare `init`/`signpost`/... prefix) falls through into
the following block and joins its row, so a speaker-init and the text it
introduces share a single row. The row keeps the first (entry) block's
bank/addr/label; the `(Label)` part of the header is optional. Use --require-asm
to restrict to text that is actually assembled into the ROM.

Columns: file, bank, addr, label, name, pic, zh, en, deepl, checked
  - file       : originating .txt basename (no folder, no extension); left blank
                 when the row shares the same source file as the row above it
  - bank, addr : hex (no `$`) taken from the `@org $bank, $addr` header
  - label      : explicit `(Label)` from the header, else blank
  - name, pic  : speaker / portrait from an `init NAME_x, PIC_y` in this block
                 (the `NAME_`/`PIC_` prefix stripped), else blank; not carried
                 across blocks
  - zh         : the source Chinese, reconstructed from the quoted text plus
                 `db ... ; #"X"` glyphs; line/cont breaks become `\\n`, para `\\n\\n`
  - en         : human translation (blank on fresh generation; carried on merge)
  - deepl      : machine draft (blank; carried on merge)
  - checked    : review flag (blank; carried on merge)

Merge: with --merge OLD.csv, the en/deepl/checked columns are carried forward
from the old CSV, keyed on `label`. A report of matched / changed / new /
dropped rows is printed to stderr so re-extractions never silently lose human
translation work.
"""
import argparse
import csv
import glob
import os
import re
import sys

ORG_RE = re.compile(r'^@org \$([0-9a-fA-F]+), \$([0-9a-fA-F]+)(?: \(([^)]*)\))?:')
INIT_RE = re.compile(r'^\s*init\s+([A-Za-z0-9_$]+)\s*,\s*([A-Za-z0-9_$]+)')
TERM_RE = re.compile(r'^\s*(done|return)\b')
QUOTE_RE = re.compile(r'"([^"]*)"')
DIRECTIVE_RE = re.compile(r'^([A-Za-z_0-9]+)')
# db comment payloads worth keeping: a quoted glyph or a ⟨placeholder⟩ token.
DB_QUOTE_RE = re.compile(r'#\s*"([^"]*)"')
DB_TOKEN_RE = re.compile(r'#\s*(⟨[^⟩]*⟩)')

BREAK_DIRECTIVES = frozenset(('line', 'cont', 'para'))
COLUMNS = ['file', 'bank', 'addr', 'label', 'name', 'pic', 'textend', 'nowrap',
           'zh', 'en', 'deepl', 'checked', 'notes']


def parse_init(body_lines):
    """Return (name, pic) of the last `init` in a block, prefixes stripped, or None.

    Args that aren't NAME_/PIC_ symbols (raw values like `$5b`, `0`) pass through
    unchanged.
    """
    found = None
    for raw in body_lines:
        m = INIT_RE.match(raw)
        if m:
            name, pic = m.group(1), m.group(2)
            if name.startswith('NAME_'):
                name = name[len('NAME_'):]
            if pic.startswith('PIC_'):
                pic = pic[len('PIC_'):]
            found = (name, pic)
    return found


def last_directive(body_lines):
    """The block's terminating command, captured VERBATIM from the source so
    operand-bearing terminators survive intact -- e.g. `getchoice String_1cc5`,
    `db $f8, $e4` -- not just the keyword. `make_english.py` emits this literally
    to close the block; name/menu text ends in `line` ($ed), dialogue in `done`
    ($e2). A block whose final directive is itself a `text` has no real
    terminator, so fall back to `done` (the historical default)."""
    last = ''
    last_kw = ''
    for raw in body_lines:
        line = raw.strip()
        if not line or line.startswith('#'):
            continue
        m = DIRECTIVE_RE.match(line)
        if not m:
            continue
        last_kw = m.group(1)
        # drop the `;` command terminator and any trailing `# ...` comment
        last = line.split(';', 1)[0].strip()
    if not last_kw or last_kw == 'text':
        return 'done'
    return last


def reconstruct_zh(body_lines, brk):
    """Turn the directive lines of one block into a single source string."""
    parts = []
    for raw in body_lines:
        line = raw.strip()
        if not line:
            continue
        m = DIRECTIVE_RE.match(line)
        directive = m.group(1) if m else ''
        if directive == 'db':
            q = DB_QUOTE_RE.search(line)
            if q:
                parts.append(q.group(1))
                continue
            t = DB_TOKEN_RE.search(line)
            if t:
                parts.append(t.group(1))
            # other db (control bytes / notes) contribute nothing
            continue
        if directive == 'para':
            parts.append(brk + brk)   # blank line between textboxes
        elif directive in BREAK_DIRECTIVES:
            parts.append(brk)         # line / cont -> a single break
        parts.extend(QUOTE_RE.findall(line))
    zh = ''.join(parts)
    # trim leading/trailing break markers produced by lone line;/para; etc.
    while zh.startswith(brk):
        zh = zh[len(brk):]
    while zh.endswith(brk):
        zh = zh[:-len(brk)]
    return zh


def extract_rows(text_dir, brk, require_asm=False, include_empty=True):
    rows = []
    skipped = []
    for path in sorted(glob.glob(os.path.join(text_dir, '*.txt'))):
        if require_asm and not os.path.exists(path[:-4] + '.asm'):
            skipped.append(os.path.basename(path))
            continue
        fname = os.path.splitext(os.path.basename(path))[0]

        # Collect raw @org blocks: (bank, addr, label, body_lines).
        blocks = []
        cur = None
        body = []
        with open(path, encoding='utf-8') as fh:
            for line in fh:
                m = ORG_RE.match(line)
                if m:
                    if cur is not None:
                        blocks.append((cur[0], cur[1], cur[2], body))
                    cur = (m.group(1), m.group(2), m.group(3) or '')
                    body = []
                elif cur is not None:
                    body.append(line)
            if cur is not None:
                blocks.append((cur[0], cur[1], cur[2], body))

        # Group into whole text labels: a block that produces no text and does
        # not terminate (a bare `init`/`signpost`/... prefix) falls through into
        # the block that follows it, so it joins that block's row.
        group = []

        def flush_group():
            if not group:
                return
            bank, addr, label = group[0][0], group[0][1], group[0][2]
            combined = []
            for blk in group:
                combined.extend(blk[3])
            name, pic = parse_init(combined) or ('', '')
            zh = reconstruct_zh(combined, brk)
            if zh or include_empty:
                rows.append({'file': fname, 'bank': bank, 'addr': addr,
                             'label': label, 'name': name, 'pic': pic,
                             'textend': last_directive(combined), 'nowrap': '',
                             'zh': zh, 'en': '', 'deepl': '0', 'checked': '0', 'notes': ''})

        for blk in blocks:
            group.append(blk)
            b = blk[3]
            ends_label = any(TERM_RE.match(l) for l in b) or bool(reconstruct_zh(b, brk))
            if ends_label:
                flush_group()
                group = []
        flush_group()  # trailing prefix-only block(s), if any
    return rows, skipped


def merge_old(rows, old_path, reset_checked_on_change):
    with open(old_path, encoding='utf-8', newline='') as fh:
        old = {(r['bank'], r['addr']): r for r in csv.DictReader(fh)}
    matched = changed = 0
    used = set()
    for r in rows:
        key = (r['bank'], r['addr'])
        prev = old.get(key)
        if prev is None:
            continue
        matched += 1
        used.add(key)
        r['en'] = prev.get('en', '')
        r['deepl'] = prev.get('deepl', '')
        r['checked'] = prev.get('checked', '')
        # Preserve manual overrides of the controller columns across re-extraction
        # (textend is normally source-stable; nowrap is hand-set).
        if prev.get('textend'):
            r['textend'] = prev['textend']
        if prev.get('nowrap'):
            r['nowrap'] = prev['nowrap']
        if prev.get('zh', '') != r['zh']:
            changed += 1
            if reset_checked_on_change:
                r['checked'] = ''
    dropped = ['%s:%s' % k for k in old if k not in used]
    return matched, changed, dropped


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--text-dir', default='text', help='directory of .txt decodes')
    ap.add_argument('--out', default='translation/text.csv', help='output CSV path')
    ap.add_argument('--merge', metavar='OLD.csv',
                    help='carry en/deepl/checked from an older CSV, keyed on label')
    ap.add_argument('--reset-checked-on-change', action='store_true',
                    help='when merging, blank `checked` if the zh source changed')
    ap.add_argument('--real-newlines', action='store_true', default=True,
                    help='use real newlines for line breaks instead of literal \\n')
    ap.add_argument('--skip-empty', action='store_true',
                    help='omit blocks whose zh is empty (e.g. speaker-init-only labels)')
    ap.add_argument('--require-asm', action='store_true',
                    help='only emit text from .txt files that have a matching .asm '
                         '(i.e. actually assembled into the ROM); skips stray/orphan .txt')
    args = ap.parse_args()

    brk = '\n' if args.real_newlines else '\\n'
    rows, skipped = extract_rows(args.text_dir, brk, require_asm=args.require_asm,
                                 include_empty=not args.skip_empty)

    # drop duplicate (bank,addr) keys (keep first) so a stray file can't
    # double-write a row or corrupt merge keying.
    seen = set()
    deduped = []
    dups = []
    for r in rows:
        key = (r['bank'], r['addr'])
        if key in seen:
            dups.append('%s:%s' % key)
            continue
        seen.add(key)
        deduped.append(r)
    rows = deduped
    if dups:
        sys.stderr.write('WARNING: skipped %d duplicate bank:addr row(s), e.g. %s\n'
                         % (len(dups), ', '.join(dups[:5])))

    if args.merge:
        matched, changed, dropped = merge_old(rows, args.merge, args.reset_checked_on_change)
        sys.stderr.write('merge: %d matched, %d with changed zh, %d new, %d dropped from old\n'
                         % (matched, changed, len(rows) - matched, len(dropped)))
        if dropped:
            sys.stderr.write('  dropped old labels (no longer present): %s%s\n'
                             % (', '.join(dropped[:10]), ' ...' if len(dropped) > 10 else ''))

    with open(args.out, 'w', encoding='utf-8', newline='') as fh:
        w = csv.DictWriter(fh, fieldnames=COLUMNS)
        w.writeheader()
        prev_file = None
        for r in rows:
            out = dict(r)
            if out['file'] == prev_file:
                out['file'] = ''  # blank when same source file as previous row
            else:
                prev_file = out['file']
            w.writerow(out)

    nonempty = sum(1 for r in rows if r['zh'])
    sys.stderr.write('wrote %d rows (%d with text) to %s%s\n'
                     % (len(rows), nonempty, args.out,
                        (' [skipped %d asm-less file(s)]' % len(skipped)) if skipped else ''))


if __name__ == '__main__':
    main()
