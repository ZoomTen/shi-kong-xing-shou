G4_01_MapAttributes:
	map_attr_data \
		12, 12, \
		Layout_053_4050, Blocks_053_40e1, Metatiles_053_4698, AttrMap_053_48cc, \
		Palettes_053_4950, \
		0, Tileset_006_42e8, \
		Collision_053_4998

G4_02_MapAttributes:
	map_attr_data \
		12, 12, \
		Layout_053_4275, Blocks_053_4306, Metatiles_053_4698, AttrMap_053_48cc, \
		Palettes_053_4950, \
		0, Tileset_006_42e8, \
		Collision_053_4998

G4_03_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_44a2, Blocks_053_4507, Metatiles_053_4698, AttrMap_053_48cc, \
		Palettes_053_4950, \
		0, Tileset_006_42e8, \
		Collision_053_4998

G4_04_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_4633, Blocks_053_47d4, Metatiles_053_4698, AttrMap_053_48cc, \
		Palettes_053_4950, \
		0, Tileset_006_42e8, \
		Collision_053_4998
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_4050::
	dr $14c050, $14c0e1
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_40e1::
	dr $14c0e1, $14c275
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_4275::
	dr $14c275, $14c306
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_4306::
	dr $14c306, $14c4a2
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_44a2::
	dr $14c4a2, $14c507
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_4507::
	dr $14c507, $14c633
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_4633::
	dr $14c633, $14c698
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_4698::
	dr $14c698, $14c7d4
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_47d4::
	dr $14c7d4, $14c8cc
AttrMap_053_48cc::
INCBIN "gfx/attrmaps/attrmap_053_48cc.bin"
Palettes_053_4950::
	RGB 31, 30, 31
	RGB 25, 25, 25
	RGB 19, 17, 19
	RGB 13, 11, 13
	RGB 31, 27, 22
	RGB 31, 15, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 26, 29, 27
	RGB 18, 20, 18
	RGB 10, 12, 11
	RGB 0, 3, 0
	RGB 28, 27, 31
	RGB 20, 17, 26
	RGB 12, 10, 21
	RGB 0, 0, 0
	RGB 28, 29, 31
	RGB 18, 23, 30
	RGB 7, 14, 21
	RGB 0, 0, 0
	RGB 31, 23, 18
	RGB 24, 14, 10
	RGB 13, 6, 2
	RGB 0, 1, 0
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
; TODO: collision binary - INCBIN .bin
Collision_053_4998::
	dr $14c998, $14c9e8

G4_05_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_053_49fc, Blocks_053_4aaf, Metatiles_053_4a1b, AttrMap_053_4b1f, \
		Palettes_053_4b9e, \
		0, Tileset_006_42f7, \
		Collision_053_4be6
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_49fc::
	dr $14c9fc, $14ca1b
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_4a1b::
	dr $14ca1b, $14caaf
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_4aaf::
	dr $14caaf, $14cb1f
AttrMap_053_4b1f::
INCBIN "gfx/attrmaps/attrmap_053_4b1f.bin"
Palettes_053_4b9e::
	RGB 31, 30, 31
	RGB 25, 25, 25
	RGB 19, 17, 19
	RGB 13, 11, 13
	RGB 31, 27, 22
	RGB 31, 15, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 26, 29, 27
	RGB 18, 20, 18
	RGB 10, 12, 11
	RGB 0, 3, 0
	RGB 28, 27, 31
	RGB 20, 17, 26
	RGB 12, 10, 21
	RGB 0, 0, 0
	RGB 28, 29, 31
	RGB 18, 23, 30
	RGB 7, 14, 21
	RGB 0, 0, 0
	RGB 31, 23, 18
	RGB 24, 14, 10
	RGB 13, 6, 2
	RGB 0, 1, 0
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
; TODO: collision binary - INCBIN .bin
Collision_053_4be6::
	dr $14cbe6, $14cc0c

G4_06_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_4c70, Blocks_053_4cd5, Metatiles_053_5103, AttrMap_053_5253, \
		Palettes_053_528d, \
		0, Tileset_006_42ff, \
		Collision_053_52d5

G4_07_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_4d81, Blocks_053_4de6, Metatiles_053_5103, AttrMap_053_5253, \
		Palettes_053_528d, \
		0, Tileset_006_42ff, \
		Collision_053_52d5

