; TODO: structured data table (not graphics), classify records
unk_058_4000:
	end

GeothermalShop_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_058_400d
	objects_end

Script_058_400d::
	textface text_58_40a5
	end

Script_058_4011::
	face FACE_LEFT
	spriteface 2, FACE_RIGHT
	stext text_58_40a5
	checkbit wEventFlags + 4, $01, Script_058_4022
	scr_35 $07
	end

Script_058_4022::
	end

GeothermalHealingCenter_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_058_403a
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_058_403e
	objects_end

Script_058_403a::
	stext text_58_405e
	end

Script_058_403e::
	stext text_58_4076
	end

Script_058_4042::
	face FACE_UP
	stext text_58_405e
	checkbit wEventFlags + 3, $03, Script_058_404f
	scr_37
	end

Script_058_404f::
	end

Script_058_4050::
	face FACE_UP
	stext text_58_4076
	checkbit wEventFlags + 3, $03, Script_058_405d
	townmusicanim
	end

Script_058_405d::
	end

INCLUDE "data/text/script_geothermal_healing_center.asm"
INCLUDE "data/text/script_geothermal_shop.asm"
Script_058_40bc::
	setmap MAP_GEOTHERMAL_CITY_14, $08
	checkbit wEventFlags + 9, $04, Script_058_40da
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_58_4a88
	setbit wEventFlags + 9, $04
	setmappredef $16
	end

Script_058_40da:
	end

Script_058_40db::
	setmap MAP_G4_1E, $01
	end

Script_058_40df::
	farjump2 Script_05c_4058
	end

Script_058_40e4::
	farjump2 Script_059_40c5
	end
Script_058_40e9::
	end

G4_17_ObjectEvents:
G4_1E_ObjectEvents:
G4_1F_ObjectEvents:
LifeValleyRescue_ObjectEvents3:
G4_50_ObjectEvents:
	objects_end

Script_058_40eb::
	warppowerplant
	end

Script_058_40ed::
	randomwarp
	setmap MAP_G4_20, $00
	end

Script_058_40f2::
	warp6c
	checkbit wEventFlags + 11, $05, Script_058_40fd
	setmap MAP_G4_17, $00
	end

Script_058_40fd::
	setmap MAP_G4_50, $00
	end

G4_20_ObjectEvents:
	object_event $68,  6,  7, wEventFlags + 9, $05, $01, $08, $00, Script_058_40f2
	object_event $68,  4, 17, wEventFlags + 9, $06, $01, $07, $00, Script_058_40f2
	object_event $68, 11, 12, wEventFlags + 9, $07, $01, $05, $00, Script_058_40f2
	object_event $68, 17, 11, wEventFlags + 10, $00, $01, $0b, $00, Script_058_40f2
	object_event $68, 22, 20, wEventFlags + 10, $01, $01, $09, $00, Script_058_40f2
	objects_end

TravelingShip_18_ObjectEvents:
	object_event $31, 11,  3, 0, $00, $00, $00, $00, Script_058_4145
	objects_end

Script_058_4145::
	checkbit wEventFlags + 10, $07, Script_058_414f
	textface text_58_5052
	end

Script_058_414f::
	checkbit wEventFlags + 11, $00, Script_058_41bd
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	stext text_58_5052
	loadobjsprite ObjSprite_58_41e2
	spriteface 3, FACE_UP
	objmove $03, MovementData_058_6761
	spriteface 3, FACE_RIGHT
	face FACE_LEFT
	spriteface 2, FACE_LEFT
	stext text_58_50bb
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_50c8
	spritewalk 2, MOVE_RIGHT
	spriteface 2, FACE_LEFT
	emote 3, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 3, FACE_LEFT
	objmove $03, MovementData_058_6728
	clearobject $03
	spriteface 2, FACE_DOWN
	face FACE_UP
	stext text_58_50e9
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_DOWN
	stext text_58_5138
	emote 0, EMOTE_EXCLAMATION
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_51c4
	setbit wEventFlags + 11, $00
	end

