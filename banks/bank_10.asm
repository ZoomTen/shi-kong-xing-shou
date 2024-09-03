Group02_Maps::
; Also used for group 08
	dw unk_010_4048
	dw unk_010_4048
	dw unk_010_40de
	dw unk_010_415c
	dw unk_010_417a
	dw unk_010_4198
	dw unk_010_41b6
	dw unk_010_41d4
	dw unk_010_41f2
	dw unk_010_4210
	dw unk_010_423a
	dw unk_010_4264
	dw unk_010_428e
	dw unk_010_42ac
	dw unk_010_42ca
	dw unk_010_4330
	dw unk_010_434e
	dw unk_010_436c
	dw unk_010_4396
	dw unk_010_43a8
	dw unk_010_43ba
	dw unk_010_43cc
	dw unk_010_43de
	dw unk_010_4414
	dw unk_010_4432
	dw unk_010_446e
	dw unk_010_445c
	dw unk_010_4480
	dw unk_010_4492
	dw unk_010_44a4
	dw unk_010_44b6
	dw unk_010_44c8
	dw unk_010_44da
	dw unk_010_44ec
	dw unk_010_44fe
	dw unk_010_4510

unk_010_4048:
	dbaw2 MapAttributes_011_4000
	; warp 13, 5, $4088, ObjectEvents_012_41fe, MapEvents_010_4522
	db 13, 5
	dw $4088
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 4, 7, $9038, ObjectEvents_012_41fe, MapEvents_010_4522
	db 4, 7
	dw $9038
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 0, 1, $8018, ObjectEvents_012_41fe, MapEvents_010_4522
	db 0, 1
	dw $8018
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 0, 4, $8038, ObjectEvents_012_41fe, MapEvents_010_4522
	db 0, 4
	dw $8038
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 0, 7, $7048, ObjectEvents_012_41fe, MapEvents_010_4522
	db 0, 7
	dw $7048
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 11, 0, $7058, ObjectEvents_012_41fe, MapEvents_010_4522
	db 11, 0
	dw $7058
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 13, 0, $7058, ObjectEvents_012_41fe, MapEvents_010_4522
	db 13, 0
	dw $7058
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 11, 7, $7048, ObjectEvents_012_41fe, MapEvents_010_4522
	db 11, 7
	dw $7048
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 13, 7, $7058, ObjectEvents_012_41fe, MapEvents_010_4522
	db 13, 7
	dw $7058
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 0, 0, $8048, ObjectEvents_012_41fe, MapEvents_010_4522
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 7, 7, $7058, ObjectEvents_012_41fe, MapEvents_010_4522
	db 7, 7
	dw $7058
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

	; warp 6, 1, $7048, ObjectEvents_012_41fe, MapEvents_010_4522
	db 6, 1
	dw $7048
	db BANK(ObjectEvents_012_41fe)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41fe
	dw MapEvents_010_4522

