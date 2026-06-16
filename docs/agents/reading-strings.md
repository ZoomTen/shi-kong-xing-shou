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