Script_058_41bd::
	checkbit wEventFlags + 11, $01, Script_058_41c7
	textface text_58_5294
	end

Script_058_41c7::
	checkbit wEventFlags + 11, $02, Script_058_41de
	textface text_58_54f9
	stext text_58_556e
	scr_48 $02, $11
	stext text_58_557e
	setbit wEventFlags + 11, $02
	end

Script_058_41de::
	textface text_58_55ea
	end

ObjSprite_58_41e2::
	object_event $69, 10, 10, 0, $00, $00, $00, $01, Script_058_40e9
	objects_end

G4_52_ObjectEvents:
	object_event $69,  8,  3, 0, $00, $00, $00, $00, Script_058_4232
	object_event $69,  6,  7, 0, $00, $00, $00, $01, Script_058_4232
	object_event $69,  5,  5, 0, $00, $00, $00, $02, Script_058_4232
	objects_end

TravelingShip_19_ObjectEvents:
	object_event $69,  8,  3, wEventFlags + 11, $01, $00, $00, $00, Script_058_4383
	object_event $69,  6,  7, wEventFlags + 11, $01, $00, $00, $01, Script_058_4383
	object_event $69,  5,  5, wEventFlags + 11, $01, $00, $00, $02, Script_058_4383
	objects_end
Script_058_4232:
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_G4_52, $01
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_536a
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5377
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_538c
	stext text_58_53a5
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_53c0
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_53d7
Script_058_42a4::
	warpmode GAMEMODE_MICE_MINIGAME, $52, $01
	checkbit wEventFlags + 11, $01, Script_058_4320
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_53ee
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_53fd
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_540a
	stext text_58_5425
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_544c
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_5463
	farjump Script_058_42a4
	end

Script_058_4320:
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_5477
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5485
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_548e
	stext text_58_54a7
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	emote  0, EMOTE_HEART
	delay $03, $20
	stext text_58_54cf
	spriteface  2, FACE_DOWN
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	end

Script_058_4383:
	checkbit wEventFlags + 11, $00, Script_058_438d
	textface text_58_535f
	end

Script_058_438d:
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_TRAVELING_SHIP_19, $01
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_536a
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5377
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_538c
	stext text_58_53a5
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_53c0
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_53d7
Script_058_43ff::
	warpmode GAMEMODE_MICE_MINIGAME, $19, $01
	checkbit wEventFlags + 11, $01, Script_058_447b
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_53ee
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_53fd
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_540a
	stext text_58_5425
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_544c
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_5463
	farjump Script_058_43ff
	end

Script_058_447b:
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_5477
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5485
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_548e
	stext text_58_54a7
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	emote  0, EMOTE_HEART
	delay $03, $20
	stext text_58_54cf
	spriteface  2, FACE_DOWN
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	setbit wEventFlags + 24, $01
	end

G4_52_ObjectEvents2:
	object_event $06,  8,  6, 0, $00, $00, $00, $00, Script_058_40e9
	object_event $69,  6,  6, 0, $00, $00, $00, $01, Script_058_40e9
	object_event $69,  6,  7, 0, $00, $00, $00, $02, Script_058_40e9
	object_event $69,  6,  8, 0, $00, $00, $00, $03, Script_058_40e9
	objects_end

TravelingShip_19_ObjectEvents2:
	object_event $06,  8,  6, wEventFlags + 24, $01, $00, $00, $00, Script_058_40e9
	object_event $69,  6,  6, wEventFlags + 24, $01, $00, $00, $01, Script_058_40e9
	object_event $69,  6,  7, wEventFlags + 24, $01, $00, $00, $02, Script_058_40e9
	object_event $69,  6,  8, wEventFlags + 24, $01, $00, $00, $03, Script_058_40e9
	objects_end

GeothermalCity_14_ObjectEvents:
	object_event $23,  2, 15, 0, $00, $00, $0a, $00, Script_058_458f
	object_event $24,  8,  6, 0, $00, $00, $06, $01, Script_058_45db
	object_event $14, 13, 21, wEventFlags + 11, $05, $01, $00, $00, Script_058_457f
	object_event $13, 14, 15, wEventFlags + 11, $05, $01, $05, $01, Script_058_4583
	object_event $1a, 16,  7, wEventFlags + 11, $05, $01, $06, $02, Script_058_4587
	object_event $16,  6, 14, wEventFlags + 11, $05, $01, $0b, $03, Script_058_458b
	objects_end

