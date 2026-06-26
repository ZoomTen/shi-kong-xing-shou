EastFishmarketHealingCenter_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_05c_409a
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_05c_409e
	objects_end

Script_05c_409a::
	stext text_5c_40be
	end

Script_05c_409e::
	stext text_5c_40d6
	end

Script_05c_40a2::
	face FACE_UP
	stext text_5c_40be
	checkbit wEventFlags + 3, $03, Script_05c_40af
	scr_37
	end

Script_05c_40af::
	end

Script_05c_40b0::
	face FACE_UP
	stext text_5c_40d6
	checkbit wEventFlags + 3, $03, Script_05c_40bd
	townmusicanim
	end

Script_05c_40bd::
	end
