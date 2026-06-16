# Extra asset formats

* `data/text/*.txt`
  * This is a custom plaintext format whose purpose is to neatly preprocess Chinese text.
  * The encoding used is UTF-8.
  * Its commands align with the macros in `macros/scripts/text.asm`, each command separated with a semicolon.
  * `@org` directives get compiled to an auto-generated label, unless a custom label is specified in parentheses e.g. `@org $08, $4542 (House_CutsceneText1):`.
  * You can use `utils/dump_text.py` to generate scripts in this format from the ROM.
  * These files are compiled using `tools/tx_parse.py`.
* `data/maps/**/*.tmx`
  * Since we aren't currently able to create a bespoke map editor, we settled on using `tmx` for now.
  * This is an XML-based format, and can be opened using [TilEd](https://www.mapeditor.org/), which is a general purpose tilemap editor.
  * Maps can be ripped manually from the ROM, then using any of the `utils/*2tmx.py` scripts to convert them to the appropriate format.
  * They are compiled back using `tools/tmx2data.py`.
* `gfx/faces/*.ora`
  * `ora` is a trivial layered image format used where pixel management isn't too much of a concern. It's used to store both the (background) and GBC (sprites & palettes) graphics data for dialog faces.
  * These files can be opened using GIMP, Pinta (maybe Paint.NET?) or Krita. MyPaint is **not** recommended, as it will resize the canvas. From the bottom:
	* A color map which consists of 8 colors from left to right at the top left corner of the canvas. These colors must be the ONLY colors used in the two layers immediately above it. All other pixels are ignored.
	* The background graphics. This is the only graphics shown when playing the game on DMG or SGB, so it should be coherent. It uses the **first** 4 colors of the color map.
	* The sprite graphics. These graphics are overlaid on top of the background graphics for additional colors when played on GBC. It uses the **last** 4 colors of the color map.
	* The merged image. This will not be processed, but it serves as a file preview image.
