Script_00e_4000::
	end

Script_00e_4001::
	setmap MAP_TECH_CITY_BLACKOUT, $01
	end

Script_00e_4005::
	face FACE_DOWN
	stext text_0e_4abe
	end

Func_00e_400b::
	xor a
	ld [wTargetMode], a
	jp JumpToGameMode

Script_00e_4012::
	checkbit wEventFlags, $04, Script_00e_4049
	face FACE_UP
	stext text_0e_4b34
	emote $00, $00
	delay $03, $20
	stext text_0e_4b4d
	emote $00, $00
	delay $03, $20
	stext text_0e_4bc0
	emote $00, $00
	delay $03, $20
	stext text_0e_4bfb
	emote $00, $00
	delay $03, $20
	stext text_0e_4c6a
	scr_48 2, 1
	setbit wEventFlags, 4
	end

Script_00e_4049::
	end

Script_00e_404a::
	checkbit wEventFlags, $04, Script_00e_4059
	stext text_0e_4af9
	face FACE_UP
	move MovementData_OneUp
	end

Script_00e_4059::
	setfollower $02
	face FACE_LEFT
	setmap MAP_BELL_VILLAGE_2, $08
	face FACE_RIGHT
	stext text_0e_4cdd
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	move MovementData_OneLeft
	stext text_0e_4cec
	spritewalk  1, MOVE_LEFT
	stext text_0e_4cfd
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_0e_4d10
	stext text_0e_4d42
	stext text_0e_4d50
	face FACE_LEFT
	stext text_0e_4d81
	loadscriptedmon $00
	loadbufmon
	end

Script_00e_408f::
	stext text_0e_5333
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spritewalk $01, $02
	spriteface $01, $00
	end

Script_00e_409f::
	checkbit wEventFlags, $05, Script_00e_40b5
	stext text_0e_7dff
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, $01
	spriteface $01, $01
	end

Script_00e_40b5::
	setmap MAP_R01_2, $00
	end

Script_00e_40b9::
	setmap MAP_TECH_CITY_BLACKOUT, $00
	emote $00, $00
	delay $03, $20
	stext text_0e_54aa
	setmappredef MAPPREDEF_05
	end

Script_00e_40c8::
	farjump2 Script_00f_4002
	end

Script_00e_40cd::
	farjump2 Script_00f_4006
	end

Script_00e_40d2::
	checkbit wEventFlags, $06, Script_00e_40dc
	setmap MAP_TECH_CITY_BLACKOUT, $08
	end

Script_00e_40dc::
	checkbit wEventFlags, $07, Script_00e_40e6
	setmap MAP_TECH_CITY_BLACKOUT, $0d
	end

Script_00e_40e6::
	checkbit wEventFlags + 1, $04, Script_00e_40f0
	setmap MAP_TECH_CITY_BLACKOUT, $08
	end

Script_00e_40f0::
	checkbit wEventFlags + 1, $05, Script_00e_40fa
	setmap MAP_TECH_CITY_BLACKOUT, $0e
	end

Script_00e_40fa::
	setmap MAP_TECH_CITY_BLACKOUT, $08
	end

Script_00e_40fe::
	checkbit wEventFlags + 1, $01, Script_00e_4105
	end

Script_00e_4105::
	face FACE_UP
	dirmovement
	spriteface $01, $01
	emote $00, $00
	delay $03, $20
	stext text_0e_662c
	stext text_0e_6647
	ifcharindex $01, Script_00e_411f
	stext text_0e_665b
	end

Script_00e_411f::
	stext text_0e_66b8
	stext text_0e_66eb
	setmap MAP_HIDEOUT_2, $00
	end

Script_00e_4129::
	checkbit wEventFlags + 2, $01, Script_00e_4130

Script_00e_412f::
	end

Script_00e_4130::
	checkbit wEventFlags + 2, $02, Script_00e_412f
	stext text_0e_71b4
	scr_48 $02, $04
	setbit wEventFlags + 2, $02
	end
