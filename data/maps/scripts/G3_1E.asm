G3_1E_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_04f_401c
	objects_end

Script_04f_401c::
	textface text_4f_406d
	end

Script_04f_4020::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_4f_406d
	checkbit wEventFlags + 4, $01, Script_04f_4031
	scr_35 $03
	end

Script_04f_4031::
	end
