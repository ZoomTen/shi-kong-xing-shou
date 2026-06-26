Airport_ObjectEvents::
	object_event $35,  6,  5, wEventFlags + 6, $06, $01, $00, $00, Script_04e_45b8
	objects_end

Script_04e_45b8::
	walkpath
	setplayerchar $00
	face FACE_UP
	setmap MAP_AIRPORT, $01
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	stext text_4e_5d75
	stext text_4e_5d8c
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_4e_5dac
	stext text_4e_5dd6
	stext text_4e_5de3
	emote  4, EMOTE_QUESTION
	delay $03, $20
	stext text_4e_5e1b
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  2, FACE_DOWN
	stext text_4e_5e2b
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_RIGHT
	setattach $04, $03, $10, $00
	objmove $03, MovementData_04e_61db
	clearobject $03
	clearobject $04
	spriteface  2, FACE_DOWN
	face FACE_UP
	stext text_4e_5e5e
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	spriteface  2, FACE_RIGHT
	setattach $01, $00, $10, $00
	objmove $00, MovementData_04e_61db
	clearobject $00
	clearobject $01
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	stext text_4e_5e75
	warpmode GAMEMODE_AIRPORT_CUTSCENE1, $0a, $00
	end

INCLUDE "engine/movie/airport.asm"
