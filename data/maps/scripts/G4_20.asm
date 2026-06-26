G4_20_ObjectEvents::
	object_event $68,  6,  7, wEventFlags + 9, $05, $01, $08, $00, Script_058_40f2
	object_event $68,  4, 17, wEventFlags + 9, $06, $01, $07, $00, Script_058_40f2
	object_event $68, 11, 12, wEventFlags + 9, $07, $01, $05, $00, Script_058_40f2
	object_event $68, 17, 11, wEventFlags + 10, $00, $01, $0b, $00, Script_058_40f2
	object_event $68, 22, 20, wEventFlags + 10, $01, $01, $09, $00, Script_058_40f2
	objects_end

TravelingShip_18_ObjectEvents::
	object_event $31, 11,  3, 0, $00, $00, $00, $00, Script_058_4145
	objects_end

Script_058_4145::
	checkbit wEventFlags + 10, $07, Script_058_414f
	textface text_58_5052
	end

Script_058_414f::
	checkbit wEventFlags + 11, $00, Script_058_41bd
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	stext text_58_5052
	loadobjsprite ObjSprite_58_41e2
	spriteface 3, FACE_UP
	objmove $03, MovementData_058_6761
	spriteface 3, FACE_RIGHT
	face FACE_LEFT
	spriteface 2, FACE_LEFT
	stext text_58_50bb
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_50c8
	spritewalk 2, MOVE_RIGHT
	spriteface 2, FACE_LEFT
	emote 3, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 3, FACE_LEFT
	objmove $03, MovementData_058_6728
	clearobject $03
	spriteface 2, FACE_DOWN
	face FACE_UP
	stext text_58_50e9
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_DOWN
	stext text_58_5138
	emote 0, EMOTE_EXCLAMATION
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_51c4
	setbit wEventFlags + 11, $00
	end

Script_058_41bd::
	checkbit wEventFlags + 11, $01, Script_058_41c7
	textface text_58_5294
	end

Script_058_41c7::
	checkbit wEventFlags + 11, $02, Script_058_41de
	textface text_58_54f9
	stext text_58_556e
	giveitem ITEMNAMECAT_KEY, KEYITEM_11
	stext text_58_557e
	setbit wEventFlags + 11, $02
	end

Script_058_41de::
	textface text_58_55ea
	end

ObjSprite_58_41e2::
	object_event $69, 10, 10, 0, $00, $00, $00, $01, Script_058_40e9
	objects_end
