BanglinCo1f_ObjectEvents::
	object_event $45,  2,  2, 0, $00, $00, $00, $00, Script_04f_4775
	object_event $1f,  1,  6, 0, $00, $00, $00, $01, Script_04f_4b77
	object_event $25, 10,  4, wEventFlags + 5, $00, $00, $00, $02, Script_04f_477d
	object_event $14,  9,  8, 0, $00, $00, $09, $03, Script_04f_4782
	objects_end

BanglinCo1f_ObjectEvents2::
	object_event $45,  2,  3, wEventFlags + $18, $00, $00, $00, $00, Script_04f_4775
	object_event $45,  2,  2, wEventFlags + $18, $00, $01, $00, $00, Script_04f_4775
	object_event $1f,  1,  6, 0, $00, $00, $00, $01, Script_04f_4b77
	object_event $25, 10,  4, wEventFlags + 5, $00, $00, $00, $02, Script_04f_477d
	object_event $14,  9,  8, 0, $00, $00, $09, $03, Script_04f_4782
	object_event $11,  2,  2, wEventFlags + $18, $00, $00, $00, $04, Script_04f_4031
	objects_end

SkyCity_ObjectEvents::
	object_event $16, 23,  6, 0, $00, $00, $07, $00, Script_04f_4790
	object_event $16,  9, 22, 0, $00, $00, $0b, $01, Script_04f_4794
	object_event $12, 13, 17, 0, $00, $00, $05, $03, Script_04f_47ba
	object_event $13,  3,  4, 0, $00, $00, $0b, $03, Script_04f_47be
	object_event $2b,  6, 24, 0, $00, $00, $00, $00, Script_04f_47d6
	object_event $15, 26, 14, wEventFlags + 5, $01, $00, $00, $01, Script_04f_4809
	object_event $1d, 26, 15, wEventFlags + 5, $01, $00, $00, $02, Script_04f_480d
	object_event $1a, 24, 22, 0, $00, $00, $0a, $03, Script_04f_4811
	object_event $1c,  7, 10, 0, $00, $00, $08, $04, Script_04f_4815
	objects_end

FashionStore_ObjectEvents::
	object_event $25,  8,  8, 0, $00, $00, $00, $00, Script_04f_4819
	object_event $3e,  6,  4, wEventFlags + 6, $02, $00, $00, $01, Script_04f_4831
	objects_end

FashionStore_ObjectEvents2::
	object_event $25,  8,  8, 0, $00, $00, $00, $00, Script_04f_4819
	object_event $3e,  6,  4, 0, $00, $00, $00, $01, Script_04f_4831
	object_event $27,  5,  6, wEventFlags + 5, $02, $00, $00, $02, Script_04f_481d
	object_event $28,  6,  6, wEventFlags + 5, $02, $00, $00, $03, Script_04f_4821
	objects_end

Script_04f_44a2::
	checkbit wEventFlags + 5, $02, .skip
	setmap MAP_FASHION_STORE, $01
	face FACE_LEFT
	spriteface $02, $02
	spriteface $04, $01
	spriteface $05, $01
	emote $04, $04
	delay $03, $20
	stext text_4f_5c0f
	stext text_4f_5c7d
	emote $03, $04
	delay $03, $20
	stext text_4f_5cb4
	emote $04, $00
	emote $05, $00
	delay $03, $20
	stext text_4f_5cdc
	emote $04, $02
	delay $03, $20
	stext text_4f_5cf2
	stext text_4f_5d1c
	stext text_4f_5d38
	stext text_4f_5d50
	emote $04, $02
	emote $05, $02
	delay $03, $20
	stext text_4f_5d6b
	stext text_4f_5d74
	stext text_4f_5d7d
	emote $00, $01
	emote $01, $01
	emote $02, $01
	emote $03, $01
	delay $03, $20
	stext text_4f_5d91
	stext text_4f_5ddb
	stext text_4f_5dfe
	face FACE_DOWN
	spriteface $04, $00
	spriteface $05, $00
	setattach $05, $04, $00, $10
	objmove $04, MovementData_4f_7ae1
	clearobject $04
	clearobject $05
	face FACE_UP
	emote $03, $04
	delay $03, $20
	stext text_4f_5e5b
	setbit wEventFlags + 5, $02
	end
.skip
	setmap MAP_FASHION_STORE, $00
	end
