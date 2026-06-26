TechHealingCenter_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_00f_43ae
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_00f_43b2
	objects_end

Script_00f_43ae::
	stext text_0f_4efb
	end

Script_00f_43b2::
	stext text_0f_4f13
	end

Script_00f_43b6::
	face FACE_UP
	stext text_0f_4efb
	checkbit wEventFlags + 3, $03, Script_00f_43c3
	scr_37
	end

Script_00f_43c3::
	end

Script_00f_43c4::
	face FACE_UP
	stext text_0f_4f13
	checkbit wEventFlags + 3, $03, Script_00f_43d1
	townmusicanim
	end

Script_00f_43d1::
	end
