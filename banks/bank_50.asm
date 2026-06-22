GreenForestP12_MapAttributes:
	map_attr_data \
		15, 12, \
		Layout_050_4050, Blocks_050_4105, Metatiles_050_4824, AttrMap_050_499c, \
		Palettes_050_4a39, \
		0, Tileset_006_41d0, \
		Collision_050_4a81

GreenForestP21_MapAttributes:
	map_attr_data \
		12, 15, \
		Layout_050_43b1, Blocks_050_4466, Metatiles_050_4824, AttrMap_050_499c, \
		Palettes_050_4a39, \
		0, Tileset_006_41d0, \
		Collision_050_4a81

GreenForestP31_MapAttributes:
	map_attr_data \
		6, 8, \
		Layout_050_4712, Blocks_050_4743, Metatiles_050_4824, AttrMap_050_499c, \
		Palettes_050_4a39, \
		0, Tileset_006_41d0, \
		Collision_050_4a81

G3_1F_MapAttributes:
	map_attr_data \
		6, 8, \
		Layout_050_47f3, Blocks_050_48f0, Metatiles_050_4824, AttrMap_050_499c, \
		Palettes_050_4a39, \
		0, Tileset_006_41d0, \
		Collision_050_4a81
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_4050::
	dr $140050, $140105
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_4105::
	dr $140105, $1403b1
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_43b1::
	dr $1403b1, $140466
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_4466::
	dr $140466, $140712
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_4712::
	dr $140712, $140743
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_4743::
	dr $140743, $1407f3
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_47f3::
	dr $1407f3, $140824
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_4824::
	dr $140824, $1408f0
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_48f0::
	dr $1408f0, $14099c
AttrMap_050_499c::
INCBIN "gfx/attrmaps/attrmap_050_499c.bin"
Palettes_050_4a39::
	RGB 31, 30, 26
	RGB 31, 0, 0
	RGB 20, 23, 14
	RGB 31, 17, 0
	RGB 31, 30, 26
	RGB 21, 25, 6
	RGB 6, 13, 0
	RGB 0, 0, 0
	RGB 30, 30, 29
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 26
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 30, 31, 29
	RGB 22, 23, 18
	RGB 12, 14, 12
	RGB 0, 0, 0
	RGB 31, 30, 26
	RGB 6, 10, 3
	RGB 20, 23, 14
	RGB 13, 15, 8
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
Collision_050_4a81::
	dr $140a81, $140ab5

GreenForestP13_MapAttributes:
	map_attr_data \
		15, 12, \
		Layout_050_4b05, Blocks_050_4bba, Metatiles_050_52d1, AttrMap_050_5449, \
		Palettes_050_54e4, \
		0, Tileset_006_41df, \
		Collision_050_552c

GreenForestP22_MapAttributes:
	map_attr_data \
		12, 15, \
		Layout_050_4e5e, Blocks_050_4f13, Metatiles_050_52d1, AttrMap_050_5449, \
		Palettes_050_54e4, \
		0, Tileset_006_41df, \
		Collision_050_552c

GreenForestP32_MapAttributes:
	map_attr_data \
		6, 8, \
		Layout_050_51bf, Blocks_050_51f0, Metatiles_050_52d1, AttrMap_050_5449, \
		Palettes_050_54e4, \
		0, Tileset_006_41df, \
		Collision_050_552c

G3_20_MapAttributes:
	map_attr_data \
		6, 8, \
		Layout_050_52a0, Blocks_050_539d, Metatiles_050_52d1, AttrMap_050_5449, \
		Palettes_050_54e4, \
		0, Tileset_006_41df, \
		Collision_050_552c
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_4b05::
	dr $140b05, $140bba
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_4bba::
	dr $140bba, $140e5e
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_4e5e::
	dr $140e5e, $140f13
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_4f13::
	dr $140f13, $1411bf
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_51bf::
	dr $1411bf, $1411f0
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_51f0::
	dr $1411f0, $1412a0
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_52a0::
	dr $1412a0, $1412d1
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_52d1::
	dr $1412d1, $14139d
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_539d::
	dr $14139d, $141449
