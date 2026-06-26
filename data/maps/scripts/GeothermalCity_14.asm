GeothermalCity_14_ObjectEvents::
	object_event $23,  2, 15, 0, $00, $00, $0a, $00, Script_058_458f
	object_event $24,  8,  6, 0, $00, $00, $06, $01, Script_058_45db
	object_event $14, 13, 21, wEventFlags + 11, $05, $01, $00, $00, Script_058_457f
	object_event $13, 14, 15, wEventFlags + 11, $05, $01, $05, $01, Script_058_4583
	object_event $1a, 16,  7, wEventFlags + 11, $05, $01, $06, $02, Script_058_4587
	object_event $16,  6, 14, wEventFlags + 11, $05, $01, $0b, $03, Script_058_458b
	objects_end

Script_058_457f::
	textface text_58_5f77
	end

Script_058_4583::
	textface text_58_5fc7
	end

Script_058_4587::
	textface text_58_6003
	end

Script_058_458b::
	textface text_58_602b
	end

Script_058_458f::
	checkbit wEventFlags + 10, $06, Script_058_4599
	textface text_58_4a9c
	end

Script_058_4599::
	checkbit wEventFlags + 10, $07, Script_058_45b9
	textface text_58_4f15
	emote 2, EMOTE_ANGER
	delay $03, $20
	stext text_58_4f70
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_4f88
	setbit wEventFlags + 10, $07
	end

Script_058_45b9::
	checkbit wEventFlags + 11, $05, Script_058_45c3
	textface text_58_4ff1
	end

Script_058_45c3::
	checkbit wEventFlags + 11, $06, Script_058_45d7
	textface text_58_5ea9
	stext text_58_5ef8
	scr_48 $00, $17
	setbit wEventFlags + 11, $06
	end

Script_058_45d7::
	textface text_58_5f09
	end

Script_058_45db::
	checkbit wEventFlags + 11, $05, Script_058_45e5
	textface text_58_4b04
	end

Script_058_45e5::
	textface text_58_5f40
	end
