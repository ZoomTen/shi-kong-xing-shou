SacredtreeVillage_25_ObjectEvents::
	object_event $13,  4,  6, 0, $00, $00, $0b, $00, Script_059_42e0
	object_event $15, 16,  6, 0, $00, $00, $06, $01, Script_059_42ee
	object_event $14, 19, 11, 0, $00, $00, $07, $02, Script_059_42fc
	object_event $17, 11, 10, 0, $00, $00, $00, $03, Script_059_430a
	object_event $16,  7, 14, 0, $00, $00, $0a, $04, Script_059_4318
	object_event $19,  9, 20, 0, $00, $00, $06, $00, Script_059_4326
	object_event $1c, 17, 17, 0, $00, $00, $00, $01, Script_059_4334
	objects_end

SacredtreeVillage_3a_ObjectEvents::
	object_event $18,  5,  4, 0, $00, $00, $07, $00, Script_059_436c
	objects_end

SacredtreeVillage_3b_ObjectEvents::
	object_event $1f,  7,  6, 0, $00, $00, $06, $00, Script_059_437a
	object_event $24,  4,  4, 0, $00, $00, $00, $01, Script_059_43a6
	objects_end

SacredtreeVillage_3c_ObjectEvents::
	object_event $1a,  9,  6, 0, $00, $00, $00, $00, Script_059_43b4
	object_event $21,  4,  4, 0, $00, $00, $0b, $01, Script_059_43e3
	objects_end

SacredtreeVillage_3d_ObjectEvents::
	object_event $16,  6,  4, 0, $00, $00, $0b, $00, Script_059_43ff
	object_event $19,  3,  5, 0, $00, $00, $00, $01, Script_059_43f1
	objects_end

SacredtreeVillage_3f_ObjectEvents::
	object_event $0c,  5,  3, wEventFlags + 14, $01, $00, $00, $00, Script_059_4181
	object_event $0d,  4,  3, wEventFlags + 14, $01, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_4181::
	checkbit wEventFlags + 12, $01, Script_059_418b
	textface text_59_4f6a
	end

Script_059_418b::
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

Script_059_41a3::
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

Script_059_41e2::
	textface text_59_520e
	end

Script_059_41e6::
	checkbit wEventFlags + 12, $07, Script_059_41f4
	setmap MAP_SACREDTREE_VILLAGE_3F, $00
	end

Script_059_41f0::
	setmap MAP_SACREDTREE_VILLAGE_3F, $00
	end

Script_059_41f4::
	checkbit wEventFlags + 14, $01, Script_059_41f0
	face FACE_RIGHT
	setmap MAP_SACREDTREE_VILLAGE_3F, $01
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
	setmap MAP_G4_53, $00
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

SacredtreeVillage_3f_ObjectEvents2::
	object_event $0c,  5,  3, 0, $00, $00, $00, $00, Script_059_40c9
	object_event $0d,  7,  3, 0, $00, $00, $00, $01, Script_059_40c9
	object_event $6a,  6,  4, 0, $00, $00, $00, $02, Script_059_40c9
	objects_end

Script_059_42e0::
	checkbit wEventFlags + 14, $02, Script_059_42ea
	textface text_59_48ea
	end

Script_059_42ea::
	textface text_59_711f
	end

Script_059_42ee::
	checkbit wEventFlags + 14, $02, Script_059_42f8
	textface text_59_493b
	end

Script_059_42f8::
	textface text_59_7131
	end

Script_059_42fc::
	checkbit wEventFlags + 14, $02, Script_059_4306
	textface text_59_4986
	end

Script_059_4306::
	textface text_59_717c
	end

Script_059_430a::
	checkbit wEventFlags + 14, $02, Script_059_4314
	textface text_59_49ff
	end

Script_059_4314::
	textface text_59_71b4
	end

Script_059_4318::
	checkbit wEventFlags + 14, $02, Script_059_4322
	textface text_59_4a92
	end

Script_059_4322::
	textface text_59_724a
	end

Script_059_4326::
	checkbit wEventFlags + 14, $02, Script_059_4330
	textface text_59_4ad5
	end

Script_059_4330::
	textface text_59_728d
	end

Script_059_4334::
	checkbit wEventFlags + 12, $05, Script_059_433e
	textface text_59_4b37
	end

Script_059_433e::
	checkbit wEventFlags + 12, $06, Script_059_435e
	textface text_59_544f
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_59_54d3
	stext text_59_5511
	stext text_59_5571
	giveitem ITEMNAMECAT_KEY, KEYITEM_14
	setbit wEventFlags + 12, $06
	end

Script_059_435e::
	checkbit wEventFlags + 14, $02, Script_059_4368
	textface text_59_5580
	end

Script_059_4368::
	textface text_59_733c
	end

Script_059_436c::
	checkbit wEventFlags + 14, $02, Script_059_4376
	textface text_59_4b9e
	end

Script_059_4376::
	textface text_59_736c
	end

Script_059_437a::
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

Script_059_43a2::
	textface text_59_73e9
	end

Script_059_43a6::
	checkbit wEventFlags + 14, $02, Script_059_43b0
	textface text_59_4c82
	end

Script_059_43b0::
	textface text_59_739e
	end

Script_059_43b4::
	checkbit wEventFlags + 12, $04, Script_059_43be
	textface text_59_4d80
	end

Script_059_43be::
	checkbit wEventFlags + 12, $05, Script_059_43d5
	textface text_59_5339
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_59_538c
	setbit wEventFlags + 12, $05
	end

Script_059_43d5::
	checkbit wEventFlags + 14, $02, Script_059_43df
	textface text_59_53fb
	end

Script_059_43df::
	textface text_59_740f
	end

Script_059_43e3::
	checkbit wEventFlags + 14, $02, Script_059_43ed
	textface text_59_4dab
	end

Script_059_43ed::
	textface text_59_744e
	end

Script_059_43f1::
	checkbit wEventFlags + 14, $02, Script_059_43fb
	textface text_59_4f14
	end

Script_059_43fb::
	textface text_59_75c1
	end

Script_059_43ff::
	checkbit wEventFlags + 13, $05, Script_059_4416
	textface text_59_4df2
	checkbit wEventFlags + 3, $03, Script_059_4412
	stext text_59_4e2d
	end

Script_059_4412::
	stext text_59_4e17
	end

Script_059_4416::
	checkbit wEventFlags + 14, $04, Script_059_442a
	textface text_59_74a9
	stext text_59_7593 ; "得到了～神奇果實" (got 神奇果實 / Magic Fruit)
; ORIGINAL-ROM BUG (preserved): the text grants 神奇果實, which is ITEM_26 in the
; ItemNames table, so this should be `giveitem ITEMNAMECAT_ITEM, ITEM_26` (cf.
; G5_03.asm and found_items.asm, which grant ITEM_26 correctly). The id $26 is
; right but the category is ITEMNAMECAT_EQUIP instead of ITEMNAMECAT_ITEM. At
; runtime this stores id $26 in the equipment bag (wEquipmentBag); equip id $26 is out of
; range (EquipmentNames has 36 entries, $00-$23), the display filter hides ids
; >= $16, and no script ever reads it back, so the reward is silently lost. Left
; as-is to match the original ROM; do not "fix".
	giveitem ITEMNAMECAT_EQUIP, $26
	setbit wEventFlags + 14, $04
	end

Script_059_442a::
	textface text_59_75a5
	end
