; TODO: structured data table (not graphics), classify records
unk_059_4000:
	setmap $2a, $00
	end
Script_059_4004:
	end
G4_41_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_059_4011
	objects_end

Script_059_4011:
	textface text_59_40a9
	end

Script_059_4015:
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_59_40a9
	checkbit wEventFlags + 4, $01, Script_059_4026
	scr_35 $08 ; TEMP
	end

Script_059_4026:
	end

G4_40_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_059_403e
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_059_4042
	objects_end

Script_059_403e:
	stext text_59_4062
	end

Script_059_4042:
	stext text_59_407a
	end

Script_059_4046:
	face FACE_UP
	stext text_59_4062
	checkbit wEventFlags + 3, $03, Script_059_4053
	scr_37
	end

Script_059_4053:
	end

Script_059_4054:
	face FACE_UP
	stext text_59_407a
	checkbit wEventFlags + 3, $03, Script_059_4061
	townmusicanim
	end

Script_059_4061:
	end

INCLUDE "data/text/bank59_4062.asm"

Script_059_40c0:
	farjump2 Script_058_40db
	end

Script_059_40c5:
	setmap $25, $00 ; TEMP
	end
Script_059_40c9::
	end

G4_1A_ObjectEvents:
G4_1B_ObjectEvents:
G4_1C_ObjectEvents:
G4_1D_ObjectEvents2:
G4_2A_ObjectEvents:
G4_2B_ObjectEvents:
G4_53_ObjectEvents:
G4_54_ObjectEvents:
	objects_end

G4_25_ObjectEvents:
	object_event $13,  4,  6, 0, $00, $00, $0b, $00, Script_059_42e0
	object_event $15, 16,  6, 0, $00, $00, $06, $01, Script_059_42ee
	object_event $14, 19, 11, 0, $00, $00, $07, $02, Script_059_42fc
	object_event $17, 11, 10, 0, $00, $00, $00, $03, Script_059_430a
	object_event $16,  7, 14, 0, $00, $00, $0a, $04, Script_059_4318
	object_event $19,  9, 20, 0, $00, $00, $06, $00, Script_059_4326
	object_event $1c, 17, 17, 0, $00, $00, $00, $01, Script_059_4334
	objects_end

G4_3A_ObjectEvents:
	object_event $18,  5,  4, 0, $00, $00, $07, $00, Script_059_436c
	objects_end

G4_3B_ObjectEvents:
	object_event $1f,  7,  6, 0, $00, $00, $06, $00, Script_059_437a
	object_event $24,  4,  4, 0, $00, $00, $00, $01, Script_059_43a6
	objects_end

G4_3C_ObjectEvents:
	object_event $1a,  9,  6, 0, $00, $00, $00, $00, Script_059_43b4
	object_event $21,  4,  4, 0, $00, $00, $0b, $01, Script_059_43e3
	objects_end

G4_3D_ObjectEvents:
	object_event $16,  6,  4, 0, $00, $00, $0b, $00, Script_059_43ff
	object_event $19,  3,  5, 0, $00, $00, $00, $01, Script_059_43f1
	objects_end

G4_3F_ObjectEvents:
	object_event $0c,  5,  3, wEventFlags + 14, $01, $00, $00, $00, Script_059_4181
	object_event $0d,  4,  3, wEventFlags + 14, $01, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_4181:
	checkbit wEventFlags + 12, $01, Script_059_418b
	textface text_59_4f6a
	end

Script_059_418b:
	ifcharindex $00, Script_059_41a3
	spriteface  2, FACE_UP
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_59_4fa1
	end

Script_059_41a3:
	checkbit wEventFlags + 12, $03, Script_059_41e2
	spriteface  2, FACE_UP
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_59_4fc7
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	spriteface  2, FACE_DOWN
	stext text_59_5009
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_59_50a5
	stext text_59_50b7
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	stext text_59_50c7
	stext text_59_5155
	setbit wEventFlags + 12, $03
	end

