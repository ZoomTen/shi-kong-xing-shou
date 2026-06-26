TechShop_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_00f_4381
	objects_end

Script_00f_4381::
	textface text_0f_4ebe
	end

Script_00f_4385::
	face FACE_LEFT
	spriteface $02, $03
	stext text_0f_4ebe
	checkbit wEventFlags + 4, $01, Script_00f_4396
	scr_35 $00
	end

Script_00f_4396::
	end
