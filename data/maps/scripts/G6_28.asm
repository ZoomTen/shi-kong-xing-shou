G6_28_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_06c_400c
	objects_end

Script_06c_400c::
	textface text_6c_40a4
	end

Script_06c_4010::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_6c_40a4
	checkbit wEventFlags + 4, $01, Script_06c_4021
	scr_35 $0b
	end

Script_06c_4021::
	end
