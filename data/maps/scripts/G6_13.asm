G6_13_ObjectEvents::
	object_event $0e,  8,  3, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end

ObjSprite_6c_4c0b::
	object_event $50,  9,  3, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end

BaalCapital_22_ObjectEvents::
	object_event $19,  3,  6, 0, $00, $00, $08, $00, Script_06c_4daa
	object_event $16,  9,  5, 0, $00, $00, $00, $01, Script_06c_4db8
	objects_end

BaalCapital_23_ObjectEvents::
	object_event $20,  4,  4, 0, $00, $00, $07, $00, Script_06c_4dc6
	object_event $1f,  6,  4, 0, $00, $00, $00, $01, Script_06c_4dca
	objects_end

BaalCapital_24_ObjectEvents::
	object_event $1b,  9,  6, 0, $00, $00, $00, $00, Script_06c_4dce
	object_event $1a,  4,  6, 0, $00, $00, $09, $01, Script_06c_4dd2
	objects_end

BaalCapitalBlacksmith_ObjectEvents::
	object_event $24,  4,  5, 0, $00, $00, $00, $00, Script_06c_4dd6
	objects_end

BaalCapitalProfessor_2b_ObjectEvents4::
	object_event $5a,  5,  3, 0, $00, $00, $00, $00, Script_06c_4cc1
	objects_end

BaalCapitalProfessor_2b_ObjectEvents::
	object_event $5a,  5,  3, 0, $00, $00, $00, $00, Script_06c_4cc1
	objects_end

BaalCapitalProfessor_2b_ObjectEvents3::
	object_event $5a,  5,  4, 0, $00, $00, $00, $00, Script_06c_4cc1
	object_event $58,  6,  4, 0, $00, $00, $00, $00, Script_06c_4ceb
	objects_end

Script_06c_4c97::
	checkbit wEventFlags + 18, $04, Script_06c_4ca1
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $00
	end2

Script_06c_4ca1::
	checkbit wEventFlags + 18, $06, Script_06c_4cab
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $02
	end2

Script_06c_4cab::
	checkbit wEventFlags + 19, $01, Script_06c_4cb5
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $00
	end2

Script_06c_4cb5::
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $03
	end2

Script_06c_4cb9::
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $01
	end2

Script_06c_4cbd::
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $05
	end2

Script_06c_4cc1::
	checkbit wEventFlags + 18, $06, Script_06c_4ccb
	textface text_6c_5682
	end

Script_06c_4ccb::
	checkbit wEventFlags + 19, $00, Script_06c_4cd5
	textface text_6c_5e58
	end

Script_06c_4cd5::
	textface text_6c_5f88
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	stext text_6c_5fc7
	takeitem ITEMNAMECAT_KEY, KEYITEM_27
	setbit wEventFlags + 19, $02
	end

Script_06c_4ceb::
	ifcharindex $01, Script_06c_4cf9
	stext text_6c_5bde
	stext text_6c_5be7
	stext text_6c_5c09
	end

Script_06c_4cf9::
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
