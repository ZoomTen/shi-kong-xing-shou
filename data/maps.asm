INCLUDE "constants.asm"

SECTION "Group 00 Map Defs", ROMX
Group00_Maps::
INCLUDE "data/maps/header_pointers/g00.asm"
INCLUDE "data/maps/headers/g00.asm"
INCLUDE "data/maps/events/g00.asm"

SECTION "Group 01 Map Defs", ROMX
Group01_Maps::
INCLUDE "data/maps/header_pointers/g01.asm"
INCLUDE "data/maps/headers/g01.asm"
INCLUDE "data/maps/events/g01.asm"

SECTION "Group 02 Map Defs", ROMX
Group02_Maps::
INCLUDE "data/maps/header_pointers/g02.asm"
INCLUDE "data/maps/headers/g02.asm"
INCLUDE "data/maps/events/g02.asm"

SECTION "Group 03 Map Defs", ROMX
Group03_Maps::
INCLUDE "data/maps/header_pointers/g03.asm"
INCLUDE "data/maps/headers/g03.asm"
INCLUDE "data/maps/events/g03.asm"

SECTION "Group 04 Map Defs", ROMX
Group04_Maps::
INCLUDE "data/maps/header_pointers/g04.asm"
INCLUDE "data/maps/headers/g04.asm"
INCLUDE "data/maps/events/g04.asm"

SECTION "Group 05 Map Defs", ROMX
Group05_Maps::
INCLUDE "data/maps/header_pointers/g05.asm"
INCLUDE "data/maps/headers/g05.asm"
INCLUDE "data/maps/events/g05.asm"

SECTION "Group 06 Map Defs", ROMX
Group06_Maps::
INCLUDE "data/maps/header_pointers/g06.asm"
INCLUDE "data/maps/headers/g06.asm"
INCLUDE "data/maps/events/g06.asm"

SECTION "Group 07 Map Defs", ROMX
Group07_Maps::
INCLUDE "data/maps/header_pointers/g07.asm"
INCLUDE "data/maps/headers/g07.asm"
INCLUDE "data/maps/events/g07.asm"

; these aren't just map_attrs, because they aren't neatly separated out and all
; absolute VF moment

SECTION "Map Data 1", ROMX
INCLUDE "data/maps/attributes/bank_01.asm"

SECTION "Map Data 2", ROMX
INCLUDE "data/maps/attributes/bank_11.asm"

SECTION "Map Data 3", ROMX
INCLUDE "data/maps/attributes/bank_17.asm"

SECTION "Map Data 4", ROMX
INCLUDE "data/maps/attributes/bank_18.asm"

SECTION "Map Data 5", ROMX
INCLUDE "data/maps/attributes/bank_50.asm"

SECTION "Map Data 6", ROMX
INCLUDE "data/maps/attributes/bank_53.asm"

SECTION "Map Data 7", ROMX
INCLUDE "data/maps/attributes/bank_57.asm"

SECTION "Map Data 8", ROMX
INCLUDE "data/maps/attributes/bank_64.asm"

SECTION "Map Data 9", ROMX
INCLUDE "data/maps/attributes/bank_69.asm"

SECTION "Map Data 10", ROMX
INCLUDE "data/maps/attributes/bank_6a.asm"

SECTION "Map Data 11", ROMX
INCLUDE "data/maps/attributes/bank_6b.asm"

SECTION "Map Data 12", ROMX
INCLUDE "data/maps/attributes/bank_6b_2.asm"

SECTION "Map Data 13", ROMX
INCLUDE "data/maps/attributes/bank_6e.asm"

SECTION "Scripts 1", ROMX
INCLUDE "data/maps/scripts/bank_08.asm"

SECTION "Scripts 2", ROMX
INCLUDE "data/maps/scripts/bank_08_2.asm"

; Map scripts & object events (per-map files; empty/orphan stubs inline)

SECTION "Scripts 3", ROMX

INCLUDE "data/maps/scripts/Script_00e_4000.asm"
Bank0e_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/BellVillage2.asm"
INCLUDE "data/maps/scripts/HayatosHouse2.asm"
INCLUDE "data/maps/scripts/CarpetWomansHouse2.asm"
INCLUDE "data/maps/scripts/FangfangsHouse2.asm"
INCLUDE "data/maps/scripts/BellHealingCenter2.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_422d.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_426b.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4366.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_44ff.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4578.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4597.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_45c0.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4632.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4642.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4664.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_469f.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_481c.asm"
INCLUDE "data/maps/scripts/CrystalVillage.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_49c5.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_49df.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_49ef.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4a1a.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00e_4a75.asm"

