# RAM address identification

To rename `wdxxx` to `wSomething`:

1. Make an alias.
```diff
+wSomething::
 wdxxx:: ds 1
```
2. Check for all usages of `wdxxx`.
3. Substitute `wdxxx` for `wSomething` only if you're confident enough that that is indeed how it's used.

## Verifying a symbol resolves to the right address

When disassembling, a `ld [wXXXX]` / `ld a, [wXXXX]` must resolve to the exact
address the bytes encode. Watch for little-endian: `fa d8 d9` is `ld a, [$d9d8]`
(low byte first), NOT `$d8d9`.

After building, run:
```sh
utils/check_sym.py shi_kong_xing_shou.sym
```
It compares each symbol against the address claimed in the `.sym` comment and
flags any `DOES NOT MATCH!`. Use this to catch a `wXXXX` that points to the
wrong cell before chasing a `make compare` byte deviation.
