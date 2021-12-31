#!/usr/bin/env python3
import sys
import re

signpost = False

def something(re):
	global signpost
	signpost = False
	p = re.group(4) or ''
	print(f'{re.group(1)}\t{re.group(2)}\t{p}\t"', end='')
	return re.string
def _signpost(re):
	global signpost
	signpost = True
	return re.string
def _init(re):
	print(f'// init {re.group(1)}, {re.group(2)}')
	return re.string
def _line(re):
	print(f'{re.group(2)}')
	return re.string
def _mark_done(re):
	global signpost
	print(f'"\t\t', end='')
	if signpost:
		print('text_sign')
	else:
		print()
	return re.string

with open(sys.argv[1], "r") as txtfile:
	line = txtfile.readline()
	print('bank\taddress\tlabel\toriginal_string\ttranslated_string\ttext_kind')
	while line:
		re.sub("@org\s+\$([0-9A-Fa-f]+),\s+\$([0-9A-Fa-f]+)(\s+\((\w+)\))?", something, line)
		re.sub("init\s+(\w+),\s+(\w+)", _init, line)
		re.sub("init\s+(\w+),\s+(\$[0-9a-fA-F]+)", _init, line)
		re.sub("init\s+(\$[0-9a-fA-F]+),\s+(\$[0-9a-fA-F]+)", _init, line)
		re.sub("signpost", _signpost, line)
		re.sub("(text|line|para|cont)\s\"(.+)\";$", _line, line)
		re.sub("(forcemap)\s\d,\s\"(.+)\";$", _line, line) # fuck it
		re.sub("(forcemap)\s\d\s\"(.+)\";$", _line, line) # fuck it
		re.sub("(forcemap)\s\"(.+)\",\s\d;$", _line, line) # fuck it
		re.sub("done", _mark_done, line)
		line = txtfile.readline()
