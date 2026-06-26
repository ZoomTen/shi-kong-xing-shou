GreenForestP13_ObjectEvents::
	object_event $3c, 20,  1, wEventFlags + 6, $00, $00, $00, $00, Script_04f_4c8c
	objects_end

Script_04f_4c8c::
	ifcharindex $03, Script_04f_4c94
	textface text_4f_61ed
	end

Script_04f_4c94::
	checkbit wEventFlags + 6, $00, Script_04f_4cbb
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_4f_66cb
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_6707
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	setbit wEventFlags + 6, $00
	end

Script_04f_4cbb::
	textface text_4f_6734
	end

ObjSprite_4f_4cbf::
	object_event $48,  5,  3, 0, $00, $00, $00, $01, Script_04f_4031
	objects_end
