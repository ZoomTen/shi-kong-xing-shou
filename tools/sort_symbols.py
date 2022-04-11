#!/usr/bin/python3

# ported from pokecrystal sh script

import re
import sys

REGEXEN = {
	"^..:[0-3]": "0_ROM0@",
	"^..:[4-7]": "1_ROMX@",
	"^..:[8-9]": "2_VRAM@",
	"^..:[A-B]": "3_SRAM@",
	"^00:[C-D]": "4_WRAM0@",
	"^..:[D-D]": "5_WRAMX@",
	"^..:[F-F]": "6_HRAM@",
}

with open(sys.argv[1], "r") as symfile:
	syms = symfile.read()
	for regex in REGEXEN:
		syms = re.sub(
			regex,
			lambda x: "%s%s" % (REGEXEN[regex],x.group(0)),
			syms,
			flags=(re.M|re.I)
		)

syms = "\n".join(
	sorted( syms.split("\n") )
)

syms = re.sub("^.*@", "", syms, flags=re.M)

with open(sys.argv[1], "w") as symfile:
	symfile.write(syms)