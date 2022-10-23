### Set applications
ASM  := rgbasm
LINK := rgblink
GFX  := rgbgfx
FIX  := rgbfix
MD5  := md5sum -c
PYTHON := python3
IPS := tools/mkips.py

ASMFLAGS := -hL
# Include all labels, including unreferenced and local labels, in the sym/map file if `make` is run with `ALLSYM=1`
ifeq ($(ALLSYM),1)
ASMFLAGS += -E
endif

SCANINC := tools/scan_includes

### Project defines

SOURCES := \
	home.asm \
	main.asm \
	wram.asm \
	hram.asm
	
OBJS := $(SOURCES:%.asm=%.o)

# language support
AVAILABLE_LANGUAGES := en fr id
LANGUAGES := AVAILABLE_LANGUAGES

# language support
OBJS_en := $(OBJS:%.o=%_en.o)
OBJS_fr := $(OBJS:%.o=%_fr.o)
OBJS_id := $(OBJS:%.o=%_id.o)
$(OBJS_en): ASMFLAGS += -DLANG="en"
$(OBJS_fr): ASMFLAGS += -DLANG="fr"
$(OBJS_id): ASMFLAGS += -DLANG="id"

BASENAME := dist/skxs-
ROMS := $(LANGUAGES:%=$(BASENAME)%.gbc)
PATCHES := $(LANGUAGES:%=$(BASENAME)%.ips)

MAPS := $(ROM:%.gbc=%.map)
SYMS := $(ROM:%.gbc=%.sym)

ROM_TITLE := "TIMER MONSTER  "

.PHONY: all tools clean clean-csv tidy
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(PATCHES)

tools:
	@$(MAKE) -C tools/

clean-csv:
	$(RM) data/translated/*.csv

tidy:
	$(RM) $(MAPS) $(SYMS)
# language support
	$(RM) $(OBJS_en) $(OBJS_fr) $(OBJS_id)
	$(RM) data/translated/**/*.asm

clean: tidy
	$(RM) $(PATCHES) $(ROMS)
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
	$(MAKE) clean -C tools/

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell $(SCANINC) $2)
	$$(ASM) $$(ASMFLAGS) -o $$@ $$<
endef

# translation rules
define TXT
data/translated/$1/%.asm: data/translated/%.csv
	$$(PYTHON) tools/csv2asm.py $$^ $1 > $$@
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))
$(foreach lang, $(AVAILABLE_LANGUAGES), $(eval $(call TXT,$(lang))))
# language support
$(foreach obj, $(OBJS_en), $(eval $(call DEP,$(obj),$(obj:%_en.o=%.asm))))
$(foreach obj, $(OBJS_fr), $(eval $(call DEP,$(obj),$(obj:%_fr.o=%.asm))))
$(foreach obj, $(OBJS_id), $(eval $(call DEP,$(obj),$(obj:%_id.o=%.asm))))

endif

# patch
$(BASENAME)%.ips: $(BASENAME)%.gbc
	$(IPS) baserom.gbc $< $@
	
# rom
$(BASENAME)%.gbc: $$(OBJS_$$*)
	$(LINK) -n $(BASENAME)$*.sym -m $(BASENAME)$*.map -p 0 -o $@ $^
	$(FIX) -cv -t $(ROM_TITLE) -l 0x33 -k A7 -m 0x1b -r 2 -p 0 $@
	$(PYTHON) tools/sort_symbols.py $(BASENAME)$*.sym

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

gfx/character_set/%.1bpp: tools/gfx += --png=$<
gfx/battle/%.2bpp: tools/gfx += --interleave --png=$<
gfx/sprites/%.2bpp: tools/gfx += --interleave --png=$<
gfx/intro/sprites/%.2bpp: tools/gfx += --interleave --png=$<
gfx/title_screen/characters.2bpp: tools/gfx += --interleave --png=$<
gfx/title_screen/title_screen_sprites.2bpp: tools/gfx += --interleave --png=$<
gfx/character_set/english.1bpp: tools/gfx += --png=$<

### Translation tool

include download_translations.make

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
