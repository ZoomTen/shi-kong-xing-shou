PowerPlantOutside_ObjectEvents::
	object_event $2b,  5,  6, wEventFlags + 2, $04, $00, $00, $00, Script_00f_40ce
	objects_end

Script_00f_40ce::
	checkbit wEventFlags + 1, $06, Script_00f_40d8
	textface text_0f_4691
	end

Script_00f_40d8::
	checkbit wEventFlags + 2, $03, Script_00f_40ef
	textface text_0f_4691
	emote $00, $01
	delay $03, $20
	stext text_0f_46aa
	setbit wEventFlags + 1, $07
	end

Script_00f_40ef::
	stext text_0f_4a46
	stext text_0f_4a5a
	face FACE_LEFT
	setmap MAP_POWER_PLANT_OUTSIDE, $02
	spriteface $03, $02
	spriteface $02, $03
	spritewalk $03, $03
	spritewalk $03, $03
	spriteface $02, $00
	emote $02, $00
	delay $03, $20
	spriteface $03, $03
	spritewalk $03, $03
	spriteface $03, $01
	spritewalk $03, $02
	spriteface $03, $03
	spriteface $02, $02
	emote $02, $02
	delay $03, $20
	spriteface $03, $02
	setattach $02, $03, $00, $10
	objmove $03, Script_00f_45d4
	clearattach $03
	emote $02, $00
	emote $00, $00
	delay $03, $20
	stext text_0f_4a72
	emote $02, $04
	delay $03, $20
	stext text_0f_4a8e
	startbattle BattleData_02d_4ae3
	checkbit wEventFlags + 3, $03, Script_00f_415c
	clearobject $03
	clearobject $02
	setbit wEventFlags + 2, $04
	end

Script_00f_415c::
	setmap MAP_POWER_PLANT_OUTSIDE, $03
	end
