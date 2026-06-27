import re
import os.path
import glob
import shutil

objs = [
  "home.o",
  "main.o",
  "wram.o",
  "hram.o",
  "sram.o",
  "bank_nums.o",
  "data/monsters/pics.o",
  "data/gfx.o",
  "data/maps.o",
  "data/maps/tilesets.o",
  "data/text.o",
  "multicart.o",
  "audio.o"
]

# for translation work
inc_dirs = [
  # "lang_en",
  # "lang_zh"
]

# no really this is it, the `scan_includes` equivalent.
dep_re = re.compile(r"(INCLUDE|INCBIN)\s+\"([^\"]+)\"", re.I)
def find_deps(file_name, out_set, scanned_files):
  if file_name in scanned_files:
    return
  scanned_files.add(file_name)
  try:
    with open(file_name, "rb") as f:
      incls = dep_re.findall(f.read().decode("latin-1"))
      for i in incls:
        incl_file = i[1]
        out_set.add(incl_file)
        if i[0].lower() == "include":
          find_deps(incl_file, out_set, scanned_files)
  except FileNotFoundError:
    pass

# attempting to mimic the `-I something -I something_else`
# thing the compiler does
def override_deps(in_set):
  r = set()
  for i in in_set:
    ok = 0
    for inc_dir in inc_dirs:
      k = "%s/%s" % (inc_dir, os.path.splitext(i)[0])
      l = "%s/%s" % (inc_dir, i)
      # this assumes 
      if glob.glob(k + ".*"):
        r.add(l)
        ok = 1
        break
    if ok:
      continue
    r.add(i)
  return r

def which_binary(app):
  if os.sep in app:
    return app
  which = shutil.which(app)
  if which is None:
    raise SystemExit("%s not found" % app)
  return which

if __name__ == "__main__":
  all_deps = set()
  preamble = f"""
asm_flags =
rom = shi_kong_xing_shou.gbc
sym = shi_kong_xing_shou.sym
map = shi_kong_xing_shou.map
layout = layout.link
title = "TIMER MONSTER  "

rule LINK
  command = {which_binary("rgblink")} -n $sym -m $map -l $layout -p 0 -o $out $in && {which_binary("rgbfix")} -cv -t $title -l 0x33 -k A7 -m 0x1b -r 2 -p 0 $out
  description = Link final ROM

rule COMPILE
  command = {which_binary("rgbasm")} $asm_flags -o $out $in
  description = Compile $out

rule FACE
  command = {which_binary("tools/face2gfx")} $in
  description = Generating face assets from $in

rule 1BPP
  command = {which_binary("rgbgfx")} -d1 -o $out $in
  description = 1BPP $out

rule 1BPP_GFX
  command = {which_binary("rgbgfx")} -d1 -o $out $in && {which_binary("tools/gfx")} $gfx -d1 --png=$in -o $out $out
  description = 1BPP $out

rule 2BPP
  command = {which_binary("rgbgfx")} -o $out $in
  description = 2BPP $out

rule 2BPP_GFX
  command = {which_binary("rgbgfx")} -o $out $in && {which_binary("tools/gfx")} $gfx --png=$in -o $out $out
  description = 2BPP $out

rule PALETTE
  command = {which_binary("rgbgfx")} -p $out $in
  description = PALETTE $out

rule TEXT
  command = {which_binary("python3")} {which_binary("tools/tx_parse.py")} $in > $out
  description = TEXT $in

rule TMX
  command = {which_binary("tools/tmx2data")} $in $out
  description = TMX $out

rule COMPARE
  command = md5sum -c $in
  description = Verifying match

build compare: COMPARE rom.md5 | $rom

default compare
"""
  print(preamble)
  print("build $rom | $sym $map: LINK %s | $layout" % (" ".join(objs)))

  # First; the obvious
  for o in objs:
    src_asm = o.replace(".o", ".asm")
    deps = set()
    find_deps(src_asm, deps, set())
    deps = override_deps(deps)
    all_deps = all_deps | deps
    print("build %s: COMPILE %s | %s" % (o, src_asm, " ".join(deps)))
  
  face_re = re.compile(r"(gfx/faces/.+?)\.(?:bg|obj)\.(?:2bpp|gbcpal)$")
  interleave_gfx_re = re.compile(r"gfx/(character_set|battle|sprites|intro)/(.+)$")
  tmx_re = re.compile(r"data/maps/(metatiles|blocks|layouts)/(.+?)\.bin$")
  # text files may be relocated under an include dir (see override_deps),
  # so tolerate an optional `lang_xx/` prefix.
  inc_alt = "|".join(re.escape(d) for d in inc_dirs)
  txt_re = re.compile(r"(?:(?:%s)/)?text/(.+?)\.asm" % inc_alt)
  
  # Here's the wrench in the regularity: faces are .ora, and they make
  # 2bpp & gbcpal for BOTH bg & obj.
  faces = set()
  for i in all_deps:
    m = face_re.match(i)
    if m:
      faces.add(m.group(1))
  for i in faces:
    outs = [
      "%s.bg.2bpp" % i,
      "%s.bg.gbcpal" % i,
      "%s.obj.2bpp" % i,
      "%s.obj.gbcpal" % i,
    ]
    print("build %s: FACE %s.ora" % (" ".join(outs), i))
    
  for i in all_deps:
    gfx_opts = ""

    # already processed by the previous loop
    if face_re.match(i):
      continue

    if i.endswith(".2bpp"):
      src = i.replace(".2bpp", ".png")
      x = interleave_gfx_re.match(i)
      if x:
        where, name = x.group(1), x.group(2)
        if where == "intro":
          if name.startswith("text"):
            gfx_opts = "--interleave --remove-whitespace"
          elif name == "stars.2bpp":
            gfx_opts = "--interleave"
        else:
          gfx_opts = "--interleave"
      if gfx_opts != "":
        print("build %s: 2BPP_GFX %s\n  gfx = %s" % (i, src, gfx_opts))
      else:
        print("build %s: 2BPP %s" % (i, src))
      continue
    
    if i.endswith(".1bpp"):
      src = i.replace(".1bpp", ".png")
      x = interleave_gfx_re.match(i)
      if x:
        if x.group(1) == "character_set":
          gfx_opts = "--interleave"
      if gfx_opts != "":
        print("build %s: 1BPP_GFX %s\n  gfx = %s" % (i, src, gfx_opts))
      else:
        print("build %s: 1BPP %s" % (i, src))
      continue

    if i.endswith(".gbcpal"):
      src = i.replace(".gbcpal", ".png")
      print("build %s: PALETTE %s" % (i, src))
      continue
    
    # Because Chinese text is represented a certain way, the editable
    # text files also need to be represented a certain way.
    # Rather stare at a block of "mostly characters" than "mostly `db`".
    if txt_re.match(i):
      txt_out = os.path.splitext(i)[0]
      print("build %s: TEXT %s.txt" % (i, txt_out))
      continue
    
    # TMX's are a cheap way to "have an editor" without actually
    # having an editor. The "editor" is simply Tiled (mapeditor.org)
    try:
      x = tmx_re.match(i)
      print("build %s: TMX data/maps/%s/%s.tmx" % (i, x.group(1), x.group(2)))
    except AttributeError:
      pass
