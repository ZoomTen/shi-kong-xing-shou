# taken from pokemontools.gfx
from . import png

def deinterleave(tiles, width):
    """
      00 02 04 06 08 0a     00 01 02 03 04 05
      01 03 05 07 09 0b     06 07 08 09 0a 0b
      0c 0e 10 12 14 16 --> 0c 0d 0e 0f 10 11
      0d 0f 11 13 15 17     12 13 14 15 16 17
      18 1a 1c 1e 20 22     18 19 1a 1b 1c 1d
      19 1b 1d 1f 21 23     1e 1f 20 21 22 23
    """
    deinterleaved = []
    rows = list(split(tiles, width))
    for left, right in zip(rows[::2], rows[1::2]):
        for l, r in zip(left, right):
            deinterleaved += [l, r]
    return deinterleaved

def split(list_, interval):
    """
    Split a list by length.
    """
    for i in range(0, len(list_), interval):
        j = min(i + interval, len(list_))
        yield list_[i:j]

# Combine 8x8 tiles into a 2bpp image.
connect = lambda tiles: [byte for tile in tiles for byte in tile]

deinterleave_tiles = lambda image, width: connect(deinterleave(get_tiles(image), width))

get_tiles = lambda image: list(split(image, 0x10))

def get_image_padding(width, height, wstep=8, hstep=8):
    padding = {
        'left':   0,
        'right':  0,
        'top':    0,
        'bottom': 0,
    }
    if width % wstep and width >= wstep:
       pad = float(width % wstep) // 2
       padding['left']   = ceil(pad)
       padding['right']  = floor(pad)
    if height % hstep and height >= hstep:
       pad = float(height % hstep) // 2
       padding['top']    = ceil(pad)
       padding['bottom'] = floor(pad)
    return padding

def png_to_2bpp(filein, palette, **kwargs):
    """
    Convert a png image to planar 2bpp.

    palette: Must be a list, where each entry is in
    the form of -> { 'r': 0x00, 'g': 0x00, 'b': 0x00, 'a': 0xff }
    """
    arguments = {
        'tile_padding': 0,
        'pic_dimensions': False,
        'interleave': False,
        'norepeat': False,
        'tilemap': False,
    }
    arguments.update(kwargs)
    width, height, rgba, info = png.Reader(filein).asRGBA8()
    # png.Reader returns flat pixel data. Nested is easier to work with
    len_px  = len('rgba')
    image   = []
    for line in rgba:
        newline = []
        for px in range(0, len(line), len_px):
            color = dict(zip('rgba', line[px:px+len_px]))
            newline += [color]
        image += [newline]

    padding = get_image_padding(width, height)
    width += padding['left'] + padding['right']
    height += padding['top'] + padding['bottom']
    pad = bytearray([0])
    qmap = []
    qmap += pad * width * padding['top']
    for line in image:
        qmap += pad * padding['left']
        for color in line:
            qmap += [palette.index(color)]
        qmap += pad * padding['right']
    qmap += pad * width * padding['bottom']
    # Graphics are stored in tiles instead of lines
    tile_width  = 8
    tile_height = 8
    num_columns = max(width, tile_width) // tile_width
    num_rows = max(height, tile_height) // tile_height
    image = []
    for row in range(num_rows):
        for column in range(num_columns):
            # Split it up into strips to convert to planar data
            for strip in range(min(tile_height, height)):
                anchor = (
                    row * num_columns * tile_width * tile_height +
                    column * tile_width +
                    strip * width
                )
                line = qmap[anchor : anchor + tile_width]
                bottom, top = 0, 0
                for bit, quad in enumerate(line):
                    bottom += (quad & 1) << (7 - bit)
                    top += ((quad//2) & 1) << (7 - bit)
                image += [bottom, top]
    dim = arguments['pic_dimensions']
    if dim:
        if type(dim) in (tuple, list):
            w, h = dim
        else:
            # infer dimensions based on width.
            w = width / tile_width
            h = height / tile_height
            if h % w == 0:
                h = w
        tiles = get_tiles(image)
        pic_length = w * h
        tile_width = width / 8
        trailing = len(tiles) % pic_length
        new_image = []
        for block in range(len(tiles) / pic_length):
            offset = (h * tile_width) * ((block * w) / tile_width) + ((block * w) % tile_width)
            pic = []
            for row in range(h):
                index = offset + (row * tile_width)
                pic += tiles[index:index + w]
            new_image += transpose(pic, w)
        new_image += tiles[len(tiles) - trailing:]
        image = connect(new_image)
    # Remove any tile padding used to make the png rectangular.
    image = image[:len(image) - arguments['tile_padding'] * 0x10]
    tmap = None
    if arguments['interleave']:
        image = deinterleave_tiles(image, num_columns)
    if arguments['pic_dimensions']:
        image, tmap = condense_image_to_map(image, w * h)
    elif arguments['norepeat']:
        image, tmap = condense_image_to_map(image)
        if not arguments['tilemap']:
            tmap = None
    arguments.update({ 'palette': palette, 'tmap': tmap, })
    return image, arguments

def export_png_to_2bpp(file, palette, destination, **kwargs):
    pic, args = png_to_2bpp(file, palette, **kwargs)
    with open(destination, "wb") as export_2bpp:
        for byte in pic:
            export_2bpp.write(byte.to_bytes(1, "little"))
