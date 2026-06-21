Script_04f_4000:
	end

Script_04f_4001:
	checkbit wEventFlags + 6, $04, .skip
	setmap $08, $00
	end
.skip
	farjump2 Script_04e_4001
	end

G3_1E_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_04f_401c
	objects_end

Script_04f_401c:
	textface text_4f_406d
	end

Script_04f_4020::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_4f_406d
	checkbit wEventFlags + 4, $01, Script_04f_4031
	scr_35 $03
	end

Script_04f_4031:
	end

G3_1D_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_04f_4049
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_04f_404d
	objects_end

Script_04f_4049:
	stext text_4f_407f
	end

Script_04f_404d:
	stext text_4f_4097
	end

Script_04f_4051:
	face FACE_UP
	stext text_4f_407f
	checkbit wEventFlags + 3, $03, .skip
	scr_37
	end
.skip
	end

Script_04f_405f:
	face FACE_UP
	stext text_4f_4097
	checkbit wEventFlags + 3, $03, .skip
	townmusicanim
	end
.skip
	end

INCLUDE "data/text/bank4f_406d.asm"

INCLUDE "data/text/bank4f_407f.asm"

INCLUDE "data/text/bank4f_4097.asm"

Script_04f_40c6::
	face FACE_RIGHT
	ifcharindex $02, Script_04f_40d0
	stext text_4f_4356
	end
Script_04f_40d0::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $0092, $a7
	swapfollower
	end

Script_04f_40e1::
	face FACE_LEFT
	ifcharindex $02, Script_04f_40d0
	stext text_4f_4356
	end

Script_04f_40eb::
	face FACE_UP
	ifcharindex $02, Script_04f_40d0
	stext text_4f_4356
	end

Script_04f_40f5::
	face FACE_UP
	ifcharindex $02, Script_04f_40ff
	stext text_4f_4356
	end
Script_04f_40ff::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $0069, $a8
	swapfollower
	end

Script_04f_4110::
	face FACE_DOWN
	ifcharindex $02, Script_04f_40ff
	stext text_4f_4356
	end

Script_04f_411a::
	face FACE_UP
	ifcharindex $02, Script_04f_4124
	stext text_4f_4356
	end
Script_04f_4124::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $0025, $a9
	swapfollower
	end

Script_04f_4135::
	face FACE_DOWN
	ifcharindex $02, Script_04f_4124
	stext text_4f_4356
	end

Script_04f_413f::
	face FACE_RIGHT
	ifcharindex $02, Script_04f_4149
	stext text_4f_4356
	end
Script_04f_4149::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $001b, $aa
	swapfollower
	end

Script_04f_415a::
	face FACE_DOWN
	ifcharindex $02, Script_04f_4149
	stext text_4f_4356
	end

Script_04f_4164::
	face FACE_LEFT
	ifcharindex $02, Script_04f_4149
	stext text_4f_4356
	end

Script_04f_416e::
	face FACE_UP
	ifcharindex $02, Script_04f_4178
	stext text_4f_4356
	end
Script_04f_4178::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $0055, $a7
	swapfollower
	end

Script_04f_4189::
	face FACE_DOWN
	ifcharindex $02, Script_04f_4178
	stext text_4f_4356
	end

Script_04f_4193::
	face FACE_UP
	ifcharindex $02, Script_04f_419d
	stext text_4f_4356
	end
Script_04f_419d::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $008e, $a8
	swapfollower
	end

Script_04f_41ae::
	face FACE_DOWN
	ifcharindex $02, Script_04f_419d
	stext text_4f_4356
	end

Script_04f_41b8::
	face FACE_UP
	ifcharindex $02, Script_04f_41c2
	stext text_4f_4356
	end
Script_04f_41c2::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $002e, $a9
	swapfollower
	end

Script_04f_41d3::
	face FACE_DOWN
	ifcharindex $02, Script_04f_41c2
	stext text_4f_4356
	end

Script_04f_41dd::
	face FACE_UP
	ifcharindex $02, Script_04f_41e7
	stext text_4f_4356
	end
