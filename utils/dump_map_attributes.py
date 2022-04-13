#!/usr/bin/env python3
import re
import sys
from lib.gbtool import *

if len(sys.argv) < 3:
	print(f'{sys.argv[0]} address count')
	print('\taddress can be in BB:AAAA form or as a hex number')
	exit(0)

addr_str = lambda x: '%03x:%04x' % x

# extract symbols
with open('shi_kong_xing_shou.sym', 'r') as sym:
	string = sym.read()
	symbol = read_symbols(string)
	rom_sym = symbol['rom']
	ram_sym = symbol['ram']

# get rom
with open('baserom.gbc', 'rb') as rom:
	s = sys.argv[1]
	s_= re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', s)
	if s_:
		start = addr2offset(*str2addr(s))
	else:
		start = int(s, 16)

	rom.seek(start)

	count = int(sys.argv[2])

	while count != 0:
		count -= 1

		bank, address = offset2addr(rom.tell())
		this_label = get_symbol_or_undefined(
			rom_sym, rom.tell(),
			returns=lambda x:('MapAttributes_%03x_%04x' % x)
		)
		print('%s:' % this_label)

		w = get_number(rom, 1)
		h = get_number(rom, 1)

		layout = get_symbol_or_undefined(
			rom_sym, addr2offset(bank, get_number(rom, 2)),
			returns=lambda x:('Layout_%03x_%04x' % x)
		)

		block  = get_symbol_or_undefined(
			rom_sym, addr2offset(bank, get_number(rom, 2)),
			returns=lambda x:('Blocks_%03x_%04x' % x)
		)

		mtile = get_symbol_or_undefined(
			rom_sym, addr2offset(bank, get_number(rom, 2)),
			returns=lambda x:('Metatiles_%03x_%04x' % x)
		)

		atmap = get_symbol_or_undefined(
			rom_sym, addr2offset(bank, get_number(rom, 2)),
			returns=lambda x:('AttrMap_%03x_%04x' % x)
		)

		paloc = get_symbol_or_undefined(
			rom_sym, addr2offset(bank, get_number(rom, 2)),
			returns=lambda x:('Palettes_%03x_%04x' % x)
		)

		tset1 = get_number(rom, 2)
		if tset1 == 0:
			tset1 = "0"
		else:
			tset1 = get_symbol_or_undefined(
				rom_sym, addr2offset(bank, get_number(rom, 2)),
				returns=lambda x:('Tileset_%03x_%04x' % x)
			)

		tset2 = get_number(rom, 2)
		if tset2 == 0:
			tset2 = "0"
		else:
			tset2 = get_symbol_or_undefined(
				rom_sym, addr2offset(bank, get_number(rom, 2)),
				returns=lambda x:('Tileset_%03x_%04x' % x)
			)

		colis = get_symbol_or_undefined(
			rom_sym, addr2offset(bank, get_number(rom, 2)),
			returns=lambda x:('Collision_%03x_%04x' % x)
		)

		print('\tmap_attr_data \\\n\t\t%d, %d, \\\n\t\t%s, %s, %s, %s, \\\n\t\t%s, \\\n\t\t%s, %s, \\\n\t\t%s\n' % (
			w,h,
			layout,block,mtile,atmap,paloc,
			tset1,tset2,colis
		))

	print('; $%x' % rom.tell())
