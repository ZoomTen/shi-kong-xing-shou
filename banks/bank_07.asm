Group00_Maps::
	dw BellVillage1_Header
	dw BellVillage1_Header
	dw BellSchoolOutside1_Header
	dw BellObservatoryOutside1_Header
	dw BallotsHouse1_Header
	dw HayatosHouse1_Header
	dw CarpetWomansHouse1_Header
	dw FangfangsHouse1_Header
	dw BellHealingCenter1_Header
	dw BellSchool1_Header
	dw BellObservatory1_Header
	dw BellSchoolSouthClassroom1_Header
	dw TechCity_Header
	dw unk_007_4579
	dw unk_007_458b
	dw unk_007_459d
	dw unk_007_45af
	dw unk_007_45c1
	dw unk_007_45d3
	dw TechShop_Header
	dw TechHealingCenter_Header
	dw CrystalVillage_Header
	dw unk_007_4687
	dw unk_007_4699
	dw unk_007_46ab
	dw unk_007_46bd
	dw unk_007_46cf
	dw CrystalHealingCenter_Header
	dw Junkyard_Header
	dw PowerPlantOutside_Header
	dw PowerPlant1F_Header
	dw PowerPlant2F_Header
	dw PowerPlant3F_Header
	dw PowerPlant4F_Header
	dw Hideout_Header
	dw CrystalMinesP1_Header
	dw CrystalMinesP2_Header
	dw CrystalMinesP3_Header
	dw CrystalMinesP4_Header
	dw CrystalMinesP5_Header
	dw R01_Header
	dw R02_Header
	dw BellSchoolNorthClassroom1_Header
	dw BellObservatoryDestroyed_Header
	dw BlueMoon_Header

; BellVillage1
	map  BellVillage1
	warp 6, 5, $9048    ; 0
	warp 1, 0, $2048    ; 1
	warp 7, 1, $7088    ; 2
	warp 0, 1, $7038    ; 3
	warp 7, 0, $7058    ; 4
	warp 7, 5, $7068    ; 5
	warp 0, 5, $7048    ; 6
	warp 4, 4, $5048    ; 7
	warp 0, 5, $7048    ; 8
	end_map

; BellSchoolOutside1
	map  BellSchoolOutside1
	warp 0, 5, $9058    ; 0
	warp 0, 0, $6058    ; 1
	end_map

; BellObservatoryOutside1
	map  BellObservatoryOutside1
	warp 0, 1, $8018
	warp 5, 0, $7058
	end_map

; BallotsHouse1
	map  BallotsHouse1
	warp 0, 0, $8038
	warp 1, 0, $4078
	warp 0, 0, $4038, BallotsHouse1_ObjectEvents2, BallotsHouse1_MapEvents2
	warp 0, 0, $8038, BallotsHouse1_ObjectEvents3
	warp 0, 0, $8038, BallotsHouse1_ObjectEvents4
	end_map

; HayatosHouse1
	map  HayatosHouse1
	warp 0, 0, $8078
	end_map

; CarpetWomansHouse1
	map  CarpetWomansHouse1
	warp 0, 0, $8038
	end_map

; FangfangsHouse1
	map  FangfangsHouse1
	warp 0, 0, $8078
	end_map

; BellHealingCenter1
	map  BellHealingCenter1
	warp 0, 0, $8068
	end_map

; BellSchool1
	map  BellSchool1
	warp 0, 5, $8068
	warp 0, 5, $6028
	warp 0, 0, $7028
	end_map

; BellObservatory1
	map  BellObservatory1
	warp 1, 1, $8068
	warp 0, 1, $b088, BellObservatory1_ObjectEvents2
	end_map

; BellSchoolSouthClassroom1
	map  BellSchoolSouthClassroom1
	warp 1, 0, $4078
	end_map

BellSchoolNorthClassroom1_Header::
	; map XXXXX
	dbaw2 BellSchoolNorthClassroom_MapAttributes
	; warp 1, 0, $4078, BellSchoolNorthClassroom1_ObjectEvents, BellSchoolNorthClassroom1_MapEvents
	db 1, 0
	dw $4078
	dbaw2 BellSchoolNorthClassroom1_ObjectEvents
	dw BellSchoolNorthClassroom1_MapEvents
	; warp 0, 1, $5078, BellObservatory1_ObjectEvents, unk_007_4307
	db 0, 1
	dw $5078
	dbaw2 BellObservatory1_ObjectEvents
	dw unk_007_4307