unk_010_40de:
	dbaw2 MapAttributes_011_46b9
	; warp 5, 0, $2048, ObjectEvents_012_42d6, MapEvents_010_457d
	db 5, 0
	dw $2048
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 0, 6, $5018, ObjectEvents_012_42d6, MapEvents_010_457d
	db 0, 6
	dw $5018
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 0, 0, $7048, ObjectEvents_012_42d6, MapEvents_010_457d
	db 0, 0
	dw $7048
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 2, 0, $7048, ObjectEvents_012_42d6, MapEvents_010_457d
	db 2, 0
	dw $7048
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 7, 0, $7048, ObjectEvents_012_42d6, MapEvents_010_457d
	db 7, 0
	dw $7048
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 0, 4, $7058, ObjectEvents_012_42d6, MapEvents_010_457d
	db 0, 4
	dw $7058
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 4, 5, $6048, ObjectEvents_012_42d6, MapEvents_010_457d
	db 4, 5
	dw $6048
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 1, 10, $7048, ObjectEvents_012_42d6, MapEvents_010_457d
	db 1, 10
	dw $7048
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 7, 8, $6048, ObjectEvents_012_42d6, MapEvents_010_457d
	db 7, 8
	dw $6048
	db BANK(ObjectEvents_012_42d6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42d6
	dw MapEvents_010_457d

	; warp 6, 6, $a0a0, ObjectEvents_012_4b0c, MapEvents_010_457d
	db 6, 6
	dw $a0a0
	db BANK(ObjectEvents_012_4b0c)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4b0c
	dw MapEvents_010_457d

unk_010_415c:
	dbaw2 MapAttributes_011_4b5d
	; warp 10, 7, $9068, ObjectEvents_012_41dc, MapEvents_010_45c0
	db 10, 7
	dw $9068
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_45c0

	; warp 10, 0, $2068, ObjectEvents_012_41dc, MapEvents_010_45c0
	db 10, 0
	dw $2068
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_45c0

unk_010_417a:
	dbaw2 MapAttributes_011_4b71
	; warp 1, 10, $9048, ObjectEvents_012_41dc, MapEvents_010_4603
	db 1, 10
	dw $9048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4603

	; warp 5, 0, $2048, ObjectEvents_012_41dc, MapEvents_010_4603
	db 5, 0
	dw $2048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4603

unk_010_4198:
	dbaw2 MapAttributes_011_4b85
	; warp 0, 3, $9058, ObjectEvents_012_49f9, MapEvents_010_4640
	db 0, 3
	dw $9058
	db BANK(ObjectEvents_012_49f9)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_49f9
	dw MapEvents_010_4640

	; warp 1, 0, $6048, ObjectEvents_012_41dc, MapEvents_010_4640
	db 1, 0
	dw $6048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4640

unk_010_41b6:
	dbaw2 MapAttributes_011_53af
	; warp 10, 10, $9068, ObjectEvents_012_41dc, MapEvents_010_465f
	db 10, 10
	dw $9068
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_465f

	; warp 6, 0, $2048, ObjectEvents_012_41dc, MapEvents_010_465f
	db 6, 0
	dw $2048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_465f

unk_010_41d4:
	dbaw2 MapAttributes_011_53c3
	; warp 0, 0, $9078, ObjectEvents_012_41dc, MapEvents_010_4672
	db 0, 0
	dw $9078
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4672

	; warp 0, 0, $9078, ObjectEvents_012_4380, MapEvents_010_4672
	db 0, 0
	dw $9078
	db BANK(ObjectEvents_012_4380)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4380
	dw MapEvents_010_4672

unk_010_41f2:
	dbaw2 MapAttributes_011_59a2
	; warp 1, 7, $5088, ObjectEvents_012_41dc, MapEvents_010_4679
	db 1, 7
	dw $5088
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4679

	; warp 0, 2, $8058, ObjectEvents_012_41dc, MapEvents_010_4679
	db 0, 2
	dw $8058
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4679

unk_010_4210:
	dbaw2 MapAttributes_011_5d81
	; warp 3, 7, $9068, ObjectEvents_012_42ca, MapEvents_010_468c
	db 3, 7
	dw $9068
	db BANK(ObjectEvents_012_42ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42ca
	dw MapEvents_010_468c

	; warp 0, 0, $7038, ObjectEvents_012_42ca, MapEvents_010_468c
	db 0, 0
	dw $7038
	db BANK(ObjectEvents_012_42ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42ca
	dw MapEvents_010_468c

	; warp 1, 4, $6048, ObjectEvents_012_42ca, MapEvents_010_468c
	db 1, 4
	dw $6048
	db BANK(ObjectEvents_012_42ca)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42ca
	dw MapEvents_010_468c

unk_010_423a:
	dbaw2 MapAttributes_011_5d95
	; warp 0, 0, $7038, ObjectEvents_012_41dc, MapEvents_010_469f
	db 0, 0
	dw $7038
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_469f

	; warp 7, 6, $4048, ObjectEvents_012_41dc, MapEvents_010_469f
	db 7, 6
	dw $4048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_469f

	; warp 2, 5, $6038, ObjectEvents_012_41dc, MapEvents_010_469f
	db 2, 5
	dw $6038
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_469f

unk_010_4264:
	dbaw2 MapAttributes_011_5da9
	; warp 5, 4, $5058, ObjectEvents_012_41dc, MapEvents_010_46b2
	db 5, 4
	dw $5058
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46b2

	; warp 0, 3, $6058, ObjectEvents_012_41dc, MapEvents_010_46b2
	db 0, 3
	dw $6058
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46b2

	; warp 5, 0, $3078, ObjectEvents_012_41dc, MapEvents_010_46b2
	db 5, 0
	dw $3078
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46b2

unk_010_428e:
	dbaw2 MapAttributes_011_5dbd
	; warp 5, 0, $3048, ObjectEvents_012_41dc, MapEvents_010_46c5
	db 5, 0
	dw $3048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46c5

	; warp 5, 5, $5048, ObjectEvents_012_41dc, MapEvents_010_46c5
	db 5, 5
	dw $5048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46c5

unk_010_42ac:
	dbaw2 MapAttributes_011_5dd1
	; warp 1, 0, $9078, ObjectEvents_012_471d, MapEvents_010_46d2
	db 1, 0
	dw $9078
	db BANK(ObjectEvents_012_471d)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_471d
	dw MapEvents_010_46d2

	; warp 1, 0, $9078, ObjectEvents_012_41dc, MapEvents_010_46d2
	db 1, 0
	dw $9078
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46d2

unk_010_42ca:
	dbaw2 MapAttributes_011_666a
	; warp 0, 0, $8058, ObjectEvents_012_42be, MapEvents_010_46d9
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_012_42be)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42be
	dw MapEvents_010_46d9

	; warp 0, 0, $3018, ObjectEvents_012_42be, MapEvents_010_46d9
	db 0, 0
	dw $3018
	db BANK(ObjectEvents_012_42be)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42be
	dw MapEvents_010_46d9

	; warp 0, 0, $5058, ObjectEvents_012_4b18, MapEvents_010_46d9
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_012_4b18)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4b18
	dw MapEvents_010_46d9

	; warp 0, 0, $3018, ObjectEvents_012_4d2c, MapEvents_010_46d9
	db 0, 0
	dw $3018
	db BANK(ObjectEvents_012_4d2c)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4d2c
	dw MapEvents_010_46d9

	; warp 0, 0, $7058, ObjectEvents_012_47f7, MapEvents_010_46d9
	db 0, 0
	dw $7058
	db BANK(ObjectEvents_012_47f7)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_47f7
	dw MapEvents_010_46d9

	; warp 0, 0, $8058, ObjectEvents_012_4d2c, MapEvents_010_46d9
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_012_4d2c)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4d2c
	dw MapEvents_010_46d9

	; warp 0, 0, $3018, ObjectEvents_012_47f7, MapEvents_010_46d9
	db 0, 0
	dw $3018
	db BANK(ObjectEvents_012_47f7)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_47f7
	dw MapEvents_010_46d9

	; warp 0, 0, $5058, ObjectEvents_012_4b45, MapEvents_010_46d9
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_012_4b45)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4b45
	dw MapEvents_010_46d9

unk_010_4330:
	dbaw2 MapAttributes_011_667e
	; warp 0, 0, $3018, ObjectEvents_012_41dc, MapEvents_010_46f8
	db 0, 0
	dw $3018
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46f8

	; warp 0, 0, $9018, ObjectEvents_012_41dc, MapEvents_010_46f8
	db 0, 0
	dw $9018
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_46f8

unk_010_434e:
	dbaw2 MapAttributes_011_6692
	; warp 0, 0, $9018, ObjectEvents_012_41dc, MapEvents_010_470b
	db 0, 0
	dw $9018
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_470b

	; warp 0, 0, $3018, ObjectEvents_012_41dc, MapEvents_010_470b
	db 0, 0
	dw $3018
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_470b

unk_010_436c:
	dbaw2 MapAttributes_011_66a6
	; warp 0, 0, $3028, ObjectEvents_012_41dc, MapEvents_010_471e
	db 0, 0
	dw $3028
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_471e

	; warp 1, 0, $7058, ObjectEvents_012_4c71, MapEvents_010_471e
	db 1, 0
	dw $7058
	db BANK(ObjectEvents_012_4c71)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4c71
	dw MapEvents_010_471e

	; warp 1, 0, $7068, ObjectEvents_012_41dc, MapEvents_010_471e
	db 1, 0
	dw $7068
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_471e

