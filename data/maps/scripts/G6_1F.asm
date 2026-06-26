G6_1F_ObjectEvents::
	object_event $59,  5,  4, wEventFlags + 22, $06, $00, $00, $01, Script_06c_4fc1
	object_event $29,  5,  5, wEventFlags + 22, $06, $00, $00, $00, Script_06c_4fc1
	objects_end

Script_06c_4fc1::
	textface text_6c_6fc8
	stext text_6c_6fea
	stext text_6c_7019
	spriteface  2, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03
	spritewalk  2, MOVE_DOWN
	stext text_6c_7023
	spritewalk  2, MOVE_DOWN
	clearobject $02
	setbit wEventFlags + 22, $06
	end

Script_06c_4fe5::
	checkbit wEventFlags + 18, $06, Script_06c_4fef
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $00
	end2

Script_06c_4fef::
	checkbit wEventFlags + 19, $02, Script_06c_4ff9
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $04
	end2

Script_06c_4ff9::
	setmap MAP_BAAL_CAPITAL_PROFESSOR_2B, $06
	end2

Script_06c_4ffd::
	face FACE_DOWN
	setmap MAP_G6_06, $01
	end2

Script_06c_5003::
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $02
	end2

Script_06c_5007::
	checkbit wEventFlags + 19, $03, Script_06c_5003
	face FACE_UP
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $00
	spriteface  2, FACE_LEFT
	stext text_6c_6045
	spriteface  2, FACE_DOWN
	setattach $01, $00, $10, $00
	objmove $00, MovementData_06c_79d7
	clearattach $00
	stext text_6c_6068
	setmap MAP_BAAL_CAPITAL_PROFESSOR_07, $01

Script_06c_502c::
	startbattle BattleData_02d_4f29
	checkbit wEventFlags + 3, $03, Script_06c_4ffd
	stext text_6c_60d0
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_60df
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_60f4
	clearobject $02
	stext text_6c_610e
	setbit wEventFlags + 19, $03
	scr_48 $02, $28
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $07, $01
	stext text_6c_611d
	stext text_6c_6173
	stext text_6c_618f
	stext text_6c_61c6
	end

Script_06c_5068::
	checkbit wEventFlags + 23, $06, Script_06c_506f
	end

Script_06c_506f::
	checkbit wEventFlags + 18, $04, Script_06c_50fd
	setplayerchar $00
	setmap MAP_G6_2A, $00
	stext text_6c_5785
	stext text_6c_57a7
	stext text_6c_57e6
	stext text_6c_583f
	face FACE_UP
	scont
	setmap MAP_BAAL_CAPITAL_0C, $0b
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	spriteface  5, FACE_UP
	spriteface  6, FACE_UP
	emote  3, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	emote  6, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_589e
	spriteface  3, FACE_LEFT
	objmove $03, MovementData_06c_7913
	clearobject $03
	stext text_6c_58c1
	spriteface  4, FACE_RIGHT
	objmove $04, MovementData_06c_7944
	clearobject $04
	spriteface  5, FACE_DOWN
	objmove $05, MovementData_06c_7975
	clearobject $05
	spriteface  6, FACE_DOWN
	objmove $06, MovementData_06c_7975
	clearobject $06
	stext text_6c_58e3
	stext text_6c_58f3
	emote  0, EMOTE_QUESTION
	delay $03, $20
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	face FACE_RIGHT
	spriteface  2, FACE_LEFT
	stext text_6c_5909
	stext text_6c_595f
	clearplayerpos
	spritewalk  2, MOVE_LEFT
	setmap MAP_BAAL_CAPITAL_0C, $0c
	setbit wEventFlags + 18, $04
	end

Script_06c_50fd::
	end
