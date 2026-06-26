ObjectEvents_00e_44ff::
	object_event $27, 17, 11, 0, $00, $00, $00, $00, Script_00e_4000
	object_event $28, 18, 11, 0, $00, $00, $00, $01, Script_00e_4000
	object_event $1a, 16, 13, 0, $00, $00, $00, $02, Script_00e_4000
	object_event $1b, 15, 13, 0, $00, $00, $00, $03, Script_00e_4000
	object_event $02, 20, 12, 0, $00, $00, $00, $04, Script_00e_4000
	objects_end

ObjectEvents_00e_4537::
	object_event $16,  8,  7, 0, $00, $00, $00, $00, Script_00e_4543
	objects_end

Script_00e_4543::
	checkbit wEventFlags + 2, $00, Script_00e_454d
	textface text_0e_5806
	end

Script_00e_454d::
	checkbit wEventFlags + 2, $01, Script_00e_456a
	textface text_0e_70c0
	emote $00, $01
	delay $03, $20
	emote $02, $00
	delay $03, $20
	stext text_0e_7136
	setbit wEventFlags + 2, $01
	end

Script_00e_456a::
	checkbit wEventFlags + 2, $02, Script_00e_4574
	textface text_0e_717b
	end

Script_00e_4574::
	textface text_0e_765d
	end
