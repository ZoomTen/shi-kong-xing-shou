ObjectEvents_00e_422d::
	object_event $12, 14,  6, 0, $00, $00, $09, $00, Script_00e_424f
	object_event $1d, 10,  8, 0, $00, $00, $00, $01, Script_00e_4253
	object_event $1e,  6,  6, 0, $00, $00, $06, $02, Script_00e_4257
	objects_end

Script_00e_424f::
	textface text_0e_5347
	end

Script_00e_4253::
	textface text_0e_53c0
	end

Script_00e_4257::
	textface text_0e_5437
	startbattle BattleData_02d_4ab4
	checkbit wEventFlags + 3, $03, .script_00e_4267
	stext text_0e_547a
	end

.script_00e_4267
	stext text_0e_54a2
	end
