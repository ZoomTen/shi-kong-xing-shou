#!/usr/bin/python3
#
# Text DSL (.txt) -> rgbasm (.asm) converter.
#
# The conversion core is exposed as importable functions -- load_charsets(),
# tokenize() and convert() -- so other tools (e.g. utils/translation/repoint.py)
# can reuse the exact same charset-splitting / encoding logic instead of
# duplicating it. Running this file as a script reproduces the original
# one-file-in, one-file-out behaviour on stdout.

import re
import sys

tokens = [
	('#.+',			 'COMMENT'),
	(';|:',			   'END_COMMAND'),
	(',',			   'SEP'),
	('@org',			'ORG'),
	('\((\\.|[^\(\)])*\)',		  'LABEL'),
	('textmap', 'TXMAP'),
	('forcemap', 'FORCEMAP'),
	('text',			'TX_TEXT'),
	('para',			'TX_PARA'),
	('line',			'TX_LINE'),
	('itemname2',			'TX_ITEMNAME2'),
	('itemname',			'TX_ITEMNAME'),
	('cont',			'TX_CONT'),
	('init2',			'TX_INIT2'),
	('init',			'TX_INIT'),
	('buysellcancel_menu',		'TX_E8'),
	('buysellcancel',		'TX_E7'),
	('getchoice',			'TX_GET_CHOICE'),
	('db',			'TX_DB'),
	('signpost',		'TX_SIGN'),
	('done',			'TX_END'),
	('choice',			'TX_CHOICE'),
	('english',			'TX_ENGLISH'),
	('return',			'TX_RETURN'),
	('\d+',			 'DECIMAL_NUMBER'),
	('\$[0-9a-fA-F]+',  'HEXADECIMAL_NUMBER'),
	('\"(\\.|[^\"])*\"|\'(\\.|[^\'])*\'',	 'STRING'),
	('\w+',			 'IDENTIFIER'),
]


def load_charsets(path="charmap.asm"):
	"""Return {charmap_number_str: concatenated_glyphs} from charmap.asm.

	Only numeric charmaps (charmapN) feed charset detection and the
	`text "X", N` suffix. Named charmaps like `english` are selected at runtime
	($ff), not via $f0|N, so they must NOT pollute the numeric charsets --
	ccm = None parks their entries out of the dict.
	"""
	charsets = {}
	with open(path, "r") as charmap:
		ccm = -999
		x = charmap.readline()
		while x:
			nc = re.match(r'\s{0,}NEWCHARMAP\s+(\S+)', x)
			if nc:
				num = re.match(r'charmap(\d+)$', nc.group(1))
				ccm = num.group(1) if num else None
			if ccm is not None and re.match(r'\s{0,}charmap\s+\"(\\.|[^\"])*\"', x):
				if ccm not in charsets.keys():
					charsets[ccm] = ""
				charsets[ccm] += re.match(r'\s{0,}charmap\s+\"(\\.|[^\"])*\"', x).group(1)
			x = charmap.readline()
	return charsets


def tokenize(tt):
	"""Lex the .txt source into a list of (ident, match) tokens."""
	ws = re.compile('\s{0,}')
	p = ws.match(tt).end(0)
	t = []
	while p < len(tt):
		match = None
		for token in tokens:
			pattern, ident = token
			match = re.compile(f'({pattern})').match(tt, p)
			if match:
				p = match.end(0)
				p = ws.match(tt, p).end(0)
				t.append((ident, match))
	return t


