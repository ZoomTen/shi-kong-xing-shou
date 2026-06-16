# Style guide

## Constraints
* As we're working with a newer RGBDS: `DEF constant EQU value`, not `constant EQU value`
* Likewise, `MACRO name \n\t body \n ENDM`, not `name: MACRO \n\t body \n ENDM`.

## ASM

* Labels are **not indented**
* Code is indented with **one tab**.
* Each instruction argument is separated by **one space each**
* Spaces around math expressions
* `EQU` is capitalized
* < 80 characters when possible
* `hli` / `hld`, not `hl+` / `hl-`
* Use `-1` in place of `$ff` when used as a list terminator
* One space before main labels and after a `ret` or `jp` / `jr`

* Spaces after semicolons
* Comments above code, not below/inline
* Some exceptions may be made for temporarily labelling data


* `SECTION`, `INCLUDE`, `MACRO`, etc. directives should be uppercase
* `INCLUDE`s can be indented for readability
* Before every `SECTION` there should be two spaces
* Data macros should be lower_snake_case, except for RGB
* When in doubt, prefer lowercase

## Symbols

This section is the criteria used by the repo's `ok` script.

* WRAM symbols are PascalCase and begin with a lowercase 'w'.
* HRAM symbols are PascalCase and begin with a lowercase 'h'.
* Constants are UPPER_SNAKE_CASE
* Code labels are PascalCase
* Local symbols (single colon) whenever possible (global symbols use two)
* Replace unused labels with comments
* Relative (dots at the beginning) jumps should use lower_snake_case, without a colon after it
* Atomic code chunks should be relative, WITH a single colon.

### Documented

Labels which describe the exact purpose of a symbol, e.g. `DisplayLogo` for a piece of code that displays a logo on the screen.

Map names should correspond with its constant name by directly converting UPPER_SNAKE_CASE to PascalCase and vice versa.

Maps belonging to an area (such as indoor maps) should be formatted like so:
* `ForestP1`, `ForestP2` (forest part 1, forest part 2)
* `House1F`, `House2F` (house 1st floor, house 2nd floor)

For data, keywords that describe what part of the symbol goes **after** it (preceded with an underscore), e.g. `Logo_GFX`, `Logo_Palette`. See section 'Keywords' below.

Duplicates directly go **after** the keyword: `Hometown_Layout1`, `Hometown_Layout2`

Non-English games: Constants/label names should be direct translations if possible.

### Partially documented

How it is used is known but purpose still unknown, therefore still uses an address in the label.

This takes the form of `Keyword_BB_AAAA` where BB = bank (2-digit or 3-digit) and AAAA = address (4-digit), all hexadecimal numbers

For bank 0, the format of `Keyword_AAAA` should be used.

### Undocumented symbols

Both purpose and how it's used is still unknown / not ripped or disassembled yet.

Keywords `Func`, `asm` and `unk` should be used.

See section 'Partially documented' for usage

Undocumented WRAM symbols e.g. `wc000`, `wc001`, etc.

Undocumented HRAM symbols e.g. `hFF80`, `hFF81`, etc.

Use `utils/check_sym.py shi_kong_xing_shou.sym` to help debug shifting issues.

### Keywords

Overworld:
* `Layout` - Game map layout consisting of blocks
* `Blocks` - 32x32 map fragments consisting of metatiles
* `Metatiles` - 16x16 map fragments consisting of graphics tiles
* `Collision` - Game map collision data
* `MapAttributes` - Visual attributes of a game map, defining all of the above
* `MapHeader` - Game map headers, determining warp points and event pointers
* `ObjectEvents` - Interactible events leading to scripts
* `MapEvents` - Signposts and warps
* `MovementData` - Map or sprite movement data

Data:
* `Script` - Game script
* `Text` - Dialog text
* `String` - Line of text to be printed immediately

Display:
* `GFX` - Graphics
* `Pic` - Compressed graphics
* `BGMap` - Direct background map
* `WinMap` - Same as `BGMap` but with the intent of displaying it in the window layer
* `AttrMap` - GBC attributes map
* `Sprite` - Sprite definition data
* `Palette` - Game Boy Color palettes

Lists:
* `Pointers` - For lists of data pointers/unknown pointers
* `Jumptable` - Pointers to code fragments
* `Sprites` - Sprite list
