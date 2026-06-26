; TODO: structured data table (not graphics), classify records
unk_05a_4000::
	end

SacredtreeShop_5d_ObjectEvents::
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

SacredtreeHealingCenter_5c_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_05a_403a
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_05a_403e
	objects_end

Script_05a_403a::
	stext text_5a_405e
	end

Script_05a_403e::
	stext text_5a_4076
	end

Script_05a_4042::
	face FACE_UP
	stext text_5a_405e
	checkbit wEventFlags + 3, $03, Script_05a_404f
	scr_37
	end

Script_05a_404f::
	end

Script_05a_4050::
	face FACE_UP
	stext text_5a_4076
	checkbit wEventFlags + 3, $03, Script_05a_405d
	townmusicanim
	end

Script_05a_405d::
	end

INCLUDE "data/text/script_sacredtree_healing_center_5c.asm"
INCLUDE "data/text/script_sacredtree_shop_5d.asm"
Script_05a_40bc::
	end

Bank5a_EmptyObjectEvent::
	objects_end

Script_05a_40be::
	checkbit wEventFlags + 13, $02, Script_05a_40c8
	setmap MAP_G4_26, $02
	end

Script_05a_40c8::
	setmap MAP_SACREDTREE_VILLAGE_27, $02
	end

Script_05a_40cc::
	setmap MAP_G4_26, $02
	end

Script_05a_40d0::
	checkbit wEventFlags + 13, $00, Script_05a_40ec
	emote $00, EMOTE_QUESTION
	delay $03, $20
	stext text_5a_5623
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_UP
	end

Script_05a_40ec::
	checkbit wEventFlags + 13, $02, Script_05a_40f6
	setmap MAP_G4_26, $06
	end

Script_05a_40f6::
	setmap MAP_SACREDTREE_VILLAGE_27, $06
	end

Script_05a_40fa::
	checkbit wEventFlags + 13, $02, Script_05a_4104
	setmap MAP_G4_26, $05
	end

Script_05a_4104::
	setmap MAP_SACREDTREE_VILLAGE_27, $05
	end

Script_05a_4108::
	checkbit wEventFlags + 13, $02, Script_05a_4112
	setmap MAP_G4_26, $04
	end

Script_05a_4112::
	setmap MAP_SACREDTREE_VILLAGE_27, $04
	end

Script_05a_4116::
	checkbit wEventFlags + 13, $02, Script_05a_4120
	setmap MAP_G4_26, $0a
	end

Script_05a_4120::
	setmap MAP_SACREDTREE_VILLAGE_27, $0a
	end

Script_05a_4124::
	checkbit wEventFlags + 13, $02, Script_05a_412e
	setmap MAP_G4_26, $08
	end

Script_05a_412e::
	setmap MAP_SACREDTREE_VILLAGE_27, $08
	end

Script_05a_4132::
	checkbit wEventFlags + 13, $02, Script_05a_413c
	setmap MAP_G4_26, $09
	end

Script_05a_413c::
	setmap MAP_SACREDTREE_VILLAGE_27, $09
	end

Script_05a_4140::
	checkbit wEventFlags + 13, $02, Script_05a_414a
	setmap MAP_G4_26, $03
	end

Script_05a_414a::
	setmap MAP_SACREDTREE_VILLAGE_27, $03
	end

Script_05a_414e::
	checkbit wEventFlags + 13, $02, Script_05a_4158
	setmap MAP_G4_26, $07
	end

Script_05a_4158::
	setmap MAP_SACREDTREE_VILLAGE_27, $07
	end

Script_05a_415c::
	ifcharindex $01, Script_05a_4161
	end

Script_05a_4161::
	face FACE_LEFT
	spriteface $01, FACE_LEFT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_05a_76e8
	clearattach $01
	spriteface $01, FACE_RIGHT
	spritewalk $01, MOVE_RIGHT
	spriteface $01, FACE_DOWN
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_LEFT
	end

Script_05a_4183::
	ifcharindex $01, Script_05a_4188
	end

Script_05a_4188::
	face FACE_RIGHT
	spriteface $01, FACE_RIGHT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_05a_7729
	clearattach $01
	spriteface $01, FACE_LEFT
	spritewalk $01, MOVE_LEFT
	spriteface $01, FACE_DOWN
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_RIGHT
	end

Script_05a_41aa::
	setmappredef $17
	setplayerchar $00
	face FACE_DOWN
	setmap MAP_SACREDTREE_VILLAGE_PAST, $01
	emote $00, EMOTE_QUESTION
	delay $03, $20
	stext text_5a_5608
	end

SacredtreeVillagePast_ObjectEvents::
	object_event $52, 6, 3, wEventFlags + 14, $00, $00, $00, $00, Script_05a_41c9
	objects_end

Script_05a_41c9::
	checkbit wEventFlags + 13, $00, Script_05a_41e0
	textface text_5a_563f
	stext text_5a_56c3
	stext text_5a_56e8
	stext text_5a_570a
	setbit wEventFlags + 13, $00
	end

Script_05a_41e0::
	checkbit wEventFlags + 13, $02, Script_05a_41ea
	textface text_5a_5806
	end

