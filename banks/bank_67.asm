Script_067_6e01::
	farjump2 Script_066_4c9e
	end

Script_067_6e06:
	setmap $03, $00
	end2

G5_03_ObjectEvents:
	object_event $3c, 10, 12, 0, $00, $00, $00, $00, Script_067_6e5c
	object_event $3a,  9,  3, 0, $00, $00, $00, $01, Script_067_6e85
	objects_end
G5_04_ObjectEvents:
	object_event $40, 16,  7, 0, $00, $00, $00, $00, Script_067_6ea2
	object_event $3a,  3, 11, 0, $00, $00, $00, $01, Script_067_6ecb
	objects_end
G5_05_ObjectEvents:
	object_event $42, 16,  2, 0, $00, $00, $00, $00, Script_067_6ee8
	objects_end
G5_06_ObjectEvents:
	object_event $42, 17, 15, 0, $00, $00, $00, $00, Script_067_6f05
	object_event $40,  5,  7, 0, $00, $00, $00, $01, Script_067_6f2e
	objects_end

Script_067_6e5b:
	end

Script_067_6e5c:
	ifcharindex $03, Script_067_6e6d
	textface text_67_6f5d
	startbattle BattleData_02d_4de6
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6e6d:
	checkbit wEventFlags + 20, $00, Script_067_6e81
	textface text_67_6f6d
	stext text_67_6f86
	scr_48 $00, $23
	setbit wEventFlags + 20, $00
	end

Script_067_6e81:
	textface text_67_6f97
	end

Script_067_6e85:
	ifcharindex $03, Script_067_6e96
	textface text_67_6f54
	startbattle BattleData_02d_4e14
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6e96:
	textface text_67_6fa5
	checkbit wEventFlags + 3, $03, Script_067_6ea1
	scr_37
	end

Script_067_6ea1:
	end

Script_067_6ea2:
	ifcharindex $03, Script_067_6eb3
	textface text_67_6f65
	startbattle BattleData_02d_4e33
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6eb3:
	checkbit wEventFlags + 20, $01, Script_067_6ec7
	textface text_67_7002
	stext text_67_7025
	scr_48 $00, $3a
	setbit wEventFlags + 20, $01
	end

Script_067_6ec7:
	textface text_67_7036
	end

Script_067_6ecb:
	ifcharindex $03, Script_067_6edc
	textface text_67_6f54
	startbattle BattleData_02d_4e61
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6edc:
	textface text_67_6fdb
	checkbit wEventFlags + 3, $03, Script_067_6ee7
	townmusicanim
	end

Script_067_6ee7:
	end

Script_067_6ee8:
	ifcharindex $03, Script_067_6ef9
	textface text_67_6f4b
	startbattle BattleData_02d_4e80
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6ef9:
	textface text_67_6fb7
	checkbit wEventFlags + 3, $03, Script_067_6f04
	scr_37
	end

Script_067_6f04:
	end

Script_067_6f05:
	ifcharindex $03, Script_067_6f16
	textface text_67_6f4b
	startbattle BattleData_02d_4eae
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6f16:
	checkbit wEventFlags + 20, $02, Script_067_6f2a
	textface text_67_7044
	stext text_67_7069
	scr_48 $00, $26
	setbit wEventFlags + 20, $02
	end

Script_067_6f2a:
	textface text_67_7079
	end

Script_067_6f2e:
	ifcharindex $03, Script_067_6f3f
	textface text_67_6f65
	startbattle BattleData_02d_4ecd
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6f3f:
	textface text_67_6fc9
	checkbit wEventFlags + 3, $03, Script_067_6f4a
	scr_37
	end

Script_067_6f4a:
	end

INCLUDE "data/text/bank67_6f4b.asm"
