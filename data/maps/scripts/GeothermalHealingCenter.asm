GeothermalHealingCenter_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_058_403a
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_058_403e
	objects_end

Script_058_403a::
	stext text_58_405e
	end

Script_058_403e::
	stext text_58_4076
	end

Script_058_4042::
	face FACE_UP
	stext text_58_405e
	checkbit wEventFlags + 3, $03, Script_058_404f
	scr_37
	end

Script_058_404f::
	end

Script_058_4050::
	face FACE_UP
	stext text_58_4076
	checkbit wEventFlags + 3, $03, Script_058_405d
	townmusicanim
	end

Script_058_405d::
	end
