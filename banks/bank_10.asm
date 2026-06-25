Group02_Maps::
; Also used for group 08
	dw DuoluCity2_Header
	dw DuoluCity2_Header
	dw ShandaFarm_Header
	dw CoffeeForestPart1_Header
	dw CoffeeForestPart2_Header
	dw CoffeeForestPart3_Header
	dw SkyRockPart1_Header
	dw SkyRockPart2_Header
	dw ClockTowerOutside_Header
	dw ClockTower1f_Header
	dw ClockTower2f_Header
	dw ClockTower3f_Header
	dw ClockTower4f_Header
	dw ClockTower5f_Header
	dw GallEnterprise_Header
	dw G2_0F_Header
	dw G2_10_Header
	dw G2_11_Header
	dw ShandaFarm_12_Header
	dw ShandaFarm_13_Header
	dw ShandaFarm_14_Header
	dw ShandaFarm_15_Header
	dw MarkNinaIntro_Header
	dw R03_Header
	dw R04_Header
	dw G2_19_Header
	dw G2_1A_Header
	dw DuoluCity_1b_Header
	dw DuoluCity_1c_Header
	dw DuoluCity_1d_Header
	dw G2_1E_Header
	dw G2_1F_Header
	dw DuoluCity_20_Header
	dw HealingCenter_g221_Header
	dw Shop_g222_Header
	dw G2_23_Header

	map DuoluCity2
	warp 13, 5, $4088
	warp 4, 7, $9038
	warp 0, 1, $8018
	warp 0, 4, $8038
	warp 0, 7, $7048
	warp 11, 0, $7058
	warp 13, 0, $7058
	warp 11, 7, $7048
	warp 13, 7, $7058
	warp 0, 0, $8048
	warp 7, 7, $7058
	warp 6, 1, $7048
	end_map

	map  ShandaFarm
	warp 5, 0, $2048
	warp 0, 6, $5018
	warp 0, 0, $7048
	warp 2, 0, $7048
	warp 7, 0, $7048
	warp 0, 4, $7058
	warp 4, 5, $6048
	warp 1, 10, $7048
	warp 7, 8, $6048
	warp 6, 6, $a0a0, ShandaFarm_ObjectEvents2
	end_map

	map  CoffeeForestPart1
	warp 10, 7, $9068
	warp 10, 0, $2068
	end_map

	map  CoffeeForestPart2
	warp 1, 10, $9048
	warp 5, 0, $2048
	end_map

	map  CoffeeForestPart3
	warp 0, 3, $9058
	warp 1, 0, $6048, CoffeeForestPart3_ObjectEvents2
	end_map

	map  SkyRockPart1
	warp 10, 10, $9068
	warp 6, 0, $2048
	end_map

	map  SkyRockPart2
	warp 0, 0, $9078
	warp 0, 0, $9078, SkyRockPart2_ObjectEvents2
	end_map

	map  ClockTowerOutside
	warp 1, 7, $5088
	warp 0, 2, $8058
	end_map

	map  ClockTower1f
	warp 3, 7, $9068
	warp 0, 0, $7038
	warp 1, 4, $6048
	end_map

	map  ClockTower2f
	warp 0, 0, $7038
	warp 7, 6, $4048
	warp 2, 5, $6038
	end_map

	map  ClockTower3f
	warp 5, 4, $5058
	warp 0, 3, $6058
	warp 5, 0, $3078
	end_map

	map  ClockTower4f
	warp 5, 0, $3048
	warp 5, 5, $5048
	end_map

	map  ClockTower5f
	warp 1, 0, $9078
	warp 1, 0, $9078, ClockTower5f_ObjectEvents2
	end_map

	map  GallEnterprise
	warp 0, 0, $8058
	warp 0, 0, $3018
	warp 0, 0, $5058, GallEnterprise_ObjectEvents2
	warp 0, 0, $3018, GallEnterprise_ObjectEvents3
	warp 0, 0, $7058, GallEnterprise_ObjectEvents4
	warp 0, 0, $8058, GallEnterprise_ObjectEvents3
	warp 0, 0, $3018, GallEnterprise_ObjectEvents4
	warp 0, 0, $5058, GallEnterprise_ObjectEvents5
	end_map

	map  G2_0F
	warp 0, 0, $3018
	warp 0, 0, $9018
	end_map

	map  G2_10
	warp 0, 0, $9018
	warp 0, 0, $3018
	end_map

	map  G2_11
	warp 0, 0, $3028
	warp 1, 0, $7058, G2_11_ObjectEvents2
	warp 1, 0, $7068
	end_map

	map  ShandaFarm_12
	warp 1, 0, $8068
	end_map

	map ShandaFarm_13, BanglinCo_MapAttributes
	warp 0, 0, $8038
	end_map

	map  ShandaFarm_14
	warp 0, 0, $8048
	end_map

	map ShandaFarm_15, G3_1B_MapAttributes
	warp 1, 0, $8058
	end_map

	map  MarkNinaIntro
	warp 0, 0, $8048
	warp 1, 0, $4078, MarkNinaIntro_ObjectEvents2
	warp 1, 0, $6068, MarkNinaIntro_ObjectEvents3
	warp 0, 0, $8048, MarkNinaIntro_ObjectEvents4
	end_map

	map  R03
	warp 1, 0, $2068
	warp 1, 7, $9078
	end_map

	map  R04
	warp 7, 5, $7088
	warp 7, 0, $2068
	warp 0, 0, $2028
	end_map

	map G2_1A, EastFishmarket_32_MapAttributes
	warp 0, 0, $8068
	end_map

	map G2_19, EastFishmarket_31_MapAttributes
	warp 0, 0, $8058
	end_map

	map DuoluCity_1b, MapAttributes_001_40f0
	warp 0, 0, $8048
	end_map

	map DuoluCity_1c, MapAttributes_001_4140
	warp 0, 0, $8058
	end_map

	map DuoluCity_1d, MapAttributes_001_4118
	warp 0, 0, $8058
	end_map

	map G2_1E, MapAttributes_001_412c
	warp 0, 0, $8038
	end_map

	map G2_1F, MapAttributes_001_40f0
	warp 0, 0, $8048
	end_map

	map DuoluCity_20, MapAttributes_001_4104
	warp 0, 0, $8048
	end_map

	map HealingCenter_g221, EastFishmarket_31_MapAttributes
	warp 0, 0, $8068
	end_map

	map Shop_g222, EastFishmarket_32_MapAttributes
	warp 0, 0, $8058
	end_map

	map  G2_23
	warp 0, 0, $5058
	end_map

