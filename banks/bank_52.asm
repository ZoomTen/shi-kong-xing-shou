Group04_Maps::
	dw MapHeader_052_40cc
	dw MapHeader_052_40cc
	dw MapHeader_052_411a
	dw MapHeader_052_4180
	dw MapHeader_052_41b6
	dw MapHeader_052_41d4
	dw MapHeader_052_41f2
	dw MapHeader_052_4210
	dw MapHeader_052_422e
	dw MapHeader_052_424c
	dw MapHeader_052_426a
	dw MapHeader_052_4288
	dw MapHeader_052_4306
	dw MapHeader_052_433c
	dw MapHeader_052_4372
	dw MapHeader_052_43a8
	dw MapHeader_052_43d2
	dw MapHeader_052_43f0
	dw MapHeader_052_4402
	dw MapHeader_052_4420
	dw MapHeader_052_4432
	dw MapHeader_052_44a4
	dw MapHeader_052_44ce
	dw MapHeader_052_44ec
	dw MapHeader_052_450a
	dw MapHeader_052_4528
	dw MapHeader_052_4546
	dw MapHeader_052_4564
	dw MapHeader_052_4582
	dw MapHeader_052_45a0
	dw MapHeader_052_45be
	dw MapHeader_052_45f4
	dw MapHeader_052_4612
	dw MapHeader_052_4660
	dw MapHeader_052_4696
	dw MapHeader_052_46b4
	dw MapHeader_052_46ea
	dw MapHeader_052_472c
	dw MapHeader_052_47b6
	dw MapHeader_052_4840
	dw MapHeader_052_48ca
	dw MapHeader_052_48dc
	dw MapHeader_052_48fa
	dw MapHeader_052_4918
	dw MapHeader_052_4936
	dw MapHeader_052_4948
	dw MapHeader_052_495a
	dw MapHeader_052_496c
	dw MapHeader_052_497e
	dw MapHeader_052_4990
	dw MapHeader_052_49a2
	dw MapHeader_052_49b4
	dw MapHeader_052_49c6
	dw MapHeader_052_49d8
	dw MapHeader_052_49ea
	dw MapHeader_052_4a08
	dw MapHeader_052_4a1a
	dw MapHeader_052_4a2c
	dw MapHeader_052_4a3e
	dw MapHeader_052_4a50
	dw MapHeader_052_4a62
	dw MapHeader_052_4a74
	dw MapHeader_052_4a86
	dw MapHeader_052_4a98
	dw MapHeader_052_4ac2
	dw MapHeader_052_4ad4
	dw MapHeader_052_4ae6
	dw MapHeader_052_4b04
	dw MapHeader_052_4b22
	dw MapHeader_052_4b58
	dw MapHeader_052_4be2
	dw MapHeader_052_4bf4
	dw MapHeader_052_4c06
	dw MapHeader_052_4c18
	dw MapHeader_052_4c2a
	dw MapHeader_052_4c3c
	dw MapHeader_052_4c4e
	dw MapHeader_052_4c60
	dw MapHeader_052_4c7e
	dw MapHeader_052_4ca8
	dw MapHeader_052_4cd2
	dw MapHeader_052_4cf0
	dw MapHeader_052_4d0e
	dw MapHeader_052_4d2c
	dw MapHeader_052_4d4a
	dw MapHeader_052_4d5c
	dw MapHeader_052_4d86
	dw MapHeader_052_4d98
	dw MapHeader_052_4daa
	dw MapHeader_052_4dbc
	dw MapHeader_052_4dce
	dw MapHeader_052_4de0
	dw MapHeader_052_4dfe
	dw MapHeader_052_4e10
	dw MapHeader_052_4e22
	dw MapHeader_052_4e40
	dw MapHeader_052_4e5e
	dw MapHeader_052_4e94
	dw MapHeader_052_4eb2
	dw MapHeader_052_4ee8
	dw MapHeader_052_4efa
	dw MapHeader_052_4f18

MapHeader_052_40cc:
	dbaw2 MapAttributes_053_4000
	; warp 0, 7, $7038, ObjectEvents_055_53f1, MapEvents_052_4f36
	db 0, 7
	dw $7038
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f36

	; warp 0, 4, $5018, ObjectEvents_055_53f1, MapEvents_052_4f36
	db 0, 4
	dw $5018
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f36

	; warp 1, 0, $6078, ObjectEvents_055_53f1, MapEvents_052_4f36
	db 1, 0
	dw $6078
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f36

	; warp 2, 3, $6038, ObjectEvents_055_53f1, MapEvents_052_4f36
	db 2, 3
	dw $6038
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f36

	; warp 6, 3, $6048, ObjectEvents_055_53f1, MapEvents_052_4f36
	db 6, 3
	dw $6048
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f36

	; warp 7, 7, $3058, ObjectEvents_055_53f1, MapEvents_052_4f36
	db 7, 7
	dw $3058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f36

MapHeader_052_411a:
	dbaw2 MapAttributes_053_4014
	; warp 2, 0, $6058, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 2, 0
	dw $6058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

	; warp 2, 3, $6058, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 2, 3
	dw $6058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

	; warp 0, 3, $7028, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 0, 3
	dw $7028
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

	; warp 0, 7, $9028, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 0, 7
	dw $9028
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

	; warp 7, 3, $5088, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 7, 3
	dw $5088
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

	; warp 6, 3, $6048, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 6, 3
	dw $6048
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

	; warp 7, 6, $5058, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 7, 6
	dw $5058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

	; warp 7, 7, $8078, ObjectEvents_055_53f1, MapEvents_052_4f5b
	db 7, 7
	dw $8078
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f5b

MapHeader_052_4180:
	dbaw2 MapAttributes_053_4028
	; warp 3, 0, $2058, ObjectEvents_055_53f1, MapEvents_052_4f8c
	db 3, 0
	dw $2058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f8c

	; warp 0, 5, $9028, ObjectEvents_055_53f1, MapEvents_052_4f8c
	db 0, 5
	dw $9028
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f8c

	; warp 5, 3, $5078, ObjectEvents_055_53f1, MapEvents_052_4f8c
	db 5, 3
	dw $5078
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f8c

	; warp 5, 5, $7078, ObjectEvents_055_53f1, MapEvents_052_4f8c
	db 5, 5
	dw $7078
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4f8c

MapHeader_052_41b6:
	dbaw2 MapAttributes_053_403c
	; warp 0, 0, $2058, ObjectEvents_055_53f1, MapEvents_052_4fa5
	db 0, 0
	dw $2058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4fa5

	; warp 3, 0, $2058, ObjectEvents_055_53f1, MapEvents_052_4fa5
	db 3, 0
	dw $2058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4fa5

MapHeader_052_41d4:
	dbaw2 MapAttributes_053_49e8
	; warp 0, 0, $9058, ObjectEvents_055_53f1, MapEvents_052_4fb2
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_4fb2

	; warp 0, 0, $9068, ObjectEvents_055_56e2, MapEvents_052_4fb2
	db 0, 0
	dw $9068
	db BANK(ObjectEvents_055_56e2)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_56e2
	dw MapEvents_052_4fb2

MapHeader_052_41f2:
	dbaw2 MapAttributes_053_4c0c
	; warp 2, 5, $9048, ObjectEvents_05c_411d, MapEvents_052_4fb9
	db 2, 5
	dw $9048
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fb9

	; warp 4, 2, $7068, ObjectEvents_05c_411d, MapEvents_052_4fb9
	db 4, 2
	dw $7068
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fb9

MapHeader_052_4210:
	dbaw2 MapAttributes_053_4c20
	; warp 5, 3, $5048, ObjectEvents_05c_411d, MapEvents_052_4fc6
	db 5, 3
	dw $5048
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fc6

	; warp 5, 0, $3088, ObjectEvents_05c_411d, MapEvents_052_4fc6
	db 5, 0
	dw $3088
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fc6

MapHeader_052_422e:
	dbaw2 MapAttributes_053_4c34
	; warp 5, 0, $3088, ObjectEvents_05c_411d, MapEvents_052_4fd3
	db 5, 0
	dw $3088
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fd3

	; warp 5, 3, $5048, ObjectEvents_05c_411d, MapEvents_052_4fd3
	db 5, 3
	dw $5048
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fd3

MapHeader_052_424c:
	dbaw2 MapAttributes_053_4c48
	; warp 5, 3, $5048, ObjectEvents_05c_411d, MapEvents_052_4fe0
	db 5, 3
	dw $5048
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fe0

	; warp 1, 2, $7068, ObjectEvents_05c_411d, MapEvents_052_4fe0
	db 1, 2
	dw $7068
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fe0

MapHeader_052_426a:
	dbaw2 MapAttributes_053_4c5c
	; warp 0, 0, $9068, ObjectEvents_05c_411d, MapEvents_052_4fed
	db 0, 0
	dw $9068
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_4fed

	; warp 0, 0, $9068, ObjectEvents_05c_435f, MapEvents_052_4fed
	db 0, 0
	dw $9068
	db BANK(ObjectEvents_05c_435f)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_435f
	dw MapEvents_052_4fed

