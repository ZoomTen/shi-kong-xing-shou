Script_012_4000:
	face FACE_RIGHT
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_400a:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_696a
	delay $01, $03
	setlayouttile $0016, $4a
	swapfollower
	end

Script_012_401b:
	face FACE_UP
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_4025:
	face FACE_DOWN
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_402f:
	face FACE_LEFT
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_4039:
	face FACE_RIGHT
	ifcharindex $02, Script_012_4043
	stext text_12_6443
	end

Script_012_4043:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0092, $7a
	swapfollower
	end

Script_012_4054:
	face FACE_UP
	ifcharindex $02, Script_012_4043
	stext text_12_6443
	end

Script_012_405e:
	face FACE_LEFT
	ifcharindex $02, Script_012_4043
	stext text_12_6443
	end

Script_012_4068:
	face FACE_DOWN
	ifcharindex $02, Script_012_4072
	stext text_12_6443
	end

Script_012_4072:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0025, $7b
	swapfollower
	end

Script_012_4083:
	face FACE_UP
	ifcharindex $02, Script_012_4072
	stext text_12_6443
	end

Script_012_408d:
	face FACE_RIGHT
	ifcharindex $02, Script_012_4097
	stext text_12_6443
	end

Script_012_4097:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $001b, $7c
	swapfollower
	end

Script_012_40a8:
	face FACE_DOWN
	ifcharindex $02, Script_012_4097
	stext text_12_6443
	end

Script_012_40b2:
	face FACE_LEFT
	ifcharindex $02, Script_012_4097
	stext text_12_6443
	end

Script_012_40bc:
	face FACE_UP
	ifcharindex $02, Script_012_40c6
	stext text_12_6443
	end

Script_012_40c6:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $008e, $6f
	swapfollower
	end

Script_012_40d7:
	face FACE_DOWN
	ifcharindex $02, Script_012_40c6
	stext text_12_6443
	end

Script_012_40e1:
	face FACE_UP
	ifcharindex $02, Script_012_40eb
	stext text_12_6443
	end

Script_012_40eb:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0055, $70
	swapfollower
	end

Script_012_40fc:
	face FACE_DOWN
	ifcharindex $02, Script_012_40eb
	stext text_12_6443
	end

Script_012_4106:
	face FACE_UP
	ifcharindex $02, Script_012_4110
	stext text_12_6443
	end

Script_012_4110:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $002e, $71
	swapfollower
	end

Script_012_4121:
	face FACE_DOWN
	ifcharindex $02, Script_012_4110
	stext text_12_6443
	end

Script_012_412b:
	face FACE_UP
	ifcharindex $02, Script_012_4135
	stext text_12_6443
	end

Script_012_4135:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0027, $72
	swapfollower
	end

Script_012_4146:
	face FACE_DOWN
	ifcharindex $02, Script_012_4135
	stext text_12_6443
	end

Script_012_4150:
	face FACE_RIGHT
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_415a:
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $001b, $2f
	swapfollower
	end

Script_012_416b:
	face FACE_LEFT
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_4175:
	face FACE_UP
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_417f:
	face FACE_DOWN
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_4189:
	warp3 $01, $00, $02
	end

Script_012_418e:
	ifcharindex $01, Script_012_4193
	end

Script_012_4193:
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_012_4d76
	clearattach $01
	spriteface  1, FACE_RIGHT
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_LEFT
	end

Script_012_41b5:
	ifcharindex $01, Script_012_41ba
	end

Script_012_41ba:
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_012_4db7
	clearattach $01
	spriteface  1, FACE_LEFT
	spritewalk  1, MOVE_LEFT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_RIGHT
	end

CoffeeForestPart1_ObjectEvents:
CoffeeForestPart2_ObjectEvents:
CoffeeForestPart3_ObjectEvents2:
SkyRockPart1_ObjectEvents:
SkyRockPart2_ObjectEvents:
ClockTowerOutside_ObjectEvents:
ClockTower2f_ObjectEvents:
ClockTower3f_ObjectEvents:
ClockTower4f_ObjectEvents:
ClockTower5f_ObjectEvents2:
G2_0F_ObjectEvents:
G2_10_ObjectEvents:
G2_11_ObjectEvents:
MarkNinaIntro_ObjectEvents4:
R03_ObjectEvents:
R04_ObjectEvents:
G2_1E_ObjectEvents:
G2_1F_ObjectEvents:
	objects_end

