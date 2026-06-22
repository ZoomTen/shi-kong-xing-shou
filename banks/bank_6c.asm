G6_28_ObjectEvents:
	dr $1b0000, $1b0010
Script_06c_4010::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_6c_40a4
	checkbit wEventFlags + 4, $01, Script_06c_4021
	scr_35 $0b
	end

Script_06c_4021:
	end

G6_29_ObjectEvents:
	dr $1b0022, $1b0041
Script_06c_4041::
	face FACE_UP
	stext text_6c_405d
	checkbit wEventFlags + 3, $03, Script_06c_404e
	scr_37
	end

Script_06c_404e:
	end
Script_06c_404f::
	face FACE_UP
	stext text_6c_4075
	checkbit wEventFlags + 3, $03, Script_06c_405c
	townmusicanim
	end

Script_06c_405c:
	end

INCLUDE "data/text/bank6c_405d.asm"

G6_18_ObjectEvents:
	dr $1b00bb, $1b018c

G6_19_ObjectEvents:
	dr $1b018c, $1b0198
Script_06c_4198::
	checkbit wEventFlags + 22, $05, Script_06c_41a2
	setmap $1b, $00
	end

Script_06c_41a2:
	setmap $1b, $01
	end

Script_06c_41a6:
	checkbit wEventFlags + 20, $06, Script_06c_41b0
	stext text_6c_6a32
	end

Script_06c_41b0:
	checkbit wEventFlags + 20, $07, Script_06c_41ba
	stext text_6c_6a32
	end

Script_06c_41ba:
	checkbit wEventFlags + 21, $02, Script_06c_41c4
	stext text_6c_6a32
	end

Script_06c_41c4:
	checkbit wEventFlags + 21, $03, Script_06c_41ce
	stext text_6c_6a32
	end

Script_06c_41ce:
	checkbit wEventFlags + 21, $04, Script_06c_41d8
	stext text_6c_6a32
	end

Script_06c_41d8:
	checkbit wEventFlags + 21, $05, Script_06c_41e2
	stext text_6c_6a32
	end

Script_06c_41e2:
	checkbit wEventFlags + 21, $03, Script_06c_41ec
	stext text_6c_6c58
	end

Script_06c_41ec:
	checkbit wEventFlags + 21, $04, Script_06c_41f6
	stext text_6c_6a32
	end

Script_06c_41f6:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_6c58
	loadobjsprite ObjSprite_6c_4266
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	stext text_6c_6c75
	stext text_6c_6ccd
	stext text_6c_6cf9
	stext text_6c_6d89
	stext text_6c_6d99
	stext text_6c_6e0c
	stext text_6c_6e15
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	setattach $02, $03, $f0, $00
	objmove $03, MovementData_06c_7995
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spritewalk  2, MOVE_DOWN
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	clearobject $03
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	clearobject $02
	setbit wEventFlags + 21, $06
	end

ObjSprite_6c_4266::
	dr $1b0266, $1b0272

G6_1A_ObjectEvents:
	dr $1b0272, $1b02db

G6_1B_ObjectEvents:
	dr $1b02db, $1b0310
Script_06c_4310::
	checkbit wEventFlags + 21, $07, Script_06c_4326
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_4326:
	checkbit wEventFlags + 22, $01, Script_06c_433c
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_433c:
	checkbit wEventFlags + 22, $02, Script_06c_4352
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_4352:
	checkbit wEventFlags + 22, $03, Script_06c_4368
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_4368:
	checkbit wEventFlags + 22, $04, Script_06c_437e
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_437e:
	checkbit wEventFlags + 20, $03, Script_06c_439a
	checkbit wEventFlags + 22, $04, Script_06c_439a
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_439a:
	setmap $1e, $00
	end

G6_1D_ObjectEvents:
	dr $1b039e, $1b03ae
Script_06c_43ae::
	face FACE_UP
	spriteface  2, FACE_DOWN
	farjump Script_06c_43bd
	end
Script_06c_43b8::
	face FACE_RIGHT
	spriteface  2, FACE_LEFT
