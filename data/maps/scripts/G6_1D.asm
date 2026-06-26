G6_1D_ObjectEvents::
	object_event $22,  8,  4, 0, $00, $00, $00, $00, Script_06c_43aa
	objects_end

Script_06c_43aa::
	textface text_6c_40a4
	end

Script_06c_43ae::
	face FACE_UP
	spriteface  2, FACE_DOWN
	farjump Script_06c_43bd
	end

Script_06c_43b8::
	face FACE_RIGHT
	spriteface  2, FACE_LEFT

Script_06c_43bd::
	stext text_6c_40a4
	checkbit wEventFlags + 4, $01, Script_06c_43c9
	scr_35 $0c
	end

Script_06c_43c9::
	end
