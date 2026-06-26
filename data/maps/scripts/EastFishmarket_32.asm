EastFishmarket_32_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_055_5316
	objects_end

Script_055_5316::
	textface text_55_53ae
	end

Script_055_531a::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_55_53ae
	checkbit wEventFlags + 4, $01, Script_055_532b
	scr_35 $05
	end

Script_055_532b::
	end
