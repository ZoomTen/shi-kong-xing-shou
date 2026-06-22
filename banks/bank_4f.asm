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
	ifcharindex $03, Script_04f_4566
	textface text_4f_6801
	end

Script_04f_4566:
	textface text_4f_680f
	end

Script_04f_456a:
	ifcharindex $03, Script_04f_4572
	textface text_4f_67d7
	end

Script_04f_4572:
	textface text_4f_6843
	end

Script_04f_4576:
	ifcharindex $03, Script_04f_457e
	textface text_4f_67d7
	end

Script_04f_457e:
	textface text_4f_67cc
	end

G3_21_ObjectEvents2:
	dr $13c582, $13c5ba
ObjSprite_4f_45ba::
	dr $13c5ba, $13c5c6

Script_04f_45c6::
	checkbit wEventFlags + 6, $02, Script_04f_463b
	setplayerchar $02
	face FACE_LEFT
	setmap $21, $03
	scr_62 $03, $00
	spriteface  5, FACE_UP
	spriteface  6, FACE_RIGHT
	stext text_4f_69c8
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spritewalk  3, MOVE_LEFT
	spritewalk  3, MOVE_LEFT
	clearobject $03
	loadobjsprite ObjSprite_4f_45ba
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_DOWN
	emote  5, EMOTE_EXCLAMATION
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_6a43
	stext text_4f_6aa8
	scr_48 $02, $0b
	emote  5, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  5, FACE_RIGHT
	stext text_4f_6ab8
	stext text_4f_6ae3
	stext text_4f_6afa
	spriteface  5, FACE_RIGHT
	spriteface  6, FACE_RIGHT
	setattach $05, $06, $00, $10
	objmove $06, MovementData_04f_7bd4
	clearobject $05
	clearobject $06
	setbit wEventFlags + 6, $02
	end

Script_04f_463b:
	setmap $21, $00
	end2

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
	textface text_4f_55bf
	end

Script_04f_4779:
	textface text_4f_5619
	end

Script_04f_477d::
	farjump Script_04f_4bf3
	end

Script_04f_4782::
	checkbit wEventFlags + 6, $02, Script_04f_478c
	textface text_4f_56fa
	end

Script_04f_478c:
	textface text_4f_6c8c
	end

Script_04f_4790::
	textface text_4f_4de3
	end

Script_04f_4794::
	checkbit wEventFlags + 6, $04, Script_04f_479e
	textface text_4f_4e1c
	end

Script_04f_479e:
	textface text_4f_4e8b
	end

Script_04f_47a2:
	checkbit wEventFlags + 6, $02, Script_04f_47ac
	textface text_4f_4e9b
	end

Script_04f_47ac:
	checkbit wEventFlags + 6, $04, Script_04f_47b6
	textface text_4f_6c8c
	end

Script_04f_47b6:
	textface text_4f_6cd2
	end

Script_04f_47ba::
	textface text_4f_4ee0
	end

Script_04f_47be::
	checkbit wEventFlags + 6, $02, Script_04f_47c8
	textface text_4f_4f38
	end

Script_04f_47c8:
	checkbit wEventFlags + 6, $04, Script_04f_47d2
	textface text_4f_6b41
	end

Script_04f_47d2:
	textface text_4f_6b67
	end

Script_04f_47d6::
	ifcharindex $03, Script_04f_47de
	textface text_4f_4f81
	end

Script_04f_47de:
	checkbit wEventFlags + 6, $07, Script_04f_4805
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_4f_798c
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4f_79aa
	stext text_4f_79b7
	stext text_4f_79ef
	scr_48 $02, $0e
	setbit wEventFlags + 6, $07
	end

Script_04f_4805:
	textface text_4f_7a00
	end

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
	textface text_4f_5c7d
	end
ObjSprite_4f_4825::
	dr $13c825, $13c831

Script_04f_4831::
	checkbit wEventFlags + 5, $03, Script_04f_4881
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	ifcharindex $02, Script_04f_4871
	clearplayerpos
	loadobjsprite ObjSprite_4f_4825
	spriteface  4, FACE_LEFT
	spritewalk  4, MOVE_LEFT
	spriteface  4, FACE_UP
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_DOWN
	stext text_4f_5e85
	stext text_4f_5ea5
	stext text_4f_5f09
	clearplayerpos
	spriteface  4, FACE_RIGHT
	spritewalk  4, MOVE_RIGHT
	clearobject $04
	setbit wEventFlags + 5, $03
	setmappredef MAPPREDEF_0e
	end