G4_08_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_4e7a, Blocks_053_4edf, Metatiles_053_5103, AttrMap_053_5253, \
		Palettes_053_528d, \
		0, Tileset_006_42ff, \
		Collision_053_52d5

G4_09_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_4fa3, Blocks_053_5008, Metatiles_053_5103, AttrMap_053_5253, \
		Palettes_053_528d, \
		0, Tileset_006_42ff, \
		Collision_053_52d5

G4_0A_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_053_50e4, Blocks_053_51fb, Metatiles_053_5103, AttrMap_053_5253, \
		Palettes_053_528d, \
		0, Tileset_006_42ff, \
		Collision_053_52d5
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_4c70::
	dr $14cc70, $14ccd5
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_4cd5::
	dr $14ccd5, $14cd81
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_4d81::
	dr $14cd81, $14cde6
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_4de6::
	dr $14cde6, $14ce7a
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_4e7a::
	dr $14ce7a, $14cedf
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_4edf::
	dr $14cedf, $14cfa3
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_4fa3::
	dr $14cfa3, $14d008
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_5008::
	dr $14d008, $14d0e4
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_50e4::
	dr $14d0e4, $14d103
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_5103::
	dr $14d103, $14d1fb
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_51fb::
	dr $14d1fb, $14d253
AttrMap_053_5253::
INCBIN "gfx/attrmaps/attrmap_053_5253.bin"
Palettes_053_528d::
	RGB 31, 31, 31
	RGB 31, 31, 4
	RGB 31, 6, 0
	RGB 0, 0, 0
	RGB 24, 31, 31
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 23, 12
	RGB 27, 13, 4
	RGB 17, 5, 0
	RGB 0, 0, 0
	RGB 24, 31, 16
	RGB 17, 31, 9
	RGB 10, 22, 6
	RGB 0, 0, 0
	RGB 29, 29, 18
	RGB 25, 25, 9
	RGB 17, 17, 4
	RGB 0, 0, 0
	RGB 30, 30, 27
	RGB 24, 25, 19
	RGB 18, 18, 13
	RGB 9, 9, 2
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
; TODO: collision binary - INCBIN .bin
Collision_053_52d5::
	dr $14d2d5, $14d315

G4_0B_MapAttributes:
G4_45_MapAttributes:
	map_attr_data \
		12, 12, \
		Layout_053_5329, Blocks_053_54aa, Metatiles_053_53ba, AttrMap_053_5656, \
		Palettes_053_56d6, \
		0, Tileset_006_4324, \
		Collision_053_571e
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_5329::
	dr $14d329, $14d3ba
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_53ba::
	dr $14d3ba, $14d4aa
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_54aa::
	dr $14d4aa, $14d656
AttrMap_053_5656::
INCBIN "gfx/attrmaps/attrmap_053_5656.bin"
Palettes_053_56d6::
	RGB 31, 30, 28
	RGB 28, 23, 14
	RGB 14, 11, 6
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 19, 25, 11
	RGB 7, 13, 0
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 8, 21, 25
	RGB 0, 10, 17
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 24, 10
	RGB 21, 10, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 17, 31
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 27, 27, 21
	RGB 15, 15, 10
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
; TODO: collision binary - INCBIN .bin
Collision_053_571e::
	dr $14d71e, $14d75b

G4_0C_MapAttributes:
G7_03_MapAttributes:
G4_44_MapAttributes:
	map_attr_data \
		12, 5, \
		Layout_053_576f, Blocks_053_583c, Metatiles_053_57ac, AttrMap_053_58b0, \
		Palettes_053_5906, \
		0, Tileset_006_4333, \
		Collision_053_594e
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_576f::
	dr $14d76f, $14d7ac
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_57ac::
	dr $14d7ac, $14d83c
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_583c::
	dr $14d83c, $14d8b0
AttrMap_053_58b0::
INCBIN "gfx/attrmaps/attrmap_053_58b0.bin"
Palettes_053_5906::
	RGB 31, 30, 28
	RGB 27, 25, 18
	RGB 18, 14, 9
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 19, 26, 11
	RGB 6, 13, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 8, 26, 31
	RGB 0, 11, 30
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 24, 10
	RGB 21, 10, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 27, 25, 21
	RGB 0, 15, 30
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 20, 27, 27
	RGB 8, 14, 14
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
; TODO: collision binary - INCBIN .bin
Collision_053_594e::
	dr $14d94e, $14d973

