Bank0f_EmptyObjectEvent::
	objects_end

Script_00f_4001::
	end

Script_00f_4002::
	setmap MAP_TECH_CITY, $00
	end

Script_00f_4006::
	setmap MAP_TECH_CITY, $02
	end

Script_00f_400a::
	checkbit wEventFlags + 2, $06, Script_00f_4016
	farjump2 Script_00e_4001
	end

Script_00f_4015::
	end

Script_00f_4016::
	setmap MAP_TECH_CITY, $01
	end

ObjectEvents_00f_401a::
	object_event $19,  7,  3, 0, $00, $00, $00, $00, Script_00f_4031
	object_event $16,  6,  6, 0, $00, $00, $06, $01, Script_00f_4035
	objects_end

Script_00f_4031::
	textface text_0f_56ca
	end

Script_00f_4035::
	textface text_0f_573b
	end

ObjectEvents_00f_4039::
	object_event $13,  4,  3, 0, $00, $00, $00, $00, Script_00f_405b
	object_event $1b,  6,  6, 0, $00, $00, $06, $01, Script_00f_4069
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, Script_00f_406d
	objects_end

Script_00f_405b::
	checkbit wEventFlags + 1, $05, Script_00f_4065
	textface text_0f_57ad
	end

Script_00f_4065::
	textface text_0f_58a2
	end

Script_00f_4069::
	textface text_0f_5811
	end

Script_00f_406d::
	checkbit wEventFlags + 1, $05, Script_00f_4095
	spriteface $04, $03
	emote $04, $00
	delay $03, $20
	spriteface $04, $02
	spriteface $02, $03
	stext text_0f_5820
	stext text_0f_5877
	spriteface $02, $00
	stext text_0f_5881
	emote $00, $01
	delay $03, $20
	end

Script_00f_4095::
	textface text_0f_58cc
	spriteface $02, $03
	emote $02, $00
	delay $03, $20
	stext text_0f_5936
	emote $00, $01
	delay $03, $20
	end

PowerPlantOutside_ObjectEvents2::
	object_event $2b,  5,  6, wEventFlags + 2, $04, $00, $00, $00, Script_00f_4001
	object_event $2e,  7,  7, wEventFlags + 2, $04, $00, $00, $01, Script_00f_4001
	objects_end

PowerPlantOutside_ObjectEvents::
	object_event $2b,  5,  6, wEventFlags + 2, $04, $00, $00, $00, Script_00f_40ce
	objects_end

Script_00f_40ce::
	checkbit wEventFlags + 1, $06, Script_00f_40d8
	textface text_0f_4691
	end

Script_00f_40d8::
	checkbit wEventFlags + 2, $03, Script_00f_40ef
	textface text_0f_4691
	emote $00, $01
	delay $03, $20
	stext text_0f_46aa
	setbit wEventFlags + 1, $07
	end

Script_00f_40ef::
	stext text_0f_4a46
	stext text_0f_4a5a
	face FACE_LEFT
	setmap MAP_POWER_PLANT_OUTSIDE, $02
	spriteface $03, $02
	spriteface $02, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spriteface $02, $00
	emote $02, $00
	delay $03, $20
	spriteface $03, $03
	spritewalk $03, $03
	spriteface $03, $01
	spritewalk $03, $02
	spriteface $03, $03
	spriteface $02, $02
	emote $02, $02
	delay $03, $20
	spriteface $03, $02
	setattach $02, $03, $00, $10
	objmove $03, Script_00f_45d4
	clearattach $03
	emote $02, $00
	emote $00, $00
	delay $03, $20
	stext text_0f_4a72
	emote $02, $04
	delay $03, $20
	stext text_0f_4a8e
	startbattle BattleData_02d_4ae3
	checkbit wEventFlags + 3, $03, Script_00f_415c
	clearobject $03
	clearobject $02
	setbit wEventFlags + 2, $04
	end

Script_00f_415c::
	setmap MAP_POWER_PLANT_OUTSIDE, $03
	end