ObjectEvents_012_41dd:
	object_event $2a,  9,  9, 0, $00, $00, $00, $00, Script_012_41e9
	objects_end

Script_012_41e9:
	textface text_12_41f1
	startbattle BattleData_02d_506b
	swapfollower
	end

INCLUDE "data/text/script_g2_1f.asm"

DuoluCity2_ObjectEvents:
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

DuoluCity_1b_ObjectEvents:
	object_event $16,  4,  6, 0, $00, $00, $09, $00, Script_012_46a2
	object_event $19,  8,  6, 0, $00, $00, $06, $01, Script_012_46a6
	objects_end

DuoluCity_1c_ObjectEvents:
	object_event $1b,  5,  4, 0, $00, $00, $06, $00, Script_012_46aa
	object_event $1a,  9,  6, 0, $00, $00, $07, $01, Script_012_46ae
	objects_end

DuoluCity_1d_ObjectEvents:
	object_event $1c,  6,  3, 0, $00, $00, $07, $00, Script_012_46b2
	object_event $1a,  4,  6, 0, $00, $00, $0b, $01, Script_012_46b6
	object_event $15,  6,  7, 0, $00, $00, $06, $02, Script_012_46ba
	objects_end

DuoluCity_20_ObjectEvents:
	object_event $22,  7,  5, 0, $00, $00, $06, $00, Script_012_46be
	objects_end

GallEnterprise_ObjectEvents:
	object_event $2d,  6,  5, wEventFlags + 3, $02, $00, $00, $00, Script_012_46c2
	objects_end

ClockTower1f_ObjectEvents:
	object_event $24,  6, 13, wEventFlags + 4, $06, $00, $00, $00, Script_012_46fb
	objects_end

ShandaFarm_ObjectEvents:
	object_event $17, 15,  6, 0, $00, $00, $09, $00, Script_012_48b7
	object_event $20,  9,  8, 0, $00, $00, $08, $01, Script_012_48bb
	object_event $12,  4, 16, 0, $00, $00, $08, $02, Script_012_48c9
	object_event $1d, 14, 16, 0, $00, $00, $07, $03, Script_012_48d7
	object_event $21, 11, 20, 0, $00, $00, $08, $04, Script_012_48e5
	object_event $19, 17, 22, 0, $00, $00, $06, $00, Script_012_48e9
	object_event $1a, 11, 25, 0, $00, $00, $09, $01, Script_012_48f7
	objects_end

ShandaFarm_12_ObjectEvents:
	object_event $23,  3,  3, 0, $00, $00, $0b, $00, Script_012_4905
	object_event $25,  5,  5, 0, $00, $00, $06, $01, Script_012_4913
	objects_end

ShandaFarm_13_ObjectEvents:
	object_event $22,  3,  5, 0, $00, $00, $09, $00, Script_012_4917
	object_event $21,  8,  6, 0, $00, $00, $06, $01, Script_012_491b
	objects_end

ShandaFarm_14_ObjectEvents:
	object_event $1e,  9,  3, 0, $00, $00, $00, $00, Script_012_491f
	object_event $1f,  5,  3, 0, $00, $00, $06, $01, Script_012_492d
	object_event $18,  6,  6, 0, $00, $00, $05, $02, Script_012_493b
	objects_end

ShandaFarm_15_ObjectEvents:
	object_event $16,  7,  5, 0, $00, $00, $08, $00, Script_012_495d
	objects_end

SkyRockPart2_ObjectEvents2:
	object_event $30,  5,  7, wEventFlags + 4, $07, $00, $00, $00, Script_012_44cc
	object_event $04,  6,  8, wEventFlags + 4, $07, $00, $00, $02, Script_012_44cc
	objects_end

Script_012_4397:
	checkbit wEventFlags + 3, $06, Script_012_43a1

Script_012_439d:
	setmap MAP_SKY_ROCK_PART_2, $00
	end

Script_012_43a1:
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

Script_012_446e:
	object_event $30,  1,  8, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end

ObjSprite_012_447a:
	object_event $31,  8,  8, 0, $00, $00, $00, $01, Script_012_44cc
	objects_end

