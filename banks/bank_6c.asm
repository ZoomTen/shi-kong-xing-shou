G6_28_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_06c_400c
	objects_end

Script_06c_400c:
	textface text_6c_40a4
	end
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
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_06c_4039
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_06c_403d
	objects_end

Script_06c_4039:
	stext text_6c_405d
	end
Script_06c_403d:
	stext text_6c_4075
	end
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

INCLUDE "data/text/script_g6_08_1.asm"

G6_18_ObjectEvents:
	object_event $04,  6, 11, wEventFlags + 21, $07, $00, $00, $00, Script_06c_40e8
	object_event $06, 10,  6, wEventFlags + 22, $00, $00, $00, $01, Script_06c_4111
	object_event $02, 10, 15, wEventFlags + 22, $01, $00, $00, $02, Script_06c_413a
	object_event $0c, 15,  8, wEventFlags + 22, $02, $00, $00, $03, Script_06c_4163
	objects_end
Script_06c_40e8:
	checkbit wEventFlags + 21, $06, Script_06c_40f6
	textface text_6c_6aa6
	setbit wEventFlags + 20, $06
	end

Script_06c_40f6:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6e62
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $02, $01
	setbit wEventFlags + 21, $07
	end

Script_06c_4111:
	checkbit wEventFlags + 21, $06, Script_06c_411f
	stext text_6c_6ad5
	setbit wEventFlags + 20, $07
	end

Script_06c_411f:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6e97
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $03, $01
	setbit wEventFlags + 22, $00
	end

Script_06c_413a:
	checkbit wEventFlags + 21, $06, Script_06c_4148
	stext text_6c_6b13
	setbit wEventFlags + 21, $02
	end

Script_06c_4148:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6ebb
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $01, $01
	setbit wEventFlags + 22, $01
	end

Script_06c_4163:
	checkbit wEventFlags + 21, $06, Script_06c_4171
	stext text_6c_6b44
	setbit wEventFlags + 21, $03
	end

Script_06c_4171:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6ed1
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $06, $01
	setbit wEventFlags + 22, $02
	end

G6_19_ObjectEvents:
	object_event $29,  5,  4, wEventFlags + 21, $06, $00, $00, $00, Script_06c_41a6
	objects_end
Script_06c_4198::
	checkbit wEventFlags + 22, $05, Script_06c_41a2
	setmap MAP_G6_1B, $00
	end

Script_06c_41a2:
	setmap MAP_G6_1B, $01
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
	object_event $59,  5,  8, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end

G6_1A_ObjectEvents:
	object_event $08,  4,  4, wEventFlags + 22, $03, $00, $00, $00, Script_06c_4289
	object_event $0a,  7,  4, wEventFlags + 22, $04, $00, $00, $01, Script_06c_42b2
	objects_end
Script_06c_4289:
	checkbit wEventFlags + 21, $06, Script_06c_4297
	stext text_6c_6bad
	setbit wEventFlags + 21, $04
	end

Script_06c_4297:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6f1c
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $04, $01
	setbit wEventFlags + 22, $03
	end

Script_06c_42b2:
	checkbit wEventFlags + 21, $06, Script_06c_42c0
	stext text_6c_6bf2
	setbit wEventFlags + 21, $05
	end

Script_06c_42c0:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6f41
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $05, $01
	setbit wEventFlags + 22, $04
	end

G6_1B_ObjectEvents:
	object_event $0e,  5,  4, wEventFlags + 20, $03, $00, $00, $00, Script_06c_42e7
	objects_end
Script_06c_42e7:
	checkbit wEventFlags + 21, $06, Script_06c_42f5
	stext text_6c_6c25
	setbit wEventFlags + 20, $04
	end
Script_06c_42f5:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6f77
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $07, $01
	setbit wEventFlags + 22, $05
	end
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
	setmap MAP_G6_1E, $00
	end

G6_1D_ObjectEvents:
	object_event $22,  8,  4, 0, $00, $00, $00, $00, Script_06c_43aa
	objects_end