Script_04f_4871:
	stext text_4f_5e85
	stext text_4f_5ea5
	stext text_4f_5f09
	setbit wEventFlags + 5, $03
	setmappredef MAPPREDEF_0e
	end

Script_04f_4881:
	textface text_4f_5f1f
	end
ObjSprite_4f_4885::
	dr $13c885, $13c891
ObjSprite_4f_4891::
	dr $13c891, $13c89d
ObjSprite_4f_489d::
	dr $13c89d, $13c8a9

Script_04f_48a9::
	setplayerchar $00
	setmap $07, $0e
	loadobjsprite ObjSprite_4f_4885
	loadobjsprite ObjSprite_4f_4891
	loadobjsprite ObjSprite_4f_489d
	face FACE_DOWN
	spriteface  2, FACE_UP
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	stext text_4f_5f5b
	stext text_4f_5fa7
	setattach $04, $03, $00, $10
	objmove $03, MovementData_04f_7bd4
	clearattach $04
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_5feb
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_UP
	stext text_4f_5ff5
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_5fff
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	emote  3, EMOTE_HEART
	delay $03, $20
	stext text_4f_600b
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_UP
	stext text_4f_6051
	stext text_4f_6077
	spriteface  3, FACE_LEFT
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_609f
	stext text_4f_60c0
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  3, FACE_UP
	stext text_4f_60cd
	spriteface  3, FACE_LEFT
	setattach $04, $03, $00, $10
	objmove $03, MovementData_04f_7bf5
	clearobject $03
	clearobject $04
	spriteface  2, FACE_UP
	stext text_4f_6146
	stext text_4f_6154
	stext text_4f_616c
	clearplayerpos
	spritewalk  2, MOVE_UP
	clearobject $02
	setbit wEventFlags + 5, $04
	setmappredef MAPPREDEF_0f
	end

Script_04f_4950:
	ifcharindex $03, Script_04f_4958
	textface text_4f_6225
	end

Script_04f_4958:
	textface text_4f_64bf
	end

Script_04f_495c:
	ifcharindex $03, Script_04f_4964
	textface text_4f_6233
	end

Script_04f_4964:
	textface text_4f_6527
	end

Script_04f_4968:
	ifcharindex $03, Script_04f_4970
	stext text_4f_623b
	end

Script_04f_4970:
	stext text_4f_658c
	end

Script_04f_4974:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	ifcharindex $02, Script_04f_4983
	stext text_4f_6288
	end

Script_04f_4983:
	stext text_4f_62a1
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4f_62b9
	stext text_4f_62c2
	stext text_4f_62c9
	stext text_4f_634a
	stext text_4f_6356
	stext text_4f_63c8
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_63db
	stext text_4f_6422
	stext text_4f_6438
	clearplayerpos
	spritewalk  4, MOVE_DOWN
	clearobject $04
	spritewalk  5, MOVE_DOWN
	spritewalk  5, MOVE_DOWN
	clearobject $05
	loadscriptedmon $03
	scr_62 $03, $80
	stext text_4f_646c
	stext text_4f_6483
	setbit wEventFlags + 5, $07
	end

Script_04f_49cb:
	ifcharindex $03, Script_04f_49d3
	textface text_4f_6243
	end

Script_04f_49d3:
	textface text_4f_6594
	checkbit wEventFlags + 4, $01, Script_04f_49df
	scr_35 $04
	end

Script_04f_49df:
	end

Script_04f_49e0:
	ifcharindex $03, Script_04f_49e8
	textface text_4f_6254
	end

Script_04f_49e8:
	textface text_4f_65f8
	checkbit wEventFlags + 3, $03, Script_04f_49f3
	scr_37
	end

Script_04f_49f3:
	end

Script_04f_49f4:
	ifcharindex $03, Script_04f_49fc
	textface text_4f_6267
	end

Script_04f_49fc:
	textface text_4f_663f
	end

Script_04f_4a00:
	ifcharindex $03, Script_04f_4a08
	textface text_4f_6274
	end

Script_04f_4a08:
	textface text_4f_666c
	end

Script_04f_4a0c:
	ifcharindex $03, Script_04f_4a14
	textface text_4f_6281
	end

Script_04f_4a14:
	textface text_4f_66c4
	end

