; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
	dr $1b8000, $1b8001
G7_0A_ObjectEvents:
	objects_end
G7_09_ObjectEvents:
	object_event $27,  5,  4, 0, $00, $00, $00, $00, $0000
	object_event $28,  6,  4, 0, $00, $00, $00, $01, $0000
	objects_end
G7_03_ObjectEvents2:
	object_event $00, 14,  4, 0, $00, $00, $00, $00, $0000
	object_event $11, 15,  4, 0, $00, $00, $00, $01, $0000
	objects_end
G7_08_ObjectEvents:
	object_event $0e,  3,  4, 0, $00, $00, $00, $00, $0000
	object_event $18,  5,  4, 0, $00, $00, $00, $01, $0000
	objects_end
G7_07_ObjectEvents:
	object_event $35,  4,  4, 0, $00, $00, $00, $00, $0000
	object_event $06,  5,  3, 0, $00, $00, $00, $01, $0000
	object_event $04,  6,  4, 0, $00, $00, $00, $02, $0000
	objects_end
G7_06_ObjectEvents:
	object_event $59,  6,  6, 0, $00, $00, $00, $00, $0000
	object_event $58,  5,  6, 0, $00, $00, $00, $01, $0000
	object_event $02,  5,  4, 0, $00, $00, $00, $02, $0000
	objects_end
G7_05_ObjectEvents:
	object_event $0c,  9,  3, 0, $00, $00, $00, $00, $0000
	object_event $1e,  8,  4, 0, $00, $00, $00, $01, $0000
	object_event $1a, 10,  4, 0, $00, $00, $00, $02, $0000
	objects_end
G7_04_ObjectEvents:
	object_event $31, 10,  3, 0, $00, $00, $00, $00, $0000
	object_event $69,  9,  4, 0, $00, $00, $00, $01, $0000
	objects_end
G7_03_ObjectEvents:
	object_event $08,  6,  3, 0, $00, $00, $00, $00, $0000
	objects_end
G7_01_ObjectEvents:
	object_event $5a,  7,  3, 0, $00, $00, $00, $00, $0000
	object_event $11,  3,  4, 0, $00, $00, $00, $01, $0000
	object_event $59,  3,  6, 0, $00, $00, $00, $02, $0000
	objects_end
; TODO: object_event array + interleaved scripts/text - per-bank carve
G7_02_ObjectEvents:
	object_event $26, 13, 13, 0, $00, $00, $00, $00, 0
	object_event $1a, 14, 13, 0, $00, $00, $00, $01, 0
	objects_end
Script_06e_4109::
	dr $1b8109, $1b9069
G7_09_MapAttributes:
	map_attr_data \
		6, 5, \
		Layout_06e_507d, Blocks_06e_5120, Metatiles_06e_509c, AttrMap_06e_5180, \
		Palettes_06e_51b4, \
		0, Tileset_006_438c, \
		Collision_06e_51fc
Layout_06e_507d::
	db MAPTYPE_NONE
	INCBIN "data/maps/layouts/Layout_06e_507d.bin"
Metatiles_06e_509c::
	INCBIN "data/maps/metatiles/Metatiles_06e_509c.bin"
Blocks_06e_5120::
	INCBIN "data/maps/blocks/Blocks_06e_5120.bin"
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
	INCBIN "data/maps/collision/Collision_06e_51fc.bin"
