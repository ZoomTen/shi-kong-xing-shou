DuoluCity2_ObjectEvents::
	object_event $15,  8,  4, 0, $00, $00, $0a, $00, Script_012_4613
	object_event $21,  3,  8, 0, $00, $00, $0b, $01, Script_012_4617
	object_event $12,  8, 10, 0, $00, $00, $08, $02, Script_012_461b
	object_event $23, 11, 14, 0, $00, $00, $07, $03, Script_012_4629
	object_event $18, 21,  8, 0, $00, $00, $0a, $04, Script_012_4637
	object_event $1c, 32,  8, 0, $00, $00, $05, $00, Script_012_465d
	object_event $1f, 32, 14, 0, $00, $00, $05, $01, Script_012_467f
	object_event $16, 23, 17, 0, $00, $00, $05, $02, Script_012_468d
	object_event $19,  9, 20, 0, $00, $00, $08, $03, Script_012_469e
	objects_end

DuoluCity_1b_ObjectEvents::
	object_event $16,  4,  6, 0, $00, $00, $09, $00, Script_012_46a2
	object_event $19,  8,  6, 0, $00, $00, $06, $01, Script_012_46a6
	objects_end

DuoluCity_1c_ObjectEvents::
	object_event $1b,  5,  4, 0, $00, $00, $06, $00, Script_012_46aa
	object_event $1a,  9,  6, 0, $00, $00, $07, $01, Script_012_46ae
	objects_end

DuoluCity_1d_ObjectEvents::
	object_event $1c,  6,  3, 0, $00, $00, $07, $00, Script_012_46b2
	object_event $1a,  4,  6, 0, $00, $00, $0b, $01, Script_012_46b6
	object_event $15,  6,  7, 0, $00, $00, $06, $02, Script_012_46ba
	objects_end

DuoluCity_20_ObjectEvents::
	object_event $22,  7,  5, 0, $00, $00, $06, $00, Script_012_46be
	objects_end

GallEnterprise_ObjectEvents::
	object_event $2d,  6,  5, wEventFlags + 3, $02, $00, $00, $00, Script_012_46c2
	objects_end

ClockTower1f_ObjectEvents::
	object_event $24,  6, 13, wEventFlags + 4, $06, $00, $00, $00, Script_012_46fb
	objects_end

ShandaFarm_ObjectEvents::
	object_event $17, 15,  6, 0, $00, $00, $09, $00, Script_012_48b7
	object_event $20,  9,  8, 0, $00, $00, $08, $01, Script_012_48bb
	object_event $12,  4, 16, 0, $00, $00, $08, $02, Script_012_48c9
	object_event $1d, 14, 16, 0, $00, $00, $07, $03, Script_012_48d7
	object_event $21, 11, 20, 0, $00, $00, $08, $04, Script_012_48e5
	object_event $19, 17, 22, 0, $00, $00, $06, $00, Script_012_48e9
	object_event $1a, 11, 25, 0, $00, $00, $09, $01, Script_012_48f7
	objects_end

ShandaFarm_12_ObjectEvents::
	object_event $23,  3,  3, 0, $00, $00, $0b, $00, Script_012_4905
	object_event $25,  5,  5, 0, $00, $00, $06, $01, Script_012_4913
	objects_end

ShandaFarm_13_ObjectEvents::
	object_event $22,  3,  5, 0, $00, $00, $09, $00, Script_012_4917
	object_event $21,  8,  6, 0, $00, $00, $06, $01, Script_012_491b
	objects_end

ShandaFarm_14_ObjectEvents::
	object_event $1e,  9,  3, 0, $00, $00, $00, $00, Script_012_491f
	object_event $1f,  5,  3, 0, $00, $00, $06, $01, Script_012_492d
	object_event $18,  6,  6, 0, $00, $00, $05, $02, Script_012_493b
	objects_end

ShandaFarm_15_ObjectEvents::
	object_event $16,  7,  5, 0, $00, $00, $08, $00, Script_012_495d
	objects_end

SkyRockPart2_ObjectEvents2::
	object_event $30,  5,  7, wEventFlags + 4, $07, $00, $00, $00, Script_012_44cc
	object_event $04,  6,  8, wEventFlags + 4, $07, $00, $00, $02, Script_012_44cc
	objects_end

Script_012_4397::
	checkbit wEventFlags + 3, $06, Script_012_43a1

Script_012_439d::
	setmap MAP_SKY_ROCK_PART_2, $00
	end

