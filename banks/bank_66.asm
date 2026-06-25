StardreamShop_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_066_400c
	objects_end

Script_066_400c::
	textface text_66_40a4
	end
Script_066_4010::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_66_40a4
	checkbit wEventFlags + 4, $01, Script_066_4021
	scr_35 $0a
	end

Script_066_4021:
	end

StardreamHealingCenter_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_066_4039
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_066_403d
	objects_end

Script_066_4039::
	stext text_66_405d
	end

Script_066_403d::
	stext text_66_4075
	end
Script_066_4041::
	face FACE_UP
	stext text_66_405d
	checkbit wEventFlags + 3, $03, Script_066_404e
	scr_37
	end

Script_066_404e:
	end
Script_066_404f::
	face FACE_UP
	stext text_66_4075
	checkbit wEventFlags + 3, $03, Script_066_405c
	townmusicanim
	end

Script_066_405c:
	end
INCLUDE "data/text/script_stardream_healing_center.asm"
INCLUDE "data/text/script_stardream_shop.asm"
Script_066_40bb::
	checkbit wEventFlags + 15, $01, Script_066_40c5
	setmap MAP_PERMAFROST_GARDEN, $00
	end2

Script_066_40c5:
	setmap MAP_PERMAFROST_GARDEN, $02
	end2

PermafrostGarden_ObjectEvents3:
	object_event $57, 26, 25, wEventFlags + 17, $00, $00, $00, $00, Script_066_40d5
	objects_end

Script_066_40d5::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5f05
	startbattle BattleData_02d_4d4d
	checkbit wEventFlags + 3, $03, Script_066_41f1
	spriteface  2, FACE_UP
	loadobjsprite ObjSprite_66_4128
	objmove $03, MovementData_066_7d47
	loadobjsprite ObjSprite_66_4134
	objmove $04, MovementData_066_7d7e
	spriteface  2, FACE_UP
	clearobject $02
	face FACE_LEFT
	stext text_66_5f11
	scr_48 $02, $19
	clearobject $03
	setbit wEventFlags + 15, $02
	face FACE_RIGHT
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_5f21
	stext text_66_5f5b
	scr_48 $02, $1a
	clearobject $04
	setbit wEventFlags + 16, $02
	setbit wEventFlags + 17, $00
	end

ObjSprite_66_4128::
	object_event $71, 26, 25, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end
ObjSprite_66_4134::
	object_event $72, 26, 25, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end
Script_066_4140::
	setplayerchar $00 ; TEMP
	face FACE_LEFT
	warpmode GAMEMODE_AIRPORT_CUTSCENE3, $16, $00
	spriteface  2, FACE_LEFT
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_66_4ca2
	stext text_66_4caf
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	spriteface  2, FACE_RIGHT
	stext text_66_4ce9
	stext text_66_4d09
	stext text_66_4d2c
	setbit wEventFlags + 14, $06
	end

Script_066_4172::
	textface text_66_4d45
	end

StardreamAirship_18_ObjectEvents:
	object_event $62,  7,  3, wEventFlags + 14, $07, $00, $00, $00, Script_066_4182
	objects_end

Script_066_4182::
	textface text_66_4dd7
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_4dee
	stext text_66_4e0b
	startbattle BattleData_02d_4d1f
	checkbit wEventFlags + 3, $03, Script_066_41f1
	clearobject $02
	setbit wEventFlags + 14, $07
	setplayerchar $00
	face FACE_RIGHT
	warpmode GAMEMODE_AIRPORT_CUTSCENE4, $1b, $02
	spriteface  2, FACE_LEFT
	stext text_66_4e17
	end

StardreamAirship_16_ObjectEvents:
	object_event $12,  1,  5, 0, $00, $00, $00, $00, Script_066_4172
	object_event $25, 16,  3, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $22, 20,  3, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end
Script_066_41d1::
	face FACE_UP
	stext text_66_4d8e
	checkbit wEventFlags + 3, $03, Script_066_41de
	scr_37
	end

Script_066_41de:
	end
Script_066_41df::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_66_40a4
	checkbit wEventFlags + 4, $01, Script_066_41f0
	scr_35 $09
	end

Script_066_41f0:
	end
Script_066_41f1::
	end

Script_066_41f2::
	end

Bank66_EmptyObjectEvent::
	objects_end

