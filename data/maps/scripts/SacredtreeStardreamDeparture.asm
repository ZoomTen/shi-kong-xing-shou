SacredtreeStardreamDeparture_ObjectEvents::
	object_event $4d,  6,  4, wEventFlags + 14, $05, $00, $00, $00, Script_059_45eb
	object_event $6c, 10, 13, 0, $00, $00, $00, $01, Script_059_469d
	objects_end

Script_059_45eb::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_59_772c
	startbattle BattleData_02d_4c67
	checkbit wEventFlags + 3, $03, Script_059_4004
	clearobject $02 ; TEMP
	setbit wEventFlags + 14, $05
	setplayerchar $00 ; TEMP
	face FACE_DOWN
	setmap MAP_SACREDTREE_STARDREAM_DEPARTURE, $04
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_UP
	stext text_59_7818
	stext text_59_785d
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_59_78da
	spriteface  2, FACE_LEFT
	stext text_59_792c
	spriteface  2, FACE_RIGHT
	stext text_59_7a01
	clearplayerpos
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	clearobject $02 ; TEMP
	spritewalk  3, MOVE_UP
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	clearobject $03 ; TEMP
	face FACE_DOWN
	setattach $01, $00, $f0, $00 ; TEMP
	objmove $00, MovementData_059_7bad
	clearobject $00 ; TEMP
	clearobject $01 ; TEMP
	delay $03, $20 ; TEMP
	loadobjsprite ObjSprite_59_467a
	spriteface  2, FACE_UP
	objmove $02, MovementData_059_7b4b
	spriteface  2, FACE_UP
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_DOWN
	stext text_59_7a49
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_UP
	objmove $02, MovementData_059_7b7c
	clearobject $02 ; TEMP
	setmap MAP_G4_2B, $01
	end

ObjSprite_59_467a::
	object_event $50,  6,  0, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

SacredtreeStardreamDeparture_ObjectEvents5::
	object_event $06,  6,  6, 0, $00, $00, $00, $00, Script_059_40c9
	object_event $0a,  7,  7, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_469d::
	ifcharindex $06, Script_059_46a5
	stext text_59_76d1
	end

Script_059_46a5::
	facemove3 Script_059_46af, Script_059_46cb, Script_059_46e7, Script_059_4703
	end

Script_059_46af::
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $f0, $00 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7cd3
	clearattach $00 ; TEMP
	face FACE_UP
	spriteface  1, FACE_UP
	swapfollower
	end

Script_059_46cb::
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $10, $00 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7c58
	clearattach $00 ; TEMP
	swapfollower
	face FACE_DOWN
	spriteface  1, FACE_DOWN
	end

Script_059_46e7::
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $00, $10 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7c81
	clearattach $00 ; TEMP
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	swapfollower
	end

Script_059_4703::
	facemove4
	swapfollower
	spriteface  1, $04 ; TEMP
	delay $03, $10 ; TEMP
	setattach $01, $00, $00, $f0 ; TEMP
	playsound SFX_45
	objmove $00, MovementData_059_7caa
	clearattach $00 ; TEMP
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	swapfollower
	end
