; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_4000:
	dr $5c000, $5c014

; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_4014::
	dr $5c014, $5c028

; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_4028::
	dr $5c028, $5c03c

; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_403c::
	dr $5c03c, $5c050

; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_4050::
	dr $5c050, $5c74b

; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_474b::
	dr $5c74b, $5c75f

; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_475f::
	dr $5c75f, $5ca09

; TODO: map_attr_data record - exposes Layout/Blocks/etc. labels in binary (TMX cascade)
MapAttributes_017_4a09::
	dr $5ca09, $5ccae

BlueMoon_MapAttributes::
	map_attr_data \
		6, 10, \
		Layout_017_4cc2, Blocks_017_4df7, Metatiles_017_4cff, AttrMap_017_4ebf, \
		Palettes_017_4f17, \
		0, Tileset_006_410f, \
		Collision_017_4f5f
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_017_4cc2::
	dr $5ccc2, $5ccff
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_017_4cff::
	dr $5ccff, $5cdf7
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_017_4df7::
	dr $5cdf7, $5cebf
AttrMap_017_4ebf::
INCBIN "gfx/attrmaps/attrmap_017_4ebf.bin"
Palettes_017_4f17::
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 4, 25
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
Collision_017_4f5f::
	INCBIN "data/maps/collision/Collision_017_4f5f.bin"

; TODO: 2bpp graphics - extract to PNG (rgbgfx)
gfx_017_4f9e::
	dr $5cf9e, $5d11e

; TODO: 2bpp graphics - extract to PNG (rgbgfx)
gfx_017_511e::
	dr $5d11e, $5d12e

gfx_017_512e::
INCBIN "gfx/tilesets/image_17_512e.2bpp"

gfx_017_578e::
INCBIN "gfx/tilesets/image_17_578e.2bpp"

gfx_017_5c1e::
INCBIN "gfx/tilesets/image_17_5c1e.2bpp"

gfx_017_612e::
	INCBIN "gfx/tilesets/gfx_017_612e.2bpp"

gfx_017_66ce::
	INCBIN "gfx/tilesets/gfx_017_66ce.2bpp"

gfx_017_680e::
INCBIN "gfx/tilesets/image_17_680e.2bpp"

gfx_017_6cae::
	INCBIN "gfx/tilesets/gfx_017_6cae.2bpp"
gfx_017_6e2e::
	INCBIN "gfx/tilesets/gfx_017_6e2e.2bpp"
gfx_017_739e::
	INCBIN "gfx/tilesets/gfx_017_739e.2bpp"
gfx_017_783e::
	INCBIN "gfx/tilesets/gfx_017_783e.2bpp"