AttrMap_050_5449::
INCBIN "gfx/attrmaps/attrmap_050_5449.bin"
Palettes_050_54e4::
	RGB 31, 30, 26
	RGB 31, 0, 0
	RGB 20, 23, 14
	RGB 31, 17, 0
	RGB 30, 31, 29
	RGB 19, 23, 22
	RGB 9, 11, 10
	RGB 0, 0, 0
	RGB 30, 30, 29
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 26
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 30, 31, 29
	RGB 22, 23, 18
	RGB 12, 14, 12
	RGB 0, 0, 0
	RGB 31, 30, 26
	RGB 7, 10, 3
	RGB 20, 23, 14
	RGB 13, 15, 8
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
Collision_050_552c::
	dr $14152c, $141560

SkyCity_MapAttributes:
	map_attr_data \
		15, 15, \
		Layout_050_5574, Blocks_050_580e, Metatiles_050_5656, AttrMap_050_5abe, \
		Palettes_050_5b5f, \
		0, Tileset_006_41ee, \
		Collision_050_5ba7
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_5574::
	dr $141574, $141656
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_5656::
	dr $141656, $14180e
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_580e::
	dr $14180e, $141abe
AttrMap_050_5abe::
INCBIN "gfx/attrmaps/attrmap_050_5abe.bin"
Palettes_050_5b5f::
	RGB 31, 30, 29
	RGB 24, 24, 20
	RGB 13, 13, 9
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 17, 26, 6
	RGB 0, 14, 0
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 8, 21, 31
	RGB 0, 0, 24
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 27, 22, 13
	RGB 17, 9, 4
	RGB 0, 0, 0
	RGB 31, 30, 29
	RGB 31, 18, 28
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 20, 25, 21
	RGB 8, 12, 9
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
Collision_050_5ba7::
	dr $141ba7, $141c16

G7_07_MapAttributes:
BanglinCo1f_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_050_5c2a, Blocks_050_5d11, Metatiles_050_5c49, AttrMap_050_5d6d, \
		Palettes_050_5dfd, \
		0, Tileset_006_420b, \
		Collision_050_5e45
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_5c2a::
	dr $141c2a, $141c49
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_5c49::
	dr $141c49, $141d11
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_5d11::
	dr $141d11, $141d6d
AttrMap_050_5d6d::
INCBIN "gfx/attrmaps/attrmap_050_5d6d.bin"
Palettes_050_5dfd::
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
; TODO: collision binary - INCBIN .bin
Collision_050_5e45::
	dr $141e45, $141e78

BanglinCo2_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_050_5e8c, Blocks_050_5f0f, Metatiles_050_5eab, AttrMap_050_5f63, \
		Palettes_050_5f8c, \
		0, Tileset_006_4221, \
		Collision_050_5fd4
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_5e8c::
	dr $141e8c, $141eab
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_5eab::
	dr $141eab, $141f0f
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_5f0f::
	dr $141f0f, $141f63
AttrMap_050_5f63::
INCBIN "gfx/attrmaps/attrmap_050_5f63.bin"
Palettes_050_5f8c::
	RGB 31, 30, 28
	RGB 27, 25, 18
	RGB 18, 15, 10
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 14, 23, 29
	RGB 0, 14, 28
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 23, 23
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 20, 24, 27
	RGB 12, 16, 21
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
Collision_050_5fd4::
	dr $141fd4, $141fee

ContestHall_MapAttributes:
	map_attr_data \
		6, 6, \
		Layout_050_6002, Blocks_050_610b, Metatiles_050_6027, AttrMap_050_617b, \
		Palettes_050_61df, \
		0, Tileset_006_4229, \
		Collision_050_6227
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_6002::
	dr $142002, $142027
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_6027::
	dr $142027, $14210b
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_610b::
	dr $14210b, $14217b
AttrMap_050_617b::
INCBIN "gfx/attrmaps/attrmap_050_617b.bin"
Palettes_050_61df::
	RGB 31, 31, 31
	RGB 27, 25, 18
	RGB 18, 15, 10
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 14, 23, 29
	RGB 0, 14, 28
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 23, 23
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 20, 24, 27
	RGB 12, 16, 21
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
Collision_050_6227::
	dr $142227, $142261