DuoluCity2_MapEvents:
	warp_event ABSOLUTE, 23, $17, $00, $00
	warp_event  0, ABSOLUTE, $08, $00, $00
	warp_event  3, 14, $1b, $00, $00
	warp_event  4, 19, $1c, $00, $00
	warp_event 27,  5, $1d, $00, $00
	warp_event 31,  5, $1e, $00, $00
	warp_event 26, 19, $1f, $00, $00
	warp_event 31, 19, $20, $00, $00
	warp_event  4,  6, $22, $00, $00
	warp_event 19, 19, $21, $00, $00
	script_event 16,  7,  0, Script_012_4b72
	event_04 17, 13,  0, Script_012_49d9
	signpost_event 33, 12, $01
	signpost_event  1,  8, $02
	signpost_event 13, 21, $03
	events_end

ShandaFarm_MapEvents:
	warp_event ABSOLUTE,  0, $17, $01, $00
	warp_event  0, ABSOLUTE, $18, $00, $00
	warp_event  4,  5, $12, $00, $00
	warp_event  8,  5, $13, $00, $00
	warp_event 18,  5, $14, $00, $00
	warp_event  5, 13, $15, $00, $00
	warp_event 12, 14, $19, $00, $00
	warp_event  6, 25, $1a, $00, $00
	script_event 18, 20,  0, Script_012_44cd
	signpost_event 13,  3, $04
	signpost_event  2, 16, $05
	events_end