PowerPlant1F_ObjectEvents::
	object_event $34,  9,  6, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $34,  9,  4, 0, $00, $00, $00, $01, Script_00f_41fe
	object_event $34,  2,  3, 0, $00, $00, $00, $02, Script_00f_41fe
	object_event $34,  2,  5, 0, $00, $00, $00, $03, Script_00f_41fe
	objects_end

PowerPlant2F_ObjectEvents::
	object_event $34,  9,  6, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $34,  2,  3, 0, $00, $00, $00, $01, Script_00f_41fe
	object_event $17,  7,  4, wEventFlags + 2, $05, $00, $00, $02, Script_00f_41ff
	objects_end

PowerPlant3F_ObjectEvents::
	object_event $34,  6,  5, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $34,  6,  3, 0, $00, $00, $00, $01, Script_00f_41fe
	object_event $34,  2,  4, 0, $00, $00, $00, $02, Script_00f_41fe
	object_event $34,  2,  6, 0, $00, $00, $00, $03, Script_00f_41fe
	objects_end

PowerPlant4F_ObjectEvents::
	object_event $34,  7,  6, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $27,  7,  4, wEventFlags + 2, $06, $00, $00, $01, Script_00f_41fe
	object_event $28,  8,  4, wEventFlags + 2, $06, $00, $00, $02, Script_00f_41fe
	objects_end

Script_00f_41fe::
	end

Script_00f_41ff::
	textface text_0f_4ab7
	emote $00, $00
	delay $03, $20
	stext text_0f_4ac7
	stext text_0f_4ad7
	spriteface $04, $02
	objmove $04, Script_00f_59b1
	clearobject $04
	setbit wEventFlags + 2, $05
	end

Script_00f_421c::
	checkbit wEventFlags + 2, $06, Script_00f_42af
	spriteface $03, $03
	spriteface $04, $02
	stext text_0f_4b28
	stext text_0f_4b4c
	spriteface $03, $00
	spriteface $04, $00
	emote $03, $00
	emote $04, $00
	delay $03, $20
	stext text_0f_4b71
	stext text_0f_4b86
	startbattle BattleData_02d_4b12
	checkbit wEventFlags + 3, $03, Script_00f_42a3
	stext text_0f_4bc3
	spriteface $03, $02
	spriteface $04, $02
	setattach $04, $03, $00, $10
	objmove $03, Script_00f_594f
	clearattach $03
	objmove $03, Script_00f_5980
	clearobject $03
	spriteface $04, $03
	stext text_0f_4bf0
	spriteface $04, $02
	objmove $04, Script_00f_5980
	clearobject $04
	emote $00, $01
	delay $03, $20
	stext text_0f_4c3c
	emote $00, $00
	delay $03, $20
	move MovementData_OneUp
	move MovementData_OneUp
	face FACE_RIGHT
	move MovementData_OneRight
	move MovementData_OneRight
	face FACE_UP
	stext text_0f_4c47
	setbit wEventFlags + 2, $06
	setmappredef MAPPREDEF_07
	face FACE_DOWN
	setmap MAP_TECH_CITY, $01
	end

Script_00f_42a3::
	face FACE_DOWN
	move MovementData_OneDown
	move MovementData_OneDown
	spriteface $01, $00
	end

Script_00f_42af::
	end

TechCity_ObjectEvents::
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00f_4309
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00f_430d
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00f_4311
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00f_4315
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00f_4319
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00f_431d
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00f_4321
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00f_4325
	objects_end

Script_00f_4309::
	textface text_0f_4c56
	end

Script_00f_430d::
	textface text_0f_4c89
	end

Script_00f_4311::
	textface text_0f_4cc8
	end

Script_00f_4315::
	textface text_0f_4d0f
	end

Script_00f_4319::
	textface text_0f_4d50
	end

Script_00f_431d::
	textface text_0f_5627
	end

Script_00f_4321::
	textface text_0f_4da4
	end

Script_00f_4325::
	textface text_0f_5673
	end

