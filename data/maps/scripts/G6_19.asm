G6_19_ObjectEvents::
	object_event $29,  5,  4, wEventFlags + 21, $06, $00, $00, $00, Script_06c_41a6
	objects_end

Script_06c_4198::
	checkbit wEventFlags + 22, $05, Script_06c_41a2
	setmap MAP_G6_1B, $00
	end

Script_06c_41a2::
	setmap MAP_G6_1B, $01
	end

Script_06c_41a6::
	checkbit wEventFlags + 20, $06, Script_06c_41b0
	stext text_6c_6a32
	end

Script_06c_41b0::
	checkbit wEventFlags + 20, $07, Script_06c_41ba
	stext text_6c_6a32
	end

Script_06c_41ba::
	checkbit wEventFlags + 21, $02, Script_06c_41c4
	stext text_6c_6a32
	end

Script_06c_41c4::
	checkbit wEventFlags + 21, $03, Script_06c_41ce
	stext text_6c_6a32
	end

Script_06c_41ce::
	checkbit wEventFlags + 21, $04, Script_06c_41d8
	stext text_6c_6a32
	end

Script_06c_41d8::
	checkbit wEventFlags + 21, $05, Script_06c_41e2
	stext text_6c_6a32
	end

Script_06c_41e2::
	checkbit wEventFlags + 21, $03, Script_06c_41ec
	stext text_6c_6c58
	end

Script_06c_41ec::
	checkbit wEventFlags + 21, $04, Script_06c_41f6
	stext text_6c_6a32
	end

Script_06c_41f6::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_6c58
	loadobjsprite ObjSprite_6c_4266
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	stext text_6c_6c75
	stext text_6c_6ccd
	stext text_6c_6cf9
	stext text_6c_6d89
	stext text_6c_6d99
	stext text_6c_6e0c
	stext text_6c_6e15
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	setattach $02, $03, $f0, $00
	objmove $03, MovementData_06c_7995
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spritewalk  2, MOVE_DOWN
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	clearobject $03
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	clearobject $02
	setbit wEventFlags + 21, $06
	end

ObjSprite_6c_4266::
	object_event $59,  5,  8, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end