Script_06c_43bd:
	stext text_6c_40a4
	checkbit wEventFlags + 4, $01, Script_06c_43c9
	scr_35 $0c
	end

Script_06c_43c9:
	end

G6_20_ObjectEvents:
	dr $1b03ca, $1b03ec

G6_21_ObjectEvents:
	dr $1b03ec, $1b041a
Script_06c_441a::
	warp6c
	setplayerchar $00
	face FACE_UP
	setmap $20, $00
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	stext text_6c_702f
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_703b
	stext text_6c_7045
	stext text_6c_705c
	stext text_6c_706d
	stext text_6c_712a
	stext text_6c_7134
	stext text_6c_717e
	stext text_6c_7197
	stext text_6c_7204
	emote  0, EMOTE_TEAR
	emote  3, EMOTE_TEAR
	emote  4, EMOTE_TEAR
	delay $03, $20
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_7210
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	spriteface  4, FACE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	clearobject $04
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	setbit wEventFlags + 24, $03
	end

G6_08_ObjectEvents:
	dr $1b049b, $1b04c8

G6_09_ObjectEvents:
	dr $1b04c8, $1b04f5

G6_0A_ObjectEvents:
	dr $1b04f5, $1b0522

G6_0B_ObjectEvents:
	dr $1b0522, $1b060e
Script_06c_460e::
	checkbit wEventFlags + 22, $07, Script_06c_4621
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	end

Script_06c_4621:
	face FACE_DOWN
	setmap $09, $00
	end
Script_06c_4627::
	checkbit wEventFlags + 23, $00, Script_06c_463a
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	end

Script_06c_463a:
	face FACE_LEFT
	setmap $0a, $00
	end
Script_06c_4640::
	checkbit wEventFlags + 23, $01, Script_06c_4653
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end

Script_06c_4653:
	face FACE_DOWN
	setmap $0b, $00
	end

Script_06c_4659:
	dirmovement
	end

unk_06c_465b::
	dr $1b065b, $1b0671
Script_06c_4671::
	setplayerchar $00
	face FACE_LEFT
	warpmode GAMEMODE_1B, $21, $00
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	stext text_6c_7251
	stext text_6c_7267
	warpmode GAMEMODE_1C, $21, $00
	spriteface  2, FACE_RIGHT
	stext text_6c_72b9
	spriteface  3, FACE_RIGHT
	stext text_6c_72da
	stext text_6c_72ee
	spriteface  3, FACE_LEFT
	stext text_6c_7318
	stext text_6c_7335
	stext text_6c_734b
	stext text_6c_7385
	stext text_6c_73b0
	stext text_6c_73c9
	spriteface  2, FACE_LEFT
	spriteface  4, FACE_LEFT
	end

G6_1C_ObjectEvents:
	dr $1b06b7, $1b06d6
Script_06c_46d6::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	farjump Script_06c_46e2
	end
Script_06c_46e0::
	face FACE_UP
Script_06c_46e2:
	stext text_6c_405d
	checkbit wEventFlags + 3, $03, Script_06c_46ed
	scr_37
	end

Script_06c_46ed:
	end
Script_06c_46ee::
	face FACE_RIGHT
	spriteface  3, FACE_LEFT
	farjump Script_06c_46fa
	end
Script_06c_46f8::
	face FACE_UP
Script_06c_46fa:
	stext text_6c_4075
	checkbit wEventFlags + 3, $03, Script_06c_4705
	townmusicanim
	end

Script_06c_4705:
	end

Script_06c_4706:
	end

G6_01_ObjectEvents:
G6_02_ObjectEvents2:
G6_03_ObjectEvents:
G6_04_ObjectEvents:
G6_05_ObjectEvents:
G6_06_ObjectEvents:
G6_0E_ObjectEvents:
G6_0F_ObjectEvents:
G6_10_ObjectEvents:
G6_11_ObjectEvents2:
G6_12_ObjectEvents2:
G6_14_ObjectEvents2:
G6_15_ObjectEvents2:
G6_16_ObjectEvents2:
G6_17_ObjectEvents2:
G6_1B_ObjectEvents2:
G6_1E_ObjectEvents:
G6_25_ObjectEvents:
G6_2A_ObjectEvents:
G6_2B_ObjectEvents2:
G6_2C_ObjectEvents:
	objects_end