PresaleHouseOutside_ObjectEvents:
	object_event $12, 23,  3, 0, $00, $00, $00, $00, Script_066_4200
	objects_end

Script_066_4200::
	textface text_66_4e55
	end
Script_066_4204::
	checkbit wEventFlags + 17, $05, Script_066_420e
	stext text_66_4eab
	end

Script_066_420e:
	end

StardreamCity_07_ObjectEvents:
	object_event $14, 33,  8, 0, $00, $00, $00, $00, Script_066_428a
	object_event $17, 26,  7, 0, $00, $00, $00, $01, Script_066_428e
	object_event $1c, 21, 10, 0, $00, $00, $00, $02, Script_066_42a0
	object_event $1a, 27,  5, 0, $00, $00, $00, $03, Script_066_42ee
	object_event $16, 26, 16, 0, $00, $00, $00, $04, Script_066_4323
	object_event $13,  5,  7, 0, $00, $00, $00, $00, Script_066_4331
	object_event $15,  8, 17, 0, $00, $00, $00, $01, Script_066_4335
	object_event $19,  3, 13, 0, $00, $00, $00, $02, Script_066_4339
	object_event $16,  7,  3, 0, $00, $00, $0b, $03, Script_066_433d
	object_event $23,  3,  4, wEventFlags + 15, $04, $00, $00, $01, Script_066_427e
	objects_end

Script_066_427e::
	ifcharindex $05, Script_066_4286
	textface text_66_7b6c
	end

Script_066_4286:
	textface text_66_7b99
	end

Script_066_428a::
	textface text_66_4ef4
	end

Script_066_428e::
	textface text_66_4f51
	end
Script_066_4292::
	checkbit wEventFlags + 17, $05, Script_066_429c
	setmap MAP_PRESALE_HOUSE_1F, $00
	end2

Script_066_429c:
	setmap MAP_PRESALE_HOUSE_1F, $01
	end2

Script_066_42a0::
	checkbit wEventFlags + 17, $06, Script_066_42aa
	textface text_66_500c
	end

Script_066_42aa:
	checkbit wEventFlags + 15, $05, Script_066_42c1
	textface text_66_6de6
	stext text_66_6e8b
	scr_48 $02, $1f
	stext text_66_6e9a
	setbit wEventFlags + 15, $05
	end

Script_066_42c1:
	checkbit wEventFlags + 15, $04, Script_066_42cb
	textface text_66_6e9a
	end

Script_066_42cb:
	textface text_66_776e
	end
Script_066_42cf::
	checkbit wEventFlags + 15, $01, Script_066_42d6
Script_066_42d5:
	end

Script_066_42d6:
	checkbit wEventFlags + 16, $01, Script_066_42d5
	countflags10 $07, $e1, $42
	end

Script_066_42e1:
	face FACE_UP
	stext text_66_6f2c
	scr_48 $02, $21
	setbit wEventFlags + 16, $01
	end

Script_066_42ee::
	checkbit wEventFlags + 15, $01, Script_066_42f8
	textface text_66_5083
	end

Script_066_42f8:
	checkbit wEventFlags + 15, $03, Script_066_4302
	textface text_66_709b
	end

Script_066_4302:
	checkbit wEventFlags + 16, $03, Script_066_431f
	textface text_66_71a4
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_7213
	scr_48 $02, $24
	listdec $02, $23
	setbit wEventFlags + 16, $03
	end

Script_066_431f:
	textface text_66_7225
	end

Script_066_4323::
	checkbit wEventFlags + 15, $04, Script_066_432d
	textface text_66_50b5
	end

Script_066_432d:
	textface text_66_7796
	end

Script_066_4331::
	textface text_66_513e
	end

Script_066_4335::
	textface text_66_51bc
	end

Script_066_4339::
	textface text_66_523a
	end

Script_066_433d::
	textface text_66_5287
	end

StardreamCity_1e_ObjectEvents:
	object_event $1d,  5,  3, 0, $00, $00, $00, $00, Script_066_436b
	object_event $1a,  6,  6, 0, $00, $00, $00, $01, Script_066_4358
	objects_end

Script_066_4358::
	textface text_66_537a
	spriteface  2, FACE_DOWN
	emote  2, EMOTE_ANGER
	delay $03, $20
	stext text_66_53b1
	stext text_66_53c8
	end

Script_066_436b::
	checkbit wEventFlags + 15, $01, Script_066_4375
	textface text_66_5313
	end

