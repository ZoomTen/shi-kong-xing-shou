G6_1A_ObjectEvents::
	object_event $08,  4,  4, wEventFlags + 22, $03, $00, $00, $00, Script_06c_4289
	object_event $0a,  7,  4, wEventFlags + 22, $04, $00, $00, $01, Script_06c_42b2
	objects_end

Script_06c_4289::
	checkbit wEventFlags + 21, $06, Script_06c_4297
	stext text_6c_6bad
	setbit wEventFlags + 21, $04
	end

Script_06c_4297::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6f1c
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $04, $01
	setbit wEventFlags + 22, $03
	end

Script_06c_42b2::
	checkbit wEventFlags + 21, $06, Script_06c_42c0
	stext text_6c_6bf2
	setbit wEventFlags + 21, $05
	end

Script_06c_42c0::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	spriteface 136, FACE_DOWN
	stext text_6c_6f41
	clearplayerpos
	spritewalk 136, MOVE_DOWN
	clearobject $88
	scr_62 $05, $01
	setbit wEventFlags + 22, $04
	end