unk_010_4396:
	dbaw2 MapAttributes_011_6a66
	; warp 1, 0, $8068, ObjectEvents_012_4324, MapEvents_010_473d
	db 1, 0
	dw $8068
	db BANK(ObjectEvents_012_4324)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4324
	dw MapEvents_010_473d

unk_010_43a8:
	dbaw2 MapAttributes_011_6a7a
	; warp 0, 0, $8038, ObjectEvents_012_433b, MapEvents_010_474a
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_012_433b)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_433b
	dw MapEvents_010_474a

unk_010_43ba:
	dbaw2 MapAttributes_011_6a8e
	; warp 0, 0, $8048, ObjectEvents_012_4352, MapEvents_010_4757
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_012_4352)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4352
	dw MapEvents_010_4757

unk_010_43cc:
	dbaw2 MapAttributes_011_6aa2
	; warp 1, 0, $8058, ObjectEvents_012_4374, MapEvents_010_4764
	db 1, 0
	dw $8058
	db BANK(ObjectEvents_012_4374)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4374
	dw MapEvents_010_4764

unk_010_43de:
	dbaw2 MapAttributes_011_6ab6
	; warp 0, 0, $8048, ObjectEvents_012_4589, MapEvents_010_4771
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_012_4589)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4589
	dw MapEvents_010_4771

	; warp 1, 0, $4078, ObjectEvents_012_44b5, MapEvents_010_4771
	db 1, 0
	dw $4078
	db BANK(ObjectEvents_012_44b5)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_44b5
	dw MapEvents_010_4771

	; warp 1, 0, $6068, ObjectEvents_012_449e, MapEvents_010_4771
	db 1, 0
	dw $6068
	db BANK(ObjectEvents_012_449e)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_449e
	dw MapEvents_010_4771

	; warp 0, 0, $8048, ObjectEvents_012_41dc, MapEvents_010_4771
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4771

unk_010_4414:
	dbaw2 MapAttributes_011_6e9f
	; warp 1, 0, $2068, ObjectEvents_012_41dc, MapEvents_010_477e
	db 1, 0
	dw $2068
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_477e

	; warp 1, 7, $9078, ObjectEvents_012_41dc, MapEvents_010_477e
	db 1, 7
	dw $9078
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_477e

unk_010_4432:
	dbaw2 MapAttributes_011_6eb3
	; warp 7, 5, $7088, ObjectEvents_012_41dc, MapEvents_010_47af
	db 7, 5
	dw $7088
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_47af

	; warp 7, 0, $2068, ObjectEvents_012_41dc, MapEvents_010_47af
	db 7, 0
	dw $2068
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_47af

	; warp 0, 0, $2028, ObjectEvents_012_41dc, MapEvents_010_47af
	db 0, 0
	dw $2028
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_47af

unk_010_445c:
	dbaw2 TechShop_MapAttributes
	; warp 0, 0, $8068, ObjectEvents_012_49a6, MapEvents_010_47ff
	db 0, 0
	dw $8068
	db BANK(ObjectEvents_012_49a6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_49a6
	dw MapEvents_010_47ff

unk_010_446e:
	dbaw2 TechHealingCenter_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_012_496b, MapEvents_010_47ec
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_012_496b)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_496b
	dw MapEvents_010_47ec

unk_010_4480:
	dbaw2 MapAttributes_001_40f0
	; warp 0, 0, $8048, ObjectEvents_012_4262, MapEvents_010_480c
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_012_4262)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4262
	dw MapEvents_010_480c

unk_010_4492:
	dbaw2 MapAttributes_001_4140
	; warp 0, 0, $8058, ObjectEvents_012_4279, MapEvents_010_4819
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_012_4279)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4279
	dw MapEvents_010_4819

unk_010_44a4:
	dbaw2 MapAttributes_001_4118
	; warp 0, 0, $8058, ObjectEvents_012_4290, MapEvents_010_4826
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_012_4290)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4290
	dw MapEvents_010_4826

unk_010_44b6:
	dbaw2 MapAttributes_001_412c
	; warp 0, 0, $8038, ObjectEvents_012_41dc, MapEvents_010_4833
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4833

unk_010_44c8:
	dbaw2 MapAttributes_001_40f0
	; warp 0, 0, $8048, ObjectEvents_012_41dc, MapEvents_010_4840
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_012_41dc)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_41dc
	dw MapEvents_010_4840

unk_010_44da:
	dbaw2 MapAttributes_001_4104
	; warp 0, 0, $8048, ObjectEvents_012_42b2, MapEvents_010_484d
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_012_42b2)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_42b2
	dw MapEvents_010_484d

unk_010_44ec:
	dbaw2 TechHealingCenter_MapAttributes
	; warp 0, 0, $8068, ObjectEvents_012_496b, MapEvents_010_485a
	db 0, 0
	dw $8068
	db BANK(ObjectEvents_012_496b)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_496b
	dw MapEvents_010_485a

unk_010_44fe:
	dbaw2 TechShop_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_012_49a6, MapEvents_010_486d
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_012_49a6)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_49a6
	dw MapEvents_010_486d

unk_010_4510:
	dbaw2 MapAttributes_001_791a
	; warp 0, 0, $5058, ObjectEvents_012_4c7d, MapEvents_010_487a
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_012_4c7d)
	ds 3 ; 0 0 0
	dw ObjectEvents_012_4c7d
	dw MapEvents_010_487a

MapEvents_010_4522:
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

MapEvents_010_457d:
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

MapEvents_010_45c0:
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

MapEvents_010_4603:
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

MapEvents_010_4640:
	warp_event ABSOLUTE, 15, $04, $01, $00
	event_05  6, 10,  1, Script_012_4175
	event_05  6,  8,  1, Script_012_417f
	event_05  7,  9,  1, Script_012_416b
	event_05  5,  9,  1, Script_012_4150
	events_end

MapEvents_010_465f:
	warp_event ABSOLUTE, 29, $18, $02, $00
	script_event ABSOLUTE,  0,  0, Script_012_4397
	signpost_event 25, 28, $0a
	events_end

MapEvents_010_4672:
	warp_event ABSOLUTE,  9, $06, $01, $00
	events_end

