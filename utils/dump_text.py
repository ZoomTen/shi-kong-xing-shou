#!/usr/bin/env python3
import math
import sys
import re
from lib.gbtool import addr2offset, str2addr, get_symbol, is_symbol_defined, read_symbols

chars = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}

file = "baserom.gbc"

rom_sym = read_symbols(open('shi_kong_xing_shou.sym').read())['rom']
_NAME = {}; _PIC = {}; _v = 0
for _l in open('constants/text_constants.asm', encoding='utf-8'):
    _s = _l.split(';')[0].strip()
    if _s == 'const_def' or _s.startswith('const_def '):
        _p = _s.split(); _v = int(_p[1][1:], 16) if len(_p) > 1 else 0; continue
    if _s.startswith('const '):
        _n = _s.split()[1]
        if _n.startswith('NAME_'): _NAME[_v] = _n
        elif _n.startswith('PIC_'): _PIC[_v] = _n
        _v += 1
def nm(v): return _NAME.get(v, '$%02x' % v)
def pic(v): return _PIC[v] if v in _PIC else '$%02x' % v
def gc(a):
    _o = addr2offset(0, a)
    return get_symbol(rom_sym, _o) if is_symbol_defined(rom_sym, _o) else '$%04x' % a

if len(sys.argv) < 3:
	print(f'{sys.argv[0]} address count')
	print('\taddress can be in BB:AAAA form or as a hex number')
	exit(0)

# canonical[charset][byte] = glyph, for the byte RGBDS emits for `text "<glyph>"`.
# RGBDS uses the LAST live `charmap` definition of a glyph. A glyph with more than
# one byte (e.g. 振=$a4/$a5) is ambiguous: only the canonical byte round-trips from
# a plain `text "…"`; every other byte must be emitted as a raw `db` (see the
# hand-written precedent in data/text/equipment_names.txt).
#
# We also read COMMENTED charmap lines into `chars` (byte->glyph) so we can still
# *decode* a byte whose definition is commented out (e.g. 振 $a5) — but a commented
# byte is never canonical, so it always becomes a db.
canonical = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
_glyph_last_live = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}  # glyph -> last live byte

for raw in open("charmap.asm"):
    if raw.startswith("NEWCHARMAP"):
        charset = int(raw[18])
        continue
    commented = raw.lstrip().startswith(";")
    body = raw.lstrip().lstrip(";").lstrip()
    if not body.startswith("charmap "):
        continue
    parts = body[8:].split(";")[0].split(",")
    if len(parts) != 2:
        continue
    char = parts[0].strip()[1:-1]
    byte = int(parts[1].strip()[1:], 16)
    # know the byte->glyph for decoding, live or commented
    chars[charset].setdefault(byte, char)
    # canonical = last LIVE def of this glyph
    if not commented:
        _glyph_last_live[charset][char] = byte

for cs in range(10):
    for char, byte in _glyph_last_live[cs].items():
        canonical[cs][byte] = char

def is_duplicate(charset, byte):
    """True if (charset, byte) is a glyph alias RGBDS would NOT reproduce from
    `text "<glyph>"` (a non-canonical or commented byte). Must be emitted as db."""
    return byte in chars[charset] and canonical[charset].get(byte) is None

glyph_max_cs = {}
for _cs in range(10):
    for _g in _glyph_last_live[_cs]:
        glyph_max_cs[_g] = _cs

def needs_db(charset, byte):
    if is_duplicate(charset, byte):
        return True
    g = chars[charset].get(byte)
    return g in glyph_max_cs and glyph_max_cs[g] != charset

file = open(file, "rb")

s = sys.argv[1]
s_= re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', s)
if s_:
	start = addr2offset(*str2addr(s))
else:
	start = int(s, 16)

