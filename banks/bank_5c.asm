unk_05c_4000:
	setmap MAP_G4_06, $00
	end2

Script_05c_4004:
	checkbit wEventFlags + 9, $02, Script_05c_4015
	checkbit wEventFlags + 8, $05, Script_05c_4015
	farjump2 Script_055_5475
	end

Script_05c_4015:
	setmap MAP_G4_44, $02
	end2

Airport_g465_ObjectEvents:
	object_event $45, 10,  5, wEventFlags + 14, $05, $01, $00, $00, Script_05c_4025
	objects_end
Script_05c_4025:
	textface text_5c_402d
	farjump2 Script_066_4140
	end
INCLUDE "data/text/script_airport_65_1.asm"
Script_05c_4058:
	setmap MAP_G4_10, $01
	end
Script_05c_405c:
	farjump2 Script_058_40bc
	end

EastFishmarketShop_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_05c_406d
	objects_end
Script_05c_406d:
	textface text_5c_4105
	end
Script_05c_4071:
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_5c_4105
	checkbit wEventFlags + 4, $01, Script_05c_4082
	scr_35 $05
	end
Script_05c_4082:
	end

EastFishmarketHealingCenter_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_05c_409a
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_05c_409e
	objects_end
Script_05c_409a:
	stext text_5c_40be
	end
Script_05c_409e:
	stext text_5c_40d6
	end
Script_05c_40a2:
	face FACE_UP
	stext text_5c_40be
	checkbit wEventFlags + 3, $03, Script_05c_40af
	scr_37
	end
Script_05c_40af:
	end
Script_05c_40b0:
	face FACE_UP
	stext text_5c_40d6
	checkbit wEventFlags + 3, $03, Script_05c_40bd
	townmusicanim
	end
Script_05c_40bd:
	end
INCLUDE "data/text/script_east_fishmarket_healing_center.asm"
INCLUDE "data/text/script_east_fishmarket_shop.asm"
Script_05c_411c::
	end

G4_06_ObjectEvents:
G4_07_ObjectEvents:
G4_08_ObjectEvents:
G4_09_ObjectEvents:
EastFishmarketMermaidCutscene_ObjectEvents:
G4_10_ObjectEvents:
G4_44_ObjectEvents:
G4_4A_ObjectEvents:
G4_64_ObjectEvents:
	objects_end

G4_44_ObjectEvents2:
	object_event $1e, 11,  6, wEventFlags + 23, $04, $00, $00, $00, Script_05c_411c
	object_event $53, 12,  7, wEventFlags + 23, $04, $00, $00, $01, Script_05c_411c
	objects_end
Script_05c_4135:: ; farjump2 target (bank_55)
	setmap MAP_G4_44, $03
	spriteface  3, FACE_UP
	stext text_5c_458c
	spriteface  3, FACE_DOWN
	objmove $03, MovementData_05c_51fa
	clearobject $03
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	stext text_5c_45b8
	objmove $02, MovementData_05c_5084
	clearobject $02
	setmappredef MAPPREDEF_15
	setbit wEventFlags + 23, $04
	end

EastFishmarket_45_ObjectEvents:
	object_event $1c, 15,  6, wEventFlags + 8, $07, $01, $07, $00, Script_05c_4250
	object_event $14,  4,  7, wEventFlags + 8, $07, $01, $09, $01, Script_05c_4241
	object_event $13,  5, 14, wEventFlags + 8, $07, $01, $00, $02, Script_05c_4235
	object_event $15, 21, 13, wEventFlags + 8, $07, $01, $06, $03, Script_05c_4215
	object_event $17,  9, 20, wEventFlags + 8, $07, $01, $09, $04, Script_05c_4211
	object_event $16, 12, 13, wEventFlags + 8, $07, $00, $00, $00, Script_05c_419f
	objects_end
Script_05c_419f:
	setplayerchar $00
	setmap MAP_EAST_FISHMARKET_4E, $00
	end

EastFishmarket_4e_ObjectEvents2:
	object_event $65,  5,  3, 0, $00, $00, $00, $00, Script_05c_411c
	objects_end

EastFishmarket_4e_ObjectEvents:
	object_event $65,  5,  3, 0, $00, $00, $00, $00, Script_05c_411c
	object_event $16,  5,  6, 0, $00, $00, $00, $01, Script_05c_41c8
	objects_end
Script_05c_41c8:
	textface text_5c_47fc
	checkbit wEventFlags + 8, $06, Script_05c_41d2
	end
Script_05c_41d2:
	spriteface  3, FACE_UP
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_485a
	stext text_5c_486f
	loadobjsprite ObjSprite_5c_4205
	objmove $04, MovementData_05c_5106
	spriteface  4, FACE_UP
	stext text_5c_4889
	stext text_5c_48a2
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_48c2
	objmove $04, MovementData_05c_51a8
	clearobject $04
	setbit wEventFlags + 9, $01
	end
