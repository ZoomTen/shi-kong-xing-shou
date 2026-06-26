ObjectEvents_06c_4eae::
	object_event $5a, 11, 13, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end

Script_06c_4eba::
	checkbit wEventFlags + 19, $01, Script_06c_4ed0
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end

Script_06c_4ed0::
	setmap MAP_G6_03, $01
	end2

Script_06c_4ed4::
	checkbit wEventFlags + 19, $02, Script_06c_4ede

Script_06c_4eda::
	setmap MAP_BAAL_CAPITAL_0C, $01
	end

Script_06c_4ede::
	checkbit wEventFlags + 19, $01, Script_06c_4eda
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_5fef
	stext text_6c_6009
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_602a
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_6036
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_UP
	setbit wEventFlags + 19, $01
	end

Script_06c_4f14::
	stext text_6c_61ec
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	end

Script_06c_4f23::
	checkbit wEventFlags + 19, $03, Script_06c_4f39
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end

Script_06c_4f39::
	setplayerchar $00
	setmap MAP_G6_0D, $03
	objmove $02, MovementData_06c_79a6
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $03
	spriteface  2, FACE_LEFT
	stext text_6c_621e
	setmap MAP_G6_2C, $00
	delay $03, $20
	face FACE_LEFT
	setmap MAP_G6_10, $01
	spriteface  2, FACE_RIGHT
	stext text_6c_624d
	stext text_6c_627c
	stext text_6c_62eb
	stext text_6c_6317
	stext text_6c_635b
	spriteface  2, FACE_LEFT
	stext text_6c_63ca
	stext text_6c_63f4
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_6440
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_6470
	stext text_6c_64a5
	stext text_6c_64bc
	scr_62 $01, $00
	scr_62 $02, $00
	scr_62 $03, $00
	scr_62 $04, $00
	scr_62 $05, $00
	scr_62 $06, $00
	scr_62 $07, $00
	end

unk_06c_4f9e::
	object_event $59,  3,  9, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end
