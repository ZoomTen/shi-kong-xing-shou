TravelingShip_51_ObjectEvents::
	object_event $31, 11, 3, 0, $00, $00, $00, $00, Script_058_4a60
	object_event $51, 8, 4, 0, $00, $00, $00, $01, Script_058_4a5c
	objects_end

Script_058_4a5c::
	textface text_58_644a
	end

Script_058_4a60::
	checkbit wEventFlags + 12, $02, Script_058_4a80
	textface text_58_6475
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_64a8
	checkbit wEventFlags + 3, $03, Script_058_4a84
	stext text_58_6534
	setbit wEventFlags + 12, $02
	end

Script_058_4a80::
	textface text_58_6648
	end

Script_058_4a84::
	stext text_58_6503
	end
