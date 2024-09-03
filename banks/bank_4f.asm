unk_04f_4000:
	scr_end

Script_04f_4001:
	scr_checkbit wdaa6, $04, .skip
	scr_setmap $08, $00 ; TEMP
	scr_end
.skip
	db $66 ; TEMP
	scr_spriteface $40, $4e ; TEMP
	scr_end

ObjectEvents_04f_4010:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_04f_401c
	objects_end

Script_04f_401c:
	scr_04 text_4f_406d
	scr_end

Script_04f_4020::
	dr $13c020, $13c031

Script_04f_4031:
	scr_end

ObjectEvents_04f_4032:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_04f_4049
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_04f_404d
	objects_end

Script_04f_4049:
	scr_text text_4f_407f
	scr_end

Script_04f_404d:
	scr_text text_4f_4097
	scr_end

Script_04f_4051:
	scr_face $01 ; TEMP
	scr_text text_4f_407f
	scr_checkbit wdaa3, $03, .skip
	scr_37
	scr_end
.skip
	scr_end

Script_04f_405f:
	scr_face $01 ; TEMP
	scr_text text_4f_4097
	scr_checkbit wdaa3, $03, .skip
	scr_36
	scr_end
.skip
	scr_end

text_4f_406d::
	dr $13c06d, $13c07f

text_4f_407f::
	dr $13c07f, $13c097

text_4f_4097::
	dr $13c097, $13c0c6

Script_04f_40c6::
	dr $13c0c6, $13c0e1

Script_04f_40e1::
	dr $13c0e1, $13c0eb

Script_04f_40eb::
	dr $13c0eb, $13c0f5

Script_04f_40f5::
	dr $13c0f5, $13c110

Script_04f_4110::
	dr $13c110, $13c11a

Script_04f_411a::
	dr $13c11a, $13c135

Script_04f_4135::
	dr $13c135, $13c13f

Script_04f_413f::
	dr $13c13f, $13c15a

Script_04f_415a::
	dr $13c15a, $13c164

Script_04f_4164::
	dr $13c164, $13c16e

Script_04f_416e::
	dr $13c16e, $13c189

Script_04f_4189::
	dr $13c189, $13c193

Script_04f_4193::
	dr $13c193, $13c1ae

Script_04f_41ae::
	dr $13c1ae, $13c1b8

Script_04f_41b8::
	dr $13c1b8, $13c1d3

Script_04f_41d3::
	dr $13c1d3, $13c1dd

Script_04f_41dd::
	dr $13c1dd, $13c1f8

Script_04f_41f8::
	dr $13c1f8, $13c202

Script_04f_4202::
	dr $13c202, $13c220

Script_04f_4220::
	dr $13c220, $13c22a

Script_04f_422a::
	dr $13c22a, $13c234

Script_04f_4234::
	dr $13c234, $13c252

Script_04f_4252::
	dr $13c252, $13c25c

Script_04f_425c::
	dr $13c25c, $13c27a

Script_04f_427a::
	dr $13c27a, $13c284

Script_04f_4284::
	dr $13c284, $13c2a2

Script_04f_42a2::
	dr $13c2a2, $13c2ac

Script_04f_42ac::
	dr $13c2ac, $13c2b6

Script_04f_42b6::
	dr $13c2b6, $13c2d4

Script_04f_42d4::
	dr $13c2d4, $13c2de

Script_04f_42de::
	dr $13c2de, $13c2fc

Script_04f_42fc::
	dr $13c2fc, $13c306

Script_04f_4306::
	dr $13c306, $13c324

Script_04f_4324::
	dr $13c324, $13c32e

Script_04f_432e::
	dr $13c32e, $13c34c

Script_04f_434c::
	dr $13c34c, $13c389

ObjectEvents_04f_4389::
	objects_end