BlueMoon_Header::
	; map XXXXX
	dbaw2 BlueMoon_MapAttributes
	; warp 0, 5, $20b0, BellObservatory1_ObjectEvents, BlueMoon_MapEvents
	db 0, 5
	dw $20b0
	dbaw2 BellObservatory1_ObjectEvents
	dw BlueMoon_MapEvents


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
	warp_event ABSOLUTE, 8, $01, $04, $00 ; TEMP
	events_end

FangfangsHouse1_MapEvents::
	warp_event ABSOLUTE, 8, $01, $05, $00 ; TEMP
	events_end

BellHealingCenter1_MapEvents::
	warp_event ABSOLUTE, 8, $01, $07, $00 ; TEMP
	event 5, 4, $04, $00, $c4, $43
	events_end

BellSchool1_MapEvents::
	warp_event ABSOLUTE, 18, $02, $01, $00 ; TEMP
	warp_event 1, 14, $0b, $00, $00 ; TEMP
	warp_event 1, 15, $0b, $00, $00 ; TEMP
	warp_event 1, 5, $2a, $00, $00 ; TEMP
	warp_event 1, 6, $2a, $00, $00 ; TEMP
	events_end

BellObservatory1_MapEvents::
	warp_event ABSOLUTE, 10, $03, $01, $00 ; TEMP
	events_end

BellSchoolSouthClassroom1_MapEvents::
	warp_event 10, ABSOLUTE, $09, $01, $00 ; TEMP
	events_end

BellSchoolNorthClassroom1_MapEvents::
	event 10, ABSOLUTE, $01, $00, $b5, $41
	event 7, 6, $01, $03, $c8, $41
	events_end

unk_007_4307::
	event 10, ABSOLUTE, $01, $00, $14, $42
	events_end

BlueMoon_MapEvents::
	events_end

Group01_Maps::
	dw BellVillage2_Header
	dw BellVillage2_Header
	dw BellSchoolOutside2_Header
	dw BellObservatoryOutside2_Header
	dw BallotsHouse2_Header
	dw HayatosHouse2_Header
	dw CarpetWomansHouse2_Header
	dw FangfangsHouse2_Header
	dw BellHealingCenter2_Header
	dw BellSchool2_Header
	dw BellObservatory2_Header
	dw BellSchoolSouthClassroom2_Header
	dw TechCity_Header
	dw unk_007_4579
	dw unk_007_458b
	dw unk_007_459d
	dw unk_007_45af
	dw unk_007_45c1
	dw unk_007_45d3
	dw TechShop_Header
	dw TechHealingCenter_Header
	dw CrystalVillage_Header
	dw unk_007_4687
	dw unk_007_4699
	dw unk_007_46ab
	dw unk_007_46bd
	dw unk_007_46cf
	dw CrystalHealingCenter_Header
	dw Junkyard_Header
	dw PowerPlantOutside_Header
	dw PowerPlant1F_Header
	dw PowerPlant2F_Header
	dw PowerPlant3F_Header
	dw PowerPlant4F_Header
	dw Hideout_Header
	dw CrystalMinesP1_Header
	dw CrystalMinesP2_Header
	dw CrystalMinesP3_Header
	dw CrystalMinesP4_Header
	dw CrystalMinesP5_Header
	dw R01_Header
	dw R02_Header
	dw BellSchoolNorthClassroom2_Header
	dw BellObservatoryDestroyed_Header
	dw BlueMoon2_Header
	dw TechCityBlackout_Header
	dw unk_007_49b1
	dw unk_007_49c3
	dw unk_007_49d5
	dw unk_007_49e7
	dw unk_007_49f9
	dw unk_007_4a0b
	dw TechShopBlackout_Header
	dw TechHealingCenterBlackout_Header

; BellVillage2
	map BellVillage2
	warp 6, 5, $9048
	warp 1, 0, $2048
	warp 7, 1, $7088
	warp 0, 1, $7038
	warp 7, 0, $7058
	warp 7, 5, $7068
	warp 0, 5, $7048
	warp 4, 4, $5048
	warp 0, 5, $7048
	end_map

; BellSchoolOutside2
	map BellSchoolOutside2
	warp 0, 5, $9058
	warp 0, 0, $6058
	end_map

