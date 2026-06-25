unk_04e_4000:
	end
Script_04e_4001:: ; farjump2 target (bank_4f)
	setmap $08, $06
	end
Script_04e_4005:
	setmap $09, $00
	end

BanglinCo1f_ObjectEvents5:
BanglinCo2f_ObjectEvents:
BanglinCo3f_ObjectEvents:
BanglinCo4f_ObjectEvents:
BanglinCo5f_ObjectEvents:
	objects_end
Script_04e_400a::
	end

BanglinCo2_ObjectEvents:
	object_event $3e,  2,  2, 0, $00, $00, $00, $00, Script_04e_4043
	object_event $27,  9,  5, 0, $00, $00, $00, $01, Script_04e_4047
	object_event $1d,  9,  2, 0, $00, $00, $00, $02, Script_04e_404b
	object_event $25,  4,  4, 0, $00, $00, $00, $03, Script_04e_404f
	object_event $13,  5, 10, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end

Script_04e_4043:
	textface text_4e_4dd3
	end

Script_04e_4047:
	textface text_4e_4ec6
	end

Script_04e_404b:
	textface text_4e_4e23
	end

Script_04e_404f:
	textface text_4e_4e4c
	end

Script_04e_4053::
	face FACE_DOWN
	spriteface  6, FACE_UP
	spritewalk  6, MOVE_UP
	spritewalk  6, MOVE_UP
	stext text_4e_4f64
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_4f99
	setmap $0a, $00
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	stext text_4e_4faf
Script_04e_407c:
	warpmode GAMEMODE_RHYTHM_MINIGAME, $0a, $00
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	checkbit wEventFlags + 7, $01, Script_04e_409a
	stext text_4e_5035
	farjump Script_04e_407c
	end

Script_04e_409a:
	stext text_4e_5086
	stext text_4e_50c4
	setmap $09, $01
	end

ContestHall_ObjectEvents:
	object_event $06,  3,  5, 0, $00, $00, $00, $00, Script_04e_400a
	object_event $45,  3,  7, 0, $00, $00, $00, $01, Script_04e_400a
	object_event $45,  8,  5, 0, $00, $00, $00, $02, Script_04e_400a
	object_event $45,  8,  7, 0, $00, $00, $00, $03, Script_04e_400a
	objects_end

BanglinCo2_ObjectEvents2:
	object_event $3e,  2,  2, 0, $00, $00, $00, $00, Script_04e_4109
	object_event $27,  9,  5, 0, $00, $00, $00, $01, Script_04e_410d
	object_event $1d,  9,  2, 0, $00, $00, $00, $02, Script_04e_4111
	object_event $25,  4,  4, 0, $00, $00, $00, $03, Script_04e_4115
	object_event $13,  5, 10, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end

Script_04e_4109:
	textface text_4e_50d1
	end

Script_04e_410d:
	textface text_4e_51aa
	end

Script_04e_4111:
	textface text_4e_5146
	end

Script_04e_4115:
	textface text_4e_5172
	end

