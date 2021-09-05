ASM  := rgbasm
LINK := rgblink
GFX  := rgbgfx
FIX  := rgbfix
MD5  := md5sum -c
PYTHON := python3
IPS := tools/flips

ASMFLAGS := -hL
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
PATCH := skxs_en.ips
MAP := $(ROM:%.gbc=%.map)
SYM := $(ROM:%.gbc=%.sym)

ROM_TITLE := "TIMER MONSTER  "

.PHONY: all tools clean compare
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(PATCH)

tools:
	@$(MAKE) -C tools/

compare: $(ROM)
	$(MD5) rom.md5

clean-csv:
	$(RM) data/english_text/*.csv

clean:
	$(RM) $(PATCH) $(ROM) $(MAP) $(SYM) $(OBJS)
	$(RM) data/text/*.asm
	$(RM) data/maps/{blocks,layouts,metatiles}/*.bin
	$(if $(shell find -iname '*.1bpp'),\
		$(RM) $(shell find -iname '*.1bpp') \
	)
	$(if $(shell find -iname '*.2bpp'),\
		$(RM) $(shell find -iname '*.2bpp') \
	)
	$(if $(shell find -iname '*.gbcpal'),\
		$(RM) $(shell find -iname '*.gbcpal') \
	)
	$(RM) data/english_text/*.asm
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

$(PATCH): $(ROM)
	$(IPS) -c -i baserom.gbc $(ROM) $@

$(ROM): $(OBJS)
	$(LINK) -n $(SYM) -m $(MAP) -p 0 -o $@ $(OBJS)
	$(FIX) -cv -t $(ROM_TITLE) -l 0x33 -k A7 -m 0x1b -r 2 -p 0 $@

data/text/%.asm: data/text/%.txt
	$(PYTHON) tools/tx_parse.py $< > $@

### Generate maps

data/maps/metatiles/%.bin: data/maps/metatiles/%.tmx
	$(PYTHON) tools/tmx2data.py $< $@

data/maps/blocks/%.bin: data/maps/blocks/%.tmx
	$(PYTHON) tools/tmx2data.py $< $@

data/maps/layouts/%.bin: data/maps/layouts/%.tmx
	$(PYTHON) tools/tmx2data.py $< $@

### Misc file-specific graphics rules

gfx/character_set/image_%.1bpp: tools/gfx += --interleave --png=$<
gfx/battle/%.2bpp: tools/gfx += --interleave --png=$<
gfx/intro/sprites/%.2bpp: tools/gfx += --interleave --remove-whitespace --png=$<
gfx/title_screen/characters.2bpp: tools/gfx += --interleave --png=$<
gfx/title_screen/title_screen_sprites.2bpp: tools/gfx += --interleave --png=$<
gfx/character_set/english.1bpp: tools/gfx += --png=$<

### Translation tool

include download_translations.make

data/english_text/%.asm: data/english_text/%.csv
	$(PYTHON) tools/csv2asm.py $^ > $@

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
