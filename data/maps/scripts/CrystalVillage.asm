CrystalVillage_ObjectEvents::
	object_event $1e, 13, 16, 0, $00, $00, $0b, $01, Script_00e_495c
	object_event $12, 19,  8, 0, $00, $00, $06, $00, Script_00e_4960
	object_event $14, 16, 11, 0, $00, $00, $05, $02, Script_00e_496e
	object_event $1d,  8, 10, 0, $00, $00, $08, $03, Script_00e_497c
	object_event $19, 10, 15, 0, $00, $00, $07, $04, Script_00e_4980
	object_event $1c,  6,  5, 0, $00, $00, $06, $00, Script_00e_498e
	object_event $20,  1, 13, wEventFlags + 1, $00, $01, $00, $01, Script_00e_4992
	object_event $20, 12,  1, wEventFlags + 1, $02, $00, $00, $02, Script_00e_49a7
	objects_end

Script_00e_495c::
	textface text_0e_6324
	end

Script_00e_4960::
	checkbit wEventFlags + 1, $03, Script_00e_496a
	textface text_0e_6336
	end

Script_00e_496a::
	textface text_0e_6832
	end

Script_00e_496e::
	checkbit wEventFlags + 1, $03, Script_00e_4978
	textface text_0e_638b
	end

Script_00e_4978::
	textface text_0e_6882
	end

Script_00e_497c::
	textface text_0e_63de
	end

Script_00e_4980::
	checkbit wEventFlags + 1, $03, Script_00e_498a
	textface text_0e_6434
	end

Script_00e_498a::
	textface text_0e_68b3
	end

Script_00e_498e::
	textface text_0e_6466
	end

Script_00e_4992::
	checkbit wEventFlags + 1, $01, Script_00e_49a3
	textface text_0e_64ad
	stext text_0e_64f7
	setbit wEventFlags + 1, $01
	end

Script_00e_49a3::
	textface text_0e_64f7
	end

Script_00e_49a7::
	textface text_0e_6607
	end

Script_00e_49ab::
	checkbit wEventFlags + 1, $02, Script_00e_49c1
	textface text_0e_6607
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spritewalk $01, $02
	spriteface $01, $00
	end

Script_00e_49c1::
	setmap MAP_CRYSTAL_MINES_P1_2, $00
	end
