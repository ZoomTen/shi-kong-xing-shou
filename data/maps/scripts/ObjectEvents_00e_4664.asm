ObjectEvents_00e_4664::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_00e_467b
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_00e_467f
	objects_end

Script_00e_467b::
	stext text_0e_5bdd
	end

Script_00e_467f::
	stext text_0e_5bf5
	end

Script_00e_4683::
	face FACE_UP
	stext text_0e_5bdd
	checkbit wEventFlags + 3, $03, Script_00e_4690
	scr_37
	end

Script_00e_4690::
	end

Script_00e_4691::
	face FACE_UP
	stext text_0e_5bf5
	checkbit wEventFlags + 3, $03, Script_00e_469e
	townmusicanim
	end

Script_00e_469e::
	end