ObjectEvents_04f_438a:
	object_event $45,  2,  2, 0, $00, $00, $00, $00, Script_04f_4775
	object_event $1f,  1,  6, 0, $00, $00, $00, $01, Script_04f_4b77
	object_event $25, 10,  4, wdaa5, $00, $00, $00, $02, Script_04f_477d
	object_event $14,  9,  8, 0, $00, $00, $09, $03, Script_04f_4782
	objects_end

ObjectEvents_04f_43b7:
	object_event $45,  2,  3, wdab8, $00, $00, $00, $00, Script_04f_4775
	object_event $45,  2,  2, wdab8, $00, $01, $00, $00, Script_04f_4775
	object_event $1f,  1,  6, 0, $00, $00, $00, $01, Script_04f_4b77
	object_event $25, 10,  4, wdaa5, $00, $00, $00, $02, Script_04f_477d
	object_event $14,  9,  8, 0, $00, $00, $09, $03, Script_04f_4782
	object_event $11,  2,  2, wdab8, $00, $00, $00, $04, Script_04f_4031
	objects_end

ObjectEvents_04f_43fa:
	object_event $16, 23,  6, 0, $00, $00, $07, $00, Script_04f_4790
	object_event $16,  9, 22, 0, $00, $00, $0b, $01, Script_04f_4794
	object_event $12, 13, 17, 0, $00, $00, $05, $03, Script_04f_47ba
	object_event $13,  3,  4, 0, $00, $00, $0b, $03, Script_04f_47be
	object_event $2b,  6, 24, 0, $00, $00, $00, $00, Script_04f_47d6
	object_event $15, 26, 14, wdaa5, $01, $00, $00, $01, Script_04f_4809
	object_event $1d, 26, 15, wdaa5, $01, $00, $00, $02, Script_04f_480d
	object_event $1a, 24, 22, 0, $00, $00, $0a, $03, Script_04f_4811
	object_event $1c,  7, 10, 0, $00, $00, $08, $04, Script_04f_4815
	objects_end

ObjectEvents_04f_445e:
	object_event $25,  8,  8, 0, $00, $00, $00, $00, Script_04f_4819
	object_event $3e,  6,  4, wdaa6, $02, $00, $00, $01, Script_04f_4831
	objects_end

ObjectEvents_04f_4475:
	object_event $25,  8,  8, 0, $00, $00, $00, $00, Script_04f_4819
	object_event $3e,  6,  4, 0, $00, $00, $00, $01, Script_04f_4831
	object_event $27,  5,  6, wdaa5, $02, $00, $00, $02, Script_04f_481d
	object_event $28,  6,  6, wdaa5, $02, $00, $00, $03, Script_04f_4821
	objects_end

Script_04f_44a2:
	scr_checkbit wdaa5, $02, .skip
	scr_setmap $0f, $01 ; TEMP
	scr_face $02 ; TEMP
	scr_spriteface $02, $02 ; TEMP
	scr_spriteface $04, $01 ; TEMP
	scr_spriteface $05, $01 ; TEMP
	scr_emote $04, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_4f_5c0f
	scr_text text_4f_5c7d
	scr_emote $03, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_4f_5cb4
	scr_emote $04, $00 ; TEMP
	scr_emote $05, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_4f_5cdc
	scr_emote $04, $02 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_4f_5cf2
	scr_text text_4f_5d1c
	scr_text text_4f_5d38
	scr_text text_4f_5d50
	scr_emote $04, $02 ; TEMP
	scr_emote $05, $02 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_4f_5d6b
	scr_text text_4f_5d74
	scr_text text_4f_5d7d
	scr_emote $00, $01 ; TEMP
	scr_emote $01, $01 ; TEMP
	scr_emote $02, $01 ; TEMP
	scr_emote $03, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_4f_5d91
	scr_text text_4f_5ddb
	scr_text text_4f_5dfe
	scr_face $00 ; TEMP
	scr_spriteface $04, $00 ; TEMP
	scr_spriteface $05, $00 ; TEMP
	scr_1a $05, $04, $00, $10 ; TEMP
	scr_4e $04, unk_4f_7ae1
	scr_1c $04 ; TEMP
	scr_1c $05 ; TEMP
	scr_face $01 ; TEMP
	scr_emote $03, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_4f_5e5b
	scr_setbit $daa5, $02 ; TEMP
	scr_end
