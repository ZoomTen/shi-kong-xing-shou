Script_00e_4000:
	end

Script_00e_4001:
	setmap $2d, $01
	end

Script_00e_4005::
	face FACE_DOWN
	stext text_0e_4abe
	end

Func_00e_400b:
	xor a
	ld [wTargetMode], a
	jp JumpToGameMode

Script_00e_4012:
	checkbit wEventFlags, $04, Script_00e_4049
	face FACE_UP
	stext text_0e_4b34
	emote $00, $00
	delay $03, $20
	stext text_0e_4b4d
	emote $00, $00
	delay $03, $20
	stext text_0e_4bc0
	emote $00, $00
	delay $03, $20
	stext text_0e_4bfb
	emote $00, $00
	delay $03, $20
	stext text_0e_4c6a
	scr_48 2, 1
	setbit wEventFlags, 4
	end

Script_00e_4049:
	end

Script_00e_404a:
	checkbit wEventFlags, $04, Script_00e_4059
	stext text_0e_4af9
	face FACE_UP
	move MovementData_OneUp
	end

Script_00e_4059:
	setfollower $02
	face FACE_LEFT
	setmap $01, $08
	face FACE_RIGHT
	stext text_0e_4cdd
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	move MovementData_OneLeft
	stext text_0e_4cec
	spritewalk  1, MOVE_LEFT
	stext text_0e_4cfd
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_0e_4d10
	stext text_0e_4d42
	stext text_0e_4d50
	face FACE_LEFT
	stext text_0e_4d81
	loadscriptedmon $00
	loadbufmon
	end

Script_00e_408f:
	stext text_0e_5333
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spritewalk $01, $02
	spriteface $01, $00
	end

Script_00e_409f:
	checkbit wEventFlags, $05, Script_00e_40b5
	stext text_0e_7dff
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, $01
	spriteface $01, $01
	end

Script_00e_40b5:
	setmap $28, $00
	end

Script_00e_40b9:
	setmap $2d, $00
	emote $00, $00
	delay $03, $20
	stext text_0e_54aa
	setmappredef MAPPREDEF_05
	end

Script_00e_40c8:
	farjump2 Script_00f_4002
	end

Script_00e_40cd:
	farjump2 Script_00f_4006
	end

Script_00e_40d2:
	checkbit wEventFlags, $06, Script_00e_40dc
	setmap $2d, $08
	end

Script_00e_40dc:
	checkbit wEventFlags, $07, Script_00e_40e6
	setmap $2d, $0d
	end

Script_00e_40e6:
	checkbit wEventFlags + 1, $04, Script_00e_40f0
	setmap $2d, $08
	end

Script_00e_40f0:
	checkbit wEventFlags + 1, $05, Script_00e_40fa
	setmap $2d, $0e
	end

Script_00e_40fa:
	setmap $2d, $08
	end

Script_00e_40fe:
	checkbit wEventFlags + 1, $01, Script_00e_4105
	end

Script_00e_4105:
	face FACE_UP
	dirmovement
	spriteface $01, $01
	emote $00, $00
	delay $03, $20
	stext text_0e_662c
	stext text_0e_6647
	ifcharindex $01, Script_00e_411f
	stext text_0e_665b
	end

Script_00e_411f:
	stext text_0e_66b8
	stext text_0e_66eb
	setmap $22, $00
	end

Script_00e_4129:
	checkbit wEventFlags + 2, $01, Script_00e_4130
Script_00e_412f:
	end

Script_00e_4130:
	checkbit wEventFlags + 2, $02, Script_00e_412f
	stext text_0e_71b4
	scr_48 $02, $04
	setbit wEventFlags + 2, $02
	end

BellSchoolSouthClassroom2_ObjectEvents::
BellSchoolNorthClassroom_ObjectEvents::
BellObservatory2_ObjectEvents::
BellSchool2_ObjectEvents::
BallotsHouse2_ObjectEvents::
BellSchoolOutside2_ObjectEvents::
	objects_end

