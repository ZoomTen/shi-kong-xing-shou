Func_03f_4000:
	ld hl, wd1a0
.asm_4003
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_40c8
	ld [wd0c1], a
	ld de, BattleAnimObjectOam_Pointers
	ld a, [wBattleAnimID]
	sub $63
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wd0c1]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $C0
.asm_4032
	ld a, [hli]
	cp $FF
	jp z, .asm_40c4
	add c
	ld [de], a
	inc de
	ld a, [wd986]
	and a
	jr nz, .asm_4079
	ld a, [wBattleAnimID]
	cp $75
	jr z, .asm_4079
	cp $79
	jr z, .asm_4079
	cp $7A
	jr z, .asm_4079
	cp $7B
	jr z, .asm_4079
	cp $7D
	jr z, .asm_4079
	cp $7F
	jr z, .asm_4079
	cp $80
	jr z, .asm_4079
	cp $85
	jr z, .asm_4079
	cp $89
	jr z, .asm_4079
	cp $8A
	jr z, .asm_4079
	cp $8B
	jr z, .asm_4079
	cp $8C
	jr z, .asm_4079
	inc hl
	ld a, [hli]
	add b
	jr .asm_407c
.asm_4079
	ld a, [hli]
	add b
	inc hl
.asm_407c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wd986]
	and a
	jr nz, .asm_40c0
	ld a, [wBattleAnimID]
	cp $75
	jr z, .asm_40c0
	cp $79
	jr z, .asm_40c0
	cp $7A
	jr z, .asm_40c0
	cp $7B
	jr z, .asm_40c0
	cp $7D
	jr z, .asm_40c0
	cp $7F
	jr z, .asm_40c0
	cp $80
	jr z, .asm_40c0
	cp $85
	jr z, .asm_40c0
	cp $89
	jr z, .asm_40c0
	cp $8A
	jr z, .asm_40c0
	cp $8B
	jr z, .asm_40c0
	cp $8C
	jr z, .asm_40c0
	ld a, [de]
	or $20
	ld [de], a
.asm_40c0
	inc de
	jp .asm_4032
.asm_40c4
	ld a, e
	ld [wd1fb], a
.asm_40c8
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	jp .asm_4003
BattleAnimObjectOam_Pointers:
	dw BattleAnimObjectOamFrames_3f_4130
	dw BattleAnimObjectOamFrames_3f_4284
	dw BattleAnimObjectOamFrames_3f_4284
	dw BattleAnimObjectOamFrames_3f_4284
	dw BattleAnimObjectOamFrames_3f_43b5
	dw BattleAnimObjectOamFrames_3f_4438
	dw BattleAnimObjectOamFrames_3f_453e
	dw BattleAnimObjectOamFrames_3f_4661
	dw BattleAnimObjectOamFrames_3f_47ee
	dw BattleAnimObjectOamFrames_3f_4919
	dw BattleAnimObjectOamFrames_3f_4a27
	dw BattleAnimObjectOamFrames_3f_4a27
	dw BattleAnimObjectOamFrames_3f_4a27
	dw BattleAnimObjectOamFrames_3f_4961
	dw BattleAnimObjectOamFrames_3f_4a27
	dw BattleAnimObjectOamFrames_3f_4a5d
	dw BattleAnimObjectOamFrames_3f_4ad0
	dw BattleAnimObjectOamFrames_3f_4b44
	dw BattleAnimObjectOamFrames_3f_4c3a
	dw BattleAnimObjectOamFrames_3f_4d10
	dw BattleAnimObjectOamFrames_3f_4e9d
	dw BattleAnimObjectOamFrames_3f_506c
	dw BattleAnimObjectOamFrames_3f_50b7
	dw BattleAnimObjectOamFrames_3f_517f
	dw BattleAnimObjectOamFrames_3f_517f
	dw BattleAnimObjectOamFrames_3f_5329
	dw BattleAnimObjectOamFrames_3f_538e
	dw BattleAnimObjectOamFrames_3f_5442
	dw BattleAnimObjectOamFrames_3f_55e3
	dw BattleAnimObjectOamFrames_3f_5767
	dw BattleAnimObjectOamFrames_3f_5896
	dw BattleAnimObjectOamFrames_3f_58f5
	dw BattleAnimObjectOamFrames_3f_5a7a
	dw BattleAnimObjectOamFrames_3f_5b5c
	dw BattleAnimObjectOamFrames_3f_5c33
	dw BattleAnimObjectOamFrames_3f_5d84
	dw BattleAnimObjectOamFrames_3f_5ec6
	dw BattleAnimObjectOamFrames_3f_5ec6
	dw BattleAnimObjectOamFrames_3f_5f75
	dw BattleAnimObjectOamFrames_3f_601d
	dw BattleAnimObjectOamFrames_3f_6092
	dw BattleAnimObjectOamFrames_3f_63e5
	dw BattleAnimObjectOamFrames_3f_6660
	dw BattleAnimObjectOamFrames_3f_6660
	dw BattleAnimObjectOamFrames_3f_66e3
	dw BattleAnimObjectOamFrames_3f_679e
