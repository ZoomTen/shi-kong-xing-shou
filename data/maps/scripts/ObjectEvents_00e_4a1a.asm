ObjectEvents_00e_4a1a::
	object_event $2a, 10,  4, wEventFlags + 1, $02, $00, $00, $00, Script_00e_4a26
	objects_end

Script_00e_4a26::
	textface text_0e_66fa
	startbattle BattleData_02d_4ac4
	checkbit wEventFlags + 3, $03, Script_00e_4a45
	stext text_0e_672d
	spriteface $02, $03
	objmove $02, Script_0e_7e69
	clearobject $02
	setbit wEventFlags + 1, $02
	setmappredef MAPPREDEF_06
	end

Script_00e_4a45::
	end

Script_00e_4a46::
	spriteface $02, $00
	stext text_0e_66fa
	startbattle BattleData_02d_4ac4
	checkbit wEventFlags + 3, $03, Script_00e_4a68
	stext text_0e_672d
	spriteface $02, $03
	objmove $02, Script_0e_7e69
	clearobject $02
	setbit wEventFlags + 1, $02
	setmappredef MAPPREDEF_06
	end

Script_00e_4a68::
	face FACE_RIGHT
	move MovementData_OneRight
	clearplayerpos
	spritewalk $01, $03
	spriteface $01, $03
	end
