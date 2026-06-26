ObjectEvents_00e_49c5::
	object_event $15,  9,  3, 0, $00, $00, $06, $00, Script_00e_49d1
	objects_end

Script_00e_49d1::
	checkbit wEventFlags + 1, $03, Script_00e_49db
	textface text_0e_6515
	end

Script_00e_49db::
	textface text_0e_68f4
	end