CoffeeForestPart1_MapEvents:
	warp_event ABSOLUTE, 23, $18, $01, $00
	warp_event ABSOLUTE,  0, $04, $00, $00
	event_05 21, 19,  1, Script_012_4039
	event_05 22, 20,  1, Script_012_4054
	event_05 23, 19,  1, Script_012_405e
	event_05 15,  4,  1, Script_012_4068
	event_05 15,  6,  1, Script_012_4083
	event_05 24,  3,  1, Script_012_408d
	event_05 25,  2,  1, Script_012_40a8
	event_05 26,  3,  1, Script_012_40b2
	signpost_event 26, 19, $09
	events_end

CoffeeForestPart2_MapEvents:
	warp_event ABSOLUTE, 28, $03, $01, $00
	warp_event ABSOLUTE,  0, $05, $00, $00
	event_05 20, 24,  1, Script_012_40bc
	event_05 20, 22,  1, Script_012_40d7
	event_05  2, 15,  1, Script_012_40e1
	event_05  2, 13,  1, Script_012_40fc
	event_05 21,  7,  1, Script_012_4106
	event_05 21,  5,  1, Script_012_4121
	event_05  7,  7,  1, Script_012_412b
	event_05  7,  5,  1, Script_012_4146
	events_end

CoffeeForestPart3_MapEvents:
	warp_event ABSOLUTE, 15, $04, $01, $00
	event_05  6, 10,  1, Script_012_4175
	event_05  6,  8,  1, Script_012_417f
	event_05  7,  9,  1, Script_012_416b
	event_05  5,  9,  1, Script_012_4150
	events_end

SkyRockPart1_MapEvents:
	warp_event ABSOLUTE, 29, $18, $02, $00
	script_event ABSOLUTE,  0,  0, Script_012_4397
	signpost_event 25, 28, $0a
	events_end

SkyRockPart2_MapEvents:
	warp_event ABSOLUTE,  9, $06, $01, $00
	events_end

ClockTowerOutside_MapEvents:
	warp_event 11, ABSOLUTE, $01, $02, $00
	warp_event  5, 10, $09, $00, $00
	warp_event  6, 10, $09, $00, $00
	events_end

ClockTower1f_MapEvents:
	warp_event ABSOLUTE, 23, $08, $01, $00
	warp_event  3,  6, $0a, $00, $00
	event_04  6, 13,  0, Script_012_4d71
	events_end

ClockTower2f_MapEvents:
	warp_event  3,  6, $09, $01, $00
	warp_event 18, 15, $0b, $00, $00
	warp_event  7, 15, $0b, $01, $00
	events_end

ClockTower3f_MapEvents:
	warp_event 15, 12, $0a, $01, $00
	warp_event  5, 11, $0a, $02, $00
	warp_event 17,  2, $0c, $00, $00
	events_end

ClockTower4f_MapEvents:
	warp_event 14,  2, $0b, $02, $00
	script_event 14, 14,  0, Script_012_470f
	events_end

ClockTower5f_MapEvents:
	warp_event 10,  8, $0c, $01, $00
	events_end

GallEnterprise_MapEvents:
	script_event  5,  8, 11, Script_012_482b
	script_event  6,  8, 11, Script_012_4850
	warp_event ABSOLUTE,  8, $01, $0b, $00
	warp_event  1,  2, $0f, $00, $00
	event_07  1,  6, $07
	events_end

G2_0F_MapEvents:
	script_event  1,  2,  0, Script_012_4d14
	warp_event  1,  8, $10, $00, $00
	event_07  7,  4, $08
	events_end

G2_10_MapEvents:
	warp_event  1,  8, $0f, $01, $00
	warp_event  1,  2, $11, $00, $00
	event_07 10,  2, $09
	events_end

G2_11_MapEvents:
	warp_event  2,  2, $10, $01, $00
	script_event  2,  5,  8, Script_012_4c95
	script_event  3,  5,  8, Script_012_4c95
	script_event  2,  5, 10, Script_012_4781
	script_event  3,  5, 10, Script_012_4781
	events_end

ShandaFarm_12_MapEvents:
	warp_event ABSOLUTE,  8, $02, $02, $00
	event_07  9,  3, $0a
	events_end

ShandaFarm_13_MapEvents:
	warp_event ABSOLUTE,  8, $02, $03, $00
	event_07 10,  3, $0b
	events_end

