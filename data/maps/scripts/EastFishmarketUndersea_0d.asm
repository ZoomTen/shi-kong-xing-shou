EastFishmarketUndersea_0d_ObjectEvents::
	object_event $53, 16,  4, 0, $00, $00, $0a, $00, Script_055_5957
	object_event $54,  9,  2, 0, $00, $00, $06, $01, Script_055_5968
	object_event $53,  2,  6, 0, $00, $00, $00, $02, Script_055_5979
	object_event $55,  7, 17, 0, $00, $00, $0b, $03, Script_055_598a
	object_event $54,  9, 11, 0, $00, $00, $09, $04, Script_055_59a5
	object_event $55,  6,  8, wEventFlags + 8, $02, $00, $00, $00, Script_055_59f7
	object_event $55,  5,  8, wEventFlags + 8, $02, $01, $00, $00, Script_055_5a03
	object_event $53, 16, 15, 0, $00, $00, $00, $01, Script_055_59c0
	objects_end

EastFishmarketUndersea_12_ObjectEvents::
	object_event $55,  4,  3, 0, $00, $00, $0b, $00, Script_055_5a0f
	objects_end

EastFishmarketUndersea_11_ObjectEvents::
	object_event $4a,  4,  4, wEventFlags + 8, $03, $00, $00, $00, Script_055_55af
	objects_end

Script_055_55af::
	ifcharindex $00, Script_055_55bd
	emote $02, $03
	delay $03, $20
	textface text_55_68c8
	end

Script_055_55bd::
	spriteface  2, FACE_DOWN
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_55_6894
	emote $00, $03
	delay $03, $20
	stext text_55_68d1
	stext text_55_68f6
	emote $00, $03
	delay $03, $20
	stext text_55_6931
	stext text_55_693d
	emote $02, $00
	delay $03, $20
	stext text_55_697d
	stext text_55_6997
	face FACE_RIGHT
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_LEFT
	stext text_55_69a5
	stext text_55_69eb
	stext text_55_6a12
	stext text_55_6a3e
	stext text_55_6a75
	stext text_55_6b37
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_055_7c94
	clearobject $02
	setbit wEventFlags + 8, $03
	end