; BellObservatoryOutside2
	map BellObservatoryOutside2
	warp 0, 1, $8018, BellSchoolOutside2_ObjectEvents, BellObservatoryOutside2_MapEvents
	warp 5, 0, $7058, BellSchoolOutside2_ObjectEvents, BellObservatoryOutside2_MapEvents
	end_map

; BallotsHouse2
	map BallotsHouse2
	warp 0, 0, $8038
	warp 0, 0, $5078, BallotsHouse2_ObjectEvents, BallotsHouse2_MapEvents2
	end_map

; HayatosHouse2
	map HayatosHouse2
	warp 0, 0, $8078
	end_map

; CarpetWomansHouse2
	map CarpetWomansHouse2
	warp 0, 0, $8038
	end_map

; FangfangsHouse2
	map FangfangsHouse2
	warp 0, 0, $8078
	end_map

; BellHealingCenter2
	map BellHealingCenter2
	warp 0, 0, $8068
	end_map

; BellSchool2
	map BellSchool2
	warp 0, 5, $8068
	warp 0, 5, $6028
	warp 0, 0, $7028
	end_map

; BellObservatory2
	map BellObservatory2
	warp 1, 1, $8068
	end_map

; BellSchoolSouthClassroom2
	map BellSchoolSouthClassroom2
	warp 1, 0, $4078
	end_map

BellSchoolNorthClassroom2_Header::
	; map XXXXX
	dbaw2 BellSchoolNorthClassroom_MapAttributes
	warp  1, 0, $4078, BellSchoolOutside2_ObjectEvents, BellSchoolNorthClassroom2_MapEvents

TechCity_Header::
	; map XXXXX
	dbaw2 TechCity_MapAttributes
	warp  6, 7, $9068, TechCity_ObjectEvents, TechCity_MapEvents
	warp  0, 0, $2058, TechCity_ObjectEvents, TechCity_MapEvents
	warp  13, 0, $2058, TechCity_ObjectEvents, TechCity_MapEvents
	warp  0, 2, $7028, TechCity_ObjectEvents, TechCity_MapEvents
	warp  0, 6, $7028, TechCity_ObjectEvents, TechCity_MapEvents
	warp  1, 6, $7058, TechCity_ObjectEvents, TechCity_MapEvents
	warp  10, 7, $7038, TechCity_ObjectEvents, TechCity_MapEvents
	warp  13, 6, $7048, TechCity_ObjectEvents, TechCity_MapEvents
	warp  13, 1, $7068, TechCity_ObjectEvents, TechCity_MapEvents
	warp  8, 0, $7048, TechCity_ObjectEvents, TechCity_MapEvents
	warp  4, 0, $7058, TechCity_ObjectEvents, TechCity_MapEvents

unk_007_4579::
	; map XXXXX
	dbaw2 MapAttributes_001_40f0
	warp  0, 0, $8048, ObjectEvents_00f_401a, MapEvents_007_4ba5

unk_007_458b::
	; map XXXXX
	dbaw2 MapAttributes_001_4104
	warp  0, 0, $8048, ObjectEvents_00f_4329, MapEvents_007_4bb2

unk_007_459d::
	; map XXXXX
	dbaw2 MapAttributes_001_4118
	warp  0, 0, $8058, ObjectEvents_00f_4000, MapEvents_007_4bbf

unk_007_45af::
	; map XXXXX
	dbaw2 MapAttributes_001_412c
	warp  0, 0, $8038, ObjectEvents_00f_4039, MapEvents_007_4bcc

unk_007_45c1::
	; map XXXXX
	dbaw2 MapAttributes_001_4140
	warp  0, 0, $8058, ObjectEvents_00f_4348, MapEvents_007_4bd9

unk_007_45d3::
	; map XXXXX
	dbaw2 MapAttributes_001_4154
	warp  0, 0, $8048, ObjectEvents_00f_43d2, MapEvents_007_4be6
	warp  0, 0, $7058, ObjectEvents_00f_43e9, MapEvents_007_4bf3
	warp  0, 0, $8048, ObjectEvents_00f_4416, MapEvents_007_4be6

TechShop_Header::
	; map XXXXX
	dbaw2 TechShop_MapAttributes
	warp  0, 0, $8058, TechShop_ObjectEvents, TechShop_MapEvents

TechHealingCenter_Header::
	; map XXXXX
	dbaw2 TechHealingCenter_MapAttributes
	warp  0, 0, $8058, TechHealingCenter_ObjectEvents, unk_007_4c13

