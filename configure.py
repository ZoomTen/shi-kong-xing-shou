import re
import os.path
import glob
import shutil

# To build a matching baserom (hopefully):
#   1. remove "repointed.o" from `objs`
#   2. remove "lang_en" from `inc_dirs`
#   3. remove "-I lang_en -D ENGLISH" from `asm_flags` (below)
#   4. (optional) delete the lang_en/ overlay directory

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
  "audio.o",
  "repointed.o"   # EN overlay (strip #1)
]

# for translation work
inc_dirs = [
  "lang_en",      # EN overlay (strip #2)
  "lang_zh"
]

# no really this is it, the `scan_includes` equivalent.
dep_re = re.compile(r"(INCLUDE|INCBIN)\s+\"([^\"]+)\"", re.I)

# Resolve `IF DEF(ENGLISH)` blocks the way rgbasm will, so english-only deps
# (e.g. the english charset INCBIN, home/text_far.asm) are not scanned into the
# Chinese build. Only the uppercase ENGLISH gate is evaluated; every other
# conditional (macro `IF _NARG`/`ELIF`, lowercase `if`) is passed through so all
# its branches are still scanned exactly as before.
def resolve_english(text, english):
  out = []
  stack = []  # each frame: {"english": bool, "active": bool}
  for ln in text.split("\n"):
    s = ln.strip()
    below = stack[-1]["active"] if stack else True
    if s == "IF DEF(ENGLISH)":
      stack.append({"english": True, "active": below and english}); continue
    if s.startswith("IF ") or s == "IF":
      stack.append({"english": False, "active": below}); continue
    if s == "ELSE" and stack:
      top = stack[-1]
      par = stack[-2]["active"] if len(stack) > 1 else True
      top["active"] = (par and not english) if top["english"] else par
      continue
    if s.startswith("ELIF") and stack:
      stack[-1]["active"] = stack[-2]["active"] if len(stack) > 1 else True
      continue
    if s == "ENDC" and stack:
      stack.pop(); continue
    if all(fr["active"] for fr in stack):
      out.append(ln)
  return "\n".join(out)

def find_deps(file_name, out_set, scanned_files):
  if file_name in scanned_files:
    return
  scanned_files.add(file_name)
  try:
    with open(file_name, "rb") as f:
      text = resolve_english(f.read().decode("latin-1"), "lang_en" in inc_dirs)
      incls = dep_re.findall(text)
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
    # English text is GENERATED into lang_en/text (make_english + repoint) from the
    # lang_zh/*.txt source, so resolve a bare text/*.asm include to lang_en even before the
    # stub exists -- otherwise a freshly-cleaned tree falls through to lang_zh and configure
    # emits no REPOINT rule. Baserom build (no lang_en in inc_dirs) is unaffected; and when
    # the stub already exists this matches the old lang_en-first resolution.
    if ("lang_en" in inc_dirs and i.startswith("text/") and i.endswith(".asm")
        and glob.glob("lang_zh/%s.txt" % os.path.splitext(i)[0])):
      r.add("lang_en/" + i)
      continue
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
asm_flags = -I lang_en -I lang_zh -D ENGLISH
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

rule CAT
  command = cat $in > $out
  description = CAT $out

rule TEXT
  command = {which_binary("python3")} {which_binary("tools/tx_parse.py")} $in > $out
  description = TEXT $in

rule MAKE_ENGLISH
  command = {which_binary("python3")} utils/translation/make_english.py --csv $in
  description = Generate English text from $in

rule REPOINT
  command = {which_binary("python3")} utils/translation/repoint.py --repointed repointed.asm $in
  description = Generate all translated text