Script_066_4375:
	checkbit wEventFlags + 17, $07, Script_066_4383
	textface text_66_6f3e
	setbit wEventFlags + 17, $07
	end

Script_066_4383:
	countflags10 $06, $8b, $43
	textface text_66_6fa2
	end

Script_066_438b:
	checkbit wEventFlags + 16, $07, Script_066_439f
	textface text_66_6ffe
	stext text_66_7044
	scr_48 $02, $22
	setbit wEventFlags + 16, $07
	end

Script_066_439f:
	textface text_66_7055
	end

PresaleHouse_1f_ObjectEvents2:
	object_event $20,  4,  3, 0, $00, $00, $00, $00, Script_066_43dd
	object_event $19,  5,  5, 0, $00, $00, $00, $01, Script_066_4440
	objects_end

PresaleHouse_1f_ObjectEvents:
	object_event $20,  4,  3, 0, $00, $00, $00, $00, Script_066_43dd
	object_event $19,  5,  5, wEventFlags + 17, $02, $00, $00, $01, Script_066_4444
	objects_end
ObjSprite_66_43d1::
	object_event $19,  4,  4, 0, $00, $00, $00, $01, Script_066_4440
	objects_end

Script_066_43dd::
	checkbit wEventFlags + 17, $02, Script_066_43e7
	textface text_66_5407
	end

Script_066_43e7:
	checkbit wEventFlags + 17, $04, Script_066_43f5
	textface text_66_66f2
	setbit wEventFlags + 17, $03
	end

Script_066_43f5:
	checkbit wEventFlags + 17, $05, Script_066_442c
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	clearplayerpos
	loadobjsprite ObjSprite_66_43d1
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_UP
	stext text_66_69ae
	stext text_66_69c7
	emote  0, EMOTE_TEAR
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_66_6a18
	stext text_66_6a9c
	scr_48 $02, $1d
	setbit wEventFlags + 17, $05
	end

Script_066_442c:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6aab
	stext text_66_6ade
	stext text_66_6b01
	stext text_66_6b09
	end

Script_066_4440::
	textface text_66_6b09
	end

Script_066_4444::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5447
	spriteface  2, FACE_DOWN
	stext text_66_546d
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_549d
	emote  2, EMOTE_TEAR
	delay $03, $20
	end

G5_27_ObjectEvents4:
	object_event $19,  6,  6, wEventFlags + 17, $04, $00, $00, $00, Script_066_41f2
	objects_end

G5_27_ObjectEvents3:
	object_event $73,  6,  6, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end

G5_27_ObjectEvents2:
	object_event $73,  4,  8, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end
Script_066_448e::
	checkbit wEventFlags + 17, $03, Script_066_4498
Script_066_4494:
	setmap MAP_G5_27, $00
	end

Script_066_4498:
	checkbit wEventFlags + 17, $04, Script_066_4494
	setplayerchar $00
	setmap MAP_G5_27, $01
	setattach $01, $00, $f0, $00
	objmove $00, MovementData_066_7de0
	clearattach $00
	move MovementData_OneDown
	stext text_66_67b0
	face $05
	objmove $00, MovementData_066_7e09
	face FACE_DOWN
	setmap MAP_G5_27, $02
	spriteface  2, FACE_UP
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_67c3
	stext text_66_67f8
	warpmode GAMEMODE_BEACH_CUTSCENE, $27, $03
	spriteface  2, FACE_LEFT
	delay $03, $10
	spriteface  2, FACE_RIGHT
	delay $03, $10
	spriteface  2, FACE_UP
	stext text_66_68c0
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_68e9
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_6924
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_693d
	emote  0, EMOTE_TEAR
	delay $03, $20
	clearplayerpos
	spritewalk  2, MOVE_UP
	clearobject $02
	setbit wEventFlags + 17, $04
	end

StardreamCity_20_ObjectEvents:
	object_event $16,  7,  6, 0, $00, $00, $08, $00, Script_066_451c
	objects_end

Script_066_451c::
	textface text_66_54d3
	end

StardreamFlorist_ObjectEvents:
	object_event $23,  8,  2, 0, $00, $00, $00, $00, Script_066_454d
	object_event $25,  5,  4, 0, $00, $00, $06, $01, Script_066_4537
	objects_end

Script_066_4537::
	checkbit wEventFlags + 15, $01, Script_066_4541
	textface text_66_551e
	end