ObjSprite_012_4486:
	object_event $49,  5,  5, 0, $00, $00, $00, $02, Script_012_44cc
	objects_end

Script_012_4492:
	object_event $48,  5,  1, 0, $00, $00, $00, $03, Script_012_44cc
	objects_end

MarkNinaIntro_ObjectEvents3:
	object_event $30,  7,  3, wEventFlags + 3, $06, $00, $00, $00, Script_012_44cc
	object_event $04,  8,  4, wEventFlags + 3, $06, $00, $00, $02, Script_012_44cc
	objects_end

MarkNinaIntro_ObjectEvents2:
	object_event $47,  8,  3, 0, $00, $00, $00, $00, Script_012_44cc
	object_event $04,  8,  4, 0, $00, $00, $00, $02, Script_012_44cc
	objects_end

Script_012_44cc:
        end

Script_012_44cd:
	checkbit wEventFlags + 3, $05, Script_012_44db
	setmap MAP_MARK_NINA_INTRO, $00
	end

Script_012_44d7:
	setmap MAP_MARK_NINA_INTRO, $03
	end

Script_012_44db:
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

MarkNinaIntro_ObjectEvents:
	object_event $47,  8,  3, 0, $00, $00, $00, $00, Script_012_45ab
	object_event $05,  8,  4, wEventFlags + 3, $04, $00, $00, $01, Script_012_45af
	object_event $04,  7,  2, wEventFlags + 3, $04, $00, $00, $02, Script_012_45b3
	objects_end

Script_012_45ab:
	stext text_12_6159
	end

Script_012_45af:
	textface text_12_6164
	end

Script_012_45b3:
	textface text_12_6171
	emote $00, $03
	delay $03, $20
	stext text_12_61be
	stext text_12_61cb
	checkbit wEventFlags + 3, $02, .Script_012_45c9
	end
.Script_012_45c9
	face FACE_RIGHT
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_12_6253
	stext text_12_629b
	face FACE_UP
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_12_62f3
	stext text_12_6300
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_12_636e
	emote  4, EMOTE_HEART
	delay $03, $20
	stext text_12_6394
	clearplayerpos
	spritewalk  4, MOVE_DOWN
	clearobject $04
	clearplayerpos
	spritewalk  3, MOVE_LEFT
	clearobject $03
	loadscriptedmon $02
	scr_62 $02, $01
	stext text_12_63f5
	stext text_12_640c
	setbit wEventFlags + 3, $04
	end

Script_012_4613:
	textface text_12_5194
	end

Script_012_4617:
	textface text_12_51a6
	end

Script_012_461b:
	checkbit wEventFlags + 4, $02, Script_012_4625
	textface text_12_51d9
	end

Script_012_4625:
	textface text_12_723c
	end

Script_012_4629:
	checkbit wEventFlags + 4, $02, Script_012_4633
	textface text_12_5223
	end

Script_012_4633:
	textface text_12_7267
	end

Script_012_4637:
	checkbit wEventFlags + 4, $02, Script_012_4641
	textface text_12_52aa
	end

Script_012_4641:
	checkbit wEventFlags + 4, $03, Script_012_464b
	textface text_12_72ef
	end

Script_012_464b:
	checkbit wEventFlags + 4, $05, Script_012_4659
	textface text_12_76dc
	setbit wEventFlags + 4, $04
	end

Script_012_4659:
	textface text_12_7885
	end

Script_012_465d:
	checkbit wEventFlags + 4, $02, Script_012_4667
	textface text_12_530c
	end

Script_012_4667:
	checkbit wEventFlags + 4, $03, Script_012_4671
	textface text_12_7320
	end

Script_012_4671:
	checkbit wEventFlags + 4, $05, Script_012_467b
	textface text_12_7746
	end

Script_012_467b:
	textface text_12_735b
	end

Script_012_467f:
	checkbit wEventFlags + 4, $02, Script_012_4689
	textface text_12_5338
	end

Script_012_4689:
	textface text_12_736f
	end

Script_012_468d:
	textface text_12_5396
	checkbit wEventFlags + 3, $03, Script_012_469a
	stext text_12_53b6
	end

Script_012_469a:
	stext text_12_53a4
	end

Script_012_469e:
	textface text_12_546f
	end

