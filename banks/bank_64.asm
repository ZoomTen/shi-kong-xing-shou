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
Layout_064_4028::
	db MAPTYPE_G5_01
	INCBIN "data/maps/layouts/Layout_064_4028.bin"
Blocks_064_4137::
	INCBIN "data/maps/blocks/Blocks_064_4137.bin"
Layout_064_43ef::
	db MAPTYPE_G5_02
	INCBIN "data/maps/layouts/Layout_064_43ef.bin"
; tile-index data (NOT 2bpp gfx: 8-byte non-tile-aligned); unreferenced
TileIndex_064_44a7::
	db $78, $47, $85, $86, $87, $88, $89, $98
; tile-index data (NOT 2bpp gfx: 8-byte non-tile-aligned); unreferenced
TileIndex_064_44af::
	db $99, $9a, $9b, $9c, $0f, $79, $08, $7a
; tile-index data (NOT 2bpp gfx: 26-byte non-tile-aligned); unreferenced
TileIndex_064_44b7::
	db $7b, $8a, $8b, $15, $43, $8c, $1f, $9d, $9e, $9f, $a0, $7c, $7d, $20, $7e, $20
	db $8d, $8e, $15, $15, $8f, $24, $a1, $a2, $20, $a3
Metatiles_064_44d1::
	INCBIN "data/maps/metatiles/Metatiles_064_44d1.bin"
; tile-index data (NOT 2bpp gfx: 8-byte non-tile-aligned); unreferenced
TileIndex_064_44d4::
	db $04, $05, $07, $06, $08, $09, $0b, $0a
; tile-index data (NOT 2bpp gfx: 15-byte non-tile-aligned); unreferenced
TileIndex_064_44dc::
	db $0c, $0d, $0f, $0e, $10, $11, $13, $12, $14, $11, $16, $15, $17, $18, $1a
; tile-index data (NOT 2bpp gfx: 15-byte non-tile-aligned); unreferenced
TileIndex_064_44eb::
	db $19, $1b, $1c, $1a, $1d, $1b, $1c, $1e, $1d, $1f, $18, $1e, $19, $1f, $20
; tile-index data (NOT 2bpp gfx: 22-byte non-tile-aligned); unreferenced
TileIndex_064_44fa::
	db $21, $15, $22, $23, $13, $24, $22, $23, $16, $25, $25, $25, $25, $24, $17, $20
	db $25, $12, $25, $25, $21, $25
; tile-index data (NOT 2bpp gfx: 22-byte non-tile-aligned); unreferenced
TileIndex_064_4510::
	db $14, $26, $28, $27, $29, $2a, $2c, $2b, $2d, $25, $25, $25, $2e, $25, $25, $2f
	db $25, $11, $16, $12, $25, $23
; tile-index data (NOT 2bpp gfx: 15-byte non-tile-aligned); unreferenced
TileIndex_064_4526::
	db $13, $25, $14, $30, $32, $31, $33, $34, $36, $35, $37, $25, $15, $25, $25
; tile-index data (NOT 2bpp gfx: 15-byte non-tile-aligned); unreferenced
TileIndex_064_4535::
	db $22, $25, $25, $25, $20, $25, $15, $17, $25, $21, $24, $22, $38, $3a, $39
; tile-index data (NOT 2bpp gfx: 15-byte non-tile-aligned); unreferenced
TileIndex_064_4544::
	db $3b, $3c, $3e, $3d, $3f, $30, $41, $40, $42, $43, $41, $44, $42, $43, $41
