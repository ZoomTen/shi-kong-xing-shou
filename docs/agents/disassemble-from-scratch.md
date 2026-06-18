# Disassembling function from scratch

Use when NOT given Ghidra dump (cf. [ghidra usage](ghidra-usage.md)), asked to disassemble `dr` block or chase its refs.

## 0. Triage: which `dr` blocks are low-hanging code

`dr` likely *code* when:
* Carry `Func_`/`asm_` label.
* Decode no illegal opcodes, end on terminator (`ret`/`reti`/`jp`/`jr`/`rst`).

`utils/slopdis.py` = repo-aware SM83 disassembler (decode + symbol resolution; shares `utils/lib/gbtool.py`). Addresses as `bank:addr` or raw ROM offset + bank arg:
```sh
python3 utils/slopdis.py <bank:start> <bank:end>     # e.g. 05:576c 05:5900
python3 utils/slopdis.py <rom_start> <rom_end> <bank> # e.g. 1576c 15900 05
```
* Resolves RAM/HRAM operands, in-bank + home call/jump targets, emits `.asm_XXXX` locals for internal jumps, applies repo style (uppercase hex, single-operand ALU, `[hli]`/`[hld]`, strict `ld`/`ldh` by opcode).
* Ignores `Parent.local` symbols already in `.sym` → re-run on partial block regenerates `.asm_` clean.
* Paste stdout over `dr` line, verify `make compare`.

Boundary detection: after unconditional terminator (`ret`/`reti`/`jp`/`jr`/`jp hl`) whose next byte nothing jumps to, emit speculative `unk_BB_AAAA:` (or real symbol) — byte unreachable by fall-through = likely function→function or function→data boundary. (`rst` not terminator — most vectors e.g. FarCall return.) This spots code→data transition inside one `dr` (e.g. `Func_026_4012` ends at `ret`, pointer tables follow).

Data-smell warnings → **stderr** (stays out of stdout, clean paste survives). Strong signals (each fires alone): illegal/undefined opcodes, stray SP ops (`ld sp`/`add sp`), long run of `ld r, r` ($40-$7f raw bytes). Weak "no terminator" note appended only after strong signal (alone false-positives on fall-through code). Warnings present → `dr` probably data (pointer table/text/gfx); classify per §2-4, don't paste asm.

Pitfalls (all break `make compare`):
* **Little-endian**: `fa d8 d9` = `ld a, [$d9d8]`, NOT `$d8d9`. Verify [ram address identification](ram-address-identification.md) / `check_sym.py`.
* **`ld`/`ldh` switcheroo**: `ea a6 ff` = `ld [hFFA6]` (3 bytes), NOT `ldh [hFFA6]` (2 bytes). Render by opcode, never address.
* **`rst $30` = `FarCall`** (call `b:hl`): `ld hl, X` / `ld b, BANK` / `rst $30` → `farcall X` if label at `X`, else `rst FarCall`.

`wXXXX` vs `wXXXX + N`: high-byte write to `$d9db` → render `wd9da + 1` if `wd9da` named and it's 2nd half of 16-bit value (tell: consecutive writes `wd9da` then `wd9da + 1`). But `+ 2`/`+ 3` writes = struct filled field-by-field → keep offsets relative to base (`wd9da`), consider naming base. Don't coin `wd9db` just because instruction touches it.

## 1. Follow calls

List function's `call`/`jp` targets. Any resolving to raw `$XXXX`, or to `Func_`/`asm_` still `dr` = trapped code, next-round candidate.

**Every `call`/`jp`/`jr` operand AND every RAM-touching `ld` operand MUST resolve to real label — no bare `$XXXX`.** Raw addresses assemble (may even byte-match) but hide control flow.
* RAM: `get_nearest_symbol.py <addr> ram`. Result `wFoo + N` where `wFoo` is `ds 1` (so `$addr` outside it) → coin label in `wram.asm`, split `ds` gap (see `wXXXX + N` rule).
* Code in-bank: target lands inside function as `.asm_` local or known global; point instruction there. If inside `dr`, split to expose label (§3a).
* Exceptions: 16-bit constant used immediately for arithmetic (`ld hl, wTilemap + 200`) fine as `label + offset`; `ld sp, $FFFE`-style SP-init stays bare; `jp $c000` into WRAM stays bare (real RAM entry).

**Cross-scope local ref → promote.** `call`/`jp`/`jr` to a `.asm_` local in a *different* global scope: rgbds locals only visible in their enclosing global, so promote to global (`Func_BB_AAAA`).
* Promotion splits function → can **orphan** other locals across new boundary. Promote those too, iterate to fixpoint (tangled dispatch may need several).
* Mechanically: rename `.asm_AAAA` → `Func_BB_AAAA` (def + refs), add `:` to def, replace bare `$AAAA` operands. Bytes unchanged → `make compare` stays `OK` iff every ref still resolves.