ShandaFarm_14_MapEvents:
	warp_event ABSOLUTE,  8, $02, $04, $00
	event_07  1,  3, $0c
	events_end

ShandaFarm_15_MapEvents:
	warp_event ABSOLUTE,  8, $02, $05, $00
	event_07  2,  3, $0d
	events_end

MarkNinaIntro_MapEvents:
	warp_event ABSOLUTE,  8, $02, $08, $00
	event_07  2,  3, $0e
	events_end

R03_MapEvents:
	warp_event ABSOLUTE,  0, $01, $01, $00
	warp_event ABSOLUTE, 23, $02, $00, $00
	event_04  6, 16,  0, Script_012_418e
	event_04  6, 17,  0, Script_012_418e
	event_04  4, 16,  0, Script_012_41b5
	event_04  4, 17,  0, Script_012_41b5
	signpost_event  7,  2, $06
	signpost_event  9, 21, $07
	events_end

R04_MapEvents:
	warp_event 23, ABSOLUTE, $02, $01, $00
	warp_event 20,  0, $03, $00, $00
	warp_event 21,  0, $03, $00, $00
	warp_event  2,  0, $06, $00, $00
	warp_event  3,  0, $06, $00, $00
	event_05 19,  2,  1, Script_012_4000
	event_05 20,  3,  1, Script_012_401b
	event_05 20,  1,  1, Script_012_4025
	event_05 21,  2,  1, Script_012_402f
	signpost_event 16,  9, $08
	events_end

G2_19_MapEvents:
	warp_event ABSOLUTE,  8, $02, $06, $00
	event_04  4,  4,  0, Script_012_498a
	event_04  8,  4,  0, Script_012_4998
	events_end

G2_1A_MapEvents:
	warp_event ABSOLUTE,  8, $02, $07, $00
	event_04  4,  3,  0, Script_012_49c8
	events_end

DuoluCity_1b_MapEvents:
	warp_event ABSOLUTE,  8, $01, $03, $00
	event_07  9,  3, $01
	events_end

DuoluCity_1c_MapEvents:
	warp_event ABSOLUTE,  8, $01, $04, $00
	event_07 10,  3, $05
	events_end

DuoluCity_1d_MapEvents:
	warp_event ABSOLUTE,  8, $01, $05, $00
	event_07  5,  3, $03
	events_end

G2_1E_MapEvents:
	warp_event ABSOLUTE,  8, $01, $06, $00
	event_07  8,  3, $04
	events_end

G2_1F_MapEvents:
	warp_event ABSOLUTE,  8, $01, $07, $00
	event_07  2,  3, $06
	events_end

DuoluCity_20_MapEvents:
	warp_event ABSOLUTE,  8, $01, $08, $00
	event_07  3,  3, $02
	events_end

HealingCenter_g221_MapEvents:
	warp_event ABSOLUTE,  8, $01, $0a, $00
	event_04  4,  4,  0, Script_012_498a
	event_04  8,  4,  0, Script_012_4998
	events_end

Shop_g222_MapEvents:
	warp_event ABSOLUTE,  8, $01, $09, $00
	event_04  4,  3,  0, Script_012_49b6
	events_end

G2_23_MapEvents:
	events_end

