StardreamCity_07_ObjectEvents::
	object_event $14, 33,  8, 0, $00, $00, $00, $00, Script_066_428a
	object_event $17, 26,  7, 0, $00, $00, $00, $01, Script_066_428e
	object_event $1c, 21, 10, 0, $00, $00, $00, $02, Script_066_42a0
	object_event $1a, 27,  5, 0, $00, $00, $00, $03, Script_066_42ee
	object_event $16, 26, 16, 0, $00, $00, $00, $04, Script_066_4323
	object_event $13,  5,  7, 0, $00, $00, $00, $00, Script_066_4331
	object_event $15,  8, 17, 0, $00, $00, $00, $01, Script_066_4335
	object_event $19,  3, 13, 0, $00, $00, $00, $02, Script_066_4339
	object_event $16,  7,  3, 0, $00, $00, $0b, $03, Script_066_433d
	object_event $23,  3,  4, wEventFlags + 15, $04, $00, $00, $01, Script_066_427e
	objects_end

Script_066_427e::
	ifcharindex $05, Script_066_4286
	textface text_66_7b6c
	end

Script_066_4286::
	textface text_66_7b99
	end

Script_066_428a::
	textface text_66_4ef4
	end

Script_066_428e::
	textface text_66_4f51
	end

Script_066_4292::
	checkbit wEventFlags + 17, $05, Script_066_429c
	setmap MAP_PRESALE_HOUSE_1F, $00
	end2

Script_066_429c::
	setmap MAP_PRESALE_HOUSE_1F, $01
	end2

Script_066_42a0::
	checkbit wEventFlags + 17, $06, Script_066_42aa
	textface text_66_500c
	end

Script_066_42aa::
	checkbit wEventFlags + 15, $05, Script_066_42c1
	textface text_66_6de6
	stext text_66_6e8b
	giveitem ITEMNAMECAT_KEY, KEYITEM_1f
	stext text_66_6e9a
	setbit wEventFlags + 15, $05
	end

Script_066_42c1::
	checkbit wEventFlags + 15, $04, Script_066_42cb
	textface text_66_6e9a
	end

Script_066_42cb::
	textface text_66_776e
	end

Script_066_42cf::
	checkbit wEventFlags + 15, $01, Script_066_42d6

Script_066_42d5::
	end

Script_066_42d6::
	checkbit wEventFlags + 16, $01, Script_066_42d5
	countflags10 $07, $e1, $42
	end

Script_066_42e1::
	face FACE_UP
	stext text_66_6f2c
	giveitem ITEMNAMECAT_KEY, KEYITEM_21
	setbit wEventFlags + 16, $01
	end

Script_066_42ee::
	checkbit wEventFlags + 15, $01, Script_066_42f8
	textface text_66_5083
	end

Script_066_42f8::
	checkbit wEventFlags + 15, $03, Script_066_4302
	textface text_66_709b
	end

Script_066_4302::
	checkbit wEventFlags + 16, $03, Script_066_431f
	textface text_66_71a4
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_66_7213
	giveitem ITEMNAMECAT_KEY, KEYITEM_24
	takeitem ITEMNAMECAT_KEY, KEYITEM_23
	setbit wEventFlags + 16, $03
	end

Script_066_431f::
	textface text_66_7225
	end

Script_066_4323::
	checkbit wEventFlags + 15, $04, Script_066_432d
	textface text_66_50b5
	end

Script_066_432d::
	textface text_66_7796
	end

Script_066_4331::
	textface text_66_513e
	end

Script_066_4335::
	textface text_66_51bc
	end

Script_066_4339::
	textface text_66_523a
	end

Script_066_433d::
	textface text_66_5287
	end