Script_066_4541:
	textface text_66_5f6c
	end
Script_066_4545::
	spriteface  2, FACE_LEFT
	farjump Script_066_454d
	end

Script_066_454d::
	checkbit wEventFlags + 15, $01, Script_066_4557
	stext text_66_5571
	end

Script_066_4557:
	checkbit wEventFlags + 16, $00, Script_066_456b
	stext text_66_5f95
	stext text_66_5fde
	scr_48 $02, $1b
	setbit wEventFlags + 16, $00
	end

Script_066_456b:
	stext text_66_5fef
	end

StardreamCity_0f_ObjectEvents:
	object_event $1b,  2,  6, 0, $00, $00, $00, $00, Script_066_458e
	object_event $21,  8,  4, 0, $00, $00, $06, $01, Script_066_45b6
	objects_end
Script_066_4586::
	spriteface  2, FACE_UP
	farjump Script_066_4591
	end

Script_066_458e::
	spriteface  2, FACE_RIGHT
Script_066_4591:
	checkbit wEventFlags + 15, $02, Script_066_459b
	stext text_66_55a9
	end

Script_066_459b:
	checkbit wEventFlags + 15, $03, Script_066_45b2
	stext text_66_70db
	stext text_66_715f
	scr_48 $02, $23
	listdec $02, $19
	setbit wEventFlags + 15, $03
	end

Script_066_45b2:
	stext text_66_716f
	end

Script_066_45b6::
	textface text_66_55ff
	end

StardreamHospital_11_ObjectEvents:
	object_event $13,  2,  6, 0, $00, $00, $00, $00, Script_066_45c6
	objects_end

Script_066_45c6::
	spriteface  2, FACE_RIGHT
	stext text_66_5739
	end

StardreamHospital_12_ObjectEvents:
	object_event $15, 10,  6, 0, $00, $00, $06, $00, Script_066_45ef
	object_event $1d,  4,  4, wEventFlags + 15, $00, $00, $00, $01, Script_066_45f3
	object_event $1d,  3,  4, wEventFlags + 15, $00, $01, $00, $01, Script_066_45f7
	objects_end

Script_066_45ef::
	textface text_66_576f
	end

Script_066_45f3::
	textface text_66_579b
	end

Script_066_45f7::
	textface text_66_5ce9
	end

StardreamHospital_13_ObjectEvents:
	object_event $12,  2,  3, 0, $00, $00, $00, $00, Script_066_461d
	object_event $14,  6,  3, 0, $00, $00, $00, $01, Script_066_4621
	object_event $17,  9,  6, 0, $00, $00, $05, $02, Script_066_4625
	objects_end

Script_066_461d::
	textface text_66_57d0
	end

Script_066_4621::
	textface text_66_57fa
	end

Script_066_4625::
	textface text_66_5821
	end

StardreamHospital_14_ObjectEvents:
	object_event $16,  4,  5, 0, $00, $00, $00, $00, Script_066_4640
	object_event $1f,  6,  3, 0, $00, $00, $00, $01, Script_066_465c
	objects_end

Script_066_4640::
	textface text_66_585c
	spriteface  2, FACE_UP
	spriteface  3, FACE_DOWN
	stext text_66_58b8
	stext text_66_58db
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_58f8
	stext text_66_5903
	end

Script_066_465c::
	textface text_66_5903
	end

StardreamSchool_24_ObjectEvents:
	object_event $22,  6, 10, 0, $00, $00, $00, $00, Script_066_466c
	objects_end

Script_066_466c::
	textface text_66_564a
	end

StardreamSchool_25_ObjectEvents:
	object_event $1e,  5,  5, 0, $00, $00, $00, $00, Script_066_467c
	objects_end

Script_066_467c::
	textface text_66_5696
	end

StardreamSchool_26_ObjectEvents:
	object_event $24,  6,  3, 0, $00, $00, $00, $00, Script_066_468c
	objects_end

Script_066_468c::
	checkbit wEventFlags + 15, $01, Script_066_46a4
	textface text_66_56c0
	end

Script_066_4696:
	checkbit wEventFlags + 15, $04, Script_066_46a0
	textface text_66_60dd
	end

Script_066_46a0:
	textface text_66_77d4
	end

Script_066_46a4:
	checkbit wEventFlags + 16, $04, Script_066_4696
	textface text_66_6027
	countflags10 $05, $b2, $46
	end

