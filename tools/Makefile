.PHONY: all clean

CC := gcc
CFLAGS := -O3 -flto -std=c17 -Wall -Wextra -Wno-missing-field-initializers

tools := \
	scan_includes \
	gfx \
	tmx2data

expat_deps := \
	lib/expat/Xmltok.c \
	lib/expat/Xmlparse.c \
	lib/expat/Xmlrole.c

plum_deps := \
	lib/plum/libplum.c

miniz_deps := \
	lib/miniz/miniz.c

all: $(tools)
	@:

clean:
	rm -f $(tools)

gfx: common.h

tmx2data: $(expat_deps)

%: %.c
	$(CC) $(CFLAGS) -o $@ $(filter-out %.h,$^)