Script_06c_43aa:
	textface text_6c_40a4
	end
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
	object_event $11,  5,  4, wEventFlags + 24, $03, $00, $00, $00, Script_06c_43aa
	object_event $59,  4,  5, wEventFlags + 24, $03, $00, $00, $01, Script_06c_43aa
	object_event $29,  5,  5, wEventFlags + 24, $03, $00, $00, $02, Script_06c_43aa
	objects_end

G6_21_ObjectEvents:
	object_event $11,  3,  4, 0, $00, $00, $00, $00, Script_06c_440e
	object_event $59,  3,  6, 0, $00, $00, $00, $01, Script_06c_4412
	object_event $29,  7,  3, 0, $00, $00, $00, $02, Script_06c_4416
	objects_end

Script_06c_440e:
	stext text_6c_743e
	end
Script_06c_4412:
	stext text_6c_741a
	end
Script_06c_4416:
	stext text_6c_7476
	end
Script_06c_441a::
	warp6c
	setplayerchar $00
	face FACE_UP
	setmap MAP_G6_20, $00
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
	object_event $5d, 16,  4, wEventFlags + 22, $07, $00, $00, $00, Script_06c_455a
	object_event $22, 15, 17, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25,  3,  1, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  1, 12, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end

G6_09_ObjectEvents:
	object_event $5c, 14, 25, wEventFlags + 23, $00, $00, $00, $00, Script_06c_456d
	object_event $22, 14,  4, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25,  3, 28, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  2, 23, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end

G6_0A_ObjectEvents:
	object_event $50,  4,  3, wEventFlags + 23, $01, $00, $00, $00, Script_06c_4580
	object_event $22, 16, 25, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25,  4, 13, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  7, 28, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end

EndingEpilogue_ObjectEvents:
	object_event $5e,  9, 17, wEventFlags + 23, $02, $00, $00, $00, Script_06c_4596
	object_event $5f,  9, 17, wEventFlags + 23, $02, $01, $00, $00, Script_06c_4596
	object_event $22,  1, 16, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25, 10, 28, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  8,  2, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end
Script_06c_455a:
	textface text_6c_748f
	startbattle BattleData_02d_4f85
	checkbit wEventFlags + 3, $03, Script_06c_473a
	clearobject $88
	setbit wEventFlags + 22, $07
	end

Script_06c_456d:
	textface text_6c_74d2
	startbattle BattleData_02d_4fb3
	checkbit wEventFlags + 3, $03, Script_06c_473a
	clearobject $88
	setbit wEventFlags + 23, $00
	end

Script_06c_4580:
	textface text_6c_757d
	startbattle BattleData_02d_4fe1
	checkbit wEventFlags + 3, $03, Script_06c_473a
	stext text_6c_7643
	clearobject $88
	setbit wEventFlags + 23, $01
	end

Script_06c_4596:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	checkbit wEventFlags + 23, $02, Script_06c_45c8
	stext text_6c_765d
	stext text_6c_76a8
	startbattle BattleData_02d_500f
	checkbit wEventFlags + 3, $03, Script_06c_473a
	stext text_6c_76db
	clearobject $88
	loadobjsprite Script_06c_4659
	clearobject $88
	loadobjsprite ObjSprite_6c_4665
	clearobject $88
	loadobjsprite Script_06c_4659
	setbit wEventFlags + 23, $02
Script_06c_45c8::
	stext text_6c_7725
	startbattle BattleData_02d_503d
	checkbit wEventFlags + 3, $03, Script_06c_473a
	stext text_6c_77f4
	spriteface 136, FACE_UP
	spritewalk 136, MOVE_UP
	stext text_6c_7835
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_788f
	move MovementData_OneUp
	move MovementData_OneDown
	stext text_6c_78ab
	stext text_6c_78b6
	stext text_6c_78ed
	stext text_6c_78f5
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_7906
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	setmapgroup $07
	farjump2 Script_06e_4109
	end

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
	setmap MAP_G6_09, $00
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
	setmap MAP_G6_0A, $00
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
	setmap MAP_ENDING_EPILOGUE, $00
	end

Script_06c_4659:
	dirmovement
	end

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_06c_465b:
	db $11, $00, $00, $00, $00, $00, $00, $06, $47, $88
