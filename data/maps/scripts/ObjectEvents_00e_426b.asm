ObjectEvents_00e_426b::
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	object_event $27, 17, 11, 0, $00, $00, $00, $03, Script_00e_42da
	object_event $28, 18, 11, 0, $00, $00, $00, $04, Script_00e_42da
	objects_end

Script_00e_42da::
	setplayerchar $00
	setmap MAP_TECH_CITY_BLACKOUT, $0b
	face FACE_UP
	spriteface $04, $01
	spriteface $05, $01
	spriteface $06, $01
	stext text_0e_6ab3
	stext text_0e_6acf
	emote $00, $04
	delay $03, $20
	stext text_0e_7e60
	stext text_0e_6b0b

Script_00e_42fc::
	warpmode GAMEMODE_RACING_MINIGAME, $2d, $0b
	face FACE_UP
	spriteface $04, $01
	spriteface $05, $01
	spriteface $06, $01
	checkbit wEventFlags + 4, $01, Script_00e_431c
	stext text_0e_6b3f
	stext text_0e_6b6f
	farjump Script_00e_42fc
	end

Script_00e_431c::
	emote $02, $00
	emote $03, $00
	delay $03, $20
	stext text_0e_6ba5
	stext text_0e_6bbd
	stext text_0e_6c02
	stext text_0e_6c29
	emote $02, $01
	emote $03, $01
	delay $03, $20
	stext text_0e_6c51
	emote $00, $00
	emote $04, $00
	emote $05, $00
	delay $03, $20
	stext text_0e_6c92
	stext text_0e_6cc8
	spriteface $02, $03
	spriteface $03, $03
	setattach $02, $03, $00, $f0
	objmove $03, Script_0e_7e69
	setbit wEventFlags + 1, $05
	setmap MAP_TECH_CITY_BLACKOUT, $0c
	end
