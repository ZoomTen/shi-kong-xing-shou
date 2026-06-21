Func_02f_4000:
	ld de, Pointers_02f_4099
	ld a, [wd98f]
	jr Func_02f_400e
Func_02f_4008:
	ld de, Pointers_02f_4099
	ld a, [wBattleAnimID]
Func_02f_400e:
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $A0
	ld b, $20
	call LoadPalettes_OCPD
	ld a, [wBattleAnimID]
	cp BATTLE_ANIM_BANK_1_START
	jr c, .bank0
	cp BATTLE_ANIM_BANK_2_START
	jr c, .bank1
	cp BATTLE_ANIM_BANK_3_START
	jr c, .bank2
	cp BATTLE_ANIM_BANK_4_START
	jr c, .bank3
	cp BATTLE_ANIM_BANK_5_START
	jr c, .bank4
	cp BATTLE_ANIM_BANK_6_START
	jr c, .bank5
	cp BATTLE_ANIM_BANK_7_START
	jr c, .bank6
	cp BATTLE_ANIM_BANK_8_START
	jr c, .bank7
	cp BATTLE_ANIM_BANK_9_START
	jr c, .bank8
	farcall LoadBattleAnimGFX_049
	ret
.bank8
	farcall LoadBattleAnimGFX_048
	ret
.bank7
	farcall LoadBattleAnimGFX_03e
	ret
.bank6
	farcall LoadBattleAnimGFX_03d
	ret
.bank5
	farcall LoadBattleAnimGFX_037
	ret
.bank4
	farcall LoadBattleAnimGFX_036
	ret
.bank3
	farcall LoadBattleAnimGFX_035
	ret
.bank2
	farcall LoadBattleAnimGFX_034
	ret
.bank1
	farcall LoadBattleAnimGFX_031
	ret
.bank0
	ld de, Pointers_02f_4613
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, vTiles0
	call CopyBytesVRAM
	ret

Pointers_02f_4099:
	dw Palette_02f_41bb
	dw Palette_02f_41bb
	dw Palette_02f_41cb
	dw Palette_02f_41e3
	dw Palette_02f_41eb
	dw Palette_02f_41f3
	dw Palette_02f_41fb
	dw Palette_02f_4203
	dw Palette_02f_4213
	dw Palette_02f_421b
	dw Palette_02f_4223
	dw Palette_02f_422b
	dw Palette_02f_4233
	dw Palette_02f_423b
	dw Palette_02f_4243
	dw Palette_02f_424b
	dw Palette_02f_4253
	dw Palette_02f_425b
	dw Palette_02f_4263
	dw Palette_02f_426b
	dw Palette_02f_4273
	dw Palette_02f_4253
	dw Palette_02f_427b
	dw Palette_02f_4283
	dw Palette_02f_4283
	dw Palette_02f_428b
	dw Palette_02f_4293
	dw Palette_02f_429b
	dw Palette_02f_42a3
	dw Palette_02f_42ab
	dw Palette_02f_42bb
	dw Palette_02f_42bb
	dw Palette_02f_42bb
	dw Palette_02f_42c3
	dw Palette_02f_42a3
	dw Palette_02f_42cb
	dw Palette_02f_42d3
	dw Palette_02f_42e3
	dw Palette_02f_42eb
	dw Palette_02f_42fb
	dw Palette_02f_4303
	dw Palette_02f_430b
	dw Palette_02f_4313
	dw Palette_02f_431b
	dw Palette_02f_4323
	dw Palette_02f_432b
	dw Palette_02f_4333
	dw Palette_02f_433b
	dw Palette_02f_434b
	dw Palette_02f_4353
	dw Palette_02f_435b
	dw Palette_02f_4363
	dw Palette_02f_436b
	dw Palette_02f_4373
	dw Palette_02f_437b
	dw Palette_02f_4383
	dw Palette_02f_4393
	dw Palette_02f_439b
	dw Palette_02f_43a3
	dw Palette_02f_43ab
	dw Palette_02f_43b3
	dw Palette_02f_43bb
	dw Palette_02f_43c3
	dw Palette_02f_43cb
	dw Palette_02f_43d3
	dw Palette_02f_43d3
	dw Palette_02f_43d3
	dw Palette_02f_43d3
	dw Palette_02f_43d3
	dw Palette_02f_43d3
	dw Palette_02f_43db
	dw Palette_02f_43e3
	dw Palette_02f_43e3
	dw Palette_02f_43e3
	dw Palette_02f_43e3
	dw Palette_02f_43eb
	dw Palette_02f_43e3
	dw Palette_02f_43eb
	dw Palette_02f_43eb
	dw Palette_02f_43eb
	dw Palette_02f_43f3
	dw Palette_02f_43f3
	dw Palette_02f_43f3
	dw Palette_02f_43f3
	dw Palette_02f_43f3
	dw Palette_02f_43f3
	dw Palette_02f_43f3
	dw Palette_02f_43fb
	dw Palette_02f_43fb
	dw Palette_02f_4403
	dw Palette_02f_440b
	dw Palette_02f_4413
	dw Palette_02f_441b
	dw Palette_02f_4423
	dw Palette_02f_442b
	dw Palette_02f_4433
	dw Palette_02f_443b
	dw Palette_02f_444b
	dw Palette_02f_4453
	dw Palette_02f_446b
	dw Palette_02f_4473
	dw Palette_02f_4483
	dw Palette_02f_448b
	dw Palette_02f_4493
	dw Palette_02f_449b
	dw Palette_02f_44ab
	dw Palette_02f_44bb
	dw Palette_02f_44c3
	dw Palette_02f_44cb
	dw Palette_02f_44d3
	dw Palette_02f_44e3
	dw Palette_02f_44f3
	dw Palette_02f_44fb
	dw Palette_02f_4503
	dw Palette_02f_450b
	dw Palette_02f_4513
	dw Palette_02f_451b
	dw Palette_02f_4523
	dw Palette_02f_452b
	dw Palette_02f_453b
	dw Palette_02f_4543
	dw Palette_02f_454b
	dw Palette_02f_455b
	dw Palette_02f_455b
	dw Palette_02f_4563
	dw Palette_02f_456b
	dw Palette_02f_4573
	dw Palette_02f_4583
	dw Palette_02f_458b
	dw Palette_02f_4593
	dw Palette_02f_459b
	dw Palette_02f_45a3
	dw Palette_02f_45ab
	dw Palette_02f_45bb
	dw Palette_02f_45c3
	dw Palette_02f_45cb
	dw Palette_02f_45cb
	dw Palette_02f_45d3
	dw Palette_02f_45eb
	dw Palette_02f_45f3
	dw Palette_02f_45fb
	dw Palette_02f_42bb
	dw Palette_02f_42bb
	dw Palette_02f_4603
	dw Palette_02f_460b

