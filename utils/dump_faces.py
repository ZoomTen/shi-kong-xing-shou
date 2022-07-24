#!/usr/bin/env python3
import io
import zipfile
from PIL import Image
from lib.gbtool import *

############# Config #############

POINTERS = {
    "faces":            0x7C347,
    "face_palettes":    0x7C139,
    "sprites":          0x802A6,
    "sprites_palettes": 0x800B2
}

NUM_FACES = 58
START_ID = 0

ROM = open("baserom.gbc", "rb")

def twobpp_to_png(source, size, mapping, palette):
    # source = bytes
    # size = tuple (width, height) in tiles
    # mapping = row-column [ [0, 1], [2, 3], [4, 5], ... ]
    # palette = list of tuples [ (R, G, B), (R, G, B) ]
    cgx_data = source
    width, height = size

    # init arrays
    tiles = []

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
                        if (cgx_data[(tile*tile_adjust) + (pair*pair_adjust) + (row*row_adjust) + bitplane] & (1<<(7-col))) != 0:
                            palette_num = palette_num | (1 << (pair*pair_adjust_2 + bitplane))
                single_row.append(palette_num)
            single_tile.append(single_row)
        tiles.append(single_tile)

    tilemap = mapping

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

    return new_image

val2rgb = lambda x: (
    int( bin(x)[2:].zfill(15)[-5:], 2 ) * 8,
    int( bin(x)[2:].zfill(15)[-10:-5], 2 ) * 8,
    int( bin(x)[2:].zfill(15)[-15:-10], 2 ) * 8
)

if __name__ == "__main__":
    ############# Setup face #############

    locations = []
    # entry 1: face GFX (256 bytes, I)
    # entry 2: face palette (8 bytes)
    # entry 3: GBC sprite GFX (256 bytes, I)
    # entry 4: GBC sprite palette (8 bytes)

    for FACE_NUM in range(NUM_FACES):
        new_entry = {}

        for key in POINTERS:
            ROM.seek(POINTERS[key])
            bank, addr = offset2addr(ROM.tell())
            addr = get_number(ROM, 2)
            POINTERS[key] += 2
            new_entry[key] = addr2offset(bank, addr)
        locations.append(new_entry)

    COUNTER = 0
    for entry in locations:
        ora_buffer = io.BytesIO()
        file_list = []

        # setup mimetype
        file_list.append(
            ('mimetype', io.BytesIO(b'image/openraster'))
        )

        xml_file = b'''<?xml version="1.0" encoding="utf-8"?>
        <image h="32" w="32">
            <stack>
                <layer name="Display" src="data/layer3.png" x="0" y="0" opacity="1.0" />
                <layer name="Sprite" src="data/layer2.png" x="0" y="0" opacity="1.0" />
                <layer name="Base" src="data/layer1.png" x="0" y="0" opacity="1.0" />
                <layer name="Colormap" src="data/layer0.png" x="0" y="0" opacity="1.0" />
            </stack>
        </image>
        '''

        file_list.append(
            ('stack.xml', io.BytesIO(xml_file))
        )

        images = {
            "colormap": Image.new("RGB", (32, 32)),
            "base": Image.new("RGB", (32, 32)),
            "gbc": Image.new("RGB", (32, 32)),
            "thumb": Image.new("RGB", (32, 32))
        }

        color_palettes = []

        # Process image here
        ROM.seek(entry["face_palettes"])
        palette = []
        for i in range(4):
            pal_entry = val2rgb(get_number(ROM, 2))
            palette.append(pal_entry)
            color_palettes.append(pal_entry)


        ROM.seek(entry["faces"])
        images["base"] = twobpp_to_png(
            ROM.read(256),
            (4, 4),
            [
                [  0,  1,  2,  3],
                [  4,  5,  6,  7],
                [  8,  9, 10, 11],
                [ 12, 13, 14, 15]
            ],
            palette
        )

        ROM.seek(entry["sprites_palettes"])
        palette = []
        for i in range(4):
            pal_entry = val2rgb(get_number(ROM, 2))
            palette.append(pal_entry)
            color_palettes.append(pal_entry)

        ROM.seek(entry["sprites"])
        images["gbc"] = twobpp_to_png(
            ROM.read(256),
            (4, 4),
            [
                [ 0,  2,  4,  6],
                [ 1,  3,  5,  7],
                [ 8, 10, 12, 14],
                [ 9, 11, 13, 15]
            ],
            palette
        )

        sprite_disp = images["gbc"].copy()
        sprite_disp = sprite_disp.convert("RGBA")
        sprite_disp_data = sprite_disp.getdata()
        sprite_disp_new = []
        for color in sprite_disp_data:
                if color[:3] == palette[0]:
                    sprite_disp_new.append((255, 255, 255, 0))
                else:
                    sprite_disp_new.append(color)
        sprite_disp.putdata(sprite_disp_new)

        merged = images["base"].copy()
        merged = merged.convert("RGBA")
        merged = Image.alpha_composite(
            merged,
            sprite_disp
        )

        images["colormap"].putdata(color_palettes)
        images["thumb"] = merged
        # Export image here

        image_files = (
            ("data/layer0.png", "colormap"),
            ("data/layer1.png", "base"),
            ("data/layer2.png", "gbc"),
            ("data/layer3.png", "thumb"),

            ("Thumbnails/thumbnail.png", "thumb"),
            ("mergedimage.png", "thumb"),
        )

        for filename, key in image_files:
            out = io.BytesIO()
            images[key].save(out, format="PNG")

            file_list.append(
                (filename, out)
            )

        with zipfile.ZipFile(ora_buffer, "a", zipfile.ZIP_STORED, False) as zip_file:
            for file_name, data in file_list:
                zip_file.writestr(file_name, data.getvalue())

        ora_buffer.seek(0)

        with open("gfx/faces/face_%02d.ora" % (START_ID + COUNTER), "wb") as ora_file:
            print("export face %02d" % (START_ID + COUNTER))
            ora_file.write(ora_buffer.read())
            COUNTER += 1

    ############# done #############

    ROM.close()