Script_012_46a2:
	textface text_12_54b8
	end

Script_012_46a6:
	textface text_12_5528
	end

Script_012_46aa:
	textface text_12_5589
	end

Script_012_46ae:
	textface text_12_560d
	end

Script_012_46b2:
	textface text_12_563e
	end

Script_012_46b6:
	textface text_12_5682
	end

Script_012_46ba:
	textface text_12_56ec
	end

Script_012_46be:
	textface text_12_5733
	end

Script_012_46c2:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_12_579d
	emote $00, $03
	delay $03, $20
	stext text_12_57fa
	stext text_12_580d
	stext text_12_58ef
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	stext text_12_58fd
	emote $02, $00
	delay $03, $20
	stext text_12_599a
	objmove $02, MovementData_012_4e4a
	clearobject $02
	setbit wEventFlags + 3, $02
	end

Script_012_46fb:
	checkbit wEventFlags + 4, $04, Script_012_4705

Script_012_4701:
	textface text_12_5b24
	end

Script_012_4705:
	checkbit wEventFlags + 4, $05, Script_012_4701
	textface text_12_7787
	end

Script_012_470f::
	checkbit wEventFlags + 4, $04, Script_012_4719
	setmap MAP_CLOCK_TOWER_5F, $01
	end2

Script_012_4719:
	setmap MAP_CLOCK_TOWER_5F, $00
	end2

ClockTower5f_ObjectEvents:
	object_event $33,  5,  3, wEventFlags + 4, $05, $00, $00, $00, Script_012_4735
	objects_end
	
ObjectEvents_012_4729:
	object_event $48,  5,  3, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4735:
	textface text_12_77ea
	stext text_12_77ff
	stext text_12_7870
	startbattle BattleData_02d_4b50
	checkbit wEventFlags + 3, $03, Script_012_4780
	spriteface  2, FACE_UP
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_4f8c
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_4fb5
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_4fe2
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_500f
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_503c
	clearobject $03
	clearobject $02
	setbit wEventFlags + 4, $05
	setmappredef MAPPREDEF_0a
	end

Script_012_4780:
	end

Script_012_4781:
	setplayerchar $00
	setmap MAP_G2_11, $01
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_7945
	stext text_12_7970
	emote $02, $03
	delay $03, $20
	stext text_12_7977
	stext text_12_799d
	stext text_12_79cc
	face FACE_DOWN
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_012_4e4a
	clearobject $02
	face FACE_UP
	warpmode GAMEMODE_GALE_CUTSCENE, $0e, $04
	stext text_12_7a96
	stext text_12_7aac
	emote $02, $03
	delay $03, $20
	spritewalk  2, MOVE_DOWN
	stext text_12_7ad7
	emote $00, $03
	delay $03, $20
	stext text_12_7b78
	stext text_12_7b83
	emote $00, $03
	delay $03, $20
	stext text_12_7bbb
	stext text_12_7be4
	stext text_12_7c4b
	scr_48 $02, $0a
	stext text_12_7c5a
	stext text_12_7ca6
	stext text_12_7cb9
	stext text_12_7cdd
	scr_62 $02, $00
	setbit wEventFlags + 4, $06
	setmappredef MAPPREDEF_0b
	end

GallEnterprise_ObjectEvents4:
	object_event $2f,  5,  4, 0, $00, $00, $00, $00, Script_012_4819
	object_event $30,  4,  4, 0, $00, $00, $00, $01, Script_012_481d
	object_event $04,  6,  5, wEventFlags + $17, $07, $00, $00, $02, Script_012_4827
	objects_end

Script_012_4819:
	textface text_12_7e2d
	end

Script_012_481d:
	checkbit wEventFlags + 4, $06, Script_012_4826
	textface text_12_7e6d

Script_012_4826:
	end

Script_012_4827:
	textface text_12_7cdd
	end

Script_012_482b:
	stext text_12_7cf0
	spritewalk  4, MOVE_DOWN
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_UP
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	spriteface  1, FACE_RIGHT
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_UP
	sjump Script_012_4862

Script_012_4850::
	stext text_12_7cf0
	spritewalk  4, MOVE_DOWN
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_UP

