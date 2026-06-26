ObjectEvents_00f_4348::
	object_event $16,  5,  5, 0, $00, $00, $00, $00, Script_00f_435f
	object_event $17,  9,  4, 0, $00, $00, $00, $01, Script_00f_4371
	objects_end

Script_00f_435f::
	checkbit wEventFlags + 2, $07, Script_00f_436d
	textface text_0f_4e54
	setbit wEventFlags + 2, $07
	end

Script_00f_436d::
	textface text_0f_4e9b
	end

Script_00f_4371::
	textface text_0f_4eae
	end
