	end ; trailing script terminator
Bank6e_EmptyObjectEvent::
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
	setplayerchar $00
	face FACE_LEFT
	warpmode2 GAMEMODE_1D, $00, $00, $00
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	runmovement MovementData_00b_71b0
	stext text_6e_441b
	stext text_6e_4451
	warpmode2 GAMEMODE_1E, $00, $00, $00
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	runmovement MovementData_00b_71b0
	stext text_6e_449a
	runmovement MovementData_00b_71b0
	stext text_6e_44b3
	stext text_6e_44c5
	runmovement MovementData_00b_71b0
	stext text_6e_44f1
	stext text_6e_4510
	runmovement MovementData_00b_71b0
	setmap MAP_G7_02, $00
	spriteface  2, FACE_LEFT
	emote  2, EMOTE_QUESTION
	delay $03, $20
	spritewalk  2, MOVE_LEFT
	spriteface  3, FACE_LEFT
	stext text_6e_451d
	spritewalk  3, MOVE_LEFT
	stext text_6e_454b
	spriteface  2, FACE_RIGHT
	emote  2, EMOTE_HEART
	delay $03, $20
	stext text_6e_456b
	emote  3, EMOTE_TEAR
	delay $03, $20
	stext text_6e_4591
	setmap MAP_G7_03, $00
	stext text_6e_45b5
	loadobjsprite ObjSprite_6e_43eb
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_6e_45e4
	stext text_6e_4635
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	clearobject $02
	loadobjsprite ObjSprite_6e_43f6
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	spriteface  3, FACE_DOWN
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6e_46a6
	setmap MAP_G7_04, $00
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6e_46f5
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spriteface  3, FACE_RIGHT
	stext text_6e_470c
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_LEFT
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6e_4719
	loadobjsprite ObjSprite_6e_43d5
	spriteface  4, FACE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	emote  4, EMOTE_QUESTION
	delay $03, $20
	stext text_6e_472f
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	stext text_6e_474c
	spriteface  2, FACE_DOWN
	emote  2, EMOTE_TEAR
	delay $02, $20
	stext text_6e_4755
	loadobjsprite ObjSprite_6e_43e0
	spriteface  5, FACE_UP
	spritewalk  5, MOVE_UP
	spritewalk  5, MOVE_UP
	spritewalk  5, MOVE_UP
	stext text_6e_4788
	emote  2, EMOTE_ANGER
	delay $02, $20
	stext text_6e_47a5
	spriteface  6, FACE_UP
	emote  2, EMOTE_ANGER
	delay $02, $20
	stext text_6e_47f0
	emote  4, EMOTE_TEAR
	delay $02, $20
	stext text_6e_482a
	setmap MAP_G7_05, $00
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	stext text_6e_4836
	stext text_6e_4847
	emote  4, EMOTE_EXCLAMATION
	delay $02, $20
	stext text_6e_48a0
	stext text_6e_48b5
	emote  4, EMOTE_EXCLAMATION
	delay $02, $20
	spritewalk  4, MOVE_UP
	spriteface  4, FACE_LEFT
	stext text_6e_48e0
	stext text_6e_48ea
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_UP
	stext text_6e_494e
	stext text_6e_4960
	stext text_6e_49ad
	stext text_6e_49d6
	setmap MAP_G7_06, $00
	spriteface  2, FACE_LEFT
	stext text_6e_49e3
	emote  4, EMOTE_EXCLAMATION
	delay $02, $20
	stext text_6e_49fc
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_RIGHT
	emote  4, EMOTE_EXCLAMATION
	delay $02, $20
	stext text_6e_4a27
	stext text_6e_4a3c
	stext text_6e_4a6e
	emote  4, EMOTE_QUESTION
	delay $03, $20
	stext text_6e_4a98
	stext text_6e_4aa9
	emote  4, EMOTE_HEART
	delay $03, $20
	stext text_6e_4afe
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_6e_4b0d
	spritewalk  2, MOVE_UP
	stext text_6e_4b1d
	setmap MAP_G7_07, $00
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	stext text_6e_4b59
	emote  3, EMOTE_QUESTION
	delay $03, $20
	stext text_6e_4b9b
	emote  2, EMOTE_ANGER
	delay $03, $20
	stext text_6e_4bb8
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6e_4c06
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_LEFT
	stext text_6e_4c1e
	emote  3, EMOTE_ANGER
	delay $03, $20
	stext text_6e_4c49
	spritewalk  4, MOVE_RIGHT
	stext text_6e_4c6a
	stext text_6e_4c72
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6e_4cad
	spritewalk  4, MOVE_LEFT
	emote  4, EMOTE_ANGER
	delay $03, $20
	stext text_6e_4cc2
	stext text_6e_4cec
	stext text_6e_4d15
	checkbit wEventFlags + 20, $03, Script_06e_4361
	setmap MAP_G7_08, $00
	spriteface  3, FACE_LEFT
	spritewalk  2, MOVE_RIGHT
	stext text_6e_4d21
	stext text_6e_4d68
	stext text_6e_4d90
	stext text_6e_4db0
	stext text_6e_4e1d
	stext text_6e_4e36
Script_06e_4361:
	setplayerchar $00
	face FACE_UP
	warpmode2 GAMEMODE_1E, $0a, $00, $03
	movemap MovementData_TwelveUp
	stext text_6e_4e43
	stext text_6e_4e55
	stext text_6e_4e69
	stext text_6e_4e86
	stext text_6e_4eec
	stext text_6e_4eff
	stext text_6e_4f2a
	stext text_6e_4f52
	warpmode2 GAMEMODE_CREDITS, $00, $00, $00
	stext text_6e_4f5c
	emote  3, EMOTE_QUESTION
	delay $03, $20
	spriteface  3, FACE_LEFT
	stext text_6e_4f6b
	spriteface  2, FACE_RIGHT
	stext text_6e_4f7a
	spriteface  3, FACE_DOWN
	stext text_6e_4fb5
	spriteface  2, FACE_DOWN
	stext text_6e_4fd1
	stext text_6e_4fe9
	stext text_6e_5004
	stext text_6e_500d
	stext text_6e_5016
	delay $03, $10
	emote 136, EMOTE_TEAR
	delay $03, $20
	stext text_6e_502a
	delay $02, $03
	delay $03, $02
	stext text_6e_5033
	stext text_6e_5050
	warpmode2 GAMEMODE_THE_END, $00, $00, $00
	end
; OAM sprite compositions (loadobjsprite targets)
ObjSprite_6e_43d5:
	db $0a, $0a, $08, $00, $00, $00, $00, $00, $02, $00, $00
ObjSprite_6e_43e0:
	db $51, $09, $08, $00, $00, $00, $00, $00, $03, $00, $00
ObjSprite_6e_43eb:
	db $14, $07, $00, $00, $00, $00, $00, $00, $01, $00, $00
ObjSprite_6e_43f6:
	db $09, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00
INCLUDE "data/text/script_ending_epilogue.asm"
INCLUDE "data/text/script_ending_finale.asm"
G7_09_MapAttributes:
	map_attr G7_09, \
	   Layout_06e_507d, \
	   Blocks_06e_5120, \
	   Metatiles_06e_509c, \
	   AttrMap_06e_5180, \
	   Palettes_06e_51b4, \
	   0, Tileset_55, \
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
	INCLUDE "data/maps/palettes/Palettes_06e_51b4.pal"
Collision_06e_51fc::
	INCBIN "data/maps/collision/Collision_06e_51fc.bin"