Script_012_4862:
	emote $00, $03
	delay $03, $20
	stext text_12_7d04
	stext text_12_7d0e
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_UP
	emote $02, $00
	delay $03, $20
	stext text_12_7d79
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_7d90
	emote $02, $00
	delay $03, $20
	stext text_12_7de7
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_DOWN
	stext text_12_7df5
	stext text_12_7e02
	stext text_12_7e1a
	spritewalk  4, MOVE_DOWN
	clearplayerpos
	spritewalk  4, MOVE_DOWN
	clearobject $04
	scr_62 $02, $01
	setmappredef MAPPREDEF_0c
	setbit wEventFlags + 23, $07
	end

Script_012_48b7:
	textface text_12_5b82
	end

Script_012_48bb:
	checkbit wEventFlags + 3, $05, Script_012_48c5
	textface text_12_5ba7
	end

Script_012_48c5:
	textface text_12_6550
	end

Script_012_48c9:
	checkbit wEventFlags + 3, $05, Script_012_48d3
	textface text_12_5bd5
	end

Script_012_48d3:
	textface text_12_65ab
	end

Script_012_48d7:
	checkbit wEventFlags + 3, $05, Script_012_48e1
	textface text_12_5c51
	end

Script_012_48e1:
	textface text_12_6629
	end

Script_012_48e5:
	textface text_12_5c92
	end

Script_012_48e9:
	checkbit wEventFlags + 3, $05, Script_012_48f3
	textface text_12_5d14
	end

Script_012_48f3:
	textface text_12_6655
	end

Script_012_48f7:
	checkbit wEventFlags + 3, $05, Script_012_4901
	textface text_12_5d7a
	end

Script_012_4901:
	textface text_12_66e4
	end

Script_012_4905:
	checkbit wEventFlags + 3, $05, Script_012_490f
	textface text_12_5dab
	end

Script_012_490f:
	textface text_12_673b
	end

Script_012_4913:
	textface text_12_5dff
	end

Script_012_4917:
	textface text_12_5e82
	end

Script_012_491b:
	textface text_12_5f2e
	end

Script_012_491f:
	checkbit wEventFlags + 3, $05, Script_012_4929
	textface text_12_5fa8
	end

Script_012_4929:
	textface text_12_6796
	end

Script_012_492d:
	checkbit wEventFlags + 3, $05, Script_012_4937
	textface text_12_5fc7
	end

Script_012_4937:
	textface text_12_67b8
	end

Script_012_493b:
	checkbit wEventFlags + 3, $05, Script_012_4948
	textface text_12_6032
	stext text_12_6064
	end

Script_012_4948:
	checkbit wEventFlags + 3, $07, Script_012_4959
	textface text_12_6812
	stext text_12_6864
	setbit wEventFlags + 3, $07
	end

Script_012_4959:
	textface text_12_6812
	end

Script_012_495d:
	checkbit wEventFlags + 3, $05, Script_012_4967
	textface text_12_60b5
	end

Script_012_4967:
	textface text_12_686f
	end

G2_19_ObjectEvents:
HealingCenter_g221_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_012_4982
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_012_4986
	objects_end

Script_012_4982:
	stext text_12_7ebe
	end

Script_012_4986:
	stext text_12_7ed6
	end

Script_012_498a::
	face FACE_UP
	stext text_12_7ebe
	checkbit wEventFlags + 3, $03, Script_012_4997
	scr_37
	end

Script_012_4997:
	end

Script_012_4998::
	face FACE_UP
	stext text_12_7ed6
	checkbit wEventFlags + 3, $03, Script_012_49a5
	townmusicanim
	end

Script_012_49a5:
	end

G2_1A_ObjectEvents:
Shop_g222_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_012_49b2
	objects_end

Script_012_49b2:
	textface text_12_7f05
	end

Script_012_49b6:
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_7f05
	checkbit wEventFlags + 4, $01, Script_012_49c7
	scr_35 $01
	end

Script_012_49c7:
	end

Script_012_49c8:
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_7f05
	checkbit wEventFlags + 4, $01, Script_012_49c7
	scr_35 $02
	end

Script_012_49d9::
	checkbit wEventFlags + 4, $02, Script_012_49f8
	stext text_12_5a30
	checkbit wEventFlags + 3, $02, Script_012_49e9
	end