ObjSprite_5c_4205::
	object_event $56,  5,  8, 0, $00, $00, $00, $02, Script_05c_411c
	objects_end
Script_05c_4211:
	textface text_5c_4ddb
	end
Script_05c_4215:
	ifcharindex $00, Script_05c_421d
	textface text_5c_4dcc
	end
Script_05c_421d:
	checkbit wEventFlags + 9, $00, Script_05c_4231
	textface text_5c_4d57
	stext text_5c_4d90
	scr_48 $00, $11
	setbit wEventFlags + 9, $00
	end
Script_05c_4231:
	textface text_5c_4da1
	end
Script_05c_4235:
	textface text_5c_4ce1
	ifcharindex $04, Script_05c_423d
	end
Script_05c_423d:
	stext text_5c_4d27
	end
Script_05c_4241:
	textface text_5c_4c5e
	ifcharindex $04, Script_05c_4249
	end
Script_05c_4249:
	stext text_5c_4ca6
	stext text_5c_4cd1
	end
Script_05c_4250:
	textface text_5c_4c42
	end

EastFishmarket_46_ObjectEvents:
	object_event $18,  5,  5, 0, $00, $00, $00, $00, Script_05c_426b
	object_event $1d,  8,  5, 0, $00, $00, $00, $01, Script_05c_4277
	objects_end
Script_05c_426b:
	textface text_5c_4e2b
	ifcharindex $04, Script_05c_4273
	end
Script_05c_4273:
	stext text_5c_4e60
	end
Script_05c_4277:
	textface text_5c_4e68
	ifcharindex $04, Script_05c_427f
	end
Script_05c_427f:
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_4ea2
	end

EastFishmarket_47_ObjectEvents:
	object_event $1f,  3,  3, 0, $00, $00, $00, $00, Script_05c_42a0
	object_event $1e,  5,  5, 0, $00, $00, $06, $01, Script_05c_42a4
	objects_end
Script_05c_42a0:
	textface text_5c_4eb8
	end

Script_05c_42a4:
	checkbit wEventFlags + 11, $07, Script_05c_42c3
	textface text_5c_4ef8
	spriteface  2, FACE_DOWN
	stext text_5c_4f3e
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_4f5e
	emote  0, EMOTE_TEAR
	delay $03, $20
	end

Script_05c_42c3:
	checkbit wEventFlags + 12, $00, Script_05c_42da
	textface text_5c_4f73
	stext text_5c_4fd9
	listdec $02, $13
	scr_48 $00, $27
	setbit wEventFlags + 12, $00
	end

Script_05c_42da:
	textface text_5c_4fe9
	end

EastFishmarket_48_ObjectEvents:
	object_event $16,  3,  4, 0, $00, $00, $00, $00, Script_05c_42f5
	object_event $19,  8,  3, 0, $00, $00, $06, $01, Script_05c_42f9
	objects_end
Script_05c_42f5:
	textface text_5c_4538
	end
Script_05c_42f9:
	textface text_5c_5025
	end

EastFishmarket_49_ObjectEvents:
	object_event $1b,  4,  5, 0, $00, $00, $06, $00, Script_05c_4309
	objects_end

Script_05c_4309:
	textface text_5c_5035
	end

EastFishmarketAntonCutscene_ObjectEvents:
	object_event $64,  4,  4, wEventFlags + 8, $06, $00, $00, $00, Script_05c_4319
	objects_end
Script_05c_4319:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_5c_465e
	stext text_5c_4678
	stext text_5c_46dc
	stext text_5c_46f0
	stext text_5c_4729
	stext text_5c_476c
	spriteface  2, FACE_UP
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	clearobject $02
	stext text_5c_47b6
	setbit wEventFlags + 8, $06
	end

Script_05c_434b:
	checkbit wEventFlags + 9, $01, Script_05c_4355
Script_05c_4351::
	setmap MAP_EAST_FISHMARKET_MERMAID_CUTSCENE, $00
	end2

Script_05c_4355:
	checkbit wEventFlags + 9, $02, Script_05c_4351
	setmap MAP_EAST_FISHMARKET_MERMAID_CUTSCENE, $01
	end2

EastFishmarketMermaidCutscene_ObjectEvents2:
	object_event $62,  6,  5, 0, $00, $00, $00, $00, Script_05c_436c
	objects_end

Script_05c_436b:
	end