CrystalVillage_Header::
	; map XXXXX
	dbaw2 CrystalVillage_MapAttributes
	warp  4, 5, $9048, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents
	warp  3, 0, $2058, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents
	warp  5, 0, $5058, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents
	warp  7, 0, $6068, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents
	warp  0, 5, $8058, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents
	warp  7, 5, $6068, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents
	warp  4, 3, $7058, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents
	warp  0, 0, $6038, CrystalVillage_ObjectEvents, CrystalVillage_MapEvents

unk_007_4687::
	; map XXXXX
	dbaw2 MapAttributes_001_41a4
	warp  0, 0, $8058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4c63

unk_007_4699::
	; map XXXXX
	dbaw2 MapAttributes_001_41b8
	warp  0, 0, $8048, unk_00e_49c5, unk_007_4c70

unk_007_46ab::
	; map XXXXX
	dbaw2 MapAttributes_001_41cc
	warp  0, 0, $8068, unk_00e_49df, unk_007_4c7d

unk_007_46bd::
	; map XXXXX
	dbaw2 MapAttributes_001_41e0
	warp  0, 0, $8058, unk_00e_49ef, unk_007_4c8a

unk_007_46cf::
	; map XXXXX
	dbaw2 MapAttributes_001_41f4
	warp  0, 0, $8058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4c97
	warp  1, 0, $4088, BellSchoolNorthClassroom_ObjectEvents, unk_007_4c97

CrystalHealingCenter_Header::
	; map XXXXX
	dbaw2 CrystalHealingCenter_MapAttributes
	warp  0, 0, $8068, unk_00e_4664, unk_007_4caa

Junkyard_Header::
	; map XXXXX
	dbaw2 Junkyard_MapAttributes
	warp  0, 0, $8068, unk_00e_4537, unk_007_4cbd

PowerPlantOutside_Header::
	; map XXXXX
	dbaw2 PowerPlantOutside_MapAttributes
	warp  7, 0, $2068, PowerPlantOutside_ObjectEvents, PowerPlantOutside_MapEvents
	warp  0, 0, $7058, PowerPlantOutside_ObjectEvents, PowerPlantOutside_MapEvents
	warp  0, 0, $8088, PowerPlantOutside_ObjectEvents2, PowerPlantOutside_MapEvents
	warp  0, 0, $8088, PowerPlantOutside_ObjectEvents, PowerPlantOutside_MapEvents

PowerPlant1F_Header::
	; map XXXXX
	dbaw2 PowerPlant1F_MapAttributes
	warp  1, 0, $9038, PowerPlant1F_ObjectEvents, PowerPlant1F_MapEvents
	warp  0, 0, $9028, PowerPlant1F_ObjectEvents, PowerPlant1F_MapEvents

PowerPlant2F_Header::
	; map XXXXX
	dbaw2 PowerPlant2F_MapAttributes
	warp  0, 0, $9028, PowerPlant2F_ObjectEvents, PowerPlant2F_MapEvents
	warp  1, 0, $2078, PowerPlant2F_ObjectEvents, PowerPlant2F_MapEvents

PowerPlant3F_Header::
	; map XXXXX
	dbaw2 PowerPlant3F_MapAttributes
	warp  1, 0, $2078, PowerPlant3F_ObjectEvents, PowerPlant3F_MapEvents
	warp  0, 0, $9028, PowerPlant3F_ObjectEvents, PowerPlant3F_MapEvents

PowerPlant4F_Header::
	; map XXXXX
	dbaw2 PowerPlant4F_MapAttributes
	warp  0, 0, $9028, PowerPlant4F_ObjectEvents, PowerPlant4F_MapEvents

Hideout_Header::
	; map XXXXX
	dbaw2 Hideout_MapAttributes
	warp  13, 7, $9088, unk_00e_4a1a, Hideout_MapEvents

CrystalMinesP1_Header::
	; map XXXXX
	dbaw2 unk_017_4000
	warp  0, 3, $9038, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP1_MapEvents
	warp  0, 0, $5048, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP1_MapEvents
	warp  5, 0, $3088, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP1_MapEvents
	warp  5, 3, $7088, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP1_MapEvents

CrystalMinesP2_Header::
	; map XXXXX
	dbaw2 unk_017_4014
	warp  0, 0, $9058, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP2_MapEvents

