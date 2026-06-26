G4_52_ObjectEvents::
	object_event $69,  8,  3, 0, $00, $00, $00, $00, Script_058_4232
	object_event $69,  6,  7, 0, $00, $00, $00, $01, Script_058_4232
	object_event $69,  5,  5, 0, $00, $00, $00, $02, Script_058_4232
	objects_end

TravelingShip_19_ObjectEvents::
	object_event $69,  8,  3, wEventFlags + 11, $01, $00, $00, $00, Script_058_4383
	object_event $69,  6,  7, wEventFlags + 11, $01, $00, $00, $01, Script_058_4383
	object_event $69,  5,  5, wEventFlags + 11, $01, $00, $00, $02, Script_058_4383
	objects_end

Script_058_4232::
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_G4_52, $01
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_536a
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5377
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_538c
	stext text_58_53a5
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_53c0
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_53d7

Script_058_42a4::
	warpmode GAMEMODE_MICE_MINIGAME, $52, $01
	checkbit wEventFlags + 11, $01, Script_058_4320
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_53ee
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_53fd
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_540a
	stext text_58_5425
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_544c
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_5463
	farjump Script_058_42a4
	end

Script_058_4320::
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_5477
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5485
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_548e
	stext text_58_54a7
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	emote  0, EMOTE_HEART
	delay $03, $20
	stext text_58_54cf
	spriteface  2, FACE_DOWN
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	end

Script_058_4383::
	checkbit wEventFlags + 11, $00, Script_058_438d
	textface text_58_535f
	end

Script_058_438d::
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_TRAVELING_SHIP_19, $01
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_536a
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5377
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_538c
	stext text_58_53a5
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_53c0
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_53d7

Script_058_43ff::
	warpmode GAMEMODE_MICE_MINIGAME, $19, $01
	checkbit wEventFlags + 11, $01, Script_058_447b
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_53ee
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_53fd
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_540a
	stext text_58_5425
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_58_544c
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	stext text_58_5463
	farjump Script_058_43ff
	end

Script_058_447b::
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	spriteface  5, FACE_RIGHT
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_UP
	stext text_58_5477
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_UP
	stext text_58_5485
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	emote  0, EMOTE_TEAR
	delay $03, $20
	face FACE_UP
	spriteface  2, FACE_DOWN
	stext text_58_548e
	stext text_58_54a7
	spriteface  5, FACE_LEFT
	objmove $05, MovementData_058_67e4
	clearobject $05
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $03, $04, $f0, $00
	objmove $04, MovementData_058_679a
	clearobject $04
	clearobject $03
	emote  0, EMOTE_HEART
	delay $03, $20
	stext text_58_54cf
	spriteface  2, FACE_DOWN
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	setbit wEventFlags + 24, $01
	end

G4_52_ObjectEvents2::
	object_event $06,  8,  6, 0, $00, $00, $00, $00, Script_058_40e9
	object_event $69,  6,  6, 0, $00, $00, $00, $01, Script_058_40e9
	object_event $69,  6,  7, 0, $00, $00, $00, $02, Script_058_40e9
	object_event $69,  6,  8, 0, $00, $00, $00, $03, Script_058_40e9
	objects_end

TravelingShip_19_ObjectEvents2::
	object_event $06,  8,  6, wEventFlags + 24, $01, $00, $00, $00, Script_058_40e9
	object_event $69,  6,  6, wEventFlags + 24, $01, $00, $00, $01, Script_058_40e9
	object_event $69,  6,  7, wEventFlags + 24, $01, $00, $00, $02, Script_058_40e9
	object_event $69,  6,  8, wEventFlags + 24, $01, $00, $00, $03, Script_058_40e9
	objects_end
