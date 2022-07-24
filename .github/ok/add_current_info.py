#!/usr/bin/python

from hashlib import md5
import os
import re
import subprocess
import datetime
import json
import sys

date = subprocess.Popen([
	"git",
	"show",
	"-s",
	"--format=%cI",
	"HEAD"
], stdout=subprocess.PIPE)

date = datetime.datetime.strptime(date.communicate()[0].decode('ascii')[:-1], "%Y-%m-%dT%H:%M:%S%z")

commit = subprocess.Popen([
	"git",
	"show",
	"-s",
	"--format=%h",
	"HEAD"
], stdout=subprocess.PIPE)

commit = commit.communicate()[0].decode('ascii')[:-1]

def check_md5(file_, compare):
	'''
	Returns True/False
	'''
	with open(file_, 'rb') as f:
		return md5(f.read()).hexdigest() == compare.lower()

def check_dr(dir_, rom_size, per_file=False):
	'''
	Returns how many bytes are decoded
	'''
	undecoded_bytes = 0
	flist = {}
	for i in os.walk(dir_):
		dir_ = i[0]
		files = [f for f in i[2] if f.endswith('.asm')]
		if files:
			for file_ in files:
				with open(os.path.join(dir_, file_), 'r', encoding="ISO-8859-1") as fn:
					if os.path.join(dir_, file_) not in files:
						flist[os.path.join(dir_, file_)] = 0
					for line in fn:
						dr_match = re.search(r'dr\s+(\$[0-9a-fA-F]+),\s+(\$[0-9a-fA-F]+)', line)
						if dr_match:
							start = int(dr_match.group(1)[1:], 16)
							end = int(dr_match.group(2)[1:], 16)
							if per_file:
								flist[os.path.join(dir_, file_)] += (end - start)
							else:
								undecoded_bytes += (end - start)
	if per_file:
		return flist
	else:
		return (rom_size - undecoded_bytes)

def check_syms(symfile):
	'''
	Returns how many symbols are unknown
	'''
	undoc = 0
	partdoc = 0
	totals = 0
	with open(symfile, 'r') as syms:
		for line in syms:
			sym_match = re.search(r'[0-9a-fA-F]{2}:[0-9a-fA-F]{4}\s+(\w+)', line)
			if sym_match:
				totals += 1
				label = sym_match.group(1)
				found_undoc = re.search(r'^Func_|^unk_|^asm_|^w[cd]|^hFF', label)
				found_part = re.search(r'^Layout_|^Metatiles_|^Blocks_|^AttrMap_|^Palettes_|^Collision_|^Script_|^text_|^gfx_|^unkText_|^PointerTable_|^palette_|^image_', label)
				if found_undoc:
					undoc += 1
				if found_part:
					partdoc += 1
	return (totals, undoc, partdoc)

if __name__ == '__main__':
	# enum banks
	bank_file = check_dr('banks/', 0, True)
	bank_list = {}
	for key, val in bank_file.items():
		bank_num = re.search('banks/bank_([0-9a-f]{2})',key)
		if bank_num:
			bank_list[int(bank_num.group(1), 16)] = val

	# assume the bank is filled if not on this list
	for bank in range(0x7f):
		if (bank+1) not in bank_list:
			bank_list[bank+1] = 0
	
	# check percentage
	with open('baserom.gbc', 'rb') as rom:
		rom.seek(0, 2)
		rom_size = rom.tell()
		bytes = check_dr('.', rom_size)
	
	# check symfile
	totals, undoc, partdoc = check_syms('shi_kong_xing_shou.sym')


	with open(sys.argv[1], 'r') as json_f:
		json_d = json.load(json_f)
	
	json_d['history'].append(
		[
			date.strftime("%Y-%m-%dT%H:%M:%S"),
			str(bytes),
			str(rom_size),
			str(totals-undoc-partdoc),
			str(partdoc),
			str(undoc),
			commit
		]
	)
	
	with open(sys.argv[1], 'w') as json_f:
		json.dump(json_d, json_f)
	