BattleAnimObjectOamFrames_3f_4130:
	dr $fc130, $fc13e
BattleAnimObjectOam_3f_413e:
	dr $fc13e, $fc284
BattleAnimObjectOamFrames_3f_4284:
	dr $fc284, $fc292
BattleAnimObjectOam_3f_4292:
	dr $fc292, $fc3b5
BattleAnimObjectOamFrames_3f_43b5:
	dr $fc3b5, $fc3bd
BattleAnimObjectOam_3f_43bd:
	dr $fc3bd, $fc438
BattleAnimObjectOamFrames_3f_4438:
	dr $fc438, $fc444
BattleAnimObjectOam_3f_4444:
	dr $fc444, $fc53e
BattleAnimObjectOamFrames_3f_453e:
	dr $fc53e, $fc54a
BattleAnimObjectOam_3f_454a:
	dr $fc54a, $fc661
BattleAnimObjectOamFrames_3f_4661:
	dr $fc661, $fc66d
BattleAnimObjectOam_3f_466d:
	dr $fc66d, $fc7ee
BattleAnimObjectOamFrames_3f_47ee:
	dr $fc7ee, $fc7f8
BattleAnimObjectOam_3f_47f8:
	dr $fc7f8, $fc919
BattleAnimObjectOamFrames_3f_4919:
	dr $fc919, $fc923
BattleAnimObjectOam_3f_4923:
	dr $fc923, $fc961
BattleAnimObjectOamFrames_3f_4961:
	dr $fc961, $fc971
BattleAnimObjectOam_3f_4971:
	dr $fc971, $fca27
BattleAnimObjectOamFrames_3f_4a27:
	dr $fca27, $fca31
BattleAnimObjectOam_3f_4a31:
	dr $fca31, $fca5d
BattleAnimObjectOamFrames_3f_4a5d:
	dr $fca5d, $fca69
BattleAnimObjectOam_3f_4a69:
	dr $fca69, $fcad0
BattleAnimObjectOamFrames_3f_4ad0:
	dr $fcad0, $fcad8
BattleAnimObjectOam_3f_4ad8:
	dr $fcad8, $fcb44
BattleAnimObjectOamFrames_3f_4b44:
	dr $fcb44, $fcb4c
BattleAnimObjectOam_3f_4b4c:
	dr $fcb4c, $fcc3a
BattleAnimObjectOamFrames_3f_4c3a:
	dr $fcc3a, $fcc44
BattleAnimObjectOam_3f_4c44:
	dr $fcc44, $fcd10
BattleAnimObjectOamFrames_3f_4d10:
	dr $fcd10, $fcd26
BattleAnimObjectOam_3f_4d26:
	dr $fcd26, $fce9d
BattleAnimObjectOamFrames_3f_4e9d:
	dr $fce9d, $fcead
BattleAnimObjectOam_3f_4ead:
	dr $fcead, $fd06c