rule TMX
  command = {which_binary("tools/tmx2data")} $in $out
  description = TMX $out

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
  
  # Assets may be relocated under an include dir (see override_deps), so every
  # path regex must tolerate an optional `lang_xx/` prefix -- otherwise an
  # overlaid file (e.g. lang_en/gfx/intro/text1.2bpp) fails the `gfx/...` anchor
  # and silently falls through to the plain rule, losing --interleave.
  inc_alt = "|".join(re.escape(d) for d in inc_dirs)
  opt_lang = r"(?:(?:%s)/)?" % inc_alt

  # Some 2bpp files are really several images back to back; those get one png
  # per image, converted separately and concatenated. Keyed by base (un-overlaid)
  # target path; each part is resolved through override_deps, so translating one
  # sub-image only needs its own png dropped into lang_en/.
  # (Currently unused: the save-screen label sheet is now six INCBINs under
  # SaveScreenLabelsGFX, so lang_en piece overrides resolve like any other file.)
  concat_gfx = {}
  # NB: face_re stays base-only on purpose -- its group(1) feeds the FACE output
  # paths, so a lang prefix would have to be threaded through; no faces are
  # overlaid, so leave it anchored to the base tree.
  face_re = re.compile(r"(gfx/faces/.+?)\.(?:bg|obj)\.(?:2bpp|gbcpal)$")
  interleave_gfx_re = re.compile(opt_lang + r"gfx/(character_set|battle|sprites|intro)/(.+)$")
  tmx_re = re.compile(r"data/maps/(metatiles|blocks|layouts)/(.+?)\.bin$")
  txt_re = re.compile(opt_lang + r"text/(.+?)\.asm")
  
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
    
  en_text = []   # lang_en text .asm outputs, repointed together in one pass
  for i in all_deps:
    gfx_opts = ""

    # already processed by the previous loop
    if face_re.match(i):
      continue

    base = re.sub("^" + opt_lang, "", i)
    if base in concat_gfx:
      # override_deps() is per-part here (not on the whole list) to keep the
      # concatenation order stable.
      parts = [override_deps({p}).pop() for p in concat_gfx[base]]
      for part in parts:
        print("build %s: 2BPP %s" % (part, part.replace(".2bpp", ".png")))
      print("build %s: CAT %s" % (i, " ".join(parts)))
      continue

    if i.endswith(".2bpp"):
      src = i.replace(".2bpp", ".png")
      x = interleave_gfx_re.match(i)
      if x:
        where, name = x.group(1), x.group(2)
        if where == "intro":
          if name.startswith("text"):
            gfx_opts = "--interleave"
            if not i.startswith("lang_en/"):
              gfx_opts += " --remove-whitespace"
          elif name == "stars.2bpp":
            gfx_opts = "--interleave"
        else:
          gfx_opts = "--interleave"
      # 8x16 OBJ sheets; title_screen.2bpp (the BG layer) must stay plain
      elif i.startswith("lang_en/gfx/title_screen/") and \
           os.path.basename(i) in ("title_screen_sprites.2bpp", "characters.2bpp"):
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
        if x.group(1) == "character_set" and not x.group(2).startswith("english"):
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
      # English text goes through one REPOINT pass (collected below); any
      # lang_zh-only fallback still uses the plain per-file TEXT rule.
      if i.startswith("lang_en/"):
        en_text.append(i)
      else:
        print("build %s: TEXT %s.txt" % (i, txt_out))
      continue
    
    # TMX's are a cheap way to "have an editor" without actually
    # having an editor. The "editor" is simply Tiled (mapeditor.org)
    try:
      x = tmx_re.match(i)
      print("build %s: TMX data/maps/%s/%s.tmx" % (i, x.group(1), x.group(2)))
    except AttributeError:
      pass

  if en_text:
    en_text = sorted(set(en_text))
    asm_outs = " ".join(en_text)
    txt_outs = [os.path.splitext(a)[0] + ".txt" for a in en_text]
    txt_ins = " ".join(txt_outs)

    # One MAKE_ENGLISH pass rebuilds every English .txt from the filled-in
    # translation CSV (make_english writes them all in a single invocation).
    # Implicit deps: the tool itself and the lang_zh source blocks it copies
    # verbatim for untranslated rows.
    zh_srcs = [t.replace("lang_en/", "lang_zh/", 1) for t in txt_outs]
    zh_srcs = [s for s in zh_srcs if os.path.exists(s)]
    print("build %s: MAKE_ENGLISH translation/text.csv | "
          "utils/translation/make_english.py %s"
          % (txt_ins, " ".join(zh_srcs)))

    # One REPOINT pass converts every translated block in the English text into
    # an in-bank `tfarjump` stub and emits its body into repointed.asm (its own
    # object, sections auto-placed by rgblink). $in = the .txt sources above.
    print("build %s repointed.asm: REPOINT %s | utils/translation/repoint.py "
          "tools/tx_parse.py charmap.asm" % (asm_outs, txt_ins))