Group03_Maps::
	dw GreenForestP12_Header
	dw GreenForestP12_Header
	dw GreenForestP21_Header
	dw GreenForestP31_Header
	dw GreenForestP13_Header
	dw GreenForestP22_Header
	dw GreenForestP32_Header
	dw SkyCity_Header
	dw BanglinCo1f_Header
	dw BanglinCo2_Header
	dw ContestHall_Header
	dw BanglinCo2f_Header
	dw BanglinCo3f_Header
	dw BanglinCo4f_Header
	dw BanglinCo5f_Header
	dw FashionStore_Header
	dw AirportOutside_Header
	dw Airport_Header
	dw GreenForestP4_Header
	dw GreenForestP5_Header
	dw GreenForestP6_Header
	dw G3_15_Header
	dw G3_16_Header
	dw G3_17_Header
	dw G3_18_Header
	dw G3_19_Header
	dw G3_1A_Header
	dw G3_1B_Header
	dw BanglinCo_Header
	dw G3_1D_Header
	dw G3_1E_Header
	dw G3_1F_Header
	dw GreenForest_20_Header
	dw GreenForest_21_Header
	dw GreenForest_22_Header
	dw GreenForest_23_Header

	map GreenForestP12
	warp 10, 7, $9068
	warp 10, 0, $2068
	warp 8, 0, $2048
	end_map

	map  GreenForestP21
	warp 0, 10, $9068
	warp 4, 0, $2068
	end_map

	map  GreenForestP31
	warp 0, 3, $9068
	warp 0, 0, $4058
	end_map

	map  GreenForestP13
	warp 10, 7, $9068
	warp 10, 0, $2068
	warp 8, 0, $2048
	end_map

	map  GreenForestP22
	warp 0, 10, $9068
	warp 4, 0, $2068
	end_map

	map  GreenForestP32
	warp 0, 3, $9068
	warp 0, 0, $4048
	warp 0, 3, $9068, GreenForestP32_ObjectEvents2, GreenForestP32_MapEvents2
	warp 0, 3, $9068, GreenForestP32_ObjectEvents, GreenForestP32_MapEvents3
	end_map

	map  SkyCity
	warp 0, 0, $2048
	warp 0, 5, $6018
	warp 10, 10, $9038
	warp 2, 0, $6048
	warp 5, 1, $7058
	warp 10, 0, $6068
	warp 10, 4, $7068
	warp 10, 10, $6068
	warp 7, 9, $7048
	warp 0, 7, $8078
	warp 0, 10, $7038
	warp 0, 7, $8038
	warp 0, 3, $7038
	warp 5, 1, $9058, SkyCity_ObjectEvents2, SkyCity_MapEvents2
	warp 1, 6, $2068
	end_map

	map  BanglinCo1f
	warp 0, 0, $9058
	warp 1, 0, $6088
	warp 0, 0, $3028
	warp 0, 0, $3038, BanglinCo1f_ObjectEvents2
	warp 1, 0, $6078, BanglinCo1f_ObjectEvents3
	warp 0, 0, $6058, BanglinCo1f_ObjectEvents4, BanglinCo1f_MapEvents2
	warp 0, 0, $9058, BanglinCo1f_ObjectEvents5, BanglinCo1f_MapEvents3
	warp 0, 0, $3028, BanglinCo1f_ObjectEvents5, BanglinCo1f_MapEvents4
	warp 0, 0, $6058, BanglinCo1f_ObjectEvents6, BanglinCo1f_MapEvents5
	end_map

	map  BanglinCo2
	warp 0, 0, $7028
	warp 0, 0, $7028, BanglinCo2_ObjectEvents2, BanglinCo2_MapEvents2
	end_map

	map  ContestHall
	warp 1, 0, $4038
	warp 1, 0, $20b0, ContestHall_ObjectEvents2
	end_map

	map  BanglinCo2f
	warp 0, 0, $3018
	warp 7, 0, $7088
	warp 7, 7, $8078
	end_map

	map  BanglinCo3f
	warp 7, 0, $7078
	warp 7, 7, $8078
	warp 4, 2, $5058
	warp 0, 2, $6058
	warp 0, 0, $4058
	end_map

	map  BanglinCo4f
	warp 5, 1, $6038
	warp 0, 2, $5058
	warp 0, 0, $4058
	warp 0, 7, $5038
	warp 7, 6, $5078
	end_map

	map  BanglinCo5f
	warp 0, 6, $7028
	warp 7, 6, $5078
	warp 3, 0, $a068, BanglinCo5f_ObjectEvents2
	warp 4, 5, $5048
	end_map

	map  FashionStore
	warp 0, 0, $9058
	warp 1, 0, $6058, FashionStore_ObjectEvents2
	end_map

	map  AirportOutside
	warp 0, 0, $9058
	warp 0, 0, $5058
	end_map

	map  Airport
	warp 0, 0, $9048
	warp 1, 0, $7048, Airport_ObjectEvents2
	end_map

	map GreenForestP4, GreenForest_21_MapAttributes
	warp 5, 0, $5068
	warp 0, 0, $6048
	warp 5, 5, $6038
	end_map

	map GreenForestP5, GreenForest_22_MapAttributes
	warp 0, 0, $9058
	end_map

	map GreenForestP6, GreenForest_23_MapAttributes
	warp 0, 0, $9038
	end_map

	map  G3_15
	warp 0, 0, $2068
	warp 1, 5, $7078
	end_map

	map  G3_16
	warp 7, 0, $7088
	warp 0, 0, $2038
	end_map

	map G3_17, MapAttributes_001_41b8
	warp 0, 0, $8048
	end_map

	map G3_18, CarpetWomansHouse1_MapAttributes
	warp 0, 0, $8038
	end_map

	map G3_19, FangfangsHouse1_MapAttributes
	warp 0, 0, $8078
	end_map

	map G3_1A, MapAttributes_001_4118
	warp 0, 0, $8058
	end_map

	map  G3_1B
	warp 0, 0, $8078
	end_map

	map  BanglinCo
	warp 0, 0, $8038
	end_map

	map G3_1D, BellHealingCenter1_MapAttributes
	warp 0, 0, $8058
	end_map

	map G3_1E, MapAttributes_018_408c
	warp 0, 0, $8058
	end_map

	map  G3_1F
	warp 0, 3, $9068
	warp 0, 0, $5058, G3_1F_ObjectEvents2
	end_map

	map  GreenForest_20
	warp 0, 3, $9068
	end_map

	map  GreenForest_21
	warp 5, 0, $5068
	warp 0, 0, $6048
	warp 5, 5, $6038
	warp 3, 3, $4038, GreenForest_21_ObjectEvents2
	end_map

	map  GreenForest_22
	warp 0, 0, $9058
	end_map

	map  GreenForest_23
	warp 0, 0, $9038
	end_map

