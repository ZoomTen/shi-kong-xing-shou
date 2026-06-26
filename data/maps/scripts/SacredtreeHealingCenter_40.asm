SacredtreeHealingCenter_40_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_059_403e
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_059_4042
	objects_end

Script_059_403e::
	stext text_59_4062
	end

Script_059_4042::
	stext text_59_407a
	end

Script_059_4046::
	face FACE_UP
	stext text_59_4062
	checkbit wEventFlags + 3, $03, Script_059_4053
	scr_37
	end

Script_059_4053::
	end

Script_059_4054::
	face FACE_UP
	stext text_59_407a
	checkbit wEventFlags + 3, $03, Script_059_4061
	townmusicanim
	end

Script_059_4061::
	end
