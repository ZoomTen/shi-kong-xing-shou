# Reading Chinese in-game strings

Here's an example for item names.

```
text_1e_4fa3::
	text "強", 0
	text "力"
	text "膠", 1
	text "囊"
	text_return
```
1. `強` located in character set 0.
2. `力` no character set specifier, so still 0.
3. `膠` located in character set 1.
4. `囊` no character set specifier, so still 1.

The source file may be located in the same directory just with a .txt extension. Here's its equivalent:

```
@org $1e, $4fa3:
	text "強力膠囊";
	return;
```

Because of this unique encoding, it is a bespoke format extracted with @utils/dump_text.py and compiled back using @tools/tx_parse.py.

## Pointer-table text (mon names, move names, descriptions)

When the text is reached through a pointer table (each entry → one string), rip it
with @utils/rip_text_table.py — one `@org` per unique pointer target, decoding each
string to its first terminator:
```sh
python3 utils/rip_text_table.py <bank_hex> <table_gb_hex> <n_entries> > data/text/foo.txt
```
Then point the table's `dw`s at the generated `text_BB_AAAA` labels and `INCLUDE`
the compiled `.asm` (the `.asm` is gitignored; commit the `.txt`).

## Duplicate glyphs (round-trip hazard)

A few glyphs are defined twice in `charmap.asm` (e.g. `振` = `$a4`/`$a5`, also
`螯`, `淚`, `桀`). RGBDS resolves `text "<glyph>"` to the **last live** `charmap`
definition, so only that one byte round-trips from a plain `text`. Any other byte
for the same glyph — including a commented-out definition like `振 $a5` — must be
written as a raw `db` to reproduce exactly:
```
	text "性格暴躁、";
	db $f9, $0f; #"桀"     ; non-canonical 桀 ($0f); canonical is $10
	db $10; #"桀"          ; bare byte after a db must also stay raw
	text "不馴…";
```
`dump_text.py` / `rip_text_table.py` emit these `db`s automatically (they read
commented charmap lines too, so they can still *decode* the alias). They also `db`
a **redundant charset switch** (`fN` to the charset already active) — tx_parse's
auto-detect would drop it, shifting every following byte. Do NOT "tidy" a `db` back
into a `text` glyph; `make compare` will break.