Script_066_46b2:
	stext text_66_6063
	stext text_66_60cd
	scr_48 $02, $1c
	setbit wEventFlags + 16, $04
	end

CardillaHouse_ObjectEvents:
	object_event $18,  6,  4, 0, $00, $00, $00, $00, Script_066_46cc
	objects_end

Script_066_46cc::
	checkbit wEventFlags + 15, $00, Script_066_476b
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5936
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_596b
	stext text_66_5986
	setmap MAP_PERMAFROST_GARDEN, $01
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	spriteface  2, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	stext text_66_59e0
	stext text_66_5a33
	stext text_66_5a89
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk  3, MOVE_LEFT
	spriteface  4, FACE_RIGHT
	spriteface  2, FACE_RIGHT
	stext text_66_5b30
	stext text_66_5b52
	objmove $06, MovementData_066_7d15
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	emote  4, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk  4, MOVE_UP
	stext text_66_5b66
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_UP
	stext text_66_5b9f
	emote  6, EMOTE_ANGER
	delay $03, $20
	objmove $06, MovementData_066_7cc7
	clearobject $04
	emote  3, EMOTE_EXCLAMATION
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_5bba
	stext text_66_5bc9
	emote  6, EMOTE_ANGER
	delay $03, $20
	face FACE_UP
	setmap MAP_CARDILLA_HOUSE, $01
	stext text_66_5bd2
	setbit wEventFlags + 15, $00
	end

Script_066_476b:
	countflags10 $03, $73, $47
	textface text_66_5c77
	end

Script_066_4773:
	checkbit wEventFlags + 17, $01, Script_066_479a
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_610e
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_66_618d
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_619b
	setbit wEventFlags + 17, $01
	end

Script_066_479a:
	checkbit wEventFlags + 16, $05, Script_066_47a4
	textface text_66_61c1
	end

Script_066_47a4:
	checkbit wEventFlags + 15, $06, Script_066_47b2
	textface text_66_6d46
	setbit wEventFlags + 17, $06
	end

Script_066_47b2::
	textface text_66_74f2
	end

PresaleHouse_1a_ObjectEvents2:
	object_event $27,  5,  5, 0, $00, $00, $00, $00, Script_066_4869
	object_event $28,  4,  5, 0, $00, $00, $00, $01, Script_066_4869
	objects_end
Script_066_47cd::
	checkbit wEventFlags + 17, $01, Script_066_47dd
	setmap MAP_PRESALE_HOUSE_1A, $00
Script_066_47d6:
	end2

Script_066_47d7:
	face FACE_DOWN
	setmap MAP_G5_19, $01
	end

Script_066_47dd:
	setmap MAP_PRESALE_HOUSE_1A, $01
	checkbit wEventFlags + 17, $02, Script_066_47d6
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_66_6240
	stext text_66_626c
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	move MovementData_OneUp
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	stext text_66_62aa
	emote  2, EMOTE_QUESTION
	delay $03, $20
	stext text_66_62df
	stext text_66_630f
	stext text_66_632b
	stext text_66_6343
	stext text_66_635e
	stext text_66_6367
	stext text_66_6370
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_6384
	startbattle BattleData_02d_4d7b
	checkbit wEventFlags + 3, $03, Script_066_47d7
	stext text_66_63e7
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_641f
	stext text_66_6440
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_66_648d
	stext text_66_649e
	stext text_66_64cf
	stext text_66_6534
	stext text_66_659f
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_65b5
	stext text_66_6634
	setbit wEventFlags + 17, $02
	end

Script_066_4869::
	checkbit wEventFlags + 17, $05, Script_066_487d
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6655
	stext text_66_66d4
	end

Script_066_487d:
	checkbit wEventFlags + 16, $05, Script_066_48a7
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6b54
	stext text_66_6b63
	stext text_66_6bc8
	stext text_66_6c21
	stext text_66_6c6a
	stext text_66_6c79
	scr_48 $02, $1e
	listdec $02, $1d
	setbit wEventFlags + 16, $05
	end

Script_066_48a7:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6c93
	stext text_66_6cdd
	emote  0, EMOTE_TEAR
	delay $03, $20
	end

