SacredtreeHealingCenter_5c_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_05a_403a
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_05a_403e
	objects_end

Script_05a_403a::
	stext text_5a_405e
	end

Script_05a_403e::
	stext text_5a_4076
	end

Script_05a_4042::
	face FACE_UP
	stext text_5a_405e
	checkbit wEventFlags + 3, $03, Script_05a_404f
	scr_37
	end

Script_05a_404f::
	end

Script_05a_4050::
	face FACE_UP
	stext text_5a_4076
	checkbit wEventFlags + 3, $03, Script_05a_405d
	townmusicanim
	end

Script_05a_405d::
	end
