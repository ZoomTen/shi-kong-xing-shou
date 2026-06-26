GreenForestP4_ObjectEvents::
	object_event $3a, 11,  7, 0, $00, $00, $00, $00, Script_04f_4950
	object_event $42,  8,  8, 0, $00, $00, $00, $01, Script_04f_495c
	object_event $43, 11, 11, 0, $00, $00, $00, $02, Script_04f_4968
	object_event $36,  9,  8, wEventFlags + 5, $07, $00, $00, $03, Script_04f_4974
	object_event $07,  9,  7, wEventFlags + 5, $07, $00, $00, $04, Script_04f_4031
	objects_end

GreenForestP5_ObjectEvents::
	object_event $40,  4,  5, 0, $00, $00, $00, $00, Script_04f_49cb
	object_event $3a,  7,  6, 0, $00, $00, $00, $01, Script_04f_49e0
	objects_end

GreenForestP6_ObjectEvents::
	object_event $3c,  2,  7, 0, $00, $00, $00, $00, Script_04f_49f4
	object_event $3c,  5,  5, 0, $00, $00, $00, $01, Script_04f_4a00
	object_event $3d,  7,  6, 0, $00, $00, $00, $02, Script_04f_4a0c
	objects_end

G3_17_ObjectEvents::
	object_event $17,  2,  5, 0, $00, $00, $00, $00, Script_04f_4a18
	object_event $3e,  5,  3, wEventFlags + 5, $02, $00, $06, $01, Script_04f_4a30
	objects_end

G3_19_ObjectEvents::
	object_event $13,  6,  6, 0, $00, $00, $06, $00, Script_04f_4a34
	object_event $25,  8,  4, 0, $00, $00, $00, $01, Script_04f_4a42
	objects_end

G3_1A_ObjectEvents::
	object_event $16,  4,  4, 0, $00, $00, $06, $00, Script_04f_4a50
	object_event $13,  6,  6, 0, $00, $00, $06, $01, Script_04f_4a5e
	objects_end

G3_1B_ObjectEvents::
	object_event $18,  8,  4, 0, $00, $00, $07, $00, Script_04f_4a6c
	objects_end

BanglinCo_ObjectEvents::
	object_event $15,  7,  4, 0, $00, $00, $00, $00, Script_04f_4a70
	object_event $1b,  4,  4, 0, $00, $00, $06, $01, Script_04f_4ab2
	objects_end

Script_04f_4775::
	textface text_4f_55bf
	end

Script_04f_4779::
	textface text_4f_5619
	end

Script_04f_477d::
	farjump Script_04f_4bf3
	end

Script_04f_4782::
	checkbit wEventFlags + 6, $02, Script_04f_478c
	textface text_4f_56fa
	end

Script_04f_478c::
	textface text_4f_6c8c
	end

Script_04f_4790::
	textface text_4f_4de3
	end

Script_04f_4794::
	checkbit wEventFlags + 6, $04, Script_04f_479e
	textface text_4f_4e1c
	end

Script_04f_479e::
	textface text_4f_4e8b
	end

Script_04f_47a2::
	checkbit wEventFlags + 6, $02, Script_04f_47ac
	textface text_4f_4e9b
	end

Script_04f_47ac::
	checkbit wEventFlags + 6, $04, Script_04f_47b6
	textface text_4f_6c8c
	end

Script_04f_47b6::
	textface text_4f_6cd2
	end

Script_04f_47ba::
	textface text_4f_4ee0
	end

Script_04f_47be::
	checkbit wEventFlags + 6, $02, Script_04f_47c8
	textface text_4f_4f38
	end

Script_04f_47c8::
	checkbit wEventFlags + 6, $04, Script_04f_47d2
	textface text_4f_6b41
	end

Script_04f_47d2::
	textface text_4f_6b67
	end

Script_04f_47d6::
	ifcharindex $03, Script_04f_47de
	textface text_4f_4f81
	end

Script_04f_47de::
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

Script_04f_4805::
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
	object_event $04,  6,  5, 0, $00, $00, $00, $02, Script_04f_4031
	objects_end

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

Script_04f_4871::
	stext text_4f_5e85
	stext text_4f_5ea5
	stext text_4f_5f09
	setbit wEventFlags + 5, $03
	setmappredef MAPPREDEF_0e
	end

Script_04f_4881::
	textface text_4f_5f1f
	end

ObjSprite_4f_4885::
	object_event $04,  8, 14, 0, $00, $00, $00, $00, Script_04f_4031
	objects_end

ObjSprite_4f_4891::
	object_event $36, 12, 15, 0, $00, $00, $00, $01, Script_04f_4031
	objects_end

ObjSprite_4f_489d::
	object_event $07, 13, 15, 0, $00, $00, $00, $02, Script_04f_4031
	objects_end

Script_04f_48a9::
	setplayerchar $00
	setmap MAP_SKY_CITY, $0e
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

Script_04f_4950::
	ifcharindex $03, Script_04f_4958
	textface text_4f_6225
	end

Script_04f_4958::
	textface text_4f_64bf
	end

Script_04f_495c::
	ifcharindex $03, Script_04f_4964
	textface text_4f_6233
	end

Script_04f_4964::
	textface text_4f_6527
	end

Script_04f_4968::
	ifcharindex $03, Script_04f_4970
	stext text_4f_623b
	end