Palette_02f_41bb:
	RGB 0, 21, 21
	RGB 31, 25, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 0, 21, 21
	RGB 16, 28, 31
	RGB 0, 17, 31
	RGB 0, 0, 0
Palette_02f_41cb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 11, 8
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 31, 4
	RGB 21, 21, 0
	RGB 9, 9, 0
	RGB 0, 21, 21
	RGB 31, 25, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
Palette_02f_41e3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 24, 31
	RGB 0, 0, 0
Palette_02f_41eb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 18, 18
	RGB 15, 0, 0
Palette_02f_41f3:
	RGB 0, 19, 19
	RGB 31, 21, 0
	RGB 31, 0, 0
	RGB 14, 0, 0
Palette_02f_41fb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 25, 31
	RGB 0, 0, 21
Palette_02f_4203:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 5, 19, 6
	RGB 3, 11, 3
	RGB 0, 21, 21
	RGB 16, 28, 31
	RGB 0, 17, 31
	RGB 0, 0, 0
Palette_02f_4213:
	RGB 0, 19, 19
	RGB 29, 29, 31
	RGB 21, 21, 26
	RGB 12, 12, 18
Palette_02f_421b:
	RGB 0, 19, 19
	RGB 31, 21, 13
	RGB 26, 3, 0
	RGB 0, 0, 0
Palette_02f_4223:
	RGB 0, 19, 19
	RGB 17, 26, 31
	RGB 0, 0, 13
	RGB 0, 0, 0
Palette_02f_422b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 25, 0
	RGB 18, 10, 0
Palette_02f_4233:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 24, 14, 8
	RGB 14, 7, 2
Palette_02f_423b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 24, 0
	RGB 25, 6, 0
Palette_02f_4243:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 16, 27, 0
	RGB 0, 11, 0
Palette_02f_424b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 6, 0
	RGB 0, 0, 0
Palette_02f_4253:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 14, 28
	RGB 14, 5, 15
Palette_02f_425b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 0, 0
Palette_02f_4263:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 22, 10, 31
	RGB 7, 1, 15
Palette_02f_426b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 21, 31
	RGB 22, 0, 22
Palette_02f_4273:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 22, 31
	RGB 0, 14, 31
Palette_02f_427b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_4283:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 17, 0
Palette_02f_428b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 0, 0
	RGB 11, 0, 0
Palette_02f_4293:
	RGB 0, 19, 19
	RGB 17, 26, 31
	RGB 0, 0, 13
	RGB 0, 0, 0
Palette_02f_429b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 7, 28
	RGB 14, 0, 13
Palette_02f_42a3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_42ab:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 18, 0
	RGB 0, 7, 0
	RGB 0, 19, 19
	RGB 31, 31, 4
	RGB 21, 21, 0
	RGB 9, 9, 0
