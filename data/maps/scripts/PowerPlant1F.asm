PowerPlant1F_ObjectEvents::
	object_event $34,  9,  6, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $34,  9,  4, 0, $00, $00, $00, $01, Script_00f_41fe
	object_event $34,  2,  3, 0, $00, $00, $00, $02, Script_00f_41fe
	object_event $34,  2,  5, 0, $00, $00, $00, $03, Script_00f_41fe
	objects_end

PowerPlant2F_ObjectEvents::
	object_event $34,  9,  6, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $34,  2,  3, 0, $00, $00, $00, $01, Script_00f_41fe
	object_event $17,  7,  4, wEventFlags + 2, $05, $00, $00, $02, Script_00f_41ff
	objects_end

PowerPlant3F_ObjectEvents::
	object_event $34,  6,  5, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $34,  6,  3, 0, $00, $00, $00, $01, Script_00f_41fe
	object_event $34,  2,  4, 0, $00, $00, $00, $02, Script_00f_41fe
	object_event $34,  2,  6, 0, $00, $00, $00, $03, Script_00f_41fe
	objects_end

PowerPlant4F_ObjectEvents::
	object_event $34,  7,  6, 0, $00, $00, $00, $00, Script_00f_41fe
	object_event $27,  7,  4, wEventFlags + 2, $06, $00, $00, $01, Script_00f_41fe
	object_event $28,  8,  4, wEventFlags + 2, $06, $00, $00, $02, Script_00f_41fe
	objects_end

Script_00f_41fe::
	end

Script_00f_41ff::
	textface text_0f_4ab7
	emote $00, $00
	delay $03, $20
	stext text_0f_4ac7
	stext text_0f_4ad7
	spriteface $04, $02
	objmove $04, Script_00f_59b1
	clearobject $04
	setbit wEventFlags + 2, $05
	end

Script_00f_421c::
	checkbit wEventFlags + 2, $06, Script_00f_42af
	spriteface $03, $03
	spriteface $04, $02
	stext text_0f_4b28
	stext text_0f_4b4c
	spriteface $03, $00
	spriteface $04, $00
	emote $03, $00
	emote $04, $00
	delay $03, $20
	stext text_0f_4b71
	stext text_0f_4b86
	startbattle BattleData_02d_4b12
	checkbit wEventFlags + 3, $03, Script_00f_42a3
	stext text_0f_4bc3
	spriteface $03, $02
	spriteface $04, $02
	setattach $04, $03, $00, $10
	objmove $03, Script_00f_594f
	clearattach $03
	objmove $03, Script_00f_5980
	clearobject $03
	spriteface $04, $03
	stext text_0f_4bf0
	spriteface $04, $02
	objmove $04, Script_00f_5980
	clearobject $04
	emote $00, $01
	delay $03, $20
	stext text_0f_4c3c
	emote $00, $00
	delay $03, $20
	move MovementData_OneUp
	move MovementData_OneUp
	face FACE_RIGHT
	move MovementData_OneRight
	move MovementData_OneRight
	face FACE_UP
	stext text_0f_4c47
	setbit wEventFlags + 2, $06
	setmappredef MAPPREDEF_07
	face FACE_DOWN
	setmap MAP_TECH_CITY, $01
	end

Script_00f_42a3::
	face FACE_DOWN
	move MovementData_OneDown
	move MovementData_OneDown
	spriteface $01, $00
	end

Script_00f_42af::
	end
