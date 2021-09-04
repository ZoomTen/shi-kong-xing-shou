#!/usr/bin/python3

import re
import sys

fn = sys.argv[1]

all_matches_ram, no_matches_ram, all_matches_rom, no_matches_rom = (0, 0, 0, 0)

def check_sym_RAM(x):
	global all_matches_ram
	global no_matches_ram
	all_matches_ram += 1
	rendered = x.group(1)
	claimed = x.group(2)
	
	if rendered == claimed:
		print(f'claimed: {claimed} matched')
	else:
		no_matches_ram += 1
		print(f'claimed: {claimed} -- DOES NOT MATCH! -- actual: {rendered}')
	return None

def check_sym_ROM(x):
	global all_matches_rom
	global no_matches_rom
	all_matches_rom += 1
	bank = x.group(1)
	rendered = x.group(2)
	claimed = x.group(3)
	
	if rendered == claimed:
		print(f'claimed: {bank}:{claimed} matched')
	else:
		no_matches_rom += 1
		print(f'claimed: {bank}:{claimed} -- DOES NOT MATCH! -- actual: {bank}:{rendered}')
	return None

with open(fn, "r") as f_:
	line = f_.readline()
	while line:
		if re.match('0[01]:([0-9a-f]+) w([0-9a-f]+)$', line):
			re.sub('0[01]:([0-9a-f]+) w([0-9a-f]+)', check_sym_RAM, line)
		elif re.match('([0-9a-f]{2}):([0-9a-f]+) \w+_[0-9a-f]{2,3}_([0-9a-f]+)$', line):
			re.sub('([0-9a-f]{2}):([0-9a-f]+) \w+_[0-9a-f]{2,3}_([0-9a-f]+)', check_sym_ROM, line)
		line = f_.readline()
	
	no_matches = no_matches_rom + no_matches_ram
	all_matches = all_matches_rom + all_matches_ram
	
	if no_matches == 0:
		print('---- ALL MATCHING! -----')
	else:
		print('-- %d SYMBOLS DOES NOT MATCH (%.1f%% matching) --' %
			(
				no_matches,
				((all_matches-no_matches) / all_matches) * 100
			)
		)