MapHeader_052_4288:
	dbaw2 MapAttributes_053_5315
	; warp 5, 0, $2068, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 5, 0
	dw $2068
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 4, 1, $4048, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 4, 1
	dw $4048
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 2, 1, $4048, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 2, 1
	dw $4048
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 0, 0, $6028, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 0, 0
	dw $6028
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 0, 4, $6028, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 0, 4
	dw $6028
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 0, 7, $7038, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 0, 7
	dw $7038
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 7, 0, $6068, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 7, 0
	dw $6068
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 7, 3, $6068, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 7, 3
	dw $6068
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 7, 7, $7048, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 7, 7
	dw $7048
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

	; warp 4, 7, $9058, ObjectEvents_055_53f6, MapEvents_052_4ff4
	db 4, 7
	dw $9058
	db BANK(ObjectEvents_055_53f6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f6
	dw MapEvents_052_4ff4

MapHeader_052_4306:
	dbaw2 MapAttributes_053_575b
	; warp 1, 0, $2048, ObjectEvents_055_5479, MapEvents_052_5031
	db 1, 0
	dw $2048
	db BANK(ObjectEvents_055_5479)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5479
	dw MapEvents_052_5031

	; warp 1, 0, $9048, ObjectEvents_055_5479, MapEvents_052_5031
	db 1, 0
	dw $9048
	db BANK(ObjectEvents_055_5479)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5479
	dw MapEvents_052_5031

	; warp 7, 0, $6048, ObjectEvents_055_5479, MapEvents_052_5031
	db 7, 0
	dw $6048
	db BANK(ObjectEvents_055_5479)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5479
	dw MapEvents_052_5031

	; warp 1, 0, $2048, ObjectEvents_055_53f1, MapEvents_052_5031
	db 1, 0
	dw $2048
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_5031

MapHeader_052_433c:
	dbaw2 MapAttributes_053_5973
	; warp 4, 0, $2058, ObjectEvents_055_553e, MapEvents_052_503e
	db 4, 0
	dw $2058
	db BANK(ObjectEvents_055_553e)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_553e
	dw MapEvents_052_503e

	; warp 1, 2, $5048, ObjectEvents_055_553e, MapEvents_052_503e
	db 1, 2
	dw $5048
	db BANK(ObjectEvents_055_553e)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_553e
	dw MapEvents_052_503e

	; warp 0, 5, $8038, ObjectEvents_055_553e, MapEvents_052_503e
	db 0, 5
	dw $8038
	db BANK(ObjectEvents_055_553e)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_553e
	dw MapEvents_052_503e

	; warp 5, 5, $6038, ObjectEvents_055_553e, MapEvents_052_503e
	db 5, 5
	dw $6038
	db BANK(ObjectEvents_055_553e)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_553e
	dw MapEvents_052_503e

MapHeader_052_4372:
	dbaw2 MapAttributes_053_5d29
	; warp 0, 0, $2038, ObjectEvents_055_561f, MapEvents_052_505d
	db 0, 0
	dw $2038
	db BANK(ObjectEvents_055_561f)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_561f
	dw MapEvents_052_505d

	; warp 4, 5, $9058, ObjectEvents_055_561f, MapEvents_052_505d
	db 4, 5
	dw $9058
	db BANK(ObjectEvents_055_561f)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_561f
	dw MapEvents_052_505d

	; warp 0, 0, $2038, ObjectEvents_055_5636, MapEvents_052_505d
	db 0, 0
	dw $2038
	db BANK(ObjectEvents_055_5636)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5636
	dw MapEvents_052_505d

	; warp 4, 5, $9058, ObjectEvents_055_5636, MapEvents_052_505d
	db 4, 5
	dw $9058
	db BANK(ObjectEvents_055_5636)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5636
	dw MapEvents_052_505d

MapHeader_052_43a8:
	dbaw2 MapAttributes_053_606f
	; warp 0, 0, $9058, ObjectEvents_055_53f1, MapEvents_052_5070
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_5070

	; warp 0, 0, $4098, ObjectEvents_055_53f1, MapEvents_052_5070
	db 0, 0
	dw $4098
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_5070

	; warp 1, 0, $5038, ObjectEvents_055_56d6, MapEvents_052_5070
	db 1, 0
	dw $5038
	db BANK(ObjectEvents_055_56d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_56d6
	dw MapEvents_052_5070

MapHeader_052_43d2:
	dbaw2 MapAttributes_053_66e0
	; warp 0, 0, $2058, ObjectEvents_05c_411d, MapEvents_052_507d
	db 0, 0
	dw $2058
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_507d

	; warp 0, 5, $5018, ObjectEvents_05c_411d, MapEvents_052_507d
	db 0, 5
	dw $5018
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_507d

MapHeader_052_43f0:
	dbaw2 MapAttributes_053_6325
	; warp 0, 0, $9058, ObjectEvents_055_55a3, MapEvents_052_5090
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_055_55a3)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_55a3
	dw MapEvents_052_5090

MapHeader_052_4402:
	dbaw2 MapAttributes_053_6339
	; warp 0, 0, $9058, ObjectEvents_055_5597, MapEvents_052_509d
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_055_5597)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5597
	dw MapEvents_052_509d

	; warp 1, 0, $4068, ObjectEvents_055_53f1, MapEvents_052_509d
	db 1, 0
	dw $4068
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_509d

MapHeader_052_4420:
	dbaw2 MapAttributes_053_634d
	; warp 0, 0, $9058, ObjectEvents_055_5840, MapEvents_052_50aa
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_055_5840)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5840
	dw MapEvents_052_50aa

