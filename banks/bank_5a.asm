; TODO: structured data table (not graphics), classify records
unk_05a_4000:
	end

G4_5D_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_05a_400d
	objects_end

Script_05a_400d::
	textface text_5a_40a5
	end

Script_05a_4011::
	face FACE_LEFT
	spriteface 2, FACE_RIGHT
	stext text_5a_40a5
	checkbit wEventFlags + 4, $01, Script_05a_4022
	scr_35 $08
	end

Script_05a_4022::
	end

G4_5C_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_05a_403a
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_05a_403e
	objects_end

Script_05a_403a:
	stext text_5a_405e
	end

Script_05a_403e:
	stext text_5a_4076
	end

Script_05a_4042:
	face FACE_UP
	stext text_5a_405e
	checkbit wEventFlags + 3, $03, Script_05a_404f
	scr_37
	end

Script_05a_404f:
	end

Script_05a_4050:
	face FACE_UP
	stext text_5a_4076
	checkbit wEventFlags + 3, $03, Script_05a_405d
	townmusicanim
	end

Script_05a_405d:
	end

INCLUDE "data/text/bank5a_405e.asm"
	db $09

G4_53_ObjectEvents2:
G4_5A_ObjectEvents:
G4_5E_ObjectEvents:
G4_5F_ObjectEvents:
G4_60_ObjectEvents:
G4_61_ObjectEvents:
G4_62_ObjectEvents:
	objects_end

Script_05a_40be:
	checkbit wEventFlags + 13, $02, Script_05a_40c8
	setmap $26, $02
	end

Script_05a_40c8:
	setmap $27, $02
	end

Script_05a_40cc:
	setmap $26, $02
	end

Script_05a_40d0:
	checkbit wEventFlags + 13, $00, Script_05a_40ec
	emote $00, EMOTE_QUESTION
	delay $03, $20
	stext $5623
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_UP
	end

Script_05a_40ec:
	checkbit wEventFlags + 13, $02, Script_05a_40f6
	setmap $26, $06
	end

Script_05a_40f6:
	setmap $27, $06
	end

Script_05a_40fa:
	checkbit wEventFlags + 13, $02, Script_05a_4104
	setmap $26, $05
	end

Script_05a_4104:
	setmap $27, $05
	end

Script_05a_4108:
	checkbit wEventFlags + 13, $02, Script_05a_4112
	setmap $26, $04
	end

Script_05a_4112:
	setmap $27, $04
	end

Script_05a_4116:
	checkbit wEventFlags + 13, $02, Script_05a_4120
	setmap $26, $0a
	end

Script_05a_4120:
	setmap $27, $0a
	end

Script_05a_4124:
	checkbit wEventFlags + 13, $02, Script_05a_412e
	setmap $26, $08
	end

Script_05a_412e:
	setmap $27, $08
	end

Script_05a_4132:
	checkbit wEventFlags + 13, $02, Script_05a_413c
	setmap $26, $09
	end

Script_05a_413c:
	setmap $27, $09
	end

Script_05a_4140:
	checkbit wEventFlags + 13, $02, Script_05a_414a
	setmap $26, $03
	end

Script_05a_414a:
	setmap $27, $03
	end

Script_05a_414e:
	checkbit wEventFlags + 13, $02, Script_05a_4158
	setmap $26, $07
	end

Script_05a_4158:
	setmap $27, $07
	end

Script_05a_415c:
	ifcharindex $01, Script_05a_4161
	end

Script_05a_4161:
	face FACE_LEFT
	spriteface $01, FACE_LEFT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, $76e8
	clearattach $01
	spriteface $01, FACE_RIGHT
	spritewalk $01, MOVE_RIGHT
	spriteface $01, FACE_DOWN
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_LEFT
	end

Script_05a_4183:
	ifcharindex $01, Script_05a_4188
	end

Script_05a_4188:
	face FACE_RIGHT
	spriteface $01, FACE_RIGHT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, $7729
	clearattach $01
	spriteface $01, FACE_LEFT
	spritewalk $01, MOVE_LEFT
	spriteface $01, FACE_DOWN
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_RIGHT
	end