ObjSprite_6c_4665::
	object_event $5e,  9, 17, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end
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
	object_event $25,  3,  4, 0, $00, $00, $00, $00, Script_06c_46ce
	object_event $25,  8,  4, 0, $00, $00, $00, $01, Script_06c_46d2
	objects_end

Script_06c_46ce:
	stext text_6c_405d
	end
Script_06c_46d2:
	stext text_6c_4075
	end
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
KingkongMountain_ObjectEvents2:
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
BaalCapitalProfessor_2b_ObjectEvents2:
G6_2C_ObjectEvents:
	objects_end
Script_06c_4708::
	checkbit wEventFlags + 18, $06, Script_06c_4712
	setmap MAP_KINGKONG_MOUNTAIN, $01
	end2

Script_06c_4712:
	setmap MAP_KINGKONG_MOUNTAIN, $00
	end2

; TODO: object_event array + interleaved scripts/text - per-bank carve
KingkongMountain_ObjectEvents:
	object_event $62,  8,  3, wEventFlags + 18, $07, $00, $00, $00, Script_06c_4722
	objects_end
Script_06c_4722:
	textface text_6c_5f63
	startbattle BattleData_02d_4efb
	checkbit wEventFlags + 3, $03, Script_06c_473a
	clearobject $02
	setbit wEventFlags + 18, $07
	stext text_6c_5f78
	scr_48 $02, $26
Script_06c_473a::
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G6_0D_ObjectEvents2:
	object_event $0e,  6,  5, wEventFlags + 24, $02, $00, $00, $00, Script_06c_4706
	object_event $0f,  6,  6, wEventFlags + 24, $02, $00, $00, $01, Script_06c_4706
	objects_end
Script_06c_4752:
	setplayerchar $00
	face FACE_DOWN
	warpmode GAMEMODE_FLOATING_ISLAND_CUTSCENE2, $0d, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_6c_50fe
	playsound SFX_4d
	delay $03, $08
	playsound SFX_4d
	delay $03, $08
	playsound SFX_4d
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_5137
	warpmode GAMEMODE_WORLD_MAP2, $0d, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_6c_5151
	clearplayerpos
	spritewalk  2, MOVE_UP
	clearobject $02
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	setbit wEventFlags + 24, $02
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
BaalCapitalProfessor_07_ObjectEvents:
	object_event $5a,  6,  6, wEventFlags + 19, $03, $00, $00, $00, Script_06c_502c
	object_event $58,  5,  6, 0, $00, $00, $00, $01, Script_06c_47e9
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
BaalCapitalProfessor_07_ObjectEvents2:
	object_event $5b,  6,  6, wEventFlags + 19, $03, $00, $00, $00, Script_06c_502c
	object_event $58,  5,  6, 0, $00, $00, $00, $01, Script_06c_47e9
	objects_end

BaalCapitalProfessor_07_ObjectEvents4:
	object_event $59,  6,  6, 0, $00, $00, $00, $00, Script_06c_4706
	object_event $58,  5,  6, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end

BaalCapitalProfessor_07_ObjectEvents3:
	object_event $58,  5,  6, 0, $00, $00, $00, $00, Script_06c_47e9
	objects_end

Script_06c_47e9:
	checkbit wEventFlags + 19, $03, Script_06c_47f0
	end
Script_06c_47f0:
	ifcharindex $01, Script_06c_47fb
	stext text_6c_5bde
	stext text_6c_5c09
	end
Script_06c_47fb:
	stext text_6c_61cf
	end

BaalCapital_0c_ObjectEvents:
	object_event $19,  6,  9, 0, $00, $00, $09, $00, Script_06c_4890
	object_event $16,  8, 27, 0, $00, $00, $0b, $01, Script_06c_4894
	object_event $14, 11,  6, 0, $00, $00, $06, $02, Script_06c_48a2
	object_event $17, 18, 18, 0, $00, $00, $08, $03, Script_06c_48a6
	object_event $13,  9, 17, 0, $00, $00, $0a, $04, Script_06c_48aa
	object_event $1c, 28, 19, 0, $00, $00, $08, $00, Script_06c_48ae
	object_event $15, 28,  5, 0, $00, $00, $0a, $01, Script_06c_48b2
	object_event $22, 23, 12, 0, $00, $00, $09, $02, Script_06c_48c0
	objects_end

