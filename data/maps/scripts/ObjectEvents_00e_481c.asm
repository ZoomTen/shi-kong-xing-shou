ObjectEvents_00e_481c::
	object_event $2d,  8,  6, 0, $00, $00, $00, $00, Script_00e_4849
	object_event $29,  5,  5, 0, $00, $00, $00, $01, Script_00e_484d
	object_event $02,  4,  3, wEventFlags + 1, $00, $00, $00, $02, Script_00e_48f4
	object_event $03,  3,  3, wEventFlags + 1, $00, $00, $00, $03, Script_00e_48ff
	objects_end

Script_00e_4849::
	textface text_0e_5c24
	end

Script_00e_484d::
	checkbit wEventFlags, $06, Script_00e_488f
	walkpath
	face FACE_UP
	dirmovement
	spriteface $01, $01
	stext text_0e_5c9e
	stext text_0e_5ce0
	fadeout
	fadein
	stext text_0e_5d33
	delay $03, $07
	emote $03, $00
	delay $03, $20
	stext text_0e_5dae
	stext text_0e_5e40
	stext text_0e_5e5d
	face FACE_DOWN
	emote $00, $00
	emote $03, $00
	delay $03, $20
	face FACE_UP
	stext text_0e_5e73
	takeitem ITEMNAMECAT_KEY, KEYITEM_01
	setbit wEventFlags, $06
	end

Script_00e_488f::
	checkbit wEventFlags, $07, Script_00e_4899
	textface text_0e_5e73
	end

Script_00e_4899::
	checkbit wEventFlags + 1, $00, Script_00e_48f0
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_0e_6205
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_DOWN
	setattach $05, $04, $00, $f0
	objmove $04, Script_0e_7eca
	clearattach $04
	spriteface  4, FACE_UP
	spriteface  5, FACE_RIGHT
	stext text_0e_6292
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_0e_62aa
	stext text_0e_62c5
	stext text_0e_62ef
	spriteface  4, FACE_RIGHT
	stext text_0e_6314
	clearplayerpos
	spritewalk  4, MOVE_RIGHT
	clearobject $04
	spritewalk  5, MOVE_RIGHT
	spritewalk  5, MOVE_RIGHT
	clearobject $05
	loadscriptedmon $01
	scr_62 $01, $01
	setbit wEventFlags + 1, $00
	end

Script_00e_48f0::
	textface text_0e_7e33
	end

Script_00e_48f4::
	checkbit wEventFlags, $07, Script_00e_48fb
	end

Script_00e_48fb::
	textface text_0e_61da
	end

Script_00e_48ff::
	textface text_0e_61f6
	end
