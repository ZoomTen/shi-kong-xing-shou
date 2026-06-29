#!/usr/bin/env python3
"""Convert English text .txt -> in-bank stub .asm + a single repointed.asm.

Each TRANSLATED block (one carrying an `english` directive) is replaced in its
original bank by a 4-byte `tfarjump __label` stub at its original label, and its
real body is emitted as its own auto-placed `SECTION "__label", ROMX` in
repointed.asm. Untranslated (verbatim) blocks stay fully in-bank.

This shrinks every translated block in an overflowing bank to a stub while the
label (and therefore every pointer-table entry / `textface` BANK() assertion
referring to it) stays put. The bulk English floats into free ROM space, turning
26 per-bank overflow limits into one global capacity check.

The block-encoding core is reused from tools/tx_parse.py (load_charsets /
tokenize / convert) so the charset-splitting logic is never duplicated.

EXCLUDE: some text is read by routines that do NOT interpret $e0-$ff control
codes, so a $fa stub would render as garbage -- those files must stay fully
in-bank:
  * `names`                 -> CopyNameString raw copy (engine/copy_names.asm)
  * `paperscroll_move_names` -> Func_00d_40b8 custom renderer (banks/bank_0d.asm)
Pass --exclude <stem> to add any other such category discovered later.
"""
import argparse
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                '..', '..', 'tools'))
import tx_parse

# Text categories NOT read through _PrintText / PrintMenuText (see module docstring).
DEFAULT_EXCLUDE = {'names', 'paperscroll_move_names'}


def render_inbank(preamble, blocks, repoint_labels):
    """Lines for the in-bank .asm: a stub for each repointed block, the full
    body (blank line + label + lines) otherwise."""
    out = list(preamble)
    for blk in blocks:
        label = blk['label']
        if label in repoint_labels:
            out.append('%s:: tfarjump __%s' % (label, label))
        else:
            out.append('')
            out.append('%s::' % label)
            out.extend(blk['lines'])
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('files', nargs='+', help='English text .txt sources')
    ap.add_argument('--repointed', default='repointed.asm',
                    help='aggregated far-text output (its own object)')
    ap.add_argument('--charmap', default='charmap.asm')
    ap.add_argument('--exclude', action='append', default=[],
                    help='file stem to leave fully in-bank (repeatable)')
    args = ap.parse_args()

    exclude = set(DEFAULT_EXCLUDE) | set(args.exclude)
    charsets = tx_parse.load_charsets(args.charmap)

    far = []          # (label, body_lines) for relocated blocks, in emit order
    excluded_hit = set()
    for path in sorted(args.files):
        stem = os.path.splitext(os.path.basename(path))[0]
        with open(path, 'r', encoding='utf-8') as fh:
            preamble, blocks = tx_parse.convert(tx_parse.tokenize(fh.read()), charsets)

        do_repoint = stem not in exclude
        if not do_repoint:
            excluded_hit.add(stem)
        repoint_labels = set()
        for blk in blocks:
            if do_repoint and blk['english'] and blk['label']:
                repoint_labels.add(blk['label'])
                far.append((blk['label'], blk['lines']))

        asm_path = os.path.splitext(path)[0] + '.asm'
        with open(asm_path, 'w', encoding='utf-8') as out:
            out.write('\n'.join(render_inbank(preamble, blocks, repoint_labels)) + '\n')

    # One repointed.asm: its own object, one auto-placed ROMX section per block.
    # `INCLUDE "constants.asm"` supplies charmap.asm + the text macros.
    rp = ['INCLUDE "constants.asm"', '']
    for label, body in far:
        rp.append('SECTION "__%s", ROMX' % label)
        rp.append('__%s::' % label)
        rp.extend(body)
        rp.append('')
    with open(args.repointed, 'w', encoding='utf-8') as out:
        out.write('\n'.join(rp) + '\n')

    sys.stderr.write('repoint: %d file(s), %d block(s) relocated, excluded %s\n'
                     % (len(args.files), len(far),
                        sorted(excluded_hit) if excluded_hit else '(none)'))


if __name__ == '__main__':
    main()
