PresaleHouse_1f_ObjectEvents::
	object_event $20,  4,  3, 0, $00, $00, $00, $00, Script_066_43dd
	object_event $19,  5,  5, wEventFlags + 17, $02, $00, $00, $01, Script_066_4444
	objects_end

ObjSprite_66_43d1::
	object_event $19,  4,  4, 0, $00, $00, $00, $01, Script_066_4440
	objects_end

Script_066_43dd::
	checkbit wEventFlags + 17, $02, Script_066_43e7
	textface text_66_5407
	end

Script_066_43e7::
	checkbit wEventFlags + 17, $04, Script_066_43f5
	textface text_66_66f2
	setbit wEventFlags + 17, $03
	end

Script_066_43f5::
	checkbit wEventFlags + 17, $05, Script_066_442c
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	clearplayerpos
	loadobjsprite ObjSprite_66_43d1
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_UP
	stext text_66_69ae
	stext text_66_69c7
	emote  0, EMOTE_TEAR
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_66_6a18
	stext text_66_6a9c
	giveitem ITEMNAMECAT_KEY, KEYITEM_1d
	setbit wEventFlags + 17, $05
	end

Script_066_442c::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_6aab
	stext text_66_6ade
	stext text_66_6b01
	stext text_66_6b09
	end

Script_066_4440::
	textface text_66_6b09
	end

Script_066_4444::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5447
	spriteface  2, FACE_DOWN
	stext text_66_546d
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_549d
	emote  2, EMOTE_TEAR
	delay $03, $20
	end

G5_27_ObjectEvents4::
	object_event $19,  6,  6, wEventFlags + 17, $04, $00, $00, $00, Script_066_41f2
	objects_end

G5_27_ObjectEvents3::
	object_event $73,  6,  6, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end

G5_27_ObjectEvents2::
	object_event $73,  4,  8, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end

Script_066_448e::
	checkbit wEventFlags + 17, $03, Script_066_4498

Script_066_4494::
	setmap MAP_G5_27, $00
	end

Script_066_4498::
	checkbit wEventFlags + 17, $04, Script_066_4494
	setplayerchar $00
	setmap MAP_G5_27, $01
	setattach $01, $00, $f0, $00
	objmove $00, MovementData_066_7de0
	clearattach $00
	move MovementData_OneDown
	stext text_66_67b0
	face $05
	objmove $00, MovementData_066_7e09
	face FACE_DOWN
	setmap MAP_G5_27, $02
	spriteface  2, FACE_UP
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_67c3
	stext text_66_67f8
	warpmode GAMEMODE_BEACH_CUTSCENE, $27, $03
	spriteface  2, FACE_LEFT
	delay $03, $10
	spriteface  2, FACE_RIGHT
	delay $03, $10
	spriteface  2, FACE_UP
	stext text_66_68c0
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_68e9
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_6924
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_693d
	emote  0, EMOTE_TEAR
	delay $03, $20
	clearplayerpos
	spritewalk  2, MOVE_UP
	clearobject $02
	setbit wEventFlags + 17, $04
	end
