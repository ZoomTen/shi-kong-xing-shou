GeothermalCity_37_ObjectEvents::
	object_event $15,  4,  3, wEventFlags + 11, $05, $01, $00, $00, Script_058_463e
	object_event $1a,  7,  3, wEventFlags + 11, $05, $01, $0a, $01, Script_058_4642
	objects_end

Script_058_463e::
	textface text_58_6246
	end

Script_058_4642::
	checkbit wEventFlags + 11, $07, Script_058_4659
	textface text_58_6277
	stext text_58_62c1
	stext text_58_6310
	scr_48 $02, $13
	setbit wEventFlags + 11, $07
	end

Script_058_4659::
	textface text_58_6321
	end

GeothermalCity_36_ObjectEvents2::
	object_event $6d,  8,  3, 0, $00, $00, $00, $00, Script_058_46fd
	objects_end