BellVillage2_ObjectEvents:
	object_event $1b, 16,  9, 0, $00, $00, $09, $00, Script_00e_4185
	object_event $13,  8, 14, 0, $00, $00, $05, $01, Script_00e_4189
	object_event $20, 14, 13, 0, $00, $00, $07, $02, Script_00e_418d
	object_event $1d,  5,  9, 0, $00, $00, $06, $03, Script_00e_4191
	object_event $16, 11,  4, 0, $00, $00, $00, $04, Script_00e_4195
	object_event $19,  6,  5, 0, $00, $00, $08, $00, Script_00e_4199
	objects_end

Script_00e_4185:
	textface text_0e_4d99
	end

Script_00e_4189:
	textface text_0e_4e05
	end

Script_00e_418d:
	textface text_0e_4e82
	end

Script_00e_4191:
	textface text_0e_4eb4
	end

Script_00e_4195:
	textface text_0e_4efa
	end

Script_00e_4199:
	textface text_0e_4f2f
	end

HayatosHouse2_ObjectEvents:
	object_event $22,  5,  6, 0, $00, $00, $06, $00, Script_00e_41b4
	object_event $26,  8,  3, 0, $00, $00, $00, $01, Script_00e_41b8
	objects_end

Script_00e_41b4:
	textface text_0e_4fa5
	end

Script_00e_41b8:
	checkbit wEventFlags, $05, .script_00e_41c6
	textface text_0e_5023
	setbit wEventFlags, $05
	end

.script_00e_41c6
	textface text_0e_50f6
	end

CarpetWomansHouse2_ObjectEvents:
	object_event $1f,  4,  6, 0, $00, $00, $06, $00, Script_00e_41e1
	object_event $15,  7,  4, 0, $00, $00, $06, $01, Script_00e_41eb
	objects_end

Script_00e_41e1:
	textface text_0e_5154
	stext text_0e_519f
	stext text_0e_51b1
	end

Script_00e_41eb:
	textface text_0e_528c
	end

FangfangsHouse2_ObjectEvents:
	object_event $15,  5,  6, 0, $00, $00, $06, $00, Script_00e_4211
	object_event $18,  8,  3, 0, $00, $00, $0a, $01, Script_00e_4215
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, Script_00e_4219
	objects_end

Script_00e_4211:
	textface text_0e_51dd
	end

Script_00e_4215:
	textface text_0e_520e
	end

Script_00e_4219:
	textface text_0e_5267
	end

BellHealingCenter2_ObjectEvents:
	object_event $25,  5,  2, 0, $00, $00, $00, $00, Script_00e_4229
	objects_end

Script_00e_4229:
	stext text_0e_52d0
	end

ObjectEvents_00e_422d:
	object_event $12, 14,  6, 0, $00, $00, $09, $00, Script_00e_424f
	object_event $1d, 10,  8, 0, $00, $00, $00, $01, Script_00e_4253
	object_event $1e,  6,  6, 0, $00, $00, $06, $02, Script_00e_4257
	objects_end

Script_00e_424f:
	textface text_0e_5347
	end

Script_00e_4253:
	textface text_0e_53c0
	end

Script_00e_4257:
	textface text_0e_5437
	startbattle BattleData_02d_4ab4
	checkbit wEventFlags + 3, $03, .script_00e_4267
	stext text_0e_547a
	end

.script_00e_4267
	stext text_0e_54a2
	end

ObjectEvents_00e_426b:
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	object_event $27, 17, 11, 0, $00, $00, $00, $03, Script_00e_42da
	object_event $28, 18, 11, 0, $00, $00, $00, $04, Script_00e_42da
	objects_end

Script_00e_42da:
	setplayerchar $00
	setmap $2d, $0b
	face FACE_UP
	spriteface $04, $01
	spriteface $05, $01
	spriteface $06, $01
	stext text_0e_6ab3
	stext text_0e_6acf
	emote $00, $04
	delay $03, $20
	stext text_0e_7e60
	stext text_0e_6b0b

Script_00e_42fc:
	warpmode GAMEMODE_RACING_MINIGAME, $2d, $0b
	face FACE_UP
	spriteface $04, $01
	spriteface $05, $01
	spriteface $06, $01
	checkbit wEventFlags + 4, $01, Script_00e_431c
	stext text_0e_6b3f
	stext text_0e_6b6f
	farjump Script_00e_42fc
	end

