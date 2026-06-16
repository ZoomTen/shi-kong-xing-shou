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

# Agent docs

Read these on-demand when the task calls for it:

* [check deviations](docs/agents/check-deviations.md) — finding byte/symbol deviations from the base ROM
* [code patterns](docs/agents/code-patterns.md) — recurring asm patterns (`hl = $XXYY + a`, farcalls, etc.)
* [disassemble from scratch](docs/agents/disassemble-from-scratch.md) — triage + disassemble a `dr` block when no Ghidra dump is given, and chase what it references
* [extra asset formats](docs/agents/extra-asset-formats.md) — text `.txt`, map `.tmx`, face `.ora` formats
* [find closest label/symbol](docs/agents/find-closest-label-or-symbol.md) — `get_nearest_symbol.py` usage
* [ghidra usage](docs/agents/ghidra-usage.md) — Ghidra MCP + `ghidra2asm.py` workflow
* [overworld data](docs/agents/overworld-data.md) — map definitions, headers, events, attributes
* [ram address identification](docs/agents/ram-address-identification.md) — renaming `wdxxx` → `wSomething`
* [reading strings](docs/agents/reading-strings.md) — Chinese in-game string encoding
* [style guide](docs/agents/style-guide.md) — asm/symbol/keyword conventions (the repo's `ok` criteria)

# Compilation

To determine if the compiled ROM matches the base ROM:
```sh
/home/user/projects/ngbenv/ngbenv exec make compare
```

This checks the syntax and determines equality with the base ROM in one go.

To inspect *which* bytes deviate from the base ROM, try `utils/check_diff` / `utils/look_block` (see [check deviations](docs/agents/check-deviations.md)) FIRST.

# Determining un-disassembled blocks

Indicated by a `dr` macro (see @macros/data.asm) in ROM offset form. Some calculation may be required to determine its Game Boy address.

`dr` ALWAYS points to a ROM address, not RAM.

You can also use `utils/look_block` (see [check deviations](docs/agents/check-deviations.md)) in conjunction with standard tools to simply look at blocks from either baserom.gbc or the compiled counterpart.

# Resolve a bare address before assuming it's unlabeled

Whenever you encounter a bare ROM/RAM address (a `call`/`jp`/`ld` target, a pointer-table entry, etc.), resolve it with `utils/get_nearest_symbol.py <bank:addr>` (add `ram` for RAM) FIRST. A result like `Func_026_4012 + 200` tells you it's 200 bytes past the nearest label (which symbol it falls under) — open the file there to see whether that's a `dr` block or already-disassembled code. See [find closest label/symbol](docs/agents/find-closest-label-or-symbol.md).

# Confirm context with grep

When scanning files using `grep`, besides `-n` to give you line numbers, use these for confirming context:
```
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
```