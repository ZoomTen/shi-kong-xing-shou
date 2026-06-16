#!/usr/bin/env python3
# Rip a pointer-table's text region to a tx_parse .txt: one @org block per unique
# pointer target, decoding each string to its first terminator. Emits raw `db` for
# duplicate-glyph bytes (the non-canonical alias RGBDS can't reproduce from `text`).
#
# Usage: rip_text_table.py <bank_hex> <table_gb_hex> <n_entries> > out.txt
#   e.g. rip_text_table.py 26 5724 160 > data/text/monster_desc.txt
import sys
from collections import OrderedDict

# --- charmap (mirror dump_text.py) ---------------------------------------
# canonical = last LIVE charmap def of a glyph (RGBDS last-wins). Commented lines
# are read for decode knowledge only and are never canonical → always emitted as db.
chars = [dict() for _ in range(10)]
canonical = [dict() for _ in range(10)]
_last_live = [dict() for _ in range(10)]
cs = 0
for raw in open("charmap.asm"):
    if raw.startswith("NEWCHARMAP"):
        cs = int(raw[18])
        continue
    commented = raw.lstrip().startswith(";")
    body = raw.lstrip().lstrip(";").lstrip()
    if not body.startswith("charmap "):
        continue
    parts = body[8:].split(";")[0].split(",")
    if len(parts) != 2:
        continue
    ch = parts[0].strip()[1:-1]
    byte = int(parts[1].strip()[1:], 16)
    chars[cs].setdefault(byte, ch)
    if not commented:
        _last_live[cs][ch] = byte
for c in range(10):
    for ch, byte in _last_live[c].items():
        canonical[c][byte] = ch

def is_dup(charset, byte):
    return byte in chars[charset] and canonical[charset].get(byte) is None

ROM = open("baserom.gbc", "rb").read()

# In a pointer table, each entry is ONE line/string: it ends at the first
# separator or terminator byte. Map those bytes to the closing tx_parse command.
ENDERS = {0xe1: "signpost", 0xe2: "done", 0xe4: "return",
          0xec: "para", 0xed: "line", 0xee: "cont"}

def rip_string(off):
    """Decode one pointer-table entry: glyphs until the first ENDER byte.
    Returns (list of .txt lines, offset past the ender)."""
    out = []
    buf = ""          # accumulating glyphs for the current text run
    cur = -1          # current charset
    raw_run = False   # in a db run (after a dup); bare bytes must stay raw until
                      # the next explicit fN switch re-syncs tx_parse
    i = off

    def flush():
        nonlocal buf
        if buf:
            out.append(f'\ttext "{buf}";')
        buf = ""

    while True:
        b = ROM[i]; i += 1
        hi, lo = divmod(b, 0x10)
        if hi == 0xf:
            gb = ROM[i]; i += 1
            if is_dup(lo, gb):
                flush()
                out.append(f'\tdb $%02x, $%02x; #"%s"' % (b, gb, chars[lo][gb]))
                cur = lo          # RGBDS hardware charset is now `lo`
                raw_run = True     # but tx_parse lost track; stay in db mode
            elif lo == cur and not raw_run:
                # redundant switch to the charset already active: tx_parse's
                # auto-detect would NOT re-emit the fN, so force it raw to match.
                flush()
                out.append(f'\tdb $%02x, $%02x; #"%s"' % (b, gb, chars[lo][gb]))
                raw_run = True
            else:
                buf += chars[lo][gb]
                cur = lo
                raw_run = False
        elif b in ENDERS:
            flush()
            out.append(f"\t{ENDERS[b]};")
            return out, i
        else:
            # bare byte in charset `cur`. If we're mid-raw-run (after a db) or the
            # byte is itself a non-canonical alias, tx_parse can't reproduce it from
            # a `text` glyph — emit it raw. Otherwise resume normal text.
            if raw_run or is_dup(cur, b):
                flush()
                out.append(f'\tdb $%02x; #"%s"' % (b, chars[cur].get(b, "?")))
            else:
                buf += chars[cur].get(b, "?")

if __name__ == "__main__":
    bank = int(sys.argv[1], 16)
    table_gb = int(sys.argv[2], 16)
    n = int(sys.argv[3])
    base = bank * 0x4000 - 0x4000  # rom = gb + base

    tb = table_gb + base
    targets = OrderedDict()
    for k in range(n):
        p = ROM[tb + 2 * k] | (ROM[tb + 2 * k + 1] << 8)
        targets.setdefault(p, None)

    lines = []
    for gb in targets:
        lines.append(f"@org ${bank:02x}, ${gb:04x}:")
        body, _ = rip_string(gb + base)
        lines.extend(body)
        lines.append("")
    sys.stdout.write("\n".join(lines) + "\n")
