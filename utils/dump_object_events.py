#!/usr/bin/env python3
import re
import sys
from lib.gbtool import *

if len(sys.argv) < 2:
	print(f'{sys.argv[0]} address')
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
	
	bank_, start_ = offset2addr(start)
	
	print(f'{get_symbol(rom_sym, start)}:')
	
	spid = get_number(rom, 1)
	while spid != 0x88:
		x = get_number(rom, 1)
		y = get_number(rom, 1)
		ram = get_number(rom, 2)
		if ram == 0:
			ram = '0'
		else:
			ram = get_symbol(ram_sym, ram)
		a = get_number(rom, 1)
		b = get_number(rom, 1)
		c = get_number(rom, 1)
		d = get_number(rom, 1)
		script = get_number(rom, 2)
		script = addr2offset(bank_, script)
		
		print(
			'\tobject_event $%02x, %2d, %2d, %s, $%02x, $%02x, $%02x, $%02x, %s'
			% (spid, x, y, ram, a, b, c, d, get_symbol(rom_sym, script))
		)
		spid = get_number(rom, 1)
	print('\tobjects_end')
	print(f'; {hex(rom.tell())}')
	
