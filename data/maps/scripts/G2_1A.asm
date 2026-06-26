G2_1A_ObjectEvents::

Shop_g222_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_012_49b2
	objects_end

Script_012_49b2::
	textface text_12_7f05
	end

Script_012_49b6::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_7f05
	checkbit wEventFlags + 4, $01, Script_012_49c7
	scr_35 $01
	end

Script_012_49c7::
	end

Script_012_49c8::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_7f05
	checkbit wEventFlags + 4, $01, Script_012_49c7
	scr_35 $02
	end

Script_012_49d9::
	checkbit wEventFlags + 4, $02, Script_012_49f8
	stext text_12_5a30
	checkbit wEventFlags + 3, $02, Script_012_49e9
	end

Script_012_49e9::
	checkbit wEventFlags + 4, $07, Script_012_49f8
	emote $00, $03
	delay $03, $20
	stext text_12_5abd

Script_012_49f8::
	end