Script_04f_4a18:
	checkbit wEventFlags + 5, $02, Script_04f_4a22
	textface text_4f_5093
	end

Script_04f_4a22:
	checkbit wEventFlags + 6, $04, Script_04f_4a2c
	textface text_4f_5107
	end

Script_04f_4a2c:
	textface text_4f_5127
	end

Script_04f_4a30:
	textface text_4f_5161
	end

Script_04f_4a34:
	checkbit wEventFlags + 6, $04, Script_04f_4a3e
	textface text_4f_51ca
	end

Script_04f_4a3e:
	textface text_4f_5208
	end

Script_04f_4a42:
	checkbit wEventFlags + 6, $04, Script_04f_4a4c
	textface text_4f_522b
	end

Script_04f_4a4c:
	textface text_4f_5284
	end

Script_04f_4a50:
	checkbit wEventFlags + 6, $02, Script_04f_4a5a
	textface text_4f_52bc
	end

Script_04f_4a5a:
	textface text_4f_6bf9
	end

Script_04f_4a5e:
	checkbit wEventFlags + 6, $02, Script_04f_4a68
	textface text_4f_531d
	end

Script_04f_4a68:
	textface text_4f_6c29
	end

Script_04f_4a6c:
	textface text_4f_5372
	end

Script_04f_4a70:
	checkbit wEventFlags + 6, $07, Script_04f_4a7a
	textface text_4f_53d3
	end

Script_04f_4a7a:
	checkbit wEventFlags + 6, $04, Script_04f_4a97
	checkbit wEventFlags + 7, $00, Script_04f_4aae
	stext text_4f_7a15
	stext text_4f_7a54
	listdec $02, $0e
	scr_48 $00, $14
	setbit wEventFlags + 7, $00
	end

Script_04f_4a97:
	checkbit wEventFlags + 7, $00, Script_04f_4aae
	stext text_4f_7a70
	stext text_4f_7ac3
	listdec $02, $0e
	scr_48 $00, $05
	setbit wEventFlags + 7, $00
	end

Script_04f_4aae:
	textface text_4f_7ad3
	end

Script_04f_4ab2:
	textface text_4f_540f
	end

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
	checkbit wEventFlags + 6, $02, Script_04f_4bcc
	face FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_4f_5a2d
Script_04f_4b91::
	checkbit wEventFlags + 3, $03, Script_04f_4ba1
	checkbit wEventFlags + 5, $00, Script_04f_4ba2
	stext text_4f_5a78
	end

Script_04f_4ba1:
	end

Script_04f_4ba2:
	checkbit wEventFlags + 5, $01, Script_04f_4bc2
	stext text_4f_5a69
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_5a8e
	stext text_4f_5ae7
	stext text_4f_5af1
	stext text_4f_5b4f
	setbit wEventFlags + 5, $01
	end

Script_04f_4bc2:
	stext text_4f_5acf
	end
Script_04f_4bc6::
	textface text_4f_6ce6
	sjump Script_04f_4bd4
Script_04f_4bcc::
	face FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_4f_6ce6
Script_04f_4bd4:
	checkbit wEventFlags + 3, $03, Script_04f_4be9
	stext text_4f_6d57
	setmappredef MAPPREDEF_11
	setfollower $00
	setplayerchar $02
	face FACE_DOWN
	sjump Script_04f_4bed
	end

Script_04f_4be9:
	stext text_4f_6d20
	end

Script_04f_4bed:
	farjump2 $4005, $4e
	end
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
	checkbit wEventFlags + 5, $05, Script_04f_4d86
	setmap $04, $00
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4f_61aa
	setbit wEventFlags + 5, $05
	end

Script_04f_4d86:
	checkbit wEventFlags + 6, $01, Script_04f_4d90
	setmap $04, $00
	end

Script_04f_4d90:
	setmap $01, $00
	end

Script_04f_4d94::
	checkbit wEventFlags + 5, $04, Script_04f_4da4
	checkbit wEventFlags + 5, $06, Script_04f_4dae
	setmap $06, $03
	end

Script_04f_4da4:
	checkbit wEventFlags + 5, $06, Script_04f_4dae
	setmap $06, $02
	end

Script_04f_4dae:
	setmap $06, $00
	end

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
	dr $13fae1, $13fbd4
MovementData_04f_7bd4:
	dr $13fbd4, $13fbf5
MovementData_04f_7bf5:
	dr $13fbf5, $13fcff

