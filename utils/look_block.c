#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <fcntl.h>
#include <alloca.h>

#define BASEROM_NAME "baserom.gbc"
#define BYTES_PER_LINE 16

static void dump(uint8_t *buf, uint8_t *diffmap, size_t start, int lines);
static void print_help(void);

int main(int argc, char **argv)
{
  size_t begin_offset;
  char *arg_name;
  char *arg_offset;
  char *arg_lines;
  int bf;
  int cf;
  int i;
  int lines;
  uint8_t *bbuf;
  uint8_t *cbuf;
  uint8_t *diffmap;
  uint8_t *bbuf_diff;
  uint8_t *cbuf_diff;
  uint8_t *diffmap_diff;
  int SZ;

	if (argc != 4){
		print_help();
		return 0;
	}

  arg_name = argv[1];
  arg_offset = argv[2];
  arg_lines = argv[3];
  begin_offset = strtoul(arg_offset, NULL, 16);
  lines = atoi(arg_lines);
  SZ = BYTES_PER_LINE * lines;

  /* setup buffers */
  bbuf = alloca(SZ);
  memset(bbuf, 0, SZ);

  cbuf = alloca(SZ);
  memset(cbuf, 0, SZ);

  diffmap = alloca(SZ);
  memset(diffmap, 0, SZ);

  /* populate buffers */
  bf = open(BASEROM_NAME, O_RDONLY);
  if (bf > -1)
  {
    lseek(bf, begin_offset, SEEK_SET);
    read(bf, bbuf, SZ);
    close(bf);
  }

  cf = open(arg_name, O_RDONLY);
  if (cf > -1)
  {
    lseek(cf, begin_offset, SEEK_SET);
    read(cf, cbuf, SZ);
    close(cf);
  }

  /* find diffs */
  bbuf_diff = bbuf;
  cbuf_diff = cbuf;
  diffmap_diff = diffmap;
  for (i = 0; i < SZ; i++)
  {
    if (*bbuf_diff != *cbuf_diff)
    {
      *diffmap_diff = 1;
    }
    bbuf_diff++;
    cbuf_diff++;
    diffmap_diff++;
  }

  puts(BASEROM_NAME);
  dump(bbuf, diffmap, begin_offset, lines);
  puts("");
  puts(arg_name);
  dump(cbuf, diffmap, begin_offset, lines);
  return 0;
}

void print_help(void)
{
  puts("look_block [rom.gbc] [hex offset] [lines]");
}

void dump(uint8_t *buf, uint8_t *diffmap, size_t start, int lines)
{
  int line;
  int i;
  size_t addr;
  uint8_t *p;
  uint8_t *d;

  p = buf;
  d = diffmap;
  for (line = 0; line < lines; line++) {
    addr = start + (size_t)line * BYTES_PER_LINE;
    printf("%04x%04x: ", (unsigned)(addr >> 16), (unsigned)(addr & 0xFFFF));
    for (i = 0; i < BYTES_PER_LINE; i++)
    {
      if (*d)
        printf("[%02x]", *p);
      else
        printf(" %02x ", *p);
      p++;
      d++;
    }
    putchar('\n');
  }
}