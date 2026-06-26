G6_1B_ObjectEvents::
	object_event $0e,  5,  4, wEventFlags + 20, $03, $00, $00, $00, Script_06c_42e7
	objects_end

Script_06c_42e7::
	checkbit wEventFlags + 21, $06, Script_06c_42f5
	stext text_6c_6c25
	setbit wEventFlags + 20, $04
	end

Script_06c_42f5::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6f77
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $07, $01
	setbit wEventFlags + 22, $05
	end

Script_06c_4310::
	checkbit wEventFlags + 21, $07, Script_06c_4326
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_4326::
	checkbit wEventFlags + 22, $01, Script_06c_433c
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_433c::
	checkbit wEventFlags + 22, $02, Script_06c_4352
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_4352::
	checkbit wEventFlags + 22, $03, Script_06c_4368
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_4368::
	checkbit wEventFlags + 22, $04, Script_06c_437e
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_437e::
	checkbit wEventFlags + 20, $03, Script_06c_439a
	checkbit wEventFlags + 22, $04, Script_06c_439a
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	stext text_6c_6fb1
	end

Script_06c_439a::
	setmap MAP_G6_1E, $00
	end