Script_058_457f::
	textface text_58_5f77
	end

Script_058_4583::
	textface text_58_5fc7
	end

Script_058_4587::
	textface text_58_6003
	end

Script_058_458b::
	textface text_58_602b
	end

Script_058_458f::
	checkbit wEventFlags + 10, $06, Script_058_4599
	textface text_58_4a9c
	end

Script_058_4599::
	checkbit wEventFlags + 10, $07, Script_058_45b9
	textface text_58_4f15
	emote 2, EMOTE_ANGER
	delay $03, $20
	stext text_58_4f70
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_4f88
	setbit wEventFlags + 10, $07
	end

Script_058_45b9::
	checkbit wEventFlags + 11, $05, Script_058_45c3
	textface text_58_4ff1
	end

Script_058_45c3::
	checkbit wEventFlags + 11, $06, Script_058_45d7
	textface text_58_5ea9
	stext text_58_5ef8
	scr_48 $00, $17
	setbit wEventFlags + 11, $06
	end

Script_058_45d7::
	textface text_58_5f09
	end

Script_058_45db::
	checkbit wEventFlags + 11, $05, Script_058_45e5
	textface text_58_4b04
	end

Script_058_45e5::
	textface text_58_5f40
	end

GeothermalCity_34_ObjectEvents:
	object_event $14,  4,  3, wEventFlags + 11, $05, $01, $0b, $00, Script_058_4600
	object_event $17,  6,  5, wEventFlags + 11, $05, $01, $00, $01, Script_058_4604
	objects_end

Script_058_4600:
	textface text_58_608c
	end

Script_058_4604:
	textface text_58_60db
	end

GeothermalCity_35_ObjectEvents:
	object_event $1f,  7,  5, wEventFlags + 11, $05, $01, $00, $00, Script_058_461f
	object_event $19,  2,  3, wEventFlags + 11, $05, $01, $00, $01, Script_058_4623
	objects_end

Script_058_461f::
	textface text_58_6144
	end

Script_058_4623::
	textface text_58_6182
	end

GeothermalCity_37_ObjectEvents:
	object_event $15,  4,  3, wEventFlags + 11, $05, $01, $00, $00, Script_058_463e
	object_event $1a,  7,  3, wEventFlags + 11, $05, $01, $0a, $01, Script_058_4642
	objects_end

Script_058_463e::
	textface text_58_6246
	end

Script_058_4642::
	checkbit wEventFlags + 11, $07, Script_058_4659
	textface text_58_6277
	stext text_58_62c1
	stext text_58_6310
	scr_48 $02, $13
	setbit wEventFlags + 11, $07
	end

Script_058_4659::
	textface text_58_6321
	end

GeothermalCity_36_ObjectEvents2:
	object_event $6d,  8,  3, 0, $00, $00, $00, $00, Script_058_46fd
	objects_end

GeothermalCity_36_ObjectEvents:
	object_event $6d,  8,  3, wEventFlags + 10, $02, $00, $00, $00, Script_058_468c
	object_event $1a,  8,  3, wEventFlags + 10, $02, $01, $00, $00, Script_058_46d9
	objects_end

ObjSprite_58_4680:
	object_event $1a,  1,  3, 0, $00, $00, $00, $00, Script_058_46d9
	objects_end

Script_058_468c:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_58_4b4a
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_4b5e
	spriteface  2, FACE_UP
	face FACE_LEFT
	objmove $02, MovementData_058_665c
	clearobject $02
	emote  0, EMOTE_TEAR
	delay $03, $20
	loadobjsprite ObjSprite_58_4680
	spriteface  2, FACE_RIGHT
	objmove $02, MovementData_058_66ef
	spriteface  2, FACE_DOWN
	face FACE_UP
	stext text_58_4b99
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_4bd6
	stext text_58_4be7
	stext text_58_4c97
	stext text_58_4cbc
	setbit wEventFlags + 10, $02
	end

