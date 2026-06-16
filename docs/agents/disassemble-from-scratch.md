# Disassembling a function from scratch

Use this when you are NOT given a Ghidra text dump (cf. [ghidra usage](ghidra-usage.md))
and are asked to disassemble a `dr` block, or to chase down what one references.

## 0. Triage: which `dr` blocks are low-hanging code

A `dr` block is likely *code* (vs. data) when:
* It already carries a `Func_`/`asm_` label (prior analysis flagged it as code).
* Its bytes decode with no illegal opcodes and end on a terminator
  (`ret`/`reti`/`jp`/`jr`/`rst`).

`utils/slopdis.py` is a repo-aware SM83 disassembler that does both — decode and
symbol resolution (it shares `utils/lib/gbtool.py` with the other utils). Run it on
a range, addresses as `bank:addr` (or raw ROM offset + a bank arg):
```sh
python3 utils/slopdis.py <bank:start> <bank:end>     # e.g. 05:576c 05:5900
python3 utils/slopdis.py <rom_start> <rom_end> <bank> # e.g. 1576c 15900 05
```
It resolves RAM/HRAM operands, in-bank + home call/jump targets, emits `.asm_XXXX`
local labels for internal jumps, and applies repo style (uppercase hex literals,
single-operand ALU ops, `[hli]`/`[hld]`, `ld` vs `ldh` strictly by opcode). Local
(`Parent.local`) symbols already in the `.sym` are ignored when resolving targets,
so re-running on a partly-done block regenerates `.asm_` labels cleanly.
Paste its output (stdout) over the `dr` line, then verify with `make compare`.

It also prints heuristic warnings to **stderr** when a block smells like data
rather than code. Strong signals (each fires on its own): illegal/undefined
opcodes, stray stack-pointer ops (`ld sp` / `add sp`), or a long run of `ld r, r`
(raw bytes in $40-$7f). A weak "doesn't end on a terminator" note is appended only
when a strong signal already fired — on its own it would false-positive on a code
function that legitimately falls through into the next. Real code disassembles
clean. If you see warnings, the `dr` is probably data (a pointer table, text, gfx)
— don't paste the asm; classify it per steps 2-4 instead. (stderr stays out of
stdout, so piping to a file still gives a clean paste.)

Pitfalls (all confirmed to break `make compare`):
* **Little-endian**: `fa d8 d9` is `ld a, [$d9d8]`, NOT `$d8d9`. Verify with
  [ram address identification](ram-address-identification.md) / `check_sym.py`.
* **`ld`/`ldh` switcheroo**: `ea a6 ff` is `ld [hFFA6]` (3 bytes), NOT
  `ldh [hFFA6]` (2 bytes). Render by opcode, never by address.
* **`rst $30` is `FarCall`** (calls `b:hl`). `ld hl, X` / `ld b, BANK` / `rst $30`
  collapses to `farcall X` when a label exists at `X`, else `rst FarCall`.

## 1. Follow the calls

After disassembling, list the function's `call`/`jp` targets. If any resolves to
a raw `$XXXX` (no label) or to another `Func_`/`asm_` that is still a `dr`, that
callee is trapped code — a candidate for the next round.

To find where an address lives, use [find closest label/symbol](find-closest-label-or-symbol.md):
```sh
python3 utils/get_nearest_symbol.py <bank:addr>        # ROM
python3 utils/get_nearest_symbol.py <bank:addr> ram    # RAM
```
A result like `Func_026_4012 + 200` tells you the address is 200 bytes past the
nearest label — that's where it sits in the source, but it does NOT say whether
the region is a `dr` block or already-disassembled code. Open the file at that
label to see which.

## 2. Does it operate on data?

The telltale sign is a load of a `$4000`..`$7fff` address into a pointer register:
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
`ld bc, $XXXX` + `add hl, bc` to reach a struct field is the same tell (see
[code patterns](code-patterns.md)).

## 3. Inspect how the data is accessed

Classify the access shape:
* `base + index*2`, then deref → **pointer table** (`dw` list).
* deref again after the first → **pointer-to-pointer table**.
* `base + index*N` with no deref → **fixed-stride struct/record array**.

Lean on already-legible symbols. The index register often names the table: e.g.
`wd9d8` is loaded from `wEnemyMonSpecies` elsewhere, and a sibling routine indexes
`MonNamePointers` by the same value — so a second table indexed by `wd9d8` holds
per-something text too. Confirm by dumping the targets:
```sh
python3 utils/dump_text.py <bank:addr> <count>   # if the pointers reach text
```
If they decode to real strings (e.g. Chinese move names), it's a text pointer
table. If they decode to nonsense home-bank labels, the "pointers" are really
packed data — a different table type.

## 4. Name it

Per the [style guide](style-guide.md):
* Purpose now known → **documented** name with the right keyword after an
  underscore: a `dw` list of move-name pointers → `MoveName_Pointers`; its strings
  mirror the existing `MonNamePointers` → `text_BB_AAAA` convention.
* How-it's-used known but purpose unclear → **partially documented**
  `Keyword_BB_AAAA` (e.g. `Pointers_026_40DA`).
* Neither known → `unk_BB_AAAA` (data) or `Func_`/`asm_` (code).

Keywords for tables: `Pointers` (data/unknown pointers), `Jumptable` (pointers to
code). For the pointed-to data: `Text`/`String` (dialog/immediate line), `GFX`,
`Palette`, etc.

## 5. Verify

`make compare` (see CLAUDE.md) must say `OK`. To localize a mismatch use
`utils/check_diff` / `utils/look_block` (see [check deviations](check-deviations.md)).
A wrong `wXXXX` symbol surfaces via `utils/check_sym.py shi_kong_xing_shou.sym`.
