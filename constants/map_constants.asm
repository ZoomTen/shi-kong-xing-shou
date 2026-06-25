MACRO newgroup
;\1: group id
DEF MAPGROUP_\1 EQU const_value + 1
DEF CURRENT_NUM_MAPGROUP_MAPS EQUS "NUM_\1_MAPS"
DEF __map_value__ = 1
	const_skip
ENDM

MACRO map_const
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
DEF GROUP_\1 EQU const_value
DEF MAP_\1 EQU __map_value__
DEF __map_value__ = __map_value__ + 1
DEF \1_WIDTH EQU \2
DEF \1_HEIGHT EQU \3
ENDM

MACRO endgroup
DEF {CURRENT_NUM_MAPGROUP_MAPS} EQU __map_value__ - 1
PURGE CURRENT_NUM_MAPGROUP_MAPS
ENDM

	const_def   -1

; Map IDs
	newgroup    GROUP_00,                           ; 00
	map_const	BELL_VILLAGE_1,              12, 10 ; 01
	map_const	BELL_SCHOOL_OUTSIDE_1,        6, 10 ; 02
	map_const	BELL_OBSERVATORY_OUTSIDE_1,  10,  6 ; 03
	map_const	BALLOTS_HOUSE_1,              6,  5 ; 04
	map_const	HAYATOS_HOUSE_1,              6,  5 ; 05
	map_const	CARPET_WOMANS_HOUSE_1,        6,  5 ; 06
	map_const	FANGFANGS_HOUSE_1,            6,  5 ; 07
	map_const	BELL_HEALING_CENTER_1,        6,  5 ; 08
	map_const	BELL_SCHOOL_1,                6, 10 ; 09
	map_const	BELL_OBSERVATORY_1,           6,  6 ; 0A
	map_const	BELL_SCHOOL_SOUTH_CLASSROOM_1,6,  6 ; 0B
	map_const	TECH_CITY,                   18, 12 ; 0C
	map_const	G0_0D,                        0,  0 ; 0D TODO
	map_const	G0_0E,                        0,  0 ; 0E TODO
	map_const	G0_0F,                        0,  0 ; 0F TODO
	map_const	G0_10,                        0,  0 ; 10 TODO
	map_const	G0_11,                        0,  0 ; 11 TODO
	map_const	G0_12,                        0,  0 ; 12 TODO
	map_const	TECH_SHOP,                    0,  0 ; 13 TODO
	map_const	TECH_HEALING_CENTER,          0,  0 ; 14 TODO
	map_const	CRYSTAL_VILLAGE,              0,  0 ; 15 TODO
	map_const	G0_16,                        0,  0 ; 16 TODO
	map_const	G0_17,                        0,  0 ; 17 TODO
	map_const	G0_18,                        0,  0 ; 18 TODO
	map_const	G0_19,                        0,  0 ; 19 TODO
	map_const	G0_1A,                        0,  0 ; 1A TODO
	map_const	CRYSTAL_HEALING_CENTER,       0,  0 ; 1B TODO
	map_const	JUNKYARD,                     0,  0 ; 1C TODO
	map_const	POWER_PLANT_OUTSIDE,          0,  0 ; 1D TODO
	map_const	POWER_PLANT_1F,               0,  0 ; 1E TODO
	map_const	POWER_PLANT_2F,               0,  0 ; 1F TODO
	map_const	POWER_PLANT_3F,               0,  0 ; 20 TODO
	map_const	POWER_PLANT_4F,               0,  0 ; 21 TODO
	map_const	HIDEOUT,                      0,  0 ; 22 TODO
	map_const	CRYSTAL_MINES_P1,             10,  8 ; 23 TODO
	map_const	CRYSTAL_MINES_P2,             6,  5 ; 24 TODO
	map_const	CRYSTAL_MINES_P3,             10,  8 ; 25 TODO
	map_const	CRYSTAL_MINES_P4,             6,  5 ; 26 TODO
	map_const	CRYSTAL_MINES_P5,             12,  10 ; 27 TODO
	map_const	R01_1,                        0,  0 ; 28 TODO
	map_const	R02_1,                        0,  0 ; 29 TODO
	map_const	BELL_SCHOOL_NORTH_CLASSROOM_1,0,  0 ; 2A TODO
	map_const	BELL_OBSERVATORY_DESTROYED_1, 0,  0 ; 2B TODO
	map_const	BLUE_MOON_1,                  6,  10 ; 2C TODO
	endgroup

	newgroup    GROUP_01                    ; 01
	map_const	BELL_VILLAGE_2,              12, 10 ; 01 TODO
	map_const	BELL_SCHOOL_OUTSIDE_2,        0,  0 ; 02 TODO
	map_const	BELL_OBSERVATORY_OUTSIDE_2,   0,  0 ; 03 TODO
	map_const	BALLOTS_HOUSE_2,              0,  0 ; 04 TODO
	map_const	HAYATOS_HOUSE_2,              0,  0 ; 05 TODO
	map_const	CARPET_WOMANS_HOUSE_2,        0,  0 ; 06 TODO
	map_const	FANGFANGS_HOUSE_2,            0,  0 ; 07 TODO
	map_const	BELL_HEALING_CENTER_2,        0,  0 ; 08 TODO
	map_const	BELL_SCHOOL_2,                0,  0 ; 09 TODO
	map_const	BELL_OBSERVATORY_2,           0,  0 ; 0A TODO
	map_const	BELL_SCHOOL_SOUTH_CLASSROOM_2,0,  0 ; 0B TODO
	map_const	TECH_CITY_2,                  18,  12 ; 0C TODO
	map_const	G1_0D,                        0,  0 ; 0D TODO
	map_const	G1_0E,                        0,  0 ; 0E TODO
	map_const	G1_0F,                        0,  0 ; 0F TODO
	map_const	G1_10,                        0,  0 ; 10 TODO
	map_const	G1_11,                        0,  0 ; 11 TODO
	map_const	G1_12,                        0,  0 ; 12 TODO
	map_const	TECH_SHOP_2,                  0,  0 ; 13 TODO
	map_const	TECH_HEALING_CENTER_2,        0,  0 ; 14 TODO
	map_const	CRYSTAL_VILLAGE_2,            12,  10 ; 15 TODO
	map_const	G1_16,                        6,  5 ; 16 TODO
	map_const	G1_17,                        0,  0 ; 17 TODO
	map_const	G1_18,                        6,  5 ; 18 TODO
	map_const	G1_19,                        6,  5 ; 19 TODO
	map_const	G1_1A,                        6,  5 ; 1A TODO
	map_const	CRYSTAL_HEALING_CENTER_2,     6,  5 ; 1B TODO
	map_const	JUNKYARD_2,                   6,  5 ; 1C TODO
	map_const	POWER_PLANT_OUTSIDE_2,        12,  5 ; 1D TODO
	map_const	POWER_PLANT_1F_2,             6,  5 ; 1E TODO
	map_const	POWER_PLANT_2F_2,             6,  5 ; 1F TODO
	map_const	POWER_PLANT_3F_2,             6,  5 ; 20 TODO
	map_const	POWER_PLANT_4F_2,             6,  5 ; 21 TODO
	map_const	HIDEOUT_2,                    18,  12 ; 22 TODO
	map_const	CRYSTAL_MINES_P1_2,           10,  8 ; 23 TODO
	map_const	CRYSTAL_MINES_P2_2,           6,  5 ; 24 TODO
	map_const	CRYSTAL_MINES_P3_2,           10,  8 ; 25 TODO
	map_const	CRYSTAL_MINES_P4_2,           6,  5 ; 26 TODO
	map_const	CRYSTAL_MINES_P5_2,           12,  10 ; 27 TODO
	map_const	R01_2,                        8,  5 ; 28 TODO
	map_const	R02_2,                        10,  8 ; 29 TODO
	map_const	BELL_SCHOOL_NORTH_CLASSROOM_2,0,  0 ; 2A TODO
	map_const	BELL_OBSERVATORY_DESTROYED_2, 10,  6 ; 2B TODO
	map_const	BLUE_MOON_2,                  0,  0 ; 2C TODO
	map_const	TECH_CITY_BLACKOUT,           18,  12 ; 2D TODO
	map_const	G1_2E,                        6,  5 ; 2E TODO
	map_const	G1_2F,                        6,  5 ; 2F TODO
	map_const	G1_30,                        6,  5 ; 30 TODO
	map_const	G1_31,                        6,  5 ; 31 TODO
	map_const	G1_32,                        6,  5 ; 32 TODO
	map_const	G1_33,                        6,  5 ; 33 TODO
	map_const	TECH_SHOP_BLACKOUT,           6,  5 ; 34 TODO
	map_const	TECH_HEALING_CENTER_BLACKOUT, 6,  5 ; 35 TODO
	; TODO
	endgroup

	newgroup    GROUP_02                    ; 02
	map_const	DUOLU_CITY_2,                      18, 12 ; 01
	map_const	SHANDA_FARM,                       12, 15 ; 02
	map_const	COFFEE_FOREST_PART_1,              15, 12 ; 03
	map_const	COFFEE_FOREST_PART_2,              12, 15 ; 04
	map_const	COFFEE_FOREST_PART_3,              6, 8 ; 05
	map_const	SKY_ROCK_PART_1,                   15, 15 ; 06
	map_const	SKY_ROCK_PART_2,                   6, 5 ; 07
	map_const	CLOCK_TOWER_OUTSIDE,               6, 12 ; 08
	map_const	CLOCK_TOWER_1F,                    12, 12 ; 09
	map_const	CLOCK_TOWER_2F,                    12, 12 ; 0A
	map_const	CLOCK_TOWER_3F,                    10, 10 ; 0B
	map_const	CLOCK_TOWER_4F,                    10, 10 ; 0C
	map_const	CLOCK_TOWER_5F,                    6, 5 ; 0D
	map_const	GALL_ENTERPRISE,                   6, 5 ; 0E
	map_const	G2_0F,                             6, 5 ; 0F
	map_const	G2_10,                             6, 5 ; 10
	map_const	G2_11,                             6, 5 ; 11
	map_const	SHANDA_FARM_12,                    6, 5 ; 12
	map_const	SHANDA_FARM_13,                    6, 5 ; 13
	map_const	SHANDA_FARM_14,                    6, 5 ; 14
	map_const	SHANDA_FARM_15,                    6, 5 ; 15
	map_const	MARK_NINA_INTRO,                   6, 5 ; 16
	map_const	R_03,                              6, 12 ; 17
	map_const	R_04,                              12, 10 ; 18
	map_const	G2_19,                             6, 5 ; 19
	map_const	G2_1A,                             6, 5 ; 1A
	map_const	DUOLU_CITY_1B,                     6, 5 ; 1B
	map_const	DUOLU_CITY_1C,                     6, 5 ; 1C
	map_const	DUOLU_CITY_1D,                     6, 5 ; 1D
	map_const	G2_1E,                             6, 5 ; 1E
	map_const	G2_1F,                             6, 5 ; 1F
	map_const	DUOLU_CITY_20,                     6, 5 ; 20
	map_const	HEALING_CENTER_G_221,              6, 5 ; 21
	map_const	SHOP_G_222,                        6, 5 ; 22
	map_const	G2_23,                             6, 6 ; 23
	endgroup

	newgroup    GROUP_03                    ; 02
	map_const	GREEN_FOREST_P_12,                 15, 12 ; 01
	map_const	GREEN_FOREST_P_21,                 12, 15 ; 02
	map_const	GREEN_FOREST_P_31,                 6, 8 ; 03
	map_const	GREEN_FOREST_P_13,                 15, 12 ; 04
	map_const	GREEN_FOREST_P_22,                 12, 15 ; 05
	map_const	GREEN_FOREST_P_32,                 6, 8 ; 06
	map_const	SKY_CITY,                          15, 15 ; 07
	map_const	BANGLIN_CO_1F,                     6, 5 ; 08
	map_const	BANGLIN_CO_2,                      6, 5 ; 09
	map_const	CONTEST_HALL,                      6, 6 ; 0A
	map_const	BANGLIN_CO_2F,                     12, 12 ; 0B
	map_const	BANGLIN_CO_3F,                     12, 12 ; 0C
	map_const	BANGLIN_CO_4F,                     12, 12 ; 0D
	map_const	BANGLIN_CO_5F,                     12, 12 ; 0E
	map_const	FASHION_STORE,                     6, 5 ; 0F
	map_const	AIRPORT_OUTSIDE,                   6, 5 ; 10
	map_const	AIRPORT,                           6, 5 ; 11
	map_const	GREEN_FOREST_P_4,                  10, 10 ; 12
	map_const	GREEN_FOREST_P_5,                  6, 5 ; 13
	map_const	GREEN_FOREST_P_6,                  6, 5 ; 14
	map_const	G3_15,                             6, 10 ; 15
	map_const	G3_16,                             12, 6 ; 16
	map_const	G3_17,                             6, 5 ; 17
	map_const	G3_18,                             6, 5 ; 18
	map_const	G3_19,                             6, 5 ; 19
	map_const	G3_1A,                             6, 5 ; 1A
	map_const	G3_1B,                             6, 5 ; 1B
	map_const	BANGLIN_CO,                        6, 5 ; 1C
	map_const	G3_1D,                             6, 5 ; 1D
	map_const	G3_1E,                             6, 5 ; 1E
	map_const	G3_1F,                             6, 8 ; 1F
	map_const	GREEN_FOREST_20,                   6, 8 ; 20
	map_const	GREEN_FOREST_21,                   10, 10 ; 21
	map_const	GREEN_FOREST_22,                   6, 5 ; 22
	map_const	GREEN_FOREST_23,                   6, 5 ; 23
	endgroup

	newgroup    GROUP_04                            ; 04
	map_const	G4_01,                             12, 12 ; 01
	map_const	G4_02,                             12, 12 ; 02
	map_const	G4_03,                             10, 10 ; 03
	map_const	G4_04,                             10, 10 ; 04
	map_const	G4_05,                             6, 5 ; 05
	map_const	G4_06,                             10, 10 ; 06
	map_const	G4_07,                             10, 10 ; 07
	map_const	G4_08,                             10, 10 ; 08
	map_const	G4_09,                             10, 10 ; 09
	map_const	EAST_FISHMARKET_MERMAID_CUTSCENE,  6, 5 ; 0A
	map_const	EAST_FISHMARKET_0B,                12, 12 ; 0B
	map_const	EAST_FISHMARKET_0C,                12, 5 ; 0C
	map_const	EAST_FISHMARKET_UNDERSEA_0D,       10, 10 ; 0D
	map_const	EAST_FISHMARKET_UNDERSEA_0E,       10, 10 ; 0E
	map_const	G4_0F,                            6, 5 ; 0F
	map_const	G4_10,                             6, 10 ; 10
	map_const	EAST_FISHMARKET_UNDERSEA_11,       6, 5 ; 11
	map_const	EAST_FISHMARKET_UNDERSEA_12,       6, 5 ; 12
	map_const	EAST_FISHMARKET_UNDERSEA_13,       6, 5 ; 13
	map_const	GEOTHERMAL_CITY_14,                10, 12 ; 14
	map_const	LIFE_VALLEY,                       15, 15 ; 15
	map_const	DEATH_VALLEY,                      15, 15 ; 16
	map_const	G4_17,                             10, 5 ; 17
	map_const	TRAVELING_SHIP_18,                 10, 5 ; 18
	map_const	TRAVELING_SHIP_19,                 10, 5 ; 19
	map_const	G4_1A,                            10, 10 ; 1A
	map_const	G4_1B,                            10, 10 ; 1B
	map_const	G4_1C,                            10, 10 ; 1C
	map_const	SACREDTREE_TIME_TRAVEL,            6, 10 ; 1D
	map_const	G4_1E,                            12, 6 ; 1E
	map_const	G4_1F,                            6, 5 ; 1F
	map_const	G4_20,                             12, 12 ; 20
	map_const	SACREDTREE_VILLAGE_21,             12, 12 ; 21
	map_const	G4_22,                             12, 12 ; 22
	map_const	G4_23,                             12, 12 ; 23
	map_const	SACREDTREE_STARDREAM_DEPARTURE,    6, 12 ; 24
	map_const	SACREDTREE_VILLAGE_25,             12, 12 ; 25
	map_const	G4_26,                             12, 12 ; 26
	map_const	SACREDTREE_VILLAGE_27,             12, 12 ; 27
	map_const	SACREDTREE_VILLAGE_28,             8, 5 ; 28
	map_const	G4_29,                             8, 5 ; 29
	map_const	G4_2A,                            6, 24 ; 2A
	map_const	G4_2B,                            8, 6 ; 2B
	map_const	EAST_FISHMARKET_2C,                6, 5 ; 2C
	map_const	EAST_FISHMARKET_2D,                6, 5 ; 2D
	map_const	EAST_FISHMARKET_2E,                6, 5 ; 2E
	map_const	EAST_FISHMARKET_2F,                6, 5 ; 2F
	map_const	G4_30,                             6, 5 ; 30
	map_const	EAST_FISHMARKET_31,                6, 5 ; 31
	map_const	EAST_FISHMARKET_32,                6, 5 ; 32
	map_const	EAST_FISHMARKET_33,                6, 5 ; 33
	map_const	GEOTHERMAL_CITY_34,                6, 5 ; 34
	map_const	GEOTHERMAL_CITY_35,                6, 5 ; 35
	map_const	GEOTHERMAL_CITY_36,                6, 5 ; 36
	map_const	GEOTHERMAL_CITY_37,                6, 5 ; 37
	map_const	GEOTHERMAL_SHOP,                   6, 5 ; 38
	map_const	GEOTHERMAL_HEALING_CENTER,         6, 5 ; 39
	map_const	SACREDTREE_VILLAGE_3A,             6, 5 ; 3A
	map_const	SACREDTREE_VILLAGE_3B,             6, 5 ; 3B
	map_const	SACREDTREE_VILLAGE_3C,             6, 5 ; 3C
	map_const	SACREDTREE_VILLAGE_3D,             6, 5 ; 3D
	map_const	SACREDTREE_VILLAGE_3E,             6, 5 ; 3E
	map_const	SACREDTREE_VILLAGE_3F,             6, 5 ; 3F
	map_const	SACREDTREE_HEALING_CENTER_40,      6, 5 ; 40
	map_const	SACREDTREE_SHOP_41,                6, 5 ; 41
	map_const	G4_42,                             6, 5 ; 42
	map_const	G4_43,                             6, 5 ; 43
	map_const	G4_44,                             12, 5 ; 44
	map_const	EAST_FISHMARKET_45,                12, 12 ; 45
	map_const	EAST_FISHMARKET_46,                6, 5 ; 46
	map_const	EAST_FISHMARKET_47,                6, 5 ; 47
	map_const	EAST_FISHMARKET_48,                6, 5 ; 48
	map_const	EAST_FISHMARKET_49,                6, 5 ; 49
	map_const	G4_4A,                            6, 5 ; 4A
	map_const	EAST_FISHMARKET_HEALING_CENTER,    6, 5 ; 4B
	map_const	EAST_FISHMARKET_SHOP,              6, 5 ; 4C
	map_const	EAST_FISHMARKET_ANTON_CUTSCENE,    6, 5 ; 4D
	map_const	EAST_FISHMARKET_4E,                6, 5 ; 4E
	map_const	LIFE_VALLEY_RESCUE,                6, 12 ; 4F
	map_const	G4_50,                             10, 5 ; 50
	map_const	TRAVELING_SHIP_51,                 10, 5 ; 51
	map_const	G4_52,                             10, 5 ; 52
	map_const	G4_53,                             6, 5 ; 53
	map_const	G4_54,                             6, 5 ; 54
	map_const	SACREDTREE_VILLAGE_55,             8, 5 ; 55
	map_const	SACREDTREE_VILLAGE_56,             6, 5 ; 56
	map_const	SACREDTREE_VILLAGE_57,             6, 5 ; 57
	map_const	SACREDTREE_VILLAGE_58,             6, 5 ; 58
	map_const	SACREDTREE_VILLAGE_59,             6, 5 ; 59
	map_const	G4_5A,                            6, 5 ; 5A
	map_const	SACREDTREE_VILLAGE_PAST,           6, 5 ; 5B
	map_const	SACREDTREE_HEALING_CENTER_5C,      6, 5 ; 5C
	map_const	SACREDTREE_SHOP_5D,                6, 5 ; 5D
	map_const	G4_5E,                            6, 24 ; 5E
	map_const	G4_5F,                            8, 6 ; 5F
	map_const	G4_60,                             12, 12 ; 60
	map_const	G4_61,                             12, 12 ; 61
	map_const	G4_62,                             12, 12 ; 62
	map_const	RADAR_STATION,                     6, 12 ; 63
	map_const	G4_64,                             6, 5 ; 64
	map_const	AIRPORT_G465,                      6, 5 ; 65
	endgroup

	newgroup    GROUP_05                            ; 05
	map_const	G5_01,                             18, 15 ; 01
	map_const	PERMAFROST_GARDEN,                 15, 15 ; 02
	map_const	G5_03,                             10, 10 ; 03
	map_const	G5_04,                             10, 10 ; 04
	map_const	G5_05,                             10, 10 ; 05
	map_const	G5_06,                             10, 10 ; 06
	map_const	STARDREAM_CITY_07,                 18, 12 ; 07
	map_const	G5_08,                             12, 10 ; 08
	map_const	G5_09,                             6, 12 ; 09
	map_const	G5_0A,                            10, 12 ; 0A
	map_const	STARDREAM_MACHINE_ROOM_0B,         10, 12 ; 0B
	map_const	G5_0C,                            12, 10 ; 0C
	map_const	STARDREAM_MACHINE_ROOM_0D,         6, 12 ; 0D
	map_const	G5_0E,                            6, 5 ; 0E
	map_const	STARDREAM_CITY_0F,                 6, 5 ; 0F
	map_const	STARDREAM_FLORIST,                 6, 5 ; 10
	map_const	STARDREAM_HOSPITAL_11,             6, 5 ; 11
	map_const	STARDREAM_HOSPITAL_12,             10, 5 ; 12
	map_const	STARDREAM_HOSPITAL_13,             6, 5 ; 13
	map_const	STARDREAM_HOSPITAL_14,             6, 5 ; 14
	map_const	STARDREAM_HOSPITAL_15,             6, 5 ; 15
	map_const	STARDREAM_AIRSHIP_16,              18, 5 ; 16
	map_const	G5_17,                             18, 5 ; 17
	map_const	STARDREAM_AIRSHIP_18,              6, 5 ; 18
	map_const	G5_19,                             6, 6 ; 19
	map_const	PRESALE_HOUSE_1A,                  6, 5 ; 1A
	map_const	PRESALE_HOUSE_OUTSIDE,             12, 6 ; 1B
	map_const	G5_1C,                            6, 12 ; 1C
	map_const	CARDILLA_HOUSE,                    6, 5 ; 1D
	map_const	STARDREAM_CITY_1E,                 6, 5 ; 1E
	map_const	PRESALE_HOUSE_1F,                  6, 5 ; 1F
	map_const	STARDREAM_CITY_20,                 6, 5 ; 20
	map_const	STARDREAM_HEALING_CENTER,          6, 5 ; 21
	map_const	STARDREAM_SHOP,                    6, 5 ; 22
	map_const	G5_23,                             6, 10 ; 23
	map_const	STARDREAM_SCHOOL_24,               6, 10 ; 24
	map_const	STARDREAM_SCHOOL_25,               6, 6 ; 25
	map_const	STARDREAM_SCHOOL_26,               6, 6 ; 26
	map_const	G5_27,                             6, 5 ; 27
	endgroup

	newgroup    GROUP_06                            ; 06
	map_const	G6_01,                             15, 15 ; 01
	map_const	KINGKONG_MOUNTAIN,                 15, 15 ; 02
	map_const	G6_03,                             10, 10 ; 03
	map_const	G6_04,                             10, 10 ; 04
	map_const	G6_05,                             10, 10 ; 05
	map_const	G6_06,                             10, 10 ; 06
	map_const	BAAL_CAPITAL_PROFESSOR_07,         6, 6 ; 07
	map_const	G6_08,                             10, 15 ; 08
	map_const	G6_09,                             10, 15 ; 09
	map_const	G6_0A,                            10, 15 ; 0A
	map_const	ENDING_EPILOGUE,                   10, 15 ; 0B
	map_const	BAAL_CAPITAL_0C,                   18, 15 ; 0C
	map_const	G6_0D,                            6, 5 ; 0D
	map_const	G6_0E,                            12, 5 ; 0E
	map_const	G6_0F,                            10, 5 ; 0F
	map_const	G6_10,                             6, 5 ; 10
	map_const	G6_11,                             6, 5 ; 11
	map_const	G6_12,                             6, 5 ; 12
	map_const	G6_13,                             6, 5 ; 13
	map_const	G6_14,                             6, 5 ; 14
	map_const	G6_15,                             6, 5 ; 15
	map_const	G6_16,                             6, 5 ; 16
	map_const	G6_17,                             6, 5 ; 17
	map_const	G6_18,                             10, 10 ; 18
	map_const	G6_19,                             6, 5 ; 19
	map_const	G6_1A,                            6, 5 ; 1A
	map_const	G6_1B,                            6, 5 ; 1B
	map_const	G6_1C,                            6, 5 ; 1C
	map_const	G6_1D,                            6, 5 ; 1D
	map_const	G6_1E,                            18, 5 ; 1E
	map_const	G6_1F,                            6, 6 ; 1F
	map_const	G6_20,                             6, 5 ; 20
	map_const	G6_21,                             6, 5 ; 21
	map_const	BAAL_CAPITAL_22,                   6, 5 ; 22
	map_const	BAAL_CAPITAL_23,                   6, 5 ; 23
	map_const	BAAL_CAPITAL_24,                   6, 5 ; 24
	map_const	G6_25,                             6, 5 ; 25
	map_const	BAAL_CAPITAL_26,                   6, 5 ; 26
	map_const	BAAL_CAPITAL_BLACKSMITH,           6, 5 ; 27
	map_const	G6_28,                             6, 5 ; 28
	map_const	G6_29,                             6, 5 ; 29
	map_const	G6_2A,                            6, 5 ; 2A
	map_const	BAAL_CAPITAL_PROFESSOR_2B,         6, 5 ; 2B
	map_const	G6_2C,                            6, 5 ; 2C
	endgroup

	newgroup    GROUP_07                            ; 07
	map_const	G7_01,                             6, 5 ; 01
	map_const	G7_02,                             12, 10 ; 02
	map_const	G7_03,                             12, 5 ; 03
	map_const	G7_04,                             10, 5 ; 04
	map_const	G7_05,                             8, 5 ; 05
	map_const	G7_06,                             6, 6 ; 06
	map_const	G7_07,                             6, 5 ; 07
	map_const	G7_08,                             6, 5 ; 08
	map_const	G7_09,                             6, 5 ; 09
	map_const	G7_0A,                            6, 10 ; 0A
	endgroup

	newgroup    GROUP_08                            ; 08
	map_const	G8_01,                        0,  0 ; 01 TODO
	; TODO
	endgroup
