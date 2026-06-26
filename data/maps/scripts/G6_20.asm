G6_20_ObjectEvents::
	object_event $11,  5,  4, wEventFlags + 24, $03, $00, $00, $00, Script_06c_43aa
	object_event $59,  4,  5, wEventFlags + 24, $03, $00, $00, $01, Script_06c_43aa
	object_event $29,  5,  5, wEventFlags + 24, $03, $00, $00, $02, Script_06c_43aa
	objects_end

G6_21_ObjectEvents::
	object_event $11,  3,  4, 0, $00, $00, $00, $00, Script_06c_440e
	object_event $59,  3,  6, 0, $00, $00, $00, $01, Script_06c_4412
	object_event $29,  7,  3, 0, $00, $00, $00, $02, Script_06c_4416
	objects_end

Script_06c_440e::
	stext text_6c_743e
	end

Script_06c_4412::
	stext text_6c_741a
	end

Script_06c_4416::
	stext text_6c_7476
	end

Script_06c_441a::
	warp6c
	setplayerchar $00
	face FACE_UP
	setmap MAP_G6_20, $00
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	stext text_6c_702f
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_703b
	stext text_6c_7045
	stext text_6c_705c
	stext text_6c_706d
	stext text_6c_712a
	stext text_6c_7134
	stext text_6c_717e
	stext text_6c_7197
	stext text_6c_7204
	emote  0, EMOTE_TEAR
	emote  3, EMOTE_TEAR
	emote  4, EMOTE_TEAR
	delay $03, $20
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_7210
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	spriteface  4, FACE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	spritewalk  4, MOVE_UP
	clearobject $04
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	setbit wEventFlags + 24, $03
	end
