BaalCapital_26_ObjectEvents::
	object_event $58,  4,  4, wEventFlags + 18, $04, $00, $00, $00, Script_06c_4ea3
	objects_end

BaalCapital_26_ObjectEvents2::
	object_event $58,  4,  4, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end

; TODO: map array reached via binary map header (source map unknown)
ObjectEvents_06c_4d7e::
	object_event $5a,  5,  3, 0, $00, $00, $00, $00, Script_06c_4d8a
	objects_end

Script_06c_4d8a::
	checkbit wEventFlags + 19, $00, Script_06c_4d94
	textface text_6c_5dd0
	end

Script_06c_4d94::
	textface text_6c_5f88
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	stext text_6c_5fc7
	takeitem ITEMNAMECAT_KEY, KEYITEM_27
	setbit wEventFlags + 19, $02
	end

Script_06c_4daa::
	checkbit wEventFlags + 18, $04, Script_06c_4db4
	textface text_6c_542b
	end

Script_06c_4db4::
	textface text_6c_5a95
	end

Script_06c_4db8::
	checkbit wEventFlags + 18, $04, Script_06c_4dc2
	textface text_6c_547d
	end

Script_06c_4dc2::
	textface text_6c_5b0a
	end

Script_06c_4dc6::
	textface text_6c_54d1
	end

Script_06c_4dca::
	textface text_6c_553e
	end

Script_06c_4dce::
	textface text_6c_559c
	end

Script_06c_4dd2::
	textface text_6c_55f6
	end

Script_06c_4dd6::
	checkbit wEventFlags + 18, $06, Script_06c_4de0
	textface text_6c_5634
	end

Script_06c_4de0::
	checkbit wEventFlags + 18, $07, Script_06c_4dea
	textface text_6c_5ee0
	end

Script_06c_4dea::
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
	giveitem ITEMNAMECAT_KEY, KEYITEM_27
	takeitem ITEMNAMECAT_KEY, KEYITEM_26
	setbit wEventFlags + 19, $00
	end

Script_06c_4e2b::
	textface text_6c_5634
	end

Script_06c_4e2f::
	checkbit wEventFlags + 18, $04, Script_06c_4e39
	textface text_6c_5682
	end

Script_06c_4e39::
	textface text_6c_5b7e
	end

Script_06c_4e3d::
	ifcharindex $01, Script_06c_4e4b
	stext text_6c_5bde
	stext text_6c_5be7
	stext text_6c_5c09
	end

Script_06c_4e4b::
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

Script_06c_4e9f::
	stext text_6c_5e58
	end

Script_06c_4ea3::
	textface text_6c_56d4
	textface text_6c_5755
	setbit wEventFlags + 23, $06
	end
