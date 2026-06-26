EastFishmarket_46_ObjectEvents::
	object_event $18,  5,  5, 0, $00, $00, $00, $00, Script_05c_426b
	object_event $1d,  8,  5, 0, $00, $00, $00, $01, Script_05c_4277
	objects_end

Script_05c_426b::
	textface text_5c_4e2b
	ifcharindex $04, Script_05c_4273
	end

Script_05c_4273::
	stext text_5c_4e60
	end

Script_05c_4277::
	textface text_5c_4e68
	ifcharindex $04, Script_05c_427f
	end

Script_05c_427f::
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_4ea2
	end
