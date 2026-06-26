SacredtreeTimeTravel_ObjectEvents::
	object_event $4e,  3, 15, wEventFlags + 12, $07, $00, $00, $00, Script_059_4534
	objects_end

ObjSprite_59_4510::
	object_event $66,  2, 13, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

ObjSprite_59_451c::
	object_event $66,  3, 14, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

ObjSprite_59_4528::
	object_event $66,  2, 14, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

Script_059_4534::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_59_55b1
	startbattle BattleData_02d_4c39
	checkbit wEventFlags + 3, $03, Script_059_4004
	clearobject $02 ; TEMP
	loadobjsprite ObjSprite_59_4510
	playsound SFX_2c
	spriteface  2, FACE_UP
	delay $03, $08 ; TEMP
	spriteface  2, FACE_UP
	clearobject $02 ; TEMP
	delay $03, $08 ; TEMP
	loadobjsprite ObjSprite_59_451c
	playsound SFX_2c
	spriteface  2, FACE_UP
	delay $03, $08 ; TEMP
	spriteface  2, FACE_UP
	clearobject $02 ; TEMP
	delay $03, $08 ; TEMP
	loadobjsprite ObjSprite_59_4528
	playsound SFX_2c
	spriteface  2, FACE_UP
	delay $03, $08 ; TEMP
	spriteface  2, FACE_UP
	clearobject $02 ; TEMP
	delay $03, $08 ; TEMP
	setbit wEventFlags + 12, $07
	setmap MAP_SACREDTREE_STARDREAM_DEPARTURE, $03
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	stext text_59_5625
	emote  2, EMOTE_ANGER
	delay $03, $20 ; TEMP
	stext text_59_5668
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	setattach $04, $03, $00, $10 ; TEMP
	objmove $03, MovementData_059_7bad
	clearobject $03 ; TEMP
	clearobject $04 ; TEMP
	setmap MAP_SACREDTREE_TIME_TRAVEL, $01
	end

SacredtreeStardreamDeparture_ObjectEvents4::
	object_event $4d,  6,  3, 0, $00, $00, $00, $00, Script_059_40c9
	object_event $62,  6,  4, 0, $00, $00, $00, $01, Script_059_40c9
	object_event $62,  7,  4, 0, $00, $00, $00, $02, Script_059_40c9
	objects_end
