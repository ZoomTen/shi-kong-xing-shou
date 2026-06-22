G5_01_MapAttributes:
	map_attr_data \
		18, 15, \
		Layout_064_4028, Blocks_064_4137, Metatiles_064_44d1, AttrMap_064_48ed, \
		Palettes_064_4946, \
		0, Tileset_006_44a7, \
		Collision_064_498e
G5_02_MapAttributes:
	map_attr_data \
		15, 15, \
		Layout_064_43ef, Blocks_064_4649, Metatiles_064_44d1, AttrMap_064_48ed, \
		Palettes_064_4946, \
		0, Tileset_006_44a7, \
		Collision_064_498e
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_4028::
	dr $190028, $190137
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_4137::
	dr $190137, $1903ef
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_43ef::
	dr $1903ef, $1904a7
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_44a7::
	dr $1904a7, $1904af
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_44af::
	dr $1904af, $1904b7
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_44b7::
	dr $1904b7, $1904d1
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_44d1::
	dr $1904d1, $1904d4
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_44d4::
	dr $1904d4, $1904dc
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_44dc::
	dr $1904dc, $1904eb
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_44eb::
	dr $1904eb, $1904fa
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_44fa::
	dr $1904fa, $190510
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_4510::
	dr $190510, $190526
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_4526::
	dr $190526, $190535
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_4535::
	dr $190535, $190544
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_4544::
	dr $190544, $190553
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
Tileset_064_4553::
	dr $190553, $190649
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_4649::
	dr $190649, $1908ed
AttrMap_064_48ed::
INCBIN "gfx/attrmaps/attrmap_064_48ed.bin"
Palettes_064_4946::
	RGB 31, 31, 29
	RGB 20, 25, 28
	RGB 8, 14, 17
	RGB 0, 0, 0
	RGB 26, 30, 31
	RGB 11, 23, 31
	RGB 5, 14, 25
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 26, 0
	RGB 29, 10, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 20, 25, 28
	RGB 5, 14, 25
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 29, 30
	RGB 23, 16, 31
	RGB 13, 7, 25
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
Collision_064_498e::
	INCBIN "data/maps/collision/Collision_064_498e.bin"
G5_03_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_064_4a3d, Blocks_064_4aa2, Metatiles_064_4f7d, AttrMap_064_51d5, \
		Palettes_064_5220, \
		0, Tileset_006_44af, \
		Collision_064_5268
G5_04_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_064_4bda, Blocks_064_4c3f, Metatiles_064_4f7d, AttrMap_064_51d5, \
		Palettes_064_5220, \
		0, Tileset_006_44af, \
		Collision_064_5268
G5_05_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_064_4d8b, Blocks_064_4df0, Metatiles_064_4f7d, AttrMap_064_51d5, \
		Palettes_064_5220, \
		0, Tileset_006_44af, \
		Collision_064_5268
G5_06_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_064_4f18, Blocks_064_507d, Metatiles_064_4f7d, AttrMap_064_51d5, \
		Palettes_064_5220, \
		0, Tileset_006_44af, \
		Collision_064_5268
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_4a3d::
	dr $190a3d, $190aa2
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_4aa2::
	dr $190aa2, $190bda
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_4bda::
	dr $190bda, $190c3f
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_4c3f::
	dr $190c3f, $190d8b
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_4d8b::
	dr $190d8b, $190df0
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_4df0::
	dr $190df0, $190f18
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_4f18::
	dr $190f18, $190f7d
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_4f7d::
	dr $190f7d, $19107d
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_507d::
	dr $19107d, $1911d5
AttrMap_064_51d5::
INCBIN "gfx/attrmaps/attrmap_064_51d5.bin"
Palettes_064_5220::
	RGB 31, 28, 25
	RGB 31, 15, 0
	RGB 24, 0, 0
	RGB 0, 0, 0
	RGB 25, 31, 27
	RGB 14, 21, 15
	RGB 4, 9, 3
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 20, 20, 20
	RGB 10, 10, 10
	RGB 0, 0, 0
	RGB 29, 29, 19
	RGB 22, 22, 12
	RGB 13, 13, 4
	RGB 0, 0, 0
	RGB 31, 22, 24
	RGB 21, 13, 17
	RGB 11, 4, 7
	RGB 0, 0, 0
	RGB 24, 26, 28
	RGB 12, 18, 24
	RGB 4, 8, 12
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
Collision_064_5268::
	INCBIN "data/maps/collision/Collision_064_5268.bin"