Script_05c_436c:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_5c_48f2
	startbattle BattleData_02d_4bcc
	checkbit wEventFlags + 3, $03, Script_05c_436b
	setplayerchar $00
	clearobject $02
	stext text_5c_4902
	stext text_5c_4914
	loadobjsprite ObjSprite_5c_4520
	objmove $02, MovementData_05c_5127
	clearobject $02
	listdec $02, $0f
	setmap MAP_EAST_FISHMARKET_4E, $01
	stext text_5c_4928
	stext text_5c_4953
	stext text_5c_497e
	stext text_5c_49d1
	stext text_5c_4a08
	loadobjsprite ObjSprite_5c_44fc
	objmove $03, MovementData_05c_54fc
	spriteface  3, FACE_UP
	loadobjsprite ObjSprite_5c_4508
	spriteface  4, FACE_LEFT
	objmove $04, MovementData_05c_5555
	spriteface  4, FACE_UP
	loadobjsprite ObjSprite_5c_4514
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_05c_558e
	spriteface  5, FACE_UP
	stext text_5c_4a25
	delay $03, $20
	loadobjsprite ObjSprite_5c_44d8
	objmove $06, MovementData_05c_51fa
	clearobject $03
	clearobject $06
	delay $03, $10
	loadobjsprite ObjSprite_5c_44e4
	objmove $03, MovementData_05c_51fa
	clearobject $04
	clearobject $03
	delay $03, $10
	loadobjsprite ObjSprite_5c_44f0
	objmove $03, MovementData_05c_51fa
	clearobject $05
	clearobject $03
	delay $03, $10
	loadobjsprite ObjSprite_5c_452c
	objmove $03, MovementData_05c_51b9
	spriteface  3, FACE_UP
	spriteface  3, FACE_UP
	setmap MAP_EAST_FISHMARKET_4E, $02
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_UP
	spriteface  5, FACE_LEFT
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_4a3a
	objmove $04, MovementData_05c_50c5
	spriteface  4, FACE_RIGHT
	stext text_5c_4a5a
	spriteface  2, FACE_DOWN
	emote  2, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	delay $03, $20
	objmove $05, MovementData_05c_5053
	stext text_5c_4a70
	spriteface  4, FACE_UP
	spriteface  5, FACE_UP
	stext text_5c_4a89
	stext text_5c_4ad6
	face FACE_UP
	warpmode GAMEMODE_HELEN_CUTSCENE, $4d, $01
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	face FACE_RIGHT
	stext text_5c_4b2d
	stext text_5c_4b87
	scr_48 $02, $10
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $4d, $01
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	stext text_5c_4b96
	clearplayerpos
	spritewalk  2, MOVE_LEFT
	clearobject $02
	spritewalk  3, MOVE_LEFT
	spritewalk  3, MOVE_LEFT
	clearobject $03
	loadscriptedmon $04
	scr_62 $04, $01
	stext text_5c_4bf7
	stext text_5c_4c0e
	setbit wEventFlags + 8, $07
	setbit wEventFlags + 9, $02
	setbit wEventFlags + 9, $03
	end

EastFishmarketAntonCutscene_ObjectEvents2:
	object_event $08,  9,  6, wEventFlags + 9, $03, $00, $00, $00, Script_05c_411c
	object_event $09, 10,  6, wEventFlags + 9, $03, $00, $00, $01, Script_05c_411c
	objects_end

EastFishmarket_4e_ObjectEvents3:
	object_event $08,  5,  4, 0, $00, $00, $00, $00, Script_05c_411c
	object_event $09,  6,  4, 0, $00, $00, $00, $01, Script_05c_411c
	object_event $1e,  5, 10, 0, $00, $00, $00, $02, Script_05c_411c
	object_event $15,  9,  6, 0, $00, $00, $00, $03, Script_05c_411c
	objects_end
ObjSprite_5c_44d8::
	object_event $48,  4,  0, 0, $00, $00, $00, $04, Script_05c_411c
	objects_end
ObjSprite_5c_44e4::
	object_event $48,  5,  0, 0, $00, $00, $00, $01, Script_05c_411c
	objects_end
ObjSprite_5c_44f0::
	object_event $48,  6,  0, 0, $00, $00, $00, $01, Script_05c_411c
	objects_end
ObjSprite_5c_44fc::
	object_event $63,  1,  4, 0, $00, $00, $00, $01, Script_05c_411c
	objects_end
ObjSprite_5c_4508::
	object_event $63,  6,  7, 0, $00, $00, $00, $02, Script_05c_411c
	objects_end
ObjSprite_5c_4514::
	object_event $63, 10,  5, 0, $00, $00, $00, $03, Script_05c_411c
	objects_end
ObjSprite_5c_4520::
	object_event $56,  6,  6, 0, $00, $00, $00, $00, Script_05c_411c
	objects_end
