StardreamCity_1e_ObjectEvents::
	object_event $1d,  5,  3, 0, $00, $00, $00, $00, Script_066_436b
	object_event $1a,  6,  6, 0, $00, $00, $00, $01, Script_066_4358
	objects_end

Script_066_4358::
	textface text_66_537a
	spriteface  2, FACE_DOWN
	emote  2, EMOTE_ANGER
	delay $03, $20
	stext text_66_53b1
	stext text_66_53c8
	end

Script_066_436b::
	checkbit wEventFlags + 15, $01, Script_066_4375
	textface text_66_5313
	end

Script_066_4375::
	checkbit wEventFlags + 17, $07, Script_066_4383
	textface text_66_6f3e
	setbit wEventFlags + 17, $07
	end

Script_066_4383::
	countflags10 $06, $8b, $43
	textface text_66_6fa2
	end

Script_066_438b::
	checkbit wEventFlags + 16, $07, Script_066_439f
	textface text_66_6ffe
	stext text_66_7044
	scr_48 $02, $22
	setbit wEventFlags + 16, $07
	end

Script_066_439f::
	textface text_66_7055
	end

PresaleHouse_1f_ObjectEvents2::
	object_event $20,  4,  3, 0, $00, $00, $00, $00, Script_066_43dd
	object_event $19,  5,  5, 0, $00, $00, $00, $01, Script_066_4440
	objects_end