BaalCapital_0c_ObjectEvents2:
	object_event $0e, 18,  5, 0, $00, $00, $00, $00, Script_06c_4706
	object_event $12, 15,  5, 0, $00, $00, $00, $01, Script_06c_4706
	object_event $1b, 20,  5, 0, $00, $00, $00, $02, Script_06c_4706
	object_event $19, 16,  7, 0, $00, $00, $00, $03, Script_06c_4706
	object_event $15, 18,  7, 0, $00, $00, $00, $04, Script_06c_4706
	objects_end

Script_06c_4890:
	textface text_6c_517a
	end
Script_06c_4894:
	checkbit wEventFlags + 18, $04, Script_06c_489e
	textface text_6c_5197
	end
Script_06c_489e:
	textface text_6c_5996
	end
Script_06c_48a2:
	textface text_6c_51ff
	end
Script_06c_48a6:
	textface text_6c_5265
	end
Script_06c_48aa:
	textface text_6c_52bf
	end
Script_06c_48ae:
	textface text_6c_5317
	end
Script_06c_48b2:
	checkbit wEventFlags + 18, $04, Script_06c_48bc
	textface text_6c_5368
	end
Script_06c_48bc:
	textface text_6c_59cb
	end
Script_06c_48c0:
	checkbit wEventFlags + 18, $04, Script_06c_48ca
	textface text_6c_53e5
	end
Script_06c_48ca:
	textface text_6c_5a48
	end

G6_0D_ObjectEvents:
	object_event $70,  6,  2, wEventFlags + 19, $03, $01, $00, $00, Script_06c_4706
	object_event $16,  6,  4, wEventFlags + 19, $03, $01, $00, $01, Script_06c_4f14
	objects_end

G6_0D_ObjectEvents3:
	object_event $70,  6,  2, wEventFlags + 19, $03, $01, $00, $00, Script_06c_4706
	objects_end

G6_10_ObjectEvents2:
	object_event $29,  3,  5, 0, $00, $00, $00, $00, Script_06c_48fd
	objects_end

Script_06c_48fd:
	textface text_6c_64f3
	end

G6_14_ObjectEvents:
	object_event $02,  3,  5, wEventFlags + 19, $04, $00, $00, $00, Script_06c_498b
	object_event $03,  3,  4, wEventFlags + 19, $04, $00, $00, $01, Script_06c_4706
	objects_end

G6_11_ObjectEvents:
	object_event $04,  3,  4, wEventFlags + 19, $05, $00, $00, $00, Script_06c_49ab
	object_event $05,  3,  3, wEventFlags + 19, $05, $00, $00, $01, Script_06c_4706
	objects_end

G6_15_ObjectEvents:
	object_event $06,  3,  5, wEventFlags + 19, $06, $00, $00, $00, Script_06c_49cb
	object_event $07,  3,  4, wEventFlags + 19, $06, $00, $00, $01, Script_06c_4706
	objects_end

G6_12_ObjectEvents:
	object_event $08,  3,  4, wEventFlags + 19, $07, $00, $00, $00, Script_06c_49eb
	object_event $09,  3,  3, wEventFlags + 19, $07, $00, $00, $01, Script_06c_4706
	objects_end

G6_16_ObjectEvents:
	object_event $0a,  3,  5, wEventFlags + 21, $00, $00, $00, $00, Script_06c_4a0b
	object_event $0b,  3,  4, wEventFlags + 21, $00, $00, $00, $01, Script_06c_4706
	objects_end

G6_17_ObjectEvents:
	object_event $0c,  7,  4, wEventFlags + 21, $01, $00, $00, $00, Script_06c_4a2b
	object_event $0d,  7,  3, wEventFlags + 21, $01, $00, $00, $01, Script_06c_4706
	objects_end

Script_06c_498b:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_652a
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $01, $01
	setbit wEventFlags + 19, $04
	end