MapEvents_010_4679:
	warp_event 11, ABSOLUTE, $01, $02, $00
	warp_event  5, 10, $09, $00, $00
	warp_event  6, 10, $09, $00, $00
	events_end

MapEvents_010_468c:
	warp_event ABSOLUTE, 23, $08, $01, $00
	warp_event  3,  6, $0a, $00, $00
	event_04  6, 13,  0, Script_012_4d71
	events_end

MapEvents_010_469f:
	warp_event  3,  6, $09, $01, $00
	warp_event 18, 15, $0b, $00, $00
	warp_event  7, 15, $0b, $01, $00
	events_end

MapEvents_010_46b2:
	warp_event 15, 12, $0a, $01, $00
	warp_event  5, 11, $0a, $02, $00
	warp_event 17,  2, $0c, $00, $00
	events_end

MapEvents_010_46c5:
	warp_event 14,  2, $0b, $02, $00
	script_event 14, 14,  0, Script_012_470f
	events_end

MapEvents_010_46d2:
	warp_event 10,  8, $0c, $01, $00
	events_end

MapEvents_010_46d9:
	script_event  5,  8, 11, Script_012_482b
	script_event  6,  8, 11, Script_012_4850
	warp_event ABSOLUTE,  8, $01, $0b, $00
	warp_event  1,  2, $0f, $00, $00
	event_07  1,  6, $07
	events_end

MapEvents_010_46f8:
	script_event  1,  2,  0, Script_012_4d14
	warp_event  1,  8, $10, $00, $00
	event_07  7,  4, $08
	events_end

MapEvents_010_470b:
	warp_event  1,  8, $0f, $01, $00
	warp_event  1,  2, $11, $00, $00
	event_07 10,  2, $09
	events_end

MapEvents_010_471e:
	warp_event  2,  2, $10, $01, $00
	script_event  2,  5,  8, Script_012_4c95
	script_event  3,  5,  8, Script_012_4c95
	script_event  2,  5, 10, Script_012_4781
	script_event  3,  5, 10, Script_012_4781
	events_end

MapEvents_010_473d:
	warp_event ABSOLUTE,  8, $02, $02, $00
	event_07  9,  3, $0a
	events_end

MapEvents_010_474a:
	warp_event ABSOLUTE,  8, $02, $03, $00
	event_07 10,  3, $0b
	events_end

MapEvents_010_4757:
	warp_event ABSOLUTE,  8, $02, $04, $00
	event_07  1,  3, $0c
	events_end

MapEvents_010_4764:
	warp_event ABSOLUTE,  8, $02, $05, $00
	event_07  2,  3, $0d
	events_end

MapEvents_010_4771:
	warp_event ABSOLUTE,  8, $02, $08, $00
	event_07  2,  3, $0e
	events_end

MapEvents_010_477e:
	warp_event ABSOLUTE,  0, $01, $01, $00
	warp_event ABSOLUTE, 23, $02, $00, $00
	event_04  6, 16,  0, Script_012_418e
	event_04  6, 17,  0, Script_012_418e
	event_04  4, 16,  0, Script_012_41b5
	event_04  4, 17,  0, Script_012_41b5
	signpost_event  7,  2, $06
	signpost_event  9, 21, $07
	events_end

MapEvents_010_47af:
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

MapEvents_010_47ec:
	warp_event ABSOLUTE,  8, $02, $06, $00
	event_04  4,  4,  0, Script_012_498a
	event_04  8,  4,  0, Script_012_4998
	events_end

MapEvents_010_47ff:
	warp_event ABSOLUTE,  8, $02, $07, $00
	event_04  4,  3,  0, Script_012_49c8
	events_end

MapEvents_010_480c:
	warp_event ABSOLUTE,  8, $01, $03, $00
	event_07  9,  3, $01
	events_end

MapEvents_010_4819:
	warp_event ABSOLUTE,  8, $01, $04, $00
	event_07 10,  3, $05
	events_end

MapEvents_010_4826:
	warp_event ABSOLUTE,  8, $01, $05, $00
	event_07  5,  3, $03
	events_end

MapEvents_010_4833:
	warp_event ABSOLUTE,  8, $01, $06, $00
	event_07  8,  3, $04
	events_end

MapEvents_010_4840:
	warp_event ABSOLUTE,  8, $01, $07, $00
	event_07  2,  3, $06
	events_end

MapEvents_010_484d:
	warp_event ABSOLUTE,  8, $01, $08, $00
	event_07  3,  3, $02
	events_end

MapEvents_010_485a:
	warp_event ABSOLUTE,  8, $01, $0a, $00
	event_04  4,  4,  0, Script_012_498a
	event_04  8,  4,  0, Script_012_4998
	events_end

MapEvents_010_486d:
	warp_event ABSOLUTE,  8, $01, $09, $00
	event_04  4,  3,  0, Script_012_49b6
	events_end

MapEvents_010_487a:
	events_end

Group03_Maps::
	dw unk_010_48c3
	dw unk_010_48c3
	dw unk_010_48ed
	dw unk_010_490b
	dw unk_010_4929
	dw unk_010_4953
	dw unk_010_4971
	dw unk_010_49a7
	dw unk_010_4a61
	dw unk_010_4ad3
	dw unk_010_4af1
	dw unk_010_4b0f
	dw unk_010_4b39
	dw unk_010_4b7b
	dw unk_010_4bbd
	dw unk_010_4bf3
	dw unk_010_4c11
	dw unk_010_4c2f
	dw unk_010_4c4d
	dw unk_010_4c77
	dw unk_010_4c89
	dw unk_010_4c9b
	dw unk_010_4cb9
	dw unk_010_4cd7
	dw unk_010_4ce9
	dw unk_010_4cfb
	dw unk_010_4d0d
	dw unk_010_4d1f
	dw unk_010_4d31
	dw unk_010_4d43
	dw unk_010_4d55
	dw unk_010_4d67
	dw unk_010_4d85
	dw unk_010_4d97
	dw unk_010_4dcd
	dw unk_010_4ddf

