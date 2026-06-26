G6_18_ObjectEvents::
	object_event $04,  6, 11, wEventFlags + 21, $07, $00, $00, $00, Script_06c_40e8
	object_event $06, 10,  6, wEventFlags + 22, $00, $00, $00, $01, Script_06c_4111
	object_event $02, 10, 15, wEventFlags + 22, $01, $00, $00, $02, Script_06c_413a
	object_event $0c, 15,  8, wEventFlags + 22, $02, $00, $00, $03, Script_06c_4163
	objects_end

Script_06c_40e8::
	checkbit wEventFlags + 21, $06, Script_06c_40f6
	textface text_6c_6aa6
	setbit wEventFlags + 20, $06
	end

Script_06c_40f6::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6e62
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $02, $01
	setbit wEventFlags + 21, $07
	end

Script_06c_4111::
	checkbit wEventFlags + 21, $06, Script_06c_411f
	stext text_6c_6ad5
	setbit wEventFlags + 20, $07
	end

Script_06c_411f::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6e97
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $03, $01
	setbit wEventFlags + 22, $00
	end

Script_06c_413a::
	checkbit wEventFlags + 21, $06, Script_06c_4148
	stext text_6c_6b13
	setbit wEventFlags + 21, $02
	end

Script_06c_4148::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6ebb
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $01, $01
	setbit wEventFlags + 22, $01
	end

Script_06c_4163::
	checkbit wEventFlags + 21, $06, Script_06c_4171
	stext text_6c_6b44
	setbit wEventFlags + 21, $03
	end

Script_06c_4171::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6ed1
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $06, $01
	setbit wEventFlags + 22, $02
	end
