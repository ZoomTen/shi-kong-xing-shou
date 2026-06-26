CardillaHouse_ObjectEvents::
	object_event $18,  6,  4, 0, $00, $00, $00, $00, Script_066_46cc
	objects_end

Script_066_46cc::
	checkbit wEventFlags + 15, $00, Script_066_476b
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5936
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_596b
	stext text_66_5986
	setmap MAP_PERMAFROST_GARDEN, $01
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	spriteface  2, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	stext text_66_59e0
	stext text_66_5a33
	stext text_66_5a89
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk  3, MOVE_LEFT
	spriteface  4, FACE_RIGHT
	spriteface  2, FACE_RIGHT
	stext text_66_5b30
	stext text_66_5b52
	objmove $06, MovementData_066_7d15
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	emote  4, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk  4, MOVE_UP
	stext text_66_5b66
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_UP
	stext text_66_5b9f
	emote  6, EMOTE_ANGER
	delay $03, $20
	objmove $06, MovementData_066_7cc7
	clearobject $04
	emote  3, EMOTE_EXCLAMATION
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_5bba
	stext text_66_5bc9
	emote  6, EMOTE_ANGER
	delay $03, $20
	face FACE_UP
	setmap MAP_CARDILLA_HOUSE, $01
	stext text_66_5bd2
	setbit wEventFlags + 15, $00
	end

Script_066_476b::
	countflags10 $03, $73, $47
	textface text_66_5c77
	end

Script_066_4773::
	checkbit wEventFlags + 17, $01, Script_066_479a
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_610e
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_66_618d
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_619b
	setbit wEventFlags + 17, $01
	end

Script_066_479a::
	checkbit wEventFlags + 16, $05, Script_066_47a4
	textface text_66_61c1
	end

Script_066_47a4::
	checkbit wEventFlags + 15, $06, Script_066_47b2
	textface text_66_6d46
	setbit wEventFlags + 17, $06
	end

Script_066_47b2::
	textface text_66_74f2
	end

PresaleHouse_1a_ObjectEvents2::
	object_event $27,  5,  5, 0, $00, $00, $00, $00, Script_066_4869
	object_event $28,  4,  5, 0, $00, $00, $00, $01, Script_066_4869
	objects_end

Script_066_47cd::
	checkbit wEventFlags + 17, $01, Script_066_47dd
	setmap MAP_PRESALE_HOUSE_1A, $00

Script_066_47d6::
	end2

Script_066_47d7::
	face FACE_DOWN
	setmap MAP_G5_19, $01
	end

Script_066_47dd::
	setmap MAP_PRESALE_HOUSE_1A, $01
	checkbit wEventFlags + 17, $02, Script_066_47d6
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_66_6240
	stext text_66_626c
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	move MovementData_OneUp
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	stext text_66_62aa
	emote  2, EMOTE_QUESTION
	delay $03, $20
	stext text_66_62df
	stext text_66_630f
	stext text_66_632b
	stext text_66_6343
	stext text_66_635e
	stext text_66_6367
	stext text_66_6370
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_6384
	startbattle BattleData_02d_4d7b
	checkbit wEventFlags + 3, $03, Script_066_47d7
	stext text_66_63e7
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_641f
	stext text_66_6440
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_66_648d
	stext text_66_649e
	stext text_66_64cf
	stext text_66_6534
	stext text_66_659f
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_65b5
	stext text_66_6634
	setbit wEventFlags + 17, $02
	end

Script_066_4869::
	checkbit wEventFlags + 17, $05, Script_066_487d
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6655
	stext text_66_66d4
	end

Script_066_487d::
	checkbit wEventFlags + 16, $05, Script_066_48a7
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6b54
	stext text_66_6b63
	stext text_66_6bc8
	stext text_66_6c21
	stext text_66_6c6a
	stext text_66_6c79
	scr_48 $02, $1e
	listdec $02, $1d
	setbit wEventFlags + 16, $05
	end

Script_066_48a7::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6c93
	stext text_66_6cdd
	emote  0, EMOTE_TEAR
	delay $03, $20
	end

PermafrostGarden_ObjectEvents2::
	object_event $0e, 15, 23, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $31, 18, 23, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $14, 16, 23, 0, $00, $00, $00, $02, Script_066_41f2
	object_event $0f, 14, 23, 0, $00, $00, $00, $03, Script_066_41f2
	object_event $57, 16, 15, 0, $00, $00, $00, $04, Script_066_41f2
	objects_end