BattleAnimObjectOamFrames_3f_506c:
	dr $fd06c, $fd078
BattleAnimObjectOam_3f_5078:
	dr $fd078, $fd0b7
BattleAnimObjectOamFrames_3f_50b7:
	dr $fd0b7, $fd0c5
BattleAnimObjectOam_3f_50c5:
	dr $fd0c5, $fd17f
BattleAnimObjectOamFrames_3f_517f:
	dr $fd17f, $fd191
BattleAnimObjectOam_3f_5191:
	dr $fd191, $fd329
BattleAnimObjectOamFrames_3f_5329:
	dr $fd329, $fd331
BattleAnimObjectOam_3f_5331:
	dr $fd331, $fd38e
BattleAnimObjectOamFrames_3f_538e:
	dr $fd38e, $fd39c
BattleAnimObjectOam_3f_539c:
	dr $fd39c, $fd442
BattleAnimObjectOamFrames_3f_5442:
	dr $fd442, $fd458
BattleAnimObjectOam_3f_5458:
	dr $fd458, $fd5e3
BattleAnimObjectOamFrames_3f_55e3:
	dr $fd5e3, $fd5f3
BattleAnimObjectOam_3f_55f3:
	dr $fd5f3, $fd767
BattleAnimObjectOamFrames_3f_5767:
	dr $fd767, $fd777
BattleAnimObjectOam_3f_5777:
	dr $fd777, $fd896
BattleAnimObjectOamFrames_3f_5896:
	dr $fd896, $fd8a4
BattleAnimObjectOam_3f_58a4:
	dr $fd8a4, $fd8f5
BattleAnimObjectOamFrames_3f_58f5:
	dr $fd8f5, $fd909
BattleAnimObjectOam_3f_5909:
	dr $fd909, $fda7a
BattleAnimObjectOamFrames_3f_5a7a:
	dr $fda7a, $fda86
BattleAnimObjectOam_3f_5a86:
	dr $fda86, $fdb5c
BattleAnimObjectOamFrames_3f_5b5c:
	dr $fdb5c, $fdb6a
BattleAnimObjectOam_3f_5b6a:
	dr $fdb6a, $fdc33
BattleAnimObjectOamFrames_3f_5c33:
	dr $fdc33, $fdc3f
BattleAnimObjectOam_3f_5c3f:
	dr $fdc3f, $fdd84
BattleAnimObjectOamFrames_3f_5d84:
	dr $fdd84, $fdd90
BattleAnimObjectOam_3f_5d90:
	dr $fdd90, $fdec6
BattleAnimObjectOamFrames_3f_5ec6:
	dr $fdec6, $fded4
BattleAnimObjectOam_3f_5ed4:
	dr $fded4, $fdf75
BattleAnimObjectOamFrames_3f_5f75:
	dr $fdf75, $fdf7b
BattleAnimObjectOam_3f_5f7b:
	dr $fdf7b, $fe01d
BattleAnimObjectOamFrames_3f_601d:
	dr $fe01d, $fe029
BattleAnimObjectOam_3f_6029:
	dr $fe029, $fe092
BattleAnimObjectOamFrames_3f_6092:
	dr $fe092, $fe0b8
BattleAnimObjectOam_3f_60b8:
	dr $fe0b8, $fe3e5
BattleAnimObjectOamFrames_3f_63e5:
	dr $fe3e5, $fe3f3
BattleAnimObjectOam_3f_63f3:
	dr $fe3f3, $fe660
BattleAnimObjectOamFrames_3f_6660:
	dr $fe660, $fe668
BattleAnimObjectOam_3f_6668:
	dr $fe668, $fe6e3
BattleAnimObjectOamFrames_3f_66e3:
	dr $fe6e3, $fe6ef
BattleAnimObjectOam_3f_66ef:
	dr $fe6ef, $fe79e
BattleAnimObjectOamFrames_3f_679e:
	dr $fe79e, $fe7a8
BattleAnimObjectOam_3f_67a8:
	dr $fe7a8, $fe850


