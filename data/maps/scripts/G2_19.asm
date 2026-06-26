G2_19_ObjectEvents::

HealingCenter_g221_ObjectEvents::
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_012_4982
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_012_4986
	objects_end

Script_012_4982::
	stext text_12_7ebe
	end

Script_012_4986::
	stext text_12_7ed6
	end

Script_012_498a::
	face FACE_UP
	stext text_12_7ebe
	checkbit wEventFlags + 3, $03, Script_012_4997
	scr_37
	end

Script_012_4997::
	end

Script_012_4998::
	face FACE_UP
	stext text_12_7ed6
	checkbit wEventFlags + 3, $03, Script_012_49a5
	townmusicanim
	end

Script_012_49a5::
	end