Script_059_41e2:
	textface text_59_520e
	end

Script_059_41e6:
	checkbit wEventFlags + 12, $07, Script_059_41f4
	setmap $3f, $00 ; TEMP
	end

Script_059_41f0:
	setmap $3f, $00 ; TEMP
	end

Script_059_41f4:
	checkbit wEventFlags + 14, $01, Script_059_41f0
	face FACE_RIGHT
	setmap $3f, $01 ; TEMP
	face FACE_UP
	stext text_59_5675
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_59_56a1
	emote  2, EMOTE_HEART
	delay $03, $20 ; TEMP
	stext text_59_56f4
	stext text_59_5719
	stext text_59_5732
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_LEFT
	face FACE_RIGHT
	stext text_59_57a0
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_59_57bb
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	clearobject $02 ; TEMP
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03 ; TEMP
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	move MovementData_OneRight
	clearobject $00 ; TEMP
	spritewalk  1, MOVE_RIGHT
	clearobject $01 ; TEMP
	stext text_59_5822
	spriteface  4, FACE_UP
	delay $03, $10 ; TEMP
	objmove $04, MovementData_059_7bd6
	clearobject $04 ; TEMP
	setmap $53, $00 ; TEMP
	playsound SFX_2c
	runmovement MovementData_00b_4227
	stext text_59_584c
	stext text_59_5868
	stext text_59_5899
	playsound SFX_2c
	runmovement MovementData_00b_41fe
	stext text_59_58b6
	playsound SFX_2c
	runmovement MovementData_00b_41fe
	stext text_59_58cf
	playsound SFX_2c
	runmovement MovementData_00b_41fe
	stext text_59_58d7
	playsound SFX_2c
	runmovement MovementData_00b_41fe
	stext text_59_58f3
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_59_590a
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_59_5928
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_59_59a3
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	runmovement MovementData_00b_41d5
	farjump2 Script_05a_41aa
	end

G4_3F_ObjectEvents2:
	object_event $0c,  5,  3, 0, $00, $00, $00, $00, Script_059_40c9
	object_event $0d,  7,  3, 0, $00, $00, $00, $01, Script_059_40c9
	object_event $6a,  6,  4, 0, $00, $00, $00, $02, Script_059_40c9
	objects_end

Script_059_42e0:
	checkbit wEventFlags + 14, $02, Script_059_42ea
	textface text_59_48ea
	end

Script_059_42ea:
	textface text_59_711f
	end

Script_059_42ee:
	checkbit wEventFlags + 14, $02, Script_059_42f8
	textface text_59_493b
	end

Script_059_42f8:
	textface text_59_7131
	end

Script_059_42fc:
	checkbit wEventFlags + 14, $02, Script_059_4306
	textface text_59_4986
	end

Script_059_4306:
	textface text_59_717c
	end

Script_059_430a:
	checkbit wEventFlags + 14, $02, Script_059_4314
	textface text_59_49ff
	end

Script_059_4314:
	textface text_59_71b4
	end

Script_059_4318:
	checkbit wEventFlags + 14, $02, Script_059_4322
	textface text_59_4a92
	end

Script_059_4322:
	textface text_59_724a
	end

Script_059_4326:
	checkbit wEventFlags + 14, $02, Script_059_4330
	textface text_59_4ad5
	end

Script_059_4330:
	textface text_59_728d
	end

Script_059_4334:
	checkbit wEventFlags + 12, $05, Script_059_433e
	textface text_59_4b37
	end

Script_059_433e:
	checkbit wEventFlags + 12, $06, Script_059_435e
	textface text_59_544f
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_59_54d3
	stext text_59_5511
	stext text_59_5571
	scr_48 $02, $14
	setbit wEventFlags + 12, $06
	end

Script_059_435e:
	checkbit wEventFlags + 14, $02, Script_059_4368
	textface text_59_5580
	end