Script_058_46d9:
	checkbit wEventFlags + 10, $03, Script_058_46e7
	textface text_58_4d0c
	setbit wEventFlags + 10, $03
	end

Script_058_46e7:
	checkbit wEventFlags + 10, $04, Script_058_46f5
	textface text_58_4d98
	setbit wEventFlags + 10, $04
	end

Script_058_46f5:
	textface text_58_4e39
	setbit wEventFlags + 10, $05
	end

Script_058_46fd:
	stext text_58_61bc
	end

Script_058_4701:
	checkbit wEventFlags + 11, $05, Script_058_470b
	setmap MAP_GEOTHERMAL_CITY_36, $00
	end

Script_058_470b:
	setmap MAP_GEOTHERMAL_CITY_36, $01
	end

Script_058_470f:
	setmap MAP_DEATH_VALLEY, $00
	checkbit wEventFlags + 11, $02, Script_058_4735
	stext text_58_4ebc
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_4edb
	face FACE_RIGHT
	move MovementData_OneRight
	clearplayerpos
	spritewalk  1, MOVE_LEFT
	spriteface  1, FACE_RIGHT
	setbit wEventFlags + 10, $06
	end

Script_058_4735:
	checkbit wEventFlags + 11, $03, Script_058_4748
	stext text_58_5656
	emote  0, EMOTE_HEART
	delay $03, $20
	stext text_58_5697
	end

Script_058_4748:
	end

DeathValley_ObjectEvents:
	object_event $0a, 21, 10, wEventFlags + 11, $03, $00, $00, $00, Script_058_4797
	object_event $0b, 21, 11, wEventFlags + 11, $03, $00, $00, $01, Script_058_40e9
	object_event $67, 19, 26, wEventFlags + 11, $05, $00, $00, $00, Script_058_481c
	object_event $22, 18, 26, wEventFlags + 11, $05, $00, $00, $01, Script_058_40e9
	object_event $13, 18, 25, wEventFlags + 11, $05, $00, $00, $02, Script_058_40e9
	object_event $16, 17, 27, wEventFlags + 11, $05, $00, $00, $03, Script_058_40e9
	object_event $18, 17, 26, wEventFlags + 11, $05, $00, $00, $04, Script_058_40e9
	objects_end
Script_058_4797::
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_58_56be
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_56cc
	emote  2, EMOTE_ANGER
	delay $03, $20
	stext text_58_56fe
	startbattle BattleData_02d_4beb
	checkbit wEventFlags + 3, $03, unk_058_4000
	stext text_58_5719
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_5736
	stext text_58_575e
	stext text_58_576d
	stext text_58_583a
	stext text_58_5847
	stext text_58_588d
	stext text_58_589d
	stext text_58_58e8
	scr_48 $02, $12
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $16, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_58f7
	stext text_58_591b
	stext text_58_5939
	clearplayerpos
	spritewalk  2, MOVE_UP
	clearobject $02
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	loadscriptedmon $05
	scr_62 $05, $01
	stext text_58_5967
	stext text_58_5980
	setbit wEventFlags + 11, $03
	end
Script_058_481c::
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	spriteface  6, FACE_RIGHT
	stext text_58_59c6
	end

LifeValley_ObjectEvents:
	object_event $20,  7, 19, wEventFlags + 11, $04, $00, $00, $00, Script_058_4838
	objects_end

Script_058_4838:
	ifcharindex $05, Script_058_4840
	textface text_58_5a0c
	end

Script_058_4840:
	checkbit wEventFlags + 11, $04, Script_058_4864
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	spriteface 2, FACE_DOWN
	stext text_58_5a50
	stext text_58_5a7d
	spriteface 2, FACE_RIGHT
	spritewalk 2, MOVE_RIGHT
	spriteface 2, FACE_DOWN
	setbit wEventFlags + 11, $04
	end

Script_058_4864:
	textface text_58_5a7d
	end

