#!/usr/bin/env python3

import sys
import re

with open(sys.argv[1], 'r') as a_file:
	a = a_file.read()

def label2loc(label):
	l = re.match('\w+_([0-9a-fA-F]{2,3})_([0-9a-fA-F]{4})', label)
	if l:
		bank = int(l.group(1), 16)
		addr = int(l.group(2), 16)
		if bank > 0:
			addr -= 0x4000
		return (bank * 0x4000) + addr
	return 0

p = a.split('\n')
p = sorted(set(p))

for i in range(len(p)):
	if p[i] != '':
		print(f'{p[i]}::')
		print(f'\tdr ${hex(label2loc(p[i]))[2:]}, ', end='')
		print(f'${hex(label2loc(p[i+1]))[2:]}')
		print()
