ObjectEvents_00f_4039::
	object_event $13,  4,  3, 0, $00, $00, $00, $00, Script_00f_405b
	object_event $1b,  6,  6, 0, $00, $00, $06, $01, Script_00f_4069
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, Script_00f_406d
	objects_end

Script_00f_405b::
	checkbit wEventFlags + 1, $05, Script_00f_4065
	textface text_0f_57ad
	end

Script_00f_4065::
	textface text_0f_58a2
	end

Script_00f_4069::
	textface text_0f_5811
	end

Script_00f_406d::
	checkbit wEventFlags + 1, $05, Script_00f_4095
	spriteface $04, $03
	emote $04, $00
	delay $03, $20
	spriteface $04, $02
	spriteface $02, $03
	stext text_0f_5820
	stext text_0f_5877
	spriteface $02, $00
	stext text_0f_5881
	emote $00, $01
	delay $03, $20
	end

Script_00f_4095::
	textface text_0f_58cc
	spriteface $02, $03
	emote $02, $00
	delay $03, $20
	stext text_0f_5936
	emote $00, $01
	delay $03, $20
	end

PowerPlantOutside_ObjectEvents2::
	object_event $2b,  5,  6, wEventFlags + 2, $04, $00, $00, $00, Script_00f_4001
	object_event $2e,  7,  7, wEventFlags + 2, $04, $00, $00, $01, Script_00f_4001
	objects_end