Palette_02f_42bb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 10, 27
Palette_02f_42c3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 28, 0
	RGB 31, 17, 0
Palette_02f_42cb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 15, 0
	RGB 16, 0, 0
Palette_02f_42d3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 14, 0
	RGB 31, 0, 0
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 25, 0
	RGB 20, 0, 20
Palette_02f_42e3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 26, 21, 26
	RGB 19, 14, 19
Palette_02f_42eb:
	RGB 0, 21, 21
	RGB 31, 25, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 0, 21, 21
	RGB 16, 28, 31
	RGB 0, 17, 31
	RGB 0, 0, 0
Palette_02f_42fb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 13, 31
	RGB 0, 9, 21
Palette_02f_4303:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 15, 0
	RGB 20, 7, 0
Palette_02f_430b:
	RGB 0, 19, 19
	RGB 17, 26, 31
	RGB 0, 0, 13
	RGB 0, 0, 0
Palette_02f_4313:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_431b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_4323:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 10, 27
Palette_02f_432b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_4333:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 6, 0
Palette_02f_433b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 7, 28
	RGB 14, 0, 13
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_434b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 15, 0
	RGB 20, 7, 0
Palette_02f_4353:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 0, 0
	RGB 11, 0, 0
Palette_02f_435b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 26, 21, 26
	RGB 19, 14, 19
Palette_02f_4363:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_436b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 16, 25, 0
	RGB 0, 12, 0
Palette_02f_4373:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 6, 0
Palette_02f_437b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 16, 25, 0
	RGB 0, 12, 0
Palette_02f_4383:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 6, 0
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 21, 17
	RGB 20, 9, 9
Palette_02f_4393:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 26, 21, 26
	RGB 19, 14, 19
Palette_02f_439b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 6, 0
Palette_02f_43a3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 21, 17
	RGB 20, 9, 9
Palette_02f_43ab:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_43b3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_43bb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 17, 0
	RGB 28, 0, 0
Palette_02f_43c3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 25, 0
	RGB 0, 12, 0
Palette_02f_43cb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 17, 0
	RGB 28, 0, 0
Palette_02f_43d3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 17, 0
	RGB 28, 0, 0
Palette_02f_43db:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 7, 28
	RGB 14, 0, 13
Palette_02f_43e3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 10, 27
Palette_02f_43eb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 0, 22
Palette_02f_43f3:
	RGB 0, 19, 19
	RGB 31, 24, 13
	RGB 15, 10, 5
	RGB 4, 0, 0
Palette_02f_43fb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 10, 27
Palette_02f_4403:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 0, 22
Palette_02f_440b:
	RGB 10, 10, 10
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 0, 0
Palette_02f_4413:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 0, 22
Palette_02f_441b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 10, 27
Palette_02f_4423:
	RGB 0, 19, 19
	RGB 16, 27, 0
	RGB 0, 12, 0
	RGB 0, 0, 0
Palette_02f_442b:
	RGB 0, 19, 19
	RGB 16, 26, 15
	RGB 5, 13, 4
	RGB 0, 0, 0
Palette_02f_4433:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 19, 14, 19
	RGB 11, 7, 11
Palette_02f_443b:
	RGB 0, 19, 19
	RGB 16, 26, 15
	RGB 5, 13, 4
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 0, 0
	RGB 11, 0, 0
Palette_02f_444b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 17, 0
Palette_02f_4453:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 0, 22
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 17, 0
	RGB 28, 0, 0
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 7, 28
	RGB 14, 0, 13
Palette_02f_446b:
	RGB 0, 19, 19
	RGB 31, 20, 20
	RGB 22, 7, 7
	RGB 11, 3, 3
Palette_02f_4473:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 17, 0
	RGB 28, 0, 0
	RGB 0, 21, 21
	RGB 16, 28, 31
	RGB 0, 17, 31
	RGB 0, 0, 0
Palette_02f_4483:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 14, 0
	RGB 31, 0, 0
Palette_02f_448b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 7, 28
	RGB 14, 0, 13
Palette_02f_4493:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 29, 20, 20
	RGB 16, 7, 7
Palette_02f_449b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 13, 31
	RGB 0, 2, 13
	RGB 0, 19, 19
	RGB 31, 31, 4
	RGB 21, 21, 0
	RGB 9, 9, 0
Palette_02f_44ab:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 13, 31
	RGB 0, 2, 13
	RGB 0, 19, 19
	RGB 31, 31, 4
	RGB 21, 21, 0
	RGB 9, 9, 0
Palette_02f_44bb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 0, 0
Palette_02f_44c3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 15, 31
	RGB 0, 0, 0
Palette_02f_44cb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 19, 14, 19
	RGB 9, 4, 8
Palette_02f_44d3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 18, 0
	RGB 0, 7, 0
	RGB 0, 21, 21
	RGB 16, 28, 31
	RGB 0, 17, 31
	RGB 0, 0, 0