ObjectEvents_00f_4329::
	object_event $12,  7,  5, 0, $00, $00, $0b, $00, Script_00f_4340
	object_event $1d,  6,  3, 0, $00, $00, $00, $01, Script_00f_4344
	objects_end

Script_00f_4340::
	textface text_0f_4e1b
	end

Script_00f_4344::
	textface text_0f_55c3
	end

ObjectEvents_00f_4348::
	object_event $16,  5,  5, 0, $00, $00, $00, $00, Script_00f_435f
	object_event $17,  9,  4, 0, $00, $00, $00, $01, Script_00f_4371
	objects_end

Script_00f_435f::
	checkbit wEventFlags + 2, $07, Script_00f_436d
	textface text_0f_4e54
	setbit wEventFlags + 2, $07
	end

Script_00f_436d::
	textface text_0f_4e9b
	end

Script_00f_4371::
	textface text_0f_4eae
	end

TechShop_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_00f_4381
	objects_end

Script_00f_4381::
	textface text_0f_4ebe
	end

Script_00f_4385::
	face FACE_LEFT
	spriteface $02, $03
	stext text_0f_4ebe
	checkbit wEventFlags + 4, $01, Script_00f_4396
	scr_35 $00
	end

Script_00f_4396::
	end

TechHealingCenter_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_00f_43ae
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_00f_43b2
	objects_end

Script_00f_43ae::
	stext text_0f_4efb
	end

Script_00f_43b2::
	stext text_0f_4f13
	end

Script_00f_43b6::
	face FACE_UP
	stext text_0f_4efb
	checkbit wEventFlags + 3, $03, Script_00f_43c3
	scr_37
	end

Script_00f_43c3::
	end

Script_00f_43c4::
	face FACE_UP
	stext text_0f_4f13
	checkbit wEventFlags + 3, $03, Script_00f_43d1
	townmusicanim
	end

Script_00f_43d1::
	end

ObjectEvents_00f_43d2::
	object_event $29,  5,  5, 0, $00, $00, $00, $00, Script_00f_4427
	object_event $2d,  6,  4, wEventFlags + 3, $00, $00, $00, $01, Script_00f_4423
	objects_end

ObjectEvents_00f_43e9::
	object_event $29,  5,  5, 0, $00, $00, $00, $00, Script_00f_44d1
	object_event $02,  4,  3, wEventFlags + 3, $01, $00, $00, $01, Script_00f_4422
	object_event $03,  3,  3, wEventFlags + 3, $01, $00, $00, $02, Script_00f_4422
	object_event $2d,  6,  4, wEventFlags + 3, $00, $00, $00, $03, Script_00f_4422
	objects_end

ObjectEvents_00f_4416::
	object_event $29,  5,  5, 0, $00, $00, $00, $00, Script_00f_44db
	objects_end

Script_00f_4422::
	end

Script_00f_4423::
	textface text_0f_4f42
	end

Script_00f_4427::
	face FACE_UP
	setplayerchar $00
	scr_62 $01, $00
	setmap MAP_G0_12, $01
	emote $02, $00
	delay $02, $20
	stext text_0f_4f94
	emote $00, $03
	delay $03, $20
	stext text_0f_4fca
	stext text_0f_4fdc
	face FACE_LEFT
	move MovementData_OneLeft
	move MovementData_OneLeft
	stext text_0f_504b
	face FACE_UP
	stext text_0f_5097
	emote $00, $00
	delay $03, $20
	face FACE_RIGHT
	move MovementData_OneRight
	move MovementData_OneRight
	face FACE_UP
	spriteface $02, $01
	spritewalk $02, $02
	spritewalk $02, $02
	delay $03, $10
	spriteface $02, $03
	spritewalk $02, $04
	spritewalk $02, $04
	spriteface $02, $01
	delay $03, $10
	spriteface $02, $02
	spritewalk $02, $03
	spritewalk $02, $03
	spriteface $02, $00
	spritewalk $02, $01
	spritewalk $02, $01
	stext text_0f_50ed
	emote $00, $03
	delay $03, $20
	stext text_0f_51c1
	incsteps
	spriteface $05, $02
	spritewalk $05, $03
	spritewalk $05, $03
	spriteface $05, $00
	spritewalk $05, $01
	spriteface $05, $03
	emote $05, $03
	delay $03, $20
	stext text_0f_5200
	spriteface $05, $00
	spritewalk $05, $01
	spritewalk $05, $01
	spritewalk $05, $01
	spritewalk $05, $01
	clearobject $05
	setbit wEventFlags + 3, $00
	end