unk_010_48c3:
	dbaw2 MapAttributes_050_4000
	; warp 10, 7, $9068, ObjectEvents_04f_4389, MapEvents_010_4df2
	db 10, 7
	dw $9068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4df2

	; warp 10, 0, $2068, ObjectEvents_04f_4389, MapEvents_010_4df2
	db 10, 0
	dw $2068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4df2

	; warp 8, 0, $2048, ObjectEvents_04f_4389, MapEvents_010_4df2
	db 8, 0
	dw $2048
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4df2

unk_010_48ed:
	dbaw2 MapAttributes_050_4014
	; warp 0, 10, $9068, ObjectEvents_04f_4389, MapEvents_010_4e4d
	db 0, 10
	dw $9068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4e4d

	; warp 4, 0, $2068, ObjectEvents_04f_4389, MapEvents_010_4e4d
	db 4, 0
	dw $2068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4e4d

unk_010_490b:
	dbaw2 MapAttributes_050_4028
	; warp 0, 3, $9068, ObjectEvents_04f_4389, MapEvents_010_4e8a
	db 0, 3
	dw $9068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4e8a

	; warp 0, 0, $4058, ObjectEvents_04f_4389, MapEvents_010_4e8a
	db 0, 0
	dw $4058
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4e8a

unk_010_4929:
	dbaw2 MapAttributes_050_4ab5
	; warp 10, 7, $9068, ObjectEvents_04f_4c80, MapEvents_010_4e97
	db 10, 7
	dw $9068
	db BANK(ObjectEvents_04f_4c80)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4c80
	dw MapEvents_010_4e97

	; warp 10, 0, $2068, ObjectEvents_04f_4c80, MapEvents_010_4e97
	db 10, 0
	dw $2068
	db BANK(ObjectEvents_04f_4c80)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4c80
	dw MapEvents_010_4e97

	; warp 8, 0, $2048, ObjectEvents_04f_4c80, MapEvents_010_4e97
	db 8, 0
	dw $2048
	db BANK(ObjectEvents_04f_4c80)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4c80
	dw MapEvents_010_4e97

unk_010_4953:
	dbaw2 MapAttributes_050_4ac9
	; warp 0, 10, $9068, ObjectEvents_04f_4389, MapEvents_010_4ef2
	db 0, 10
	dw $9068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4ef2

	; warp 4, 0, $2068, ObjectEvents_04f_4389, MapEvents_010_4ef2
	db 4, 0
	dw $2068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4ef2

unk_010_4971:
	dbaw2 MapAttributes_050_4add
	; warp 0, 3, $9068, ObjectEvents_04f_4389, MapEvents_010_4f2f
	db 0, 3
	dw $9068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4f2f

	; warp 0, 0, $4048, ObjectEvents_04f_4389, MapEvents_010_4f2f
	db 0, 0
	dw $4048
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4f2f

	; warp 0, 3, $9068, ObjectEvents_04f_4db2, MapEvents_010_4f3c
	db 0, 3
	dw $9068
	db BANK(ObjectEvents_04f_4db2)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4db2
	dw MapEvents_010_4f3c

	; warp 0, 3, $9068, ObjectEvents_04f_4389, MapEvents_010_4f3c
	db 0, 3
	dw $9068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_4f3c

unk_010_49a7:
	dbaw2 MapAttributes_050_5560
	; warp 0, 0, $2048, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 0, 0
	dw $2048
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 0, 5, $6018, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 0, 5
	dw $6018
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 10, 10, $9038, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 10, 10
	dw $9038
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 2, 0, $6048, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 2, 0
	dw $6048
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 5, 1, $7058, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 5, 1
	dw $7058
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 10, 0, $6068, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 10, 0
	dw $6068
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 10, 4, $7068, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 10, 4
	dw $7068
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 10, 10, $6068, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 10, 10
	dw $6068
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 7, 9, $7048, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 7, 9
	dw $7048
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 0, 7, $8078, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 0, 7
	dw $8078
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 0, 10, $7038, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 0, 10
	dw $7038
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 0, 7, $8038, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 0, 7
	dw $8038
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 0, 3, $7038, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 0, 3
	dw $7038
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

	; warp 5, 1, $9058, ObjectEvents_04f_4ab6, MapEvents_010_4df1
	db 5, 1
	dw $9058
	db BANK(ObjectEvents_04f_4ab6)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4ab6
	dw MapEvents_010_4df1

	; warp 1, 6, $2068, ObjectEvents_04f_43fa, MapEvents_010_4f43
	db 1, 6
	dw $2068
	db BANK(ObjectEvents_04f_43fa)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43fa
	dw MapEvents_010_4f43

unk_010_4a61:
	dbaw2 MapAttributes_050_5c16
	; warp 0, 0, $9058, ObjectEvents_04f_438a, MapEvents_010_4fd5
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_04f_438a)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_438a
	dw MapEvents_010_4fd5

	; warp 1, 0, $6088, ObjectEvents_04f_438a, MapEvents_010_4fd5
	db 1, 0
	dw $6088
	db BANK(ObjectEvents_04f_438a)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_438a
	dw MapEvents_010_4fd5

	; warp 0, 0, $3028, ObjectEvents_04f_438a, MapEvents_010_4fd5
	db 0, 0
	dw $3028
	db BANK(ObjectEvents_04f_438a)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_438a
	dw MapEvents_010_4fd5

	; warp 0, 0, $3038, ObjectEvents_04f_43b7, MapEvents_010_4fd5
	db 0, 0
	dw $3038
	db BANK(ObjectEvents_04f_43b7)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_43b7
	dw MapEvents_010_4fd5

	; warp 1, 0, $6078, ObjectEvents_04f_4b3f, MapEvents_010_4fd5
	db 1, 0
	dw $6078
	db BANK(ObjectEvents_04f_4b3f)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4b3f
	dw MapEvents_010_4fd5

	; warp 0, 0, $6058, ObjectEvents_04e_436a, MapEvents_010_4fc8
	db 0, 0
	dw $6058
	db BANK(ObjectEvents_04e_436a)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_436a
	dw MapEvents_010_4fc8

	; warp 0, 0, $9058, ObjectEvents_04e_4009, MapEvents_010_4fc8
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_4fc8

	; warp 0, 0, $3028, ObjectEvents_04e_4009, MapEvents_010_4fc8
	db 0, 0
	dw $3028
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_4fc8

	; warp 0, 0, $6058, ObjectEvents_04e_44b0, MapEvents_010_4fc8
	db 0, 0
	dw $6058
	db BANK(ObjectEvents_04e_44b0)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_44b0
	dw MapEvents_010_4fc8