file.seek(start)
count = int(sys.argv[2])
stop = (addr2offset(*str2addr(sys.argv[3])) if re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', sys.argv[3]) else int(sys.argv[3], 16)) if len(sys.argv) > 3 else None

def emit_db(parts, glyph):
    """Break the current text "…" run and emit a raw db for an ambiguous byte,
    then reopen the text quote. `parts` is the list of $XX byte strings."""
    global backup_charset
    print("\";\n\tdb %s; #\"%s\"\n\ttext \"" % (", ".join(parts), glyph), end="")
    # After a raw db the charset RGBDS sees is undefined; force the next glyph to
    # re-emit its fN switch by clearing the tracked charset.
    backup_charset = -1

def print_text():
    global backup_charset, rom_page
    rom_page = backup_charset  # real ROM font page; persists across db (sticky)
    done = 0
    while True:
        byte = int.from_bytes(file.read(1), "little")
        """
        if not byte:
            break
        """

        byte_high, new_charset = divmod(byte, 0x10)
        if byte_high == 0xf:
            rom_page = new_charset
            glyph_byte = int.from_bytes(file.read(1), "little")
            _g = chars[new_charset].get(glyph_byte)
            if _g is None or new_charset == backup_charset or needs_db(new_charset, glyph_byte):
                emit_db(["$%02x" % byte, "$%02x" % glyph_byte], _g if _g is not None else "?")
            else:
                backup_charset = new_charset
                print(_g, end="")
        elif byte == 0xe1:
            print("\";\n\tsignpost;")
            break
        elif byte == 0xe2:
            print("\";\n\tdone;")
            done = 1
            break
        elif byte == 0xe4:
            print("\";\n\treturn;")
            done = 1
            break
        elif byte == 0xe5:
            arg = int.from_bytes(file.read(2), "little")
            print("\";\n\tgetchoice %s;" % gc(arg), end="")
            done = 1
            break
        elif byte == 0xe6:
            print("\";\n\tchoice;", end="")
            done = 1
            break
        elif byte == 0xe7:
            print("\";\n\tbuysellcancel;\n\ttext \"", end="")
        elif byte == 0xe8:
            print("\";\n\tbuysellcancel_menu;\n\ttext \"", end="")
        elif byte == 0xec:
            print("\";\n\tpara \"", end="")
        elif byte == 0xed:
            print("\";\n\tline \"", end="")
        elif byte == 0xee:
            print("\";\n\tcont \"", end="")
        else:
            _g = chars[rom_page].get(byte) if rom_page >= 0 else None
            if _g is None or backup_charset < 0 or needs_db(rom_page, byte):
                emit_db(["$%02x" % byte], _g if _g is not None else "?")
            else:
                print(_g, end="")

    return done

def get_bank_address(offset):
    offset = file.tell()
    bank = math.floor(offset / 0x4000)
    if bank != 0:
        address = (offset - (bank * 0x4000)) + 0x4000
    else:
        address = (offset - (bank * 0x4000))
    return bank, address

while count != 0:
    if stop is not None and file.tell() >= stop: break
    bank, address = get_bank_address(file.tell())

    byte = int.from_bytes(file.read(1), "little")
    # print("{:02x}".format(byte))
    if not byte:
            print("# not byte at $%04x" % address)
            break

    # get nybbles from byte
    byte_high, charset = divmod(byte, 0x10)
    if byte_high < 0xe:
        print("# not byte at $%04x" % address)
        break
    backup_charset = charset
	
    print("@org $%02x, $%04x:" % (bank, address))
    if byte == 0xe0:
        arg1 = int.from_bytes(file.read(1), "little")
        arg2 = int.from_bytes(file.read(1), "little")
        print("\tinit %s, %s;" % (nm(arg1), pic(arg2)))
    elif byte == 0xe9:
        a1 = int.from_bytes(file.read(1), "little")
        a2 = int.from_bytes(file.read(1), "little")
        print("\tinit2 %s, %s;" % (nm(a1), pic(a2)))
    elif byte == 0xe1:
        print("\tsignpost;")
    if byte_high == 0xf:
        count -= 1
        print("\ttext \"", end="")
        if print_text():
            print()
        else:
            print("\"")

file.close()