CrystalMinesP3_Header::
	; map XXXXX
	dbaw2 unk_017_4028
	warp  5, 3, $5038, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP3_MapEvents
	warp  0, 0, $3018, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP3_MapEvents
	warp  0, 3, $7018, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP3_MapEvents
	warp  4, 0, $2038, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP3_MapEvents
	warp  5, 0, $2078, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP3_MapEvents

CrystalMinesP4_Header::
	; map XXXXX
	dbaw2 unk_017_403c
	warp  0, 0, $9058, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP4_MapEvents

CrystalMinesP5_Header::
	; map XXXXX
	dbaw2 unk_017_4050
	warp  5, 5, $9058, BellSchoolNorthClassroom_ObjectEvents, CrystalMinesP5_MapEvents
	warp  7, 5, $9078, unk_00e_4a75, CrystalMinesP5_MapEvents

R01_Header::
	; map XXXXX
	dbaw2 unk_017_474b
	warp  3, 0, $2078, unk_00e_422d, R01_MapEvents
	warp  0, 0, $2028, unk_00e_422d, R01_MapEvents

R02_Header::
	; map XXXXX
	dbaw2 unk_017_475f
	warp  5, 3, $9068, ObjectEvents_00f_4000, R02_MapEvents
	warp  0, 3, $9058, ObjectEvents_00f_4000, R02_MapEvents
	warp  5, 0, $2068, ObjectEvents_00f_4000, R02_MapEvents
	warp  0, 0, $4028, ObjectEvents_00f_4000, R02_MapEvents

BellObservatoryDestroyed_Header::
	; map XXXXX
	dbaw2 unk_017_4a09
	warp  0, 1, $8018, BellSchoolNorthClassroom_ObjectEvents, unk_007_4e21

BlueMoon2_Header::
	; map XXXXX
	dbaw2 BlueMoon_MapAttributes
	warp  0, 5, $20b0, BellSchoolNorthClassroom_ObjectEvents, unk_007_4e2e

TechCityBlackout_Header::
	; map XXXXX
	dbaw2 unk_018_4000
	warp  6, 7, $9068, unk_00e_43d5, unk_007_4e2f
	warp  0, 0, $2058, unk_00e_43d5, unk_007_4e2f
	warp  13, 0, $2058, unk_00e_43d5, unk_007_4e2f
	warp  0, 2, $7028, unk_00e_43d5, unk_007_4e2f
	warp  0, 6, $7028, unk_00e_43d5, unk_007_4e2f
	warp  1, 6, $7058, unk_00e_43d5, unk_007_4e2f
	warp  10, 7, $7038, unk_00e_43d5, unk_007_4e2f
	warp  13, 6, $7048, unk_00e_43d5, unk_007_4e2f
	warp  13, 1, $7068, unk_00e_43d5, unk_007_4e2f
	warp  8, 0, $7048, unk_00e_43d5, unk_007_4e2f
	warp  4, 0, $7058, unk_00e_43d5, unk_007_4e2f
	warp  6, 3, $8078, unk_00e_44ff, unk_007_4e90
	warp  6, 3, $8078, unk_00e_43d5, unk_007_4e2f
	warp  13, 1, $7068, unk_00e_4366, unk_007_4e2f
	warp  13, 1, $7068, unk_00e_426b, unk_007_4e2f

unk_007_49b1::
	; map XXXXX
	dbaw2 unk_018_4014
	warp  0, 0, $8048, unk_00e_4578, unk_007_4e91

unk_007_49c3::
	; map XXXXX
	dbaw2 unk_018_4028
	warp  0, 0, $8048, unk_00e_4597, unk_007_4e9e

unk_007_49d5::
	; map XXXXX
	dbaw2 unk_018_403c
	warp  0, 0, $8058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4eab

unk_007_49e7::
	; map XXXXX
	dbaw2 unk_018_4050
	warp  0, 0, $8038, unk_00e_45c0, unk_007_4eb8

unk_007_49f9::
	; map XXXXX
	dbaw2 unk_018_4064
	warp  0, 0, $8058, unk_00e_4632, unk_007_4ec5

unk_007_4a0b::
	; map XXXXX
	dbaw2 unk_018_4078
	warp  0, 0, $8048, unk_00e_481c, unk_007_4ed2
	warp  0, 0, $8048, unk_00e_469f, unk_007_4ed2

TechShopBlackout_Header::
	; map XXXXX
	dbaw2 unk_018_408c
	warp  0, 0, $8058, unk_00e_4642, unk_007_4edf

