ObjectEvents_00e_4366::
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	object_event $27, 17, 11, 0, $00, $00, $00, $03, Script_00e_4480
	object_event $28, 18, 11, 0, $00, $00, $00, $04, Script_00e_4480
	objects_end

ObjectEvents_00e_43d5::
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	objects_end

Script_00e_442e::
	textface text_0e_54ce
	end

Script_00e_4432::
	checkbit wEventFlags, $07, Script_00e_443c
	textface text_0e_5518
	end

Script_00e_443c::
	checkbit wEventFlags + 1, $05, Script_00e_4446
	textface text_0e_6188
	end

Script_00e_4446::
	textface text_0e_6dc7
	end

Script_00e_444a::
	textface text_0e_5555
	end

Script_00e_444e::
	checkbit wEventFlags + 1, $05, Script_00e_4458
	textface text_0e_5592
	end

Script_00e_4458::
	textface text_0e_6d1a
	end

Script_00e_445c::
	checkbit wEventFlags + 1, $05, Script_00e_4466
	textface text_0e_5666
	end

Script_00e_4466::
	textface text_0e_6d47
	end

Script_00e_446a::
	textface text_0e_56f4
	end

Script_00e_446e::
	textface text_0e_5740
	end

Script_00e_4472::
	checkbit wEventFlags + 1, $05, Script_00e_447c
	textface text_0e_576d
	end

Script_00e_447c::
	textface text_0e_6d70
	end

Script_00e_4480::
	setmap MAP_TECH_CITY_BLACKOUT, $0b
	face FACE_UP
	spriteface $04, $01
	spriteface $05, $01
	spriteface $06, $01
	stext text_0e_5ebb
	spriteface $04, $02
	spriteface $05, $03
	stext text_0e_5ee0
	emote $02, $00
	emote $03, $00
	delay $03, $20
	stext text_0e_5ef5
	spriteface $04, $01
	spriteface $05, $01
	emote $02, $02
	delay $03, $20
	stext text_0e_5f1f
	stext text_0e_5f4b
	stext text_0e_5f67
	stext text_0e_5f7e
	stext text_0e_5f99
	stext text_0e_5fa2
	stext text_0e_5fab
	emote $00, $00
	emote $04, $00
	emote $05, $00
	delay $03, $20
	stext text_0e_5fc0
	stext text_0e_6015
	stext text_0e_6055
	stext text_0e_6068
	stext text_0e_60a4
	stext text_0e_60d9
	stext text_0e_60f7
	spriteface $02, $03
	spriteface $03, $03
	setattach $02, $03, $00, $f0
	objmove $03, Script_0e_7e69
	setbit wEventFlags, $07
	setmap MAP_TECH_CITY_BLACKOUT, $0c
	end