Script_00e_431c:
	emote $02, $00
	emote $03, $00
	delay $03, $20
	stext text_0e_6ba5
	stext text_0e_6bbd
	stext text_0e_6c02
	stext text_0e_6c29
	emote $02, $01
	emote $03, $01
	delay $03, $20
	stext text_0e_6c51
	emote $00, $00
	emote $04, $00
	emote $05, $00
	delay $03, $20
	stext text_0e_6c92
	stext text_0e_6cc8
	spriteface $02, $03
	spriteface $03, $03
	setattach $02, $03, $00, $f0
	objmove $03, Script_0e_7e69
	setbit wEventFlags + 1, $05
	setmap $2d, $0c
	end

ObjectEvents_00e_4366:
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	object_event $27, 17, 11, 0, $00, $00, $00, $03, Script_00e_4480
	object_event $28, 18, 11, 0, $00, $00, $00, $04, Script_00e_4480
	objects_end

ObjectEvents_00e_43d5:
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	objects_end

Script_00e_442e:
	textface text_0e_54ce
	end

Script_00e_4432:
	checkbit wEventFlags, $07, Script_00e_443c
	textface text_0e_5518
	end

Script_00e_443c:
	checkbit wEventFlags + 1, $05, Script_00e_4446
	textface text_0e_6188
	end

Script_00e_4446:
	textface text_0e_6dc7
	end

Script_00e_444a:
	textface text_0e_5555
	end

Script_00e_444e:
	checkbit wEventFlags + 1, $05, Script_00e_4458
	textface text_0e_5592
	end

Script_00e_4458:
	textface text_0e_6d1a
	end

Script_00e_445c:
	checkbit wEventFlags + 1, $05, Script_00e_4466
	textface text_0e_5666
	end

Script_00e_4466:
	textface text_0e_6d47
	end

Script_00e_446a:
	textface text_0e_56f4
	end

Script_00e_446e:
	textface text_0e_5740
	end

Script_00e_4472:
	checkbit wEventFlags + 1, $05, Script_00e_447c
	textface text_0e_576d
	end

Script_00e_447c:
	textface text_0e_6d70
	end

Script_00e_4480:
	setmap $2d, $0b
	face FACE_UP
	spriteface $04, $01
	spriteface $05, $01
	spriteface $06, $01
	stext text_0e_5ebb
	spriteface $04, $02
	spriteface $05, $03
	stext text_0e_5ee0
	emote $02, $00
	emote $03, $00
	delay $03, $20
	stext text_0e_5ef5
	spriteface $04, $01
	spriteface $05, $01
	emote $02, $02
	delay $03, $20
	stext text_0e_5f1f
	stext text_0e_5f4b
	stext text_0e_5f67
	stext text_0e_5f7e
	stext text_0e_5f99
	stext text_0e_5fa2
	stext text_0e_5fab
	emote $00, $00
	emote $04, $00
	emote $05, $00
	delay $03, $20
	stext text_0e_5fc0
	stext text_0e_6015
	stext text_0e_6055
	stext text_0e_6068
	stext text_0e_60a4
	stext text_0e_60d9
	stext text_0e_60f7
	spriteface $02, $03
	spriteface $03, $03
	setattach $02, $03, $00, $f0
	objmove $03, Script_0e_7e69
	setbit wEventFlags, $07
	setmap $2d, $0c
	end

ObjectEvents_00e_44ff:
	object_event $27, 17, 11, 0, $00, $00, $00, $00, Script_00e_4000
	object_event $28, 18, 11, 0, $00, $00, $00, $01, Script_00e_4000
	object_event $1a, 16, 13, 0, $00, $00, $00, $02, Script_00e_4000
	object_event $1b, 15, 13, 0, $00, $00, $00, $03, Script_00e_4000
	object_event $02, 20, 12, 0, $00, $00, $00, $04, Script_00e_4000
	objects_end

