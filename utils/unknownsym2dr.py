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

	# clean up empty entries
	symbols = sorted(
		list( filter(lambda x: x, symbols) )
	)
	
	for i in range(len(symbols)):
		next_symbol = None
		symbol = symbols[i]
		
		addr = re.match('\w+_([0-9a-fA-F]{2,3})_([0-9a-fA-F]{4})', symbol);
		addr = addr2offset( *[int(x, 16) for x in addr.groups()] )
		
		try:
			next_symbol = symbols[i+1]
		except IndexError:
			pass
		
		if next_symbol:
			addr2 = re.match('\w+_([0-9a-fA-F]{2,3})_([0-9a-fA-F]{4})', next_symbol);
			addr2 = addr2offset( *[int(x, 16) for x in addr2.groups()] )
		
		print('%s:\n\tdr $%02x' % (symbol, addr), end="")
		
		if next_symbol:
			print(', $%02x' % addr2)
		else:
			print()
		
		print()
		