unk_010_4ad3:
	dbaw2 MapAttributes_050_5e78
	; warp 0, 0, $7028, ObjectEvents_04e_400b, MapEvents_010_4ff4
	db 0, 0
	dw $7028
	db BANK(ObjectEvents_04e_400b)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_400b
	dw MapEvents_010_4ff4

	; warp 0, 0, $7028, ObjectEvents_04e_40d1, MapEvents_010_500d
	db 0, 0
	dw $7028
	db BANK(ObjectEvents_04e_40d1)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_40d1
	dw MapEvents_010_500d

unk_010_4af1:
	dbaw2 MapAttributes_050_5fee
	; warp 1, 0, $4038, ObjectEvents_04e_40a4, MapEvents_010_5026
	db 1, 0
	dw $4038
	db BANK(ObjectEvents_04e_40a4)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_40a4
	dw MapEvents_010_5026

	; warp 1, 0, $20b0, ObjectEvents_04e_43d5, MapEvents_010_5026
	db 1, 0
	dw $20b0
	db BANK(ObjectEvents_04e_43d5)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_43d5
	dw MapEvents_010_5026

unk_010_4b0f:
	dbaw2 MapAttributes_050_6261
	; warp 0, 0, $3018, ObjectEvents_04e_4009, MapEvents_010_5027
	db 0, 0
	dw $3018
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5027

	; warp 7, 0, $7088, ObjectEvents_04e_4009, MapEvents_010_5027
	db 7, 0
	dw $7088
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5027

	; warp 7, 7, $8078, ObjectEvents_04e_4009, MapEvents_010_5027
	db 7, 7
	dw $8078
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5027

unk_010_4b39:
	dbaw2 MapAttributes_050_6275
	; warp 7, 0, $7078, ObjectEvents_04e_4009, MapEvents_010_503a
	db 7, 0
	dw $7078
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_503a

	; warp 7, 7, $8078, ObjectEvents_04e_4009, MapEvents_010_503a
	db 7, 7
	dw $8078
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_503a

	; warp 4, 2, $5058, ObjectEvents_04e_4009, MapEvents_010_503a
	db 4, 2
	dw $5058
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_503a

	; warp 0, 2, $6058, ObjectEvents_04e_4009, MapEvents_010_503a
	db 0, 2
	dw $6058
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_503a

	; warp 0, 0, $4058, ObjectEvents_04e_4009, MapEvents_010_503a
	db 0, 0
	dw $4058
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_503a

unk_010_4b7b:
	dbaw2 MapAttributes_050_6289
	; warp 5, 1, $6038, ObjectEvents_04e_4009, MapEvents_010_5059
	db 5, 1
	dw $6038
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5059

	; warp 0, 2, $5058, ObjectEvents_04e_4009, MapEvents_010_5059
	db 0, 2
	dw $5058
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5059

	; warp 0, 0, $4058, ObjectEvents_04e_4009, MapEvents_010_5059
	db 0, 0
	dw $4058
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5059

	; warp 0, 7, $5038, ObjectEvents_04e_4009, MapEvents_010_5059
	db 0, 7
	dw $5038
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5059

	; warp 7, 6, $5078, ObjectEvents_04e_4009, MapEvents_010_5059
	db 7, 6
	dw $5078
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5059

unk_010_4bbd:
	dbaw2 MapAttributes_050_629d
	; warp 0, 6, $7028, ObjectEvents_04e_4009, MapEvents_010_5078
	db 0, 6
	dw $7028
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5078

	; warp 7, 6, $5078, ObjectEvents_04e_4009, MapEvents_010_5078
	db 7, 6
	dw $5078
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5078

	; warp 3, 0, $a068, ObjectEvents_04e_4402, MapEvents_010_5078
	db 3, 0
	dw $a068
	db BANK(ObjectEvents_04e_4402)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4402
	dw MapEvents_010_5078

	; warp 4, 5, $5048, ObjectEvents_04e_4009, MapEvents_010_5078
	db 4, 5
	dw $5048
	db BANK(ObjectEvents_04e_4009)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_4009
	dw MapEvents_010_5078

unk_010_4bf3:
	dbaw2 MapAttributes_050_6c34
	; warp 0, 0, $9058, ObjectEvents_04f_445e, MapEvents_010_508b
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_04f_445e)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_445e
	dw MapEvents_010_508b

	; warp 1, 0, $6058, ObjectEvents_04f_4475, MapEvents_010_508b
	db 1, 0
	dw $6058
	db BANK(ObjectEvents_04f_4475)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4475
	dw MapEvents_010_508b

unk_010_4c11:
	dbaw2 MapAttributes_050_6ebf
	; warp 0, 0, $9058, ObjectEvents_04f_4389, MapEvents_010_5098
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_5098

	; warp 0, 0, $5058, ObjectEvents_04f_4389, MapEvents_010_5098
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_5098

unk_010_4c2f:
	dbaw2 MapAttributes_050_7132
	; warp 0, 0, $9048, ObjectEvents_04e_45ac, MapEvents_010_50ab
	db 0, 0
	dw $9048
	db BANK(ObjectEvents_04e_45ac)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_45ac
	dw MapEvents_010_50ab

	; warp 1, 0, $7048, ObjectEvents_04e_458a, MapEvents_010_50ab
	db 1, 0
	dw $7048
	db BANK(ObjectEvents_04e_458a)
	ds 3 ; 0 0 0
	dw ObjectEvents_04e_458a
	dw MapEvents_010_50ab

unk_010_4c4d:
	dbaw2 MapAttributes_050_7391
	; warp 5, 0, $5068, ObjectEvents_04f_469c, MapEvents_010_50b2
	db 5, 0
	dw $5068
	db BANK(ObjectEvents_04f_469c)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_469c
	dw MapEvents_010_50b2

	; warp 0, 0, $6048, ObjectEvents_04f_469c, MapEvents_010_50b2
	db 0, 0
	dw $6048
	db BANK(ObjectEvents_04f_469c)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_469c
	dw MapEvents_010_50b2

	; warp 5, 5, $6038, ObjectEvents_04f_469c, MapEvents_010_50b2
	db 5, 5
	dw $6038
	db BANK(ObjectEvents_04f_469c)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_469c
	dw MapEvents_010_50b2