Script_06c_49ab:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_6542
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $02, $01
	setbit wEventFlags + 19, $05
	end
Script_06c_49cb:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_6566
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $03, $01
	setbit wEventFlags + 19, $06
	end
Script_06c_49eb:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_659b
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $04, $01
	setbit wEventFlags + 19, $07
	end
Script_06c_4a0b:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_65bf
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $05, $01
	setbit wEventFlags + 21, $00
	end
Script_06c_4a2b:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_661f
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $06, $01
	setbit wEventFlags + 21, $01
	end
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
	setmap MAP_G6_0F, $03
	end2

Script_06c_4ae7:
	setplayerchar $00
	setmap MAP_G6_13, $00
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
	object_event $0e,  8,  3, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end
ObjSprite_6c_4c0b::
	object_event $50,  9,  3, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end

BaalCapital_22_ObjectEvents:
	object_event $19,  3,  6, 0, $00, $00, $08, $00, Script_06c_4daa
	object_event $16,  9,  5, 0, $00, $00, $00, $01, Script_06c_4db8
	objects_end

BaalCapital_23_ObjectEvents:
	object_event $20,  4,  4, 0, $00, $00, $07, $00, Script_06c_4dc6
	object_event $1f,  6,  4, 0, $00, $00, $00, $01, Script_06c_4dca
	objects_end

BaalCapital_24_ObjectEvents:
	object_event $1b,  9,  6, 0, $00, $00, $00, $00, Script_06c_4dce
	object_event $1a,  4,  6, 0, $00, $00, $09, $01, Script_06c_4dd2
	objects_end

BaalCapitalBlacksmith_ObjectEvents:
	object_event $24,  4,  5, 0, $00, $00, $00, $00, Script_06c_4dd6
	objects_end

BaalCapitalProfessor_2b_ObjectEvents4:
	object_event $5a,  5,  3, 0, $00, $00, $00, $00, Script_06c_4cc1
	objects_end

BaalCapitalProfessor_2b_ObjectEvents:
	object_event $5a,  5,  3, 0, $00, $00, $00, $00, Script_06c_4cc1
	objects_end

BaalCapitalProfessor_2b_ObjectEvents3:
	object_event $5a,  5,  4, 0, $00, $00, $00, $00, Script_06c_4cc1
	object_event $58,  6,  4, 0, $00, $00, $00, $00, Script_06c_4ceb
	objects_end
Script_06c_4c97::
	checkbit wEventFlags + 18, $04, Script_06c_4ca1
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $00
	end2

Script_06c_4ca1:
	checkbit wEventFlags + 18, $06, Script_06c_4cab
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $02
	end2

Script_06c_4cab:
	checkbit wEventFlags + 19, $01, Script_06c_4cb5
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $00
	end2

Script_06c_4cb5:
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $03
	end2
Script_06c_4cb9::
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $01
	end2

Script_06c_4cbd:
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $05
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
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $04
	setbit wEventFlags + 18, $05
	setbit wEventFlags + 18, $06
	end

unk_06c_4d4f::
	object_event $5a,  5,  4, 0, $00, $00, $00, $00, Script_06c_4e2f
	object_event $58,  6,  4, wEventFlags + 18, $04, $01, $00, $00, Script_06c_4e3d
	objects_end

BaalCapital_26_ObjectEvents:
	object_event $58,  4,  4, wEventFlags + 18, $04, $00, $00, $00, Script_06c_4ea3
	objects_end

BaalCapital_26_ObjectEvents2:
	object_event $58,  4,  4, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end
; TODO: map array reached via binary map header (source map unknown)
ObjectEvents_06c_4d7e:
	object_event $5a,  5,  3, 0, $00, $00, $00, $00, Script_06c_4d8a
	objects_end
Script_06c_4d8a:
	checkbit wEventFlags + 19, $00, Script_06c_4d94
	textface text_6c_5dd0
	end
Script_06c_4d94:
	textface text_6c_5f88
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	stext text_6c_5fc7
	listdec $02, $27
	setbit wEventFlags + 19, $02
	end
Script_06c_4daa:
	checkbit wEventFlags + 18, $04, Script_06c_4db4
	textface text_6c_542b
	end
