	dr $1b8000, $1b8001
G7_0A_ObjectEvents:
	objects_end
G7_09_ObjectEvents:
	dr $1b8002, $1b8019
G7_03_ObjectEvents2:
	dr $1b8019, $1b8030
G7_08_ObjectEvents:
	dr $1b8030, $1b8047
G7_07_ObjectEvents:
	dr $1b8047, $1b8069
G7_06_ObjectEvents:
	dr $1b8069, $1b808b
G7_05_ObjectEvents:
	dr $1b808b, $1b80ad
G7_04_ObjectEvents:
	dr $1b80ad, $1b80c4
G7_03_ObjectEvents:
	dr $1b80c4, $1b80d0
G7_01_ObjectEvents:
	dr $1b80d0, $1b80f2
G7_02_ObjectEvents:
	dr $1b80f2, $1b9069
G7_09_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_06e_507d, Blocks_06e_5120, Metatiles_06e_509c, AttrMap_06e_5180, \
		Palettes_06e_51b4, \
		0, Tileset_006_438c, \
		Collision_06e_51fc
Layout_06e_507d::
	dr $1b907d, $1b909c
Metatiles_06e_509c::
	dr $1b909c, $1b9120
Blocks_06e_5120::
	dr $1b9120, $1b9180
AttrMap_06e_5180::
INCBIN "gfx/attrmaps/attrmap_06e_5180.bin"
Palettes_06e_51b4::
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
Collision_06e_51fc::
	dr $1b91fc, $1b9220
