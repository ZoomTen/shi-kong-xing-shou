Script_05a_40be::
	checkbit wEventFlags + 13, $02, Script_05a_40c8
	setmap MAP_G4_26, $02
	end

Script_05a_40c8::
	setmap MAP_SACREDTREE_VILLAGE_27, $02
	end

Script_05a_40cc::
	setmap MAP_G4_26, $02
	end

Script_05a_40d0::
	checkbit wEventFlags + 13, $00, Script_05a_40ec
	emote $00, EMOTE_QUESTION
	delay $03, $20
	stext text_5a_5623
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_UP
	end

Script_05a_40ec::
	checkbit wEventFlags + 13, $02, Script_05a_40f6
	setmap MAP_G4_26, $06
	end

Script_05a_40f6::
	setmap MAP_SACREDTREE_VILLAGE_27, $06
	end

Script_05a_40fa::
	checkbit wEventFlags + 13, $02, Script_05a_4104
	setmap MAP_G4_26, $05
	end

Script_05a_4104::
	setmap MAP_SACREDTREE_VILLAGE_27, $05
	end

Script_05a_4108::
	checkbit wEventFlags + 13, $02, Script_05a_4112
	setmap MAP_G4_26, $04
	end

Script_05a_4112::
	setmap MAP_SACREDTREE_VILLAGE_27, $04
	end

Script_05a_4116::
	checkbit wEventFlags + 13, $02, Script_05a_4120
	setmap MAP_G4_26, $0a
	end

Script_05a_4120::
	setmap MAP_SACREDTREE_VILLAGE_27, $0a
	end

Script_05a_4124::
	checkbit wEventFlags + 13, $02, Script_05a_412e
	setmap MAP_G4_26, $08
	end

Script_05a_412e::
	setmap MAP_SACREDTREE_VILLAGE_27, $08
	end

Script_05a_4132::
	checkbit wEventFlags + 13, $02, Script_05a_413c
	setmap MAP_G4_26, $09
	end

Script_05a_413c::
	setmap MAP_SACREDTREE_VILLAGE_27, $09
	end

Script_05a_4140::
	checkbit wEventFlags + 13, $02, Script_05a_414a
	setmap MAP_G4_26, $03
	end

Script_05a_414a::
	setmap MAP_SACREDTREE_VILLAGE_27, $03
	end

Script_05a_414e::
	checkbit wEventFlags + 13, $02, Script_05a_4158
	setmap MAP_G4_26, $07
	end

Script_05a_4158::
	setmap MAP_SACREDTREE_VILLAGE_27, $07
	end

Script_05a_415c::
	ifcharindex $01, Script_05a_4161
	end

Script_05a_4161::
	face FACE_LEFT
	spriteface $01, FACE_LEFT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_05a_76e8
	clearattach $01
	spriteface $01, FACE_RIGHT
	spritewalk $01, MOVE_RIGHT
	spriteface $01, FACE_DOWN
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_LEFT
	end

Script_05a_4183::
	ifcharindex $01, Script_05a_4188
	end

Script_05a_4188::
	face FACE_RIGHT
	spriteface $01, FACE_RIGHT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_05a_7729
	clearattach $01
	spriteface $01, FACE_LEFT
	spritewalk $01, MOVE_LEFT
	spriteface $01, FACE_DOWN
	spritewalk $01, MOVE_DOWN
	spriteface $01, FACE_RIGHT
	end

Script_05a_41aa::
	setmappredef $17
	setplayerchar $00
	face FACE_DOWN
	setmap MAP_SACREDTREE_VILLAGE_PAST, $01
	emote $00, EMOTE_QUESTION
	delay $03, $20
	stext text_5a_5608
	end
