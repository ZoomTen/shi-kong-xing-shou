ObjectEvents_00e_469f::
	object_event $2d,  8,  6, 0, $00, $00, $00, $00, Script_00e_4849
	object_event $29,  5,  5, 0, $00, $00, $00, $01, Script_00e_46c4
	objects_end

Script_00e_46b6::
	checkbit wEventFlags + 1, $00, Script_00e_46c0
	setmap MAP_G1_33, $00
	end

Script_00e_46c0::
	setmap MAP_G1_33, $01
	end

Script_00e_46c4::
	checkbit wEventFlags + 1, $03, Script_00e_46ce
	textface text_0e_7e33
	end

Script_00e_46ce::
	checkbit wEventFlags + 1, $04, Script_00e_472e
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	emote $03, $00
	delay $03, $20
	stext text_0e_6967
	spriteface $03, $02
	spritewalk $03, $03
	spriteface $03, $01
	spritewalk $03, $02
	spritewalk $03, $02
	stext text_0e_69a6
	spriteface $03, $03
	spritewalk $03, $04
	spriteface $03, $01
	stext text_0e_69ae
	spriteface $03, $00
	spritewalk $03, $01
	spritewalk $03, $01
	emote $03, $02
	delay $03, $20
	stext text_0e_69b6
	stext text_0e_69ef
	emote $03, $01
	delay $03, $20
	stext text_0e_6a00
	stext text_0e_6a52
	listdec $02, $02
	scr_48 $02, $03
	setbit wEventFlags + 1, $04
	end

Script_00e_472e::
	checkbit wEventFlags + 1, $05, Script_00e_4738
	textface text_0e_6a61
	end

Script_00e_4738::
	checkbit wEventFlags + 1, $07, Script_00e_4746
	textface text_0e_6e99
	setbit wEventFlags + 1, $06
	end

Script_00e_4746::
	checkbit wEventFlags + 2, $00, Script_00e_47e5
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	emote $03, $03
	delay $03, $20
	stext text_0e_6f6b
	spriteface $03, $02
	spritewalk $03, $03
	spritewalk $03, $03
	spriteface $03, $00
	emote $03, $00
	delay $03, $20
	spriteface $03, $03
	spritewalk $03, $04
	spritewalk $03, $04
	spriteface $03, $00
	stext text_0e_6f86
	emote $03, $04
	delay $03, $20
	stext text_0e_6fc3
	spriteface $03, $01
	spritewalk $03, $02
	spritewalk $03, $02
	emote $03, $01
	delay $03, $20
	spriteface $03, $03
	spritewalk $03, $04
	spritewalk $03, $04
	spriteface $03, $01
	emote $03, $01
	delay $03, $20
	spriteface $03, $02
	spritewalk $03, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spriteface $03, $01
	emote $03, $01
	delay $03, $20
	spriteface $03, $00
	spritewalk $03, $01
	spritewalk $03, $01
	spriteface $03, $03
	spritewalk $03, $04
	spritewalk $03, $04
	spritewalk $03, $04
	spriteface $03, $00
	stext text_0e_7026
	stext text_0e_7090
	setbit wEventFlags + 2, $00
	end

Script_00e_47e5::
	checkbit wEventFlags + 2, $02, Script_00e_47ef
	textface text_0e_709b
	end

Script_00e_47ef::
	checkbit wEventFlags + 2, $03, Script_00e_4812
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	stext text_0e_71c3
	fadeout
	fadein
	stext text_0e_7217
	stext text_0e_726f
	listdec $02, $04
	scr_48 $02, $05
	setbit wEventFlags + 2, $03
	end

Script_00e_4812::
	textface text_0e_7283
	emote $00, $01
	delay $03, $20
	end
