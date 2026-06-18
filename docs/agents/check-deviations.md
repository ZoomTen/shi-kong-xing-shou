# Checking for deviations

Two ways do this.

## Byte blocks

Better for finding big shifts.

```sh
utils/look_block shi_kong_xing_shou.gbc <start offset> <lines>
```

Start offset = ROM address. Lines = how many 16-byte rows shown at once.
5 or 10 good. Expand as needed.

Deviations show bytes in square brackets, like:

```
baserom.gbc
00000000:  00  00  00  00  00  00  00  00  e9  00  00  00  00  00  00  00 
00000010: [00][00][00][00][00][00][00][00][00][00] 00  00  00  00  00  00 
00000020:  ea  8f  d0  ea  00  20  c9  00  00  00  00  00  00  00  00  00 
00000030:  fa  ff  7f  f5  78  e7  cf  f1  e7  c9  00  00  00  00  00  00 
00000040:  c3  43  28  c9  00  00  00  00  c3  be  28  c9  00  00  00  00 
00000050:  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00 
00000060:  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00 
00000070:  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00 

shi_kong_xing_shou.gbc
00000000:  00  00  00  00  00  00  00  00  e9  00  00  00  00  00  00  00 
00000010: [ee][ee][34][32][43][23][52][35][92][98] 00  00  00  00  00  00 
00000020:  ea  8f  d0  ea  00  20  c9  00  00  00  00  00  00  00  00  00 
00000030:  fa  ff  7f  f5  78  e7  cf  f1  e7  c9  00  00  00  00  00  00 
00000040:  c3  43  28  c9  00  00  00  00  c3  be  28  c9  00  00  00  00 
00000050:  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00 
00000060:  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00 
00000070:  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00
```

## Individual bytes

For smaller changes, but scans whole ROM.
See what bytes deviated from base ROM after compile:
```sh
utils/check_diff shi_kong_xing_shou.gbc
```

Format: `ROM ADDRESS [GAMEBOY ADDRESS] -> ORIGINAL CHANGED`
```
     14e [00:014e] -> 11 3a
```

Ignore 14e and 14f safely: Game Boy checksums. Differ as consequence of ANY other change later in output.

Mismatches usually mean shifted output:
1. If call instruction parameter differs, check function it points to. Maybe shifted from surrounding code.
2. Maybe ld/ldh switcharoo — game sometimes code `ld [hSomething]` (longer bytes) instead of `ldh [hSomething]` (shorter bytes); RGBDS treats two differently.

Inspect `check_diff` itself: source at `utils/check_diff.c`.

Same with `look_block`.

If either tool missing, run `make` inside `utils/` folder or let user do it.