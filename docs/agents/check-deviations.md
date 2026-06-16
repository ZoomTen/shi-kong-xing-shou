# Checking for deviations

There are two ways to achieve this.

## Byte blocks

More effective for finding large shifts.

```sh
utils/look_block shi_kong_xing_shou.gbc <start offset> <lines>
```

Start offset is the ROM address. Lines is how many 16-byte rows you want to see at a time.
A good amount might be 5 or 10. Expand as needed.

Any deviations will have the bytes under square brackets, like this:

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

This is for smaller changes, but this scans across the whole ROM.
To look at what bytes have deviated from the base ROM once you've compiled it:
```sh
utils/check_diff shi_kong_xing_shou.gbc
```

They are in the format: `ROM ADDRESS [GAMEBOY ADDRESS] -> ORIGINAL CHANGED`
```
     14e [00:014e] -> 11 3a
```

You can safely ignore 14e and 14f: Those are Game Boy checksums. Them being different is a consequence of ANY other change later down the output.

Mismatches usually involved shifted output somehow:
1. If you find the call instruction parameter differs, perhaps it's a good idea to check out the function it's supposed to be pointing to. It might have shifted due to the code around it.
2. Maybe a ld/ldh switcharoo, as the game sometimes code `ld [hSomething]` (longer bytes) instead of `ldh [hSomething]` (shorter bytes); RGBDS solidly treats the two differently.

If you would like to inspect `check_diff` itself, the source is `utils/check_diff.c`.

Likewise with `look_block`.

If either of those tools aren't available, then run `make` inside the `utils/` folder or let the user do them for you.