Script_012_49e9:
	checkbit wEventFlags + 4, $07, Script_012_49f8
	emote $00, $03
	delay $03, $20
	stext text_12_5abd
	
Script_012_49f8:
	end

CoffeeForestPart3_ObjectEvents:
	object_event $32,  6,  5, wEventFlags + 3, $05, $00, $00, $00, Script_012_4a05
	objects_end

Script_012_4a05:
	textface text_12_6471
	stext text_12_6486
	startbattle BattleData_02d_4b40
	checkbit wEventFlags + 3, $03, Script_012_4780
	spriteface  2, FACE_UP
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_RIGHT
	clearobject $02
	loadobjsprite Script_012_4a93
	objmove $03, MovementData_012_4f8c
	clearobject $03
	loadobjsprite Script_012_4a9f
	objmove $03, MovementData_012_4fb5
	clearobject $03
	loadobjsprite Script_012_4aab
	objmove $03, MovementData_012_4fe2
	clearobject $03
	loadobjsprite Script_012_4ab7
	objmove $03, MovementData_012_500f
	clearobject $03
	loadobjsprite Script_012_4ac3
	objmove $03, MovementData_012_503c
	clearobject $03
	setmap MAP_SHANDA_FARM, $09
	spriteface  2, FACE_UP
	loadobjsprite Script_012_4ad0
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4adc
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4ae8
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4af4
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4b00
	objmove $03, MovementData_012_5167
	clearobject $03
	stext text_12_64ba
	setmap MAP_COFFEE_FOREST_PART_3, $01
	stext text_12_64fb
	stext text_12_653d
	scr_48 $02, $08
	setbit wEventFlags + 3, $05
	end
	
Script_012_4a93:
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4a9f:
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4aab:
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4ab7:
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4ac3:
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4acf:
	end
	
Script_012_4ad0:
	object_event $48, 13, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4adc:
	object_event $48, 18, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4ae8:
	object_event $48, 16, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4af4:
	object_event $48, 14, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
Script_012_4b00:
	object_event $48, 17, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end
	
ShandaFarm_ObjectEvents2:
	object_event $1d, 14, 18, 0, $00, $00, $00, $00, Script_012_4acf
	objects_end

GallEnterprise_ObjectEvents2:
	object_event $2f,  4,  2, wEventFlags + 4, $02, $00, $00, $00, Script_012_44cc
	object_event $2d,  6,  3, wEventFlags + 4, $02, $00, $00, $01, Script_012_44cc
	object_event $30,  5,  2, wEventFlags + 4, $02, $00, $00, $02, Script_012_44cc

	object_event $04,  4,  4, wEventFlags + 4, $02, $00, $00, $03, Script_012_44cc
	objects_end

GallEnterprise_ObjectEvents5:
	object_event $2f,  5,  3, wEventFlags + 4, $02, $00, $00, $00, Script_012_44cc

	object_event $2d,  6,  3, wEventFlags + 4, $02, $00, $00, $01, Script_012_44cc
	object_event $30,  5,  2, wEventFlags + 4, $02, $00, $00, $02, Script_012_44cc
	object_event $04,  4,  4, wEventFlags + 4, $02, $00, $00, $03, Script_012_44cc
	objects_end

Script_012_4b72::
	checkbit wEventFlags + 4, $07, Script_012_4b94
	setmap MAP_GALL_ENTERPRISE, $00
	end

Script_012_4b7c:
	checkbit wEventFlags + 4, $03, Script_012_4b86
	setmap MAP_GALL_ENTERPRISE, $00
	end

Script_012_4b86:
	checkbit wEventFlags + 4, $06, Script_012_4b90
	setmap MAP_GALL_ENTERPRISE, $05
	end

Script_012_4b90:
	setmap MAP_GALL_ENTERPRISE, $04
	end