MapHeader_052_4432:
	dbaw2 MapAttributes_053_68a9
	; warp 5, 1, $5048, ObjectEvents_058_453c, MapEvents_052_50bd
	db 5, 1
	dw $5048
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 0, 0, $7038, ObjectEvents_058_453c, MapEvents_052_50bd
	db 0, 0
	dw $7038
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 0, 4, $6028, ObjectEvents_058_453c, MapEvents_052_50bd
	db 0, 4
	dw $6028
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 0, 5, $7018, ObjectEvents_058_453c, MapEvents_052_50bd
	db 0, 5
	dw $7018
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 1, 7, $7058, ObjectEvents_058_453c, MapEvents_052_50bd
	db 1, 7
	dw $7058
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 4, 7, $7048, ObjectEvents_058_453c, MapEvents_052_50bd
	db 4, 7
	dw $7048
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 5, 7, $7058, ObjectEvents_058_453c, MapEvents_052_50bd
	db 5, 7
	dw $7058
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 3, 4, $6058, ObjectEvents_058_453c, MapEvents_052_50bd
	db 3, 4
	dw $6058
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

	; warp 5, 1, $5088, ObjectEvents_058_453c, MapEvents_052_50bd
	db 5, 1
	dw $5088
	db BANK(ObjectEvents_058_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_453c
	dw MapEvents_052_50bd

MapHeader_052_44a4:
	dbaw2 MapAttributes_057_4000
	; warp 5, 10, $9058, ObjectEvents_058_482c, MapEvents_052_50f4
	db 5, 10
	dw $9058
	db BANK(ObjectEvents_058_482c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_482c
	dw MapEvents_052_50f4

	; warp 0, 0, $7018, ObjectEvents_058_482c, MapEvents_052_50f4
	db 0, 0
	dw $7018
	db BANK(ObjectEvents_058_482c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_482c
	dw MapEvents_052_50f4

	; warp 1, 6, $7058, ObjectEvents_058_482c, MapEvents_052_50f4
	db 1, 6
	dw $7058
	db BANK(ObjectEvents_058_482c)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_482c
	dw MapEvents_052_50f4

MapHeader_052_44ce:
	dbaw2 MapAttributes_057_461a
	; warp 10, 0, $4088, ObjectEvents_058_4749, MapEvents_052_5119
	db 10, 0
	dw $4088
	db BANK(ObjectEvents_058_4749)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4749
	dw MapEvents_052_5119

	; warp 8, 2, $6058, ObjectEvents_058_4749, MapEvents_052_5119
	db 8, 2
	dw $6058
	db BANK(ObjectEvents_058_4749)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4749
	dw MapEvents_052_5119

MapHeader_052_44ec:
	dbaw2 MapAttributes_057_4c29
	; warp 2, 0, $9068, ObjectEvents_058_40ea, MapEvents_052_5120
	db 2, 0
	dw $9068
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_5120

	; warp 0, 0, $5038, ObjectEvents_058_40ea, MapEvents_052_5120
	db 0, 0
	dw $5038
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_5120

MapHeader_052_450a:
	dbaw2 MapAttributes_057_4e74
	; warp 0, 0, $6038, ObjectEvents_058_4139, MapEvents_052_5139
	db 0, 0
	dw $6038
	db BANK(ObjectEvents_058_4139)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4139
	dw MapEvents_052_5139

	; warp 5, 0, $6068, ObjectEvents_058_4139, MapEvents_052_5139
	db 5, 0
	dw $6068
	db BANK(ObjectEvents_058_4139)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4139
	dw MapEvents_052_5139

MapHeader_052_4528:
	dbaw2 MapAttributes_057_4e88
	; warp 5, 0, $6068, ObjectEvents_058_4210, MapEvents_052_5152
	db 5, 0
	dw $6068
	db BANK(ObjectEvents_058_4210)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4210
	dw MapEvents_052_5152

	; warp 1, 0, $8068, ObjectEvents_058_450f, MapEvents_052_5152
	db 1, 0
	dw $8068
	db BANK(ObjectEvents_058_450f)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_450f
	dw MapEvents_052_5152

MapHeader_052_4546:
	dbaw2 MapAttributes_057_5208
	; warp 0, 5, $9048, ObjectEvents_059_40ca, MapEvents_052_5165
	db 0, 5
	dw $9048
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_5165

	; warp 5, 5, $9068, ObjectEvents_059_40ca, MapEvents_052_5165
	db 5, 5
	dw $9068
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_5165

MapHeader_052_4564:
	dbaw2 MapAttributes_057_521c
	; warp 0, 0, $2028, ObjectEvents_059_40ca, MapEvents_052_5184
	db 0, 0
	dw $2028
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_5184

	; warp 5, 5, $7088, ObjectEvents_059_40ca, MapEvents_052_5184
	db 5, 5
	dw $7088
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_5184

MapHeader_052_4582:
	dbaw2 MapAttributes_057_5230
	; warp 0, 0, $7018, ObjectEvents_059_40ca, MapEvents_052_5191
	db 0, 0
	dw $7018
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_5191

	; warp 0, 5, $9038, ObjectEvents_059_40ca, MapEvents_052_5191
	db 0, 5
	dw $9038
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_5191

MapHeader_052_45a0:
	dbaw2 MapAttributes_057_5244
	; warp 0, 0, $2068, ObjectEvents_059_4504, MapEvents_052_519e
	db 0, 0
	dw $2068
	db BANK(ObjectEvents_059_4504)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4504
	dw MapEvents_052_519e

	; warp 0, 5, $7038, ObjectEvents_059_40ca, MapEvents_052_519e
	db 0, 5
	dw $7038
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_519e

MapHeader_052_45be:
	dbaw2 MapAttributes_057_59be
	; warp 0, 0, $2028, ObjectEvents_058_40ea, MapEvents_052_51a5
	db 0, 0
	dw $2028
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_51a5

	; warp 0, 1, $9058, ObjectEvents_058_40ea, MapEvents_052_51a5
	db 0, 1
	dw $9058
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_51a5

	; warp 7, 1, $6088, ObjectEvents_058_40ea, MapEvents_052_51a5
	db 7, 1
	dw $6088
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_51a5

	; warp 0, 0, $2028, ObjectEvents_058_4a1d, MapEvents_052_51a5
	db 0, 0
	dw $2028
	db BANK(ObjectEvents_058_4a1d)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4a1d
	dw MapEvents_052_51a5

MapHeader_052_45f4:
	dbaw2 MapAttributes_057_5baa
	; warp 0, 0, $2068, ObjectEvents_058_40ea, MapEvents_052_51c4
	db 0, 0
	dw $2068
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_51c4

	; warp 0, 0, $9058, ObjectEvents_058_40ea, MapEvents_052_51c4
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_51c4

MapHeader_052_4612:
	dbaw2 MapAttributes_057_5ce2
	; warp 3, 0, $2068, ObjectEvents_058_4101, MapEvents_052_51d1
	db 3, 0
	dw $2068
	db BANK(ObjectEvents_058_4101)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4101
	dw MapEvents_052_51d1

	; warp 1, 1, $7048, ObjectEvents_058_4101, MapEvents_052_51d1
	db 1, 1
	dw $7048
	db BANK(ObjectEvents_058_4101)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4101
	dw MapEvents_052_51d1

	; warp 0, 7, $3048, ObjectEvents_058_4101, MapEvents_052_51d1
	db 0, 7
	dw $3048
	db BANK(ObjectEvents_058_4101)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4101
	dw MapEvents_052_51d1

	; warp 3, 4, $6058, ObjectEvents_058_4101, MapEvents_052_51d1
	db 3, 4
	dw $6058
	db BANK(ObjectEvents_058_4101)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4101
	dw MapEvents_052_51d1

	; warp 7, 3, $6028, ObjectEvents_058_4101, MapEvents_052_51d1
	db 7, 3
	dw $6028
	db BANK(ObjectEvents_058_4101)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4101
	dw MapEvents_052_51d1

	; warp 7, 7, $7098, ObjectEvents_058_4101, MapEvents_052_51d1
	db 7, 7
	dw $7098
	db BANK(ObjectEvents_058_4101)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4101
	dw MapEvents_052_51d1

MapHeader_052_4660:
	dbaw2 MapAttributes_057_5f06
	; warp 0, 7, $9058, ObjectEvents_059_471f, MapEvents_052_51d8
	db 0, 7
	dw $9058
	db BANK(ObjectEvents_059_471f)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_471f
	dw MapEvents_052_51d8

	; warp 0, 0, $8028, ObjectEvents_059_471f, MapEvents_052_51d8
	db 0, 0
	dw $8028
	db BANK(ObjectEvents_059_471f)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_471f
	dw MapEvents_052_51d8

	; warp 7, 0, $4078, ObjectEvents_059_471f, MapEvents_052_51d8
	db 7, 0
	dw $4078
	db BANK(ObjectEvents_059_471f)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_471f
	dw MapEvents_052_51d8

	; warp 0, 3, $6038, ObjectEvents_059_471f, MapEvents_052_51d8
	db 0, 3
	dw $6038
	db BANK(ObjectEvents_059_471f)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_471f
	dw MapEvents_052_51d8

MapHeader_052_4696:
	dbaw2 MapAttributes_057_5f1a
	; warp 0, 0, $3028, ObjectEvents_059_4736, MapEvents_052_51f1
	db 0, 0
	dw $3028
	db BANK(ObjectEvents_059_4736)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4736
	dw MapEvents_052_51f1

	; warp 6, 7, $8048, ObjectEvents_059_4736, MapEvents_052_51f1
	db 6, 7
	dw $8048
	db BANK(ObjectEvents_059_4736)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4736
	dw MapEvents_052_51f1

MapHeader_052_46b4:
	dbaw2 MapAttributes_057_5f2e
	; warp 0, 2, $6068, ObjectEvents_059_4758, MapEvents_052_51fe
	db 0, 2
	dw $6068
	db BANK(ObjectEvents_059_4758)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4758
	dw MapEvents_052_51fe

	; warp 0, 7, $9078, ObjectEvents_059_4758, MapEvents_052_51fe
	db 0, 7
	dw $9078
	db BANK(ObjectEvents_059_4758)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4758
	dw MapEvents_052_51fe

	; warp 5, 7, $9048, ObjectEvents_059_4758, MapEvents_052_51fe
	db 5, 7
	dw $9048
	db BANK(ObjectEvents_059_4758)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4758
	dw MapEvents_052_51fe

	; warp 4, 4, $5048, ObjectEvents_059_4758, MapEvents_052_51fe
	db 4, 4
	dw $5048
	db BANK(ObjectEvents_059_4758)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4758
	dw MapEvents_052_51fe

MapHeader_052_46ea:
	dbaw2 MapAttributes_057_5f42
	; warp 0, 7, $9068, ObjectEvents_059_45d4, MapEvents_052_5217
	db 0, 7
	dw $9068
	db BANK(ObjectEvents_059_45d4)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_45d4
	dw MapEvents_052_5217

	; warp 1, 0, $20b0, ObjectEvents_055_5829, MapEvents_052_5217
	db 1, 0
	dw $20b0
	db BANK(ObjectEvents_055_5829)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5829
	dw MapEvents_052_5217

	; warp 1, 0, $20b0, ObjectEvents_058_49ce, MapEvents_052_5217
	db 1, 0
	dw $20b0
	db BANK(ObjectEvents_058_49ce)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_49ce
	dw MapEvents_052_5217

	; warp 1, 0, $20b0, ObjectEvents_059_45b2, MapEvents_052_5217
	db 1, 0
	dw $20b0
	db BANK(ObjectEvents_059_45b2)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_45b2
	dw MapEvents_052_5217

	; warp 1, 0, $7068, ObjectEvents_059_4686, MapEvents_052_5217
	db 1, 0
	dw $7068
	db BANK(ObjectEvents_059_4686)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4686
	dw MapEvents_052_5217

MapHeader_052_472c:
	dbaw2 MapAttributes_057_6852
	; warp 7, 0, $2048, ObjectEvents_059_40cb, MapEvents_052_521e
	db 7, 0
	dw $2048
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 0, 2, $5018, ObjectEvents_059_40cb, MapEvents_052_521e
	db 0, 2
	dw $5018
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 5, 7, $9048, ObjectEvents_059_40cb, MapEvents_052_521e
	db 5, 7
	dw $9048
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 4, 0, $6058, ObjectEvents_059_40cb, MapEvents_052_521e
	db 4, 0
	dw $6058
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 2, 0, $6048, ObjectEvents_059_40cb, MapEvents_052_521e
	db 2, 0
	dw $6048
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 0, 0, $6038, ObjectEvents_059_40cb, MapEvents_052_521e
	db 0, 0
	dw $6038
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 0, 5, $6028, ObjectEvents_059_40cb, MapEvents_052_521e
	db 0, 5
	dw $6028
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 0, 7, $8038, ObjectEvents_059_40cb, MapEvents_052_521e
	db 0, 7
	dw $8038
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 4, 7, $6048, ObjectEvents_059_40cb, MapEvents_052_521e
	db 4, 7
	dw $6048
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 7, 7, $7068, ObjectEvents_059_40cb, MapEvents_052_521e
	db 7, 7
	dw $7068
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

	; warp 7, 1, $8068, ObjectEvents_059_40cb, MapEvents_052_521e
	db 7, 1
	dw $8068
	db BANK(ObjectEvents_059_40cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40cb
	dw MapEvents_052_521e

MapHeader_052_47b6:
	dbaw2 MapAttributes_057_6866
	; warp 7, 0, $2048, ObjectEvents_05a_4255, MapEvents_052_5273
	db 7, 0
	dw $2048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 0, 2, $5018, ObjectEvents_05a_4255, MapEvents_052_5273
	db 0, 2
	dw $5018
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 5, 7, $9048, ObjectEvents_05a_4255, MapEvents_052_5273
	db 5, 7
	dw $9048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 4, 0, $6058, ObjectEvents_05a_4255, MapEvents_052_5273
	db 4, 0
	dw $6058
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 2, 0, $6048, ObjectEvents_05a_4255, MapEvents_052_5273
	db 2, 0
	dw $6048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 0, 0, $6038, ObjectEvents_05a_4255, MapEvents_052_5273
	db 0, 0
	dw $6038
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 0, 5, $6028, ObjectEvents_05a_4255, MapEvents_052_5273
	db 0, 5
	dw $6028
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 0, 7, $8038, ObjectEvents_05a_4255, MapEvents_052_5273
	db 0, 7
	dw $8038
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 4, 7, $6048, ObjectEvents_05a_4255, MapEvents_052_5273
	db 4, 7
	dw $6048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 7, 7, $7068, ObjectEvents_05a_4255, MapEvents_052_5273
	db 7, 7
	dw $7068
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

	; warp 7, 1, $8068, ObjectEvents_05a_4255, MapEvents_052_5273
	db 7, 1
	dw $8068
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_5273

MapHeader_052_4840:
	dbaw2 MapAttributes_057_687a
	; warp 7, 0, $2048, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 7, 0
	dw $2048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 0, 2, $5018, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 0, 2
	dw $5018
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 5, 7, $9048, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 5, 7
	dw $9048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 4, 0, $6058, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 4, 0
	dw $6058
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 2, 0, $6048, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 2, 0
	dw $6048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 0, 0, $6038, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 0, 0
	dw $6038
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 0, 5, $6028, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 0, 5
	dw $6028
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 0, 7, $8038, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 0, 7
	dw $8038
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 4, 7, $6048, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 4, 7
	dw $6048
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 7, 7, $7068, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 7, 7
	dw $7068
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

	; warp 7, 1, $8068, ObjectEvents_05a_4255, MapEvents_052_52c2
	db 7, 1
	dw $8068
	db BANK(ObjectEvents_05a_4255)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4255
	dw MapEvents_052_52c2

MapHeader_052_48ca:
	dbaw2 MapAttributes_057_7298
	; warp 3, 0, $6088, ObjectEvents_05a_439b, MapEvents_052_5311
	db 3, 0
	dw $6088
	db BANK(ObjectEvents_05a_439b)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_439b
	dw MapEvents_052_5311

MapHeader_052_48dc:
	dbaw2 MapAttributes_057_72ac
	; warp 3, 0, $6088, ObjectEvents_059_443e, MapEvents_052_533c
	db 3, 0
	dw $6088
	db BANK(ObjectEvents_059_443e)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_443e
	dw MapEvents_052_533c

	; warp 0, 0, $5058, ObjectEvents_059_443e, MapEvents_052_533c
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_059_443e)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_443e
	dw MapEvents_052_533c

MapHeader_052_48fa:
	dbaw2 MapAttributes_057_7648
	; warp 0, 0, $2068, ObjectEvents_059_40ca, MapEvents_052_536d
	db 0, 0
	dw $2068
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_536d

	; warp 0, 19, $8018, ObjectEvents_059_40ca, MapEvents_052_536d
	db 0, 19
	dw $8018
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_536d

MapHeader_052_4918:
	dbaw2 MapAttributes_057_78c6
	; warp 3, 1, $6088, ObjectEvents_059_40ca, MapEvents_052_53b0
	db 3, 1
	dw $6088
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_53b0

	; warp 0, 0, $6048, ObjectEvents_059_40ca, MapEvents_052_53b0
	db 0, 0
	dw $6048
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_53b0

MapHeader_052_4936:
	dbaw2 CarpetWomansHouse2_MapAttributes
	; warp 0, 0, $8038, ObjectEvents_055_58cb, MapEvents_052_53c3
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_055_58cb)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_58cb
	dw MapEvents_052_53c3

MapHeader_052_4948:
	dbaw2 MapAttributes_001_4104
	; warp 0, 0, $8038, ObjectEvents_055_58e2, MapEvents_052_53d0
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_055_58e2)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_58e2
	dw MapEvents_052_53d0

MapHeader_052_495a:
	dbaw2 MapAttributes_001_412c
	; warp 0, 0, $8038, ObjectEvents_055_58f9, MapEvents_052_53dd
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_055_58f9)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_58f9
	dw MapEvents_052_53dd