G5_07_MapAttributes:
	map_attr_data \
		18, 12, \
		Layout_064_52bd, Blocks_064_5546, Metatiles_064_5396, AttrMap_064_57ae, \
		Palettes_064_584f, \
		0, Tileset_006_44b7, \
		Collision_064_5897
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_52bd::
	dr $1912bd, $191396
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_5396::
	dr $191396, $191546
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_5546::
	dr $191546, $1917ae
AttrMap_064_57ae::
INCBIN "gfx/attrmaps/attrmap_064_57ae.bin"
Palettes_064_584f::
	RGB 31, 30, 29
	RGB 23, 23, 28
	RGB 10, 10, 15
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 11, 26, 22
	RGB 0, 11, 11
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 31, 18, 28
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 24, 24, 20
	RGB 13, 13, 9
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
Collision_064_5897::
	INCBIN "data/maps/collision/Collision_064_5897.bin"
G5_08_MapAttributes:
	map_attr_data \
		12, 10, \
		Layout_064_597c, Blocks_064_59f5, Metatiles_064_6166, AttrMap_064_630e, \
		Palettes_064_6383, \
		0, Tileset_006_44d4, \
		Collision_064_63cb
G5_09_MapAttributes:
	map_attr_data \
		6, 12, \
		Layout_064_5b1d, Blocks_064_5b66, Metatiles_064_6166, AttrMap_064_630e, \
		Palettes_064_6383, \
		0, Tileset_006_44d4, \
		Collision_064_63cb
G5_0A_MapAttributes:
	map_attr_data \
		10, 12, \
		Layout_064_5c12, Blocks_064_5c8b, Metatiles_064_6166, AttrMap_064_630e, \
		Palettes_064_6383, \
		0, Tileset_006_44d4, \
		Collision_064_63cb
G5_0B_MapAttributes:
	map_attr_data \
		10, 12, \
		Layout_064_5da7, Blocks_064_5e20, Metatiles_064_6166, AttrMap_064_630e, \
		Palettes_064_6383, \
		0, Tileset_006_44d4, \
		Collision_064_63cb
G5_0C_MapAttributes:
	map_attr_data \
		12, 10, \
		Layout_064_5f48, Blocks_064_5fc1, Metatiles_064_6166, AttrMap_064_630e, \
		Palettes_064_6383, \
		0, Tileset_006_44d4, \
		Collision_064_63cb
G5_0D_MapAttributes:
	map_attr_data \
		6, 12, \
		Layout_064_611d, Blocks_064_6242, Metatiles_064_6166, AttrMap_064_630e, \
		Palettes_064_6383, \
		0, Tileset_006_44d4, \
		Collision_064_63cb
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_597c::
	dr $19197c, $1919f5
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_59f5::
	dr $1919f5, $191b1d
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_5b1d::
	dr $191b1d, $191b66
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_5b66::
	dr $191b66, $191c12
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_5c12::
	dr $191c12, $191c8b
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_5c8b::
	dr $191c8b, $191da7
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_5da7::
	dr $191da7, $191e20
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_5e20::
	dr $191e20, $191f48
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_5f48::
	dr $191f48, $191fc1
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_5fc1::
	dr $191fc1, $19211d
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_611d::
	dr $19211d, $192166
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_6166::
	dr $192166, $192242
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_6242::
	dr $192242, $19230e
AttrMap_064_630e::
INCBIN "gfx/attrmaps/attrmap_064_630e.bin"
Palettes_064_6383::
	RGB 26, 31, 28
	RGB 0, 22, 30
	RGB 0, 9, 22
	RGB 0, 0, 0
	RGB 26, 30, 20
	RGB 12, 22, 10
	RGB 7, 12, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 21, 24, 21
	RGB 12, 12, 12
	RGB 0, 0, 0
	RGB 24, 27, 31
	RGB 13, 20, 25
	RGB 8, 12, 19
	RGB 0, 0, 0
	RGB 30, 30, 21
	RGB 26, 15, 13
	RGB 13, 4, 10
	RGB 0, 0, 0
	RGB 24, 27, 31
	RGB 31, 21, 0
	RGB 12, 12, 12
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
Collision_064_63cb::
	INCBIN "data/maps/collision/Collision_064_63cb.bin"
G5_0E_MapAttributes:
G6_2B_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_6417, Blocks_064_64fa, Metatiles_064_6436, AttrMap_064_655a, \
		Palettes_064_65c9, \
		0, Tileset_006_44dc, \
		Collision_064_6611
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_6417::
	dr $192417, $192436
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_6436::
	dr $192436, $1924fa
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_64fa::
	dr $1924fa, $19255a