SkyCity_MapEvents2:
	events_end

GreenForestP12_MapEvents:
	warp_event ABSOLUTE, 23, $16, $01, $00
	warp_event 26,  0, $02, $00, $00
	warp_event 27,  0, $02, $00, $00
	warp_event 20,  0, $1f, $00, $00
	event_05 21, 19,  1, Script_04f_40c6
	event_05 23, 19,  1, Script_04f_40e1
	event_05 22, 20,  1, Script_04f_40eb
	event_05  1, 15,  1, Script_04f_40f5
	event_05  1, 13,  1, Script_04f_4110
	event_05 15,  6,  1, Script_04f_411a
	event_05 15,  4,  1, Script_04f_4135
	event_05 24,  3,  1, Script_04f_413f
	event_05 25,  2,  1, Script_04f_415a
	event_05 26,  3,  1, Script_04f_4164
	signpost_event 26, 19, $05
	events_end

GreenForestP21_MapEvents:
	warp_event ABSOLUTE, 29, $01, $01, $00
	warp_event ABSOLUTE,  0, $03, $00, $00
	event_05  2, 15,  1, Script_04f_416e
	event_05  2, 13,  1, Script_04f_4189
	event_05 20, 24,  1, Script_04f_4193
	event_05 20, 22,  1, Script_04f_41ae
	event_05 21,  7,  1, Script_04f_41b8
	event_05 21,  5,  1, Script_04f_41d3
	event_05  7,  7,  1, Script_04f_41dd
	event_05  7,  5,  1, Script_04f_41f8
	events_end

GreenForestP31_MapEvents:
	warp_event ABSOLUTE, 15, $02, $01, $00
	script_event  4,  3,  0, Script_04f_45c6
	events_end

GreenForestP13_MapEvents:
	warp_event ABSOLUTE, 23, $16, $01, $00
	warp_event 26,  0, $05, $00, $00
	warp_event 27,  0, $05, $00, $00
	warp_event 20,  0, $20, $00, $00
	event_05 21, 19,  1, Script_04f_4202
	event_05 23, 19,  1, Script_04f_4220
	event_05 22, 20,  1, Script_04f_422a
	event_05  1, 15,  1, Script_04f_4234
	event_05  1, 13,  1, Script_04f_4252
	event_05 15,  6,  1, Script_04f_425c
	event_05 15,  4,  1, Script_04f_427a
	event_05 24,  3,  1, Script_04f_4284
	event_05 25,  2,  1, Script_04f_42a2
	event_05 26,  3,  1, Script_04f_42ac
	signpost_event 26, 19, $05
	events_end