Script_059_4368:
	textface text_59_733c
	end

Script_059_436c:
	checkbit wEventFlags + 14, $02, Script_059_4376
	textface text_59_4b9e
	end

Script_059_4376:
	textface text_59_736c
	end

Script_059_437a:
	checkbit wEventFlags + 14, $02, Script_059_43a2
	textface text_59_4c14
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	spriteface  2, FACE_UP
	stext text_59_4c6c
	stext text_59_4c82
	emote  2, EMOTE_ANGER
	delay $03, $20 ; TEMP
	stext text_59_4cb7
	stext text_59_4cc5
	stext text_59_4d63
	end

Script_059_43a2:
	textface text_59_73e9
	end

Script_059_43a6:
	checkbit wEventFlags + 14, $02, Script_059_43b0
	textface text_59_4c82
	end

Script_059_43b0:
	textface text_59_739e
	end

Script_059_43b4:
	checkbit wEventFlags + 12, $04, Script_059_43be
	textface text_59_4d80
	end

Script_059_43be:
	checkbit wEventFlags + 12, $05, Script_059_43d5
	textface text_59_5339
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_59_538c
	setbit wEventFlags + 12, $05
	end

Script_059_43d5:
	checkbit wEventFlags + 14, $02, Script_059_43df
	textface text_59_53fb
	end

Script_059_43df:
	textface text_59_740f
	end

Script_059_43e3:
	checkbit wEventFlags + 14, $02, Script_059_43ed
	textface text_59_4dab
	end

Script_059_43ed:
	textface text_59_744e
	end

Script_059_43f1:
	checkbit wEventFlags + 14, $02, Script_059_43fb
	textface text_59_4f14
	end

Script_059_43fb:
	textface text_59_75c1
	end

Script_059_43ff:
	checkbit wEventFlags + 13, $05, Script_059_4416
	textface text_59_4df2
	checkbit wEventFlags + 3, $03, Script_059_4412
	stext text_59_4e2d
	end

Script_059_4412:
	stext text_59_4e17
	end

Script_059_4416:
	checkbit wEventFlags + 14, $04, Script_059_442a
	textface text_59_74a9
	stext text_59_7593
	scr_48 $01, $26
	setbit wEventFlags + 14, $04
	end

Script_059_442a:
	textface text_59_75a5
	end

G4_3E_ObjectEvents:
	object_event $23,  7,  4, 0, $00, $00, $05, $00, Script_059_443a
	objects_end

Script_059_443a:
	textface text_59_761a
	end

G4_29_ObjectEvents:
G4_55_ObjectEvents:
	object_event $16, 13,  4, 0, $00, $00, $00, $00, Script_059_444a
	objects_end

Script_059_444a:
	checkbit wEventFlags + 12, $03, Script_059_4454
	textface text_59_5279
	end

Script_059_4454:
	checkbit wEventFlags + 14, $02, Script_059_4462
	textface text_59_52c3
	setbit wEventFlags + 12, $04
	end

Script_059_4462:
	textface text_59_6f51
	end

Script_059_4466:
	ifcharindex $01, Script_059_446b
	end

Script_059_446b:
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	setattach $01, $00, $f0, $00 ; TEMP
	playsound SFX_41
	objmove $00, MovementData_059_7ac9
	clearattach $01 ; TEMP
	spriteface  1, FACE_RIGHT
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_LEFT
	end

Script_059_448d:
	ifcharindex $01, Script_059_4492
	end

Script_059_4492:
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	setattach $01, $00, $f0, $00 ; TEMP
	playsound SFX_41
	objmove $00, MovementData_059_7b0a
	clearattach $01 ; TEMP
	spriteface  1, FACE_LEFT
	spritewalk  1, MOVE_LEFT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_RIGHT
	end

ObjSprite_59_44b4:
	object_event $6e,  5,  3, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end
ObjSprite_59_44c0:
	object_event $6e,  5,  2, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end