AttrMap_064_655a::
INCBIN "gfx/attrmaps/attrmap_064_655a.bin"
Palettes_064_65c9::
	RGB 31, 31, 29
	RGB 29, 24, 0
	RGB 15, 11, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 15, 21, 30
	RGB 0, 11, 31
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 26, 0
	RGB 29, 10, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 21, 21, 15
	RGB 11, 11, 7
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 19, 19, 27
	RGB 8, 8, 14
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
Collision_064_6611::
	INCBIN "data/maps/collision/Collision_064_6611.bin"
G5_0F_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_666b, Blocks_064_668a, Metatiles_064_6709, AttrMap_064_6841, \
		Palettes_064_68b8, \
		0, Tileset_006_44eb, \
		Collision_064_6900
G5_10_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_66ea, Blocks_064_67dd, Metatiles_064_6709, AttrMap_064_6841, \
		Palettes_064_68b8, \
		0, Tileset_006_44eb, \
		Collision_064_6900
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_666b::
	dr $19266b, $19268a
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_668a::
	dr $19268a, $1926ea
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_66ea::
	dr $1926ea, $192709
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_6709::
	dr $192709, $1927dd
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_67dd::
	dr $1927dd, $192841
AttrMap_064_6841::
INCBIN "gfx/attrmaps/attrmap_064_6841.bin"
Palettes_064_68b8::
	RGB 31, 31, 29
	RGB 26, 20, 20
	RGB 15, 9, 9
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 14, 23, 29
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 23, 23
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 26, 26, 21
	RGB 12, 12, 8
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
Collision_064_6900::
	INCBIN "data/maps/collision/Collision_064_6900.bin"
G5_11_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_699a, Blocks_064_69b9, Metatiles_064_6ba5, AttrMap_064_6ce9, \
		Palettes_064_6d85, \
		0, Tileset_006_44fa, \
		Collision_064_6dcd
G5_12_MapAttributes:
	map_attr_data \
		10, 5, \
		Layout_064_6a15, Blocks_064_6a48, Metatiles_064_6ba5, AttrMap_064_6ce9, \
		Palettes_064_6d85, \
		0, Tileset_006_44fa, \
		Collision_064_6dcd
G5_13_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_6a90, Blocks_064_6aaf, Metatiles_064_6ba5, AttrMap_064_6ce9, \
		Palettes_064_6d85, \
		0, Tileset_006_44fa, \
		Collision_064_6dcd
G5_14_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_6b0f, Blocks_064_6b2e, Metatiles_064_6ba5, AttrMap_064_6ce9, \
		Palettes_064_6d85, \
		0, Tileset_006_44fa, \
		Collision_064_6dcd
G5_15_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_6b86, Blocks_064_6cad, Metatiles_064_6ba5, AttrMap_064_6ce9, \
		Palettes_064_6d85, \
		0, Tileset_006_44fa, \
		Collision_064_6dcd
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_699a::
	dr $19299a, $1929b9
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_69b9::
	dr $1929b9, $192a15
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_6a15::
	dr $192a15, $192a48
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_6a48::
	dr $192a48, $192a90
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_6a90::
	dr $192a90, $192aaf
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_6aaf::
	dr $192aaf, $192b0f
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_6b0f::
	dr $192b0f, $192b2e
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_6b2e::
	dr $192b2e, $192b86
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_6b86::
	dr $192b86, $192ba5
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_6ba5::
	dr $192ba5, $192cad
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_6cad::
	dr $192cad, $192ce9
AttrMap_064_6ce9::
INCBIN "gfx/attrmaps/attrmap_064_6ce9.bin"
Palettes_064_6d85::
	RGB 31, 31, 29
	RGB 22, 26, 26
	RGB 11, 15, 15
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 14, 23, 29
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 23, 23
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 26, 26, 21
	RGB 12, 12, 8
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
Collision_064_6dcd::
	INCBIN "data/maps/collision/Collision_064_6dcd.bin"
G5_16_MapAttributes:
	map_attr_data \
		18, 5, \
		Layout_064_6e24, Blocks_064_6f4b, Metatiles_064_6e7f, AttrMap_064_6fd7, \
		Palettes_064_706a, \
		0, Tileset_006_4510, \
		Collision_064_70b2
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_6e24::
	dr $192e24, $192e7f
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_6e7f::
	dr $192e7f, $192f4b
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_6f4b::
	dr $192f4b, $192fd7
