StardreamShop_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_066_400c
	objects_end

Script_066_400c::
	textface text_66_40a4
	end

Script_066_4010::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_66_40a4
	checkbit wEventFlags + 4, $01, Script_066_4021
	scr_35 $0a
	end

Script_066_4021::
	end
