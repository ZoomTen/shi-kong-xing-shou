; TODO: object_event array + interleaved scripts/text - per-bank carve
BaalCapitalProfessor_07_ObjectEvents::
	object_event $5a,  6,  6, wEventFlags + 19, $03, $00, $00, $00, Script_06c_502c
	object_event $58,  5,  6, 0, $00, $00, $00, $01, Script_06c_47e9
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
BaalCapitalProfessor_07_ObjectEvents2::
	object_event $5b,  6,  6, wEventFlags + 19, $03, $00, $00, $00, Script_06c_502c
	object_event $58,  5,  6, 0, $00, $00, $00, $01, Script_06c_47e9
	objects_end

BaalCapitalProfessor_07_ObjectEvents4::
	object_event $59,  6,  6, 0, $00, $00, $00, $00, Script_06c_4706
	object_event $58,  5,  6, 0, $00, $00, $00, $01, Script_06c_4706
	objects_end

BaalCapitalProfessor_07_ObjectEvents3::
	object_event $58,  5,  6, 0, $00, $00, $00, $00, Script_06c_47e9
	objects_end

Script_06c_47e9::
	checkbit wEventFlags + 19, $03, Script_06c_47f0
	end

Script_06c_47f0::
	ifcharindex $01, Script_06c_47fb
	stext text_6c_5bde
	stext text_6c_5c09
	end

Script_06c_47fb::
	stext text_6c_61cf
	end