ObjSprite_59_44cc:
	object_event $6e,  5,  1, 0, $00, $00, $00, $02, Script_059_40c9
	objects_end
ObjSprite_59_44d8:
	object_event $6e,  5,  0, 0, $00, $00, $00, $03, Script_059_40c9
	objects_end

Script_059_44e4:
	checkbit wEventFlags + 12, $06, Script_059_44eb
	end

Script_059_44eb:
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	loadobjsprite ObjSprite_59_44b4
	loadobjsprite ObjSprite_59_44c0
	loadobjsprite ObjSprite_59_44cc
	loadobjsprite ObjSprite_59_44d8
	move MovementData_OneUp
	setmap $1a, $00 ; TEMP
	end

G4_1D_ObjectEvents:
	object_event $4e,  3, 15, wEventFlags + 12, $07, $00, $00, $00, Script_059_4534
	objects_end

ObjSprite_59_4510:
	object_event $66,  2, 13, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

ObjSprite_59_451c:
	object_event $66,  3, 14, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

ObjSprite_59_4528:
	object_event $66,  2, 14, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

Script_059_4534:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_59_55b1
	startbattle BattleData_02d_4c39
	checkbit wEventFlags + 3, $03, Script_059_4004
	clearobject $02 ; TEMP
	loadobjsprite ObjSprite_59_4510
	playsound SFX_2c
	spriteface  2, FACE_UP
	delay $03, $08 ; TEMP
	spriteface  2, FACE_UP
	clearobject $02 ; TEMP
	delay $03, $08 ; TEMP
	loadobjsprite ObjSprite_59_451c
	playsound SFX_2c
	spriteface  2, FACE_UP
	delay $03, $08 ; TEMP
	spriteface  2, FACE_UP
	clearobject $02 ; TEMP
	delay $03, $08 ; TEMP
	loadobjsprite ObjSprite_59_4528
	playsound SFX_2c
	spriteface  2, FACE_UP
	delay $03, $08 ; TEMP
	spriteface  2, FACE_UP
	clearobject $02 ; TEMP
	delay $03, $08 ; TEMP
	setbit wEventFlags + 12, $07
	setmap $24, $03 ; TEMP
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	stext text_59_5625
	emote  2, EMOTE_ANGER
	delay $03, $20 ; TEMP
	stext text_59_5668
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $04, $03, $00, $10 ; TEMP
	objmove $03, MovementData_059_7bad
	clearobject $03 ; TEMP
	clearobject $04 ; TEMP
	setmap $1d, $01 ; TEMP
	end

G4_24_ObjectEvents4:
	object_event $4d,  6,  3, 0, $00, $00, $00, $00, Script_059_40c9
	object_event $62,  6,  4, 0, $00, $00, $00, $01, Script_059_40c9
	object_event $62,  7,  4, 0, $00, $00, $00, $02, Script_059_40c9
	objects_end

G4_24_ObjectEvents:
	object_event $4d,  6,  4, wEventFlags + 14, $05, $00, $00, $00, Script_059_45eb
	object_event $6c, 10, 13, 0, $00, $00, $00, $01, Script_059_469d
	objects_end

Script_059_45eb:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_59_772c
	startbattle BattleData_02d_4c67
	checkbit wEventFlags + 3, $03, Script_059_4004
	clearobject $02 ; TEMP
	setbit wEventFlags + 14, $05
	setplayerchar $00 ; TEMP
	face FACE_DOWN
	setmap $24, $04 ; TEMP
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_UP
	stext text_59_7818
	stext text_59_785d
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_59_78da
	spriteface  2, FACE_LEFT
	stext text_59_792c
	spriteface  2, FACE_RIGHT
	stext text_59_7a01
	clearplayerpos
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	clearobject $02 ; TEMP
	spritewalk  3, MOVE_UP
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	clearobject $03 ; TEMP
	face FACE_DOWN
	setattach $01, $00, $f0, $00 ; TEMP
	objmove $00, MovementData_059_7bad
	clearobject $00 ; TEMP
	clearobject $01 ; TEMP
	delay $03, $20 ; TEMP
	loadobjsprite ObjSprite_59_467a
	spriteface  2, FACE_UP
	objmove $02, MovementData_059_7b4b
	spriteface  2, FACE_UP
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_DOWN
	stext text_59_7a49
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_UP
	objmove $02, MovementData_059_7b7c
	clearobject $02 ; TEMP
	setmap $2b, $01 ; TEMP
	end

