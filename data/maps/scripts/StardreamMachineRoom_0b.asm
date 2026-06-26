StardreamMachineRoom_0b_ObjectEvents::
	object_event $62, 14,  3, wEventFlags + 18, $01, $00, $00, $00, Script_066_4b53
	object_event $74, 14,  2, wEventFlags + 18, $01, $01, $00, $01, Script_066_41f2
	objects_end

ObjSprite_66_4b3b::
	object_event $74, 14,  0, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end

ObjSprite_66_4b47::
	object_event $75,  4,  0, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_4b53::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_7971
	startbattle BattleData_02d_4db8
	checkbit wEventFlags + 3, $03, Script_066_41f1
	clearobject $02
	loadobjsprite ObjSprite_66_4b3b
	objmove $02, MovementData_066_7d15
	stext text_66_7981
	setbit wEventFlags + 18, $01
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_66_7990
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_79cc
	spriteface  2, FACE_RIGHT
	loadobjsprite ObjSprite_66_4c55
	spriteface  4, FACE_UP
	objmove $04, MovementData_066_7d15
	spriteface  4, FACE_UP
	spriteface  4, FACE_LEFT
	spriteface  4, FACE_DOWN
	stext text_66_79d6
	setbit wEventFlags + 18, $02
	face FACE_UP
	setmap MAP_STARDREAM_MACHINE_ROOM_0B, $01
	stext text_66_79e1
	end

Script_066_4bb1::
	checkbit wEventFlags + 18, $01, Script_066_4bc1
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $00
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	end2

Script_066_4bc1::
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $02
	end2

Script_066_4bc5::
	stext text_66_792e
	end

Script_066_4bc9::
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_7a0c
	face FACE_LEFT
	setmap MAP_STARDREAM_MACHINE_ROOM_0D, $03
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_UP
	stext text_66_7a20
	loadobjsprite ObjSprite_66_4b47
	objmove $04, MovementData_066_7d04
	setbit wEventFlags + 18, $03
	scr_62 $07, $01
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	warpmode GAMEMODE_FLOATING_ISLAND_CUTSCENE1, $1a, $02
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_66_7a50
	stext text_66_7a6d
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_66_7a7e
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	setplayerchar $00
	face FACE_LEFT
	setmap MAP_CARDILLA_HOUSE, $03
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	stext text_66_7a94
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_7af9
	setmapgroup $06
	farjump2 Script_06c_4752
	end

CardillaHouse_ObjectEvents3::
	object_event $0e,  4,  4, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $0f,  3,  4, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end

ObjSprite_66_4c55::
	object_event $50,  5,  0, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end
