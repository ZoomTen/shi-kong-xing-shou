# General

The purpose of this disassembly is to create a code base that compiles 1:1 with the base ROM (baserom.gbc), but is easily understandable and editable via the use of macros, constants, clearly-defined code, clearly-defined RAM addresses, and character maps.

"Better code" is not the goal right now. Accuracy however, is.

* Do not attempt to `git commit` on your own. I want to check your work manually and then commit it myself.
* Keep comments to an absolute minimum.
* Be the most concise you can be, even when you're thinking.
* This is a disassembly; do not try to be wise.
  * Do not try to optimize.
  * Do not split functions willy-nilly.
  * Do not inline stuff where it isn't inlined.
* Repeat: do not try to be wise. We're working with code that may be subpar to us, but they must 100% match the base ROM.
* The only thing you should be wise about is translating raw numbers into meaningful constants and labels.
* Prefer a systematical search and replace operation rather than a carpet-bomb `sed` operation. This gives you time to analyze.
* Along the way, analyze and suggest replacement names for the "partially-documented" labels. Stuff like Func_ asm_ unk_. (see Style guide)
* For unk_ data, analyze and recommend a keyword for them (also see Style guide)
* Try to also decipher what the local `.asm` labels mean as well.

# Command-specific

## grep

When scanning files using `grep`, besides `-n` to give you line numbers, use these for confirming context:
```
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
```

# Determining un-disassembled blocks

Indicated by a `dr` macro (see @macros/data.asm) in ROM offset form. Some calculation may be required to determine its Game Boy address.

`dr` ALWAYS points to a ROM address, not RAM.

# Compilation

To determine if the compiled ROM matches the base ROM:
```sh
/home/user/projects/ngbenv/ngbenv exec make compare
```

This checks the syntax and determines equality with the base ROM in one go.

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

# Finding the closest label/symbol to an address

For things in ROM:
```sh
python3 utils/get_nearest_symbol.py <absolute address in hex/bank:addr>
```

Or in RAM (yes, including banked):
```sh
python3 utils/get_nearest_symbol.py <bank:addr> ram
```

Its output should be:
```
SymbolName
```

Or a relative offset:
```
SymbolName + 10
```

See `shi_kong_xing_shou.sym` for a full current list.

# Ghidra usage for code disassembly

A Ghidra MCP should be linked and accessible. GhidraBoy has been installed onto my Ghidra instance, so you can view disassembled Game Boy code.

ROM addresses in Ghidra are in the form:
romX::YYYY

Where X is the bank number in decimal, and YYYY is the ROM address in the 4000-7fff range (0000-3fff for the home bank, which does not have a romX:: prefix.)

We use Ghidra in different ways.

## Me, the user

As Ghidra's CodeBrowser is better-equipped than the MCP or script tools inside Ghidra for disassembly code, I simply copy and paste a "half-finished" disassembly onto a file, usually in ghidra-buffer/ for your ease.

"Half-finished" usually means that I've worked out what is which in terms of flow control.

## You, Claude

The MCP is in a light assistive capacity, because as it turns out, it is not as capable as the CodeBrowser, the relevant tools for it might be:

* disassemble_function - simply a raw disassembly, with calls resolving to raw hex numbers. Useful only in certain cases.
* get_function_by_address - very often misses, due to me not explicitly marking something as a function.

## What I, the user, need your help with

1. I would direct you to a file in ghidra-buffer/ which contains my copy-pasted output from the Ghidra CodeBrowser.
2. I would state which file it's meant for, and which `dr` it should replace. If not, please ask that of me.
3. Run the following on the file:
```sh
python3 utils/ghidra2asm.py <file>
```
4. Use the output as a base for modifying assembly files.
5. You may use the MCP tools to double-check IF AND ONLY IF you are a might suspicious about its output.
6. You may also reference the original file if there any omissions caused by the script.
7. The output from the script should already agree with the style guide below; if not, then the style guide should take priority. Please also explain (in your response and not the code) why it disagrees.
8. Under any circumstances do not revert the labels derived from the script's output to the messy labels of the Ghidra original. If that's what you're thinking might cause code shifts—they aren't.
9. If you see in the original file something like:
```
LD HL,0xd40c
DEC (HL=>wSound1FadeTimer)
```
That is usually a good indication to render it in the target asm file to:
```
ld hl, wSound1FadeTimer
dec [hl]
```
Apply this wherever indirection is encountered.