Locate address — [find closest label/symbol](find-closest-label-or-symbol.md):
```sh
python3 utils/get_nearest_symbol.py <bank:addr>        # ROM
python3 utils/get_nearest_symbol.py <bank:addr> ram    # RAM
```
`Func_026_4012 + 200` = 200 bytes past nearest label; does NOT say `dr` vs disassembled. Open file there to see which.

## 2. Does it operate on data?

Tell = load of `$4000`..`$7fff` into pointer register:
```
	ld de, $40E2        ; base of an in-bank table
	ld a, [wSomeIndex]
	ld l, a
	ld h, $00
	add hl, hl          ; *2 -> word (dw) entries
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a             ; hl = pointer read from the table
	call PrintMenuText
```
`ld bc, $XXXX` + `add hl, bc` to reach struct field = same tell (see [code patterns](code-patterns.md)).

## 3. Inspect how data access

Access shape:
* `base + index*2` then deref → **pointer table** (`dw` list).
* deref again → **pointer-to-pointer table**.
* `base + index*N` no deref → **fixed-stride struct/record array**.

Lean on legible symbols: index register often names table (e.g. `wd9d8` loaded from `wEnemyMonSpecies`; sibling routine indexes `MonNamePointers` by same value → this table also per-something). Confirm by dumping targets:
```sh
python3 utils/dump_text.py <bank:addr> <count>   # if the pointers reach text
```
Real strings (e.g. Chinese move names) → text pointer table. Nonsense home-bank labels → "pointers" are packed data, different table type.

## 3a. Splitting `dr` to expose label

Found data often sits *inside* larger `dr` with no symbol (e.g. `$40E2` = `Func_026_4012 + 208`). Split into before / labelled region / after. `dr` end exclusive → addresses chain with no gap:
```
Func_026_4012:
	dr $98012, $980e2     ; everything before the table
MoveName_Pointers:
	dw $4200, ...         ; the decoded region, now labelled
MoveName_Text:
	dr $98200, $985b9     ; everything after
```
`dr` takes ROM offsets; label at boundary. Verify `make compare` — wrong split shifts bytes, fails immediately.

**Before coining label, grep name:**
1. *Address* already named? Resolve (`get_nearest_symbol.py`, §1) — reuse that symbol.
2. *Name* already taken? `grep` it across `banks/`, `wram.asm`, `home/`. Exists for different address → **stop and prompt user**; don't rename or shadow.

## 4. Name it

Per [style guide](style-guide.md):
* Purpose known → **documented** name, keyword after underscore: `dw` move-name list → `MoveName_Pointers`; its strings mirror `MonNamePointers` → `text_BB_AAAA`.
* Usage known, purpose unclear → **partially documented** `Keyword_BB_AAAA` (e.g. `Pointers_026_40DA`).
* Neither → `unk_BB_AAAA` (data) or `Func_`/`asm_` (code).

Table keywords: `Pointers` (data/unknown), `Jumptable` (to code). Pointed-to data: `Text`/`String`, `GFX`, `Palette`, etc.

Name states purpose (`PersonalityDesc_Pointers`) → add NO comment, name is the doc. Comment only for `; TODO` or non-obvious fact (address-keyed `Func_`/`unk_` whose name says nothing).

Whenever introducing an address-keyed label (promoted boundary, split `dr`, named still-`dr` region) and you know *roughly* what it does, leave SHORT single-sentence `; TODO` above it — e.g. `; TODO: loads a monster's palette into wPaletteBuffer`. One line per label. Applies to leftover named `dr` too.

## 4a. Graphics data: extract PNG, not 2bpp INCBIN

`dr` is tile graphics → **do not** `INCBIN` `.2bpp` (`make clean` deletes all `.2bpp` build artifacts, work vanishes). Extract to PNG via rgbgfx reverse mode; build re-compiles PNG → `.2bpp`:
```sh
rgbgfx -r X -o something.2bpp something.png   # X = tiles per row
```
Try `X = 16`, step down (8, 4, … 1) until image reads correct. Commit PNG.

## 5. Verify

`make compare` (see CLAUDE.md) must say `OK`. Localize mismatch with `utils/check_diff` / `utils/look_block` (see [check deviations](check-deviations.md)). Wrong `wXXXX` symbol surfaces via `utils/check_sym.py shi_kong_xing_shou.sym`.