Script_04f_41e7::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	delay $01, $03
	setlayouttile $0027, $aa
	swapfollower
	end

Script_04f_41f8::
	face FACE_DOWN
	ifcharindex $02, Script_04f_41e7
	stext text_4f_4356
	end

Script_04f_4202::
	face FACE_RIGHT
	ifcharindex $02, Script_04f_420c
	stext text_4f_4356
	end
Script_04f_420c::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $0092, $a5
	swapfollower
	end

Script_04f_4220::
	face FACE_LEFT
	ifcharindex $02, Script_04f_420c
	stext text_4f_4356
	end

Script_04f_422a::
	face FACE_UP
	ifcharindex $02, Script_04f_420c
	stext text_4f_4356
	end

Script_04f_4234::
	face FACE_UP
	ifcharindex $02, Script_04f_423e
	stext text_4f_4356
	end
Script_04f_423e::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $0069, $a6
	swapfollower
	end

Script_04f_4252::
	face FACE_DOWN
	ifcharindex $02, Script_04f_423e
	stext text_4f_4356
	end

Script_04f_425c::
	face FACE_UP
	ifcharindex $02, Script_04f_4266
	stext text_4f_4356
	end
Script_04f_4266::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $0025, $a7
	swapfollower
	end

Script_04f_427a::
	face FACE_DOWN
	ifcharindex $02, Script_04f_4266
	stext text_4f_4356
	end

Script_04f_4284::
	face FACE_RIGHT
	ifcharindex $02, Script_04f_428e
	stext text_4f_4356
	end
Script_04f_428e::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $001b, $a8
	swapfollower
	end

Script_04f_42a2::
	face FACE_DOWN
	ifcharindex $02, Script_04f_428e
	stext text_4f_4356
	end

Script_04f_42ac::
	face FACE_LEFT
	ifcharindex $02, Script_04f_428e
	stext text_4f_4356
	end

Script_04f_42b6::
	face FACE_UP
	ifcharindex $02, Script_04f_42c0
	stext text_4f_4356
	end
Script_04f_42c0::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $0055, $a7
	swapfollower
	end

Script_04f_42d4::
	face FACE_DOWN
	ifcharindex $02, Script_04f_42c0
	stext text_4f_4356
	end

Script_04f_42de::
	face FACE_UP
	ifcharindex $02, Script_04f_42e8
	stext text_4f_4356
	end
Script_04f_42e8::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $008e, $a8
	swapfollower
	end

Script_04f_42fc::
	face FACE_DOWN
	ifcharindex $02, Script_04f_42e8
	stext text_4f_4356
	end

Script_04f_4306::
	face FACE_UP
	ifcharindex $02, Script_04f_4310
	stext text_4f_4356
	end
Script_04f_4310::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $002e, $a9
	swapfollower
	end

Script_04f_4324::
	face FACE_DOWN
	ifcharindex $02, Script_04f_4310
	stext text_4f_4356
	end

Script_04f_432e::
	face FACE_UP
	ifcharindex $02, Script_04f_4338
	stext text_4f_4356
	end
Script_04f_4338::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_697e
	copytilemapplayer $88, $69
	delay $01, $03
	setlayouttile $0027, $aa
	swapfollower
	end

Script_04f_434c::
	face FACE_DOWN
	ifcharindex $02, Script_04f_4338
	stext text_4f_4356
	end
INCLUDE "data/text/bank4f_4356.asm"
Script_04f_4384:: ; farjump2 target (bank_12)
	warp3 $15, $01, $03
	end

GreenForestP12_ObjectEvents:
GreenForestP21_ObjectEvents:
GreenForestP31_ObjectEvents:
GreenForestP22_ObjectEvents:
GreenForestP32_ObjectEvents:
AirportOutside_ObjectEvents:
G3_15_ObjectEvents:
G3_16_ObjectEvents:
G3_18_ObjectEvents:
G3_1F_ObjectEvents:
	objects_end

