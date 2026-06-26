StardreamHospital_15_ObjectEvents::
	object_event $6f,  5,  3, 0, $00, $00, $00, $00, Script_066_495f
	object_event $13,  6,  2, 0, $00, $00, $00, $01, Script_066_4937
	object_event $0f,  4,  2, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

StardreamHospital_15_ObjectEvents2::
	object_event $0e,  6,  3, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $13,  7,  3, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $0f,  6,  2, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_4937::
	checkbit wEventFlags + 15, $01, Script_066_495b
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5d40
	stext text_66_5d8c
	stext text_66_5da8
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_66_5e2c
	setbit wEventFlags + 15, $01
	end

Script_066_495b::
	textface text_66_5e62
	end

Script_066_495f::
	scr_6e Script_066_4973, Script_066_497a, Script_066_4981, Script_066_4988, Script_066_498f, Script_066_4996, Script_066_499d, Script_066_49ab, Script_066_49b9
	end

Script_066_4973::
	stext text_66_725f
	stext text_66_7bca
	end

Script_066_497a::
	stext text_66_725f
	stext text_66_7be0
	end

Script_066_4981::
	stext text_66_725f
	stext text_66_7bf7
	end

Script_066_4988::
	stext text_66_7267
	stext text_66_7c0e
	end

Script_066_498f::
	stext text_66_7267
	stext text_66_7c25
	end

Script_066_4996::
	stext text_66_727b
	stext text_66_7c3c
	end

Script_066_499d::
	stext text_66_727b
	stext text_66_72bb
	stext text_66_7c53
	farjump Script_066_49ca
	end

Script_066_49ab::
	stext text_66_7297
	stext text_66_72c9
	stext text_66_7c6a
	farjump Script_066_49ca
	end

Script_066_49b9::
	stext text_66_72d7
	stext text_66_72ef
	stext text_66_730d
	stext text_66_7c81
	farjump Script_066_49ca
	end

Script_066_49ca::
	stext text_66_7336
	checkbit wEventFlags + 3, $03, Script_066_4a98
	stext text_66_73c3
	stext text_66_7408
	setplayerchar $00
	face FACE_UP
	setmap MAP_STARDREAM_HOSPITAL_15, $01
	spriteface  3, FACE_LEFT
	emote  0, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_742c
	spriteface  2, FACE_RIGHT
	stext text_66_744b
	stext text_66_74a2
	spriteface  2, FACE_DOWN
	stext text_66_74dc
	setbit wEventFlags + 15, $06
	face FACE_UP
	setmap MAP_CARDILLA_HOUSE, $02
	spriteface  3, FACE_RIGHT
	spriteface  2, FACE_LEFT
	stext text_66_74f2
	stext text_66_7509
	spriteface  3, FACE_DOWN
	stext text_66_751c
	stext text_66_7580
	scr_48 $02, $25
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $1d, $02
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	loadobjsprite ObjSprite_66_4a9c
	spriteface  5, FACE_UP
	objmove $05, MovementData_066_7db7
	spriteface  5, FACE_RIGHT
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	face FACE_LEFT
	stext text_66_758f
	emote  3, EMOTE_EXCLAMATION
	emote  2, EMOTE_EXCLAMATION
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	face FACE_UP
	stext text_66_760f
	stext text_66_7668
	stext text_66_7691
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	face FACE_LEFT
	stext text_66_76e3
	spriteface  5, FACE_DOWN
	objmove $05, MovementData_066_7de0
	clearobject $05
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	face FACE_UP
	clearplayerpos
	spritewalk  3, MOVE_DOWN
	clearobject $03
	spritewalk  4, MOVE_DOWN
	spritewalk  4, MOVE_DOWN
	clearobject $04
	loadscriptedmon $07
	scr_62 $07, $01
	stext text_66_7700
	stext text_66_7718
	setbit wEventFlags + 15, $04
	end

Script_066_4a98::
	stext text_66_734c
	end

ObjSprite_66_4a9c::
	object_event $23,  4, 10, 0, $00, $00, $00, $03, Script_066_41f2
	objects_end

CardillaHouse_ObjectEvents2::
	object_event $18,  6,  5, 0, $00, $00, $00, $00, Script_066_47b2
	object_event $0e,  5,  5, wEventFlags + 15, $04, $00, $00, $01, Script_066_41f2
	object_event $0f,  5,  4, wEventFlags + 15, $04, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_4aca::
	checkbit wEventFlags + 15, $06, Script_066_4ad4
	setmap MAP_STARDREAM_HOSPITAL_15, $00
	end2

Script_066_4ad4::
	setmap MAP_STARDREAM_HOSPITAL_15, $02
	end2

G5_0E_ObjectEvents2::
	object_event $0e,  5,  4, wEventFlags + 18, $00, $00, $00, $00, Script_066_41f2
	object_event $0f,  5,  5, wEventFlags + 18, $00, $00, $00, $01, Script_066_41f2
	objects_end

Script_066_4aef::
	checkbit wEventFlags + 18, $00, Script_066_4b20
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_G5_0E, $02
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_UP
	stext text_66_7806
	stext text_66_7920
	spriteface  2, FACE_UP
	setattach $03, $02, $10, $00
	objmove $02, MovementData_066_7d36
	clearobject $02
	clearobject $03
	scr_62 $07, $00
	setbit wEventFlags + 18, $00
	end

Script_066_4b20::
	setmap MAP_G5_0E, $00
	end2
