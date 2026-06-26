StardreamHealingCenter_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_066_4039
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_066_403d
	objects_end

Script_066_4039::
	stext text_66_405d
	end

Script_066_403d::
	stext text_66_4075
	end

Script_066_4041::
	face FACE_UP
	stext text_66_405d
	checkbit wEventFlags + 3, $03, Script_066_404e
	scr_37
	end

Script_066_404e::
	end

Script_066_404f::
	face FACE_UP
	stext text_66_4075
	checkbit wEventFlags + 3, $03, Script_066_405c
	townmusicanim
	end

Script_066_405c::
	end