MapHeader_052_496c:
	dbaw2 MapAttributes_001_40f0
	; warp 0, 0, $8038, ObjectEvents_055_5910, MapEvents_052_53ea
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_055_5910)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_5910
	dw MapEvents_052_53ea

MapHeader_052_497e:
	dbaw2 HayatosHouse2_MapAttributes
	; warp 0, 0, $8078, ObjectEvents_055_53f1, MapEvents_052_53f7
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_53f7

MapHeader_052_4990:
	dbaw2 TechHealingCenter_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_055_532c, MapEvents_052_5404
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_055_532c)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_532c
	dw MapEvents_052_5404

MapHeader_052_49a2:
	dbaw2 TechShop_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_055_530a, MapEvents_052_5417
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_055_530a)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_530a
	dw MapEvents_052_5417

MapHeader_052_49b4:
	dbaw2 MapAttributes_001_4140
	; warp 0, 0, $8058, ObjectEvents_055_591c, MapEvents_052_5424
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_055_591c)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_591c
	dw MapEvents_052_5424

MapHeader_052_49c6:
	dbaw2 MapAttributes_001_4118
	; warp 0, 0, $8058, ObjectEvents_058_45e9, MapEvents_052_5431
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_058_45e9)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_45e9
	dw MapEvents_052_5431

MapHeader_052_49d8:
	dbaw2 MapAttributes_001_4104
	; warp 0, 0, $8038, ObjectEvents_058_4608, MapEvents_052_543e
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_058_4608)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4608
	dw MapEvents_052_543e

MapHeader_052_49ea:
	dbaw2 MapAttributes_001_4154
	; warp 0, 0, $8038, ObjectEvents_058_4669, MapEvents_052_544b
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_058_4669)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4669
	dw MapEvents_052_544b

	; warp 0, 0, $8038, ObjectEvents_058_465d, MapEvents_052_544b
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_058_465d)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_465d
	dw MapEvents_052_544b

MapHeader_052_4a08:
	dbaw2 MapAttributes_001_412c
	; warp 0, 0, $8038, ObjectEvents_058_4627, MapEvents_052_5458
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_058_4627)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4627
	dw MapEvents_052_5458

MapHeader_052_4a1a:
	dbaw2 TechShop_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_058_4001, MapEvents_052_5465
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_058_4001)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4001
	dw MapEvents_052_5465

MapHeader_052_4a2c:
	dbaw2 TechHealingCenter_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_058_4023, MapEvents_052_5472
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_058_4023)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4023
	dw MapEvents_052_5472

MapHeader_052_4a3e:
	dbaw2 MapAttributes_011_6a66
	; warp 0, 0, $8078, ObjectEvents_059_4119, MapEvents_052_5485
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_059_4119)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4119
	dw MapEvents_052_5485

MapHeader_052_4a50:
	dbaw2 MapAttributes_011_6a7a
	; warp 0, 0, $8038, ObjectEvents_059_4125, MapEvents_052_5492
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_059_4125)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4125
	dw MapEvents_052_5492

MapHeader_052_4a62:
	dbaw2 MapAttributes_011_6a8e
	; warp 0, 0, $8038, ObjectEvents_059_413c, MapEvents_052_549f
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_059_413c)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_413c
	dw MapEvents_052_549f

MapHeader_052_4a74:
	dbaw2 MapAttributes_011_6aa2
	; warp 0, 0, $8078, ObjectEvents_059_4153, MapEvents_052_54ac
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_059_4153)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4153
	dw MapEvents_052_54ac

MapHeader_052_4a86:
	dbaw2 MapAttributes_011_6ab6
	; warp 0, 0, $8038, ObjectEvents_059_442e, MapEvents_052_54b9
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_059_442e)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_442e
	dw MapEvents_052_54b9

MapHeader_052_4a98:
	dbaw2 MapAttributes_001_4154
	; warp 0, 0, $8038, ObjectEvents_059_416a, MapEvents_052_54c6
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_059_416a)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_416a
	dw MapEvents_052_54c6

	; warp 1, 0, $5038, ObjectEvents_059_42be, MapEvents_052_54c6
	db 1, 0
	dw $5038
	db BANK(ObjectEvents_059_42be)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_42be
	dw MapEvents_052_54c6

	; warp 0, 0, $5058, ObjectEvents_059_416a, MapEvents_052_54c6
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_059_416a)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_416a
	dw MapEvents_052_54c6

MapHeader_052_4ac2:
	dbaw2 TechHealingCenter_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_059_4027, MapEvents_052_54d3
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_059_4027)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4027
	dw MapEvents_052_54d3

MapHeader_052_4ad4:
	dbaw2 TechShop_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_059_4005, MapEvents_052_54e6
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_059_4005)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_4005
	dw MapEvents_052_54e6

MapHeader_052_4ae6:
	dbaw2 MapAttributes_050_6ebf
	; warp 0, 0, $9058, ObjectEvents_055_53f1, MapEvents_052_54f3
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_54f3

	; warp 0, 0, $5058, ObjectEvents_055_53f1, MapEvents_052_54f3
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_54f3

MapHeader_052_4b04:
	dbaw2 MapAttributes_050_7132
	; warp 0, 0, $9048, ObjectEvents_055_53f1, MapEvents_052_5506
	db 0, 0
	dw $9048
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_5506

	; warp 1, 0, $6098, ObjectEvents_055_53f1, MapEvents_052_5506
	db 1, 0
	dw $6098
	db BANK(ObjectEvents_055_53f1)
	ds 3 ; 0 0 0
	dw ObjectEvents_055_53f1
	dw MapEvents_052_5506