ObjectEvents_00e_4537:
	object_event $16,  8,  7, 0, $00, $00, $00, $00, Script_00e_4543
	objects_end

Script_00e_4543:
	checkbit wEventFlags + 2, $00, Script_00e_454d
	textface text_0e_5806
	end

Script_00e_454d:
	checkbit wEventFlags + 2, $01, Script_00e_456a
	textface text_0e_70c0
	emote $00, $01
	delay $03, $20
	emote $02, $00
	delay $03, $20
	stext text_0e_7136
	setbit wEventFlags + 2, $01
	end

Script_00e_456a:
	checkbit wEventFlags + 2, $02, Script_00e_4574
	textface text_0e_717b
	end

Script_00e_4574:
	textface text_0e_765d
	end

ObjectEvents_00e_4578:
	object_event $19,  7,  3, 0, $00, $00, $00, $00, Script_00e_458f
	object_event $16,  6,  6, 0, $00, $00, $06, $01, Script_00e_4593
	objects_end

Script_00e_458f:
	textface text_0e_584c
	end

Script_00e_4593:
	textface text_0e_58bd
	end

ObjectEvents_00e_4597:
	object_event $12,  6,  5, 0, $00, $00, $0b, $00, Script_00e_45ae
	object_event $1d,  6,  3, 0, $00, $00, $00, $01, Script_00e_45bc
	objects_end

Script_00e_45ae:
	checkbit wEventFlags + 1, $05, Script_00e_45b8
	textface text_0e_592f
	end

Script_00e_45b8:
	textface text_0e_6dc7
	end

Script_00e_45bc:
	textface text_0e_5992
	end

ObjectEvents_00e_45c0:
	object_event $13,  4,  3, 0, $00, $00, $00, $00, Script_00e_45e2
	object_event $1b,  6,  6, 0, $00, $00, $06, $01, Script_00e_45f0
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, Script_00e_45f4
	objects_end

Script_00e_45e2:
	checkbit wEventFlags + 1, $05, Script_00e_45ec
	textface text_0e_59f6
	end

Script_00e_45ec:
	textface text_0e_6dec
	end

Script_00e_45f0:
	textface text_0e_5a5a
	end

Script_00e_45f4:
	checkbit wEventFlags + 1, $05, Script_00e_461c
	spriteface $04, $03
	emote $04, $00
	delay $03, $20
	spriteface $04, $02
	spriteface $02, $03
	stext text_0e_5ac1
	stext text_0e_5b18
	spriteface $02, $00
	stext text_0e_5b22
	emote $00, $01
	delay $03, $20
	end

Script_00e_461c:
	textface text_0e_6e16
	spriteface $02, $03
	emote $02, $00
	delay $03, $20
	stext text_0e_6e80
	emote $00, $01
	delay $03, $20
	end

ObjectEvents_00e_4632:
	object_event $16,  4,  5, 0, $00, $00, $08, $00, Script_00e_463e
	objects_end

Script_00e_463e:
	textface text_0e_5b43
	end

ObjectEvents_00e_4642:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_00e_464e
	objects_end

Script_00e_464e:
	stext text_0e_5b91
	end

Script_00e_4652:
	face FACE_LEFT
	spriteface $02, $03
	stext text_0e_5b91
	checkbit wEventFlags + 4, $01, Script_00e_4663
	scr_35 $00
	end

Script_00e_4663:
	end

ObjectEvents_00e_4664:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_00e_467b
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_00e_467f
	objects_end

Script_00e_467b:
	stext text_0e_5bdd
	end

Script_00e_467f:
	stext text_0e_5bf5
	end

Script_00e_4683:
	face FACE_UP
	stext text_0e_5bdd
	checkbit wEventFlags + 3, $03, Script_00e_4690
	scr_37
	end

Script_00e_4690:
	end

Script_00e_4691:
	face FACE_UP
	stext text_0e_5bf5
	checkbit wEventFlags + 3, $03, Script_00e_469e
	townmusicanim
	end

Script_00e_469e:
	end

