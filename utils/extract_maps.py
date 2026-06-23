#!/usr/bin/env python3
import os, re, subprocess, sys

# wMapType enum values -> constant names (see constants/map_type_constants.asm)
MAPTYPE = ["NONE","CRYSTAL_MINES_P2","CRYSTAL_MINES_P3","CRYSTAL_MINES_P4","CRYSTAL_MINES_P5","CRYSTAL_MINES_P1",
"POWER_PLANT_1F","POWER_PLANT_2F","POWER_PLANT_3F","POWER_PLANT_4F",
"CLOCK_TOWER_1F","CLOCK_TOWER_2F","CLOCK_TOWER_3F","CLOCK_TOWER_4F","HIDEOUT",
"COFFEE_FOREST_P1","COFFEE_FOREST_P2","SKY_ROCK_P1","GREEN_FOREST_P12","GREEN_FOREST_P2",
"BANGLIN_CO_2F","BANGLIN_CO_3F","BANGLIN_CO_4F","BANGLIN_CO_5F",
"G4_01","G4_02","G4_03","G4_04","G4_07","G4_08","G4_09","G4_1A","G4_1B","G4_1C",
"G4_60","G4_61","G4_62","G4_15","G4_16","G5_0B","G5_0C","G5_0D","G5_17",
"G5_01","G5_02","G5_03","G5_04","G5_05","G5_06","G6_01","G6_02","G6_03","G6_04","G6_05","G6_06","GREEN_FOREST_P13"]
def maptype(v): return "MAPTYPE_" + MAPTYPE[v] if v < len(MAPTYPE) else str(v)

REPO = "/root/projects/skxs"
BANK = sys.argv[1]
ASM = os.path.join(REPO, "banks", "bank_%s.asm" % BANK)
rom = open(os.path.join(REPO, "baserom.gbc"), "rb").read()

raw = open(ASM, "rb").read()
assert b"\r\n" in raw, "expected CRLF"
text = raw.decode("latin-1")
flat = text.replace("\r\n", "\n")
lines = text.split("\r\n")

# --- relationships from map_attr_data ---
mad = re.compile(
    r'map_attr_data\s*\\\s*\n\s*(\d+),\s*(\d+),\s*\\\s*\n\s*'
    r'(Layout_\w+),\s*(Blocks_\w+),\s*(Metatiles_\w+),\s*(AttrMap_\w+),\s*\\\s*\n\s*'
    r'(Palettes_\w+),\s*\\\s*\n\s*\S+,\s*(Tileset_\w+)')
# raw "db w,h / dw Layout/Blocks/Metatiles/AttrMap/Palettes/0/Tileset/0/Collision" form (bank 01)
raw_attr = re.compile(
    r'\tdb (\d+), (\d+)\n\tdw (\w+)\n\tdw (\w+)\n\tdw (\w+)\n\tdw \w+\n\tdw \w+\n'
    r'\tdw 0\n\tdw (Tileset_\w+)\n\tdw 0\n\tdw \w+')
width_of, blocks_of, meta_of, tileset_of_meta = {}, {}, {}, {}
for m in mad.finditer(flat):
    w, lay, blk, met, ts = int(m.group(1)), m.group(3), m.group(4), m.group(5), m.group(8)
    width_of[lay] = w
    blocks_of[lay] = blk
    meta_of[blk] = met
    tileset_of_meta.setdefault(met, ts)
for m in raw_attr.finditer(flat):
    w, lay, blk, met, ts = int(m.group(1)), m.group(3), m.group(4), m.group(5), m.group(6)
    width_of.setdefault(lay, w)
    blocks_of.setdefault(lay, blk)
    meta_of.setdefault(blk, met)
    tileset_of_meta.setdefault(met, ts)

# --- tileset -> first fragment image path ---
_bankcache = {}
def _bankasm(bank):
    if bank not in _bankcache:
        _bankcache[bank] = open(os.path.join(REPO, "banks", "bank_%s.asm" % bank)).read()
    return _bankcache[bank]