Script_06c_4db4:
	textface text_6c_5a95
	end
Script_06c_4db8:
	checkbit wEventFlags + 18, $04, Script_06c_4dc2
	textface text_6c_547d
	end
Script_06c_4dc2:
	textface text_6c_5b0a
	end
Script_06c_4dc6:
	textface text_6c_54d1
	end
Script_06c_4dca:
	textface text_6c_553e
	end
Script_06c_4dce:
	textface text_6c_559c
	end
Script_06c_4dd2:
	textface text_6c_55f6
	end
Script_06c_4dd6:
	checkbit wEventFlags + 18, $06, Script_06c_4de0
	textface text_6c_5634
	end

Script_06c_4de0:
	checkbit wEventFlags + 18, $07, Script_06c_4dea
	textface text_6c_5ee0
	end

Script_06c_4dea:
	checkbit wEventFlags + 19, $00, Script_06c_4e2b
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_5f30
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	spriteface  2, FACE_RIGHT
	objmove $02, MovementData_06c_7944
	spriteface  2, FACE_DOWN
	spriteface  2, FACE_LEFT
	objmove $02, MovementData_06c_7913
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	stext text_6c_5f4d
	scr_48 $02, $27
	listdec $02, $26
	setbit wEventFlags + 19, $00
	end

Script_06c_4e2b:
	textface text_6c_5634
	end

Script_06c_4e2f:
	checkbit wEventFlags + 18, $04, Script_06c_4e39
	textface text_6c_5682
	end

Script_06c_4e39:
	textface text_6c_5b7e
	end

Script_06c_4e3d:
	ifcharindex $01, Script_06c_4e4b
	stext text_6c_5bde
	stext text_6c_5be7
	stext text_6c_5c09
	end

Script_06c_4e4b:
	checkbit wEventFlags + 18, $05, Script_06c_4e9f
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	textface text_6c_5c1f
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
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $02
	setbit wEventFlags + 18, $06
	stext text_6c_5dd0
	end

Script_06c_4e9f:
	stext text_6c_5e58
	end
Script_06c_4ea3:
	textface text_6c_56d4
	textface text_6c_5755
	setbit wEventFlags + 23, $06
	end
ObjectEvents_06c_4eae:
	object_event $5a, 11, 13, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end
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
	setmap MAP_G6_03, $01
	end2
Script_06c_4ed4::
	checkbit wEventFlags + 19, $02, Script_06c_4ede
Script_06c_4eda:
	setmap MAP_BAAL_CAPITAL_0C, $01
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
	setmap MAP_G6_0D, $03
	objmove $02, MovementData_06c_79a6
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $03
	spriteface  2, FACE_LEFT
	stext text_6c_621e
	setmap MAP_G6_2C, $00
	delay $03, $20
	face FACE_LEFT
	setmap MAP_G6_10, $01
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
	object_event $59,  3,  9, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end

G6_1F_ObjectEvents:
	object_event $59,  5,  4, wEventFlags + 22, $06, $00, $00, $01, Script_06c_4fc1
	object_event $29,  5,  5, wEventFlags + 22, $06, $00, $00, $00, Script_06c_4fc1
	objects_end
Script_06c_4fc1:
	textface text_6c_6fc8
	stext text_6c_6fea
	stext text_6c_7019
	spriteface  2, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	spritewalk  2, MOVE_DOWN
	stext text_6c_7023
	spritewalk  2, MOVE_DOWN
	clearobject $02
	setbit wEventFlags + 22, $06
	end
Script_06c_4fe5:
	checkbit wEventFlags + 18, $06, Script_06c_4fef
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $00
	end2
Script_06c_4fef:
	checkbit wEventFlags + 19, $02, Script_06c_4ff9
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $04
	end2
Script_06c_4ff9:
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $06
	end2
Script_06c_4ffd::
	face FACE_DOWN
	setmap MAP_G6_06, $01
	end2
Script_06c_5003::
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $02
	end2