Script_06c_4708::
	checkbit wEventFlags + 18, $06, Script_06c_4712
	setmap $02, $01
	end2

Script_06c_4712:
	setmap $02, $00
	end2

G6_02_ObjectEvents:
	dr $1b0716, $1b073b

G6_0D_ObjectEvents2:
	dr $1b073b, $1b0798

G6_07_ObjectEvents:
	dr $1b0798, $1b07af

G6_07_ObjectEvents2:
	dr $1b07af, $1b07c6

G6_07_ObjectEvents4:
	dr $1b07c6, $1b07dd

G6_07_ObjectEvents3:
	dr $1b07dd, $1b07ff

G6_0C_ObjectEvents:
	dr $1b07ff, $1b0858

G6_0C_ObjectEvents2:
	dr $1b0858, $1b08ce

G6_0D_ObjectEvents:
	dr $1b08ce, $1b08e5

G6_0D_ObjectEvents3:
	dr $1b08e5, $1b08f1

G6_10_ObjectEvents2:
	dr $1b08f1, $1b0901

G6_14_ObjectEvents:
	dr $1b0901, $1b0918

G6_11_ObjectEvents:
	dr $1b0918, $1b092f

G6_15_ObjectEvents:
	dr $1b092f, $1b0946

G6_12_ObjectEvents:
	dr $1b0946, $1b095d

G6_16_ObjectEvents:
	dr $1b095d, $1b0974

G6_17_ObjectEvents:
	dr $1b0974, $1b0a4b
Script_06c_4a4b::
	checkbit wEventFlags + 19, $04, Script_06c_4a64
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4a64:
	checkbit wEventFlags + 19, $05, Script_06c_4a7d
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4a7d:
	checkbit wEventFlags + 19, $06, Script_06c_4a96
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4a96:
	checkbit wEventFlags + 19, $07, Script_06c_4aaf
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4aaf:
	checkbit wEventFlags + 21, $00, Script_06c_4ac8
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4ac8:
	checkbit wEventFlags + 21, $01, Script_06c_4ae7
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4ae1:
	face FACE_DOWN
	setmap $0f, $03
	end2

Script_06c_4ae7:
	setplayerchar $00
	setmap $13, $00
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	setattach $01, $00, $10, $00
	objmove $00, MovementData_06c_79d7
	face FACE_RIGHT
	move MovementData_OneRight
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_RIGHT
	stext text_6c_6676
	stext text_6c_668d
	stext text_6c_66d2
	stext text_6c_66e8
	startbattle BattleData_02d_4f57
	checkbit wEventFlags + 3, $03, Script_06c_4ae1
	loadobjsprite ObjSprite_6c_4c0b
	stext text_6c_6745
	stext text_6c_6781
	spritewalk  3, MOVE_DOWN
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_RIGHT
	clearobject $03
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_UP
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	checkbit wEventFlags + 15, $07, Script_06c_4b9c
	stext text_6c_67d2
	stext text_6c_67e5
	setattach $01, $00, $00, $f0
	objmove $00, MovementData_06c_7964
	face FACE_DOWN
	stext text_6c_67fa
	stext text_6c_680f
	stext text_6c_682f
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_685a
	stext text_6c_68a9
	stext text_6c_68b4
	clearobject $02
	stext text_6c_68dc
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	playsound SFX_2c
	face FACE_LEFT
	warpmode GAMEMODE_1A, $18, $05
	scr_62 $01, $00
	scr_62 $02, $00
	scr_62 $03, $00
	scr_62 $04, $00
	scr_62 $05, $00
	scr_62 $06, $00
	scr_62 $07, $00
	setbit wEventFlags + 20, $03
	end