Script_05a_41aa:
	setmappredef $17
	setplayerchar $00
	face FACE_DOWN
	setmap $5b, $01
	emote $00, EMOTE_QUESTION
	delay $03, $20
	stext $5608
	end

G4_5B_ObjectEvents:
	object_event $52, 6, 3, wEventFlags + 14, $00, $00, $00, $00, Script_05a_41c9
	objects_end

Script_05a_41c9:
	checkbit wEventFlags + 13, $00, Script_05a_41e0
	textface $563f
	stext $56c3
	stext $56e8
	stext $570a
	setbit wEventFlags + 13, $00
	end

Script_05a_41e0:
	checkbit wEventFlags + 13, $02, Script_05a_41ea
	textface $5806
	end

Script_05a_41ea:
	checkbit wEventFlags + 13, $06, Script_05a_421c
	textface $637c
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext $63ee
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext $645e
	stext $646e
	stext $6502
	stext $6520
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext $65a6
	setbit wEventFlags + 13, $06
	end

Script_05a_421c:
	checkbit wEventFlags + 13, $07, Script_05a_4226
	textface $65dd
	end

Script_05a_4226:
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext $67bc
	face FACE_LEFT
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_RIGHT
	stext $6829
	spriteface 2, FACE_DOWN
	objmove $02, $77ab
	clearobject $02
	setbit wEventFlags + 14, $00
	end

G4_26_ObjectEvents:
G4_27_ObjectEvents:
	object_event $13, 19, 4, 0, $00, $00, $06, $00, Script_05a_42a3
	object_event $15, 5, 6, 0, $00, $00, $07, $01, Script_05a_42a7
	object_event $14, 13, 8, 0, $00, $00, $08, $02, Script_05a_42ab
	object_event $17, 7, 12, 0, $00, $00, $0a, $03, Script_05a_42b9
	object_event $16, 18, 13, 0, $00, $00, $0a, $04, Script_05a_42bd
	object_event $19, 8, 20, 0, $00, $00, $05, $00, Script_05a_42cb
	object_event $25, 17, 20, 0, $00, $00, $09, $01, Script_05a_42cf
	objects_end

Script_05a_42a3:
	textface $58a8
	end

Script_05a_42a7:
	textface $58ba
	end

Script_05a_42ab:
	checkbit wEventFlags + 13, $02, Script_05a_42b5
	textface $5923
	end

Script_05a_42b5:
	textface $6087
	end

Script_05a_42b9:
	textface $595a
	end

Script_05a_42bd:
	checkbit wEventFlags + 13, $02, Script_05a_42c7
	textface $59ee
	end

Script_05a_42c7:
	textface $60d2
	end

Script_05a_42cb:
	textface $5a2f
	end

Script_05a_42cf:
	textface $5a6b
	end

G4_56_ObjectEvents:
	object_event $18,  5,  4, 0, $00, $00, $07, $00, Script_05a_42df
	objects_end

Script_05a_42df:
	checkbit wEventFlags + 13, $04, Script_05a_42e9
	textface $5ac1
	end

Script_05a_42e9:
	checkbit wEventFlags + 13, $05, Script_05a_42fa
	textface $634a
	listdec $02, $16
	setbit wEventFlags + 13, $05
	end

Script_05a_42fa:
	textface $634a
	end

G4_57_ObjectEvents:
	object_event $20,  7,  6, 0, $00, $00, $0b, $00, Script_05a_430a
	objects_end

Script_05a_430a::
	checkbit wEventFlags + 13, $03, Script_05a_4314
	textface $5b68
	end

Script_05a_4314::
	checkbit wEventFlags + 13, $04, Script_05a_433d
	textface $6273
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext $62a5
	startbattle BattleData_02d_4cc3
	checkbit wEventFlags + 3, $03, unk_05a_4000
	stext $62e8
	stext $6311
	scr_48 $02, $16
	setbit wEventFlags + 13, $04
	end

