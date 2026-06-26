BaalCapital_0c_ObjectEvents::
	object_event $19,  6,  9, 0, $00, $00, $09, $00, Script_06c_4890
	object_event $16,  8, 27, 0, $00, $00, $0b, $01, Script_06c_4894
	object_event $14, 11,  6, 0, $00, $00, $06, $02, Script_06c_48a2
	object_event $17, 18, 18, 0, $00, $00, $08, $03, Script_06c_48a6
	object_event $13,  9, 17, 0, $00, $00, $0a, $04, Script_06c_48aa
	object_event $1c, 28, 19, 0, $00, $00, $08, $00, Script_06c_48ae
	object_event $15, 28,  5, 0, $00, $00, $0a, $01, Script_06c_48b2
	object_event $22, 23, 12, 0, $00, $00, $09, $02, Script_06c_48c0
	objects_end

BaalCapital_0c_ObjectEvents2::
	object_event $0e, 18,  5, 0, $00, $00, $00, $00, Script_06c_4706
	object_event $12, 15,  5, 0, $00, $00, $00, $01, Script_06c_4706
	object_event $1b, 20,  5, 0, $00, $00, $00, $02, Script_06c_4706
	object_event $19, 16,  7, 0, $00, $00, $00, $03, Script_06c_4706
	object_event $15, 18,  7, 0, $00, $00, $00, $04, Script_06c_4706
	objects_end

Script_06c_4890::
	textface text_6c_517a
	end

Script_06c_4894::
	checkbit wEventFlags + 18, $04, Script_06c_489e
	textface text_6c_5197
	end

Script_06c_489e::
	textface text_6c_5996
	end

Script_06c_48a2::
	textface text_6c_51ff
	end

Script_06c_48a6::
	textface text_6c_5265
	end

Script_06c_48aa::
	textface text_6c_52bf
	end

Script_06c_48ae::
	textface text_6c_5317
	end

Script_06c_48b2::
	checkbit wEventFlags + 18, $04, Script_06c_48bc
	textface text_6c_5368
	end

Script_06c_48bc::
	textface text_6c_59cb
	end

Script_06c_48c0::
	checkbit wEventFlags + 18, $04, Script_06c_48ca
	textface text_6c_53e5
	end

Script_06c_48ca::
	textface text_6c_5a48
	end