BanglinCo2f_MapAttributes:
	map_attr_data \
		12, 12, \
		Layout_050_62b1, Blocks_050_6342, Metatiles_050_687d, AttrMap_050_6b01, \
		Palettes_050_6b92, \
		0, Tileset_006_4238, \
		Collision_050_6bda

BanglinCo3f_MapAttributes:
	map_attr_data \
		12, 12, \
		Layout_050_643e, Blocks_050_64cf, Metatiles_050_687d, AttrMap_050_6b01, \
		Palettes_050_6b92, \
		0, Tileset_006_4238, \
		Collision_050_6bda

BanglinCo4f_MapAttributes:
	map_attr_data \
		12, 12, \
		Layout_050_662b, Blocks_050_66bc, Metatiles_050_687d, AttrMap_050_6b01, \
		Palettes_050_6b92, \
		0, Tileset_006_4238, \
		Collision_050_6bda

BanglinCo5f_MapAttributes:
	map_attr_data \
		12, 12, \
		Layout_050_67ec, Blocks_050_69e1, Metatiles_050_687d, AttrMap_050_6b01, \
		Palettes_050_6b92, \
		0, Tileset_006_4238, \
		Collision_050_6bda
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_62b1::
	dr $1422b1, $142342
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_6342::
	dr $142342, $14243e
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_643e::
	dr $14243e, $1424cf
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_64cf::
	dr $1424cf, $14262b
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_662b::
	dr $14262b, $1426bc
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_66bc::
	dr $1426bc, $1427ec
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_67ec::
	dr $1427ec, $14287d
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_687d::
	dr $14287d, $1429e1
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_69e1::
	dr $1429e1, $142b01
AttrMap_050_6b01::
INCBIN "gfx/attrmaps/attrmap_050_6b01.bin"
Palettes_050_6b92::
	RGB 29, 29, 18
	RGB 25, 25, 9
	RGB 17, 17, 4
	RGB 0, 0, 0
	RGB 24, 31, 31
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 29, 25, 31
	RGB 18, 14, 23
	RGB 13, 8, 17
	RGB 0, 0, 0
	RGB 31, 23, 12
	RGB 27, 13, 4
	RGB 17, 5, 0
	RGB 0, 0, 0
	RGB 30, 30, 27
	RGB 24, 25, 19
	RGB 14, 14, 11
	RGB 0, 0, 0
	RGB 29, 31, 28
	RGB 24, 28, 23
	RGB 18, 23, 17
	RGB 11, 16, 10
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
Collision_050_6bda::
	dr $142bda, $142c34

FashionStore_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_050_6c48, Blocks_050_6d3f, Metatiles_050_6c67, AttrMap_050_6da3, \
		Palettes_050_6e40, \
		0, Tileset_006_424e, \
		Collision_050_6e88
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_6c48::
	dr $142c48, $142c67
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_6c67::
	dr $142c67, $142d3f
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_6d3f::
	dr $142d3f, $142da3
AttrMap_050_6da3::
INCBIN "gfx/attrmaps/attrmap_050_6da3.bin"
Palettes_050_6e40::
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
; TODO: collision binary - INCBIN .bin
Collision_050_6e88::
	dr $142e88, $142ebf

G4_42_MapAttributes:
G4_64_MapAttributes:
AirportOutside_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_050_6ed3, Blocks_050_6fce, Metatiles_050_6ef2, AttrMap_050_703e, \
		Palettes_050_70b2, \
		0, Tileset_006_426b, \
		Collision_050_70fa
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_6ed3::
	dr $142ed3, $142ef2
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_6ef2::
	dr $142ef2, $142fce
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_6fce::
	dr $142fce, $14303e
AttrMap_050_703e::
INCBIN "gfx/attrmaps/attrmap_050_703e.bin"
Palettes_050_70b2::
	RGB 31, 31, 29
	RGB 28, 23, 14
	RGB 14, 11, 6
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 8, 21, 31
	RGB 0, 4, 28
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
	RGB 0, 25, 31
	RGB 13, 17, 22
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
Collision_050_70fa::
	dr $1430fa, $143132

