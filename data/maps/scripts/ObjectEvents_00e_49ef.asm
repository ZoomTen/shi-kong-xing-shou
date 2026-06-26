ObjectEvents_00e_49ef::
	object_event $1e,  5,  5, 0, $00, $00, $09, $00, Script_00e_49fb
	objects_end

Script_00e_49fb::
	checkbit wEventFlags + 1, $03, Script_00e_4a16
	textface text_0e_65b8
	ifcharindex $01, Script_00e_4a09
	end

Script_00e_4a09::
	emote $00, $00
	delay $03, $20
	stext text_0e_65de
	stext text_0e_65fc
	end

Script_00e_4a16::
	textface text_0e_6923
	end