LifeValleyRescue_ObjectEvents:
	object_event $4f,  5,  5, wEventFlags + 11, $05, $00, $00, $00, Script_058_48a5
	object_event $51,  6,  5, wEventFlags + 11, $05, $00, $00, $01, Script_058_48a1
	objects_end

LifeValleyRescue_ObjectEvents2:
	object_event $4f,  5,  5, 0, $00, $00, $00, $00, Script_058_40e9
	object_event $51,  6,  5, 0, $00, $00, $00, $01, Script_058_40e9
	object_event $0a,  6,  6, 0, $00, $00, $00, $02, Script_058_40e9
	objects_end
Script_058_48a1::
	textface text_58_5aac
	end
Script_058_48a5::
	setplayerchar $00
	face FACE_UP
	setmap MAP_LIFE_VALLEY_RESCUE, $01
	spriteface 4, FACE_UP
	stext text_58_5aac
	stext text_58_5a99
	stext text_58_5ac1
	stext text_58_5ad6
	startbattle BattleData_02d_4bfb
	checkbit wEventFlags + 3, $03, Script_058_49bc
	clearobject $02
	loadobjsprite unk_058_49e5
	playsound SFX_2c
	spriteface 2, FACE_UP
	delay $03, $08
	spriteface 2, FACE_UP
	clearobject $02
	delay $03, $08
	loadobjsprite unk_058_49f1
	playsound SFX_2c
	spriteface 2, FACE_UP
	delay $03, $08
	spriteface 2, FACE_UP
	clearobject $02
	delay $03, $08
	loadobjsprite unk_058_49fd
	playsound SFX_2c
	spriteface 2, FACE_UP
	delay $03, $08
	spriteface 2, FACE_UP
	clearobject $02
	delay $03, $08
	stext text_58_5ae9
	stext text_58_5b70
	emote 3, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 3, FACE_LEFT
	spritewalk 3, MOVE_LEFT
	spriteface 3, FACE_DOWN
	spriteface 4, FACE_LEFT
	stext text_58_5b9a
	stext text_58_5bd5
	emote 0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_5be6
	stext text_58_5c02
	spriteface 4, FACE_UP
	spritewalk 4, MOVE_UP
	spriteface 4, FACE_LEFT
	spriteface 3, FACE_RIGHT
	stext text_58_5c45
	emote 3, EMOTE_TEAR
	delay $03, $20
	stext text_58_5c68
	stext text_58_5c7f
	emote 3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_5cbb
	emote 4, EMOTE_HEART
	delay $03, $20
	stext text_58_5ce6
	stext text_58_5cf0
	spriteface 3, FACE_LEFT
	objmove $03, MovementData_058_67e4
	clearobject $03
	emote 4, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk 4, MOVE_LEFT
	spriteface 4, FACE_DOWN
	stext text_58_5d14
	emote 0, EMOTE_TEAR
	delay $03, $20
	setbit wEventFlags + 11, $05
	setmap MAP_SACREDTREE_STARDREAM_DEPARTURE, $02
	spriteface 3, FACE_UP
	stext text_58_5d71
	emote 2, EMOTE_ANGER
	delay $03, $20
	stext text_58_5dac
	stext text_58_5dba
	spriteface 3, FACE_DOWN
	objmove $03, MovementData_058_67bb
	clearobject $03
	loadobjsprite ObjSprite_58_49c2
	spriteface 3, FACE_UP
	objmove $03, MovementData_058_6761
	stext text_58_5dc7
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_5dd2
	stext text_58_5e0f
	stext text_58_5e56
	stext text_58_5e73
	setmap MAP_LIFE_VALLEY_RESCUE, $02
	end
Script_058_49bc::
	face FACE_DOWN
	setmap MAP_LIFE_VALLEY, $02
	end
ObjSprite_58_49c2:
	object_event $50,  6, 11, 0, $00, $00, $00, $01, Script_058_40e9
	objects_end

SacredtreeStardreamDeparture_ObjectEvents3:
	object_event $4d, 6, 3, 0, $00, $00, $00, $00, Script_058_40e9
	object_event $62, 6, 4, 0, $00, $00, $00, $01, Script_058_40e9
	objects_end