Script_012_4b94:
	checkbit wEventFlags + 4, $02, Script_012_4b7c
	setplayerchar $00
	setmap MAP_GALL_ENTERPRISE, $02
	spriteface  3, FACE_LEFT
	spriteface  5, FACE_UP
	spriteface  4, FACE_LEFT
	stext text_12_6f16
	spriteface  2, FACE_RIGHT
	stext text_12_6f1e
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_DOWN
	spriteface  3, FACE_DOWN
	stext text_12_6f2f
	stext text_12_6f96
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_6faa
	stext text_12_6fc4
	stext text_12_6fcc
	spriteface  4, FACE_DOWN
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	stext text_12_6fe9
	emote $00, $02
	delay $03, $20
	stext text_12_7033
	scr_48 $02, $09
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $0e, $07
	spriteface  3, FACE_LEFT
	spriteface  5, FACE_UP
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	stext text_12_7042
	stext text_12_70a2
	stext text_12_70af
	emote $02, $00
	delay $03, $20
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_70ec
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_DOWN
	stext text_12_7122
	stext text_12_7159
	spritewalk  2, MOVE_DOWN
	stext text_12_7169
	stext text_12_71f8
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_7203
	spriteface  2, FACE_LEFT
	setattach $04, $02, $00, $10
	objmove $02, MovementData_012_4e29
	clearattach $04
	clearobject $02
	clearobject $04
	spriteface  3, FACE_DOWN
	objmove $03, MovementData_012_4e4a
	clearobject $03
	spriteface  5, FACE_RIGHT
	clearplayerpos
	spritewalk  5, MOVE_RIGHT
	clearobject $05
	setbit wEventFlags + 4, $02
	setmappredef MAPPREDEF_08
	end

G2_11_ObjectEvents2:
	object_event $04,  6,  6, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end

G2_23_ObjectEvents:
	object_event $11,  5,  2, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end

Script_012_4c89:
	object_event $04,  1,  6, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end

Script_012_4c95::
	setplayerchar $00
	setmap MAP_G2_11, $01
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_739a
	stext text_12_73c5
	stext text_12_7412
	emote $00, $00
	delay $03, $20
	stext text_12_748c
	stext text_12_7497
	stext text_12_74d8
	stext text_12_74df
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_012_4e4a
	clearobject $02
	face FACE_UP
	setfollower $00
	setmap MAP_G2_23, $00
	stext text_12_74f8
	stext text_12_751b
	stext text_12_755b
	stext text_12_756e
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	move MovementData_OneUp
	stext text_12_7576
	face FACE_DOWN
	setfollower $02
	setmap MAP_G2_11, $02
	emote $00, $00
	delay $03, $20
	stext text_12_75b7
	stext text_12_75c0
	loadobjsprite Script_012_4c89
	spriteface  2, FACE_RIGHT
	objmove $02, MovementData_012_4df8
	stext text_12_75ce
	clearplayerpos
	spritewalk  2, MOVE_RIGHT
	clearobject $02
	setbit wEventFlags + 4, $03
	setmappredef MAPPREDEF_09
	end

Script_012_4d14::
	checkbit wEventFlags + 4, $03, Script_012_4d1e
	setmap MAP_GALL_ENTERPRISE, $01
	end2

Script_012_4d1e:
	checkbit wEventFlags + 4, $06, Script_012_4d28
	setmap MAP_GALL_ENTERPRISE, $03
	end2

Script_012_4d28:
	setmap MAP_GALL_ENTERPRISE, $06
	end2

GallEnterprise_ObjectEvents3:
	object_event $2d,  6,  5, 0, $00, $00, $00, $00, Script_012_4d38
	objects_end

Script_012_4d38:
	checkbit wEventFlags + 4, $05, Script_012_4d6d
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	emote $00, $03
	delay $03, $20
	stext text_12_75f9
	emote $02, $00
	delay $03, $20
	stext text_12_763c
	face FACE_LEFT
	move MovementData_OneLeft
	clearplayerpos
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_LEFT
	emote $00, $03
	delay $03, $20
	stext text_12_7696
	end

Script_012_4d6d:
	textface text_12_78bd
	end

Script_012_4d71:
	farjump2 Script_04f_4384
	end

MovementData_012_4d76::
	db $ff, $00, $fe, $00, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff
	db $fe, $ff, $fe, $fe, $ff, $fe, $ff, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff
	db $00, $ff, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $02, $ff, $01, $ff, $01, $fe
	db $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $00, $02, $ff
	db $88

MovementData_012_4db7::
	db $ff, $00, $fe, $00, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $02, $ff, $02, $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01
	db $00, $01, $01, $01, $00, $01, $00, $01, $01, $01, $02, $01, $01, $01, $01, $02
	db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $00, $02, $01
	db $88

MovementData_012_4df8::
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $88

