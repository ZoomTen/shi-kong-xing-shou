#!/usr/bin/env python3
# Build an indexed (mode P) sprite sheet PNG from raw interleaved 2bpp data.
# Frames are 2x2 (16x16) tiles stacked vertically: width=2 tiles, height=2*frames.
# Pixel values are GB colour numbers (0..3); the PLTE only affects appearance,
# not the bytes rgbgfx emits, so any palette is round-trip safe.

import sys
from PIL import Image

GENERIC_PALETTE = [(255, 0, 255), (0, 0, 0), (100, 100, 100), (255, 255, 255)]


def rgb555(lo, hi):
    v = lo | (hi << 8)
    r, g, b = v & 31, (v >> 5) & 31, (v >> 10) & 31
    return (round(r * 255 / 31), round(g * 255 / 31), round(b * 255 / 31))


def decode_obj_palette(pal8):
    return [rgb555(pal8[i * 2], pal8[i * 2 + 1]) for i in range(4)]


def sheet(data, width, height, palette=None):
    palette = palette or GENERIC_PALETTE
    # decode tiles to colour-index grids (TheLX5 CGX parser, as in dump_interleaved_gfx)
    tiles = []
    for tile in range(len(data) >> 4):
        grid = []
        for row in range(8):
            line = []
            for col in range(8):
                n = 0
                for bp in range(2):
                    if data[tile * 16 + row * 2 + bp] & (1 << (7 - col)):
                        n |= 1 << bp
                line.append(n)
            grid.append(line)
        tiles.append(grid)
    # de-interleave: 2x2 column-major blocks -> linear screen order
    order = []
    for h in range(height):
        start = width * h if h % 2 == 0 else width * (h - 1) + 1
        order += list(range(start, start + width * 2, 2))
    blank = [[0] * 8 for _ in range(8)]
    screen = [tiles[i] if i < len(tiles) else blank for i in order]
    img = Image.new('P', (width * 8, height * 8))
    flat = []
    for c in palette:
        flat += list(c)
    img.putpalette(flat + [0] * (768 - len(flat)))
    px = img.load()
    for line in range(height):
        for trow in range(8):
            for i in range(width):
                for col, val in enumerate(screen[line * width + i][trow]):
                    px[i * 8 + col, line * 8 + trow] = val
    return img


if __name__ == '__main__':
    raw, w, h, out = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), sys.argv[4]
    pal = None
    if len(sys.argv) > 5:  # 8 hex bytes of a GBC OBJ palette
        b = bytes.fromhex(sys.argv[5])
        pal = decode_obj_palette(b)
    sheet(open(raw, 'rb').read(), w, h, pal).save(out)