ObjSprite_5c_452c::
	object_event $56,  5,  0, 0, $00, $00, $00, $01, Script_05c_411c
	objects_end
INCLUDE "data/text/script_east_fishmarket_48_1.asm"
INCLUDE "data/text/script_east_fishmarket_0d_4.asm"
INCLUDE "data/text/script_east_fishmarket_anton_cutscene.asm"
INCLUDE "data/text/script_east_fishmarket_4e.asm"
INCLUDE "data/text/script_east_fishmarket_mermaid_cutscene.asm"
INCLUDE "data/text/script_east_fishmarket_45.asm"
INCLUDE "data/text/script_east_fishmarket_46.asm"
INCLUDE "data/text/script_east_fishmarket_47.asm"
INCLUDE "data/text/script_east_fishmarket_48_2.asm"
INCLUDE "data/text/script_east_fishmarket_49.asm"
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
MovementData_05c_5053::
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $88
MovementData_05c_5084::
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $88
MovementData_05c_50c5::
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $88
MovementData_05c_5106::
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $88
MovementData_05c_5127::
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $88
MovementData_05c_51a8::
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88
MovementData_05c_51b9::
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $88
MovementData_05c_51fa::
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $88, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $88, $ff, $00, $fe, $00, $fe
	db $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe
	db $ff, $fe, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $ff, $ff
	db $00, $ff, $ff, $ff, $00, $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $01, $ff, $01
	db $ff, $01, $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01, $ff, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $ff, $02, $00, $02, $00, $02, $ff, $02, $00, $02
	db $00, $02, $00, $02, $ff, $02, $00, $04, $00, $04, $ff, $04, $00, $04, $00, $04
	db $00, $04, $ff, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $88, $ff, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00
	db $fe, $00, $fe, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $ff, $00, $ff, $00
	db $ff, $01, $ff, $00, $ff, $01, $ff, $00, $ff, $01, $ff, $00, $ff, $01, $00, $01
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $01, $03, $01, $03, $01
	db $04, $01, $04, $01, $04, $01, $88, $ff, $ff, $fe, $ff, $fe, $ff, $fe, $00, $fe
	db $ff, $fe, $ff, $fe, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00
	db $ff, $00, $ff, $00, $ff, $01, $ff, $01, $ff, $01, $ff, $01, $00, $01, $ff, $02
	db $00, $02, $ff, $02, $00, $02, $ff, $02, $00, $02, $ff, $02, $00, $02, $00, $04
	db $ff, $04, $00, $04, $ff, $04, $00, $04, $00, $04, $00, $88, $ff, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00, $fe, $00
	db $fe, $01, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $01, $fe, $00, $fe, $00
	db $fe, $01, $fe, $01, $fe, $00, $fe, $01, $fe, $00, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $02, $ff, $01, $ff, $00, $ff, $01, $ff, $01, $ff, $01, $00, $01
	db $ff, $01, $00, $01, $00, $01, $00, $01, $00, $01, $01, $01, $00, $01, $00, $01
	db $01, $01, $01, $01, $01, $01, $00, $01, $03, $03, $03, $02, $03, $02, $03, $03
	db $03, $01, $88, $ff, $ff, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $88, $ff, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88, $ff, $01, $fc, $04, $fc, $04, $fd
	db $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc
	db $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc
	db $04, $88
MovementData_05c_54fc::
	db $ff, $00, $fe, $01, $fe, $01, $fe, $00, $fe, $01, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $01, $fe, $01, $fe, $02, $fe, $01, $fe, $02, $ff, $01, $ff, $01
	db $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $01, $01, $00, $01, $01, $01, $01, $01, $00, $01
	db $01, $01, $01, $01, $01, $01, $03, $03, $03, $02, $03, $01, $03, $02, $03, $01
	db $03, $01, $03, $02, $04, $01, $00, $00, $88
MovementData_05c_5555::
	db $ff, $01, $fe, $02, $fe, $02, $fe, $01, $fe, $01, $fe, $01, $ff, $00, $ff, $00
	db $ff, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $00
	db $ff, $00, $ff, $00, $ff, $ff, $fd, $ff, $fd, $fe, $fd, $fe, $fd, $fd, $fc, $fc
	db $fd, $fc, $fd, $fc, $fe, $fd, $00, $00, $88
MovementData_05c_558e::
	db $ff, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $ff
	db $fe, $ff, $fe, $ff, $fe, $fe, $fe, $ff, $fe, $fe, $fe, $fe, $fe, $fe, $00, $ff
	db $ff, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $01, $fd, $01, $fd, $02, $fd, $02, $fc, $02, $fc
	db $03, $fc, $04, $fc, $01, $fe, $00, $00, $88

