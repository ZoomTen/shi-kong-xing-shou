# Extra asset formats

* `data/text/*.txt`
  * Custom plaintext format. Purpose: neatly preprocess Chinese text.
  * Encoding: UTF-8.
  * Commands align with macros in `macros/scripts/text.asm`, each command separated by semicolon.
  * `@org` directives compile to auto-generated label, unless custom label given in parentheses e.g. `@org $08, $4542 (House_CutsceneText1):`.
  * Use `utils/dump_text.py` to generate scripts in this format from ROM.
  * Compiled via `tools/tx_parse.py`.
* `data/maps/**/*.tmx`
  * No bespoke map editor yet, so use `tmx` for now.
  * XML-based format. Open with [TilEd](https://www.mapeditor.org/), general-purpose tilemap editor.
  * Rip maps manually from ROM, then convert with any `utils/*2tmx.py` script.
  * Compile back via `tools/tmx2data.py`.
* `gfx/faces/*.ora`
  * `ora` = trivial layered image format, used where pixel management not big concern. Stores both (background) and GBC (sprites & palettes) graphics for dialog faces.
  * Open with GIMP, Pinta (maybe Paint.NET?) or Krita. MyPaint **not** recommended — resizes canvas. From bottom:
	* Color map: 8 colors left to right at top-left corner of canvas. These must be ONLY colors used in two layers immediately above. All other pixels ignored.
	* Background graphics. Only graphics shown on DMG or SGB, so keep coherent. Uses **first** 4 colors of color map.
	* Sprite graphics. Overlaid on background for extra colors on GBC. Uses **last** 4 colors of color map.
	* Merged image. Not processed — serves as file preview.