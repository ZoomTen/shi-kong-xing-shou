# General

Purpose of disassembly: build code base that compiles 1:1 with base ROM (baserom.gbc), but easy understand + edit via macros, constants, clear code, clear RAM addresses, character maps.

Goal: kill all `dr`, make compilation **accurate** to original baserom. So "better code" = non-goal.

* No `git commit` yourself. I check work manually, commit myself.
* Comments minimum.
* Most concise possible, even when thinking.
* This disassembly; no try be wise.
  * No optimize.
  * No split functions willy-nilly.
  * No inline where not inlined.
  * Code may be subpar, but must 100% match base ROM.
* Only be wise about: turn raw numbers into meaningful constants + labels.
* Prefer systematic search-replace over carpet-bomb `sed`. Gives time to analyze.
* Along way, analyze + suggest replacement names for "partially-documented" labels. Stuff like Func_ asm_ unk_. (see Style guide)
* For unk_ data, analyze + recommend keyword (also see Style guide)
* Try decipher local `.asm` label meanings too.

# Compilation

Check if compiled ROM match base ROM:
```sh
make compare
```

Checks syntax + equality with base ROM in one go.

Inspect *which* bytes deviate: try `utils/check_diff` / `utils/look_block` (see [check deviations](docs/agents/check-deviations.md)) FIRST.

# Line endings

Text files (`.asm` etc.) are **CRLF** — enforced by `.gitattributes` (`* text=auto eol=crlf`; repo stores LF, checks out CRLF). Automated edits that write LF (e.g. Python `'\n'.join()`) flip the working tree.

So **after `make compare` returns `OK`, verify line endings**: `git ls-files --eol <edited files>` must show `w/crlf` — re-convert any LF flips back to CRLF before finishing. Never leave a whole-file EOL diff.

# Determining un-disassembled blocks

Marked by `dr` macro (see [macros](macros/data.asm)) in ROM offset form. Some calc may need to get Game Boy address.

`dr` ALWAYS points ROM address, not RAM.

# Resolve a bare address before assuming it's unlabeled

Hit bare ROM/RAM address (`call`/`jp`/`ld` target, pointer-table entry, etc.)? Resolve with `utils/get_nearest_symbol.py <bank:addr>` (add `ram` for RAM) FIRST. Result like `Func_026_4012 + 200` = 200 bytes past nearest label (which symbol it under) — open file there to see if that `dr` block or already-disassembled code. See [find closest label/symbol](docs/agents/find-closest-label-or-symbol.md).

Before coining label, run two greps:
1. *Address* already named? Resolve it (`get_nearest_symbol.py`), reuse symbol.
2. *Name* you about to use (e.g. `MoveName_Pointers`) already taken for different address? `grep` across `banks/`, `wram.asm`, `home/`.

Potential conflict? STOP + prompt me — no silent rename or shadow. If address sits inside existing `dr`, split that `dr` to expose label. Leave single-line `; TODO` above. One line max. See [disassemble from scratch](docs/agents/disassemble-from-scratch.md).

# Labels & symbols

Every `call`/`jp`/`jr` operand + every RAM access (`ld [wXXXX]`) **must** resolve to label — no bare `$XXXX` left. (Exception: `jp $c000`-style jumps into WRAM.)

16-bit pointer hi byte = `wFoo + 1`, **not** separate `wBar`/`wFooHi`, unless that byte also accessed independently. See [code patterns](docs/agents/code-patterns.md) — recurring asm patterns (`hl = $XXYY + a`, farcalls, etc.).

Promoting `.asm_` local to global across function boundaries: iterate to fixpoint — other locals may be orphaned, need promoting too.

Rename `wdxxx` → `wSomething`: alias first, audit all usages, then substitute. See [ram address identification](docs/agents/ram-address-identification.md).

Naming conventions + keywords (`Layout`, `Pointers`, `GFX`, etc.): see [style guide](docs/agents/style-guide.md) — asm/symbol/keyword conventions (repo's `ok` criteria).

# Encoding pitfalls

**Little-endian**: `fa d8 d9` = `ld a, [$d9d8]`, NOT `$d8d9`. Verify with `utils/check_sym.py`.

**`ld` vs `ldh`**: render by opcode, never by address. `ea a6 ff` = `ld [$ffa6]` (3 bytes), NOT `ldh [$ffa6]` (2 bytes). See [check deviations](docs/agents/check-deviations.md) — finding byte/symbol deviations.

**`rst $30` = `FarCall`**: `ld hl, X` / `ld b, BANK` / `rst $30` → `farcall X` when label exists at `X`.

**Duplicate glyphs**: do NOT tidy `db` back into `text` glyph — `make compare` will break. See [reading strings](docs/agents/reading-strings.md) — Chinese in-game string encoding.

# Graphics & assets

**Never** `INCBIN` a `.2bpp` — `make clean` deletes them. Extract to PNG with `rgbgfx -r X`, commit PNG. See [disassemble from scratch](docs/agents/disassemble-from-scratch.md) §4a.

Text `.txt`, map `.tmx`, face `.ora` asset formats: see [extra asset formats](docs/agents/extra-asset-formats.md).

Map headers, warps, object events, metatiles: see [overworld data](docs/agents/overworld-data.md).

# Ghidra workflow

Run `python3 utils/ghidra2asm.py <file>` on buffer; use output as base.

Never revert script-derived labels back to Ghidra raw labels.

Prefer absolute labels over relative until `make compare` passes. See [ghidra usage](docs/agents/ghidra-usage.md) — Ghidra MCP + `ghidra2asm.py` workflow.

# Deviations

No diffing scripts — use `utils/look_block` + `utils/check_diff` (see [check deviations](docs/agents/check-deviations.md)) with standard tools. Write script only with very good reason.

Ignore mismatches at `14e`/`14f` — GB checksums, always differ when anything else changes.

`call` parameter differs? Check if target function shifted. See [check deviations](docs/agents/check-deviations.md).

# Confirm context with grep

Scanning files with `grep`: besides `-n` for line numbers, use these to confirm context:
```
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
```