SECTION "Scripts 4", ROMX

INCLUDE "data/maps/scripts/Script_0e_7e69.asm"

SECTION "Scripts 5", ROMX

Bank0f_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/Script_00f_4001.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00f_401a.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00f_4039.asm"
INCLUDE "data/maps/scripts/PowerPlantOutside.asm"
INCLUDE "data/maps/scripts/PowerPlant1F.asm"
INCLUDE "data/maps/scripts/TechCity.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00f_4329.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00f_4348.asm"
INCLUDE "data/maps/scripts/TechShop.asm"
INCLUDE "data/maps/scripts/TechHealingCenter.asm"
INCLUDE "data/maps/scripts/ObjectEvents_00f_43d2.asm"

SECTION "Scripts 6", ROMX

INCLUDE "data/maps/scripts/Script_00f_594f.asm"

SECTION "Scripts 7", ROMX

INCLUDE "data/maps/scripts/Script_012_4000.asm"

Bank12_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/ObjectEvents_012_41dd.asm"

SECTION "Scripts 8", ROMX

INCLUDE "data/maps/scripts/DuoluCity2.asm"
INCLUDE "data/maps/scripts/MarkNinaIntro.asm"
INCLUDE "data/maps/scripts/ClockTower5f.asm"
INCLUDE "data/maps/scripts/G2_19.asm"
INCLUDE "data/maps/scripts/G2_1A.asm"
INCLUDE "data/maps/scripts/CoffeeForestPart3.asm"
INCLUDE "data/maps/scripts/G2_23.asm"

SECTION "Scripts 9", ROMX

INCLUDE "data/maps/scripts/unk_04e_4000.asm"
Bank4e_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/Script_04e_400a.asm"
INCLUDE "data/maps/scripts/BanglinCo2.asm"
INCLUDE "data/maps/scripts/ContestHall.asm"
INCLUDE "data/maps/scripts/Airport.asm"

SECTION "Scripts 10", ROMX

INCLUDE "data/maps/scripts/MovementData_4e_5ff6.asm"

SECTION "Scripts 11", ROMX

INCLUDE "data/maps/scripts/Script_04f_4000.asm"
INCLUDE "data/maps/scripts/G3_1E.asm"
INCLUDE "data/maps/scripts/G3_1D.asm"

SECTION "Scripts 12", ROMX

INCLUDE "data/maps/scripts/Script_04f_40c6.asm"

SECTION "Scripts 13", ROMX

INCLUDE "data/maps/scripts/Script_04f_4384.asm"
Bank4f_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/BanglinCo1f.asm"
INCLUDE "data/maps/scripts/GreenForest_21.asm"
INCLUDE "data/maps/scripts/GreenForest_22.asm"
INCLUDE "data/maps/scripts/GreenForestP4.asm"
INCLUDE "data/maps/scripts/GreenForestP13.asm"
INCLUDE "data/maps/scripts/GreenForest_20.asm"

SECTION "Scripts 14", ROMX

INCLUDE "data/maps/scripts/MovementData_4f_7ae1.asm"

SECTION "Scripts 15", ROMX

INCLUDE "data/maps/scripts/EastFishmarket_32.asm"
INCLUDE "data/maps/scripts/EastFishmarket_31.asm"

SECTION "Scripts 16", ROMX

INCLUDE "data/maps/scripts/Script_055_53ef.asm"
Bank55_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/Script_055_53f2.asm"
INCLUDE "data/maps/scripts/EastFishmarket_0b.asm"
INCLUDE "data/maps/scripts/EastFishmarket_0c.asm"
INCLUDE "data/maps/scripts/EastFishmarketUndersea_0d.asm"
INCLUDE "data/maps/scripts/EastFishmarketUndersea_0e.asm"
INCLUDE "data/maps/scripts/EastFishmarketUndersea_13.asm"
INCLUDE "data/maps/scripts/EastFishmarket_2c.asm"

SECTION "Scripts 17", ROMX