TechHealingCenterBlackout_Header::
	; map XXXXX
	dbaw2 unk_018_40a0
	warp  0, 0, $8058, unk_00e_4664, unk_007_4eec

BellVillage2_MapEvents::
	script_event ABSOLUTE, 19, $00, Script_00e_409f
	warp_event ABSOLUTE, 0, $02, $00, $00 ; TEMP
	warp_event 23, ABSOLUTE, $2b, $00, $00 ; TEMP
	warp_event 3, 7, $05, $00, $00 ; TEMP
	warp_event 19, 5, $06, $00, $00 ; TEMP
	warp_event 20, 15, $07, $00, $00 ; TEMP
	warp_event 4, 15, $04, $00, $00 ; TEMP
	warp_event 12, 11, $08, $00, $00 ; TEMP
	signpost_event 8, 3, $01
	signpost_event 22, 7, $02
	signpost_event 15, 17, $03
	events_end

BellSchoolOutside2_MapEvents::
	warp_event ABSOLUTE, 19, $01, $01, $00 ; TEMP
	script_event 4, 4, $00, Script_00e_408f
	script_event 5, 4, $00, Script_00e_408f
	script_event 6, 4, $00, Script_00e_408f
	events_end

BellObservatoryOutside2_MapEvents::
	warp_event 0, ABSOLUTE, $01, $02, $00 ; TEMP
	signpost_event 8, 8, $04
	events_end

BallotsHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $06, $00 ; TEMP
	event 9, 3, $07, $01, $00, $00
	events_end

BallotsHouse2_MapEvents2::
	script_event ABSOLUTE, 8, $00, Script_00e_404a
	event_04 5, 3, $00, Script_00e_4012
	event 9, 3, $07, $01, $00, $00
	events_end

HayatosHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $03, $00 ; TEMP
	event 9, 3, $07, $02, $00, $00
	events_end

CarpetWomansHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $04, $00 ; TEMP
	event 2, 3, $07, $03, $00, $00
	events_end

FangfangsHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $05, $00 ; TEMP
	event 9, 3, $07, $04, $00, $00
	events_end

BellHealingCenter2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $07, $00 ; TEMP
	event_04 5, 4, $00, Script_00e_4683
	events_end

BellSchool2_MapEvents::
	warp_event ABSOLUTE, 18, $02, $01, $00 ; TEMP
	warp_event 1, 14, $0b, $00, $00 ; TEMP
	warp_event 1, 15, $0b, $00, $00 ; TEMP
	warp_event 1, 5, $2a, $00, $00 ; TEMP
	warp_event 1, 6, $2a, $00, $00 ; TEMP
	event 7, 2, $07, $05, $00, $00
	events_end

BellObservatory2_MapEvents::
	events_end

BellSchoolNorthClassroom_MapEvents::
BellSchoolSouthClassroom2_MapEvents::
	warp_event 10, ABSOLUTE, $09, $01, $00 ; TEMP
	event 2, 3, $07, $06, $00, $00
	events_end

BellSchoolNorthClassroom2_MapEvents:
	warp_event 10, ABSOLUTE, $09, $02, $00
	events_end

TechCity_MapEvents:
	warp_event ABSOLUTE, 23, $28, $01, $00
	warp_event  4,  0, $29, $00, $00
	warp_event  5,  0, $29, $00, $00
	warp_event 30,  0, $1c, $00, $00
	warp_event 31,  0, $1c, $00, $00
	warp_event  2,  9, $0d, $00, $00
	warp_event  2, 17, $0e, $00, $00
	warp_event  7, 17, $0f, $00, $00
	warp_event 23, 19, $10, $00, $00
	warp_event 30, 17, $11, $00, $00
	script_event 32,  7,  0, Script_00f_45af
	warp_event 20,  5, $14, $00, $00
	warp_event 13,  5, $13, $00, $00
	signpost_event 29,  3, $05
	signpost_event  6,  3, $06
	signpost_event 16, 16, $07
	events_end

MapEvents_007_4ba5:
	warp_event ABSOLUTE,  8, $0c, $03, $00
	event_07  2,  3, $07
	events_end

MapEvents_007_4bb2:
	warp_event ABSOLUTE,  8, $0c, $04, $00
	event_07  3,  3, $08
	events_end

