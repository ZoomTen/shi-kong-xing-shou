G6_14_ObjectEvents::
	object_event $02,  3,  5, wEventFlags + 19, $04, $00, $00, $00, Script_06c_498b
	object_event $03,  3,  4, wEventFlags + 19, $04, $00, $00, $01, Script_06c_4706
	objects_end

G6_11_ObjectEvents::
	object_event $04,  3,  4, wEventFlags + 19, $05, $00, $00, $00, Script_06c_49ab
	object_event $05,  3,  3, wEventFlags + 19, $05, $00, $00, $01, Script_06c_4706
	objects_end

G6_15_ObjectEvents::
	object_event $06,  3,  5, wEventFlags + 19, $06, $00, $00, $00, Script_06c_49cb
	object_event $07,  3,  4, wEventFlags + 19, $06, $00, $00, $01, Script_06c_4706
	objects_end

G6_12_ObjectEvents::
	object_event $08,  3,  4, wEventFlags + 19, $07, $00, $00, $00, Script_06c_49eb
	object_event $09,  3,  3, wEventFlags + 19, $07, $00, $00, $01, Script_06c_4706
	objects_end

G6_16_ObjectEvents::
	object_event $0a,  3,  5, wEventFlags + 21, $00, $00, $00, $00, Script_06c_4a0b
	object_event $0b,  3,  4, wEventFlags + 21, $00, $00, $00, $01, Script_06c_4706
	objects_end

G6_17_ObjectEvents::
	object_event $0c,  7,  4, wEventFlags + 21, $01, $00, $00, $00, Script_06c_4a2b
	object_event $0d,  7,  3, wEventFlags + 21, $01, $00, $00, $01, Script_06c_4706
	objects_end

Script_06c_498b::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_652a
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $01, $01
	setbit wEventFlags + 19, $04
	end

Script_06c_49ab::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_6542
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $02, $01
	setbit wEventFlags + 19, $05
	end

Script_06c_49cb::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_6566
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $03, $01
	setbit wEventFlags + 19, $06
	end

Script_06c_49eb::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_659b
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $04, $01
	setbit wEventFlags + 19, $07
	end

Script_06c_4a0b::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_65bf
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $05, $01
	setbit wEventFlags + 21, $00
	end

Script_06c_4a2b::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_6c_661f
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	scr_62 $06, $01
	setbit wEventFlags + 21, $01
	end

Script_06c_4a4b::
	checkbit wEventFlags + 19, $04, Script_06c_4a64
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4a64::
	checkbit wEventFlags + 19, $05, Script_06c_4a7d
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4a7d::
	checkbit wEventFlags + 19, $06, Script_06c_4a96
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4a96::
	checkbit wEventFlags + 19, $07, Script_06c_4aaf
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4aaf::
	checkbit wEventFlags + 21, $00, Script_06c_4ac8
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4ac8::
	checkbit wEventFlags + 21, $01, Script_06c_4ae7
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  1, FACE_UP
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	stext text_6c_6665
	end

Script_06c_4ae1::
	face FACE_DOWN
	setmap MAP_G6_0F, $03
	end2

Script_06c_4ae7::
	setplayerchar $00
	setmap MAP_G6_13, $00
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	setattach $01, $00, $10, $00
	objmove $00, MovementData_06c_79d7
	face FACE_RIGHT
	move MovementData_OneRight
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_RIGHT
	stext text_6c_6676
	stext text_6c_668d
	stext text_6c_66d2
	stext text_6c_66e8
	startbattle BattleData_02d_4f57
	checkbit wEventFlags + 3, $03, Script_06c_4ae1
	loadobjsprite ObjSprite_6c_4c0b
	stext text_6c_6745
	stext text_6c_6781
	spritewalk  3, MOVE_DOWN
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_RIGHT
	clearobject $03
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_UP
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	checkbit wEventFlags + 15, $07, Script_06c_4b9c
	stext text_6c_67d2
	stext text_6c_67e5
	setattach $01, $00, $00, $f0
	objmove $00, MovementData_06c_7964
	face FACE_DOWN
	stext text_6c_67fa
	stext text_6c_680f
	stext text_6c_682f
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_685a
	stext text_6c_68a9
	stext text_6c_68b4
	clearobject $02
	stext text_6c_68dc
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	playsound SFX_2c
	face FACE_LEFT
	warpmode GAMEMODE_1A, $18, $05
	scr_62 $01, $00
	scr_62 $02, $00
	scr_62 $03, $00
	scr_62 $04, $00
	scr_62 $05, $00
	scr_62 $06, $00
	scr_62 $07, $00
	setbit wEventFlags + 20, $03
	end

Script_06c_4b9c::
	stext text_6c_68ea
	stext text_6c_68fd
	setattach $01, $00, $00, $f0
	objmove $00, MovementData_06c_7964
	face FACE_DOWN
	stext text_6c_6912
	stext text_6c_6927
	stext text_6c_6947
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_6972
	stext text_6c_6986
	stext text_6c_69c5
	stext text_6c_69e4
	spritewalk  1, MOVE_LEFT
	face FACE_RIGHT
	move MovementData_OneLeft
	spritewalk  2, MOVE_UP
	spriteface  1, FACE_LEFT
	stext text_6c_6a04
	stext text_6c_6a1d
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	warpmode GAMEMODE_1A, $18, $05
	scr_62 $01, $00
	scr_62 $02, $00
	scr_62 $03, $00
	scr_62 $04, $00
	scr_62 $05, $00
	scr_62 $06, $00
	scr_62 $07, $00
	end
