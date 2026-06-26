LifeValley_ObjectEvents::
	object_event $20,  7, 19, wEventFlags + 11, $04, $00, $00, $00, Script_058_4838
	objects_end

Script_058_4838::
	ifcharindex $05, Script_058_4840
	textface text_58_5a0c
	end

Script_058_4840::
	checkbit wEventFlags + 11, $04, Script_058_4864
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	spriteface 2, FACE_DOWN
	stext text_58_5a50
	stext text_58_5a7d
	spriteface 2, FACE_RIGHT
	spritewalk 2, MOVE_RIGHT
	spriteface 2, FACE_DOWN
	setbit wEventFlags + 11, $04
	end

Script_058_4864::
	textface text_58_5a7d
	end
