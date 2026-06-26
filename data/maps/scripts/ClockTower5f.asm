ClockTower5f_ObjectEvents::
	object_event $33,  5,  3, wEventFlags + 4, $05, $00, $00, $00, Script_012_4735
	objects_end

ObjectEvents_012_4729::
	object_event $48,  5,  3, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4735::
	textface text_12_77ea
	stext text_12_77ff
	stext text_12_7870
	startbattle BattleData_02d_4b50
	checkbit wEventFlags + 3, $03, Script_012_4780
	spriteface  2, FACE_UP
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_4f8c
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_4fb5
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_4fe2
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_500f
	clearobject $03
	loadobjsprite ObjectEvents_012_4729
	objmove $03, MovementData_012_503c
	clearobject $03
	clearobject $02
	setbit wEventFlags + 4, $05
	setmappredef MAPPREDEF_0a
	end

Script_012_4780::
	end

Script_012_4781::
	setplayerchar $00
	setmap MAP_G2_11, $01
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_7945
	stext text_12_7970
	emote $02, $03
	delay $03, $20
	stext text_12_7977
	stext text_12_799d
	stext text_12_79cc
	face FACE_DOWN
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_012_4e4a
	clearobject $02
	face FACE_UP
	warpmode GAMEMODE_GALE_CUTSCENE, $0e, $04
	stext text_12_7a96
	stext text_12_7aac
	emote $02, $03
	delay $03, $20
	spritewalk  2, MOVE_DOWN
	stext text_12_7ad7
	emote $00, $03
	delay $03, $20
	stext text_12_7b78
	stext text_12_7b83
	emote $00, $03
	delay $03, $20
	stext text_12_7bbb
	stext text_12_7be4
	stext text_12_7c4b
	giveitem ITEMNAMECAT_KEY, KEYITEM_0a
	stext text_12_7c5a
	stext text_12_7ca6
	stext text_12_7cb9
	stext text_12_7cdd
	scr_62 $02, $00
	setbit wEventFlags + 4, $06
	setmappredef MAPPREDEF_0b
	end

GallEnterprise_ObjectEvents4::
	object_event $2f,  5,  4, 0, $00, $00, $00, $00, Script_012_4819
	object_event $30,  4,  4, 0, $00, $00, $00, $01, Script_012_481d
	object_event $04,  6,  5, wEventFlags + $17, $07, $00, $00, $02, Script_012_4827
	objects_end

Script_012_4819::
	textface text_12_7e2d
	end

Script_012_481d::
	checkbit wEventFlags + 4, $06, Script_012_4826
	textface text_12_7e6d

Script_012_4826::
	end

Script_012_4827::
	textface text_12_7cdd
	end

Script_012_482b::
	stext text_12_7cf0
	spritewalk  4, MOVE_DOWN
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_UP
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	spriteface  1, FACE_RIGHT
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_UP
	sjump Script_012_4862

Script_012_4850::
	stext text_12_7cf0
	spritewalk  4, MOVE_DOWN
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_UP

Script_012_4862::
	emote $00, $03
	delay $03, $20
	stext text_12_7d04
	stext text_12_7d0e
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_UP
	emote $02, $00
	delay $03, $20
	stext text_12_7d79
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_7d90
	emote $02, $00
	delay $03, $20
	stext text_12_7de7
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_DOWN
	stext text_12_7df5
	stext text_12_7e02
	stext text_12_7e1a
	spritewalk  4, MOVE_DOWN
	clearplayerpos
	spritewalk  4, MOVE_DOWN
	clearobject $04
	scr_62 $02, $01
	setmappredef MAPPREDEF_0c
	setbit wEventFlags + 23, $07
	end

Script_012_48b7::
	textface text_12_5b82
	end

Script_012_48bb::
	checkbit wEventFlags + 3, $05, Script_012_48c5
	textface text_12_5ba7
	end

Script_012_48c5::
	textface text_12_6550
	end

Script_012_48c9::
	checkbit wEventFlags + 3, $05, Script_012_48d3
	textface text_12_5bd5
	end

Script_012_48d3::
	textface text_12_65ab
	end

Script_012_48d7::
	checkbit wEventFlags + 3, $05, Script_012_48e1
	textface text_12_5c51
	end

Script_012_48e1::
	textface text_12_6629
	end

Script_012_48e5::
	textface text_12_5c92
	end

Script_012_48e9::
	checkbit wEventFlags + 3, $05, Script_012_48f3
	textface text_12_5d14
	end

Script_012_48f3::
	textface text_12_6655
	end

Script_012_48f7::
	checkbit wEventFlags + 3, $05, Script_012_4901
	textface text_12_5d7a
	end

Script_012_4901::
	textface text_12_66e4
	end

Script_012_4905::
	checkbit wEventFlags + 3, $05, Script_012_490f
	textface text_12_5dab
	end

Script_012_490f::
	textface text_12_673b
	end

Script_012_4913::
	textface text_12_5dff
	end

Script_012_4917::
	textface text_12_5e82
	end

Script_012_491b::
	textface text_12_5f2e
	end

Script_012_491f::
	checkbit wEventFlags + 3, $05, Script_012_4929
	textface text_12_5fa8
	end

Script_012_4929::
	textface text_12_6796
	end

Script_012_492d::
	checkbit wEventFlags + 3, $05, Script_012_4937
	textface text_12_5fc7
	end

Script_012_4937::
	textface text_12_67b8
	end

Script_012_493b::
	checkbit wEventFlags + 3, $05, Script_012_4948
	textface text_12_6032
	stext text_12_6064
	end

Script_012_4948::
	checkbit wEventFlags + 3, $07, Script_012_4959
	textface text_12_6812
	stext text_12_6864
	setbit wEventFlags + 3, $07
	end

Script_012_4959::
	textface text_12_6812
	end

Script_012_495d::
	checkbit wEventFlags + 3, $05, Script_012_4967
	textface text_12_60b5
	end

Script_012_4967::
	textface text_12_686f
	end