PermafrostGarden_ObjectEvents2:
	object_event $0e, 15, 23, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $31, 18, 23, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $14, 16, 23, 0, $00, $00, $00, $02, Script_066_41f2
	object_event $0f, 14, 23, 0, $00, $00, $00, $03, Script_066_41f2
	object_event $57, 16, 15, 0, $00, $00, $00, $04, Script_066_41f2
	objects_end

StardreamHospital_15_ObjectEvents:
	object_event $6f,  5,  3, 0, $00, $00, $00, $00, Script_066_495f
	object_event $13,  6,  2, 0, $00, $00, $00, $01, Script_066_4937
	object_event $0f,  4,  2, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

StardreamHospital_15_ObjectEvents2:
	object_event $0e,  6,  3, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $13,  7,  3, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $0f,  6,  2, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_4937::
	checkbit wEventFlags + 15, $01, Script_066_495b
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5d40
	stext text_66_5d8c
	stext text_66_5da8
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_66_5e2c
	setbit wEventFlags + 15, $01
	end

Script_066_495b:
	textface text_66_5e62
	end

Script_066_495f::
	scr_6e Script_066_4973, Script_066_497a, Script_066_4981, Script_066_4988, Script_066_498f, Script_066_4996, Script_066_499d, Script_066_49ab, Script_066_49b9
	end

Script_066_4973:
	stext text_66_725f
	stext text_66_7bca
	end

Script_066_497a:
	stext text_66_725f
	stext text_66_7be0
	end

Script_066_4981:
	stext text_66_725f
	stext text_66_7bf7
	end

Script_066_4988:
	stext text_66_7267
	stext text_66_7c0e
	end

Script_066_498f:
	stext text_66_7267
	stext text_66_7c25
	end

Script_066_4996:
	stext text_66_727b
	stext text_66_7c3c
	end

Script_066_499d:
	stext text_66_727b
	stext text_66_72bb
	stext text_66_7c53
	farjump Script_066_49ca
	end

Script_066_49ab:
	stext text_66_7297
	stext text_66_72c9
	stext text_66_7c6a
	farjump Script_066_49ca
	end

Script_066_49b9:
	stext text_66_72d7
	stext text_66_72ef
	stext text_66_730d
	stext text_66_7c81
	farjump Script_066_49ca
	end

Script_066_49ca:
	stext text_66_7336
	checkbit wEventFlags + 3, $03, Script_066_4a98
	stext text_66_73c3
	stext text_66_7408
	setplayerchar $00
	face FACE_UP
	setmap MAP_STARDREAM_HOSPITAL_15, $01
	spriteface  3, FACE_LEFT
	emote  0, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_742c
	spriteface  2, FACE_RIGHT
	stext text_66_744b
	stext text_66_74a2
	spriteface  2, FACE_DOWN
	stext text_66_74dc
	setbit wEventFlags + 15, $06
	face FACE_UP
	setmap MAP_CARDILLA_HOUSE, $02
	spriteface  3, FACE_RIGHT
	spriteface  2, FACE_LEFT
	stext text_66_74f2
	stext text_66_7509
	spriteface  3, FACE_DOWN
	stext text_66_751c
	stext text_66_7580
	scr_48 $02, $25
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $1d, $02
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	loadobjsprite ObjSprite_66_4a9c
	spriteface  5, FACE_UP
	objmove $05, MovementData_066_7db7
	spriteface  5, FACE_RIGHT
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	face FACE_LEFT
	stext text_66_758f
	emote  3, EMOTE_EXCLAMATION
	emote  2, EMOTE_EXCLAMATION
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	face FACE_UP
	stext text_66_760f
	stext text_66_7668
	stext text_66_7691
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	face FACE_LEFT
	stext text_66_76e3
	spriteface  5, FACE_DOWN
	objmove $05, MovementData_066_7de0
	clearobject $05
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	face FACE_UP
	clearplayerpos
	spritewalk  3, MOVE_DOWN
	clearobject $03
	spritewalk  4, MOVE_DOWN
	spritewalk  4, MOVE_DOWN
	clearobject $04
	loadscriptedmon $07
	scr_62 $07, $01
	stext text_66_7700
	stext text_66_7718
	setbit wEventFlags + 15, $04
	end

Script_066_4a98:
	stext text_66_734c
	end

ObjSprite_66_4a9c::
	object_event $23,  4, 10, 0, $00, $00, $00, $03, Script_066_41f2
	objects_end

