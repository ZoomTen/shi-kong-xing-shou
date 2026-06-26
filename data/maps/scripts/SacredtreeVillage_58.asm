SacredtreeVillage_58_ObjectEvents::
	object_event $1e,  8,  4, 0, $00, $00, $00, $00, Script_05a_4358
	object_event $21,  3,  3, 0, $00, $00, $0b, $01, Script_05a_435c
	objects_end

Script_05a_4358::
	textface text_5a_5bb6
	end

Script_05a_435c::
	textface text_5a_5c0c
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_5c61
	end