Script_05a_433d::
	textface $6321
	end

G4_58_ObjectEvents:
	object_event $1e,  8,  4, 0, $00, $00, $00, $00, Script_05a_4358
	object_event $21,  3,  3, 0, $00, $00, $0b, $01, Script_05a_435c
	objects_end
Script_05a_4358:
	textface $5bb6
	end
Script_05a_435c:
	textface $5c0c
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext $5c61
	end

G4_59_ObjectEvents:
	object_event $1b, 6, 4, 0, $00, $00, $0b, $00, Script_05a_4375
	objects_end

Script_05a_4375:
	checkbit wEventFlags + 13, $02, Script_05a_437f
	textface $5cb0
	end

Script_05a_437f:
	checkbit wEventFlags + 13, $04, Script_05a_438d
	textface $611e
	setbit wEventFlags + 13, $03
	end

Script_05a_438d:
	checkbit wEventFlags + 13, $05, Script_05a_4397
	textface $61fa
	end

Script_05a_4397:
	textface $6241
	end

G4_28_ObjectEvents:
	object_event $0c,  7,  5, 0, $00, $00, $00, $00, Script_05a_43bd
	object_event $0d,  7,  4, 0, $00, $00, $00, $01, $40bc
	object_event $6a,  6,  4, 0, $00, $00, $00, $02, $40bc
	objects_end

Script_05a_43bd:
	checkbit wEventFlags + 13, $01, Script_05a_43f2
	textface $5d6f
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext $5dcc
	stext $5de0
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext $5e65
	stext $5eb7
	stext $5f03
	spriteface 2, FACE_RIGHT
	emote 2, EMOTE_ANGER
	delay $03, $20
	stext $5f39
	setbit wEventFlags + 13, $01
	end

Script_05a_43f2:
	checkbit wEventFlags + 14, $00, Script_05a_43ff
	textface $5fb9
	stext $6039
	end

Script_05a_43ff:
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	stext $68fd
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext $693f
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_DOWN
	stext $6966
	spriteface 2, FACE_UP
	spritewalk 2, MOVE_UP
	clearobject $02
	spriteface 3, FACE_LEFT
	spritewalk 3, MOVE_LEFT
	clearobject $03
	face FACE_LEFT
	move MovementData_OneLeft
	face FACE_UP
	spriteface 1, FACE_LEFT
	spritewalk 1, MOVE_LEFT
	spriteface 1, FACE_UP
	stext $69ca
	emote 0, EMOTE_TEAR
	delay $03, $20
	move MovementData_OneUp
	spritewalk 1, MOVE_UP
	move MovementData_OneUp
	clearobject $00
	spritewalk 1, MOVE_UP
	clearobject $01
	stext $69e4
	spriteface 4, FACE_UP
	delay $03, $10
	objmove $04, $77d4
	clearobject $04
	setmap $53, $01
	stext $69fa
	playsound SFX_2c
	runmovement MovementData_00b_4227
	runmovement MovementData_00b_4227
	playsound SFX_2c
	runmovement MovementData_00b_41fe
	runmovement MovementData_00b_41fe
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	farjump2 $4785, $59
	end

Script_05a_448c:
	face FACE_LEFT
	farjump Script_05a_4498
	face FACE_UP
	farjump Script_05a_4498
Script_05a_4498:
	stext $604f
	scr_48 $02, $15
	checkbit wEventFlags + 13, $01, Script_05a_44a5
	end

Script_05a_44a5:
	checkbit wEventFlags + 13, $02, Script_05a_44be
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext $605f
	setbit wEventFlags + 13, $02
	end

Script_05a_44be:
	end

Script_05a_44bf:
	checkbit wEventFlags + 13, $02, Script_05a_44c9
	setmap $26, $01
	end

Script_05a_44c9:
	setmap $27, $01
	end

ObjectEvents_05a_44cd:
	object_event $6b,  5,  0, 0, $00, $00, $00, $00, $40bc
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_63_ObjectEvents:
	dr $1684d9, $16b820