MapHeader_052_4b22:
	dbaw2 MapAttributes_053_575b
	; warp 1, 0, $2048, ObjectEvents_05c_411d, MapEvents_052_550d
	db 1, 0
	dw $2048
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_550d

	; warp 1, 0, $9048, ObjectEvents_05c_411d, MapEvents_052_550d
	db 1, 0
	dw $9048
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_550d

	; warp 7, 0, $6048, ObjectEvents_05c_411d, MapEvents_052_550d
	db 7, 0
	dw $6048
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_550d

	; warp 4, 0, $7048, ObjectEvents_05c_411e, MapEvents_052_550d
	db 4, 0
	dw $7048
	db BANK(ObjectEvents_05c_411e)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411e
	dw MapEvents_052_550d

MapHeader_052_4b58:
	dbaw2 MapAttributes_053_5315
	; warp 5, 0, $2068, ObjectEvents_05c_415c, MapEvents_052_5520
	db 5, 0
	dw $2068
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 4, 1, $4048, ObjectEvents_05c_415c, MapEvents_052_5520
	db 4, 1
	dw $4048
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 2, 1, $4048, ObjectEvents_05c_415c, MapEvents_052_5520
	db 2, 1
	dw $4048
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 0, 0, $6028, ObjectEvents_05c_415c, MapEvents_052_5520
	db 0, 0
	dw $6028
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 0, 4, $6028, ObjectEvents_05c_415c, MapEvents_052_5520
	db 0, 4
	dw $6028
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 0, 7, $7038, ObjectEvents_05c_415c, MapEvents_052_5520
	db 0, 7
	dw $7038
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 7, 0, $6068, ObjectEvents_05c_415c, MapEvents_052_5520
	db 7, 0
	dw $6068
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 7, 3, $6068, ObjectEvents_05c_415c, MapEvents_052_5520
	db 7, 3
	dw $6068
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 7, 7, $7048, ObjectEvents_05c_415c, MapEvents_052_5520
	db 7, 7
	dw $7048
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 4, 7, $9058, ObjectEvents_05c_415c, MapEvents_052_5520
	db 4, 7
	dw $9058
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

	; warp 4, 4, $8048, ObjectEvents_05c_415c, MapEvents_052_5520
	db 4, 4
	dw $8048
	db BANK(ObjectEvents_05c_415c)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_415c
	dw MapEvents_052_5520

MapHeader_052_4be2:
	dbaw2 CarpetWomansHouse2_MapAttributes
	; warp 0, 0, $8038, ObjectEvents_05c_4254, MapEvents_052_555d
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05c_4254)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_4254
	dw MapEvents_052_555d

MapHeader_052_4bf4:
	dbaw2 MapAttributes_001_4104
	; warp 0, 0, $8038, ObjectEvents_05c_4289, MapEvents_052_556a
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05c_4289)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_4289
	dw MapEvents_052_556a

MapHeader_052_4c06:
	dbaw2 MapAttributes_001_412c
	; warp 0, 0, $8038, ObjectEvents_05c_42de, MapEvents_052_5577
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05c_42de)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_42de
	dw MapEvents_052_5577

MapHeader_052_4c18:
	dbaw2 MapAttributes_001_40f0
	; warp 0, 0, $8038, ObjectEvents_05c_42fd, MapEvents_052_5584
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05c_42fd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_42fd
	dw MapEvents_052_5584

MapHeader_052_4c2a:
	dbaw2 HayatosHouse2_MapAttributes
	; warp 0, 0, $8078, ObjectEvents_05c_411d, MapEvents_052_5591
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_5591

MapHeader_052_4c3c:
	dbaw2 TechHealingCenter_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_05c_4083, MapEvents_052_559e
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_05c_4083)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_4083
	dw MapEvents_052_559e

MapHeader_052_4c4e:
	dbaw2 TechShop_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_05c_4061, MapEvents_052_55b1
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_05c_4061)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_4061
	dw MapEvents_052_55b1

MapHeader_052_4c60:
	dbaw2 MapAttributes_001_4140
	; warp 0, 0, $8058, ObjectEvents_05c_430d, MapEvents_052_55be
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_05c_430d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_430d
	dw MapEvents_052_55be

	; warp 1, 0, $7068, ObjectEvents_05c_4494, MapEvents_052_55be
	db 1, 0
	dw $7068
	db BANK(ObjectEvents_05c_4494)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_4494
	dw MapEvents_052_55be

MapHeader_052_4c7e:
	dbaw2 MapAttributes_053_6c74
	; warp 0, 0, $9058, ObjectEvents_05c_41b1, MapEvents_052_55cb
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_05c_41b1)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_41b1
	dw MapEvents_052_55cb

	; warp 0, 0, $20b0, ObjectEvents_05c_41a5, MapEvents_052_55cb
	db 0, 0
	dw $20b0
	db BANK(ObjectEvents_05c_41a5)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_41a5
	dw MapEvents_052_55cb

	; warp 0, 0, $b0b0, ObjectEvents_05c_44ab, MapEvents_052_55cb
	db 0, 0
	dw $b0b0
	db BANK(ObjectEvents_05c_44ab)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_44ab
	dw MapEvents_052_55cb

MapHeader_052_4ca8:
	dbaw2 MapAttributes_053_6eec
	; warp 0, 7, $9048, ObjectEvents_058_4868, MapEvents_052_55d2
	db 0, 7
	dw $9048
	db BANK(ObjectEvents_058_4868)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4868
	dw MapEvents_052_55d2

	; warp 1, 0, $7038, ObjectEvents_058_487f, MapEvents_052_55d2
	db 1, 0
	dw $7038
	db BANK(ObjectEvents_058_487f)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_487f
	dw MapEvents_052_55d2

	; warp 1, 0, $7038, ObjectEvents_058_40ea, MapEvents_052_55d2
	db 1, 0
	dw $7038
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_55d2

MapHeader_052_4cd2:
	dbaw2 MapAttributes_057_4c29
	; warp 2, 0, $9068, ObjectEvents_058_40ea, MapEvents_052_55d9
	db 2, 0
	dw $9068
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_55d9

	; warp 0, 0, $5038, ObjectEvents_058_40ea, MapEvents_052_55d9
	db 0, 0
	dw $5038
	db BANK(ObjectEvents_058_40ea)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_40ea
	dw MapEvents_052_55d9

MapHeader_052_4cf0:
	dbaw2 MapAttributes_057_4e74
	; warp 0, 0, $6038, ObjectEvents_058_4a45, MapEvents_052_55f2
	db 0, 0
	dw $6038
	db BANK(ObjectEvents_058_4a45)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4a45
	dw MapEvents_052_55f2

	; warp 5, 0, $6068, ObjectEvents_058_4a45, MapEvents_052_55f2
	db 5, 0
	dw $6068
	db BANK(ObjectEvents_058_4a45)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_4a45
	dw MapEvents_052_55f2

MapHeader_052_4d0e:
	dbaw2 MapAttributes_057_4e88
	; warp 5, 0, $6068, ObjectEvents_058_41ee, MapEvents_052_560b
	db 5, 0
	dw $6068
	db BANK(ObjectEvents_058_41ee)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_41ee
	dw MapEvents_052_560b

	; warp 1, 0, $8068, ObjectEvents_058_44e2, MapEvents_052_560b
	db 1, 0
	dw $8068
	db BANK(ObjectEvents_058_44e2)
	ds 3 ; 0 0 0
	dw ObjectEvents_058_44e2
	dw MapEvents_052_560b

MapHeader_052_4d2c:
	dbaw2 MapAttributes_057_7b2f
	; warp 0, 0, $20b0, ObjectEvents_059_40ca, MapEvents_052_561e
	db 0, 0
	dw $20b0
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_561e

	; warp 0, 0, $20b0, ObjectEvents_05a_40bd, MapEvents_052_561e
	db 0, 0
	dw $20b0
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_561e

MapHeader_052_4d4a:
	dbaw2 MapAttributes_057_7cbb
	; warp 0, 0, $6068, ObjectEvents_059_40ca, MapEvents_052_561e
	db 0, 0
	dw $6068
	db BANK(ObjectEvents_059_40ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_40ca
	dw MapEvents_052_561e

MapHeader_052_4d5c:
	dbaw2 MapAttributes_057_7298
	; warp 3, 0, $6088, ObjectEvents_059_443e, MapEvents_052_561f
	db 3, 0
	dw $6088
	db BANK(ObjectEvents_059_443e)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_443e
	dw MapEvents_052_561f

	; warp 0, 0, $5058, ObjectEvents_059_443e, MapEvents_052_561f
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_059_443e)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_443e
	dw MapEvents_052_561f

	; warp 0, 0, $7048, ObjectEvents_059_443e, MapEvents_052_561f
	db 0, 0
	dw $7048
	db BANK(ObjectEvents_059_443e)
	ds 3 ; 0 0 0
	dw ObjectEvents_059_443e
	dw MapEvents_052_561f

MapHeader_052_4d86:
	dbaw2 MapAttributes_011_6a66
	; warp 0, 0, $8078, ObjectEvents_05a_42d3, MapEvents_052_5656
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_05a_42d3)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_42d3
	dw MapEvents_052_5656

MapHeader_052_4d98:
	dbaw2 MapAttributes_011_6a7a
	; warp 0, 0, $8038, ObjectEvents_05a_42fe, MapEvents_052_5663
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05a_42fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_42fe
	dw MapEvents_052_5663