unk_010_4c77:
	dbaw2 MapAttributes_050_73a5
	; warp 0, 0, $9058, ObjectEvents_04f_46d4, MapEvents_010_50c5
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_04f_46d4)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_46d4
	dw MapEvents_010_50c5

unk_010_4c89:
	dbaw2 MapAttributes_050_73b9
	; warp 0, 0, $9038, ObjectEvents_04f_46eb, MapEvents_010_50cc
	db 0, 0
	dw $9038
	db BANK(ObjectEvents_04f_46eb)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_46eb
	dw MapEvents_010_50cc

unk_010_4c9b:
	dbaw2 MapAttributes_050_77c2
	; warp 0, 0, $2068, ObjectEvents_04f_4389, MapEvents_010_50d3
	db 0, 0
	dw $2068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_50d3

	; warp 1, 5, $7078, ObjectEvents_04f_4389, MapEvents_010_50d3
	db 1, 5
	dw $7078
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_50d3

unk_010_4cb9:
	dbaw2 MapAttributes_050_77d6
	; warp 7, 0, $7088, ObjectEvents_04f_4389, MapEvents_010_50e0
	db 7, 0
	dw $7088
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_50e0

	; warp 0, 0, $2038, ObjectEvents_04f_4389, MapEvents_010_50e0
	db 0, 0
	dw $2038
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_50e0

unk_010_4cd7:
	dbaw2 MapAttributes_001_41b8
	; warp 0, 0, $8048, ObjectEvents_04f_470d, MapEvents_010_50ed
	db 0, 0
	dw $8048
	db BANK(ObjectEvents_04f_470d)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_470d
	dw MapEvents_010_50ed

unk_010_4ce9:
	dbaw2 CarpetWomansHouse2_MapAttributes
	; warp 0, 0, $8038, ObjectEvents_04f_4389, MapEvents_010_5100
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_5100

unk_010_4cfb:
	dbaw2 FangfangsHouse2_MapAttributes
	; warp 0, 0, $8078, ObjectEvents_04f_4724, MapEvents_010_5113
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_04f_4724)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4724
	dw MapEvents_010_5113

unk_010_4d0d:
	dbaw2 MapAttributes_001_4118
	; warp 0, 0, $8058, ObjectEvents_04f_473b, MapEvents_010_5126
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_04f_473b)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_473b
	dw MapEvents_010_5126

unk_010_4d1f:
	dbaw2 MapAttributes_011_6aa2
	; warp 0, 0, $8078, ObjectEvents_04f_4752, MapEvents_010_5139
	db 0, 0
	dw $8078
	db BANK(ObjectEvents_04f_4752)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4752
	dw MapEvents_010_5139

unk_010_4d31:
	dbaw2 MapAttributes_011_6a7a
	; warp 0, 0, $8038, ObjectEvents_04f_475e, MapEvents_010_514c
	db 0, 0
	dw $8038
	db BANK(ObjectEvents_04f_475e)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_475e
	dw MapEvents_010_514c

unk_010_4d43:
	dbaw2 BellHealingCenter2_MapAttributes
	; warp 0, 0, $8058, ObjectEvents_04f_4032, MapEvents_010_515f
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_04f_4032)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4032
	dw MapEvents_010_515f

unk_010_4d55:
	dbaw2 unk_018_408c
	; warp 0, 0, $8058, ObjectEvents_04f_4010, MapEvents_010_5178
	db 0, 0
	dw $8058
	db BANK(ObjectEvents_04f_4010)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4010
	dw MapEvents_010_5178

unk_010_4d67:
	dbaw2 MapAttributes_050_403c
	; warp 0, 3, $9068, ObjectEvents_04f_4389, MapEvents_010_518b
	db 0, 3
	dw $9068
	db BANK(ObjectEvents_04f_4389)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4389
	dw MapEvents_010_518b

	; warp 0, 0, $5058, ObjectEvents_04f_4d58, MapEvents_010_518b
	db 0, 0
	dw $5058
	db BANK(ObjectEvents_04f_4d58)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4d58
	dw MapEvents_010_518b

unk_010_4d85:
	dbaw2 MapAttributes_050_4af1
	; warp 0, 3, $9068, ObjectEvents_04f_4ccb, MapEvents_010_5192
	db 0, 3
	dw $9068
	db BANK(ObjectEvents_04f_4ccb)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4ccb
	dw MapEvents_010_5192

