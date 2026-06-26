ObjectEvents_00e_4642::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_00e_464e
	objects_end

Script_00e_464e::
	stext text_0e_5b91
	end

Script_00e_4652::
	face FACE_LEFT
	spriteface $02, $03
	stext text_0e_5b91
	checkbit wEventFlags + 4, $01, Script_00e_4663
	scr_35 $00
	end

Script_00e_4663::
	end