Script_04f_4970::
	stext text_4f_658c
	end

Script_04f_4974::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	ifcharindex $02, Script_04f_4983
	stext text_4f_6288
	end

Script_04f_4983::
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

Script_04f_49cb::
	ifcharindex $03, Script_04f_49d3
	textface text_4f_6243
	end

Script_04f_49d3::
	textface text_4f_6594
	checkbit wEventFlags + 4, $01, Script_04f_49df
	scr_35 $04
	end

Script_04f_49df::
	end

Script_04f_49e0::
	ifcharindex $03, Script_04f_49e8
	textface text_4f_6254
	end

Script_04f_49e8::
	textface text_4f_65f8
	checkbit wEventFlags + 3, $03, Script_04f_49f3
	scr_37
	end

Script_04f_49f3::
	end

Script_04f_49f4::
	ifcharindex $03, Script_04f_49fc
	textface text_4f_6267
	end

Script_04f_49fc::
	textface text_4f_663f
	end

Script_04f_4a00::
	ifcharindex $03, Script_04f_4a08
	textface text_4f_6274
	end

Script_04f_4a08::
	textface text_4f_666c
	end

Script_04f_4a0c::
	ifcharindex $03, Script_04f_4a14
	textface text_4f_6281
	end

Script_04f_4a14::
	textface text_4f_66c4
	end

Script_04f_4a18::
	checkbit wEventFlags + 5, $02, Script_04f_4a22
	textface text_4f_5093
	end

Script_04f_4a22::
	checkbit wEventFlags + 6, $04, Script_04f_4a2c
	textface text_4f_5107
	end

Script_04f_4a2c::
	textface text_4f_5127
	end

Script_04f_4a30::
	textface text_4f_5161
	end

Script_04f_4a34::
	checkbit wEventFlags + 6, $04, Script_04f_4a3e
	textface text_4f_51ca
	end

Script_04f_4a3e::
	textface text_4f_5208
	end

Script_04f_4a42::
	checkbit wEventFlags + 6, $04, Script_04f_4a4c
	textface text_4f_522b
	end

Script_04f_4a4c::
	textface text_4f_5284
	end

Script_04f_4a50::
	checkbit wEventFlags + 6, $02, Script_04f_4a5a
	textface text_4f_52bc
	end

Script_04f_4a5a::
	textface text_4f_6bf9
	end

Script_04f_4a5e::
	checkbit wEventFlags + 6, $02, Script_04f_4a68
	textface text_4f_531d
	end

Script_04f_4a68::
	textface text_4f_6c29
	end

Script_04f_4a6c::
	textface text_4f_5372
	end

Script_04f_4a70::
	checkbit wEventFlags + 6, $07, Script_04f_4a7a
	textface text_4f_53d3
	end

Script_04f_4a7a::
	checkbit wEventFlags + 6, $04, Script_04f_4a97
	checkbit wEventFlags + 7, $00, Script_04f_4aae
	stext text_4f_7a15
	stext text_4f_7a54
	listdec $02, $0e
	scr_48 $00, $14
	setbit wEventFlags + 7, $00
	end

Script_04f_4a97::
	checkbit wEventFlags + 7, $00, Script_04f_4aae
	stext text_4f_7a70
	stext text_4f_7ac3
	listdec $02, $0e
	scr_48 $00, $05
	setbit wEventFlags + 7, $00
	end

Script_04f_4aae::
	textface text_4f_7ad3
	end

Script_04f_4ab2::
	textface text_4f_540f
	end

SkyCity_ObjectEvents2::
	object_event $11, 15,  8, 0, $00, $00, $00, $00, Script_04f_4031
	objects_end

Script_04f_4ac2::
	setplayerchar $00
	setmap MAP_SKY_CITY, $0d
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
	setmap MAP_BANGLIN_CO_1F, $03
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

BanglinCo1f_ObjectEvents3::
	object_event $45,  2,  2, 0, $00, $00, $00, $00, Script_04f_4775
	object_event $1f,  1,  6, 0, $00, $00, $00, $01, Script_04f_4b77
	object_event $25, 10,  4, wEventFlags + 5, $00, $00, $00, $02, Script_04f_477d
	object_event $14,  9,  8, 0, $00, $00, $09, $03, Script_04f_4782
	object_event $04,  9,  4, wEventFlags + 5, $00, $00, $09, $03, Script_04f_4031
	objects_end

Script_04f_4b77::
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

Script_04f_4ba1::
	end

Script_04f_4ba2::
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

Script_04f_4bc2::
	stext text_4f_5acf
	end

Script_04f_4bc6::
	textface text_4f_6ce6
	sjump Script_04f_4bd4

Script_04f_4bcc::
	face FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_4f_6ce6

Script_04f_4bd4::
	checkbit wEventFlags + 3, $03, Script_04f_4be9
	stext text_4f_6d57
	setmappredef MAPPREDEF_11
	setfollower $00
	setplayerchar $02
	face FACE_DOWN
	sjump Script_04f_4bed
	end

Script_04f_4be9::
	stext text_4f_6d20
	end

Script_04f_4bed::
	farjump2 Script_04e_4005
	end

Script_04f_4bf2::
	end

Script_04f_4bf3::
	checkbit wEventFlags + 5, $00, Script_04f_4bf2
	setplayerchar $00
	face FACE_UP
	setmap MAP_BANGLIN_CO_1F, $04
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