; tile-index data (NOT 2bpp gfx: 246-byte non-tile-aligned); unreferenced
TileIndex_064_4553::
	db $45, $42, $25, $25, $25, $25, $3c, $47, $46, $48, $49, $4b, $4a, $4a, $4c, $4e
	db $4d, $4f, $50, $52, $51, $53, $54, $56, $55, $57, $25, $25, $16, $17, $25, $12
	db $25, $14, $30, $41, $44, $42, $34, $36, $49, $4b, $30, $41, $49, $4b, $3c, $47
	db $4a, $48, $25, $15, $24, $17, $23, $16, $2f, $25, $34, $36, $44, $37, $30, $3c
	db $40, $46, $47, $41, $48, $42, $30, $32, $4a, $33, $43, $3a, $44, $3b, $30, $3a
	db $44, $3b, $3c, $3e, $4a, $3f, $23, $16, $24, $17, $3c, $3e, $49, $4b, $34, $36
	db $4a, $37, $3c, $47, $49, $4b, $43, $47, $44, $48, $38, $3a, $44, $3b, $23, $16
	db $25, $2e, $30, $41, $30, $32, $30, $30, $40, $31, $32, $41, $33, $42, $43, $30
	db $44, $31, $32, $3c, $33, $46, $47, $30, $48, $31, $36, $41, $4a, $42, $3c, $47
	db $44, $48, $43, $36, $45, $37, $38, $3a, $4a, $3b, $30, $41, $4a, $42, $43, $36
	db $44, $37, $30, $32, $44, $33, $43, $3e, $44, $3f, $11, $16, $12, $2e, $22, $25
	db $24, $17, $22, $21, $25, $14, $22, $25, $2f, $25, $25, $15, $25, $2e, $43, $3e
	db $45, $3f, $43, $32, $44, $33, $43, $3a, $45, $3b, $25, $25, $2f, $2e, $43, $32
	db $45, $33, $20, $21, $12, $14, $22, $21, $24, $22, $05, $07, $06, $08, $05, $07
	db $06, $08, $05, $07, $06, $08, $05, $07, $06, $08, $05, $07, $06, $08, $05, $07
	db $06, $08, $05, $07, $06, $08
Blocks_064_4649::
	INCBIN "data/maps/blocks/Blocks_064_4649.bin"
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
Layout_064_4a3d::
	db MAPTYPE_G5_03
	INCBIN "data/maps/layouts/Layout_064_4a3d.bin"
Blocks_064_4aa2::
	INCBIN "data/maps/blocks/Blocks_064_4aa2.bin"
Layout_064_4bda::
	db MAPTYPE_G5_04
	INCBIN "data/maps/layouts/Layout_064_4bda.bin"
Blocks_064_4c3f::
	INCBIN "data/maps/blocks/Blocks_064_4c3f.bin"
Layout_064_4d8b::
	db MAPTYPE_G5_05
	INCBIN "data/maps/layouts/Layout_064_4d8b.bin"
Blocks_064_4df0::
	INCBIN "data/maps/blocks/Blocks_064_4df0.bin"
Layout_064_4f18::
	db MAPTYPE_G5_06
	INCBIN "data/maps/layouts/Layout_064_4f18.bin"
Metatiles_064_4f7d::
	INCBIN "data/maps/metatiles/Metatiles_064_4f7d.bin"
Blocks_064_507d::
	INCBIN "data/maps/blocks/Blocks_064_507d.bin"
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
Layout_064_52bd::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_52bd.bin"
Metatiles_064_5396::
	INCBIN "data/maps/metatiles/Metatiles_064_5396.bin"
Blocks_064_5546::
	INCBIN "data/maps/blocks/Blocks_064_5546.bin"
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
Layout_064_597c::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_597c.bin"
Blocks_064_59f5::
	INCBIN "data/maps/blocks/Blocks_064_59f5.bin"
Layout_064_5b1d::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_5b1d.bin"
Blocks_064_5b66::
	INCBIN "data/maps/blocks/Blocks_064_5b66.bin"
Layout_064_5c12::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_5c12.bin"
Blocks_064_5c8b::
	INCBIN "data/maps/blocks/Blocks_064_5c8b.bin"
Layout_064_5da7::
	db MAPTYPE_G5_0B
	INCBIN "data/maps/layouts/Layout_064_5da7.bin"
Blocks_064_5e20::
	INCBIN "data/maps/blocks/Blocks_064_5e20.bin"