10. To prevent confusion in terms of relative labels, prefer absolute labels. Optimizing using relative labels should be reserved AFTER you have ensured the compiled rom MATCHES.

# Some code patterns to look for

## hl = $XXYY + a

```
	ld a, <somewhere>
	add $YY
	ld l, a
	ld a, $XX
	adc 0
	ld h, a
```
Adapt accordingly for bc or de.

This usually resolves to:
```
  ld a, <somewhere>
	add LOW(somewhere else)
	ld l, a
	ld a, HIGH(somewhere else)
	adc 0
	ld h, a
```

## hl = XXYY + maybe a constant

```
	ld bc, <some address>
	; ...
	ld hl, <a low value>
	add hl, bc
```

This is usually used to access a part of a struct, where bc is the origin point of said struct.
Setting hl to a low value is usually indicative of such.

## Call to function in xx:yyyy

```
	ld hl, yyyy
	ld b, xx
	rst FarCall
```

xx is the bank, yyyy is the address.

If a function label is available there, replace this with the macro:
```
	farcall SomeFunction
```

If no such function is available yet, create a label for it in the form `Func_xx_yyyy`, and a `dr` shim/placeholder in the correct `bank_xx.asm` file, so that it can be marked for further disassembly. Keep in mind, again, that `dr` addresses are actual ROM addresses, and not Game Boy memory addresses.

If the farcall lands in the middle of a function, split the function it's pointing to in two just so the farcall has a valid target.

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

# Extra asset formats

* `data/text/*.txt`
  * This is a custom plaintext format whose purpose is to neatly preprocess Chinese text.
  * The encoding used is UTF-8.
  * Its commands align with the macros in `macros/scripts/text.asm`, each command separated with a semicolon.
  * `@org` directives get compiled to an auto-generated label, unless a custom label is specified in parentheses e.g. `@org $08, $4542 (House_CutsceneText1):`.
  * You can use `utils/dump_text.py` to generate scripts in this format from the ROM.
  * These files are compiled using `tools/tx_parse.py`.
* `data/maps/**/*.tmx`
  * Since we aren't currently able to create a bespoke map editor, we settled on using `tmx` for now.
  * This is an XML-based format, and can be opened using [TilEd](https://www.mapeditor.org/), which is a general purpose tilemap editor.
  * Maps can be ripped manually from the ROM, then using any of the `utils/*2tmx.py` scripts to convert them to the appropriate format.
  * They are compiled back using `tools/tmx2data.py`.
* `gfx/faces/*.ora`
  * `ora` is a trivial layered image format used where pixel management isn't too much of a concern. It's used to store both the (background) and GBC (sprites & palettes) graphics data for dialog faces.
  * These files can be opened using GIMP, Pinta (maybe Paint.NET?) or Krita. MyPaint is **not** recommended, as it will resize the canvas. From the bottom:
	* A color map which consists of 8 colors from left to right at the top left corner of the canvas. These colors must be the ONLY colors used in the two layers immediately above it. All other pixels are ignored.
	* The background graphics. This is the only graphics shown when playing the game on DMG or SGB, so it should be coherent. It uses the **first** 4 colors of the color map.
	* The sprite graphics. These graphics are overlaid on top of the background graphics for additional colors when played on GBC. It uses the **last** 4 colors of the color map.
	* The merged image. This will not be processed, but it serves as a file preview image.
