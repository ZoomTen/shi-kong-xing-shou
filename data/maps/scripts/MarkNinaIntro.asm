MarkNinaIntro_ObjectEvents::
	object_event $47,  8,  3, 0, $00, $00, $00, $00, Script_012_45ab
	object_event $05,  8,  4, wEventFlags + 3, $04, $00, $00, $01, Script_012_45af
	object_event $04,  7,  2, wEventFlags + 3, $04, $00, $00, $02, Script_012_45b3
	objects_end

Script_012_45ab::
	stext text_12_6159
	end

Script_012_45af::
	textface text_12_6164
	end

Script_012_45b3::
	textface text_12_6171
	emote $00, $03
	delay $03, $20
	stext text_12_61be
	stext text_12_61cb
	checkbit wEventFlags + 3, $02, .Script_012_45c9
	end
.Script_012_45c9
	face FACE_RIGHT
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_12_6253
	stext text_12_629b
	face FACE_UP
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_12_62f3
	stext text_12_6300
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_12_636e
	emote  4, EMOTE_HEART
	delay $03, $20
	stext text_12_6394
	clearplayerpos
	spritewalk  4, MOVE_DOWN
	clearobject $04
	clearplayerpos
	spritewalk  3, MOVE_LEFT
	clearobject $03
	loadscriptedmon $02
	scr_62 $02, $01
	stext text_12_63f5
	stext text_12_640c
	setbit wEventFlags + 3, $04
	end

Script_012_4613::
	textface text_12_5194
	end

Script_012_4617::
	textface text_12_51a6
	end

Script_012_461b::
	checkbit wEventFlags + 4, $02, Script_012_4625
	textface text_12_51d9
	end

Script_012_4625::
	textface text_12_723c
	end

Script_012_4629::
	checkbit wEventFlags + 4, $02, Script_012_4633
	textface text_12_5223
	end

Script_012_4633::
	textface text_12_7267
	end

Script_012_4637::
	checkbit wEventFlags + 4, $02, Script_012_4641
	textface text_12_52aa
	end

Script_012_4641::
	checkbit wEventFlags + 4, $03, Script_012_464b
	textface text_12_72ef
	end

Script_012_464b::
	checkbit wEventFlags + 4, $05, Script_012_4659
	textface text_12_76dc
	setbit wEventFlags + 4, $04
	end

Script_012_4659::
	textface text_12_7885
	end

Script_012_465d::
	checkbit wEventFlags + 4, $02, Script_012_4667
	textface text_12_530c
	end

Script_012_4667::
	checkbit wEventFlags + 4, $03, Script_012_4671
	textface text_12_7320
	end

Script_012_4671::
	checkbit wEventFlags + 4, $05, Script_012_467b
	textface text_12_7746
	end

Script_012_467b::
	textface text_12_735b
	end

Script_012_467f::
	checkbit wEventFlags + 4, $02, Script_012_4689
	textface text_12_5338
	end

Script_012_4689::
	textface text_12_736f
	end

Script_012_468d::
	textface text_12_5396
	checkbit wEventFlags + 3, $03, Script_012_469a
	stext text_12_53b6
	end

Script_012_469a::
	stext text_12_53a4
	end

Script_012_469e::
	textface text_12_546f
	end

Script_012_46a2::
	textface text_12_54b8
	end

Script_012_46a6::
	textface text_12_5528
	end

Script_012_46aa::
	textface text_12_5589
	end

Script_012_46ae::
	textface text_12_560d
	end

Script_012_46b2::
	textface text_12_563e
	end

Script_012_46b6::
	textface text_12_5682
	end

Script_012_46ba::
	textface text_12_56ec
	end

Script_012_46be::
	textface text_12_5733
	end

Script_012_46c2::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_12_579d
	emote $00, $03
	delay $03, $20
	stext text_12_57fa
	stext text_12_580d
	stext text_12_58ef
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	stext text_12_58fd
	emote $02, $00
	delay $03, $20
	stext text_12_599a
	objmove $02, MovementData_012_4e4a
	clearobject $02
	setbit wEventFlags + 3, $02
	end

Script_012_46fb::
	checkbit wEventFlags + 4, $04, Script_012_4705

Script_012_4701::
	textface text_12_5b24
	end

Script_012_4705::
	checkbit wEventFlags + 4, $05, Script_012_4701
	textface text_12_7787
	end

Script_012_470f::
	checkbit wEventFlags + 4, $04, Script_012_4719
	setmap MAP_CLOCK_TOWER_5F, $01
	end2

Script_012_4719::
	setmap MAP_CLOCK_TOWER_5F, $00
	end2
