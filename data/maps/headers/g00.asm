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

	map  BellSchoolOutside1
	warp 0, 5, $9058, Bank08_EmptyObjectEvent
	warp 0, 0, $6058, Bank08_EmptyObjectEvent
	end_map

	map  BellObservatoryOutside1
	warp 0, 1, $8018, Bank08_EmptyObjectEvent
	warp 5, 0, $7058, Bank08_EmptyObjectEvent
	end_map

	map  BallotsHouse1
	warp 0, 0, $8038, Bank08_EmptyObjectEvent
	warp 1, 0, $4078, Bank08_EmptyObjectEvent
	warp 0, 0, $4038, BallotsHouse1_ObjectEvents2, BallotsHouse1_MapEvents2
	warp 0, 0, $8038, BallotsHouse1_ObjectEvents3
	warp 0, 0, $8038, BallotsHouse1_ObjectEvents4
	end_map

	map  HayatosHouse1
	warp 0, 0, $8078
	end_map

	map  CarpetWomansHouse1
	warp 0, 0, $8038
	end_map

	map  FangfangsHouse1
	warp 0, 0, $8078
	end_map

	map  BellHealingCenter1
	warp 0, 0, $8068
	end_map

	map  BellSchool1
	warp 0, 5, $8068
	warp 0, 5, $6028
	warp 0, 0, $7028
	end_map

	map  BellObservatory1
	warp 1, 1, $8068, Bank08_EmptyObjectEvent
	warp 0, 1, $b088, BellObservatory1_ObjectEvents2
	end_map

	map BellSchoolSouthClassroom1, BellSchoolClassroom_MapAttributes
	warp 1, 0, $4078
	end_map

	map BellSchoolNorthClassroom1, BellSchoolClassroom_MapAttributes
	warp 1, 0, $4078
	warp 0, 1, $5078, Bank08_EmptyObjectEvent, BellSchoolNorthClassroom1_MapEvents2
	end_map

	map  BlueMoon
	warp 0, 5, $20b0, Bank08_EmptyObjectEvent
	end_map