Script_06c_5007::
	checkbit wEventFlags + 19, $03, Script_06c_5003
	face FACE_UP
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $00
	spriteface  2, FACE_LEFT
	stext text_6c_6045
	spriteface  2, FACE_DOWN
	setattach $01, $00, $10, $00
	objmove $00, MovementData_06c_79d7
	clearattach $00
	stext text_6c_6068
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $01
Script_06c_502c::
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
	setmap MAP_G6_2A, $00
	stext text_6c_5785
	stext text_6c_57a7
	stext text_6c_57e6
	stext text_6c_583f
	face FACE_UP
	scont
	setmap MAP_BAAL_CAPITAL_0C, $0b
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
	setmap MAP_BAAL_CAPITAL_0C, $0c
	setbit wEventFlags + 18, $04
	end

Script_06c_50fd:
	end

INCLUDE "data/text/script_baal_capital_arrival.asm"
INCLUDE "data/text/script_baal_capital_0c_1.asm"
INCLUDE "data/text/script_baal_capital_22_1.asm"
INCLUDE "data/text/script_baal_capital_23.asm"
INCLUDE "data/text/script_baal_capital_24.asm"
INCLUDE "data/text/script_baal_capital_blacksmith_27_1.asm"
INCLUDE "data/text/script_baal_capital_professor_2b_1.asm"
INCLUDE "data/text/script_baal_capital_26_1.asm"
INCLUDE "data/text/script_baal_capital_0c_2.asm"
INCLUDE "data/text/script_baal_capital_22_2.asm"
INCLUDE "data/text/script_baal_capital_professor_2b_2.asm"
INCLUDE "data/text/script_baal_capital_blacksmith_27_2.asm"
INCLUDE "data/text/script_kingkong_mountain.asm"
INCLUDE "data/text/script_baal_capital_professor_26_2.asm"
INCLUDE "data/text/script_baal_capital_professor_5fef.asm"
INCLUDE "data/text/script_baal_capital_professor_07.asm"
INCLUDE "data/text/script_g6_0d.asm"
INCLUDE "data/text/script_g6_10.asm"
INCLUDE "data/text/script_g6_14.asm"
INCLUDE "data/text/script_g6_11.asm"
INCLUDE "data/text/script_g6_15.asm"
INCLUDE "data/text/script_g6_12.asm"
INCLUDE "data/text/script_g6_16.asm"
INCLUDE "data/text/script_g6_17.asm"
INCLUDE "data/text/script_g6_19_1.asm"
INCLUDE "data/text/script_g6_18_1.asm"
INCLUDE "data/text/script_g6_1a_1.asm"
INCLUDE "data/text/script_g6_1b_1.asm"
INCLUDE "data/text/script_g6_19_2.asm"
INCLUDE "data/text/script_g6_18_2.asm"
INCLUDE "data/text/script_g6_1a_2.asm"
INCLUDE "data/text/script_g6_1b_2.asm"
INCLUDE "data/text/script_g6_1f.asm"
INCLUDE "data/text/script_g6_21.asm"
INCLUDE "data/text/script_g6_08_2.asm"
INCLUDE "data/text/script_g6_09.asm"
INCLUDE "data/text/script_g6_0a.asm"
INCLUDE "data/text/script_g6_0b_1.asm"
MovementData_06c_7913:
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $88
MovementData_06c_7944:
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
MovementData_06c_7964:
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $88
MovementData_06c_7975:
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
MovementData_06c_7995:
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $88
MovementData_06c_79a6:
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $ff, $00, $ff, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fd, $00, $fd, $00, $fd, $00, $fd, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $88
MovementData_06c_79d7:
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $88
Script_06c_7a51:
	textface text_6c_40a4
	checkbit wEventFlags + 4, $01, Script_06c_7a5d
	scr_35 $0d
	end

Script_06c_7a5d:
	end

Script_06c_7a5e:
	textface text_6c_405d
	checkbit wEventFlags + 3, $03, Script_06c_7a69
	scr_37
	end

Script_06c_7a69:
	end

Script_06c_7a6a:
	textface text_6c_4075
	checkbit wEventFlags + 3, $03, Script_06c_7a75
	townmusicanim
	end

Script_06c_7a75:
	end