GreenForestP22_MapEvents:
	warp_event ABSOLUTE, 29, $04, $01, $00
	script_event ABSOLUTE,  0,  0, Script_04f_4d94
	event_05  2, 15,  1, Script_04f_42b6
	event_05  2, 13,  1, Script_04f_42d4
	event_05 20, 24,  1, Script_04f_42de
	event_05 20, 22,  1, Script_04f_42fc
	event_05 21,  7,  1, Script_04f_4306
	event_05 21,  5,  1, Script_04f_4324
	event_05  7,  7,  1, Script_04f_432e
	event_05  7,  5,  1, Script_04f_434c
	events_end

GreenForestP32_MapEvents:
	warp_event ABSOLUTE, 15, $05, $01, $00
	warp_event  4,  3, $12, $00, $00
	events_end

GreenForestP32_MapEvents2:
GreenForestP32_MapEvents3:
	warp_event ABSOLUTE, 15, $05, $01, $00
	events_end

SkyCity_MapEvents:
	warp_event ABSOLUTE,  0, $10, $00, $00
	warp_event  0, ABSOLUTE, $16, $00, $00
	warp_event ABSOLUTE, 29, $15, $00, $00
	warp_event  8,  4, $18, $00, $00
	script_event 15,  7,  0, Script_04f_4001
	warp_event 26,  4, $17, $00, $00
	script_event 26, 13,  0, Script_04f_44a2
	warp_event 26, 24, $1c, $00, $00
	warp_event 18, 23, $1d, $00, $00
	warp_event  7, 20, $1a, $00, $00
	warp_event  3, 25, $1b, $00, $00
	warp_event  3, 20, $19, $00, $00
	warp_event  3, 11, $1e, $00, $00
	script_event 14, 11, 12, Script_04f_4ac2
	script_event 15, 11, 12, Script_04f_4ac2
	script_event 16, 11, 12, Script_04f_4ac2
	script_event 10, 15, 14, Script_04f_48a9
	script_event 10, 16, 14, Script_04f_48a9
	signpost_event  3,  3, $01
	signpost_event 24, 27, $02
	signpost_event  1, 14, $03
	signpost_event 13, 14, $06
	events_end

BanglinCo1f_MapEvents2:
BanglinCo1f_MapEvents3:
BanglinCo1f_MapEvents4:
BanglinCo1f_MapEvents5:
	warp_event ABSOLUTE,  9, $07, $04, $00
	warp_event  1,  2, $0b, $00, $00
	events_end

BanglinCo1f_MapEvents:
	warp_event ABSOLUTE,  9, $07, $04, $00
	warp_event  1,  2, $0b, $00, $00
	event_04  9,  4,  0, Script_04f_4bf3
	event_04  8,  4,  0, Script_04f_4bf3
	event_04  3,  6,  0, Script_04f_4b83
	events_end

BanglinCo2_MapEvents:
	script_event  5,  7,  0, Script_04e_4053
	script_event  6,  7,  0, Script_04e_4053
	event_07  2,  2, $01
	event_07 10,  5, $02
	events_end

BanglinCo2_MapEvents2:
	script_event  5,  7,  0, Script_04e_4119
	script_event  6,  7,  0, Script_04e_4119
	event_07  2,  2, $01
	event_07 10,  5, $02
	events_end

ContestHall_MapEvents:
	events_end

BanglinCo2f_MapEvents:
	script_event  1,  2,  0, Script_04e_44d2
	warp_event 22,  6, $0c, $00, $00
	warp_event 21, 21, $0c, $01, $00
	events_end

BanglinCo3f_MapEvents:
	warp_event 21,  6, $0b, $01, $00
	warp_event 21, 21, $0b, $02, $00
	warp_event 13,  8, $0d, $00, $00
	warp_event  5,  9, $0d, $01, $00
	warp_event  5,  3, $0d, $02, $00
	events_end

