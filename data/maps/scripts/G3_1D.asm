G3_1D_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_04f_4049
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_04f_404d
	objects_end

Script_04f_4049::
	stext text_4f_407f
	end

Script_04f_404d::
	stext text_4f_4097
	end

Script_04f_4051::
	face FACE_UP
	stext text_4f_407f
	checkbit wEventFlags + 3, $03, .skip
	scr_37
	end
.skip
	end

Script_04f_405f::
	face FACE_UP
	stext text_4f_4097
	checkbit wEventFlags + 3, $03, .skip
	townmusicanim
	end
.skip
	end
