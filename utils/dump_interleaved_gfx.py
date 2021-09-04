#!/usr/bin/env python

import sys
from PIL import Image

filename = sys.argv[1]
width = int(sys.argv[2])
height = int(sys.argv[3])
output = sys.argv[4]

with open(filename, 'rb') as cgx:
	cgx_data = cgx.read()
	
	# init arrays
	tiles = []
	palette = [
		(255, 255, 255),
		(170, 170, 170),
		( 85,  85,  85),
		(  0,   0,   0)
	]

	# reused code from cgx_conv.py
	# CGX parsers by TheLX5
	num_tiles = (len(cgx_data)) >> 4
	tile_adjust = 0x10
	pair_adjust = 0
	pair_adjust_2 = 0
	row_adjust = 2
	pair_num = 2
	pal_row_adjust = 4

	for tile in range(num_tiles):
		single_tile = []
		for row in range(8):
			single_row = []
			for col in range(8):
				palette_num = 0
				for pair in range(pair_num):
					for bitplane in range(2):
						if (cgx_data[(tile*tile_adjust) +
									 (pair*pair_adjust) +
									 (row*row_adjust) + bitplane] & (1<<(7-col))) != 0:
							palette_num = palette_num | (1 << (pair*pair_adjust_2 + bitplane))
				single_row.append(palette_num)
			single_tile.append(single_row)
		tiles.append(single_tile)
	
	# create interleaving tilemap
	tilemap = []
	for h in range(height):
		if h % 2 == 0:
			starting_tile = width*h
		else:
			starting_tile = width*(h-1)+1
		row = [i for i in range(starting_tile, starting_tile+(width*2), 2)]
		tilemap.append(row)

	# create a pseudo-tileset
	screen_tiles = []
	for line in tilemap:
		for entry in line:
			try:
				tile_to_add = [[x for x in r] for r in tiles[entry]]
			except:
				# blank  tile
				tile_to_add = [
					[0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0]
				]
			screen_tiles.append(tile_to_add)
	
	pixmap = []
	row_i = 0
	for line in range(height):
		for row in range(8):
			for i in range(width):
				for color in screen_tiles[row_i+i][row]:
					pixmap.append(color)
		row_i += width

	image_size = (width*8, height*8)
	new_image = Image.new('RGB', image_size)
	current_image_pixels = new_image.load()
	cols, rows = image_size
	for row in range(rows):
		for col in range(cols):
			index = (row*cols) + col
			try:
				current_image_pixels[col, row] = \
					palette[pixmap[index]]
			except IndexError:
				pass
	new_image.save(output)
