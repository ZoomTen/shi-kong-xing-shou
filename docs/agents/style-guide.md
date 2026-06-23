# Style guide

## Constraints
* Newer RGBDS: `DEF constant EQU value`, not `constant EQU value`
* Likewise, `MACRO name \n\t body \n ENDM`, not `name: MACRO \n\t body \n ENDM`.

## ASM

* Labels **not indented**
* Code indented **one tab**
* Each instruction arg separated by **one space each**
* Spaces around math expressions
* `EQU` capitalized
* < 80 chars when possible
* `hli` / `hld`, not `hl+` / `hl-`
* Use `-1` for `$ff` as list terminator
* One space before main labels and after `ret` or `jp` / `jr`

* Spaces after semicolons
* Comments above code, not below/inline
* Exceptions OK for temp labelling data


* `SECTION`, `INCLUDE`, `MACRO`, etc. directives uppercase
* `INCLUDE`s can indent for readability
* Two spaces before every `SECTION`
* Data macros lower_snake_case, except RGB
* When in doubt, prefer lowercase

## Symbols

Criteria for repo's `ok` script.

* WRAM symbols PascalCase, begin lowercase 'w'
* HRAM symbols PascalCase, begin lowercase 'h'
* Constants UPPER_SNAKE_CASE
* Code labels PascalCase
* Local symbols (single colon) when possible (global use two)
* Replace unused labels with comments
* Relative jumps (dots at start) use lower_snake_case, no colon after
* Atomic code chunks relative, WITH single colon

### Documented

Labels describing exact purpose of symbol, e.g. `DisplayLogo` for code displaying logo on screen.

Map names match constant name: convert UPPER_SNAKE_CASE to PascalCase and vice versa.

Maps of an area (e.g. indoor maps) format like:
* `ForestP1`, `ForestP2` (forest part 1, forest part 2)
* `House1F`, `House2F` (house 1st floor, house 2nd floor)

For data, keywords describing part of symbol go **after** it (preceded by underscore), e.g. `Logo_GFX`, `Logo_Palette`. See 'Keywords' below.

Duplicates go **after** keyword: `Hometown_Layout1`, `Hometown_Layout2`

Non-English games: Constants/label names direct translations if possible.

### Partially documented

Usage known but purpose unknown, so still uses address in label.

Form `Keyword_BB_AAAA` where BB = bank (2- or 3-digit), AAAA = address (4-digit), all hex.

Bank 0: use format `Keyword_AAAA`.

### Undocumented symbols

Purpose and usage both unknown / not ripped or disassembled yet.

Keywords `Func`, `asm`, `unk`.

See 'Partially documented' for usage.

Undocumented WRAM symbols e.g. `wc000`, `wc001`, etc.

Undocumented HRAM symbols e.g. `hFF80`, `hFF81`, etc.

Use `utils/check_sym.py shi_kong_xing_shou.sym` to debug shifting issues.

### Keywords

Overworld:
* `Layout` - Map layout of blocks
* `Blocks` - 32x32 map fragments of metatiles
* `Metatiles` - 16x16 map fragments of graphics tiles
* `Collision` - Map collision data
* `MapAttributes` - Visual attributes of map, defining all above
* `MapHeader` - Map headers, set warp points and event pointers
* `ObjectEvents` - Interactible events leading to scripts
* `MapEvents` - Signposts and warps
* `MovementData` - Map or sprite movement data

Data:
* `Script` - Game script
* `Text` - Dialog text
* `String` - Line of text printed immediately

Display:
* `GFX` - Graphics
* `Pic` - Compressed graphics
* `BGMap` - Direct background map
* `WinMap` - Same as `BGMap` but for window layer
* `AttrMap` - GBC attributes map
* `Sprite` - Sprite definition data
* `Palette` - Game Boy Color palettes

Lists:
* `Pointers` - Lists of data/unknown pointers
* `Jumptable` - Pointers to code fragments
* `Sprites` - Sprite list