# General

The purpose of this disassembly is to create a code base that compiles 1:1 with the base ROM (baserom.gbc), but is easily understandable and editable via the use of macros, constants, clearly-defined code, clearly-defined RAM addresses, and character maps.

As a disassembly, it is a goal to eliminate all `dr` and ensure that compilation is **accurate** to the original source baserom. Hence, "better code" is a non-goal.

* Do not attempt to `git commit` on your own. I want to check your work manually and then commit it myself.
* Keep comments to an absolute minimum.
* Be the most concise you can be, even when you're thinking.
* This is a disassembly; do not try to be wise.
  * Do not try to optimize.
  * Do not split functions willy-nilly.
  * Do not inline stuff where it isn't inlined.
  * Code may be subpar, but must 100% match the base ROM.
* The only thing you should be wise about is translating raw numbers into meaningful constants and labels.
* Prefer a systematical search and replace operation rather than a carpet-bomb `sed` operation. This gives you time to analyze.
* Along the way, analyze and suggest replacement names for the "partially-documented" labels. Stuff like Func_ asm_ unk_. (see Style guide)
* For unk_ data, analyze and recommend a keyword for them (also see Style guide)
* Try to also decipher what the local `.asm` labels mean as well.

# Compilation

To determine if the compiled ROM matches the base ROM:
```sh
make compare
```

This checks the syntax and determines equality with the base ROM in one go.

To inspect *which* bytes deviate from the base ROM, try `utils/check_diff` / `utils/look_block` (see [check deviations](docs/agents/check-deviations.md)) FIRST.

# Determining un-disassembled blocks

Indicated by a `dr` macro (see [macros](macros/data.asm)) in ROM offset form. Some calculation may be required to determine its Game Boy address.

`dr` ALWAYS points to a ROM address, not RAM.

# Resolve a bare address before assuming it's unlabeled

Whenever you encounter a bare ROM/RAM address (a `call`/`jp`/`ld` target, a pointer-table entry, etc.), resolve it with `utils/get_nearest_symbol.py <bank:addr>` (add `ram` for RAM) FIRST. A result like `Func_026_4012 + 200` tells you it's 200 bytes past the nearest label (which symbol it falls under) — open the file there to see whether that's a `dr` block or already-disassembled code. See [find closest label/symbol](docs/agents/find-closest-label-or-symbol.md).

Before coining a label, run two greps:
1. Is the *address* already named? Resolve it (`get_nearest_symbol.py`) and reuse that symbol.
2. Is the *name* you're about to use (e.g. `MoveName_Pointers`) already taken for a different address? `grep` it across `banks/`, `wram.asm`, `home/`.

If there's a potential conflict, STOP and prompt me — don't silently rename or shadow. If the address sits inside an existing `dr`, split that `dr` to expose the label. Leave a single-line `; TODO` above it. One line max. See [disassemble from scratch](docs/agents/disassemble-from-scratch.md).

# Labels & symbols

Every `call`/`jp`/`jr` operand and every RAM access (`ld [wXXXX]`) **must** resolve to a label — no bare `$XXXX` left behind. (Exception: `jp $c000`-style jumps into WRAM.)

16-bit pointer hi byte = `wFoo + 1`, **not** a separate `wBar`/`wFooHi`, unless that byte is also accessed independently. See [code patterns](docs/agents/code-patterns.md) — recurring asm patterns (`hl = $XXYY + a`, farcalls, etc.).

When promoting a `.asm_` local to a global across function boundaries, iterate to fixpoint — other locals may be orphaned and need promoting too..

To rename `wdxxx` → `wSomething`: alias first, audit all usages, then substitute. See [ram address identification](docs/agents/ram-address-identification.md).

Naming conventions and keywords (`Layout`, `Pointers`, `GFX`, etc.): see [style guide](docs/agents/style-guide.md) — asm/symbol/keyword conventions (the repo's `ok` criteria).

# Encoding pitfalls

**Little-endian**: `fa d8 d9` = `ld a, [$d9d8]`, NOT `$d8d9`. Verify with `utils/check_sym.py`.

**`ld` vs `ldh`**: render by opcode, never by address. `ea a6 ff` = `ld [$ffa6]` (3 bytes), NOT `ldh [$ffa6]` (2 bytes). See [check deviations](docs/agents/check-deviations.md) — finding byte/symbol deviations.

**`rst $30` = `FarCall`**: `ld hl, X` / `ld b, BANK` / `rst $30` → `farcall X` when a label exists at `X`.

**Duplicate glyphs**: do NOT tidy a `db` back into a `text` glyph — `make compare` will break. See [reading strings](docs/agents/reading-strings.md) — Chinese in-game string encoding.

# Graphics & assets

**Never** `INCBIN` a `.2bpp` — `make clean` deletes them. Extract to PNG with `rgbgfx -r X`, commit the PNG. See [disassemble from scratch](docs/agents/disassemble-from-scratch.md) §4a.

Text `.txt`, map `.tmx`, face `.ora` asset formats: see [extra asset formats](docs/agents/extra-asset-formats.md).

Map headers, warps, object events, metatiles: see [overworld data](docs/agents/overworld-data.md). To convert a map group's raw headers into `map`/`warp` macros — including the label-stacking trick for shared attributes/events and removing the now-dead original labels (let the linker confirm, since macros reference some names implicitly) — see that doc's "Converting a map group's headers" section (`banks/bank_07.asm`, `banks/bank_52.asm` are done examples).

# Ghidra workflow

Run `python3 utils/ghidra2asm.py <file>` on the buffer; use its output as base.

Never revert script-derived labels back to Ghidra's raw labels.

Prefer absolute labels over relative until `make compare` passes. See [ghidra usage](docs/agents/ghidra-usage.md) — Ghidra MCP + `ghidra2asm.py` workflow.

# Deviations

Don't write diffing scripts, use `utils/look_block` and `utils/check_diff` (see [check deviations](docs/agents/check-deviations.md)) in conjunction with standard tools. If you write a script, have a very good reason to do so.

Ignore mismatches at `14e`/`14f` — GB checksums, always differ when anything else changes.

When a `call` parameter differs, check whether the target function shifted. See [check deviations](docs/agents/check-deviations.md).

# Confirm context with grep

When scanning files using `grep`, besides `-n` to give you line numbers, use these for confirming context:
```
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
```
