G6_1C_ObjectEvents::
	object_event $25,  3,  4, 0, $00, $00, $00, $00, Script_06c_46ce
	object_event $25,  8,  4, 0, $00, $00, $00, $01, Script_06c_46d2
	objects_end

Script_06c_46ce::
	stext text_6c_405d
	end

Script_06c_46d2::
	stext text_6c_4075
	end

Script_06c_46d6::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	farjump Script_06c_46e2
	end

Script_06c_46e0::
	face FACE_UP

Script_06c_46e2::
	stext text_6c_405d
	checkbit wEventFlags + 3, $03, Script_06c_46ed
	scr_37
	end

Script_06c_46ed::
	end

Script_06c_46ee::
	face FACE_RIGHT
	spriteface  3, FACE_LEFT
	farjump Script_06c_46fa
	end

Script_06c_46f8::
	face FACE_UP

Script_06c_46fa::
	stext text_6c_4075
	checkbit wEventFlags + 3, $03, Script_06c_4705
	townmusicanim
	end

Script_06c_4705::
	end

Script_06c_4706::
	end
