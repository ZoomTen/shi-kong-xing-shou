.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c99 -Wall -Wextra -Wno-missing-field-initializers

tools := \
	check_diff

all: $(tools)
	@:

clean:
	rm -f $(tools)

%: %.c
	$(CC) $(CFLAGS) -o $@ $<
