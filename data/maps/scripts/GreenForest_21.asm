GreenForest_21_ObjectEvents::
	object_event $3a, 11,  7, 0, $00, $00, $00, $00, Script_04f_455e
	object_event $44,  8,  8, 0, $00, $00, $00, $01, Script_04f_4576
	object_event $42, 11, 11, 0, $00, $00, $00, $02, Script_04f_456a
	objects_end

Script_04f_455e::
	ifcharindex $03, Script_04f_4566
	textface text_4f_6801
	end

Script_04f_4566::
	textface text_4f_680f
	end

Script_04f_456a::
	ifcharindex $03, Script_04f_4572
	textface text_4f_67d7
	end

Script_04f_4572::
	textface text_4f_6843
	end

Script_04f_4576::
	ifcharindex $03, Script_04f_457e
	textface text_4f_67d7
	end

Script_04f_457e::
	textface text_4f_67cc
	end

GreenForest_21_ObjectEvents2::
	object_event $3a, 11,  7, 0, $00, $00, $00, $00, Script_04f_455e
	object_event $42,  8,  8, 0, $00, $00, $00, $01, Script_04f_4576
	object_event $42, 11, 11, 0, $00, $00, $00, $02, Script_04f_456a
	object_event $06,  8,  9, wEventFlags + 6, $02, $00, $00, $03, Script_04f_4031
	object_event $07,  7,  9, wEventFlags + 6, $02, $00, $00, $04, Script_04f_4031
	objects_end

ObjSprite_4f_45ba::
	object_event $44,  5,  8, 0, $00, $00, $00, $01, Script_04f_4576
	objects_end

Script_04f_45c6::
	checkbit wEventFlags + 6, $02, Script_04f_463b
	setplayerchar $02
	face FACE_LEFT
	setmap MAP_GREEN_FOREST_21, $03
	scr_62 $03, $00
	spriteface  5, FACE_UP
	spriteface  6, FACE_RIGHT
	stext text_4f_69c8
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spritewalk  3, MOVE_LEFT
	spritewalk  3, MOVE_LEFT
	clearobject $03
	loadobjsprite ObjSprite_4f_45ba
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_DOWN
	emote  5, EMOTE_EXCLAMATION
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_6a43
	stext text_4f_6aa8
	scr_48 $02, $0b
	emote  5, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_RIGHT
	stext text_4f_6ab8
	stext text_4f_6ae3
	stext text_4f_6afa
	spriteface  5, FACE_RIGHT
	spriteface  6, FACE_RIGHT
	setattach $05, $06, $00, $10
	objmove $06, MovementData_04f_7bd4
	clearobject $05
	clearobject $06
	setbit wEventFlags + 6, $02
	end

Script_04f_463b::
	setmap MAP_GREEN_FOREST_21, $00
	end2