MapHeader_052_4daa:
	dbaw2 MapAttributes_011_6a8e
	; warp 0, 0, $8038, ObjectEvents_05a_4341, MapEvents_052_5670
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05a_4341)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4341
	dw MapEvents_052_5670

MapHeader_052_4dbc:
	dbaw2 MapAttributes_011_6aa2
	; warp 0, 0, $8078, ObjectEvents_05a_4369, MapEvents_052_567d
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_05a_4369)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4369
	dw MapEvents_052_567d

MapHeader_052_4dce:
	dbaw2 MapAttributes_011_6ab6
	; warp 0, 0, $8038, ObjectEvents_05a_40bd, MapEvents_052_568a
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_568a

MapHeader_052_4de0:
	dbaw2 MapAttributes_001_4154
	; warp 0, 0, $8038, ObjectEvents_05a_41bd, MapEvents_052_5697
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_05a_41bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_41bd
	dw MapEvents_052_5697

	; warp 1, 0, $4068, ObjectEvents_05a_41bd, MapEvents_052_5697
	db 1, 0
	dw $4068
	db BANK(ObjectEvents_05a_41bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_41bd
	dw MapEvents_052_5697

MapHeader_052_4dfe:
	dbaw2 TechHealingCenter_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_05a_4023, MapEvents_052_56a4
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_05a_4023)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4023
	dw MapEvents_052_56a4

MapHeader_052_4e10:
	dbaw2 TechShop_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_05a_4001, MapEvents_052_56b7
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_05a_4001)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_4001
	dw MapEvents_052_56b7

MapHeader_052_4e22:
	dbaw2 MapAttributes_057_7648
	; warp 0, 0, $2068, ObjectEvents_05a_40bd, MapEvents_052_56c4
	db 0, 0
	dw $2068
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_56c4

	; warp 0, 19, $8018, ObjectEvents_05a_40bd, MapEvents_052_56c4
	db 0, 19
	dw $8018
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_56c4

MapHeader_052_4e40:
	dbaw2 MapAttributes_057_78c6
	; warp 3, 1, $6088, ObjectEvents_05a_40bd, MapEvents_052_5707
	db 3, 1
	dw $6088
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5707

	; warp 0, 0, $6048, ObjectEvents_05a_40bd, MapEvents_052_5707
	db 0, 0
	dw $6048
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5707

MapHeader_052_4e5e:
	dbaw2 MapAttributes_057_5f06
	; warp 0, 7, $9058, ObjectEvents_05a_40bd, MapEvents_052_571a
	db 0, 7
	dw $9058
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_571a

	; warp 0, 0, $8028, ObjectEvents_05a_40bd, MapEvents_052_571a
	db 0, 0
	dw $8028
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_571a

	; warp 7, 0, $4078, ObjectEvents_05a_40bd, MapEvents_052_571a
	db 7, 0
	dw $4078
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_571a

	; warp 0, 3, $6038, ObjectEvents_05a_40bd, MapEvents_052_571a
	db 0, 3
	dw $6038
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_571a

MapHeader_052_4e94:
	dbaw2 MapAttributes_057_5f1a
	; warp 0, 0, $3028, ObjectEvents_05a_40bd, MapEvents_052_5733
	db 0, 0
	dw $3028
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5733

	; warp 6, 7, $8048, ObjectEvents_05a_40bd, MapEvents_052_5733
	db 6, 7
	dw $8048
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5733

MapHeader_052_4eb2:
	dbaw2 MapAttributes_057_5f2e
	; warp 0, 2, $6068, ObjectEvents_05a_40bd, MapEvents_052_5740
	db 0, 2
	dw $6068
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5740

	; warp 0, 7, $9078, ObjectEvents_05a_40bd, MapEvents_052_5740
	db 0, 7
	dw $9078
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5740

	; warp 5, 7, $9048, ObjectEvents_05a_40bd, MapEvents_052_5740
	db 5, 7
	dw $9048
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5740

	; warp 4, 4, $5048, ObjectEvents_05a_40bd, MapEvents_052_5740
	db 4, 4
	dw $5048
	db BANK(ObjectEvents_05a_40bd)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_40bd
	dw MapEvents_052_5740

MapHeader_052_4ee8:
	dbaw2 MapAttributes_057_5f42
	; warp 0, 7, $9068, ObjectEvents_05a_44d9, MapEvents_052_5759
	db 0, 7
	dw $9068
	db BANK(ObjectEvents_05a_44d9)
	ds 3 ; 0 0 0
	dw ObjectEvents_05a_44d9
	dw MapEvents_052_5759

MapHeader_052_4efa:
	dbaw2 MapAttributes_050_6ebf
	; warp 0, 0, $9058, ObjectEvents_05c_411d, MapEvents_052_5760
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_5760

	; warp 0, 0, $5058, ObjectEvents_05c_411d, MapEvents_052_5760
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_05c_411d)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_411d
	dw MapEvents_052_5760

MapHeader_052_4f18:
	dbaw2 MapAttributes_050_7132
	; warp 0, 0, $9048, ObjectEvents_05c_4019, MapEvents_052_5773
	db 0, 0
	dw $9048
	db BANK(ObjectEvents_05c_4019)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_4019
	dw MapEvents_052_5773

	; warp 1, 0, $6098, ObjectEvents_05c_4019, MapEvents_052_5773
	db 1, 0
	dw $6098
	db BANK(ObjectEvents_05c_4019)
	ds 3 ; 0 0 0
	dw ObjectEvents_05c_4019
	dw MapEvents_052_5773

MapEvents_052_4f36:
	warp_event  3, 20, $0f, $01, $00
	warp_event  1, 12, $02, $02, $00
	warp_event  9,  5, $02, $00, $00
	warp_event  9, 11, $02, $01, $00
	warp_event 16, 11, $02, $05, $00
	warp_event 19, 16, $02, $06, $00
	events_end

MapEvents_052_4f5b:
	warp_event  9,  5, $01, $02, $00
	warp_event  9, 11, $01, $03, $00
	warp_event  2, 12, $01, $01, $00
	warp_event  2, 22, $03, $01, $00
	warp_event 22, 10, $03, $02, $00
	warp_event 16, 11, $01, $04, $00
	warp_event 19, 16, $01, $05, $00
	warp_event 21, 21, $03, $03, $00
	events_end

MapEvents_052_4f8c:
	warp_event 11,  1, $04, $01, $00
	warp_event  2, 18, $02, $03, $00
	warp_event 17, 10, $02, $04, $00
	warp_event 17, 16, $02, $07, $00
	events_end

MapEvents_052_4fa5:
	script_event ABSOLUTE,  0,  0, Script_055_5721 ; XXX: Resolve script bank
	warp_event 11,  1, $03, $00, $00
	events_end

MapEvents_052_4fb2:
	warp_event ABSOLUTE,  9, $04, $00, $00
	events_end

MapEvents_052_4fb9:
	script_event ABSOLUTE, 19,  0, $4004 ; XXX: Resolve script bank
	warp_event 14, 10, $07, $00, $00
	events_end

MapEvents_052_4fc6:
	warp_event 14, 10, $06, $01, $00
	warp_event 18,  2, $08, $00, $00
	events_end

MapEvents_052_4fd3:
	warp_event 18,  2, $07, $01, $00
	warp_event 14, 10, $09, $00, $00
	events_end

MapEvents_052_4fe0:
	warp_event 14, 10, $08, $01, $00
	script_event  8, 10,  0, $434b ; XXX: Resolve script bank
	events_end

MapEvents_052_4fed:
	warp_event  6,  8, $09, $01, $00
	events_end

MapEvents_052_4ff4:
	warp_event ABSOLUTE,  0, $42, $00, $00
	warp_event 12,  4, $2d, $00, $00
	warp_event  8,  4, $31, $00, $00
	warp_event  2,  4, $2c, $00, $00
	warp_event  2, 12, $2f, $00, $00
	warp_event  3, 19, $30, $00, $00
	warp_event 20,  4, $2e, $00, $00
	warp_event 20, 10, $32, $00, $00
	warp_event 18, 19, $33, $00, $00
	script_event ABSOLUTE, 23,  0, $545a ; XXX: Resolve script bank
	events_end

MapEvents_052_5031:
	warp_event ABSOLUTE,  0, $0b, $09, $00
	script_event 18,  4,  0, $5468 ; XXX: Resolve script bank
	events_end

MapEvents_052_503e:
	script_event ABSOLUTE,  0,  0, $5658 ; XXX: Resolve script bank
	warp_event  6,  7, $11, $00, $00
	warp_event  3, 16, $12, $00, $00
	warp_event 13, 14, $13, $00, $00
	signpost_event 12,  3, $07
	events_end

MapEvents_052_505d:
	warp_event ABSOLUTE,  0, $0f, $00, $00
	warp_event ABSOLUTE, 19, $0d, $00, $00
	signpost_event  4,  4, $08
	events_end

MapEvents_052_5070:
	warp_event ABSOLUTE,  9, $0e, $00, $00
	warp_event  9,  2, $01, $00, $00
	events_end

MapEvents_052_507d:
	warp_event ABSOLUTE,  0, $44, $01, $00
	script_event  0, 13,  0, $405c ; XXX: Resolve script bank
	script_event  0, 14,  0, $405c ; XXX: Resolve script bank
	events_end

MapEvents_052_5090:
	warp_event ABSOLUTE,  8, $0d, $01, $00
	event_07  7,  2, $11
	events_end

MapEvents_052_509d:
	warp_event ABSOLUTE,  8, $0d, $02, $00
	event_07  2,  2, $12
	events_end