Script_05a_41ea::
	checkbit wEventFlags + 13, $06, Script_05a_421c
	textface text_5a_637c
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_63ee
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext text_5a_645e
	stext text_5a_646e
	stext text_5a_6502
	stext text_5a_6520
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext text_5a_65a6
	setbit wEventFlags + 13, $06
	end

Script_05a_421c::
	checkbit wEventFlags + 13, $07, Script_05a_4226
	textface text_5a_65dd
	end

Script_05a_4226::
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_67bc
	face FACE_LEFT
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_RIGHT
	stext text_5a_6829
	spriteface 2, FACE_DOWN
	objmove $02, MovementData_05a_77ab
	clearobject $02
	setbit wEventFlags + 14, $00
	end

G4_26_ObjectEvents::
SacredtreeVillage_27_ObjectEvents::
	object_event $13, 19, 4, 0, $00, $00, $06, $00, Script_05a_42a3
	object_event $15, 5, 6, 0, $00, $00, $07, $01, Script_05a_42a7
	object_event $14, 13, 8, 0, $00, $00, $08, $02, Script_05a_42ab
	object_event $17, 7, 12, 0, $00, $00, $0a, $03, Script_05a_42b9
	object_event $16, 18, 13, 0, $00, $00, $0a, $04, Script_05a_42bd
	object_event $19, 8, 20, 0, $00, $00, $05, $00, Script_05a_42cb
	object_event $25, 17, 20, 0, $00, $00, $09, $01, Script_05a_42cf
	objects_end

Script_05a_42a3::
	textface text_5a_58a8
	end

Script_05a_42a7::
	textface text_5a_58ba
	end

Script_05a_42ab::
	checkbit wEventFlags + 13, $02, Script_05a_42b5
	textface text_5a_5923
	end

Script_05a_42b5::
	textface text_5a_6087
	end

Script_05a_42b9::
	textface text_5a_595a
	end

Script_05a_42bd::
	checkbit wEventFlags + 13, $02, Script_05a_42c7
	textface text_5a_59ee
	end

Script_05a_42c7::
	textface text_5a_60d2
	end

Script_05a_42cb::
	textface text_5a_5a2f
	end

Script_05a_42cf::
	textface text_5a_5a6b
	end

SacredtreeVillage_56_ObjectEvents::
	object_event $18,  5,  4, 0, $00, $00, $07, $00, Script_05a_42df
	objects_end

Script_05a_42df::
	checkbit wEventFlags + 13, $04, Script_05a_42e9
	textface text_5a_5ac1
	end

Script_05a_42e9::
	checkbit wEventFlags + 13, $05, Script_05a_42fa
	textface text_5a_634a
	listdec $02, $16
	setbit wEventFlags + 13, $05
	end

Script_05a_42fa::
	textface text_5a_634a
	end

SacredtreeVillage_57_ObjectEvents::
	object_event $20,  7,  6, 0, $00, $00, $0b, $00, Script_05a_430a
	objects_end

Script_05a_430a::
	checkbit wEventFlags + 13, $03, Script_05a_4314
	textface text_5a_5b68
	end

Script_05a_4314::
	checkbit wEventFlags + 13, $04, Script_05a_433d
	textface text_5a_6273
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_62a5
	startbattle BattleData_02d_4cc3
	checkbit wEventFlags + 3, $03, unk_05a_4000
	stext text_5a_62e8
	stext text_5a_6311
	scr_48 $02, $16
	setbit wEventFlags + 13, $04
	end

Script_05a_433d::
	textface text_5a_6321
	end

SacredtreeVillage_58_ObjectEvents::
	object_event $1e,  8,  4, 0, $00, $00, $00, $00, Script_05a_4358
	object_event $21,  3,  3, 0, $00, $00, $0b, $01, Script_05a_435c
	objects_end
Script_05a_4358::
	textface text_5a_5bb6
	end
Script_05a_435c::
	textface text_5a_5c0c
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_5c61
	end

SacredtreeVillage_59_ObjectEvents::
	object_event $1b, 6, 4, 0, $00, $00, $0b, $00, Script_05a_4375
	objects_end

Script_05a_4375::
	checkbit wEventFlags + 13, $02, Script_05a_437f
	textface text_5a_5cb0
	end

Script_05a_437f::
	checkbit wEventFlags + 13, $04, Script_05a_438d
	textface text_5a_611e
	setbit wEventFlags + 13, $03
	end

Script_05a_438d::
	checkbit wEventFlags + 13, $05, Script_05a_4397
	textface text_5a_61fa
	end

Script_05a_4397::
	textface text_5a_6241
	end

SacredtreeVillage_28_ObjectEvents::
	object_event $0c,  7,  5, 0, $00, $00, $00, $00, Script_05a_43bd
	object_event $0d,  7,  4, 0, $00, $00, $00, $01, Script_05a_40bc
	object_event $6a,  6,  4, 0, $00, $00, $00, $02, Script_05a_40bc
	objects_end