def convert(t, charsets):
	"""Turn a token list into (preamble_lines, blocks).

	Each block is a dict {label, bank, addr, english, lines} where `lines` are
	the body asm lines (no label, no leading blank line). `english` is True if
	the block contains an `english` directive (i.e. it is translated). Lines
	before the first @org go into preamble_lines.
	"""
	preamble = []
	blocks = []
	cur = None
	char_set = -999
	prev_char_set = char_set
	english_mode = False

	def emit(s):
		(cur['lines'] if cur is not None else preamble).append(s)

	b = []
	for l in t:
		ident, match = l
		if ident == 'END_COMMAND':
			comm = b[0][0]

			if comm == 'ORG':
				english_mode = False
				char_set = -999
				prev_char_set = char_set
				bank = b[1][1][1]
				address = b[3][1][1]
				label = None
				for q in b[1:]:
					if q[0] == 'DECIMAL_NUMBER':
						label = ("text_%s_%s" % (bank[1:].zfill(2), address[1:].zfill(4)))
					elif q[0] == 'HEXADECIMAL_NUMBER':
						label = ("text_%s_%s" % (bank[1:].zfill(2), address[1:].zfill(4)))
					elif q[0] == 'LABEL':
						label = q[1].group(1)[1:-1]
				cur = {'label': label, 'bank': bank, 'addr': address,
				       'english': False, 'lines': []}
				blocks.append(cur)

			elif comm == 'TX_INIT':
				ll = []
				for q in b[1:]:
					if q[0] in ['IDENTIFIER', 'HEXADECIMAL_NUMBER', 'DECIMAL_NUMBER']:
						ll.append(q[1].group(1))
				emit('\ttext_init %s' % ", ".join(ll))

			elif comm in ['TX_TEXT', 'TX_PARA', 'TX_LINE', 'TX_CONT']:
				macro = {'TX_TEXT': 'text', 'TX_PARA': 'para',
				         'TX_LINE': 'line', 'TX_CONT': 'cont'}[comm]
				if english_mode:
					# English is a single charset; emit the string verbatim on the
					# macro itself (text "x"/line "x"/...) -- no per-glyph charset
					# splitting. `line "x"` assembles to the same bytes as a bare
					# `line` followed by `text "x"`.
					s = ""
					for q in b[1:]:
						if q[0] == 'STRING':
							s = q[1].group(1)[1:-1]
					emit('\t%s "%s"' % (macro, s))
				else:
					p = ""
					tx_sets = []
					if comm in ['TX_PARA', 'TX_LINE', 'TX_CONT']:
						char_set = -999
						prev_char_set = char_set
					if comm == 'TX_PARA':
						emit('\tpara')
					if comm == 'TX_LINE':
						emit('\tline')
					if comm == 'TX_CONT':
						emit('\tcont')
					for q in b[1:]:
						if q[0] == 'STRING':
							p = ""
							for i in q[1].group(1)[1:-1]:
								for ci in charsets:
									if i in charsets[ci]:
										char_set = ci
										if char_set != prev_char_set:
											if p: tx_sets.append((p, None))
											tx_sets.append((i, char_set))
											prev_char_set = char_set
											p = ""
										else:
											p += i
					if p: tx_sets.append((p, None))
					for ii in tx_sets:
						if ii[1]:
							emit('\ttext "%s", %s' % (ii[0], ii[1]))
						else:
							emit('\ttext "%s"' % ii[0])

			elif comm == 'TXMAP':	# manual textmap override
				strr = ""
				cset = 0
				for q in b[1:]:
					if q[0] == 'STRING':
						strr = q[1].group(1)[1:-1]
					elif q[0] == 'DECIMAL_NUMBER':
						cset = int(q[1].group(1))
				if int(cset) != int(char_set):
					emit('\ttext "%s", %s' % (strr, cset))
				else:
					emit('\ttext "%s"' % strr)

			elif comm == 'TX_E7':
				emit('\tbuysellcancel')

			elif comm == 'TX_E8':
				emit('\tbuysellcancel_menu')

			elif comm == 'TX_INIT2':
				ll = []
				for q in b[1:]:
					if q[0] in ['IDENTIFIER', 'HEXADECIMAL_NUMBER', 'DECIMAL_NUMBER']:
						ll.append(q[1].group(1))
				emit('\ttext_init2 %s' % ", ".join(ll))

			elif comm == 'TX_ENGLISH':
				english_mode = True
				if cur is not None:
					cur['english'] = True
				emit('\tenglish')

			elif comm == 'TX_END':
				emit('\tdone')

			elif comm == 'TX_CHOICE':
				emit('\tchoice')

			elif comm == 'TX_ITEMNAME':
				emit('\titemname')

			elif comm == 'TX_ITEMNAME2':
				emit('\titemname2')

			elif comm == 'TX_RETURN':
				emit('\ttext_return')

			elif comm == 'TX_GET_CHOICE':
				emit('\tgetchoice %s' % b[1][1][1])

			elif comm == 'TX_DB':
				dbbin = []
				for q in b[1:]:
					if q[0] == 'HEXADECIMAL_NUMBER':
						dbbin.append(q[1].group(1))
					elif q[0] == 'DECIMAL_NUMBER':
						dbbin.append(q[1].group(1))
				emit('\tdb %s' % ', '.join(dbbin))

			elif comm == 'TX_SIGN':
				emit('\ttext_sign')

			elif comm == 'FORCEMAP':
				strr = ""
				cset = 0
				for q in b[1:]:
					if q[0] == 'STRING':
						strr = q[1].group(1)[1:-1]
					elif q[0] == 'DECIMAL_NUMBER':
						cset = int(q[1].group(1))
				emit('\ttext "%s", %s' % (strr, cset))

			else:
				emit('')
			b = []
		elif ident == 'COMMENT':
			emit('; %s' % match.group(1))
		else:
			b.append(l)
	return preamble, blocks


def render(preamble, blocks):
	"""Reproduce the original stdout form: preamble, then each block as a blank
	line, its `label::`, and its body lines."""
	out = list(preamble)
	for blk in blocks:
		out.append('')
		out.append('%s::' % blk['label'])
		out.extend(blk['lines'])
	return out


def main():
	charsets = load_charsets()
	with open(sys.argv[1], "r") as h:
		tt = h.read()
	preamble, blocks = convert(tokenize(tt), charsets)
	sys.stdout.write('\n'.join(render(preamble, blocks)) + '\n')


if __name__ == '__main__':
	main()