Script_00f_44d1::
	checkbit wEventFlags + 3, $01, Script_00f_44db
	textface text_0f_5299
	end

Script_00f_44db::
	textface text_0f_554f
	end

Script_00f_44df::
	checkbit wEventFlags + 3, $01, Script_00f_458e
	spriteface $02, $00
	stext text_0f_52fb
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, $01
	spriteface $01, $01
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	spriteface $01, $03
	spritewalk $01, $04
	spriteface $01, $01
Script_00f_4507::
	spritewalk $02, $01
	stext text_0f_531f
	stext text_0f_538f
	scr_48 $02, $06
	stext text_0f_539e
	scr_48 $02, $07
	stext text_0f_53ad
	spriteface $03, $00
	spriteface $04, $00
	setattach $04, $03, $00, $f0
	objmove $03, Script_00f_5a12
	clearattach $03
	spriteface $03, $03
	spriteface $02, $02
	stext text_0f_53e1
	stext text_0f_53f6
	stext text_0f_5439
	spriteface $03, $00
	spriteface $02, $01
	spritewalk $02, $02
	spriteface $02, $02
	spritewalk $02, $03
	spritewalk $02, $03
	spriteface $02, $00
	delay $03, $10
	spriteface $02, $02
	spritewalk $02, $03
	spriteface $02, $00
	spritewalk $02, $01
	spriteface $02, $03
	stext text_0f_5446
	clearplayerpos
	spritewalk $03, $01
	clearobject $03
	spriteface $04, $03
	spritewalk $04, $04
	spriteface $04, $00
	spritewalk $04, $01
	clearobject $04
	scr_62 $01, $01
	stext text_0f_54ad
	stext text_0f_54c5
	spriteface $02, $00
	stext text_0f_5521
	setbit wEventFlags + 3, $01
	end

Script_00f_458e::
	setmap MAP_TECH_CITY, $08
	end

Script_00f_4592::
	checkbit wEventFlags + 3, $01, Script_00f_458e
	spriteface $02, $00
	stext text_0f_52fb
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, $01
	spriteface $01, $01
	farjump Script_00f_4507
	end

Script_00f_45af::
	checkbit wEventFlags + 3, $01, Script_00f_45b9
	setmap MAP_G0_12, $00
	end

Script_00f_45b9::
	setmap MAP_G0_12, $02
	end

Script_00f_45bd::
	stext text_0f_557d
	checkbit wEventFlags + 3, $01, Script_00f_45c7
	end

Script_00f_45c7::
	ifcharindex $01, Script_00f_45cf
	stext text_0f_5595
	end

Script_00f_45cf::
	farjump2 Script_012_4189
	end

; TODO:: objmove movement path, signed (x, y) deltas per frame, $88 terminator
Script_00f_45d4::
	db $00, $ff, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $03, $00, $03, $00
	db $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00
	db $02, $01, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03
	db $00, $03, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $ff, $01, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $ff, $ff, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $88

INCLUDE "data/text/script_power_plant_outside_1.asm"

INCLUDE "data/text/script_power_plant_outside_2.asm"
INCLUDE "data/text/script_power_plant2_f.asm"
INCLUDE "data/text/script_tech_city_1.asm"
INCLUDE "data/text/script_tech_shop.asm"
INCLUDE "data/text/script_tech_healing_center.asm"
INCLUDE "data/text/script_drleo_spaceship_cutscene.asm"
INCLUDE "data/text/script_tech_city_2.asm"

Script_00f_594f::
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $88

Script_00f_5980::
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $88

Script_00f_59b1::
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $88

Script_00f_5a12::
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $88, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