MovementData_012_4e29::
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $88

MovementData_012_4e4a::
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $88, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $88

MovementData_012_4f8c::
	db $ff, $ff, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $88

MovementData_012_4fb5::
	db $ff, $00, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe
	db $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe
	db $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $88

MovementData_012_4fe2::
	db $ff, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88

MovementData_012_500f::
	db $ff, $01, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $02, $fc, $03
	db $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $fc, $02, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $88

MovementData_012_503c::
	db $ff, $01, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04
	db $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04
	db $fc, $04, $fc, $04, $fd, $04, $fc, $04, $88

MovementData_012_5065::
	db $01, $ff, $04, $fc, $04, $fc

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_012_506b::
	db $03, $fc, $04, $fc, $03, $fc, $04, $fc, $04, $fc, $03, $fc, $04, $fc, $03, $fc
	db $04, $fc, $04, $fc, $03, $fc, $04, $fc, $03, $fc, $04, $fc, $04, $fc, $03, $fc
	db $04, $fc, $88

MovementData_012_508e::
	db $01, $01, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $88

MovementData_012_50b7::
	db $ff, $00, $fe, $ff, $fe, $00, $fe, $00, $fe, $ff, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $ff, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $01, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $01, $fe, $01, $88

MovementData_012_50f6::
	db $01, $ff, $01, $fd, $01, $fd, $00, $fd, $00, $fd, $00, $fd, $03, $01, $03, $03
	db $01, $03, $01, $03, $01, $03, $01, $03, $00, $03, $00, $03, $00, $03, $03, $ff
	db $03, $fd, $01, $fd, $01, $fd, $01, $fd, $01, $fd, $00, $fd, $00, $fd, $00, $fd
	db $03, $01, $03, $03, $01, $03, $01, $03, $01, $03, $01, $03, $00, $03, $00, $03
	db $00, $03, $03, $ff, $03, $fd, $01, $fd, $01, $fd, $01, $fd, $01, $fd, $00, $fd
	db $00, $fd, $00, $fd, $03, $01, $03, $03, $01, $03, $01, $03, $01, $03, $01, $03
	db $00, $03, $00, $03, $00, $03, $03, $ff, $03, $fd, $01, $fd, $01, $fd, $01, $fd
	db $88

MovementData_012_5167::
	db $01, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $88

INCLUDE "data/text/script_duolu_city2_1.asm"
INCLUDE "data/text/script_duolu_city_1b.asm"
INCLUDE "data/text/script_duolu_city_1c.asm"
INCLUDE "data/text/script_duolu_city_1d.asm"
INCLUDE "data/text/script_duolu_city_20.asm"
INCLUDE "data/text/script_gall_enterprise_0e_1.asm"
INCLUDE "data/text/script_clock_tower1f_1.asm"
INCLUDE "data/text/script_shanda_farm_1.asm"
INCLUDE "data/text/script_shanda_farm_12_1.asm"
INCLUDE "data/text/script_shanda_farm_13.asm"
INCLUDE "data/text/script_shanda_farm_14_1.asm"
INCLUDE "data/text/script_shanda_farm_15_1.asm"
INCLUDE "data/text/script_mark_nina_intro.asm"
INCLUDE "data/text/script_coffee_forest_part3.asm"
INCLUDE "data/text/script_shanda_farm_2.asm"
INCLUDE "data/text/script_shanda_farm_12_2.asm"
INCLUDE "data/text/script_shanda_farm_14_2.asm"
INCLUDE "data/text/script_shanda_farm_15_2.asm"
INCLUDE "data/text/script_mark_grandson_cutscene.asm"
INCLUDE "data/text/script_duolu_city2.asm"
INCLUDE "data/text/script_ballot_dream_cutscene.asm"
INCLUDE "data/text/script_gall_enterprise_0e_2.asm"
INCLUDE "data/text/script_duolu_city2_3.asm"
INCLUDE "data/text/script_clock_tower1f_2.asm"
INCLUDE "data/text/script_clock_tower5f.asm"
INCLUDE "data/text/script_duolu_city2_4.asm"
INCLUDE "data/text/script_gall_enterprise_0e_3.asm"
INCLUDE "data/text/script_healing_center.asm"
INCLUDE "data/text/script_shop.asm"

