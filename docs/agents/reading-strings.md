# Reading Chinese in-game strings

Example for item names.

```
text_1e_4fa3::
	text "強", 0
	text "力"
	text "膠", 1
	text "囊"
	text_return
```
1. `強` in character set 0.
2. `力` no set specifier, still 0.
3. `膠` in character set 1.
4. `囊` no set specifier, still 1.

Source file maybe same directory, .txt extension. Equivalent:

```
@org $1e, $4fa3:
	text "強力膠囊";
	return;
```

Unique encoding → bespoke format. Extract with @utils/dump_text.py, compile back with @tools/tx_parse.py.

## Pointer-table text (mon names, move names, descriptions)

Text reached through pointer table (each entry → one string). Rip with @utils/rip_text_table.py — one `@org` per unique pointer target, decode each string to first terminator:
```sh
python3 utils/rip_text_table.py <bank_hex> <table_gb_hex> <n_entries> > data/text/foo.txt
```
Then point table's `dw`s at generated `text_BB_AAAA` labels and `INCLUDE` compiled `.asm` (`.asm` gitignored; commit `.txt`).

## Duplicate glyphs (round-trip hazard)

Few glyphs defined twice in `charmap.asm` (e.g. `振` = `$a4`/`$a5`, also `螯`, `淚`, `桀`). RGBDS resolves `text "<glyph>"` to **last live** `charmap` definition, so only that byte round-trips from plain `text`. Any other byte for same glyph — including commented-out definition like `振 $a5` — must be raw `db` to reproduce exact:
```
	text "性格暴躁、";
	db $f9, $0f; #"桀"     ; non-canonical 桀 ($0f); canonical is $10
	db $10; #"桀"          ; bare byte after a db must also stay raw
	text "不馴…";
```
`dump_text.py` / `rip_text_table.py` emit these `db`s automatically (read commented charmap lines too, so still *decode* alias). Also `db` a **redundant charset switch** (`fN` to charset already active) — tx_parse auto-detect would drop it, shifting every following byte. Do NOT "tidy" `db` back into `text` glyph; `make compare` breaks.