Layout_064_5f48::
	db MAPTYPE_G5_0C
	INCBIN "data/maps/layouts/Layout_064_5f48.bin"
Blocks_064_5fc1::
	INCBIN "data/maps/blocks/Blocks_064_5fc1.bin"
Layout_064_611d::
	db MAPTYPE_G5_0D
	INCBIN "data/maps/layouts/Layout_064_611d.bin"
Metatiles_064_6166::
	INCBIN "data/maps/metatiles/Metatiles_064_6166.bin"
Blocks_064_6242::
	INCBIN "data/maps/blocks/Blocks_064_6242.bin"
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
Layout_064_6417::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_6417.bin"
Metatiles_064_6436::
	INCBIN "data/maps/metatiles/Metatiles_064_6436.bin"
Blocks_064_64fa::
	INCBIN "data/maps/blocks/Blocks_064_64fa.bin"
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
Layout_064_666b::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_666b.bin"
Blocks_064_668a::
	INCBIN "data/maps/blocks/Blocks_064_668a.bin"
Layout_064_66ea::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_66ea.bin"
Metatiles_064_6709::
	INCBIN "data/maps/metatiles/Metatiles_064_6709.bin"
Blocks_064_67dd::
	INCBIN "data/maps/blocks/Blocks_064_67dd.bin"
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
Layout_064_699a::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_699a.bin"
Blocks_064_69b9::
	INCBIN "data/maps/blocks/Blocks_064_69b9.bin"
Layout_064_6a15::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_6a15.bin"
Blocks_064_6a48::
	INCBIN "data/maps/blocks/Blocks_064_6a48.bin"
Layout_064_6a90::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_6a90.bin"
Blocks_064_6aaf::
	INCBIN "data/maps/blocks/Blocks_064_6aaf.bin"
Layout_064_6b0f::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_6b0f.bin"
Blocks_064_6b2e::
	INCBIN "data/maps/blocks/Blocks_064_6b2e.bin"
Layout_064_6b86::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_6b86.bin"
Metatiles_064_6ba5::
	INCBIN "data/maps/metatiles/Metatiles_064_6ba5.bin"
Blocks_064_6cad::
	INCBIN "data/maps/blocks/Blocks_064_6cad.bin"
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
Layout_064_6e24::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_6e24.bin"
Metatiles_064_6e7f::
	INCBIN "data/maps/metatiles/Metatiles_064_6e7f.bin"
Blocks_064_6f4b::
	INCBIN "data/maps/blocks/Blocks_064_6f4b.bin"
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
Layout_064_710e::
	db MAPTYPE_G5_17
	INCBIN "data/maps/layouts/Layout_064_710e.bin"
Blocks_064_7169::
	INCBIN "data/maps/blocks/Blocks_064_7169.bin"
Layout_064_7259::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_7259.bin"
Metatiles_064_7278::
	INCBIN "data/maps/metatiles/Metatiles_064_7278.bin"
Blocks_064_734c::
	INCBIN "data/maps/blocks/Blocks_064_734c.bin"
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
Layout_064_74b1::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_74b1.bin"
Metatiles_064_74d6::
	INCBIN "data/maps/metatiles/Metatiles_064_74d6.bin"
Blocks_064_7592::
	INCBIN "data/maps/blocks/Blocks_064_7592.bin"
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
Layout_064_771a::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_771a.bin"
Metatiles_064_7739::
	INCBIN "data/maps/metatiles/Metatiles_064_7739.bin"
Blocks_064_7801::
	INCBIN "data/maps/blocks/Blocks_064_7801.bin"
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
Layout_064_7967::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_7967.bin"
Blocks_064_79b0::
	INCBIN "data/maps/blocks/Blocks_064_79b0.bin"
Layout_064_7a50::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_064_7a50.bin"
Metatiles_064_7a99::
	INCBIN "data/maps/metatiles/Metatiles_064_7a99.bin"
Blocks_064_7b15::
	INCBIN "data/maps/blocks/Blocks_064_7b15.bin"
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