MapEvents_052_50aa:
	warp_event ABSOLUTE,  8, $0d, $03, $00
	event_04  4,  4,  0, $5862 ; XXX: Resolve script bank
	event_04  7,  4,  0, $5890 ; XXX: Resolve script bank
	events_end

MapEvents_052_50bd:
	warp_event 14,  5, $35, $00, $00
	warp_event  3,  5, $34, $00, $00
	script_event  2, 12,  0, $4701 ; XXX: Resolve script bank
	warp_event  0, ABSOLUTE, $1e, $02, $00
	warp_event  7, 19, $38, $00, $00
	warp_event ABSOLUTE, 23, $1f, $00, $00
	warp_event 15, 19, $37, $00, $00
	warp_event 11, 12, $39, $00, $00
	script_event 19, ABSOLUTE,  0, $40df ; XXX: Resolve script bank
	events_end

MapEvents_052_50f4:
	script_event 14, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event 15, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event 16, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event  0,  6,  0, $470f ; XXX: Resolve script bank
	warp_event  7, 17, $4f, $00, $00
	signpost_event 13, 28, $09
	events_end

MapEvents_052_5119:
	warp_event 29,  3, $15, $01, $00
	events_end

MapEvents_052_5120:
	script_event ABSOLUTE,  9,  0, $40eb ; XXX: Resolve script bank
	warp_event  3,  4, $18, $00, $00
	event_07 14,  4, $13
	event_07  3,  5, $14
	events_end

MapEvents_052_5139:
	warp_event  3,  5, $17, $01, $00
	warp_event 16,  5, $19, $00, $00
	event_07 15,  4, $15
	event_07  3,  4, $16
	events_end

MapEvents_052_5152:
	warp_event 16,  5, $18, $01, $00
	event_07  4,  4, $17
	event_07 12,  4, $18
	events_end

MapEvents_052_5165:
	warp_event  3, 19, $29, $01, $00
	warp_event  4, 19, $29, $01, $00
	warp_event  5, 19, $29, $01, $00
	warp_event 15, 19, $1b, $00, $00
	warp_event 16, 19, $1b, $00, $00
	events_end

MapEvents_052_5184:
	warp_event ABSOLUTE,  0, $1a, $01, $00
	warp_event 19, ABSOLUTE, $1c, $00, $00
	events_end

MapEvents_052_5191:
	warp_event  0, ABSOLUTE, $1b, $01, $00
	warp_event ABSOLUTE, 19, $1d, $00, $00
	events_end

MapEvents_052_519e:
	warp_event ABSOLUTE,  0, $1c, $01, $00
	events_end

MapEvents_052_51a5:
	warp_event ABSOLUTE,  0, $15, $00, $00
	script_event ABSOLUTE, 11,  0, $40e4 ; XXX: Resolve script bank
	warp_event 23, ABSOLUTE, $14, $03, $00
	signpost_event  1,  3, $0a
	signpost_event  4, 10, $0b
	events_end

MapEvents_052_51c4:
	warp_event ABSOLUTE,  0, $14, $05, $00
	script_event ABSOLUTE,  9,  0, $40ed ; XXX: Resolve script bank
	events_end

MapEvents_052_51d1:
	warp_event ABSOLUTE,  0, $1f, $01, $00
	events_end

MapEvents_052_51d8:
	warp_event ABSOLUTE, 23, $2b, $01, $00
	warp_event  2,  7, $21, $03, $00
	warp_event 21,  3, $22, $00, $00
	warp_event  3, 11, $21, $01, $00
	events_end

MapEvents_052_51f1:
	warp_event  2,  2, $21, $02, $00
	warp_event 16, 21, $23, $02, $00
	events_end

MapEvents_052_51fe:
	warp_event  6,  9, $24, $00, $00
	warp_event  7, 22, $23, $03, $00
	warp_event 14, 22, $22, $01, $00
	warp_event 12, 12, $23, $01, $00
	events_end

MapEvents_052_5217:
	warp_event  6, 22, $23, $00, $00
	events_end

MapEvents_052_521e:
	script_event ABSOLUTE,  0,  0, $40c0 ; XXX: Resolve script bank
	script_event  0, ABSOLUTE,  0, $4811 ; XXX: Resolve script bank
	warp_event ABSOLUTE, 23, $2a, $00, $00
	warp_event 13,  4, $40, $00, $00
	warp_event  8,  4, $3b, $00, $00
	warp_event  3,  4, $3a, $00, $00
	script_event  2, 14,  0, $41e6 ; XXX: Resolve script bank
	warp_event  3, 20, $41, $00, $00
	warp_event 12, 18, $3d, $00, $00
	warp_event 20, 19, $3e, $00, $00
	warp_event 20,  8, $3c, $00, $00
	signpost_event 17,  3, $01
	signpost_event  2,  8, $02
	signpost_event 13, 22, $03
	events_end

MapEvents_052_5273:
	warp_event  0, ABSOLUTE, $28, $00, $00
	warp_event ABSOLUTE, 23, $5e, $00, $00
	warp_event 13,  4, $5c, $00, $00
	warp_event  8,  4, $57, $00, $00
	warp_event  3,  4, $56, $00, $00
	warp_event  2, 14, $5b, $00, $00
	warp_event  3, 20, $5d, $00, $00
	warp_event 12, 18, $59, $00, $00
	warp_event 20, 19, $5a, $00, $00
	warp_event 20,  8, $58, $00, $00
	signpost_event 17,  3, $01
	signpost_event  2,  8, $02
	signpost_event 13, 22, $03
	events_end

MapEvents_052_52c2:
	warp_event  0, ABSOLUTE, $28, $00, $00
	warp_event ABSOLUTE, 23, $5e, $00, $00
	warp_event 13,  4, $5c, $00, $00
	warp_event  8,  4, $57, $00, $00
	warp_event  3,  4, $56, $00, $00
	warp_event  2, 14, $5b, $00, $00
	warp_event  3, 20, $5d, $00, $00
	warp_event 12, 18, $59, $00, $00
	warp_event 20, 19, $5a, $00, $00
	warp_event 20,  8, $58, $00, $00
	signpost_event 17,  3, $01
	signpost_event  2,  8, $02
	signpost_event 13, 22, $03
	events_end

MapEvents_052_5311:
	script_event 15, ABSOLUTE,  0, $44bf ; XXX: Resolve script bank
	event_04  4,  5,  0, $448c ; XXX: Resolve script bank
	event_04  4,  6,  0, $448c ; XXX: Resolve script bank
	event_04  2,  7,  0, $4492 ; XXX: Resolve script bank
	event_04  3,  7,  0, $448c ; XXX: Resolve script bank
	event_04  2,  8,  0, $448c ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

MapEvents_052_533c:
	warp_event 15, ABSOLUTE, $25, $01, $00
	event_04  5,  4,  0, $44e4 ; XXX: Resolve script bank
	event_04  4,  5,  0, $481f ; XXX: Resolve script bank
	event_04  4,  6,  0, $481f ; XXX: Resolve script bank
	event_04  2,  7,  0, $482c ; XXX: Resolve script bank
	event_04  3,  7,  0, $481f ; XXX: Resolve script bank
	event_04  2,  8,  0, $481f ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

MapEvents_052_536d:
	warp_event ABSOLUTE,  0, $25, $02, $00
	warp_event  0, ABSOLUTE, $2b, $00, $00
	event_04  8, 14,  0, $4466 ; XXX: Resolve script bank
	event_04  8, 15,  0, $4466 ; XXX: Resolve script bank
	event_04  6, 14,  0, $448d ; XXX: Resolve script bank
	event_04  6, 15,  0, $448d ; XXX: Resolve script bank
	event_04  7, 27,  0, $4466 ; XXX: Resolve script bank
	event_04  7, 28,  0, $4466 ; XXX: Resolve script bank
	event_04  5, 27,  0, $448d ; XXX: Resolve script bank
	event_04  5, 28,  0, $448d ; XXX: Resolve script bank
	signpost_event  5,  4, $05
	events_end

MapEvents_052_53b0:
	warp_event 15, ABSOLUTE, $2a, $01, $00
	warp_event  4,  4, $21, $00, $00
	signpost_event  6,  6, $06
	events_end

MapEvents_052_53c3:
	warp_event ABSOLUTE,  8, $0b, $03, $00
	event_07  9,  3, $02
	events_end

MapEvents_052_53d0:
	warp_event ABSOLUTE,  8, $0b, $01, $00
	event_07  4,  3, $09
	events_end

MapEvents_052_53dd:
	warp_event ABSOLUTE,  8, $0b, $06, $00
	event_07  9,  6, $0a
	events_end

MapEvents_052_53ea:
	warp_event ABSOLUTE,  8, $0b, $04, $00
	event_07  4,  3, $08
	events_end

MapEvents_052_53f7:
	warp_event ABSOLUTE,  8, $0b, $05, $00
	event_07  8,  3, $01
	events_end

MapEvents_052_5404:
	warp_event ABSOLUTE,  8, $0b, $02, $00
	event_04  4,  4,  0, $534b ; XXX: Resolve script bank
	event_04  8,  4,  0, $5359 ; XXX: Resolve script bank
	events_end

MapEvents_052_5417:
	warp_event ABSOLUTE,  8, $0b, $07, $00
	event_04  4,  3,  0, $531a ; XXX: Resolve script bank
	events_end

MapEvents_052_5424:
	warp_event ABSOLUTE,  8, $0b, $08, $00
	event_07  2,  3, $0b
	events_end