ObjectEvents_00e_469f:
	object_event $2d,  8,  6, 0, $00, $00, $00, $00, Script_00e_4849
	object_event $29,  5,  5, 0, $00, $00, $00, $01, Script_00e_46c4
	objects_end

Script_00e_46b6:
	checkbit wEventFlags + 1, $00, Script_00e_46c0
	setmap $33, $00
	end

Script_00e_46c0:
	setmap $33, $01
	end

Script_00e_46c4:
	checkbit wEventFlags + 1, $03, Script_00e_46ce
	textface text_0e_7e33
	end

Script_00e_46ce:
	checkbit wEventFlags + 1, $04, Script_00e_472e
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	emote $03, $00
	delay $03, $20
	stext text_0e_6967
	spriteface $03, $02
	spritewalk $03, $03
	spriteface $03, $01
	spritewalk $03, $02
	spritewalk $03, $02
	stext text_0e_69a6
	spriteface $03, $03
	spritewalk $03, $04
	spriteface $03, $01
	stext text_0e_69ae
	spriteface $03, $00
	spritewalk $03, $01
	spritewalk $03, $01
	emote $03, $02
	delay $03, $20
	stext text_0e_69b6
	stext text_0e_69ef
	emote $03, $01
	delay $03, $20
	stext text_0e_6a00
	stext text_0e_6a52
	listdec $02, $02
	scr_48 $02, $03
	setbit wEventFlags + 1, $04
	end

Script_00e_472e:
	checkbit wEventFlags + 1, $05, Script_00e_4738
	textface text_0e_6a61
	end

Script_00e_4738:
	checkbit wEventFlags + 1, $07, Script_00e_4746
	textface text_0e_6e99
	setbit wEventFlags + 1, $06
	end

Script_00e_4746:
	checkbit wEventFlags + 2, $00, Script_00e_47e5
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	emote $03, $03
	delay $03, $20
	stext text_0e_6f6b
	spriteface $03, $02
	spritewalk $03, $03
	spritewalk $03, $03
	spriteface $03, $00
	emote $03, $00
	delay $03, $20
	spriteface $03, $03
	spritewalk $03, $04
	spritewalk $03, $04
	spriteface $03, $00
	stext text_0e_6f86
	emote $03, $04
	delay $03, $20
	stext text_0e_6fc3
	spriteface $03, $01
	spritewalk $03, $02
	spritewalk $03, $02
	emote $03, $01
	delay $03, $20
	spriteface $03, $03
	spritewalk $03, $04
	spritewalk $03, $04
	spriteface $03, $01
	emote $03, $01
	delay $03, $20
	spriteface $03, $02
	spritewalk $03, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spriteface $03, $01
	emote $03, $01
	delay $03, $20
	spriteface $03, $00
	spritewalk $03, $01
	spritewalk $03, $01
	spriteface $03, $03
	spritewalk $03, $04
	spritewalk $03, $04
	spritewalk $03, $04
	spriteface $03, $00
	stext text_0e_7026
	stext text_0e_7090
	setbit wEventFlags + 2, $00
	end

Script_00e_47e5:
	checkbit wEventFlags + 2, $02, Script_00e_47ef
	textface text_0e_709b
	end

Script_00e_47ef:
	checkbit wEventFlags + 2, $03, Script_00e_4812
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	stext text_0e_71c3
	fadeout
	fadein
	stext text_0e_7217
	stext text_0e_726f
	listdec $02, $04
	scr_48 $02, $05
	setbit wEventFlags + 2, $03
	end

Script_00e_4812:
	textface text_0e_7283
	emote $00, $01
	delay $03, $20
	end

ObjectEvents_00e_481c:
	object_event $2d,  8,  6, 0, $00, $00, $00, $00, Script_00e_4849
	object_event $29,  5,  5, 0, $00, $00, $00, $01, Script_00e_484d
	object_event $02,  4,  3, wEventFlags + 1, $00, $00, $00, $02, Script_00e_48f4
	object_event $03,  3,  3, wEventFlags + 1, $00, $00, $00, $03, Script_00e_48ff
	objects_end

Script_00e_4849:
	textface text_0e_5c24
	end