ObjSprite_59_467a:
	object_event $50,  6,  0, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

G4_24_ObjectEvents5:
	object_event $06,  6,  6, 0, $00, $00, $00, $00, Script_059_40c9
	object_event $0a,  7,  7, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_469d:
	ifcharindex $06, Script_059_46a5
	stext text_59_76d1
	end

Script_059_46a5:
	facemove3 Script_059_46af, Script_059_46cb, Script_059_46e7, Script_059_4703
	end

Script_059_46af:
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $f0, $00 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7cd3
	clearattach $00 ; TEMP
	face FACE_UP
	spriteface  1, FACE_UP
	swapfollower
	end

Script_059_46cb:
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $10, $00 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7c58
	clearattach $00 ; TEMP
	swapfollower
	face FACE_DOWN
	spriteface  1, FACE_DOWN
	end

Script_059_46e7:
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $00, $10 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7c81
	clearattach $00 ; TEMP
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	swapfollower
	end

Script_059_4703:
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $00, $f0 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7caa
	clearattach $00 ; TEMP
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	swapfollower
	end

G4_21_ObjectEvents:
	object_event $6c, 18, 21, 0, $00, $00, $00, $00, Script_059_469d
	object_event $6c,  9,  7, 0, $00, $00, $00, $01, Script_059_469d
	objects_end

G4_22_ObjectEvents:
	object_event $6c, 21,  4, 0, $00, $00, $00, $00, Script_059_469d
	object_event $6c,  4, 16, 0, $00, $00, $00, $01, Script_059_469d
	object_event $6c, 22,  4, 0, $00, $00, $00, $02, Script_059_469d
	objects_end

G4_23_ObjectEvents:
	object_event $6c, 17,  1, 0, $00, $00, $00, $00, Script_059_469d
	object_event $6c,  5, 14, 0, $00, $00, $00, $01, Script_059_469d
	object_event $6c,  5, 15, 0, $00, $00, $00, $02, Script_059_469d
	object_event $6c, 17,  2, 0, $00, $00, $00, $03, Script_059_469d
	objects_end
Script_059_4785:
	setmappredef $18
	setplayerchar $00 ; TEMP
	face FACE_UP
	setmap $3f, $02 ; TEMP
	stext text_59_6de8
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_UP
	delay $03, $10 ; TEMP
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	stext text_59_6e14
	stext text_59_6e54
	scr_48 $02, $18
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $3f, $02
	stext text_59_6e63
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02 ; TEMP
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03 ; TEMP
	loadscriptedmon $06
	scr_62 $06, $01 ; TEMP
	stext text_59_6eed
	stext text_59_6f05
	setbit wEventFlags + 14, $01
	end

ObjSprite_59_47e1:
	object_event $48, 16,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end
ObjSprite_59_47ed:
	object_event $48,  7,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end
ObjSprite_59_47f9:
	object_event $48,  9,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end
ObjSprite_59_4805:
	object_event $48,  8,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_4811:
	checkbit wEventFlags + 14, $02, Script_059_481b
	setmap $29, $00 ; TEMP
	end

Script_059_481b:
	setmap $55, $00 ; TEMP
	end

Script_059_481f:
	checkbit wEventFlags + 13, $02, Script_059_4826
	end

