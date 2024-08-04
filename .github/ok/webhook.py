#!/usr/bin/python

from PIL import Image, ImageDraw
import ok
import subprocess
import os
import sys

import requests
import json

# --- Generate base image ---
base = os.path.dirname(__file__)

scale_factor = 2

commit_hash = subprocess.Popen(["git", "rev-parse", "--short", "HEAD"], stdout=subprocess.PIPE).communicate()[0].decode('ascii').strip()

if ok.check_md5('shi_kong_xing_shou.gbc', '24e73734490ad40f9d8228a80ff15c0b'):
	match_string = 'OK'
else:
	match_string = 'NON MATCH'

# check percentage
with open('baserom.gbc', 'rb') as rom:
	rom.seek(0, 2)
	rom_size = rom.tell()
	bytes = ok.check_dr('.', rom_size)

# check symfile
totals, undoc, partdoc = ok.check_syms('shi_kong_xing_shou.sym')

string = f'''
Build: OK

Match: {match_string}


Disassembled:

  {bytes}/{rom_size} ({(bytes/rom_size) * 100:.2f}%)


Progress:






Symbols (ROM and RAM):

     Total: {totals}
  
  Complete: {totals-undoc-partdoc} ({(totals-undoc-partdoc)/totals*100:.2f}%)
  
   Partial: {partdoc} ({partdoc/totals*100:.2f}%)
  
     Undoc: {undoc} ({undoc/totals*100:.2f}%)
'''

x_tiles = 28
y_tiles = 30

fontimg = Image.open(os.path.join(base, 'font.png'))
boximg = Image.open(os.path.join(base, 'textbox.png'))

def getchar(c):
	i = ord(c) - ord(' ')
	y, x = divmod(i, 16)
	return fontimg.crop((x*8,y*8,x*8+8,y*8+8))

test = Image.new('RGB', (x_tiles*8, y_tiles*8), (255, 255, 255))

# render border
get_tile_in_row = lambda i, x: i.crop((x*8,0,x*8+8,8))
border_tiles = {
	'space': get_tile_in_row(boximg, 0),
	'tl': get_tile_in_row(boximg, 1),
	'tr': get_tile_in_row(boximg, 2),
	'bl': get_tile_in_row(boximg, 3),
	'vv': get_tile_in_row(boximg, 4),
	'hh': get_tile_in_row(boximg, 5),
	'egb_tl': get_tile_in_row(boximg, 6),
	'egb_tr': get_tile_in_row(boximg, 7),
	'egb_bl': get_tile_in_row(boximg, 8),
	'egb_br': get_tile_in_row(boximg, 9),
}

for yy in range(y_tiles):
	if yy == 0:
		# top
		for xx in range(x_tiles):
			if xx == 0:
				test.paste(
					border_tiles['tl'],
					(xx*8, yy*8)
				)
			elif xx == x_tiles-1:
				test.paste(
					border_tiles['tr'],
					(xx*8, yy*8)
				)
			else:
				test.paste(
					border_tiles['hh'],
					(xx*8, yy*8)
				)
	elif yy == y_tiles-2:
		for xx in range(x_tiles):
			if xx == 0:
				test.paste(
					border_tiles['vv'],
					(xx*8, yy*8)
				)
			elif xx == x_tiles-1:
				test.paste(
					border_tiles['egb_tr'],
					(xx*8, yy*8)
				)
			elif xx == x_tiles-2:
				test.paste(
					border_tiles['egb_tl'],
					(xx*8, yy*8)
				)
			else:
				test.paste(
					border_tiles['space'],
					(xx*8, yy*8)
				)
	elif yy == y_tiles-1:
		for xx in range(x_tiles):
			if xx == 0:
				test.paste(
					border_tiles['bl'],
					(xx*8, yy*8)
				)
			elif xx == x_tiles-2:
				test.paste(
					border_tiles['egb_bl'],
					(xx*8, yy*8)
				)
			elif xx == x_tiles-1:
				test.paste(
					border_tiles['egb_br'],
					(xx*8, yy*8)
				)
			else:
				test.paste(
					border_tiles['hh'],
					(xx*8, yy*8)
				)
	else:
		for xx in range(x_tiles):
			if xx == 0:
				test.paste(
					border_tiles['vv'],
					(xx*8, yy*8)
				)
			elif xx == x_tiles-1:
				test.paste(
					border_tiles['vv'],
					(xx*8, yy*8)
				)
			else:
				test.paste(
					border_tiles['space'],
					(xx*8, yy*8)
				)
# draw text
x_base = 1
y_base = 1
y_ = 0
for line in string.split('\n'):
	x_ = 0
	for char in line:
		test.paste(getchar(char), (x_base*8+(x_*8), y_base*8+(y_*8)))
		x_ += 1
	y_ += 1

test = test.resize((x_tiles*8*scale_factor, y_tiles*8*scale_factor), 0)


# --- generate progress bar image ---
import re

# enum banks
bank_file = ok.check_dr('banks/', 0, True)
bank_list = {}
for key, val in bank_file.items():
	bank_num = re.search('banks/bank_([0-9a-f]{2})',key)
	if bank_num:
		bank_list[int(bank_num.group(1), 16)] = val

# assume the bank is filled if not on this list
for bank in range(0x80):
	if (bank) not in bank_list:
		bank_list[bank] = 0

width_per_bank = 3
height = 64

progress_overlay = Image.new('RGB', (0x80*width_per_bank, height), (255, 255, 255))
draw = ImageDraw.Draw(progress_overlay)
for k, v in sorted(bank_list.items()):
	if int(k) % 2:
		fill=(128,128,128)
	else:
		fill=(0,0,0)
	
	draw.rectangle(
		(
			(width_per_bank*(k), 0),
			(width_per_bank*(k+1)-1, ((0x4000-v)/0x4000)*height)
		), fill=fill
	)

progress_overlay_pos_x = 2
progress_overlay_pos_y = 14

test.paste(progress_overlay, (progress_overlay_pos_x*8*scale_factor, progress_overlay_pos_y*8*scale_factor))

test.save(os.path.join(base, 'IMAGE.png'))

# Send off webhook
if len(sys.argv) > 1:
	url = sys.argv[1]

	embed_json = {
		"username": "巴克 (Buck)",
		"avatar_url": "https://cdn.discordapp.com/avatars/865933527669407744/74b6bb4243971ea145ecefb1736b2c6c.png",
		"embeds": [
			{
				"title": "Build results",
				"description": "Commit #%s" % commit_hash,
				"image":{"url": "attachment://IMAGE.png"}
			}
		]
	}

	embed_files = {
		"payload_json": (None, json.dumps(embed_json), 'application/json'),
		"file1": open(os.path.join(base, 'IMAGE.png'), "rb")
	}

	requests.post(url, files=embed_files)
