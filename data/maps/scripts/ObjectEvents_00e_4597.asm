ObjectEvents_00e_4597::
	object_event $12,  6,  5, 0, $00, $00, $0b, $00, Script_00e_45ae
	object_event $1d,  6,  3, 0, $00, $00, $00, $01, Script_00e_45bc
	objects_end

Script_00e_45ae::
	checkbit wEventFlags + 1, $05, Script_00e_45b8
	textface text_0e_592f
	end

Script_00e_45b8::
	textface text_0e_6dc7
	end

Script_00e_45bc::
	textface text_0e_5992
	end
