G6_29_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_06c_4039
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_06c_403d
	objects_end

Script_06c_4039::
	stext text_6c_405d
	end

Script_06c_403d::
	stext text_6c_4075
	end

Script_06c_4041::
	face FACE_UP
	stext text_6c_405d
	checkbit wEventFlags + 3, $03, Script_06c_404e
	scr_37
	end

Script_06c_404e::
	end

Script_06c_404f::
	face FACE_UP
	stext text_6c_4075
	checkbit wEventFlags + 3, $03, Script_06c_405c
	townmusicanim
	end

Script_06c_405c::
	end