Palette_02f_44e3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 25, 0
	RGB 20, 0, 20
	RGB 0, 19, 19
	RGB 31, 31, 4
	RGB 21, 21, 0
	RGB 9, 9, 0
Palette_02f_44f3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 14, 0
	RGB 31, 0, 0
Palette_02f_44fb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 19, 14, 19
	RGB 9, 4, 8
Palette_02f_4503:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 15, 31
	RGB 0, 0, 0
Palette_02f_450b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 13, 31
	RGB 0, 9, 21
Palette_02f_4513:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 22, 22, 0
	RGB 8, 8, 0
Palette_02f_451b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 7, 28
	RGB 14, 0, 13
Palette_02f_4523:
	RGB 0, 19, 19
	RGB 26, 22, 18
	RGB 23, 16, 0
	RGB 11, 5, 0
Palette_02f_452b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 15, 31
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 0, 0
	RGB 11, 0, 0
Palette_02f_453b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 22, 22, 0
	RGB 8, 8, 0
Palette_02f_4543:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 15, 0
Palette_02f_454b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 17, 0
	RGB 31, 0, 0
	RGB 0, 19, 19
	RGB 31, 16, 0
	RGB 31, 3, 0
	RGB 8, 0, 0
Palette_02f_455b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 31, 16, 0
Palette_02f_4563:
	RGB 0, 19, 19
	RGB 21, 31, 22
	RGB 0, 22, 0
	RGB 0, 8, 0
Palette_02f_456b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 22, 0
	RGB 0, 11, 0
Palette_02f_4573:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 16, 0, 0
	RGB 0, 0, 0
Palette_02f_4583:
	RGB 0, 19, 19
	RGB 31, 16, 0
	RGB 31, 3, 0
	RGB 8, 0, 0
Palette_02f_458b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 22, 22, 0
	RGB 8, 8, 0
Palette_02f_4593:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 28, 7, 28
	RGB 14, 0, 13
Palette_02f_459b:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 22, 0
	RGB 0, 11, 0
Palette_02f_45a3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 19, 14, 19
	RGB 3, 0, 3
Palette_02f_45ab:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 15, 31
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 30, 25, 19
	RGB 24, 18, 11
	RGB 8, 4, 0
Palette_02f_45bb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_45c3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
Palette_02f_45cb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_45d3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 19, 14, 19
	RGB 3, 0, 3
	RGB 0, 19, 19
	RGB 31, 31, 4
	RGB 21, 21, 0
	RGB 9, 9, 0
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 0, 31
	RGB 31, 0, 0
Palette_02f_45eb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 27, 0, 0
Palette_02f_45f3:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 8, 20, 30
	RGB 0, 10, 27
Palette_02f_45fb:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 0, 20, 31
	RGB 0, 0, 22
Palette_02f_4603:
	RGB 0, 19, 19
	RGB 31, 31, 31
	RGB 16, 27, 0
	RGB 0, 11, 0
Palette_02f_460b:
	RGB 0, 19, 19
	RGB 31, 31, 0
	RGB 31, 0, 0
	RGB 15, 0, 0

Pointers_02f_4613:
	dw SubImage_02f_4633
	dw SubImage_02f_4633
	dw SubImage_02f_47d5
	dw SubImage_02f_49d7
	dw SubImage_02f_4cd9
	dw SubImage_02f_531b
	dw SubImage_02f_59dd
	dw SubImage_02f_5e1f
	dw SubImage_02f_5ee1
	dw SubImage_02f_65a3
	dw SubImage_02f_6cc5
	dw SubImage_02f_6f87
	dw SubImage_02f_7309
	dw SubImage_02f_74cb
	dw SubImage_02f_794d
	dw SubImage_02f_7b0f
SubImage_02f_4633:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_4633.2bpp"
.e

SubImage_02f_47d5:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_47d5.2bpp"
.e

SubImage_02f_49d7:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_49d7.2bpp"
.e

SubImage_02f_4cd9:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_4cd9.2bpp"
.e

SubImage_02f_531b:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_531b.2bpp"
.e

SubImage_02f_59dd:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_59dd.2bpp"
.e

SubImage_02f_5e1f:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_5e1f.2bpp"
.e

SubImage_02f_5ee1:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_5ee1.2bpp"
.e

SubImage_02f_65a3:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_65a3.2bpp"
.e

SubImage_02f_6cc5:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_6cc5.2bpp"
.e

SubImage_02f_6f87:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_6f87.2bpp"
.e

SubImage_02f_7309:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_7309.2bpp"
.e

SubImage_02f_74cb:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_74cb.2bpp"
.e

SubImage_02f_794d:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_794d.2bpp"
.e

SubImage_02f_7b0f:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_2f_7b0f.2bpp"
.e