Script_05a_43bd::
	checkbit wEventFlags + 13, $01, Script_05a_43f2
	textface text_5a_5d6f
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext text_5a_5dcc
	stext text_5a_5de0
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_5e65
	stext text_5a_5eb7
	stext text_5a_5f03
	spriteface 2, FACE_RIGHT
	emote 2, EMOTE_ANGER
	delay $03, $20
	stext text_5a_5f39
	setbit wEventFlags + 13, $01
	end

Script_05a_43f2::
	checkbit wEventFlags + 14, $00, Script_05a_43ff
	textface text_5a_5fb9
	stext text_5a_6039
	end

Script_05a_43ff::
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	stext text_5a_68fd
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_693f
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_DOWN
	stext text_5a_6966
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
	stext text_5a_69ca
	emote 0, EMOTE_TEAR
	delay $03, $20
	move MovementData_OneUp
	spritewalk 1, MOVE_UP
	move MovementData_OneUp
	clearobject $00
	spritewalk 1, MOVE_UP
	clearobject $01
	stext text_5a_69e4
	spriteface 4, FACE_UP
	delay $03, $10
	objmove $04, MovementData_05a_77d4
	clearobject $04
	setmap MAP_G4_53, $01
	stext text_5a_69fa
	playsound SFX_2c
	runmovement MovementData_00b_4227
	runmovement MovementData_00b_4227
	playsound SFX_2c
	runmovement MovementData_00b_41fe
	runmovement MovementData_00b_41fe
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	farjump2 Script_059_4785
	end

Script_05a_448c::
	face FACE_LEFT
	farjump Script_05a_4498
	face FACE_UP
	farjump Script_05a_4498
Script_05a_4498::
	stext text_5a_604f
	scr_48 $02, $15
	checkbit wEventFlags + 13, $01, Script_05a_44a5
	end

Script_05a_44a5::
	checkbit wEventFlags + 13, $02, Script_05a_44be
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_605f
	setbit wEventFlags + 13, $02
	end

Script_05a_44be::
	end

Script_05a_44bf::
	checkbit wEventFlags + 13, $02, Script_05a_44c9
	setmap MAP_G4_26, $01
	end

Script_05a_44c9::
	setmap MAP_SACREDTREE_VILLAGE_27, $01
	end

ObjectEvents_05a_44cd::
	object_event $6b,  5,  0, 0, $00, $00, $00, $00, Script_05a_40bc
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
RadarStation_ObjectEvents::
	object_event $50,  5,  3, wEventFlags + 13, $07, $00, $00, $00, Script_05a_44e5
	objects_end

Script_05a_44e5::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_5a_6663
	startbattle BattleData_02d_4cf1
	checkbit wEventFlags + 3, $03, unk_05a_4000
	stext text_5a_66f0
	spriteface  2, FACE_UP
	objmove $02, MovementData_05a_77d4
	clearobject $02 ; TEMP
	loadobjsprite ObjectEvents_05a_44cd
	objmove $02, MovementData_05a_776a
	clearobject $02 ; TEMP
	stext text_5a_673a
	scr_48 $02, $17
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_5a_674d
	setbit wEventFlags + 13, $07
	end

INCLUDE "data/text/script_sacredtree_village_4521.asm"
INCLUDE "data/text/script_sacredtree_village_past_5b_1.asm"
INCLUDE "data/text/script_sacredtree_village_27_1.asm"
INCLUDE "data/text/script_sacredtree_village_56_1.asm"
INCLUDE "data/text/script_sacredtree_village_57_1.asm"
INCLUDE "data/text/script_sacredtree_village_58.asm"
INCLUDE "data/text/script_sacredtree_village_59_1.asm"
INCLUDE "data/text/script_sacredtree_village_past_28_2.asm"
INCLUDE "data/text/script_sacredtree_village_27_2.asm"
INCLUDE "data/text/script_sacredtree_village_59_2.asm"
INCLUDE "data/text/script_sacredtree_village_57_2.asm"
INCLUDE "data/text/script_sacredtree_village_56_2.asm"
INCLUDE "data/text/script_sacredtree_village_past_5b_2.asm"
INCLUDE "data/text/script_radar_station_63.asm"
INCLUDE "data/text/script_sacredtree_village_past_5b_3.asm"
INCLUDE "data/text/script_sacredtree_village_28_3.asm"
INCLUDE "data/text/script_radar_station_28_3_72b0.asm"
; movement data ($88 terminator)
MovementData_05a_76e8::
	db $ff, $00, $fe, $00, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff
	db $fe, $ff, $fe, $fe, $ff, $fe, $ff, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff
	db $00, $ff, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $02, $ff, $01, $ff, $01, $fe
	db $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $00, $02, $ff
	db $88
MovementData_05a_7729::
	db $ff, $00, $fe, $00, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $02, $ff, $02, $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01
	db $00, $01, $01, $01, $00, $01, $00, $01, $01, $01, $02, $01, $01, $01, $01, $02
	db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $00, $02, $01
	db $88
MovementData_05a_776a::
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88
MovementData_05a_77ab::
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $88
MovementData_05a_77d4::
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $88