def tileset_image(ts):
    bm = re.match(r'Tileset_(\w{2,3})_', ts)        # tileset may be local (Tileset_001_*) or bank 6
    asm = _bankasm(bm.group(1)[-2:]) if bm else _bankasm("06")
    m = re.search(re.escape(ts) + r'::?\n((?:\ttileset_fragment[^\n]*\n)+)', asm)
    if not m:
        return None
    frags = re.findall(r'tileset_fragment (\w+),', m.group(1))
    # prefer a fragment with a TilEd-viewable image_<bank>_<addr>.png, else the
    # first fragment whose real gfx file (lowercased label) exists on disk.
    for want_png in (True, False):
        for g in frags:
            gm = re.match(r'[Gg][Ff][Xx]_([0-9a-fA-F]+)_([0-9a-fA-F]+)', g)
            if not gm:
                continue
            bank = gm.group(1).lstrip('0') or '0'
            addr = gm.group(2)
            cands = ['image_%s_%s.png' % (bank, addr)] if want_png \
                else ['%s.2bpp' % g.lower(), '%s.png' % g.lower()]
            for c in cands:
                if os.path.exists(os.path.join(REPO, 'gfx/tilesets', c)):
                    return '../../../gfx/tilesets/' + c
    return None

TYPES = {"Layout": "layouts", "Blocks": "blocks", "Metatiles": "metatiles"}
SCRIPT = {"layouts": "layout2tmx.py", "blocks": "block2tmx.py", "metatiles": "meta2tmx.py"}

def gen_tmx(subdir, label, data, width=None, image=None):
    d = os.path.join(REPO, "data", "maps", subdir)
    src = os.path.join(d, label + ".src")
    with open(src, "wb") as f:          # explicit close: pypy GC is lazy
        f.write(data)
    cmd = ["pypy3", os.path.join(REPO, "utils", SCRIPT[subdir]), label + ".src"]
    if subdir == "layouts":
        cmd.append(str(width))
    subprocess.run(cmd, cwd=d, check=True)
    os.remove(src)
    tmx = os.path.join(d, label + ".tmx")
    with open(tmx) as f:
        content = f.read()
    # fix the image source line
    content = re.sub(r'<image source="[^"]*"/>',
                     '<image source="%s"/>' % image, content, count=1)
    with open(tmx, "w") as f:
        f.write(content)
    return "data/maps/%s/%s.bin" % (subdir, label)

out, i, n = [], 0, 0
todo_re = re.compile(r'^; TODO: (map layout binary|map blockset binary|metatile defs binary)')
label_re = re.compile(r'^(\w+)::?$')
dr_re = re.compile(r'^\tdr \$([0-9a-f]+), \$([0-9a-f]+)$')

while i < len(lines):
    m = todo_re.match(lines[i])
    if m and i + 2 < len(lines):
        lm = label_re.match(lines[i+1]); dm = dr_re.match(lines[i+2])
        if lm and dm:
            label = lm.group(1)
            start, end = int(dm.group(1), 16), int(dm.group(2), 16)
            data = rom[start:end]
            kind = label.split("_")[0]
            subdir = TYPES[kind]
            if kind == "Layout":
                blk = blocks_of[label]
                image = "../blocks/%s.tmx" % blk
                inc = gen_tmx(subdir, label, data[1:], width_of[label], image)
                out.append(lines[i+1])
                out.append('\tdb %s' % maptype(data[0]))
                out.append('\tINCBIN "%s"' % inc)
            elif kind == "Blocks":
                met = meta_of[label]
                image = "../metatiles/%s.tmx" % met
                inc = gen_tmx(subdir, label, data, image=image)
                out.append(lines[i+1]); out.append('\tINCBIN "%s"' % inc)
            else:  # Metatiles
                ts = tileset_of_meta[label]
                image = tileset_image(ts)
                inc = gen_tmx(subdir, label, data, image=image)
                out.append(lines[i+1]); out.append('\tINCBIN "%s"' % inc)
            n += 1; i += 3; continue
    out.append(lines[i]); i += 1

new = "\r\n".join(out)
assert new.strip()
tmp = ASM + ".tmp"
open(tmp, "wb").write(new.encode("latin-1"))
os.replace(tmp, ASM)
print("rewrote %d dr blocks" % n)
