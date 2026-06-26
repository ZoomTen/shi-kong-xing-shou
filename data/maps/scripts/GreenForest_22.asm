GreenForest_22_ObjectEvents::
	object_event $40,  4,  5, 0, $00, $00, $00, $00, Script_04f_49cb
	object_event $3a,  7,  6, 0, $00, $00, $00, $01, Script_04f_49e0
	objects_end

GreenForest_23_ObjectEvents::
	object_event $3c,  2,  7, 0, $00, $00, $00, $00, Script_04f_4678
	object_event $3c,  5,  5, 0, $00, $00, $00, $01, Script_04f_4684
	object_event $3c,  7,  6, 0, $00, $00, $00, $02, Script_04f_4690
	objects_end

Script_04f_4678::
	ifcharindex $03, Script_04f_4680
	textface text_4f_6267
	end

Script_04f_4680::
	textface text_4f_6922
	end

Script_04f_4684::
	ifcharindex $03, Script_04f_468c
	textface text_4f_6274
	end

Script_04f_468c::
	textface text_4f_6950
	end

Script_04f_4690::
	ifcharindex $03, Script_04f_4698
	textface text_4f_6267
	end

Script_04f_4698::
	textface text_4f_69af
	end