Script_06c_4b9c:
	stext text_6c_68ea
	stext text_6c_68fd
	setattach $01, $00, $00, $f0
	objmove $00, MovementData_06c_7964
	face FACE_DOWN
	stext text_6c_6912
	stext text_6c_6927
	stext text_6c_6947
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_6972
	stext text_6c_6986
	stext text_6c_69c5
	stext text_6c_69e4
	spritewalk  1, MOVE_LEFT
	face FACE_RIGHT
	move MovementData_OneLeft
	spritewalk  2, MOVE_UP
	spriteface  1, FACE_LEFT
	stext text_6c_6a04
	stext text_6c_6a1d
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	warpmode GAMEMODE_1A, $18, $05
	scr_62 $01, $00
	scr_62 $02, $00
	scr_62 $03, $00
	scr_62 $04, $00
	scr_62 $05, $00
	scr_62 $06, $00
	scr_62 $07, $00
	end

G6_13_ObjectEvents:
	dr $1b0bff, $1b0c0b
ObjSprite_6c_4c0b::
	dr $1b0c0b, $1b0c17

G6_22_ObjectEvents:
	dr $1b0c17, $1b0c2e

G6_23_ObjectEvents:
	dr $1b0c2e, $1b0c45

G6_24_ObjectEvents:
	dr $1b0c45, $1b0c5c

G6_27_ObjectEvents:
	dr $1b0c5c, $1b0c68

G6_2B_ObjectEvents4:
	dr $1b0c68, $1b0c74

G6_2B_ObjectEvents:
	dr $1b0c74, $1b0c80

G6_2B_ObjectEvents3:
	dr $1b0c80, $1b0c97
Script_06c_4c97::
	checkbit wEventFlags + 18, $04, Script_06c_4ca1
	setmap $2b, $00
	end2

Script_06c_4ca1:
	checkbit wEventFlags + 18, $06, Script_06c_4cab
	setmap $2b, $02
	end2

Script_06c_4cab:
	checkbit wEventFlags + 19, $01, Script_06c_4cb5
	setmap $2b, $00
	end2

Script_06c_4cb5:
	setmap $2b, $03
	end2
Script_06c_4cb9::
	setmap $2b, $01
	end2

Script_06c_4cbd:
	setmap $2b, $05
	end2

Script_06c_4cc1:
	checkbit wEventFlags + 18, $06, Script_06c_4ccb
	textface text_6c_5682
	end

Script_06c_4ccb:
	checkbit wEventFlags + 19, $00, Script_06c_4cd5
	textface text_6c_5e58
	end

Script_06c_4cd5:
	textface text_6c_5f88
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	stext text_6c_5fc7
	listdec $02, $27
	setbit wEventFlags + 19, $02
	end

Script_06c_4ceb:
	ifcharindex $01, Script_06c_4cf9
	stext text_6c_5bde
	stext text_6c_5be7
	stext text_6c_5c09
	end

Script_06c_4cf9:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_5c1f
	stext text_6c_5c59
	stext text_6c_5c77
	stext text_6c_5cdc
	stext text_6c_5d1f
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_5d34
	stext text_6c_5d9e
	stext text_6c_5da7
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	stext text_6c_5db2
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	setmap $2b, $04
	setbit wEventFlags + 18, $05
	setbit wEventFlags + 18, $06
	end

unk_06c_4d4f::
	dr $1b0d4f, $1b0d66

G6_26_ObjectEvents:
	dr $1b0d66, $1b0d72

G6_26_ObjectEvents2:
	dr $1b0d72, $1b0eba
Script_06c_4eba::
	checkbit wEventFlags + 19, $01, Script_06c_4ed0
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end

Script_06c_4ed0:
	setmap $03, $01
	end2
Script_06c_4ed4::
	checkbit wEventFlags + 19, $02, Script_06c_4ede
Script_06c_4eda:
	setmap $0c, $01
	end

Script_06c_4ede:
	checkbit wEventFlags + 19, $01, Script_06c_4eda
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_5fef
	stext text_6c_6009
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_602a
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_6036
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_UP
	setbit wEventFlags + 19, $01
	end

Script_06c_4f14:
	stext text_6c_61ec
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	end
Script_06c_4f23::
	checkbit wEventFlags + 19, $03, Script_06c_4f39
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end

