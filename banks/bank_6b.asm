GFX_06b_4000:: ; map tileset graphics
	INCBIN "gfx/tilesets/gfx_06b_4000.2bpp"
gfx_06b_4080::
	INCBIN "gfx/tilesets/gfx_06b_4080.2bpp"
gfx_06b_4360::
	INCBIN "gfx/tilesets/gfx_06b_4360.2bpp"
gfx_06b_43c0::
	INCBIN "gfx/tilesets/gfx_06b_43c0.2bpp"
gfx_06b_47b0::
	INCBIN "gfx/tilesets/gfx_06b_47b0.2bpp"
gfx_06b_4850::
	INCBIN "gfx/tilesets/gfx_06b_4850.2bpp"
gfx_06b_48c0::
	INCBIN "gfx/tilesets/gfx_06b_48c0.2bpp"
gfx_06b_4be0::
	INCBIN "gfx/tilesets/gfx_06b_4be0.2bpp"
gfx_06b_4ca0::
	INCBIN "gfx/tilesets/gfx_06b_4ca0.2bpp"
gfx_06b_52b0::
	INCBIN "gfx/tilesets/gfx_06b_52b0.2bpp"
gfx_06b_55c0::
	INCBIN "gfx/tilesets/gfx_06b_55c0.2bpp"
gfx_06b_5aa0::
	INCBIN "gfx/tilesets/gfx_06b_5aa0.2bpp"
gfx_06b_5b20::
	INCBIN "gfx/tilesets/gfx_06b_5b20.2bpp"
gfx_06b_5be0::
	INCBIN "gfx/tilesets/gfx_06b_5be0.2bpp"
gfx_06b_5db0::
	INCBIN "gfx/tilesets/gfx_06b_5db0.2bpp"
gfx_06b_61e0::
	INCBIN "gfx/tilesets/gfx_06b_61e0.2bpp"
G6_2A_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_06b_6524, Blocks_06b_65f3, Metatiles_06b_6543, AttrMap_06b_6633, \
		Palettes_06b_6699, \
		0, Tileset_006_4648, \
		Collision_06b_66d1
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_06b_6524::
	dr $1ae524, $1ae543
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_06b_6543::
	dr $1ae543, $1ae5f3
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_06b_65f3::
	dr $1ae5f3, $1ae633
AttrMap_06b_6633::
INCBIN "gfx/attrmaps/attrmap_06b_6633.bin"
Palettes_06b_6699::
	RGB 31, 31, 31
	RGB 0, 27, 31
	RGB 0, 12, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 22, 22, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 16, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 13, 28, 23
	RGB 0, 16, 12
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 18, 31, 0
	RGB 0, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 25, 18, 12
	RGB 17, 11, 4
	RGB 0, 0, 0
	RGB 25, 22, 31
	RGB 16, 13, 23
	RGB 7, 4, 14
	RGB 0, 0, 0
Collision_06b_66d1::
	INCBIN "data/maps/collision/Collision_06b_66d1.bin"
gfx_06b_66fe::
	INCBIN "gfx/tilesets/gfx_06b_66fe.2bpp"
G6_2C_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_06b_6d62, Blocks_06b_6e21, Metatiles_06b_6d81, AttrMap_06b_6e55, \
		Palettes_06b_6ec5, \
		0, Tileset_006_4650, \
		Collision_06b_6f0d
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_06b_6d62::
	dr $1aed62, $1aed81
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_06b_6d81::
	dr $1aed81, $1aee21
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_06b_6e21::
	dr $1aee21, $1aee55
AttrMap_06b_6e55::
INCBIN "gfx/attrmaps/attrmap_06b_6e55.bin"
Palettes_06b_6ec5::
	RGB 31, 31, 31
	RGB 18, 31, 0
	RGB 5, 19, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 14, 11, 31
	RGB 10, 5, 20
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 22, 31
	RGB 0, 12, 25
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
Collision_06b_6f0d::
	INCBIN "data/maps/collision/Collision_06b_6f0d.bin"
gfx_06b_6f35::
	INCBIN "gfx/tilesets/gfx_06b_6f35.2bpp"
gfx_06b_7635::
	INCBIN "gfx/tilesets/gfx_06b_7635.2bpp"
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