Script_04e_4119::
	face FACE_DOWN
	spriteface  6, FACE_UP
	spritewalk  6, MOVE_UP
	spritewalk  6, MOVE_UP
	stext text_4e_51fa
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_DOWN
	stext text_4e_5235
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_524c
	stext text_4e_5263
	emote  3, EMOTE_HEART
	delay $03, $20
	stext text_4e_527a
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_4e_52b3
	stext text_4e_52c3
	emote  4, EMOTE_TEAR
	emote  5, EMOTE_TEAR
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_52e8
	stext text_4e_5303
	spriteface  6, FACE_DOWN
	spritewalk  6, MOVE_DOWN
	spritewalk  6, MOVE_DOWN
	clearobject $06
	stext text_4e_5337
	setmap $0a, $01
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	stext text_4e_5375
	loadobjsprite ObjSprite_4e_43c9
	spriteface  6, FACE_DOWN
	objmove $06, MovementData_04e_6058
	spriteface  6, FACE_LEFT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	spriteface  6, FACE_RIGHT
	spritewalk  6, MOVE_RIGHT
	spriteface  6, FACE_RIGHT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	emote  3, EMOTE_HEART
	emote  4, EMOTE_HEART
	delay $03, $20
	spriteface  6, FACE_UP
	objmove $06, MovementData_04e_617a
	clearobject $06
	stext text_4e_541b
	loadobjsprite ObjSprite_4e_43bd
	spriteface  6, FACE_DOWN
	objmove $06, MovementData_04e_6058
	spriteface  6, FACE_DOWN
	delay $03, $10
	spriteface  6, $04
	spriteface  6, $06
	delay $03, $10
	spriteface  6, $04
	delay $03, $10
	spriteface  6, FACE_DOWN
	spriteface  6, FACE_RIGHT
	spritewalk  6, MOVE_RIGHT
	spriteface  6, $07
	delay $03, $10
	spriteface  6, $04
	delay $03, $10
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_5475
	spriteface  6, $05
	objmove $06, MovementData_04e_617a
	clearobject $06
	stext text_4e_54c0
	stext text_4e_5530
	loadobjsprite ObjSprite_4e_43b1
	spriteface  6, FACE_DOWN
	delay $03, $20
	stext text_4e_5587
	emote  6, EMOTE_TEAR
	delay $03, $20
	stext text_4e_5595
	objmove $06, MovementData_04e_6058
	spriteface  6, FACE_LEFT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	spriteface  6, FACE_RIGHT
	spritewalk  6, MOVE_RIGHT
	spriteface  6, FACE_RIGHT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	emote  4, EMOTE_ANGER
	emote  5, EMOTE_ANGER
	delay $03, $20
	stext text_4e_55bf
	emote  2, EMOTE_HEART
	delay $03, $20
	stext text_4e_55cf
	emote  4, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_55eb
	emote  6, EMOTE_QUESTION
	delay $03, $20
	stext text_4e_561f
	spriteface  6, FACE_UP
	objmove $06, MovementData_04e_617a
	clearobject $06
	stext text_4e_563d
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_DOWN
	setattach $02, $03, $f0, $00
	objmove $03, MovementData_04e_6119
	clearobject $03
	clearobject $02
	setattach $04, $05, $f0, $00
	objmove $05, MovementData_04e_6119
	clearobject $05
	clearobject $04
	loadobjsprite ObjSprite_4e_43a5
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	stext text_4e_5666
	stext text_4e_568a
	loadobjsprite ObjSprite_4e_43b1
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_56a5
	stext text_4e_56b8
	loadobjsprite ObjSprite_4e_4399
	spriteface  4, FACE_DOWN
	spritewalk  4, MOVE_DOWN
	spritewalk  4, MOVE_DOWN
	loadobjsprite ObjSprite_4e_4381
	loadobjsprite ObjSprite_4e_438d
	spritewalk  5, MOVE_DOWN
	spriteface  5, FACE_RIGHT
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_UP
	spriteface  4, FACE_LEFT
	stext text_4e_5711
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk  6, MOVE_DOWN
	stext text_4e_577d
	spriteface  5, FACE_UP
	spriteface  6, FACE_UP
	setattach $05, $06, $10, $00
	objmove $06, MovementData_04e_617a
	clearobject $06
	clearobject $05
	stext text_4e_579f
	stext text_4e_57ae
	stext text_4e_57fb
	setmappredef MAPPREDEF_12
	setbit wEventFlags + 6, $04
	setfollower $02
	setplayerchar $00
	face FACE_LEFT
	setmap $08, $05
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	stext text_4e_5804
	stext text_4e_5826
	stext text_4e_5833
	clearplayerpos
	spritewalk  2, MOVE_RIGHT
	clearobject $02
	spritewalk  3, MOVE_RIGHT
	spritewalk  3, MOVE_RIGHT
	clearobject $03
	scr_62 $03, $01
	setbit wEventFlags + 24, $04
	end

BanglinCo1f_ObjectEvents4:
	object_event $06,  4,  5, wEventFlags + 24, $04, $00, $00, $00, Script_04e_400a
	object_event $07,  3,  5, wEventFlags + 24, $04, $00, $00, $01, Script_04e_400a
	objects_end
ObjSprite_4e_4381::
	object_event $38,  5,  1, 0, $00, $00, $00, $03, Script_04e_400a
	objects_end
ObjSprite_4e_438d::
	object_event $28,  5,  0, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end
ObjSprite_4e_4399::
	object_event $35,  6,  0, 0, $00, $00, $00, $02, Script_04e_400a
	objects_end
ObjSprite_4e_43a5::
	object_event $31,  6,  0, 0, $00, $00, $00, $00, Script_04e_400a
	objects_end
ObjSprite_4e_43b1::
	object_event $39,  5,  0, 0, $00, $00, $00, $01, Script_04e_400a
	objects_end
ObjSprite_4e_43bd::
	object_event $37,  5,  0, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end
ObjSprite_4e_43c9::
	object_event $3f,  5,  0, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end

ContestHall_ObjectEvents2:
	object_event $06,  3,  5, 0, $00, $00, $00, $00, Script_04e_400a
	object_event $45,  3,  7, 0, $00, $00, $00, $01, Script_04e_400a
	object_event $45,  8,  5, 0, $00, $00, $00, $02, Script_04e_400a
	object_event $45,  8,  7, 0, $00, $00, $00, $03, Script_04e_400a
	objects_end

BanglinCo5f_ObjectEvents2:
	object_event $27, 11,  6, wEventFlags + 6, $05, $00, $00, $00, Script_04e_400a
	object_event $28, 10,  6, wEventFlags + 6, $05, $00, $00, $01, Script_04e_400a
	objects_end

