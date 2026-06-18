# RAM address identification

To rename `wdxxx` to `wSomething`:

1. Make alias.
```diff
+wSomething::
 wdxxx:: ds 1
```
2. Check all usages of `wdxxx`.
3. Swap `wdxxx` for `wSomething` only if confident that how it used.

## Verifying a symbol resolves to the right address

When disassembling, `ld [wXXXX]` / `ld a, [wXXXX]` must resolve to exact address bytes encode. Watch little-endian: `fa d8 d9` is `ld a, [$d9d8]` (low byte first), NOT `$d8d9`.

After building, run:
```sh
utils/check_sym.py shi_kong_xing_shou.sym
```
Compares each symbol against address claimed in `.sym` comment, flags any `DOES NOT MATCH!`. Use to catch `wXXXX` pointing to wrong cell before chasing `make compare` byte deviation.