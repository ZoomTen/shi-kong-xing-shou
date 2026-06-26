CoffeeForestPart3_ObjectEvents::
	object_event $32,  6,  5, wEventFlags + 3, $05, $00, $00, $00, Script_012_4a05
	objects_end

Script_012_4a05::
	textface text_12_6471
	stext text_12_6486
	startbattle BattleData_02d_4b40
	checkbit wEventFlags + 3, $03, Script_012_4780
	spriteface  2, FACE_UP
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_RIGHT
	clearobject $02
	loadobjsprite Script_012_4a93
	objmove $03, MovementData_012_4f8c
	clearobject $03
	loadobjsprite Script_012_4a9f
	objmove $03, MovementData_012_4fb5
	clearobject $03
	loadobjsprite Script_012_4aab
	objmove $03, MovementData_012_4fe2
	clearobject $03
	loadobjsprite Script_012_4ab7
	objmove $03, MovementData_012_500f
	clearobject $03
	loadobjsprite Script_012_4ac3
	objmove $03, MovementData_012_503c
	clearobject $03
	setmap MAP_SHANDA_FARM, $09
	spriteface  2, FACE_UP
	loadobjsprite Script_012_4ad0
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4adc
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4ae8
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4af4
	objmove $03, MovementData_012_5167
	clearobject $03
	loadobjsprite Script_012_4b00
	objmove $03, MovementData_012_5167
	clearobject $03
	stext text_12_64ba
	setmap MAP_COFFEE_FOREST_PART_3, $01
	stext text_12_64fb
	stext text_12_653d
	giveitem ITEMNAMECAT_KEY, KEYITEM_08
	setbit wEventFlags + 3, $05
	end

Script_012_4a93::
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4a9f::
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4aab::
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4ab7::
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4ac3::
	object_event $48,  6,  5, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4acf::
	end

Script_012_4ad0::
	object_event $48, 13, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4adc::
	object_event $48, 18, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4ae8::
	object_event $48, 16, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4af4::
	object_event $48, 14, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

Script_012_4b00::
	object_event $48, 17, 11, 0, $00, $00, $00, $01, Script_012_4acf
	objects_end

ShandaFarm_ObjectEvents2::
	object_event $1d, 14, 18, 0, $00, $00, $00, $00, Script_012_4acf
	objects_end

GallEnterprise_ObjectEvents2::
	object_event $2f,  4,  2, wEventFlags + 4, $02, $00, $00, $00, Script_012_44cc
	object_event $2d,  6,  3, wEventFlags + 4, $02, $00, $00, $01, Script_012_44cc
	object_event $30,  5,  2, wEventFlags + 4, $02, $00, $00, $02, Script_012_44cc

	object_event $04,  4,  4, wEventFlags + 4, $02, $00, $00, $03, Script_012_44cc
	objects_end

GallEnterprise_ObjectEvents5::
	object_event $2f,  5,  3, wEventFlags + 4, $02, $00, $00, $00, Script_012_44cc

	object_event $2d,  6,  3, wEventFlags + 4, $02, $00, $00, $01, Script_012_44cc
	object_event $30,  5,  2, wEventFlags + 4, $02, $00, $00, $02, Script_012_44cc
	object_event $04,  4,  4, wEventFlags + 4, $02, $00, $00, $03, Script_012_44cc
	objects_end

Script_012_4b72::
	checkbit wEventFlags + 4, $07, Script_012_4b94
	setmap MAP_GALL_ENTERPRISE, $00
	end

Script_012_4b7c::
	checkbit wEventFlags + 4, $03, Script_012_4b86
	setmap MAP_GALL_ENTERPRISE, $00
	end

Script_012_4b86::
	checkbit wEventFlags + 4, $06, Script_012_4b90
	setmap MAP_GALL_ENTERPRISE, $05
	end

Script_012_4b90::
	setmap MAP_GALL_ENTERPRISE, $04
	end

Script_012_4b94::
	checkbit wEventFlags + 4, $02, Script_012_4b7c
	setplayerchar $00
	setmap MAP_GALL_ENTERPRISE, $02
	spriteface  3, FACE_LEFT
	spriteface  5, FACE_UP
	spriteface  4, FACE_LEFT
	stext text_12_6f16
	spriteface  2, FACE_RIGHT
	stext text_12_6f1e
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_DOWN
	spriteface  3, FACE_DOWN
	stext text_12_6f2f
	stext text_12_6f96
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_6faa
	stext text_12_6fc4
	stext text_12_6fcc
	spriteface  4, FACE_DOWN
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	stext text_12_6fe9
	emote $00, $02
	delay $03, $20
	stext text_12_7033
	giveitem ITEMNAMECAT_KEY, KEYITEM_09
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $0e, $07
	spriteface  3, FACE_LEFT
	spriteface  5, FACE_UP
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	stext text_12_7042
	stext text_12_70a2
	stext text_12_70af
	emote $02, $00
	delay $03, $20
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_70ec
	spriteface  2, FACE_DOWN
	spriteface  4, FACE_DOWN
	stext text_12_7122
	stext text_12_7159
	spritewalk  2, MOVE_DOWN
	stext text_12_7169
	stext text_12_71f8
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_12_7203
	spriteface  2, FACE_LEFT
	setattach $04, $02, $00, $10
	objmove $02, MovementData_012_4e29
	clearattach $04
	clearobject $02
	clearobject $04
	spriteface  3, FACE_DOWN
	objmove $03, MovementData_012_4e4a
	clearobject $03
	spriteface  5, FACE_RIGHT
	clearplayerpos
	spritewalk  5, MOVE_RIGHT
	clearobject $05
	setbit wEventFlags + 4, $02
	setmappredef MAPPREDEF_08
	end

G2_11_ObjectEvents2::
	object_event $04,  6,  6, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end