BanglinCo4f_MapEvents:
	warp_event 13,  7, $0c, $02, $00
	warp_event  5,  8, $0c, $03, $00
	warp_event  5,  3, $0c, $04, $00
	warp_event  3, 18, $0e, $00, $00
	warp_event 21, 16, $0e, $01, $00
	events_end

BanglinCo5f_MapEvents:
	warp_event  2, 18, $0d, $03, $00
	warp_event 21, 16, $0d, $04, $00
	script_event ABSOLUTE, 12, 18, Script_04e_4419
	events_end

FashionStore_MapEvents:
	warp_event ABSOLUTE,  9, $07, $06, $00
	event_07  2,  2, $03
	events_end

AirportOutside_MapEvents:
	warp_event ABSOLUTE,  9, $07, $00, $00
	warp_event  5,  3, $11, $00, $00
	warp_event  6,  3, $11, $00, $00
	events_end

Airport_MapEvents:
	warp_event ABSOLUTE,  9, $10, $01, $00
	events_end

GreenForestP4_MapEvents:
	warp_event 16,  4, $06, $01, $00
	warp_event  4,  4, $13, $00, $00
	warp_event 13, 14, $14, $00, $00
	events_end

GreenForestP5_MapEvents:
	warp_event ABSOLUTE,  9, $12, $01, $00
	events_end

GreenForestP6_MapEvents:
	warp_event ABSOLUTE,  9, $12, $02, $00
	events_end

G3_15_MapEvents:
	warp_event ABSOLUTE,  0, $07, $02, $00
	signpost_event  6,  4, $04
	events_end

G3_16_MapEvents:
	warp_event 23, ABSOLUTE, $07, $01, $00
	script_event ABSOLUTE,  0,  0, Script_04f_4d6f
	events_end

G3_17_MapEvents:
	warp_event  4,  8, $07, $05, $00
	warp_event  5,  8, $07, $05, $00
	event_07  9,  3, $04
	events_end

G3_18_MapEvents:
	warp_event  3,  8, $07, $03, $00
	warp_event  4,  8, $07, $03, $00
	event_07  9,  3, $05
	events_end

G3_19_MapEvents:
	warp_event  7,  8, $07, $0b, $00
	warp_event  8,  8, $07, $0b, $00
	event_07  3,  3, $06
	events_end

G3_1A_MapEvents:
	warp_event  5,  8, $07, $09, $00
	warp_event  6,  8, $07, $09, $00
	event_07  6,  3, $07
	events_end

G3_1B_MapEvents:
	warp_event  7,  8, $07, $0a, $00
	warp_event  8,  8, $07, $0a, $00
	event_07  2,  3, $09
	events_end

BanglinCo_MapEvents:
	warp_event  3,  8, $07, $07, $00
	warp_event  4,  8, $07, $07, $00
	event_07  8,  3, $08
	events_end

G3_1D_MapEvents:
	warp_event  5,  8, $07, $08, $00
	warp_event  6,  8, $07, $08, $00
	event_04  4,  4,  0, Script_04f_4051
	event_04  8,  4,  0, Script_04f_405f
	events_end

G3_1E_MapEvents:
	warp_event  5,  8, $07, $0c, $00
	warp_event  6,  8, $07, $0c, $00
	event_04  4,  3,  0, Script_04f_4020
	events_end

G3_1F_MapEvents:
	warp_event ABSOLUTE, 15, $01, $02, $00
	events_end

GreenForest_20_MapEvents:
	warp_event ABSOLUTE, 15, $04, $02, $00
	events_end

GreenForest_21_MapEvents:
	warp_event 16,  4, $03, $01, $00
	warp_event  4,  4, $22, $00, $00
	warp_event 13, 14, $23, $00, $00
	events_end

GreenForest_22_MapEvents:
	warp_event ABSOLUTE,  9, $21, $01, $00
	events_end

GreenForest_23_MapEvents:
	warp_event ABSOLUTE,  9, $21, $02, $00
	events_end
