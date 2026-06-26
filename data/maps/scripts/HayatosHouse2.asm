HayatosHouse2_ObjectEvents::
	object_event $22,  5,  6, 0, $00, $00, $06, $00, Script_00e_41b4
	object_event $26,  8,  3, 0, $00, $00, $00, $01, Script_00e_41b8
	objects_end

Script_00e_41b4::
	textface text_0e_4fa5
	end

Script_00e_41b8::
	checkbit wEventFlags, $05, .script_00e_41c6
	textface text_0e_5023
	setbit wEventFlags, $05
	end

.script_00e_41c6
	textface text_0e_50f6
	end