INCLUDE "data/maps/scripts/MovementData_055_7c53.asm"

SECTION "Scripts 18", ROMX

INCLUDE "data/maps/scripts/GeothermalShop.asm"
INCLUDE "data/maps/scripts/GeothermalHealingCenter.asm"

SECTION "Scripts 19", ROMX

INCLUDE "data/maps/scripts/Script_058_40bc.asm"
Bank58_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/Script_058_40eb.asm"
INCLUDE "data/maps/scripts/G4_20.asm"
INCLUDE "data/maps/scripts/G4_52.asm"
INCLUDE "data/maps/scripts/GeothermalCity_14.asm"
INCLUDE "data/maps/scripts/GeothermalCity_34.asm"
INCLUDE "data/maps/scripts/GeothermalCity_35.asm"
INCLUDE "data/maps/scripts/GeothermalCity_37.asm"
INCLUDE "data/maps/scripts/GeothermalCity_36.asm"
INCLUDE "data/maps/scripts/DeathValley.asm"
INCLUDE "data/maps/scripts/LifeValley.asm"
INCLUDE "data/maps/scripts/LifeValleyRescue.asm"
INCLUDE "data/maps/scripts/TravelingShip_51.asm"

SECTION "Scripts 20", ROMX

INCLUDE "data/maps/scripts/MovementData_058_66ef.asm"

SECTION "Scripts 21", ROMX

INCLUDE "data/maps/scripts/unk_059_4000.asm"
INCLUDE "data/maps/scripts/SacredtreeShop_41.asm"
INCLUDE "data/maps/scripts/SacredtreeHealingCenter_40.asm"

SECTION "Scripts 22", ROMX

INCLUDE "data/maps/scripts/Script_059_40c0.asm"

Bank59_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/SacredtreeVillage_25.asm"
INCLUDE "data/maps/scripts/SacredtreeVillage_3e.asm"
INCLUDE "data/maps/scripts/G4_29.asm"
INCLUDE "data/maps/scripts/SacredtreeTimeTravel.asm"
INCLUDE "data/maps/scripts/SacredtreeStardreamDeparture.asm"
INCLUDE "data/maps/scripts/SacredtreeVillage_21.asm"

SECTION "Scripts 23", ROMX

INCLUDE "data/maps/scripts/MovementData_059_7ac9.asm"

SECTION "Scripts 24", ROMX

INCLUDE "data/maps/scripts/SacredtreeShop_5d.asm"
INCLUDE "data/maps/scripts/SacredtreeHealingCenter_5c.asm"

SECTION "Scripts 25", ROMX

INCLUDE "data/maps/scripts/Script_05a_40bc.asm"
Bank5a_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/Script_05a_40be.asm"
INCLUDE "data/maps/scripts/SacredtreeVillagePast.asm"
INCLUDE "data/maps/scripts/G4_26.asm"
INCLUDE "data/maps/scripts/SacredtreeVillage_56.asm"
INCLUDE "data/maps/scripts/SacredtreeVillage_57.asm"
INCLUDE "data/maps/scripts/SacredtreeVillage_58.asm"
INCLUDE "data/maps/scripts/SacredtreeVillage_59.asm"
INCLUDE "data/maps/scripts/SacredtreeVillage_28.asm"
INCLUDE "data/maps/scripts/RadarStation.asm"

SECTION "Scripts 26", ROMX

INCLUDE "data/maps/scripts/MovementData_05a_76e8.asm"

SECTION "Scripts 27", ROMX

INCLUDE "data/maps/scripts/unk_05c_4000.asm"
INCLUDE "data/maps/scripts/Airport_g465.asm"

SECTION "Scripts 28", ROMX

INCLUDE "data/maps/scripts/Script_05c_4058.asm"
INCLUDE "data/maps/scripts/EastFishmarketShop.asm"
INCLUDE "data/maps/scripts/EastFishmarketHealingCenter.asm"

SECTION "Scripts 29", ROMX

INCLUDE "data/maps/scripts/Script_05c_411c.asm"
Bank5c_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/G4_44_ObjectEvents2.asm"
INCLUDE "data/maps/scripts/EastFishmarket_45.asm"
INCLUDE "data/maps/scripts/EastFishmarket_4e.asm"
INCLUDE "data/maps/scripts/EastFishmarket_46.asm"
INCLUDE "data/maps/scripts/EastFishmarket_47.asm"
INCLUDE "data/maps/scripts/EastFishmarket_48.asm"
INCLUDE "data/maps/scripts/EastFishmarket_49.asm"
INCLUDE "data/maps/scripts/EastFishmarketAntonCutscene.asm"

