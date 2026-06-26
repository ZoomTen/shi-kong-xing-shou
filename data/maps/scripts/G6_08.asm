G6_08_ObjectEvents::
	object_event $5d, 16,  4, wEventFlags + 22, $07, $00, $00, $00, Script_06c_455a
	object_event $22, 15, 17, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25,  3,  1, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  1, 12, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end

G6_09_ObjectEvents::
	object_event $5c, 14, 25, wEventFlags + 23, $00, $00, $00, $00, Script_06c_456d
	object_event $22, 14,  4, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25,  3, 28, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  2, 23, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end

G6_0A_ObjectEvents::
	object_event $50,  4,  3, wEventFlags + 23, $01, $00, $00, $00, Script_06c_4580
	object_event $22, 16, 25, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25,  4, 13, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  7, 28, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end

EndingEpilogue_ObjectEvents::
	object_event $5e,  9, 17, wEventFlags + 23, $02, $00, $00, $00, Script_06c_4596
	object_event $5f,  9, 17, wEventFlags + 23, $02, $01, $00, $00, Script_06c_4596
	object_event $22,  1, 16, 0, $00, $00, $00, $01, Script_06c_7a51
	object_event $25, 10, 28, 0, $00, $00, $00, $02, Script_06c_7a5e
	object_event $25,  8,  2, 0, $00, $00, $00, $03, Script_06c_7a6a
	objects_end

Script_06c_455a::
	textface text_6c_748f
	startbattle BattleData_02d_4f85
	checkbit wEventFlags + 3, $03, Script_06c_473a
	clearobject $88
	setbit wEventFlags + 22, $07
	end

Script_06c_456d::
	textface text_6c_74d2
	startbattle BattleData_02d_4fb3
	checkbit wEventFlags + 3, $03, Script_06c_473a
	clearobject $88
	setbit wEventFlags + 23, $00
	end

Script_06c_4580::
	textface text_6c_757d
	startbattle BattleData_02d_4fe1
	checkbit wEventFlags + 3, $03, Script_06c_473a
	stext text_6c_7643
	clearobject $88
	setbit wEventFlags + 23, $01
	end

Script_06c_4596::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	checkbit wEventFlags + 23, $02, Script_06c_45c8
	stext text_6c_765d
	stext text_6c_76a8
	startbattle BattleData_02d_500f
	checkbit wEventFlags + 3, $03, Script_06c_473a
	stext text_6c_76db
	clearobject $88
	loadobjsprite Script_06c_4659
	clearobject $88
	loadobjsprite ObjSprite_6c_4665
	clearobject $88
	loadobjsprite Script_06c_4659
	setbit wEventFlags + 23, $02

Script_06c_45c8::
	stext text_6c_7725
	startbattle BattleData_02d_503d
	checkbit wEventFlags + 3, $03, Script_06c_473a
	stext text_6c_77f4
	spriteface 136, FACE_UP
	spritewalk 136, MOVE_UP
	stext text_6c_7835
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_788f
	move MovementData_OneUp
	move MovementData_OneDown
	stext text_6c_78ab
	stext text_6c_78b6
	stext text_6c_78ed
	stext text_6c_78f5
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	stext text_6c_7906
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	setmapgroup $07
	farjump2 Script_06e_4109
	end

Script_06c_460e::
	checkbit wEventFlags + 22, $07, Script_06c_4621
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	end

Script_06c_4621::
	face FACE_DOWN
	setmap MAP_G6_09, $00
	end

Script_06c_4627::
	checkbit wEventFlags + 23, $00, Script_06c_463a
	clearplayerpos
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_LEFT
	end

Script_06c_463a::
	face FACE_LEFT
	setmap MAP_G6_0A, $00
	end

Script_06c_4640::
	checkbit wEventFlags + 23, $01, Script_06c_4653
	clearplayerpos
	face FACE_DOWN
	move MovementData_OneDown
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end

Script_06c_4653::
	face FACE_DOWN
	setmap MAP_ENDING_EPILOGUE, $00
	end

Script_06c_4659::
	dirmovement
	end

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_06c_465b::
	db $11, $00, $00, $00, $00, $00, $00, $06, $47, $88

ObjSprite_6c_4665::
	object_event $5e,  9, 17, 0, $00, $00, $00, $00, Script_06c_4706
	objects_end

Script_06c_4671::
	setplayerchar $00
	face FACE_LEFT
	warpmode GAMEMODE_1B, $21, $00
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	stext text_6c_7251
	stext text_6c_7267
	warpmode GAMEMODE_1C, $21, $00
	spriteface  2, FACE_RIGHT
	stext text_6c_72b9
	spriteface  3, FACE_RIGHT
	stext text_6c_72da
	stext text_6c_72ee
	spriteface  3, FACE_LEFT
	stext text_6c_7318
	stext text_6c_7335
	stext text_6c_734b
	stext text_6c_7385
	stext text_6c_73b0
	stext text_6c_73c9
	spriteface  2, FACE_LEFT
	spriteface  4, FACE_LEFT
	end
