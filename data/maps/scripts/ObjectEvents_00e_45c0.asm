ObjectEvents_00e_45c0::
	object_event $13,  4,  3, 0, $00, $00, $00, $00, Script_00e_45e2
	object_event $1b,  6,  6, 0, $00, $00, $06, $01, Script_00e_45f0
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, Script_00e_45f4
	objects_end

Script_00e_45e2::
	checkbit wEventFlags + 1, $05, Script_00e_45ec
	textface text_0e_59f6
	end

Script_00e_45ec::
	textface text_0e_6dec
	end

Script_00e_45f0::
	textface text_0e_5a5a
	end

Script_00e_45f4::
	checkbit wEventFlags + 1, $05, Script_00e_461c
	spriteface $04, $03
	emote $04, $00
	delay $03, $20
	spriteface $04, $02
	spriteface $02, $03
	stext text_0e_5ac1
	stext text_0e_5b18
	spriteface $02, $00
	stext text_0e_5b22
	emote $00, $01
	delay $03, $20
	end

Script_00e_461c::
	textface text_0e_6e16
	spriteface $02, $03
	emote $02, $00
	delay $03, $20
	stext text_0e_6e80
	emote $00, $01
	delay $03, $20
	end