SECTION "Scripts 30", ROMX

INCLUDE "data/maps/scripts/MovementData_05c_5053.asm"

SECTION "Scripts 31", ROMX

INCLUDE "data/maps/scripts/StardreamShop.asm"
INCLUDE "data/maps/scripts/StardreamHealingCenter.asm"

SECTION "Scripts 32", ROMX

INCLUDE "data/maps/scripts/Script_066_40bb.asm"
INCLUDE "data/maps/scripts/StardreamAirship_18.asm"
INCLUDE "data/maps/scripts/StardreamAirship_16.asm"
Bank66_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/PresaleHouseOutside.asm"
INCLUDE "data/maps/scripts/StardreamCity_07.asm"
INCLUDE "data/maps/scripts/StardreamCity_1e.asm"
INCLUDE "data/maps/scripts/PresaleHouse_1f.asm"
INCLUDE "data/maps/scripts/StardreamCity_20.asm"
INCLUDE "data/maps/scripts/StardreamFlorist.asm"
INCLUDE "data/maps/scripts/StardreamCity_0f.asm"
INCLUDE "data/maps/scripts/StardreamHospital_11.asm"
INCLUDE "data/maps/scripts/StardreamHospital_12.asm"
INCLUDE "data/maps/scripts/StardreamHospital_13.asm"
INCLUDE "data/maps/scripts/StardreamHospital_14.asm"
INCLUDE "data/maps/scripts/StardreamSchool_24.asm"
INCLUDE "data/maps/scripts/StardreamSchool_25.asm"
INCLUDE "data/maps/scripts/StardreamSchool_26.asm"
INCLUDE "data/maps/scripts/CardillaHouse.asm"
INCLUDE "data/maps/scripts/StardreamHospital_15.asm"
INCLUDE "data/maps/scripts/StardreamMachineRoom_0b.asm"
INCLUDE "data/maps/scripts/StardreamMachineRoom_0d.asm"

SECTION "Scripts 33", ROMX

INCLUDE "data/maps/scripts/MovementData_066_7cc7.asm"

SECTION "Scripts 34", ROMX

INCLUDE "data/maps/scripts/Script_067_6e01.asm"
INCLUDE "data/maps/scripts/G5_03.asm"

SECTION "Scripts 35", ROMX

INCLUDE "data/maps/scripts/G6_28.asm"
INCLUDE "data/maps/scripts/G6_29.asm"

SECTION "Scripts 36", ROMX

INCLUDE "data/maps/scripts/G6_18.asm"
INCLUDE "data/maps/scripts/G6_19.asm"
INCLUDE "data/maps/scripts/G6_1A.asm"
INCLUDE "data/maps/scripts/G6_1B.asm"
INCLUDE "data/maps/scripts/G6_1D.asm"
INCLUDE "data/maps/scripts/G6_20.asm"
INCLUDE "data/maps/scripts/G6_08.asm"
INCLUDE "data/maps/scripts/G6_1C.asm"
Bank6c_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/Script_06c_4708.asm"
INCLUDE "data/maps/scripts/KingkongMountain.asm"
INCLUDE "data/maps/scripts/BaalCapitalProfessor_07.asm"
INCLUDE "data/maps/scripts/BaalCapital_0c.asm"
INCLUDE "data/maps/scripts/G6_0D.asm"
INCLUDE "data/maps/scripts/G6_14.asm"
INCLUDE "data/maps/scripts/G6_13.asm"
INCLUDE "data/maps/scripts/BaalCapital_26.asm"
INCLUDE "data/maps/scripts/ObjectEvents_06c_4eae.asm"
INCLUDE "data/maps/scripts/G6_1F.asm"

SECTION "Scripts 37", ROMX

INCLUDE "data/maps/scripts/MovementData_06c_7913.asm"

SECTION "Scripts 38", ROMX

	end ; trailing script terminator
Bank6e_EmptyObjectEvent::
	objects_end
INCLUDE "data/maps/scripts/G7_09.asm"
