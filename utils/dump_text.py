#!/usr/bin/env python3
import math
import sys
import re
from lib.gbtool import addr2offset, str2addr

chars = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}

file = "baserom.gbc"

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

file = open(file, "rb")

s = sys.argv[1]
s_= re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', s)
if s_:
	start = addr2offset(*str2addr(s))
else:
	start = int(s, 16)

file.seek(start)
count = int(sys.argv[2])

def emit_db(parts, glyph):
    """Break the current text "…" run and emit a raw db for an ambiguous byte,
    then reopen the text quote. `parts` is the list of $XX byte strings."""
    global backup_charset
    print("\";\n\tdb %s; #\"%s\"\n\ttext \"" % (", ".join(parts), glyph), end="")
    # After a raw db the charset RGBDS sees is undefined; force the next glyph to
    # re-emit its fN switch by clearing the tracked charset.
    backup_charset = -1

def print_text():
    global backup_charset
    done = 0
    while True:
        byte = int.from_bytes(file.read(1), "little")
        """
        if not byte:
            break
        """

        byte_high, new_charset = divmod(byte, 0x10)
        if byte_high == 0xf:
            glyph_byte = int.from_bytes(file.read(1), "little")
            if is_duplicate(new_charset, glyph_byte):
                # ambiguous: emit the switch + byte raw so it round-trips exactly
                emit_db(["$%02x" % byte, "$%02x" % glyph_byte],
                        chars[new_charset][glyph_byte])
            else:
                backup_charset = new_charset
                print(chars[new_charset][glyph_byte], end="")
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
            print("\";\n\tgetchoice $%04x; # TEMP" % arg, end="")
            done = 1
            break
        elif byte == 0xe6:
            print("\";\n\tchoice;", end="")
            done = 1
            break
        elif byte == 0xe7:
            print("\";\n\tunknownE7;", end="")
            done = 1
            break
        elif byte == 0xec:
            print("\";\n\tpara \"", end="")
        elif byte == 0xed:
            print("\";\n\tline \"", end="")
        elif byte == 0xee:
            print("\";\n\tcont \"", end="")
        else:
            if is_duplicate(backup_charset, byte):
                # bare ambiguous byte in the current charset: emit raw db
                emit_db(["$%02x" % byte], chars[backup_charset][byte])
            else:
                try:
                    char = chars[backup_charset][byte]
                except KeyError:
                    char = 'UNKNOWN'
                print(char, end="")

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
    bank, address = get_bank_address(file.tell())

    byte = int.from_bytes(file.read(1), "little")
    # print("{:02x}".format(byte))
    if not byte:
            print("# not byte")
            break

    # get nybbles from byte
    byte_high, charset = divmod(byte, 0x10)
    backup_charset = charset
	
    print("@org $%02x, $%04x:" % (bank, address))
    if byte == 0xe0:
        arg1 = int.from_bytes(file.read(1), "little")
        arg2 = int.from_bytes(file.read(1), "little")
        print("\tinit $%02x, $%02x; # TEMP" % (arg1, arg2))
    if byte_high == 0xf:
        count -= 1
        print("\ttext \"", end="")
        if print_text():
            print()
        else:
            print("\"")

file.close()