G4_43_MapAttributes:
G4_65_MapAttributes:
Airport_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_050_7146, Blocks_050_7225, Metatiles_050_7165, AttrMap_050_7281, \
		Palettes_050_7318, \
		0, Tileset_006_4281, \
		Collision_050_7360
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_7146::
	dr $143146, $143165
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_7165::
	dr $143165, $143225
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_7225::
	dr $143225, $143281
AttrMap_050_7281::
INCBIN "gfx/attrmaps/attrmap_050_7281.bin"
Palettes_050_7318::
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
; TODO: collision binary - INCBIN .bin
Collision_050_7360::
	dr $143360, $143391

GreenForestP4_MapAttributes:
G3_21_MapAttributes:
	map_attr_data \
		10, 10, \
		Layout_050_73cd, Blocks_050_7432, Metatiles_050_75c0, AttrMap_050_76d4, \
		Palettes_050_774a, \
		0, Tileset_006_429e, \
		Collision_050_7792

GreenForestP5_MapAttributes:
G3_22_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_050_752a, Blocks_050_7549, Metatiles_050_75c0, AttrMap_050_76d4, \
		Palettes_050_774a, \
		0, Tileset_006_429e, \
		Collision_050_7792

GreenForestP6_MapAttributes:
G3_23_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_050_75a1, Blocks_050_767c, Metatiles_050_75c0, AttrMap_050_76d4, \
		Palettes_050_774a, \
		0, Tileset_006_429e, \
		Collision_050_7792
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_73cd::
	dr $1433cd, $143432
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_7432::
	dr $143432, $14352a
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_752a::
	dr $14352a, $143549
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_7549::
	dr $143549, $1435a1
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_75a1::
	dr $1435a1, $1435c0
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_75c0::
	dr $1435c0, $14367c
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_767c::
	dr $14367c, $1436d4
AttrMap_050_76d4::
INCBIN "gfx/attrmaps/attrmap_050_76d4.bin"
Palettes_050_774a::
	RGB 31, 31, 29
	RGB 26, 23, 22
	RGB 14, 11, 8
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 26, 23, 13
	RGB 16, 11, 4
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 20, 20, 18
	RGB 14, 10, 13
	RGB 0, 0, 0
	RGB 31, 31, 29
	RGB 31, 17, 31
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 22, 22, 19
	RGB 10, 10, 8
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
Collision_050_7792::
	dr $143792, $1437c2

G3_15_MapAttributes:
	map_attr_data \
		6, 10, \
		Layout_050_77ea, Blocks_050_7827, Metatiles_050_78f8, AttrMap_050_79e4, \
		Palettes_050_7a4a, \
		0, Tileset_006_42cb, \
		Collision_050_7a92

G3_16_MapAttributes:
	map_attr_data \
		12, 6, \
		Layout_050_78af, Blocks_050_7970, Metatiles_050_78f8, AttrMap_050_79e4, \
		Palettes_050_7a4a, \
		0, Tileset_006_42cb, \
		Collision_050_7a92
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_77ea::
	dr $1437ea, $143827
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_7827::
	dr $143827, $1438af
; TODO: map layout binary - INCBIN .bin / TMX decode (overworld-data.md)
Layout_050_78af::
	dr $1438af, $1438f8
; TODO: metatile defs binary - decode_tileset.py / INCBIN
Metatiles_050_78f8::
	dr $1438f8, $143970
; TODO: map blockset binary - INCBIN .bin / TMX decode
Blocks_050_7970::
	dr $143970, $1439e4
AttrMap_050_79e4::
INCBIN "gfx/attrmaps/attrmap_050_79e4.bin"
Palettes_050_7a4a::
	RGB 31, 30, 28
	RGB 21, 20, 17
	RGB 11, 10, 8
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 19, 25, 10
	RGB 7, 12, 0
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
	RGB 23, 25, 27
	RGB 13, 15, 18
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
Collision_050_7a92::
	dr $143a92, $143ac0

