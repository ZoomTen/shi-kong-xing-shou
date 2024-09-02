ASM  := rgbasm
LINK := rgblink
GFX  := rgbgfx
FIX  := rgbfix
MD5  := md5sum -c
PYTHON := python3

ASMFLAGS :=
# Include all labels, including unreferenced and local labels, in the sym/map file if `make` is run with `ALLSYM=1`
ifeq ($(ALLSYM),1)
ASMFLAGS += -E
endif

SCANINC := tools/scan_includes

SOURCES := \
	home.asm \
	main.asm \
	wram.asm \
	hram.asm

OBJS := $(SOURCES:%.asm=%.o)

ROM := shi_kong_xing_shou.gbc
MAP := $(ROM:%.gbc=%.map)
SYM := $(ROM:%.gbc=%.sym)

ROM_TITLE := "TIMER MONSTER  "

.PHONY: all tools clean compare
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: compare

tools:
	@$(MAKE) -C tools/

compare: $(ROM)
	$(MD5) rom.md5

clean:
	$(RM) -fv $(ROM) $(MAP) $(SYM) $(OBJS)
	$(RM) -fv data/text/*.asm
	$(RM) -fv data/maps/blocks/*.bin
	$(RM) -fv data/maps/layouts/*.bin
	$(RM) -fv data/maps/metatiles/*.bin
	$(if $(shell find -iname '*.1bpp'),\
		$(RM) -fv $(shell find -iname '*.1bpp') \
	)
	$(if $(shell find -iname '*.2bpp'),\
		$(RM) -fv $(shell find -iname '*.2bpp') \
	)
	$(if $(shell find -iname '*.gbcpal'),\
		$(RM) -fv $(shell find -iname '*.gbcpal') \
	)
	$(MAKE) clean -C tools/

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell $(SCANINC) $2)
	$$(ASM) $$(ASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))
$(foreach obj, $(OBJS), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif

$(ROM): $(OBJS)
	$(LINK) -n $(SYM) -m $(MAP) -p 0 -o $@ $(OBJS)
	$(FIX) -cv -t $(ROM_TITLE) -l 0x33 -k A7 -m 0x1b -r 2 -p 0 $@
	$(PYTHON) tools/sort_symbols.py $(SYM)

data/text/%.asm: data/text/%.txt
	$(PYTHON) tools/tx_parse.py $< > $@

### Generate maps

data/maps/metatiles/%.bin: data/maps/metatiles/%.tmx
	tools/tmx2data $< $@

data/maps/blocks/%.bin: data/maps/blocks/%.tmx
	tools/tmx2data $< $@

data/maps/layouts/%.bin: data/maps/layouts/%.tmx
	tools/tmx2data $< $@

### Misc file-specific graphics rules

gfx/character_set/%.1bpp: tools/gfx += --interleave --png=$<
gfx/battle/%.2bpp: tools/gfx += --interleave --png=$<
gfx/sprites/%.2bpp: tools/gfx += --interleave --png=$<
gfx/intro/sprites/%.2bpp: tools/gfx += --interleave --remove-whitespace --png=$<

### Dialog faces

gfx/faces/%.bg.2bpp gfx/faces/%.obj.2bpp gfx/faces/%.bg.gbcpal gfx/faces/%.obj.gbcpal: gfx/faces/%.ora
	$(PYTHON) tools/face2gfx.py $<

### Catch-all graphics rules

%.2bpp: %.png
	$(GFX) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(GFX) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.gbcpal: %.png
	$(GFX) -p $@ $<