MapEvents_007_4bbf:
	warp_event ABSOLUTE,  8, $0c, $05, $00
	event_07  5,  3, $09
	events_end

MapEvents_007_4bcc:
	warp_event ABSOLUTE,  8, $0c, $06, $00
	event_07  8,  3, $0a
	events_end

MapEvents_007_4bd9:
	warp_event ABSOLUTE,  8, $0c, $07, $00
	event_07  2,  7, $0b
	events_end

MapEvents_007_4be6:
	warp_event ABSOLUTE,  8, $0c, $08, $00
	event_07  2,  3, $0c
	events_end

MapEvents_007_4bf3:
	script_event  3,  8,  0, Script_00f_44df
	script_event  4,  8,  0, Script_00f_4592
	event_07  2,  3, $0c
	events_end

TechShop_MapEvents:
	warp_event ABSOLUTE,  8, $0c, $0a, $00
	event_04  4,  3,  0, Script_00f_4385
	events_end

unk_007_4c13:
	warp_event ABSOLUTE,  8, $0c, $09, $00
	event_04  4,  4,  0, Script_00f_43b6
	event_04  8,  4,  0, Script_00f_43c4
	events_end

CrystalVillage_MapEvents:
	warp_event ABSOLUTE, 19, $29, $02, $00
	script_event ABSOLUTE,  0,  0, unk_00e_49ab
	warp_event 15,  3, $16, $00, $00
	warp_event 20,  4, $17, $00, $00
	warp_event  5, 16, $18, $00, $00
	warp_event 20, 14, $19, $00, $00
	warp_event 13, 11, $1b, $00, $00
	warp_event  3,  4, $1a, $00, $00
	signpost_event 10,  3, $0a
	signpost_event 11, 15, $09
	events_end

unk_007_4c63:
	warp_event ABSOLUTE,  8, $15, $02, $00
	event_07  9,  3, $0d
	events_end

unk_007_4c70:
	warp_event ABSOLUTE,  8, $15, $03, $00
	event_07  9,  3, $0e
	events_end

unk_007_4c7d:
	warp_event ABSOLUTE,  8, $15, $04, $00
	event_07  4,  3, $0f
	events_end

unk_007_4c8a:
	warp_event ABSOLUTE,  8, $15, $05, $00
	event_07  2,  3, $10
	events_end

unk_007_4c97:
	warp_event ABSOLUTE,  8, $15, $07, $00
	event_04 10,  3,  0, Script_00e_40fe
	event_07  9,  3, $11
	events_end

unk_007_4caa:
	warp_event ABSOLUTE,  8, $15, $06, $00
	event_04  4,  4,  0, Script_00e_4683
	event_04  8,  4,  0, unk_00e_4691
	events_end

unk_007_4cbd:
	script_event ABSOLUTE,  9,  7, Script_00e_40cd
	warp_event ABSOLUTE,  9, $2d, $02, $00
	event_04  8,  3,  0, Script_00e_4129
	events_end

PowerPlantOutside_MapEvents:
	warp_event ABSOLUTE,  0, $29, $01, $00
	warp_event  5,  5, $1e, $00, $00
	signpost_event  9,  7, $08
	events_end

PowerPlant1F_MapEvents:
	warp_event ABSOLUTE,  9, $1d, $01, $00
	warp_event  1,  8, $1f, $00, $00
	events_end

PowerPlant2F_MapEvents:
	warp_event  1,  8, $1e, $01, $00
	warp_event 10,  1, $20, $00, $00
	events_end

PowerPlant3F_MapEvents:
	warp_event 10,  1, $1f, $01, $00
	warp_event  1,  8, $21, $00, $00
	events_end

PowerPlant4F_MapEvents:
	warp_event  1,  8, $20, $01, $00
	script_event  7,  5,  0, Script_00f_421c
	events_end

Hideout_MapEvents:
	warp_event ABSOLUTE, 23, $1a, $01, $00
	script_event 10,  5,  5, unk_00e_4a46
	events_end

CrystalMinesP1_MapEvents:
	warp_event ABSOLUTE, 15, $15, $01, $00
	warp_event  4,  3, $24, $00, $00
	warp_event 19,  2, $25, $01, $00
	warp_event 19,  3, $25, $01, $00
	warp_event 19, 12, $25, $02, $00
	warp_event 19, 13, $25, $02, $00
	events_end

CrystalMinesP2_MapEvents:
	warp_event ABSOLUTE,  9, $23, $01, $00
	events_end