Script_059_4826:
	face FACE_LEFT
	farjump unk_059_4839
	checkbit wEventFlags + 13, $02, Script_059_4833
	end

Script_059_4833:
	face FACE_UP
	farjump unk_059_4839
unk_059_4839:
	checkbit wEventFlags + 14, $02, Script_059_4867
	loadobjsprite ObjSprite_59_47e1
	loadobjsprite ObjSprite_59_47ed
	objmove $03, MovementData_059_7c17
	clearobject $03 ; TEMP
	loadobjsprite ObjSprite_59_47f9
	objmove $03, MovementData_059_7c17
	clearobject $03 ; TEMP
	loadobjsprite ObjSprite_59_4805
	objmove $03, MovementData_059_7c17
	clearobject $03 ; TEMP
	setmap $55, $02 ; TEMP
	setbit wEventFlags + 14, $02
	setmappredef $19
	end

Script_059_4867:
	stext text_59_6415
	scr_48 $02, $15
	end

Script_059_486e:
	end

Script_059_486f:
	checkbit wEventFlags + 23, $05, Script_059_486e
	face FACE_LEFT
	farjump unk_059_4887
	checkbit wEventFlags + 23, $05, Script_059_486e
	face FACE_UP
	farjump unk_059_4887
unk_059_4887:
	stext text_59_6415
	scr_48 $02, $15
	setbit wEventFlags + 23, $05
	end

ObjSprite_59_4892:
	object_event $62, 16,  5, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end
ObjSprite_59_489e:
	object_event $62, 16,  6, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_48aa:
	loadobjsprite ObjSprite_59_4892
	farjump unk_059_48b4
	loadobjsprite ObjSprite_59_489e
unk_059_48b4:
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	stext text_59_6f79
	startbattle BattleData_02d_4ca4
	checkbit wEventFlags + 3, $03, Script_059_48e4
	clearobject $03 ; TEMP
	stext text_59_6f9e
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_59_700f
	emote  0, EMOTE_TEAR
	delay $03, $20 ; TEMP
	stext text_59_70c9
	setbit wEventFlags + 14, $03
	setmappredef $1a
	end

Script_059_48e4:
	face FACE_LEFT
	setmap $55, $02 ; TEMP
	end
INCLUDE "data/text/bank59_48ea.asm"
; movement data pool ($88-terminated)
MovementData_059_7ac9:
	db $ff, $00, $fe, $00, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff
	db $fe, $ff, $fe, $fe, $ff, $fe, $ff, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff
	db $00, $ff, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $02, $ff, $01, $ff, $01, $fe
	db $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $00, $02, $ff
	db $88
MovementData_059_7b0a:
	db $ff, $00, $fe, $00, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $02, $ff, $02, $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01
	db $00, $01, $01, $01, $00, $01, $00, $01, $01, $01, $02, $01, $01, $01, $01, $02
	db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $00, $02, $01
	db $88
MovementData_059_7b4b:
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88
MovementData_059_7b7c:
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $88
MovementData_059_7bad:
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $88
MovementData_059_7bd6:
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $88
MovementData_059_7c17:
	db $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc
	db $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc
	db $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc
	db $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc, $02, $fc
	db $88
MovementData_059_7c58:
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fd, $00, $fd, $00, $fd, $00, $fe, $00
	db $fe, $00, $fe, $00, $ff, $00, $00, $00, $88
MovementData_059_7c81:
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fd, $00, $fd, $00, $fd, $00, $fe
	db $00, $fe, $00, $fe, $00, $ff, $00, $00, $88
MovementData_059_7caa:
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $03, $00, $03, $00, $03, $00, $02
	db $00, $02, $00, $02, $00, $01, $00, $00, $88
MovementData_059_7cd3:
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $03, $00, $03, $00, $03, $00, $02, $00
	db $02, $00, $02, $00, $01, $00, $00, $00, $88
	db $00, $00, $00, $00 ; padding ($7cfc-$7d00)

