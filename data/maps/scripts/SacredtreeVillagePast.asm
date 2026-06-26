SacredtreeVillagePast_ObjectEvents::
	object_event $52, 6, 3, wEventFlags + 14, $00, $00, $00, $00, Script_05a_41c9
	objects_end

Script_05a_41c9::
	checkbit wEventFlags + 13, $00, Script_05a_41e0
	textface text_5a_563f
	stext text_5a_56c3
	stext text_5a_56e8
	stext text_5a_570a
	setbit wEventFlags + 13, $00
	end

Script_05a_41e0::
	checkbit wEventFlags + 13, $02, Script_05a_41ea
	textface text_5a_5806
	end

Script_05a_41ea::
	checkbit wEventFlags + 13, $06, Script_05a_421c
	textface text_5a_637c
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_63ee
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext text_5a_645e
	stext text_5a_646e
	stext text_5a_6502
	stext text_5a_6520
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext text_5a_65a6
	setbit wEventFlags + 13, $06
	end

Script_05a_421c::
	checkbit wEventFlags + 13, $07, Script_05a_4226
	textface text_5a_65dd
	end

Script_05a_4226::
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_67bc
	face FACE_LEFT
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_RIGHT
	stext text_5a_6829
	spriteface 2, FACE_DOWN
	objmove $02, MovementData_05a_77ab
	clearobject $02
	setbit wEventFlags + 14, $00
	end