Script_00e_484d:
	checkbit wEventFlags, $06, Script_00e_488f
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	stext text_0e_5c9e
	stext text_0e_5ce0
	fadeout
	fadein
	stext text_0e_5d33
	delay $03, $07
	emote $03, $00
	delay $03, $20
	stext text_0e_5dae
	stext text_0e_5e40
	stext text_0e_5e5d
	face FACE_DOWN
	emote $00, $00
	emote $03, $00
	delay $03, $20
	face FACE_UP
	stext text_0e_5e73
	listdec $02, $01
	setbit wEventFlags, $06
	end

Script_00e_488f:
	checkbit wEventFlags, $07, Script_00e_4899
	textface text_0e_5e73
	end

Script_00e_4899:
	checkbit wEventFlags + 1, $00, Script_00e_48f0
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_0e_6205
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_DOWN
	setattach $05, $04, $00, $f0
	objmove $04, Script_0e_7eca
	clearattach $04
	spriteface  4, FACE_UP
	spriteface  5, FACE_RIGHT
	stext text_0e_6292
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_0e_62aa
	stext text_0e_62c5
	stext text_0e_62ef
	spriteface  4, FACE_RIGHT
	stext text_0e_6314
	clearplayerpos
	spritewalk  4, MOVE_RIGHT
	clearobject $04
	spritewalk  5, MOVE_RIGHT
	spritewalk  5, MOVE_RIGHT
	clearobject $05
	loadscriptedmon $01
	scr_62 $01, $01
	setbit wEventFlags + 1, $00
	end

Script_00e_48f0:
	textface text_0e_7e33
	end

Script_00e_48f4:
	checkbit wEventFlags, $07, Script_00e_48fb
	end

Script_00e_48fb:
	textface text_0e_61da
	end

Script_00e_48ff:
	textface text_0e_61f6
	end

CrystalVillage_ObjectEvents:
	object_event $1e, 13, 16, 0, $00, $00, $0b, $01, Script_00e_495c
	object_event $12, 19,  8, 0, $00, $00, $06, $00, Script_00e_4960
	object_event $14, 16, 11, 0, $00, $00, $05, $02, Script_00e_496e
	object_event $1d,  8, 10, 0, $00, $00, $08, $03, Script_00e_497c
	object_event $19, 10, 15, 0, $00, $00, $07, $04, Script_00e_4980
	object_event $1c,  6,  5, 0, $00, $00, $06, $00, Script_00e_498e
	object_event $20,  1, 13, wEventFlags + 1, $00, $01, $00, $01, Script_00e_4992
	object_event $20, 12,  1, wEventFlags + 1, $02, $00, $00, $02, Script_00e_49a7
	objects_end

Script_00e_495c:
	textface text_0e_6324
	end

Script_00e_4960:
	checkbit wEventFlags + 1, $03, Script_00e_496a
	textface text_0e_6336
	end

Script_00e_496a:
	textface text_0e_6832
	end

Script_00e_496e:
	checkbit wEventFlags + 1, $03, Script_00e_4978
	textface text_0e_638b
	end

Script_00e_4978:
	textface text_0e_6882
	end

Script_00e_497c:
	textface text_0e_63de
	end

Script_00e_4980:
	checkbit wEventFlags + 1, $03, Script_00e_498a
	textface text_0e_6434
	end

Script_00e_498a:
	textface text_0e_68b3
	end

Script_00e_498e:
	textface text_0e_6466
	end

Script_00e_4992:
	checkbit wEventFlags + 1, $01, Script_00e_49a3
	textface text_0e_64ad
	stext text_0e_64f7
	setbit wEventFlags + 1, $01
	end

Script_00e_49a3:
	textface text_0e_64f7
	end

Script_00e_49a7:
	textface text_0e_6607
	end

Script_00e_49ab:
	checkbit wEventFlags + 1, $02, Script_00e_49c1
	textface text_0e_6607
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spritewalk $01, $02
	spriteface $01, $00
	end

Script_00e_49c1:
	setmap $23, $00
	end

ObjectEvents_00e_49c5:
	object_event $15,  9,  3, 0, $00, $00, $06, $00, Script_00e_49d1
	objects_end

