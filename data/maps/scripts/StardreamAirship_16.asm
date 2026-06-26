StardreamAirship_16_ObjectEvents::
	object_event $12,  1,  5, 0, $00, $00, $00, $00, Script_066_4172
	object_event $25, 16,  3, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $22, 20,  3, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_41d1::
	face FACE_UP
	stext text_66_4d8e
	checkbit wEventFlags + 3, $03, Script_066_41de
	scr_37
	end

Script_066_41de::
	end

Script_066_41df::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_66_40a4
	checkbit wEventFlags + 4, $01, Script_066_41f0
	scr_35 $09
	end

Script_066_41f0::
	end

Script_066_41f1::
	end

Script_066_41f2::
	end