CardillaHouse_ObjectEvents2:
	object_event $18,  6,  5, 0, $00, $00, $00, $00, Script_066_47b2
	object_event $0e,  5,  5, wEventFlags + 15, $04, $00, $00, $01, Script_066_41f2
	object_event $0f,  5,  4, wEventFlags + 15, $04, $00, $00, $02, Script_066_41f2
	objects_end
Script_066_4aca::
	checkbit wEventFlags + 15, $06, Script_066_4ad4
	setmap MAP_STARDREAM_HOSPITAL_15, $00
	end2

Script_066_4ad4:
	setmap MAP_STARDREAM_HOSPITAL_15, $02
	end2

G5_0E_ObjectEvents2:
	object_event $0e,  5,  4, wEventFlags + 18, $00, $00, $00, $00, Script_066_41f2
	object_event $0f,  5,  5, wEventFlags + 18, $00, $00, $00, $01, Script_066_41f2
	objects_end
Script_066_4aef::
	checkbit wEventFlags + 18, $00, Script_066_4b20
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_G5_0E, $02
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_UP
	stext text_66_7806
	stext text_66_7920
	spriteface  2, FACE_UP
	setattach $03, $02, $10, $00
	objmove $02, MovementData_066_7d36
	clearobject $02
	clearobject $03
	scr_62 $07, $00
	setbit wEventFlags + 18, $00
	end

Script_066_4b20:
	setmap MAP_G5_0E, $00
	end2

StardreamMachineRoom_0b_ObjectEvents:
	object_event $62, 14,  3, wEventFlags + 18, $01, $00, $00, $00, Script_066_4b53
	object_event $74, 14,  2, wEventFlags + 18, $01, $01, $00, $01, Script_066_41f2
	objects_end
ObjSprite_66_4b3b::
	object_event $74, 14,  0, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end
ObjSprite_66_4b47::
	object_event $75,  4,  0, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_4b53::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_7971
	startbattle BattleData_02d_4db8
	checkbit wEventFlags + 3, $03, Script_066_41f1
	clearobject $02
	loadobjsprite ObjSprite_66_4b3b
	objmove $02, MovementData_066_7d15
	stext text_66_7981
	setbit wEventFlags + 18, $01
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_66_7990
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_79cc
	spriteface  2, FACE_RIGHT
	loadobjsprite ObjSprite_66_4c55
	spriteface  4, FACE_UP
	objmove $04, MovementData_066_7d15
	spriteface  4, FACE_UP
	spriteface  4, FACE_LEFT
	spriteface  4, FACE_DOWN
	stext text_66_79d6
	setbit wEventFlags + 18, $02
	face FACE_UP
	setmap MAP_STARDREAM_MACHINE_ROOM_0B, $01
	stext text_66_79e1
	end
Script_066_4bb1::
	checkbit wEventFlags + 18, $01, Script_066_4bc1
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $00
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	end2

Script_066_4bc1:
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $02
	end2

Script_066_4bc5::
	stext text_66_792e
	end

Script_066_4bc9::
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_7a0c
	face FACE_LEFT
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $03
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_UP
	stext text_66_7a20
	loadobjsprite ObjSprite_66_4b47
	objmove $04, MovementData_066_7d04
	setbit wEventFlags + 18, $03
	scr_62 $07, $01
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	warpmode GAMEMODE_FLOATING_ISLAND_CUTSCENE1, $1a, $02
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_66_7a50
	stext text_66_7a6d
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_66_7a7e
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_CARDILLA_HOUSE, $03
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	stext text_66_7a94
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_7af9
	setmapgroup $06
	farjump2 Script_06c_4752
	end

CardillaHouse_ObjectEvents3:
	object_event $0e,  4,  4, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $0f,  3,  4, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end
ObjSprite_66_4c55::
	object_event $50,  5,  0, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

StardreamMachineRoom_0d_ObjectEvents:
	object_event $0e,  4,  2, 0, $00, $00, $00, $00, Script_066_4bc5
	object_event $0f,  4,  3, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end

StardreamMachineRoom_0d_ObjectEvents2:
	object_event $6f,  4,  2, 0, $00, $00, $00, $00, Script_066_4bc9
	object_event $0f,  4,  3, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end
Script_066_4c8f::
	checkbit wEventFlags + 15, $05, Script_066_4c96
	end

Script_066_4c96:
	stext text_66_7bbc
	farjump2 Script_067_6e06
	end

