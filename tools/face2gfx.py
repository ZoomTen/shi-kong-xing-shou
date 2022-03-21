#!/usr/bin/python3

import sys
import os
from xml.dom import minidom
from zipfile import ZipFile
from lib.pretgfx import export_png_to_2bpp
import lib.png as png

if len(sys.argv) < 2:
    print("face2gfx.py [input.ora]")
    print()
    print("This will output 2bpp files of the Gameboy GFX")
    print("and the GBC sprite GFX as well as its associated")
    print("palettes in the same directory as the input.")
    print("(4 files total for each file)")
    print()
    print("The .ora file MUST have at least 3 layers, in ORDER")
    print("from top to bottom:")
    print("\t- Sprite GFX (MUST conform to color map)")
    print("\t- BG GFX (MUST conform to color map)")
    print("\t- Color map")
    print()
    print("Any extraneous information should be placed in layers")
    print("ABOVE these three.")
    print()
    print("The color map MUST be in the form of 8 colors spread")
    print("from left to right at the top leftmost position.")
    print("The 8 colors consist of 4 for the BG GFX, and 4 more for")
    print("the sprite GFX. (per GBC, the 5th color in the row is")
    print("transparent.)")
    exit()

def rgb2gbc(palette):
    converted = []
    for entry in palette:
        converted.append(
            (entry["b"] // 8 << 10) |
            (entry["g"] // 8 << 5) |
            (entry["r"] // 8)
        )
    return converted

with ZipFile(sys.argv[1]) as ora_file:
    with ora_file.open("stack.xml") as layer_data_file:
        # fetch the image data
        layer_data = minidom.parse(layer_data_file)
        # get the last three layers
        layers = layer_data.getElementsByTagName("layer")[-3:]
        # place these in the appropriate positions
        image_files = {
            "sprite": layers[0].getAttribute("src"),
            "base": layers[1].getAttribute("src"),
            "colormap": layers[2].getAttribute("src")
        }

    colormap = {
        "base":   [],
        "sprite": []
    }

    basename = os.path.splitext(sys.argv[1])[0]

    # extract color map
    with ora_file.open(image_files["colormap"]) as colormap_file:
        width, height, rgba, info = png.Reader(colormap_file).asRGBA8()

        len_px  = len('rgba')
        image   = []
        palette = []
        for line in rgba:
            newline = []
            for px in range(0, len(line), len_px):
                color = dict(zip('rgba', line[px:px+len_px]))
                newline += [color]
            image += [newline]

        colormap["base"] = image[0][:4]
        colormap["sprite"] = image[0][4:8]

    with ora_file.open(image_files["base"]) as base_gfx_file:
        export_png_to_2bpp(
            base_gfx_file,
            colormap["base"],
            "%s.bg.2bpp" % basename,
            interleave=False
        )

    with ora_file.open(image_files["sprite"]) as sprite_gfx_file:
        export_png_to_2bpp(
            sprite_gfx_file,
            colormap["sprite"],
            "%s.obj.2bpp" % basename,
            interleave=True
        )

    with open("%s.bg.gbcpal" % basename, "wb") as bg_pal:
        for palette in rgb2gbc(colormap["base"]):
            bg_pal.write(palette.to_bytes(2, "little"))

    with open("%s.obj.gbcpal" % basename, "wb") as obj_pal:
        for palette in rgb2gbc(colormap["sprite"]):
            obj_pal.write(palette.to_bytes(2, "little"))
