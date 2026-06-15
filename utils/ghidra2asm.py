#!/usr/bin/python

import re
import sys

def processGhidra(line):

	# Grab the raw instruction bytes (between the address and the mnemonic)
	# so we can recover immediates Ghidra mislabels as "offset SYMBOL".
	raw_bytes = re.match('\s*\w+::[0-9a-f]+\s+((?:[0-9a-f]{2} )+)', line)

	if raw_bytes:
		# Instruction line: fixed-column slice keeps the mnemonic's leading
		# whitespace (turned into a tab later) so it is not read as a label.
		raw_bytes = raw_bytes.group(1).split()
		line = line[29:-1]
	else:
		# Anything without a `romNN::addr  hexbytes` prefix is a bare label
		# definition (or a banner/signature line). Strip fully so the i==0
		# logic emits it as a `Label:` instead of mangling fixed columns.
		raw_bytes = []
		line = line.strip()
	#print(line)
	line = ', '.join(line.split(','))

	# delete ghidra cruft
	line = re.sub('^--.*$', '', line)                       # flow-override notes
	line = re.sub('=>\w+(\+\d+)?(\[\w+\])?', '', line)       # data xref + array idx
	line = re.sub('(=\s+.+|undefined .+|)$', '', line)
	line = re.sub('XREF.+$', '', line)
	line = re.sub('^\*+|^\*\s+(SUBROUTINE|FUNCTION)\s+\*', ';', line)

	# Ghidra sometimes renders a plain 8-bit immediate as "offset SYMBOL"
	# (e.g. `LD (HL),offset DAT_d9e2` for the bytes `36 8d`). The symbol is
	# bogus; recover the real immediate from the last raw byte instead.
	# Only fire for data-style labels: a real `offset hFFxx` (LDH operand)
	# must keep its HRAM symbol, not collapse to the raw low byte.
	if raw_bytes and re.search('offset (DAT|WORD|BYTE)_', line):
		line = re.sub('offset (DAT|WORD|BYTE)_\w+(\+\d+)?', f'${raw_bytes[-1]}', line)

	# Ghidra's `addr SYMBOL` pointer-table entry is a 2-byte word.
	line = re.sub('^(\s*)addr\s+', lambda r: f'{r.group(1)}dw ', line)

	# address normalization
	line = re.sub('offset (\w+)(&0xff)?', lambda re: f'{re.group(1)}', line)
	line = line.replace('0x','$')
	
	# bracket normalization
	line = line.replace('(', '[')
	line = line.replace(')', ']')
	# label normalization
	to_absolute = lambda bank, addr: hex(  (int(bank)*0x4000) + (int(addr,16) - 0x4000) )[2:]
	to_banknum  = lambda num: hex(int(num))[2:].zfill(3)
	line = re.sub('FUN_rom(\d+)__([0-9a-f]{4})', lambda re: f'Func_{to_banknum(re.group(1))}_{re.group(2)}', line)
	line = re.sub('LAB_rom(\d+)__([0-9a-f]{4})', lambda re: f'Func_{to_banknum(re.group(1))}_{re.group(2)}', line)
	line = re.sub('SUB_rom(\d+)__([0-9a-f]{4})', lambda re: f'Func_{to_banknum(re.group(1))}_{re.group(2)}', line)
	line = re.sub('(DAT|WORD|BYTE)_rom(\d+)__([0-9a-f]{4})', lambda re: f'unk_{to_banknum(re.group(2))}_{re.group(3)}', line)
	line = re.sub('TEXT_rom(\d+)__([0-9a-f]{4})', lambda re: f'text_{to_banknum(re.group(1))}_{re.group(2)}', line)
	line = re.sub('(DAT|WORD|BYTE)_([0-9a-f]{4})', lambda re: f'w{re.group(2)}', line)
	
	line = re.sub('\w+__(\w+)', lambda re: f'.{re.group(1)}', line)
	
	# space normalization
	line = re.sub('^\s+', '\t', line)
	line = list(filter(lambda x: x != '', line.split(' ')))
	
	# command normalization
	for i in range(len(line)):
		# register and conditional jump cleanup
		line[i] = re.sub(
				'^(A|B|C|D|E|F|H|L|AF|BC|DE|HL|NZ|Z|NC)(,?)$',
				lambda r: f'{r.group(1).lower()}{r.group(2) or ""}',
				line[i]
			)
		
		# cleanup HL indexing
		line[i] = re.sub('^\[HL\+\](,)?$', lambda r: f'[hli]{r.group(1) or ""}', line[i])
		line[i] = re.sub('^\[HL\-\](,)?$', lambda r: f'[hld]{r.group(1) or ""}', line[i])
		line[i] = re.sub('^\$([0-9])(,)?$', lambda r: f'{r.group(1)}{r.group(2) or ""}', line[i])
		
		# data normalization
		line[i] = re.sub('^([0-9A-F]{1,4})h$', lambda re: f'${re.group(1).lower()}', line[i])
		
		# addressing normalization
		line[i] = re.sub('^\[(\w+)\+(\d+)\](,)?$', lambda r: f'[{r.group(1)} + {r.group(2)}]{r.group(3) or ""}', line[i])
		
		# positional stuff
		if i == 0:
			# add newline before label
			if line[i][0] != '\t':
				line[i] = f'\n{line[i]}:'
			else:
				# if not a label, first field gets lowercased
				# no exceptions
				line[i] = line[i].lower()
		elif i == 1:
			# or [hl]
			#if re.match('hl|de', line[i]):
			#	if re.match('\t(or|srl|sla|rl|rr|adc|cp)', line[0]):
			#		line[i] = f'[{line[i]}]'
			# ld [hl], a
			#if re.match('(hl|de|bc),', line[i]):
			#	if len(line) > 2:
			#		if re.match('(A|B|C|D|E|H|L)$', line[i+1]):
			#			line[i] = f'[{line[i][:-1]}],'
			if re.match('\[(HL|DE|BC)\],?', line[i]):
				line[i] = line[i].lower()
		elif i == 2:
			# bit N, [hl]
			if re.match('hl|de', line[i]):
				if re.match('\t(bit|set|res)', line[0]):
					line[i] = f'[{line[i]}]'
				elif re.match('(a|b|c|d|e|h|l),', line[i-1]):
					line[i] = f'[{line[i]}]'
			# even out 3-digit hex numbers
			elif re.match('\$([0-9a-f]{3})$', line[i]):
				if re.match('^(bc|de|hl),$', line[i-1]):
					line[i] = re.sub('\$([0-9a-f]{3})$', lambda r: f'${r.group(1).zfill(4)}', line[i])
			elif re.match('\[(HL|DE|BC)\]', line[i]):
				line[i] = line[i].lower()
	return ' '.join(line)

if len(sys.argv) < 2:
	print("Usage: ghidra2asm.py <output>.txt")
	print("       ghidra2asm.py <output>.txt > <output>.asm")
	print()
	print("Tailored for use with GhidraBoy")
	print()
	print("Labels:")
	print("   - GameBoy addresses will be transformed into ROM addresses")
	print("   - FUN_rom01__4abc -> Func_001_4abc")
	print("   - LAB_rom01__4abc -> asm_001_4abc")
	print("   - SUB_rom01__4abc -> sub_001_4abc")
	print("   - (DAT|WORD|BYTE)_rom01__4abc -> unk_001_4abc")
	print("   - TEXT_rom01__4abc -> text_001_4abc")
	print("   - (DAT|WORD|BYTE)_4abc -> w4abc")
	exit(0)
else:
	with open(sys.argv[1], "r") as txt:
		line = txt.readline()
		
		current_label = None
		
		while line:
			if line[0] == ';':
				pass
			else:
				line = processGhidra(line)
			print(line)
			line = txt.readline()