.skip
	scr_setmap $0f, $00 ; TEMP
	scr_end

ObjectEvents_04f_453c:
	object_event $3a, 11,  7, 0, $00, $00, $00, $00, Script_04f_455e
	object_event $44,  8,  8, 0, $00, $00, $00, $01, Script_04f_4576
	object_event $42, 11, 11, 0, $00, $00, $00, $02, Script_04f_456a
	objects_end

Script_04f_455e:
	dr $13c55e, $13c56a

Script_04f_456a:
	dr $13c56a, $13c576

Script_04f_4576:
	dr $13c576, $13c582

ObjectEvents_04f_4582::
	dr $13c582, $13c5c6

Script_04f_45c6::
	dr $13c5c6, $13c63f

ObjectEvents_04f_463f::
	dr $13c63f, $13c656

ObjectEvents_04f_4656::
	dr $13c656, $13c69c

ObjectEvents_04f_469c::
	dr $13c69c, $13c6d4

ObjectEvents_04f_46d4::
	dr $13c6d4, $13c6eb

ObjectEvents_04f_46eb::
	dr $13c6eb, $13c70d

ObjectEvents_04f_470d::
	dr $13c70d, $13c724

ObjectEvents_04f_4724::
	dr $13c724, $13c73b

ObjectEvents_04f_473b::
	dr $13c73b, $13c752

ObjectEvents_04f_4752::
	dr $13c752, $13c75e

ObjectEvents_04f_475e::
	dr $13c75e, $13c775

Script_04f_4775::
	dr $13c775, $13c77d

Script_04f_477d::
	dr $13c77d, $13c782

Script_04f_4782::
	dr $13c782, $13c790

Script_04f_4790::
	dr $13c790, $13c794

Script_04f_4794::
	dr $13c794, $13c7ba

Script_04f_47ba::
	dr $13c7ba, $13c7be

Script_04f_47be::
	dr $13c7be, $13c7d6

Script_04f_47d6::
	dr $13c7d6, $13c809

Script_04f_4809::
	dr $13c809, $13c80d

Script_04f_480d::
	dr $13c80d, $13c811

Script_04f_4811::
	dr $13c811, $13c815

Script_04f_4815::
	dr $13c815, $13c819

Script_04f_4819::
	dr $13c819, $13c81d

Script_04f_481d::
	dr $13c81d, $13c821

Script_04f_4821::
	dr $13c821, $13c831

Script_04f_4831::
	dr $13c831, $13c8a9

Script_04f_48a9::
	dr $13c8a9, $13cab6

ObjectEvents_04f_4ab6::
	dr $13cab6, $13cac2

Script_04f_4ac2::
	dr $13cac2, $13cb3f

ObjectEvents_04f_4b3f::
	dr $13cb3f, $13cb77

Script_04f_4b77:
	dr $13cb77, $13cb83

Script_04f_4b83::
	dr $13cb83, $13cbf3

Script_04f_4bf3::
	dr $13cbf3, $13cc80

ObjectEvents_04f_4c80::
	dr $13cc80, $13cccb

ObjectEvents_04f_4ccb::
	dr $13cccb, $13cd58

ObjectEvents_04f_4d58::
	dr $13cd58, $13cd6f

Script_04f_4d6f::
	dr $13cd6f, $13cd94

Script_04f_4d94::
	dr $13cd94, $13cdb2

ObjectEvents_04f_4db2::
	dr $13cdb2, $13cdbe

Script_04f_4dbe::
	dr $13cdbe, $13cde3

INCLUDE "data/text/bank4f_misc.asm"

unk_4f_7ae1::
	dr $13fae1, $13fcff