Script_066_4c9e:: ; farjump2 target (bank_67)
	setmap MAP_STARDREAM_CITY_07, $04
	end

INCLUDE "data/text/script_stardream_airship_65_2.asm"
INCLUDE "data/text/script_stardream_airship_16.asm"
INCLUDE "data/text/script_stardream_airship_18.asm"
INCLUDE "data/text/script_presale_house_outside.asm"
INCLUDE "data/text/script_stardream_city_07_1.asm"
INCLUDE "data/text/script_stardream_city_1e_1.asm"
INCLUDE "data/text/script_presale_house_1f_1.asm"
INCLUDE "data/text/script_stardream_city_20.asm"
INCLUDE "data/text/script_stardream_florist_10_1.asm"
INCLUDE "data/text/script_stardream_city_0f.asm"
INCLUDE "data/text/script_stardream_school_24.asm"
INCLUDE "data/text/script_stardream_school_25.asm"
INCLUDE "data/text/script_stardream_school_26_1.asm"
INCLUDE "data/text/script_stardream_hospital_11.asm"
INCLUDE "data/text/script_stardream_hospital_12_1.asm"
INCLUDE "data/text/script_stardream_hospital_13.asm"
INCLUDE "data/text/script_stardream_hospital_14.asm"
INCLUDE "data/text/script_cardilla_house_1d.asm"
INCLUDE "data/text/script_stardream_hospital_12_2.asm"
INCLUDE "data/text/script_stardream_hospital_15_1.asm"
INCLUDE "data/text/script_permafrost_garden.asm"
INCLUDE "data/text/script_stardream_florist_10_2.asm"
INCLUDE "data/text/script_stardream_school_26_2.asm"
INCLUDE "data/text/script_cardilla_house_26_2_610e.asm"
INCLUDE "data/text/script_presale_house_26_2_6240.asm"
INCLUDE "data/text/script_presale_house_1a_1.asm"
INCLUDE "data/text/script_presale_house_1f_2.asm"
INCLUDE "data/text/script_presale_house_1a_2.asm"
INCLUDE "data/text/script_cardilla_house_1a_2_6d46.asm"
INCLUDE "data/text/script_stardream_secret_base.asm"
INCLUDE "data/text/script_stardream_city_1e_2.asm"
INCLUDE "data/text/script_stardream_doll_trade.asm"
INCLUDE "data/text/script_stardream_hospital_15_2.asm"
INCLUDE "data/text/script_stardream_city_07_4.asm"
INCLUDE "data/text/script_stardream_machine_room_26_3.asm"
INCLUDE "data/text/script_stardream_machine_room_0d_1.asm"
INCLUDE "data/text/script_stardream_machine_room_0b.asm"
INCLUDE "data/text/script_stardream_machine_room_0d_2.asm"
INCLUDE "data/text/script_stardream_machine_room_07_5.asm"
INCLUDE "data/text/script_stardream_hospital_15_3.asm"
MovementData_066_7cc7:
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $03, $00, $03, $00, $03, $00, $03, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $05, $00, $05, $00, $06, $00
	db $00, $00, $00, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88
MovementData_066_7d04:
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88
MovementData_066_7d15:
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88
MovementData_066_7d36:
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $88
MovementData_066_7d47:
	db $ff, $00, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $ff, $ff, $ff, $00
	db $ff, $ff, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $01, $ff, $01, $ff, $01, $ff
	db $01, $ff, $01, $00, $01, $ff, $02, $00, $02, $ff, $02, $00, $02, $ff, $04, $00
	db $04, $ff, $04, $ff, $06, $00, $88
MovementData_066_7d7e:
	db $ff, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $01, $fe, $00, $ff, $01, $ff, $00
	db $ff, $01, $ff, $00, $ff, $01, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $00, $01, $01, $02, $00, $02, $01, $02, $00, $02, $01, $02, $00
	db $02, $00, $04, $01, $04, $01, $06, $00, $88
MovementData_066_7db7:
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88
MovementData_066_7de0:
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $88
MovementData_066_7e09:
	db $ff, $ff, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff
	db $01, $ff, $01, $ff, $01, $00, $01, $ff, $02, $00, $02, $ff, $02, $00, $02, $ff
	db $02, $00, $02, $ff, $02, $00, $02, $00, $04, $ff, $04, $00, $04, $ff, $88
