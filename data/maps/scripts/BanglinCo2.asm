BanglinCo2_ObjectEvents::
	object_event $3e,  2,  2, 0, $00, $00, $00, $00, Script_04e_4043
	object_event $27,  9,  5, 0, $00, $00, $00, $01, Script_04e_4047
	object_event $1d,  9,  2, 0, $00, $00, $00, $02, Script_04e_404b
	object_event $25,  4,  4, 0, $00, $00, $00, $03, Script_04e_404f
	object_event $13,  5, 10, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end

Script_04e_4043::
	textface text_4e_4dd3
	end

Script_04e_4047::
	textface text_4e_4ec6
	end

Script_04e_404b::
	textface text_4e_4e23
	end

Script_04e_404f::
	textface text_4e_4e4c
	end

Script_04e_4053::
	face FACE_DOWN
	spriteface  6, FACE_UP
	spritewalk  6, MOVE_UP
	spritewalk  6, MOVE_UP
	stext text_4e_4f64
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_4f99
	setmap MAP_CONTEST_HALL, $00
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	stext text_4e_4faf

Script_04e_407c::
	warpmode GAMEMODE_RHYTHM_MINIGAME, $0a, $00
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	checkbit wEventFlags + 7, $01, Script_04e_409a
	stext text_4e_5035
	farjump Script_04e_407c
	end

Script_04e_409a::
	stext text_4e_5086
	stext text_4e_50c4
	setmap MAP_BANGLIN_CO_2, $01
	end