Script_04e_4419::
	face FACE_LEFT
	setmap $0e, $02
	face FACE_UP
	spriteface  1, FACE_UP
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_4e_5861
	stext text_4e_5886
	stext text_4e_58bc
	stext text_4e_58f5
	stext text_4e_591e
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	setattach $01, $00, $00, $10
	objmove $00, MovementData_4e_5ff6
	clearattach $01
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	spriteface  2, FACE_RIGHT
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	stext text_4e_594e
	stext text_4e_597a
	startbattle BattleData_02d_4b70
	checkbit wEventFlags + 3, $03, Script_04e_44aa
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_59b0
	stext text_4e_59c1
	scr_48 $02, $0c
	stext text_4e_59d4
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	setattach $02, $03, $f0, $00
	objmove $03, MovementData_04e_6119
	clearobject $03
	clearobject $02
	emote  0, EMOTE_TEAR
	delay $03, $20
	setbit wEventFlags + 6, $05
	setmappredef MAPPREDEF_13
	end

Script_04e_44aa:
	face FACE_DOWN
	setmap $0e, $03
	end

BanglinCo1f_ObjectEvents6:
	object_event $35,  6,  5, wEventFlags + 6, $06, $00, $00, $00, Script_04e_400a
	object_event $06,  6,  6, wEventFlags + 6, $06, $00, $00, $01, Script_04e_400a
	object_event $04,  5,  6, wEventFlags + 6, $06, $00, $00, $02, Script_04e_400a
	objects_end

Script_04e_44d2::
	checkbit wEventFlags + 6, $05, Script_04e_44dc
	setmap $08, $07
	end

Script_04e_44dc:
	checkbit wEventFlags + 6, $06, Script_04e_4586
	setplayerchar $00
	face FACE_RIGHT
	setmap $08, $08
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	stext text_4e_5a18
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4e_5a66
	stext text_4e_5a7c
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_5abb
	spriteface  2, FACE_UP
	face FACE_UP
	move MovementData_OneUp
	face $04
	stext text_4e_5acc
	face FACE_UP
	stext text_4e_5b80
	stext text_4e_5b8a
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  2, FACE_LEFT
	stext text_4e_5bfb
	face FACE_RIGHT
	spriteface  4, FACE_RIGHT
	spriteface  3, FACE_UP
	spriteface  2, FACE_DOWN
	stext text_4e_5c07
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_4e_5c62
	spriteface  3, FACE_LEFT
	spriteface  2, FACE_LEFT
	stext text_4e_5c6f
	stext text_4e_5cad
	scr_48 $02, $0d
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $08, $08
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_UP
	stext text_4e_5cba
	spriteface  2, FACE_RIGHT
	objmove $02, MovementData_04e_61db
	clearobject $02
	clearplayerpos
	spriteface  4, FACE_UP
	spritewalk  4, MOVE_UP
	clearobject $04
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	setbit wEventFlags + 6, $06
	end

Script_04e_4586:
	setmap $08, $07
	end

Airport_ObjectEvents2:
	object_event $35,  6,  5, wEventFlags + 6, $06, $01, $00, $00, Script_04e_400a
	object_event $06,  7,  5, wEventFlags + 6, $06, $01, $00, $01, Script_04e_400a
	object_event $04,  7,  6, wEventFlags + 6, $06, $01, $00, $02, Script_04e_400a
	objects_end

Airport_ObjectEvents:
	object_event $35,  6,  5, wEventFlags + 6, $06, $01, $00, $00, Script_04e_45b8
	objects_end

Script_04e_45b8:
	walkpath
	setplayerchar $00
	face FACE_UP
	setmap $11, $01
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	stext text_4e_5d75
	stext text_4e_5d8c
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_4e_5dac
	stext text_4e_5dd6
	stext text_4e_5de3
	emote  4, EMOTE_QUESTION
	delay $03, $20
	stext text_4e_5e1b
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  2, FACE_DOWN
	stext text_4e_5e2b
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_RIGHT
	setattach $04, $03, $10, $00
	objmove $03, MovementData_04e_61db
	clearobject $03
	clearobject $04
	spriteface  2, FACE_DOWN
	face FACE_UP
	stext text_4e_5e5e
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	spriteface  2, FACE_RIGHT
	setattach $01, $00, $10, $00
	objmove $00, MovementData_04e_61db
	clearobject $00
	clearobject $01
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	stext text_4e_5e75
	warpmode GAMEMODE_AIRPORT_CUTSCENE1, $0a, $00
	end

INCLUDE "engine/movie/airport.asm"
INCLUDE "data/text/script_banglin_co2.asm"
INCLUDE "data/text/script_banglin_co_contest.asm"
INCLUDE "data/text/script_airport_5d75.asm"
MovementData_4e_5ff6:
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $88, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $88
MovementData_04e_6058:
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $88
MovementData_04e_6119:
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88
MovementData_04e_617a:
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $88
MovementData_04e_61db:
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $88, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $88, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $88, $ff, $ff, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $88, $ff, $00, $fc, $fe
	db $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe
	db $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe
	db $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $88, $ff, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $88, $ff, $01, $fc, $03, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $fc, $02, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $02, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $88, $ff, $01, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc
	db $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc
	db $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $88