Script_00e_49d1:
	checkbit wEventFlags + 1, $03, Script_00e_49db
	textface text_0e_6515
	end

Script_00e_49db:
	textface text_0e_68f4
	end

ObjectEvents_00e_49df:
	object_event $1b,  5,  4, 0, $00, $00, $00, $00, Script_00e_49eb
	objects_end

Script_00e_49eb:
	textface text_0e_6550
	end

ObjectEvents_00e_49ef:
	object_event $1e,  5,  5, 0, $00, $00, $09, $00, Script_00e_49fb
	objects_end

Script_00e_49fb:
	checkbit wEventFlags + 1, $03, Script_00e_4a16
	textface text_0e_65b8
	ifcharindex $01, Script_00e_4a09
	end

Script_00e_4a09:
	emote $00, $00
	delay $03, $20
	stext text_0e_65de
	stext text_0e_65fc
	end

Script_00e_4a16:
	textface text_0e_6923
	end

ObjectEvents_00e_4a1a:
	object_event $2a, 10,  4, wEventFlags + 1, $02, $00, $00, $00, Script_00e_4a26
	objects_end

Script_00e_4a26:
	textface text_0e_66fa
	startbattle BattleData_02d_4ac4
	checkbit wEventFlags + 3, $03, Script_00e_4a45
	stext text_0e_672d
	spriteface $02, $03
	objmove $02, Script_0e_7e69
	clearobject $02
	setbit wEventFlags + 1, $02
	setmappredef MAPPREDEF_06
	end

Script_00e_4a45:
	end

Script_00e_4a46:
	spriteface $02, $00
	stext text_0e_66fa
	startbattle BattleData_02d_4ac4
	checkbit wEventFlags + 3, $03, Script_00e_4a68
	stext text_0e_672d
	spriteface $02, $03
	objmove $02, Script_0e_7e69
	clearobject $02
	setbit wEventFlags + 1, $02
	setmappredef MAPPREDEF_06
	end

Script_00e_4a68:
	face FACE_RIGHT
	move MovementData_OneRight
	clearplayerpos
	spritewalk $01, $03
	spriteface $01, $03
	end

ObjectEvents_00e_4a75:
	object_event $2a,  2,  2, wEventFlags + $18, $05, $00, $00, $00, Script_00e_4a81
	objects_end

Script_00e_4a81:
	emote $02, $00
	delay $03, $20
	stext text_0e_6784
	startbattle BattleData_02d_4af3
	checkbit wEventFlags + 3, $03, Script_00e_4a45
	stext text_0e_67ae
	spriteface $02, $03
	objmove $02, Script_0e_7e69
	clearobject $02
	move MovementData_OneUp
	clearplayerpos
	spriteface $01, $01
	spritewalk $01, $02
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	spritewalk $01, $02
	spriteface $01, $03
	stext text_0e_67e0
	setbit wEventFlags + 24, $05
	end

INCLUDE "data/text/script_bell_village2.asm"
INCLUDE "data/text/script_hayatos_house2.asm"
INCLUDE "data/text/script_carpet_womans_house2_1.asm"
INCLUDE "data/text/script_fangfangs_house2.asm"
INCLUDE "data/text/script_carpet_womans_house2_2.asm"
INCLUDE "data/text/script_bell_healing_center2.asm"
INCLUDE "data/text/script_tech_city2_blackout_54aa.asm"
INCLUDE "data/text/script_tech_city2_blackout_5b91.asm"
INCLUDE "data/text/script_tech_city2_drleo_5c24.asm"
INCLUDE "data/text/script_crystal_village.asm"
INCLUDE "data/text/script_tech_city2_drleo_6967.asm"

; Sprite movement paths for objmove: signed (x, y) deltas per frame, $88 terminator
; TODO: rename Script_0e_7e69/Script_0e_7eca to descriptive path labels
; TODO: same format covers bank_12 unk_012_* dr blocks (objmove targets)
Script_0e_7e69:
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $88

Script_0e_7eca:
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $88, $00, $00, $00, $00, $00
