BellVillage1_MapEvents::
	script_event ABSOLUTE, 19, 1, Script_008_4285
	script_event ABSOLUTE, 19, 2, Script_008_4295
	warp_event ABSOLUTE, 0, MAP_BELL_SCHOOL_OUTSIDE_1, 0
	warp_event 23, ABSOLUTE, MAP_BELL_OBSERVATORY_OUTSIDE_1, 0
	warp_event 3, 7, MAP_HAYATOS_HOUSE_1, 0
	warp_event 19, 5, MAP_CARPET_WOMANS_HOUSE_1, 0
	warp_event 20, 15, MAP_FANGFANGS_HOUSE_1, 0
	script_event 4, 15, 0, Script_008_41a7
	warp_event 12, 11, MAP_BELL_HEALING_CENTER_1, 0
	signpost_event  8,  3, 1
	signpost_event 22,  7, 2
	signpost_event 15, 17, 3
	events_end

BellSchoolOutside1_MapEvents::
	warp_event ABSOLUTE, 19, MAP_BELL_VILLAGE_1, 1
	script_event 4, 4, 0, Script_008_4137
	script_event 5, 4, 0, Script_008_4137
	script_event 6, 4, 0, Script_008_4137
	events_end

BellObservatoryOutside1_MapEvents::
	warp_event     0, ABSOLUTE, MAP_BELL_VILLAGE_1, 2
	script_event   14, 5, 0, Script_008_408a
	script_event   15, 5, 0, Script_008_408a
	script_event   16, 5, 0, Script_008_408a
	signpost_event  8, 8, 4
	events_end

BallotsHouse1_MapEvents:
	warp_event ABSOLUTE, 8, MAP_BELL_VILLAGE_1, 6, 0
	events_end

BallotsHouse1_MapEvents2:
	script_event ABSOLUTE, 8, 0, Script_008_4151
	events_end

HayatosHouse1_MapEvents::
	warp_event ABSOLUTE, 8, MAP_BELL_VILLAGE_1, 3, 0
	events_end

CarpetWomansHouse1_MapEvents::
	warp_event ABSOLUTE, 8, $01, $04, $00
	events_end

FangfangsHouse1_MapEvents::
	warp_event ABSOLUTE, 8, $01, $05, $00
	events_end

BellHealingCenter1_MapEvents::
	warp_event ABSOLUTE, 8, $01, $07, $00
	event 5, 4, $04, $00, $c4, $43
	events_end

BellSchool1_MapEvents::
	warp_event ABSOLUTE, 18, $02, $01, $00
	warp_event 1, 14, $0b, $00, $00
	warp_event 1, 15, $0b, $00, $00
	warp_event 1, 5, $2a, $00, $00
	warp_event 1, 6, $2a, $00, $00
	events_end

BellObservatory1_MapEvents::
	warp_event ABSOLUTE, 10, $03, $01, $00
	events_end

BellSchoolSouthClassroom1_MapEvents::
	warp_event 10, ABSOLUTE, $09, $01, $00
	events_end

BellSchoolNorthClassroom1_MapEvents::
	event 10, ABSOLUTE, $01, $00, $b5, $41
	event 7, 6, $01, $03, $c8, $41
	events_end

BellSchoolNorthClassroom1_MapEvents2::
	event 10, ABSOLUTE, $01, $00, $14, $42
	events_end

BlueMoon_MapEvents::
	events_end
