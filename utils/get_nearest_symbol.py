#!/usr/bin/env python3
import re
import sys
from lib.gbtool import *

def get_relative_symbol(sym_table, address):
	relative = 0
	while not (is_symbol_defined(sym_table, address)):
		address -= 1
		relative += 1
	if relative == 0:
		return get_symbol(sym_table, address)
	return '%s + %d' % (get_symbol(sym_table, address), relative)

if __name__ == '__main__':
	if len(sys.argv) < 2:
		print(f'{sys.argv[0]} address [ram]')
		print('\taddress can be in BB:AAAA form or as a hex number')
		print('\tif "ram" is specified as the 2nd arg, use RAM symbols for searching instead of ROM symbols')
		exit(0)

	addr_str = lambda x: '%03x:%04x' % x

	# extract symbols
	with open('shi_kong_xing_shou.sym', 'r') as sym:
		string = sym.read()
		symbol = read_symbols(string)
		rom_sym = symbol['rom']
		ram_sym = symbol['ram']

	# get address
	s = sys.argv[1]
	s_= re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', s)
	if s_:
		start = addr2offset(*str2addr(s))
	else:
		start = int(s, 16)

	if (len(sys.argv) > 2) and (sys.argv[2].lower() == "ram"):
		print(get_relative_symbol(ram_sym, start))
	else:
		print(get_relative_symbol(rom_sym, start))