unk_010_4d97:
	dbaw2 MapAttributes_050_7391
	; warp 5, 0, $5068, ObjectEvents_04f_453c, MapEvents_010_5199
	db 5, 0
	dw $5068
	db BANK(ObjectEvents_04f_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_453c
	dw MapEvents_010_5199

	; warp 0, 0, $6048, ObjectEvents_04f_453c, MapEvents_010_5199
	db 0, 0
	dw $6048
	db BANK(ObjectEvents_04f_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_453c
	dw MapEvents_010_5199

	; warp 5, 5, $6038, ObjectEvents_04f_453c, MapEvents_010_5199
	db 5, 5
	dw $6038
	db BANK(ObjectEvents_04f_453c)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_453c
	dw MapEvents_010_5199

	; warp 3, 3, $4038, ObjectEvents_04f_4582, MapEvents_010_5199
	db 3, 3
	dw $4038
	db BANK(ObjectEvents_04f_4582)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4582
	dw MapEvents_010_5199

unk_010_4dcd:
	dbaw2 MapAttributes_050_73a5
	; warp 0, 0, $9058, ObjectEvents_04f_463f, MapEvents_010_51ac
	db 0, 0
	dw $9058
	db BANK(ObjectEvents_04f_463f)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_463f
	dw MapEvents_010_51ac

unk_010_4ddf:
	dbaw2 MapAttributes_050_73b9
	; warp 0, 0, $9038, ObjectEvents_04f_4656, MapEvents_010_51b3
	db 0, 0
	dw $9038
	db BANK(ObjectEvents_04f_4656)
	ds 3 ; 0 0 0
	dw ObjectEvents_04f_4656
	dw MapEvents_010_51b3

MapEvents_010_4df1:
	events_end

MapEvents_010_4df2:
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

MapEvents_010_4e4d:
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

MapEvents_010_4e8a:
	warp_event ABSOLUTE, 15, $02, $01, $00
	script_event  4,  3,  0, Script_04f_45c6
	events_end

MapEvents_010_4e97:
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

MapEvents_010_4ef2:
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

MapEvents_010_4f2f:
	warp_event ABSOLUTE, 15, $05, $01, $00
	warp_event  4,  3, $12, $00, $00
	events_end

MapEvents_010_4f3c:
	warp_event ABSOLUTE, 15, $05, $01, $00
	events_end

MapEvents_010_4f43:
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

MapEvents_010_4fc8:
	warp_event ABSOLUTE,  9, $07, $04, $00
	warp_event  1,  2, $0b, $00, $00
	events_end

MapEvents_010_4fd5:
	warp_event ABSOLUTE,  9, $07, $04, $00
	warp_event  1,  2, $0b, $00, $00
	event_04  9,  4,  0, Script_04f_4bf3
	event_04  8,  4,  0, Script_04f_4bf3
	event_04  3,  6,  0, Script_04f_4b83
	events_end

MapEvents_010_4ff4:
	script_event  5,  7,  0, Script_04e_4053
	script_event  6,  7,  0, Script_04e_4053
	event_07  2,  2, $01
	event_07 10,  5, $02
	events_end

MapEvents_010_500d:
	script_event  5,  7,  0, Script_04e_4119
	script_event  6,  7,  0, Script_04e_4119
	event_07  2,  2, $01
	event_07 10,  5, $02
	events_end

MapEvents_010_5026:
	events_end

MapEvents_010_5027:
	script_event  1,  2,  0, Script_04e_44d2
	warp_event 22,  6, $0c, $00, $00
	warp_event 21, 21, $0c, $01, $00
	events_end

MapEvents_010_503a:
	warp_event 21,  6, $0b, $01, $00
	warp_event 21, 21, $0b, $02, $00
	warp_event 13,  8, $0d, $00, $00
	warp_event  5,  9, $0d, $01, $00
	warp_event  5,  3, $0d, $02, $00
	events_end

MapEvents_010_5059:
	warp_event 13,  7, $0c, $02, $00
	warp_event  5,  8, $0c, $03, $00
	warp_event  5,  3, $0c, $04, $00
	warp_event  3, 18, $0e, $00, $00
	warp_event 21, 16, $0e, $01, $00
	events_end

MapEvents_010_5078:
	warp_event  2, 18, $0d, $03, $00
	warp_event 21, 16, $0d, $04, $00
	script_event ABSOLUTE, 12, 18, Script_04e_4419
	events_end

MapEvents_010_508b:
	warp_event ABSOLUTE,  9, $07, $06, $00
	event_07  2,  2, $03
	events_end

MapEvents_010_5098:
	warp_event ABSOLUTE,  9, $07, $00, $00
	warp_event  5,  3, $11, $00, $00
	warp_event  6,  3, $11, $00, $00
	events_end

MapEvents_010_50ab:
	warp_event ABSOLUTE,  9, $10, $01, $00
	events_end

MapEvents_010_50b2:
	warp_event 16,  4, $06, $01, $00
	warp_event  4,  4, $13, $00, $00
	warp_event 13, 14, $14, $00, $00
	events_end

MapEvents_010_50c5:
	warp_event ABSOLUTE,  9, $12, $01, $00
	events_end

MapEvents_010_50cc:
	warp_event ABSOLUTE,  9, $12, $02, $00
	events_end

MapEvents_010_50d3:
	warp_event ABSOLUTE,  0, $07, $02, $00
	signpost_event  6,  4, $04
	events_end

MapEvents_010_50e0:
	warp_event 23, ABSOLUTE, $07, $01, $00
	script_event ABSOLUTE,  0,  0, Script_04f_4d6f
	events_end

MapEvents_010_50ed:
	warp_event  4,  8, $07, $05, $00
	warp_event  5,  8, $07, $05, $00
	event_07  9,  3, $04
	events_end

MapEvents_010_5100:
	warp_event  3,  8, $07, $03, $00
	warp_event  4,  8, $07, $03, $00
	event_07  9,  3, $05
	events_end

MapEvents_010_5113:
	warp_event  7,  8, $07, $0b, $00
	warp_event  8,  8, $07, $0b, $00
	event_07  3,  3, $06
	events_end

MapEvents_010_5126:
	warp_event  5,  8, $07, $09, $00
	warp_event  6,  8, $07, $09, $00
	event_07  6,  3, $07
	events_end

MapEvents_010_5139:
	warp_event  7,  8, $07, $0a, $00
	warp_event  8,  8, $07, $0a, $00
	event_07  2,  3, $09
	events_end

MapEvents_010_514c:
	warp_event  3,  8, $07, $07, $00
	warp_event  4,  8, $07, $07, $00
	event_07  8,  3, $08
	events_end

MapEvents_010_515f:
	warp_event  5,  8, $07, $08, $00
	warp_event  6,  8, $07, $08, $00
	event_04  4,  4,  0, Script_04f_4051
	event_04  8,  4,  0, Script_04f_405f
	events_end

MapEvents_010_5178:
	warp_event  5,  8, $07, $0c, $00
	warp_event  6,  8, $07, $0c, $00
	event_04  4,  3,  0, Script_04f_4020
	events_end

MapEvents_010_518b:
	warp_event ABSOLUTE, 15, $01, $02, $00
	events_end

MapEvents_010_5192:
	warp_event ABSOLUTE, 15, $04, $02, $00
	events_end

MapEvents_010_5199:
	warp_event 16,  4, $03, $01, $00
	warp_event  4,  4, $22, $00, $00
	warp_event 13, 14, $23, $00, $00
	events_end

MapEvents_010_51ac:
	warp_event ABSOLUTE,  9, $21, $01, $00
	events_end

MapEvents_010_51b3:
	warp_event ABSOLUTE,  9, $21, $02, $00
	events_end