G4_0D_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_5987, Blocks_053_5aa8, Metatiles_053_59ec, AttrMap_053_5c10, \
		Palettes_053_5cb1, \
		0, Tileset_006_4342, \
		Collision_053_5cf9
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_5987::
	dr $14d987, $14d9ec
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_59ec::
	dr $14d9ec, $14daa8
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_5aa8::
	dr $14daa8, $14dc10
AttrMap_053_5c10::
INCBIN "gfx/attrmaps/attrmap_053_5c10.bin"
Palettes_053_5cb1::
	RGB 29, 31, 31
	RGB 28, 23, 14
	RGB 8, 12, 6
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 17, 25, 10
	RGB 10, 15, 0
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 22, 25, 26
	RGB 10, 14, 15
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 31, 24, 10
	RGB 21, 10, 0
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 31, 17, 31
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 0, 22, 31
	RGB 0, 8, 22
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
; TODO: collision binary - INCBIN .bin
Collision_053_5cf9::
	dr $14dcf9, $14dd29

G4_0E_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_053_5d3d, Blocks_053_5e2a, Metatiles_053_5da2, AttrMap_053_5f9a, \
		Palettes_053_6004, \
		0, Tileset_006_4358, \
		Collision_053_604c
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_5d3d::
	dr $14dd3d, $14dda2
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_5da2::
	dr $14dda2, $14de2a
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_5e2a::
	dr $14de2a, $14df9a
AttrMap_053_5f9a::
INCBIN "gfx/attrmaps/attrmap_053_5f9a.bin"
Palettes_053_6004::
	RGB 29, 31, 31
	RGB 28, 23, 14
	RGB 8, 12, 6
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 17, 25, 10
	RGB 10, 15, 0
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 22, 25, 26
	RGB 10, 14, 15
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 31, 24, 10
	RGB 21, 10, 0
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 31, 17, 31
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 29, 31, 31
	RGB 0, 22, 31
	RGB 0, 8, 22
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
; TODO: collision binary - INCBIN .bin
Collision_053_604c::
	dr $14e04c, $14e06f

G4_0F_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_053_6083, Blocks_053_61b6, Metatiles_053_60a2, AttrMap_053_6226, \
		Palettes_053_6297, \
		0, Tileset_006_437d, \
		Collision_053_62df
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_6083::
	dr $14e083, $14e0a2
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_60a2::
	dr $14e0a2, $14e1b6
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_61b6::
	dr $14e1b6, $14e226
AttrMap_053_6226::
INCBIN "gfx/attrmaps/attrmap_053_6226.bin"
Palettes_053_6297::
	RGB 31, 31, 29
	RGB 28, 23, 14
	RGB 14, 11, 6
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 18, 16, 26
	RGB 9, 6, 20
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 12, 23, 31
	RGB 0, 10, 21
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 17, 31
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 20, 24, 20
	RGB 10, 14, 10
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
; TODO: collision binary - INCBIN .bin
Collision_053_62df::
	dr $14e2df, $14e325

G4_11_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_053_6361, Blocks_053_6380, Metatiles_053_644a, AttrMap_053_65b2, \
		Palettes_053_664e, \
		0, Tileset_006_4367, \
		Collision_053_6696

G4_12_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_053_63c8, Blocks_053_63e7, Metatiles_053_644a, AttrMap_053_65b2, \
		Palettes_053_664e, \
		0, Tileset_006_4367, \
		Collision_053_6696

G4_13_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_053_642b, Blocks_053_656e, Metatiles_053_644a, AttrMap_053_65b2, \
		Palettes_053_664e, \
		0, Tileset_006_4367, \
		Collision_053_6696
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_6361::
	dr $14e361, $14e380
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_6380::
	dr $14e380, $14e3c8
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_63c8::
	dr $14e3c8, $14e3e7
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_63e7::
	dr $14e3e7, $14e42b
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_642b::
	dr $14e42b, $14e44a
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_644a::
	dr $14e44a, $14e56e
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_656e::
	dr $14e56e, $14e5b2
AttrMap_053_65b2::
INCBIN "gfx/attrmaps/attrmap_053_65b2.bin"
Palettes_053_664e::
	RGB 31, 30, 28
	RGB 21, 23, 14
	RGB 13, 16, 7
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 14, 21, 28
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 23, 23
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 23, 25, 27
	RGB 10, 12, 14
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
; TODO: collision binary - INCBIN .bin
Collision_053_6696::
	dr $14e696, $14e6e0