MapEvents_052_5431:
	warp_event ABSOLUTE,  8, $14, $01, $00
	event_07  6,  3, $0e
	events_end

MapEvents_052_543e:
	warp_event ABSOLUTE,  8, $14, $00, $00
	event_07  3,  3, $0d
	events_end

MapEvents_052_544b:
	warp_event ABSOLUTE,  8, $14, $02, $00
	event_07  4,  3, $10
	events_end

MapEvents_052_5458:
	warp_event ABSOLUTE,  8, $14, $06, $00
	event_07  9,  6, $0f
	events_end

MapEvents_052_5465:
	warp_event ABSOLUTE,  8, $14, $04, $00
	event_04  4,  3,  0, $4011 ; XXX: Resolve script bank
	events_end

MapEvents_052_5472:
	warp_event ABSOLUTE,  8, $14, $07, $00
	event_04  4,  4,  0, $4042 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4050 ; XXX: Resolve script bank
	events_end

MapEvents_052_5485:
	warp_event ABSOLUTE,  8, $25, $05, $00
	event_07  9,  3, $03
	events_end

MapEvents_052_5492:
	warp_event ABSOLUTE,  8, $25, $04, $00
	event_07  8,  3, $04
	events_end

MapEvents_052_549f:
	warp_event ABSOLUTE,  8, $25, $0a, $00
	event_07  1,  3, $05
	events_end

MapEvents_052_54ac:
	warp_event ABSOLUTE,  8, $25, $08, $00
	event_07  2,  3, $06
	events_end

MapEvents_052_54b9:
	warp_event ABSOLUTE,  8, $25, $09, $00
	event_07  4,  3, $07
	events_end

MapEvents_052_54c6:
	warp_event ABSOLUTE,  8, $25, $06, $00
	event_07  2,  3, $0c
	events_end

MapEvents_052_54d3:
	warp_event ABSOLUTE,  8, $25, $03, $00
	event_04  4,  4,  0, $4046 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4054 ; XXX: Resolve script bank
	events_end

MapEvents_052_54e6:
	warp_event ABSOLUTE,  8, $25, $07, $00
	event_04  4,  3,  0, $4015 ; XXX: Resolve script bank
	events_end

MapEvents_052_54f3:
	warp_event ABSOLUTE,  9, $0b, $00, $00
	warp_event  5,  3, $43, $00, $00
	warp_event  6,  3, $43, $00, $00
	events_end

MapEvents_052_5506:
	warp_event ABSOLUTE,  9, $42, $01, $00
	events_end

MapEvents_052_550d:
	warp_event ABSOLUTE,  0, $45, $09, $00
	warp_event ABSOLUTE,  9, $10, $00, $00
	warp_event 18,  4, $06, $00, $00
	events_end

MapEvents_052_5520:
	warp_event ABSOLUTE,  0, $64, $00, $00
	warp_event 12,  4, $47, $00, $00
	warp_event  8,  4, $4b, $00, $00
	warp_event  2,  4, $46, $00, $00
	warp_event  2, 12, $49, $00, $00
	warp_event  3, 19, $4a, $00, $00
	warp_event 20,  4, $48, $00, $00
	warp_event 20, 10, $4c, $00, $00
	warp_event 18, 19, $4d, $00, $00
	warp_event ABSOLUTE, 23, $44, $00, $00
	events_end

MapEvents_052_555d:
	warp_event ABSOLUTE,  8, $45, $03, $00
	event_07  9,  3, $02
	events_end

MapEvents_052_556a:
	warp_event ABSOLUTE,  8, $45, $01, $00
	event_07  4,  3, $09
	events_end

MapEvents_052_5577:
	warp_event ABSOLUTE,  8, $45, $06, $00
	event_07  9,  6, $0a
	events_end

MapEvents_052_5584:
	warp_event ABSOLUTE,  8, $45, $04, $00
	event_07  4,  3, $08
	events_end

MapEvents_052_5591:
	warp_event ABSOLUTE,  8, $45, $05, $00
	event_07  8,  3, $01
	events_end

MapEvents_052_559e:
	warp_event ABSOLUTE,  8, $45, $02, $00
	event_04  4,  4,  0, $40a2 ; XXX: Resolve script bank
	event_04  8,  4,  0, $40b0 ; XXX: Resolve script bank
	events_end

MapEvents_052_55b1:
	warp_event ABSOLUTE,  8, $45, $07, $00
	event_04  4,  3,  0, $4071 ; XXX: Resolve script bank
	events_end

MapEvents_052_55be:
	warp_event ABSOLUTE,  8, $45, $08, $00
	event_07  2,  3, $0b
	events_end

MapEvents_052_55cb:
	warp_event ABSOLUTE,  9, $45, $0a, $00
	events_end

MapEvents_052_55d2:
	warp_event ABSOLUTE, 23, $15, $02, $00
	events_end

MapEvents_052_55d9:
	script_event ABSOLUTE,  9,  0, $40eb ; XXX: Resolve script bank
	warp_event  3,  4, $51, $00, $00
	event_07 14,  4, $13
	event_07  3,  5, $14
	events_end

MapEvents_052_55f2:
	warp_event  3,  5, $50, $01, $00
	warp_event 16,  5, $52, $00, $00
	event_07 15,  4, $15
	event_07  3,  4, $16
	events_end

MapEvents_052_560b:
	warp_event 16,  5, $51, $01, $00
	event_07  4,  4, $17
	event_07 12,  4, $18
	events_end

MapEvents_052_561e:
	events_end

MapEvents_052_561f:
	warp_event 15, ABSOLUTE, $25, $01, $00
	script_event 14,  5, 25, $48aa ; XXX: Resolve script bank
	script_event 14,  6, 25, $48b1 ; XXX: Resolve script bank
	event_04  4,  5,  0, $486f ; XXX: Resolve script bank
	event_04  4,  6,  0, $486f ; XXX: Resolve script bank
	event_04  2,  7,  0, $487b ; XXX: Resolve script bank
	event_04  3,  7,  0, $486f ; XXX: Resolve script bank
	event_04  2,  8,  0, $486f ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

MapEvents_052_5656:
	script_event ABSOLUTE,  8,  0, $40fa ; XXX: Resolve script bank
	event_07  9,  3, $03
	events_end

MapEvents_052_5663:
	script_event ABSOLUTE,  8,  0, $4108 ; XXX: Resolve script bank
	event_07  8,  3, $04
	events_end

MapEvents_052_5670:
	script_event ABSOLUTE,  8,  0, $4116 ; XXX: Resolve script bank
	event_07  1,  3, $05
	events_end

MapEvents_052_567d:
	script_event ABSOLUTE,  8,  0, $4124 ; XXX: Resolve script bank
	event_07  2,  3, $06
	events_end

MapEvents_052_568a:
	script_event ABSOLUTE,  8,  0, $4132 ; XXX: Resolve script bank
	event_07  4,  3, $07
	events_end

MapEvents_052_5697:
	script_event ABSOLUTE,  8,  0, $40d0 ; XXX: Resolve script bank
	event_07  2,  3, $0c
	events_end

MapEvents_052_56a4:
	script_event ABSOLUTE,  8,  0, $4140 ; XXX: Resolve script bank
	event_04  4,  4,  0, $4042 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4050 ; XXX: Resolve script bank
	events_end

MapEvents_052_56b7:
	script_event ABSOLUTE,  8,  0, $414e ; XXX: Resolve script bank
	event_04  4,  3,  0, $4011 ; XXX: Resolve script bank
	events_end

MapEvents_052_56c4:
	script_event ABSOLUTE,  0,  0, $40be ; XXX: Resolve script bank
	warp_event  0, ABSOLUTE, $5f, $00, $00
	event_04  8, 14,  0, $415c ; XXX: Resolve script bank
	event_04  8, 15,  0, $415c ; XXX: Resolve script bank
	event_04  6, 14,  0, $4183 ; XXX: Resolve script bank
	event_04  6, 15,  0, $4183 ; XXX: Resolve script bank
	event_04  7, 27,  0, $415c ; XXX: Resolve script bank
	event_04  7, 28,  0, $415c ; XXX: Resolve script bank
	event_04  5, 27,  0, $4183 ; XXX: Resolve script bank
	event_04  5, 28,  0, $4183 ; XXX: Resolve script bank
	signpost_event  5,  4, $05
	events_end

MapEvents_052_5707:
	warp_event 15, ABSOLUTE, $5e, $01, $00
	warp_event  4,  4, $60, $00, $00
	signpost_event  6,  6, $06
	events_end

MapEvents_052_571a:
	warp_event ABSOLUTE, 23, $5f, $01, $00
	warp_event  2,  7, $60, $03, $00
	warp_event 21,  3, $61, $00, $00
	warp_event  3, 11, $60, $01, $00
	events_end

MapEvents_052_5733:
	warp_event  2,  2, $60, $02, $00
	warp_event 16, 21, $62, $02, $00
	events_end

MapEvents_052_5740:
	warp_event  6,  9, $63, $00, $00
	warp_event  7, 22, $62, $03, $00
	warp_event 14, 22, $61, $01, $00
	warp_event 12, 12, $62, $01, $00
	events_end

MapEvents_052_5759:
	warp_event  6, 22, $62, $00, $00
	events_end

MapEvents_052_5760:
	warp_event ABSOLUTE,  9, $45, $00, $00
	warp_event  5,  3, $65, $00, $00
	warp_event  6,  3, $65, $00, $00
	events_end

MapEvents_052_5773:
	warp_event ABSOLUTE,  9, $64, $01, $00
	events_end

unk_052_577a:
    dr $14977a, $149780

