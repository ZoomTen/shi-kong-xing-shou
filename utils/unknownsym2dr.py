#!/usr/bin/env python3
import re
import sys
from lib.gbtool import *

if __name__ == '__main__':
	if len(sys.argv) < 2:
		print(f'{sys.argv[0]} symbols.txt')
		print('\tsymbols.txt are a list of unknown symbols in KEYWORD_bb_aaaa format.')
		print('\tThis is usually the output of utils/make_get_unknown_symbols.sh.')
		exit(0)

	with open(sys.argv[1], 'r') as symbols_file:
		symbols = symbols_file.read().split('\n')

	syms_and_locs = []

	# clean up empty entries
	symbols = sorted(
		list( filter(lambda x: x, symbols) )
	)

	for symbol in symbols:
		addr = re.match('\w+_([0-9a-fA-F]{2,3})_([0-9a-fA-F]{4})', symbol);
		addr = addr2offset( *[int(x, 16) for x in addr.groups()] )
		syms_and_locs.append(
			(symbol, addr)
		)

	syms_and_locs.sort(key=lambda x: x[1])

	for i in range(len(syms_and_locs)):
		next_symbol = None
		symbol = syms_and_locs[i]

		s1, a1 = symbol

		try:
			next_symbol = syms_and_locs[i+1]
		except IndexError:
			pass

		print('%s:\n\tdr $%02x' % (s1, a1), end="")

		if next_symbol:
			s2, a2 = next_symbol
			print(', $%02x' % a2)
		else:
			print()

		print()
