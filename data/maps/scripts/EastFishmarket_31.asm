EastFishmarket_31_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_055_5343
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_055_5347
	objects_end

Script_055_5343::
	stext text_55_5367
	end

Script_055_5347::
	stext text_55_537f
	end

Script_055_534b::
	face FACE_UP
	stext text_55_5367
	checkbit wEventFlags + 3, $03, Script_055_5358
	scr_37
	end

Script_055_5358::
	end

Script_055_5359::
	face FACE_UP
	stext text_55_537f
	checkbit wEventFlags + 3, $03, Script_055_5366
	townmusicanim
	end

Script_055_5366::
	end