BanglinCo1f_ObjectEvents:
	object_event $45,  2,  2, 0, $00, $00, $00, $00, Script_04f_4775
	object_event $1f,  1,  6, 0, $00, $00, $00, $01, Script_04f_4b77
	object_event $25, 10,  4, wEventFlags + 5, $00, $00, $00, $02, Script_04f_477d
	object_event $14,  9,  8, 0, $00, $00, $09, $03, Script_04f_4782
	objects_end

BanglinCo1f_ObjectEvents2:
	object_event $45,  2,  3, wEventFlags + $18, $00, $00, $00, $00, Script_04f_4775
	object_event $45,  2,  2, wEventFlags + $18, $00, $01, $00, $00, Script_04f_4775
	object_event $1f,  1,  6, 0, $00, $00, $00, $01, Script_04f_4b77
	object_event $25, 10,  4, wEventFlags + 5, $00, $00, $00, $02, Script_04f_477d
	object_event $14,  9,  8, 0, $00, $00, $09, $03, Script_04f_4782
	object_event $11,  2,  2, wEventFlags + $18, $00, $00, $00, $04, Script_04f_4031
	objects_end

SkyCity_ObjectEvents:
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

FashionStore_ObjectEvents:
	object_event $25,  8,  8, 0, $00, $00, $00, $00, Script_04f_4819
	object_event $3e,  6,  4, wEventFlags + 6, $02, $00, $00, $01, Script_04f_4831
	objects_end

FashionStore_ObjectEvents2:
	object_event $25,  8,  8, 0, $00, $00, $00, $00, Script_04f_4819
	object_event $3e,  6,  4, 0, $00, $00, $00, $01, Script_04f_4831
	object_event $27,  5,  6, wEventFlags + 5, $02, $00, $00, $02, Script_04f_481d
	object_event $28,  6,  6, wEventFlags + 5, $02, $00, $00, $03, Script_04f_4821
	objects_end

Script_04f_44a2:
	checkbit wEventFlags + 5, $02, .skip
	setmap $0f, $01
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
	setmap $0f, $00
	end

G3_21_ObjectEvents:
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

G3_21_ObjectEvents2:
	dr $13c582, $13c5c6

Script_04f_45c6::
	dr $13c5c6, $13c63f

G3_22_ObjectEvents:
	dr $13c63f, $13c656

G3_23_ObjectEvents:
	dr $13c656, $13c69c

GreenForestP4_ObjectEvents:
	dr $13c69c, $13c6d4

GreenForestP5_ObjectEvents:
	dr $13c6d4, $13c6eb

GreenForestP6_ObjectEvents:
	dr $13c6eb, $13c70d

G3_17_ObjectEvents:
	dr $13c70d, $13c724

G3_19_ObjectEvents:
	dr $13c724, $13c73b

G3_1A_ObjectEvents:
	dr $13c73b, $13c752

G3_1B_ObjectEvents:
	dr $13c752, $13c75e

G3_1C_ObjectEvents:
	dr $13c75e, $13c775

Script_04f_4775::
	dr $13c775, $13c77d

Script_04f_477d::
	farjump Script_04f_4bf3
	end

Script_04f_4782::
	dr $13c782, $13c790

Script_04f_4790::
	textface text_4f_4de3
	end

Script_04f_4794::
	dr $13c794, $13c7ba

Script_04f_47ba::
	textface text_4f_4ee0
	end

Script_04f_47be::
	dr $13c7be, $13c7d6

Script_04f_47d6::
	dr $13c7d6, $13c809

Script_04f_4809::
	textface text_4f_4f98
	end

Script_04f_480d::
	textface text_4f_4fb0
	end

Script_04f_4811::
	textface text_4f_4fec
	end

Script_04f_4815::
	textface text_4f_5048
	end

Script_04f_4819::
	textface text_4f_5be3
	end

Script_04f_481d::
	textface text_4f_5c0f
	end

Script_04f_4821::
	dr $13c821, $13c831

Script_04f_4831::
	dr $13c831, $13c8a9