G4_10_MapAttributes:
	map_attr_data \
		6, 10, \
		Layout_053_66f4, Blocks_053_67bd, Metatiles_053_6731, AttrMap_053_6809, \
		Palettes_053_683d, \
		0, Tileset_006_438c, \
		Collision_053_6885
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_66f4::
	dr $14e6f4, $14e731
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_6731::
	dr $14e731, $14e7bd
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_67bd::
	dr $14e7bd, $14e809
AttrMap_053_6809::
INCBIN "gfx/attrmaps/attrmap_053_6809.bin"
Palettes_053_683d::
	RGB 31, 30, 28
	RGB 27, 25, 18
	RGB 18, 14, 9
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 19, 26, 11
	RGB 6, 13, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 8, 26, 31
	RGB 0, 11, 30
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 24, 10
	RGB 21, 10, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 27, 25, 21
	RGB 0, 15, 30
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 20, 27, 27
	RGB 8, 14, 14
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
; TODO: collision binary - INCBIN .bin
Collision_053_6885::
	dr $14e885, $14e8a9

G4_14_MapAttributes:
	map_attr_data \
		10, 12, \
		Layout_053_68bd, Blocks_053_6a16, Metatiles_053_6936, AttrMap_053_6b5a, \
		Palettes_053_6bf3, \
		0, Tileset_006_439b, \
		Collision_053_6c3b
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_68bd::
	dr $14e8bd, $14e936
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_6936::
	dr $14e936, $14ea16
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_6a16::
	dr $14ea16, $14eb5a
AttrMap_053_6b5a::
INCBIN "gfx/attrmaps/attrmap_053_6b5a.bin"
Palettes_053_6bf3::
	RGB 31, 30, 29
	RGB 25, 22, 18
	RGB 14, 10, 6
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 8, 21, 26
	RGB 0, 8, 21
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 31, 18, 28
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 19, 22, 19
	RGB 9, 12, 9
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
; TODO: collision binary - INCBIN .bin
Collision_053_6c3b::
	dr $14ec3b, $14ec74

G4_4E_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_053_6c88, Blocks_053_6d87, Metatiles_053_6ca7, AttrMap_053_6dfb, \
		Palettes_053_6e6b, \
		0, Tileset_006_4488, \
		Collision_053_6eb3
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_6c88::
	dr $14ec88, $14eca7
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_6ca7::
	dr $14eca7, $14ed87
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_6d87::
	dr $14ed87, $14edfb
AttrMap_053_6dfb::
INCBIN "gfx/attrmaps/attrmap_053_6dfb.bin"
Palettes_053_6e6b::
	RGB 31, 31, 31
	RGB 27, 29, 29
	RGB 27, 29, 29
	RGB 0, 0, 0
	RGB 30, 30, 27
	RGB 25, 23, 19
	RGB 6, 18, 30
	RGB 0, 0, 0
	RGB 30, 30, 27
	RGB 25, 23, 19
	RGB 30, 8, 10
	RGB 0, 0, 0
	RGB 30, 30, 27
	RGB 25, 23, 19
	RGB 14, 13, 11
	RGB 0, 0, 0
	RGB 30, 30, 27
	RGB 14, 25, 8
	RGB 5, 12, 0
	RGB 0, 0, 4
	RGB 30, 30, 27
	RGB 24, 18, 0
	RGB 14, 8, 4
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
; TODO: collision binary - INCBIN .bin
Collision_053_6eb3::
	dr $14eeb3, $14eeec

G4_4F_MapAttributes:
	map_attr_data \
		6, 12, \
		Layout_053_6f00, Blocks_053_6fe5, Metatiles_053_6f49, AttrMap_053_7075, \
		Palettes_053_70ef, \
		0, Tileset_006_4315, \
		Collision_053_7137
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_053_6f00::
	dr $14ef00, $14ef49
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_053_6f49::
	dr $14ef49, $14efe5
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_053_6fe5::
	dr $14efe5, $14f075
AttrMap_053_7075::
INCBIN "gfx/attrmaps/attrmap_053_7075.bin"
Palettes_053_70ef::
	RGB 31, 31, 29
	RGB 21, 21, 15
	RGB 13, 13, 8
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 0, 24, 31
	RGB 0, 10, 24
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 20, 20, 18
	RGB 14, 10, 13
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 17, 31
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 22, 22, 22
	RGB 8, 10, 12
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
; TODO: collision binary - INCBIN .bin
Collision_053_7137::
	dr $14f137, $14f160

