G4_44_ObjectEvents2::
	object_event $1e, 11,  6, wEventFlags + 23, $04, $00, $00, $00, Script_05c_411c
	object_event $53, 12,  7, wEventFlags + 23, $04, $00, $00, $01, Script_05c_411c
	objects_end

Script_05c_4135:: ; farjump2 target (bank_55)
	setmap MAP_G4_44, $03
	spriteface  3, FACE_UP
	stext text_5c_458c
	spriteface  3, FACE_DOWN
	objmove $03, MovementData_05c_51fa
	clearobject $03
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	stext text_5c_45b8
	objmove $02, MovementData_05c_5084
	clearobject $02
	setmappredef MAPPREDEF_15
	setbit wEventFlags + 23, $04
	end