AttrMap_064_6fd7::
INCBIN "gfx/attrmaps/attrmap_064_6fd7.bin"
Palettes_064_706a::
	RGB 31, 31, 29
	RGB 22, 26, 26
	RGB 11, 15, 15
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 14, 23, 29
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 23, 23
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 26, 26, 21
	RGB 12, 12, 8
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
Collision_064_70b2::
	INCBIN "data/maps/collision/Collision_064_70b2.bin"
G5_17_MapAttributes:
	map_attr_data \
		18, 5, \
		Layout_064_710e, Blocks_064_7169, Metatiles_064_7278, AttrMap_064_73b0, \
		Palettes_064_741f, \
		0, Tileset_006_4526, \
		Collision_064_7467
G5_18_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_7259, Blocks_064_734c, Metatiles_064_7278, AttrMap_064_73b0, \
		Palettes_064_741f, \
		0, Tileset_006_4526, \
		Collision_064_7467
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_710e::
	dr $19310e, $193169
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_7169::
	dr $193169, $193259
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_7259::
	dr $193259, $193278
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_7278::
	dr $193278, $19334c
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_734c::
	dr $19334c, $1933b0
AttrMap_064_73b0::
INCBIN "gfx/attrmaps/attrmap_064_73b0.bin"
Palettes_064_741f::
	RGB 31, 31, 29
	RGB 24, 20, 20
	RGB 14, 10, 10
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 17, 31
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 26, 0
	RGB 29, 10, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 21, 21, 18
	RGB 11, 11, 8
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 10, 22, 28
	RGB 0, 9, 14
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
Collision_064_7467::
	INCBIN "data/maps/collision/Collision_064_7467.bin"
G5_19_MapAttributes:
	map_attr_data \
		6, 6, \
		Layout_064_74b1, Blocks_064_7592, Metatiles_064_74d6, AttrMap_064_7612, \
		Palettes_064_768e, \
		0, Tileset_006_4535, \
		Collision_064_76d6
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_74b1::
	dr $1934b1, $1934d6
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_74d6::
	dr $1934d6, $193592
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_7592::
	dr $193592, $193612
AttrMap_064_7612::
INCBIN "gfx/attrmaps/attrmap_064_7612.bin"
Palettes_064_768e::
	RGB 31, 30, 29
	RGB 20, 20, 25
	RGB 10, 10, 15
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 20, 27, 6
	RGB 6, 14, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 31, 15, 15
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 24, 24, 20
	RGB 13, 13, 9
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
Collision_064_76d6::
	INCBIN "data/maps/collision/Collision_064_76d6.bin"
G5_1A_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_064_771a, Blocks_064_7801, Metatiles_064_7739, AttrMap_064_7865, \
		Palettes_064_78c4, \
		0, Tileset_006_4544, \
		Collision_064_790c
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_771a::
	dr $19371a, $193739
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_7739::
	dr $193739, $193801
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_7801::
	dr $193801, $193865
AttrMap_064_7865::
INCBIN "gfx/attrmaps/attrmap_064_7865.bin"
Palettes_064_78c4::
	RGB 31, 30, 29
	RGB 20, 20, 25
	RGB 10, 10, 15
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 20, 27, 6
	RGB 6, 14, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 31, 15, 15
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 24, 24, 20
	RGB 13, 13, 9
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
Collision_064_790c::
	INCBIN "data/maps/collision/Collision_064_790c.bin"
G5_1B_MapAttributes:
	map_attr_data \
		12, 6, \
		Layout_064_7967, Blocks_064_79b0, Metatiles_064_7a99, AttrMap_064_7bd5, \
		Palettes_064_7c40, \
		0, Tileset_006_4553, \
		Collision_064_7c88
G5_1C_MapAttributes:
	map_attr_data \
		6, 12, \
		Layout_064_7a50, Blocks_064_7b15, Metatiles_064_7a99, AttrMap_064_7bd5, \
		Palettes_064_7c40, \
		0, Tileset_006_4553, \
		Collision_064_7c88
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_7967::
	dr $193967, $1939b0
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_79b0::
	dr $1939b0, $193a50
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_064_7a50::
	dr $193a50, $193a99
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_064_7a99::
	dr $193a99, $193b15
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_064_7b15::
	dr $193b15, $193bd5
AttrMap_064_7bd5::
INCBIN "gfx/attrmaps/attrmap_064_7bd5.bin"
Palettes_064_7c40::
	RGB 31, 30, 28
	RGB 22, 24, 26
	RGB 9, 11, 14
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 18, 25, 12
	RGB 0, 12, 8
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 19, 25, 10
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 21, 20, 17
	RGB 11, 10, 8
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
Collision_064_7c88::
	INCBIN "data/maps/collision/Collision_064_7c88.bin"