CrystalMinesP3_MapEvents:
	warp_event 13,  9, $26, $00, $00
	warp_event  0,  2, $23, $02, $00
	warp_event  0,  3, $23, $02, $00
	warp_event  0, 12, $23, $03, $00
	warp_event  0, 13, $23, $03, $00
	warp_event 10,  0, $27, $00, $00
	warp_event 11,  0, $27, $00, $00
	warp_event 17,  0, $27, $01, $00
	warp_event 18,  0, $27, $01, $00
	events_end

CrystalMinesP4_MapEvents:
	warp_event ABSOLUTE,  9, $25, $00, $00
	events_end

CrystalMinesP5_MapEvents:
	warp_event 14, 19, $25, $03, $00
	warp_event 15, 19, $25, $03, $00
	warp_event 21, 19, $25, $04, $00
	warp_event 22, 19, $25, $04, $00
	events_end

R01_MapEvents:
	warp_event 12,  0, $01, $00, $00
	warp_event 13,  0, $01, $00, $00
	script_event  1,  0,  4, unk_00e_40b9
	script_event  2,  0,  4, unk_00e_40b9
	script_event  1,  0,  7, Script_00e_40c8
	script_event  2,  0,  7, Script_00e_40c8
	warp_event  1,  0, $2d, $00, $00
	warp_event  2,  0, $2d, $00, $00
	signpost_event  3,  3, $0c
	signpost_event 14,  3, $0b
	events_end

R02_MapEvents:
	script_event 16, 15,  0, Script_00f_400a
	script_event 17, 15,  0, Script_00f_400a
	warp_event  4, 15, $1d, $00, $00
	warp_event  5, 15, $1d, $00, $00
	warp_event ABSOLUTE,  0, $15, $00, $00
	event_04  2, ABSOLUTE,  0, Script_00f_45bd
	signpost_event  6,  4, $0d
	signpost_event 17,  2, $0e
	signpost_event  5, 13, $10
	signpost_event 16, 13, $0f
	events_end

unk_007_4e21:
	warp_event  0, ABSOLUTE, $01, $02, $00
	signpost_event  8,  8, $04
	events_end

unk_007_4e2e:
	events_end

unk_007_4e2f:
	warp_event ABSOLUTE, 23, $28, $01, $00
	warp_event  4,  0, $29, $00, $00
	warp_event  5,  0, $29, $00, $00
	warp_event 30,  0, $1c, $00, $00
	warp_event 31,  0, $1c, $00, $00
	warp_event  2,  9, $2e, $00, $00
	warp_event  2, 17, $2f, $00, $00
	warp_event  7, 17, $30, $00, $00
	warp_event 23, 19, $31, $00, $00
	warp_event 30, 17, $32, $00, $00
	script_event 32,  7,  0, unk_00e_46b6
	warp_event 20,  5, $35, $00, $00
	warp_event 13,  5, $34, $00, $00
	signpost_event 29,  3, $05
	signpost_event  6,  3, $06
	signpost_event 16, 16, $07
	events_end

unk_007_4e90:
	events_end

unk_007_4e91:
	warp_event ABSOLUTE,  8, $2d, $03, $00
	event_07  2,  3, $07
	events_end

unk_007_4e9e:
	warp_event ABSOLUTE,  8, $2d, $04, $00
	event_07  3,  3, $08
	events_end

unk_007_4eab:
	warp_event ABSOLUTE,  8, $2d, $05, $00
	event_07  5,  3, $09
	events_end

unk_007_4eb8:
	warp_event ABSOLUTE,  8, $2d, $06, $00
	event_07  8,  3, $0a
	events_end

unk_007_4ec5:
	warp_event ABSOLUTE,  8, $2d, $07, $00
	event_07  2,  7, $0b
	events_end

unk_007_4ed2:
	script_event ABSOLUTE,  8,  0, Script_00e_40d2
	event_07  2,  3, $0c
	events_end

unk_007_4edf:
	warp_event ABSOLUTE,  8, $2d, $0a, $00
	event_04  4,  3,  0, unk_00e_4652
	events_end

unk_007_4eec:
	warp_event ABSOLUTE,  8, $2d, $09, $00
	event_04  4,  4,  0, Script_00e_4683
	event_04  8,  4,  0, unk_00e_4691
	events_end

SECTION "banknum7", ROMX[$7fff], BANK[$7]
	db $7