Script_04f_48a9::
	dr $13c8a9, $13cab6

SkyCity_ObjectEvents2:
	object_event $11, 15,  8, 0, $00, $00, $00, $00, Script_04f_4031
	objects_end

Script_04f_4ac2::
	setplayerchar $00
	setmap $07, $0d
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4f_5430
	face FACE_UP
	move MovementData_OneUp
	move MovementData_OneUp
	move MovementData_OneUp
	setmap $08, $03
	face FACE_LEFT
	spriteface  2, FACE_UP
	stext text_4f_5457
	stext text_4f_5470
	spriteface  6, FACE_LEFT
	spritewalk  6, MOVE_LEFT
	clearobject $06
	face FACE_LEFT
	move MovementData_OneLeft
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_LEFT
	stext text_4f_5477
	face FACE_DOWN
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4f_54bb
	stext text_4f_54ce
	stext text_4f_54e8
	stext text_4f_54fb
	face FACE_RIGHT
	move MovementData_OneRight
	move MovementData_OneRight
	spriteface  1, FACE_RIGHT
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spriteface  2, FACE_DOWN
	emote  0, EMOTE_ANGER
	delay $03, $20
	stext text_4f_5580
	setbit wEventFlags + 24, $00
	setmappredef MAPPREDEF_0d
	end

BanglinCo1f_ObjectEvents3:
	dr $13cb3f, $13cb77

Script_04f_4b77:
	checkbit wEventFlags + 6, $02, Script_04f_4bc6
	textface text_4f_5a2d
	sjump Script_04f_4b91

Script_04f_4b83::
	dr $13cb83, $13cb91
Script_04f_4b91::
	dr $13cb91, $13cbc6
Script_04f_4bc6::
	dr $13cbc6, $13cbcc
Script_04f_4bcc::
	dr $13cbcc, $13cbf2
Script_04f_4bf2::
	end

Script_04f_4bf3::
	checkbit wEventFlags + 5, $00, Script_04f_4bf2
	setplayerchar $00
	face FACE_UP
	setmap $08, $04
	spriteface  6, FACE_UP
	emote  6, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_572e
	spriteface  4, FACE_LEFT
	spriteface  6, FACE_RIGHT
	face FACE_RIGHT
	stext text_4f_5762
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_57d9
	stext text_4f_57e7
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4f_5826
	stext text_4f_583e
	emote  6, EMOTE_EXCLAMATION
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_588e
	stext text_4f_589f
	spriteface  4, FACE_DOWN
	spritewalk  4, MOVE_DOWN
	spriteface  4, FACE_RIGHT
	spritewalk  4, MOVE_RIGHT
	clearobject $04
	spriteface  6, FACE_DOWN
	face FACE_LEFT
	move MovementData_OneLeft
	face FACE_DOWN
	stext text_4f_592a
	stext text_4f_594e
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	stext text_4f_5955
	stext text_4f_59ab
	stext text_4f_59df
	stext text_4f_5a16
	clearplayerpos
	spritewalk  6, MOVE_DOWN
	clearobject $06
	setbit wEventFlags + 5, $00
	end

GreenForestP13_ObjectEvents:
	dr $13cc80, $13cccb

G3_20_ObjectEvents:
	dr $13cccb, $13cd58

G3_1F_ObjectEvents2:
	dr $13cd58, $13cd6f

Script_04f_4d6f::
	dr $13cd6f, $13cd94

Script_04f_4d94::
	dr $13cd94, $13cdb2

GreenForestP32_ObjectEvents2:
	object_event $36,  5,  3, 0, $00, $00, $00, $00, Script_04f_4dbe
	objects_end

Script_04f_4dbe::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_4f_61fa
	stext text_4f_621a
	setbit wEventFlags + 5, $06
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	clearobject $02
	move MovementData_OneUp
	face FACE_LEFT
	move MovementData_OneLeft
	setmap $12, $00
	end2

INCLUDE "data/text/bank4f_misc.asm"

MovementData_4f_7ae1::
	dr $13fae1, $13fcff

