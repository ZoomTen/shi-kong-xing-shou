EastFishmarket_2c_ObjectEvents::
	object_event $18,  5,  5, 0, $00, $00, $00, $00, Script_055_5a1b
	object_event $1d,  8,  5, 0, $00, $00, $00, $01, Script_055_5a4c
	objects_end

EastFishmarket_2d_ObjectEvents::
	object_event $1f,  3,  3, 0, $00, $00, $00, $00, Script_055_5a50
	object_event $1e,  5,  5, 0, $00, $00, $06, $01, Script_055_5a54
	objects_end

EastFishmarket_2e_ObjectEvents::
	object_event $16,  3,  4, 0, $00, $00, $00, $00, Script_055_5a6d
	object_event $19,  8,  3, 0, $00, $00, $06, $01, Script_055_5a71
	objects_end

EastFishmarket_2f_ObjectEvents::
	object_event $1b,  4,  5, 0, $00, $00, $06, $00, Script_055_5a75
	objects_end

EastFishmarket_33_ObjectEvents::
	object_event $08,  4,  4, wEventFlags + 7, $02, $00, $00, $00, Script_055_5a79
	object_event $4b,  6,  3, 0, $00, $00, $00, $01, Script_055_5a7d
	objects_end

Script_055_5933::
	textface text_55_5b1f
	end

Script_055_5937::
	textface text_55_5b52
	end

Script_055_593b::
	textface text_55_5ba0
	end

Script_055_593f::
	textface text_55_5be3
	end

Script_055_5943::
	textface text_55_5c28
	end

Script_055_5947::
	textface text_55_5c6f
	end

Script_055_594b::
	textface text_55_5cbb
	end

Script_055_594f::
	textface text_55_5d0a
	end

Script_055_5953::
	textface text_55_5fc7
	end

Script_055_5957::
	ifcharindex $03, Script_055_595f
	textface text_55_64aa
	end

Script_055_595f::
	textface text_55_64f9
	setbit wEventFlags + 7, $04
	countflags7
	end

Script_055_5968::
	ifcharindex $03, Script_055_5970
	textface text_55_64b2
	end

Script_055_5970::
	textface text_55_650e
	setbit wEventFlags + 7, $05
	countflags7
	end

Script_055_5979::
	ifcharindex $03, Script_055_5981
	textface text_55_64ba
	end

Script_055_5981::
	textface text_55_653d
	setbit wEventFlags + 7, $06
	countflags7
	end

Script_055_598a::
	ifcharindex $03, Script_055_5992
	textface text_55_64c2
	end

Script_055_5992::
	checkbit wEventFlags + 8, $05, Script_055_59a1
	textface text_55_65c6
	setbit wEventFlags + 7, $07
	countflags7
	end

Script_055_59a1::
	textface text_55_6fab
	end

Script_055_59a5::
	ifcharindex $03, Script_055_59ad
	textface text_55_64ca
	end

Script_055_59ad::
	checkbit wEventFlags + 8, $05, Script_055_59bc
	textface text_55_6630
	setbit wEventFlags + 8, $00
	countflags7
	end

Script_055_59bc::
	textface text_55_6fda
	end

Script_055_59c0::
	ifcharindex $03, Script_055_59c8
	textface text_55_64da
	end

Script_055_59c8::
	checkbit wEventFlags + 8, $05, Script_055_59d7
	textface text_55_6684
	setbit wEventFlags + 8, $01
	countflags7
	end

Script_055_59d7::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_55_7043
	emote $00, $04
	delay $03, $20
	stext text_55_70ad
	stext text_55_70ee
	stext text_55_7109
	face FACE_DOWN
	farjump2 Script_05c_4135
	end

Script_055_59f7::
	ifcharindex $03, Script_055_59ff
	textface text_55_64d2
	end

Script_055_59ff::
	textface text_55_6704
	end

Script_055_5a03::
	ifcharindex $03, Script_055_5a0b
	textface text_55_64d2
	end

Script_055_5a0b::
	textface text_55_672a
	end

Script_055_5a0f::
	ifcharindex $03, Script_055_5a17
	textface text_55_64e1
	end

Script_055_5a17::
	textface text_55_673a
	end

Script_055_5a1b::
	textface text_55_5d57
	spriteface  3, FACE_LEFT
	stext text_55_5da9
	spriteface  2, FACE_RIGHT
	emote $02, $03
	delay $03, $20
	stext text_55_5dc7
	emote $03, $00
	delay $03, $20
	stext text_55_5dd7
	stext text_55_5e09
	emote $03, $04
	delay $03, $20
	stext text_55_5e3e
	emote $00, $01
	delay $03, $20
	end

Script_055_5a4c::
	textface text_55_5da9
	end

Script_055_5a50::
	textface text_55_5e56
	end

Script_055_5a54::
	textface text_55_5e96
	spriteface  2, FACE_DOWN
	stext text_55_5edc
	emote $03, $00
	delay $03, $20
	stext text_55_5efc
	emote $00, $01
	delay $03, $20
	end

Script_055_5a6d::
	textface text_55_5f11
	end

Script_055_5a71::
	textface text_55_5f65
	end

Script_055_5a75::
	textface text_55_5f91
	end

Script_055_5a79::
	textface text_55_5fe4
	end

Script_055_5a7d::
	checkbit wEventFlags + 7, $02, Script_055_5aeb
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_55_6073
	emote $03, $00
	delay $03, $20
	spriteface  3, FACE_LEFT
	delay $03, $10
	spriteface  3, FACE_RIGHT
	delay $03, $10
	spriteface  3, FACE_DOWN
	stext text_55_6122
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_UP
	stext text_55_6144
	face FACE_LEFT
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_DOWN
	stext text_55_6168
	emote $02, $04
	delay $03, $20
	stext text_55_6193
	emote $03, $03
	delay $03, $20
	stext text_55_61c5
	stext text_55_61ce
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_055_7c94
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	stext text_55_61e2
	setbit wEventFlags + 7, $02
	end

Script_055_5aeb::
	textface text_55_6288
	end
