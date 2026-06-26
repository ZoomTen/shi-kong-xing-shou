EastFishmarketAntonCutscene_ObjectEvents::
	object_event $64,  4,  4, wEventFlags + 8, $06, $00, $00, $00, Script_05c_4319
	objects_end

Script_05c_4319::
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

Script_05c_434b::
	checkbit wEventFlags + 9, $01, Script_05c_4355

Script_05c_4351::
	setmap MAP_EAST_FISHMARKET_MERMAID_CUTSCENE, $00
	end2

Script_05c_4355::
	checkbit wEventFlags + 9, $02, Script_05c_4351
	setmap MAP_EAST_FISHMARKET_MERMAID_CUTSCENE, $01
	end2

EastFishmarketMermaidCutscene_ObjectEvents2::
	object_event $62,  6,  5, 0, $00, $00, $00, $00, Script_05c_436c
	objects_end

Script_05c_436b::
	end

Script_05c_436c::
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
	takeitem ITEMNAMECAT_KEY, KEYITEM_0f
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
	giveitem ITEMNAMECAT_KEY, KEYITEM_10
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

EastFishmarketAntonCutscene_ObjectEvents2::
	object_event $08,  9,  6, wEventFlags + 9, $03, $00, $00, $00, Script_05c_411c
	object_event $09, 10,  6, wEventFlags + 9, $03, $00, $00, $01, Script_05c_411c
	objects_end

EastFishmarket_4e_ObjectEvents3::
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
