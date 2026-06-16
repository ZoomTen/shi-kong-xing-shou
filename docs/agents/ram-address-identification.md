# RAM address identification

To rename `wdxxx` to `wSomething`:

1. Make an alias.
```diff
+wSomething::
 wdxxx:: ds 1
```
2. Check for all usages of `wdxxx`.
3. Substitute `wdxxx` for `wSomething` only if you're confident enough that that is indeed how it's used.
