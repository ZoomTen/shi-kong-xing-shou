EastFishmarket_47_ObjectEvents::
	object_event $1f,  3,  3, 0, $00, $00, $00, $00, Script_05c_42a0
	object_event $1e,  5,  5, 0, $00, $00, $06, $01, Script_05c_42a4
	objects_end

Script_05c_42a0::
	textface text_5c_4eb8
	end

Script_05c_42a4::
	checkbit wEventFlags + 11, $07, Script_05c_42c3
	textface text_5c_4ef8
	spriteface  2, FACE_DOWN
	stext text_5c_4f3e
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_4f5e
	emote  0, EMOTE_TEAR
	delay $03, $20
	end

Script_05c_42c3::
	checkbit wEventFlags + 12, $00, Script_05c_42da
	textface text_5c_4f73
	stext text_5c_4fd9
	listdec $02, $13
	scr_48 $00, $27
	setbit wEventFlags + 12, $00
	end

Script_05c_42da::
	textface text_5c_4fe9
	end
