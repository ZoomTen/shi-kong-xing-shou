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
		print(f'{get_symbol(rom_sym, rom.tell())}:')
		
		x = rom.read(1)[0]
		
		while x != 0xff:
			y = rom.read(1)[0]
			ev_type = rom.read(1)[0]
			arg1 = rom.read(1)[0]
			arg2 = rom.read(1)[0]
			arg3 = rom.read(1)[0]
			
			if x == 0xee:
				x_ = 'ABSOLUTE'
			else:
				x_ = '%2d' % x
			
			if y == 0xee:
				y_ = 'ABSOLUTE'
			else:
				y_ = '%2d' % y
			
			if ev_type == 0x00:
				# warp
				print(
					'\twarp_event %s, %s, $%02x, $%02x, $%02x' %
					(x_, y_, arg1, arg2, arg3)
				)
			elif ev_type == 0x01:
				# script type event 1
				arg23 = (arg3 << 8) + arg2
				# we don't know the bank of the event so
				# just render it as a hex number...
				print(
					'\tscript_event %s, %s, %2d, $%04x ; XXX: Resolve script bank' %
					(x_, y_, arg1, arg23)
				)
			elif ev_type == 0x02:
				# signpost event
				# we don't know the bank of the event so
				# just render it as a hex number...
				print(
					'\tsignpost_event %s, %s, $%02x' %
					(x_, y_, arg1)
				)
			elif ev_type == 0x03:
				# far warp
				print(
					'\tfarwarp_event %s, %s, $%02x, $%02x, $%02x' %
					(x_, y_, arg1, arg2, arg3)
				)
			elif ev_type == 0x04:
				# script type event 2
				arg23 = (arg3 << 8) + arg2
				print(
					'\tevent_04 %s, %s, %2d, $%04x ; XXX: Resolve script bank' %
					(x_, y_, arg1, arg23)
				)
			elif ev_type == 0x05:
				# script type event 3
				arg23 = (arg3 << 8) + arg2
				print(
					'\tevent_05 %s, %s, %2d, $%04x ; XXX: Resolve script bank' %
					(x_, y_, arg1, arg23)
				)
			elif ev_type == 0x06:
				# script type event 4
				arg23 = (arg3 << 8) + arg2
				print(
					'\tevent_06 %s, %s, %2d, $%04x ; XXX: Resolve script bank' %
					(x_, y_, arg1, arg23)
				)
			elif ev_type == 0x07:
				print(
					'\tevent_07 %s, %s, $%02x' %
					(x_, y_, arg1)
				)
			else:
				print(
					'\tevent %s, %s, $%02x, $%02x, $%02x, $%02x' %
					(x_, y_, ev_type, arg1, arg2, arg3)
				)
			
			# read next event
			x = rom.read(1)[0]	
		print('\tevents_end\n')
	
	print('; $%x' % rom.tell())
