Script_066_40bb::
	checkbit wEventFlags + 15, $01, Script_066_40c5
	setmap MAP_PERMAFROST_GARDEN, $00
	end2

Script_066_40c5::
	setmap MAP_PERMAFROST_GARDEN, $02
	end2

PermafrostGarden_ObjectEvents3::
	object_event $57, 26, 25, wEventFlags + 17, $00, $00, $00, $00, Script_066_40d5
	objects_end

Script_066_40d5::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_66_5f05
	startbattle BattleData_02d_4d4d
	checkbit wEventFlags + 3, $03, Script_066_41f1
	spriteface  2, FACE_UP
	loadobjsprite ObjSprite_66_4128
	objmove $03, MovementData_066_7d47
	loadobjsprite ObjSprite_66_4134
	objmove $04, MovementData_066_7d7e
	spriteface  2, FACE_UP
	clearobject $02
	face FACE_LEFT
	stext text_66_5f11
	giveitem ITEMNAMECAT_KEY, KEYITEM_19
	clearobject $03
	setbit wEventFlags + 15, $02
	face FACE_RIGHT
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_5f21
	stext text_66_5f5b
	giveitem ITEMNAMECAT_KEY, KEYITEM_1a
	clearobject $04
	setbit wEventFlags + 16, $02
	setbit wEventFlags + 17, $00
	end

ObjSprite_66_4128::
	object_event $71, 26, 25, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end

ObjSprite_66_4134::
	object_event $72, 26, 25, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_4140::
	setplayerchar $00 ; TEMP
	face FACE_LEFT
	warpmode GAMEMODE_AIRPORT_CUTSCENE3, $16, $00
	spriteface  2, FACE_LEFT
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_66_4ca2
	stext text_66_4caf
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	spriteface  2, FACE_RIGHT
	stext text_66_4ce9
	stext text_66_4d09
	stext text_66_4d2c
	setbit wEventFlags + 14, $06
	end

Script_066_4172::
	textface text_66_4d45
	end