unk_058_49e5:
	object_event $66, 4, 4, 0, $00, $00, $00, $00, Script_058_40e9
	objects_end

unk_058_49f1:
	object_event $66, 6, 3, 0, $00, $00, $00, $00, Script_058_40e9
	objects_end

unk_058_49fd:
	object_event $66, 7, 4, 0, $00, $00, $00, $00, Script_058_40e9
	objects_end

Script_058_4a09::
	checkbit wEventFlags + 11, $05, Script_058_4a13
Script_058_4a0f::
	setmap MAP_G4_1E, $00
	end

Script_058_4a13::
	checkbit wEventFlags + 12, $01, Script_058_4a0f
	setmap MAP_G4_1E, $03
	end

G4_1E_ObjectEvents2:
	object_event $62,  2,  3, wEventFlags + 12, $01, $00, $00, $00, Script_058_4a29
	objects_end
Script_058_4a29::
	textface text_58_63df
	startbattle BattleData_02d_4c1a
	checkbit wEventFlags + 3, $03, unk_058_4000
	clearobject $02
	emote 0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_63fd
	setbit wEventFlags + 12, $01
	end

TravelingShip_51_ObjectEvents:
	object_event $31, 11, 3, 0, $00, $00, $00, $00, Script_058_4a60
	object_event $51, 8, 4, 0, $00, $00, $00, $01, Script_058_4a5c
	objects_end
Script_058_4a5c::
	textface text_58_644a
	end
Script_058_4a60::
	checkbit wEventFlags + 12, $02, Script_058_4a80
	textface text_58_6475
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_64a8
	checkbit wEventFlags + 3, $03, Script_058_4a84
	stext text_58_6534
	setbit wEventFlags + 12, $02
	end
Script_058_4a80::
	textface text_58_6648
	end
Script_058_4a84::
	stext text_58_6503
	end
INCLUDE "data/text/script_geothermal_city_14_1.asm"
INCLUDE "data/text/script_geothermal_city_36_1.asm"
INCLUDE "data/text/script_geothermal_city_14_2.asm"
INCLUDE "data/text/script_traveling_ship_18_1.asm"
INCLUDE "data/text/script_traveling_ship_19.asm"
INCLUDE "data/text/script_traveling_ship_18_2.asm"
INCLUDE "data/text/script_death_valley.asm"
INCLUDE "data/text/script_life_valley.asm"
INCLUDE "data/text/script_life_valley_rescue.asm"
INCLUDE "data/text/script_radar_station_4f_5d71.asm"
INCLUDE "data/text/script_geothermal_city_14_3.asm"
INCLUDE "data/text/script_geothermal_city_34.asm"
INCLUDE "data/text/script_geothermal_city_35.asm"
INCLUDE "data/text/script_geothermal_city_36_2.asm"
INCLUDE "data/text/script_geothermal_city_37.asm"
INCLUDE "data/text/script_g4_1e.asm"
INCLUDE "data/text/script_traveling_ship_51.asm"
	MovementData_058_665c::
	db $ff, $ff, $fe, $fe, $fe, $ff, $fe, $fe, $fe, $ff, $fe, $ff, $fe, $fe, $fe, $fe
	db $fe, $ff, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $ff, $fe
	db $ff, $fe, $fe, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $00, $ff, $00, $ff, $ff, $ff
	db $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $ff, $00, $ff
	db $01, $ff, $00, $ff, $00, $ff, $01, $fe, $01, $fe, $01, $fe, $02, $fe, $01, $fe
	db $01, $fe, $02, $fe, $02, $fe, $01, $fe, $04, $fc, $04, $fc, $04, $fc, $04, $fe
	db $04, $fd, $88
MovementData_058_66ef::
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $88
MovementData_058_6728::
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $88
MovementData_058_6761::
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88
MovementData_058_679a::
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $88
MovementData_058_67bb::
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $88
MovementData_058_67e4::
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $88, $00, $00, $00

