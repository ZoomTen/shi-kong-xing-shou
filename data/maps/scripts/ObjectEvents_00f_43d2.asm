ObjectEvents_00f_43d2::
	object_event $29,  5,  5, 0, $00, $00, $00, $00, Script_00f_4427
	object_event $2d,  6,  4, wEventFlags + 3, $00, $00, $00, $01, Script_00f_4423
	objects_end

ObjectEvents_00f_43e9::
	object_event $29,  5,  5, 0, $00, $00, $00, $00, Script_00f_44d1
	object_event $02,  4,  3, wEventFlags + 3, $01, $00, $00, $01, Script_00f_4422
	object_event $03,  3,  3, wEventFlags + 3, $01, $00, $00, $02, Script_00f_4422
	object_event $2d,  6,  4, wEventFlags + 3, $00, $00, $00, $03, Script_00f_4422
	objects_end

ObjectEvents_00f_4416::
	object_event $29,  5,  5, 0, $00, $00, $00, $00, Script_00f_44db
	objects_end

Script_00f_4422::
	end

Script_00f_4423::
	textface text_0f_4f42
	end

Script_00f_4427::
	face FACE_UP
	setplayerchar $00
	scr_62 $01, $00
	setmap MAP_G0_12, $01
	emote $02, $00
	delay $02, $20
	stext text_0f_4f94
	emote $00, $03
	delay $03, $20
	stext text_0f_4fca
	stext text_0f_4fdc
	face FACE_LEFT
	move MovementData_OneLeft
	move MovementData_OneLeft
	stext text_0f_504b
	face FACE_UP
	stext text_0f_5097
	emote $00, $00
	delay $03, $20
	face FACE_RIGHT
	move MovementData_OneRight
	move MovementData_OneRight
	face FACE_UP
	spriteface $02, $01
	spritewalk $02, $02
	spritewalk $02, $02
	delay $03, $10
	spriteface $02, $03
	spritewalk $02, $04
	spritewalk $02, $04
	spriteface $02, $01
	delay $03, $10
	spriteface $02, $02
	spritewalk $02, $03
	spritewalk $02, $03
	spriteface $02, $00
	spritewalk $02, $01
	spritewalk $02, $01
	stext text_0f_50ed
	emote $00, $03
	delay $03, $20
	stext text_0f_51c1
	incsteps
	spriteface $05, $02
	spritewalk $05, $03
	spritewalk $05, $03
	spriteface $05, $00
	spritewalk $05, $01
	spriteface $05, $03
	emote $05, $03
	delay $03, $20
	stext text_0f_5200
	spriteface $05, $00
	spritewalk $05, $01
	spritewalk $05, $01
	spritewalk $05, $01
	spritewalk $05, $01
	clearobject $05
	setbit wEventFlags + 3, $00
	end

Script_00f_44d1::
	checkbit wEventFlags + 3, $01, Script_00f_44db
	textface text_0f_5299
	end

Script_00f_44db::
	textface text_0f_554f
	end

Script_00f_44df::
	checkbit wEventFlags + 3, $01, Script_00f_458e
	spriteface $02, $00
	stext text_0f_52fb
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, $01
	spriteface $01, $01
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	spriteface $01, $03
	spritewalk $01, $04
	spriteface $01, $01

Script_00f_4507::
	spritewalk $02, $01
	stext text_0f_531f
	stext text_0f_538f
	scr_48 $02, $06
	stext text_0f_539e
	scr_48 $02, $07
	stext text_0f_53ad
	spriteface $03, $00
	spriteface $04, $00
	setattach $04, $03, $00, $f0
	objmove $03, Script_00f_5a12
	clearattach $03
	spriteface $03, $03
	spriteface $02, $02
	stext text_0f_53e1
	stext text_0f_53f6
	stext text_0f_5439
	spriteface $03, $00
	spriteface $02, $01
	spritewalk $02, $02
	spriteface $02, $02
	spritewalk $02, $03
	spritewalk $02, $03
	spriteface $02, $00
	delay $03, $10
	spriteface $02, $02
	spritewalk $02, $03
	spriteface $02, $00
	spritewalk $02, $01
	spriteface $02, $03
	stext text_0f_5446
	clearplayerpos
	spritewalk $03, $01
	clearobject $03
	spriteface $04, $03
	spritewalk $04, $04
	spriteface $04, $00
	spritewalk $04, $01
	clearobject $04
	scr_62 $01, $01
	stext text_0f_54ad
	stext text_0f_54c5
	spriteface $02, $00
	stext text_0f_5521
	setbit wEventFlags + 3, $01
	end

Script_00f_458e::
	setmap MAP_TECH_CITY, $08
	end

Script_00f_4592::
	checkbit wEventFlags + 3, $01, Script_00f_458e
	spriteface $02, $00
	stext text_0f_52fb
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, $01
	spriteface $01, $01
	farjump Script_00f_4507
	end

Script_00f_45af::
	checkbit wEventFlags + 3, $01, Script_00f_45b9
	setmap MAP_G0_12, $00
	end

Script_00f_45b9::
	setmap MAP_G0_12, $02
	end

Script_00f_45bd::
	stext text_0f_557d
	checkbit wEventFlags + 3, $01, Script_00f_45c7
	end

Script_00f_45c7::
	ifcharindex $01, Script_00f_45cf
	stext text_0f_5595
	end

Script_00f_45cf::
	farjump2 Script_012_4189
	end

; TODO:: objmove movement path, signed (x, y) deltas per frame, $88 terminator
Script_00f_45d4::
	db $00, $ff, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $03, $00, $03, $00
	db $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00
	db $02, $01, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03
	db $00, $03, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $ff, $01, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $ff, $ff, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $88