Script_06c_4f39:
	setplayerchar $00
	setmap $0d, $03
	objmove $02, MovementData_06c_79a6
	setmap $07, $03
	spriteface  2, FACE_LEFT
	stext text_6c_621e
	setmap $2c, $00
	delay $03, $20
	face FACE_LEFT
	setmap $10, $01
	spriteface  2, FACE_RIGHT
	stext text_6c_624d
	stext text_6c_627c
	stext text_6c_62eb
	stext text_6c_6317
	stext text_6c_635b
	spriteface  2, FACE_LEFT
	stext text_6c_63ca
	stext text_6c_63f4
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_6440
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_6470
	stext text_6c_64a5
	stext text_6c_64bc
	scr_62 $01, $00
	scr_62 $02, $00
	scr_62 $03, $00
	scr_62 $04, $00
	scr_62 $05, $00
	scr_62 $06, $00
	scr_62 $07, $00
	end

unk_06c_4f9e::
	dr $1b0f9e, $1b0faa

G6_1F_ObjectEvents:
	dr $1b0faa, $1b0ffd
Script_06c_4ffd::
	face FACE_DOWN
	setmap $06, $01
	end2
Script_06c_5003::
	setmap $07, $02
	end2
Script_06c_5007::
	checkbit wEventFlags + 19, $03, Script_06c_5003
	face FACE_UP
	setmap $07, $00
	spriteface  2, FACE_LEFT
	stext text_6c_6045
	spriteface  2, FACE_DOWN
	setattach $01, $00, $10, $00
	objmove $00, MovementData_06c_79d7
	clearattach $00
	stext text_6c_6068
	setmap $07, $01
	startbattle BattleData_02d_4f29
	checkbit wEventFlags + 3, $03, Script_06c_4ffd
	stext text_6c_60d0
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_60df
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_60f4
	clearobject $02
	stext text_6c_610e
	setbit wEventFlags + 19, $03
	scr_48 $02, $28
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $07, $01
	stext text_6c_611d
	stext text_6c_6173
	stext text_6c_618f
	stext text_6c_61c6
	end
Script_06c_5068::
	checkbit wEventFlags + 23, $06, Script_06c_506f
	end

Script_06c_506f:
	checkbit wEventFlags + 18, $04, Script_06c_50fd
	setplayerchar $00
	setmap $2a, $00
	stext text_6c_5785
	stext text_6c_57a7
	stext text_6c_57e6
	stext text_6c_583f
	face FACE_UP
	scont
	setmap $0c, $0b
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	spriteface  5, FACE_UP
	spriteface  6, FACE_UP
	emote  3, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  6, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_589e
	spriteface  3, FACE_LEFT
	objmove $03, MovementData_06c_7913
	clearobject $03
	stext text_6c_58c1
	spriteface  4, FACE_RIGHT
	objmove $04, MovementData_06c_7944
	clearobject $04
	spriteface  5, FACE_DOWN
	objmove $05, MovementData_06c_7975
	clearobject $05
	spriteface  6, FACE_DOWN
	objmove $06, MovementData_06c_7975
	clearobject $06
	stext text_6c_58e3
	stext text_6c_58f3
	emote  0, EMOTE_QUESTION
	delay $03, $20
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	face FACE_RIGHT
	spriteface  2, FACE_LEFT
	stext text_6c_5909
	stext text_6c_595f
	clearplayerpos
	spritewalk  2, MOVE_LEFT
	setmap $0c, $0c
	setbit wEventFlags + 18, $04
	end

Script_06c_50fd:
	end

INCLUDE "data/text/bank6c_50fe.asm"
INCLUDE "data/text/bank6c_5682.asm"
INCLUDE "data/text/bank6c_5fef.asm"
INCLUDE "data/text/bank6c_6045.asm"
MovementData_06c_7913:
	dr $1b3913, $1b3944
MovementData_06c_7944:
	dr $1b3944, $1b3964
MovementData_06c_7964:
	dr $1b3964, $1b3975
MovementData_06c_7975:
	dr $1b3975, $1b3995
MovementData_06c_7995:
	dr $1b3995, $1b39a6
MovementData_06c_79a6:
	dr $1b39a6, $1b39d7
MovementData_06c_79d7:
	dr $1b39d7, $1b3a80