Script_012_43a1::
	checkbit wEventFlags + 4, $07, Script_012_439d
	setplayerchar $00
	setmap MAP_SKY_ROCK_PART_2, $01
	spriteface  3, FACE_UP
	emote $02, $03
	delay $03, $20
	stext text_12_6bc1
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	stext text_12_6c0b
	spriteface  2, FACE_DOWN
	stext text_12_6c54
	stext text_12_6ca6
	stext text_12_6cd1
	spriteface  2, FACE_UP
	loadobjsprite ObjSprite_012_4486
	objmove $04, MovementData_012_50b7
	spriteface  4, FACE_UP
	loadobjsprite Script_012_4492
	objmove $05, MovementData_012_4f8c
	clearobject $05
	loadobjsprite Script_012_4492
	objmove $05, MovementData_012_503c
	clearobject $05
	loadobjsprite Script_012_4492
	objmove $05, MovementData_012_5065
	clearobject $05
	loadobjsprite Script_012_4492
	objmove $05, MovementData_012_508e
	clearobject $05
	spriteface  4, FACE_LEFT
	objmove $04, MovementData_012_50f6
	clearobject $04
	spriteface  2, $04
	delay $03, $10
	clearobject $00
	clearobject $01
	clearobject $02
	clearobject $03
	loadobjsprite Script_012_446e
	loadobjsprite ObjSprite_012_447a
	spriteface  2, $04
	warpmode GAMEMODE_LETTER_CUTSCENE, $07, $01
	face FACE_UP
	spriteface  1, FACE_UP
	spriteface  3, FACE_UP
	stext text_12_6e65
	spritewalk  3, MOVE_UP
	spriteface  3, FACE_LEFT
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_6e7d
	stext text_12_6ea8
	spriteface  3, FACE_DOWN
	face FACE_DOWN
	spriteface  1, FACE_DOWN
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	stext text_12_6ef7
	spriteface  3, FACE_RIGHT
	clearplayerpos
	spritewalk  3, MOVE_RIGHT
	clearobject $03
	setbit wEventFlags + 4, $07
	end

Script_012_446e::
	object_event $30,  1,  8, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end

ObjSprite_012_447a::
	object_event $31,  8,  8, 0, $00, $00, $00, $01, Script_012_44cc
	objects_end

ObjSprite_012_4486::
	object_event $49,  5,  5, 0, $00, $00, $00, $02, Script_012_44cc
	objects_end

Script_012_4492::
	object_event $48,  5,  1, 0, $00, $00, $00, $03, Script_012_44cc
	objects_end

MarkNinaIntro_ObjectEvents3::
	object_event $30,  7,  3, wEventFlags + 3, $06, $00, $00, $00, Script_012_44cc
	object_event $04,  8,  4, wEventFlags + 3, $06, $00, $00, $02, Script_012_44cc
	objects_end

MarkNinaIntro_ObjectEvents2::
	object_event $47,  8,  3, 0, $00, $00, $00, $00, Script_012_44cc
	object_event $04,  8,  4, 0, $00, $00, $00, $02, Script_012_44cc
	objects_end

Script_012_44cc::
        end

Script_012_44cd::
	checkbit wEventFlags + 3, $05, Script_012_44db
	setmap MAP_MARK_NINA_INTRO, $00
	end

Script_012_44d7::
	setmap MAP_MARK_NINA_INTRO, $03
	end

Script_012_44db::
	checkbit wEventFlags + 3, $06, Script_012_44d7
	setplayerchar $00
	setmap MAP_MARK_NINA_INTRO, $01
	spriteface  3, FACE_UP
	face FACE_UP
	stext text_12_6898
	listdec $02, $08
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_LEFT
	setmap MAP_MARK_NINA_INTRO, $02
	spriteface  3, FACE_UP
	face FACE_UP
	emote $02, $00
	delay $03, $20
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_LEFT
	stext text_12_68c4
	stext text_12_68ce
	stext text_12_68e4
	emote $03, $03
	delay $03, $20
	stext text_12_68f5
	emote $02, $00
	delay $03, $20
	stext text_12_691e
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	face FACE_LEFT
	stext text_12_6927
	spriteface  3, FACE_DOWN
	spriteface  2, FACE_RIGHT
	stext text_12_6953
	stext text_12_69a3
	stext text_12_69ac
	stext text_12_6a58
	emote $02, $00
	delay $03, $20
	stext text_12_6aa0
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_012_4e4a
	clearobject $02
	emote $00, $00
	emote $03, $00
	delay $03, $20
	face FACE_UP
	stext text_12_6adb
	stext text_12_6b0f
	stext text_12_6b30
	stext text_12_6b6a
	emote $00, $00
	delay $03, $20
	stext text_12_6b93
	stext text_12_6bb4
	clearplayerpos
	spritewalk  3, MOVE_DOWN
	clearobject $03
	setbit wEventFlags + 3, $06
	end
