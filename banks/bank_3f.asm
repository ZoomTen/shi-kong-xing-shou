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
	dw BattleAnimObjectOam_3f_413e
	dw BattleAnimObjectOam_3f_413e
	dw BattleAnimObjectOam_3f_4149
	dw BattleAnimObjectOam_3f_4172
	dw BattleAnimObjectOam_3f_41af
	dw BattleAnimObjectOam_3f_4200
	dw BattleAnimObjectOam_3f_4251
BattleAnimObjectOam_3f_413e:
	db $08, $08, $10, $00, $04
	db $08, $10, $08, $02, $04
	db $ff
BattleAnimObjectOam_3f_4149:
	db $08, $08, $20, $04, $04
	db $08, $10, $18, $06, $04
	db $08, $18, $10, $08, $04
	db $08, $20, $08, $0a, $04
	db $18, $08, $20, $0c, $04
	db $18, $10, $18, $0e, $04
	db $18, $18, $10, $10, $04
	db $18, $20, $08, $12, $04
	db $ff
BattleAnimObjectOam_3f_4172:
	db $08, $00, $28, $14, $04
	db $08, $08, $20, $16, $04
	db $08, $10, $18, $18, $04
	db $08, $18, $10, $1a, $04
	db $08, $20, $08, $1c, $04
	db $08, $28, $00, $1e, $04
	db $18, $00, $28, $20, $04
	db $18, $08, $20, $22, $04
	db $18, $10, $18, $24, $04
	db $18, $18, $10, $26, $04
	db $18, $20, $08, $28, $04
	db $18, $28, $00, $2a, $04
	db $ff
BattleAnimObjectOam_3f_41af:
	db $00, $00, $28, $2c, $04
	db $00, $08, $20, $2e, $04
	db $00, $10, $18, $30, $04
	db $00, $20, $08, $32, $04
	db $00, $28, $00, $34, $04
	db $10, $00, $28, $36, $04
	db $10, $08, $20, $38, $04
	db $10, $10, $18, $3a, $04
	db $10, $18, $10, $3c, $04
	db $10, $20, $08, $3e, $04
	db $10, $28, $00, $40, $04
	db $20, $00, $28, $42, $04
	db $20, $08, $20, $44, $04
	db $20, $10, $18, $46, $04
	db $20, $18, $10, $48, $04
	db $20, $20, $08, $4a, $04
	db $ff
BattleAnimObjectOam_3f_4200:
	db $00, $00, $28, $4c, $04
	db $00, $08, $20, $4e, $04
	db $00, $10, $18, $50, $04
	db $00, $18, $10, $52, $04
	db $00, $20, $08, $54, $04
	db $10, $00, $28, $56, $04
	db $10, $08, $20, $58, $04
	db $10, $10, $18, $5a, $04
	db $10, $18, $10, $5c, $04
	db $10, $20, $08, $5e, $04
	db $10, $28, $00, $60, $04
	db $20, $00, $28, $62, $04
	db $20, $08, $20, $64, $04
	db $20, $10, $18, $66, $04
	db $20, $18, $10, $68, $04
	db $20, $20, $08, $6a, $04
	db $ff
BattleAnimObjectOam_3f_4251:
	db $00, $18, $10, $6c, $04
	db $00, $20, $08, $6e, $04
	db $10, $08, $20, $70, $04
	db $10, $10, $18, $72, $04
	db $10, $18, $10, $74, $04
	db $10, $20, $08, $76, $04
	db $10, $28, $00, $78, $04
	db $20, $08, $20, $7a, $04
	db $20, $10, $18, $7c, $04
	db $20, $18, $10, $7e, $04
	db $ff
BattleAnimObjectOamFrames_3f_4284:
	dw BattleAnimObjectOam_3f_4292
	dw BattleAnimObjectOam_3f_4292
	dw BattleAnimObjectOam_3f_42a7
	dw BattleAnimObjectOam_3f_42d5
	dw BattleAnimObjectOam_3f_431c
	dw BattleAnimObjectOam_3f_4363
	dw BattleAnimObjectOam_3f_4396
BattleAnimObjectOam_3f_4292:
	db $00, $00, $28, $00, $04
	db $00, $08, $20, $02, $04
	db $10, $00, $28, $04, $04
	db $10, $08, $20, $06, $04
	db $ff
BattleAnimObjectOam_3f_42a7:
	db $00, $00, $28, $08, $04
	db $00, $08, $20, $0a, $04
	db $00, $10, $18, $0c, $04
	db $10, $00, $28, $0e, $04
	db $10, $08, $20, $10, $04
	db $10, $10, $18, $12, $04
	db $20, $18, $10, $14, $04
	db $20, $20, $08, $16, $04
	db $20, $28, $00, $18, $04
	db $ff
BattleAnimObjectOam_3f_42d5:
	db $00, $00, $28, $1a, $04
	db $00, $08, $20, $1c, $04
	db $00, $10, $18, $1e, $04
	db $10, $00, $28, $20, $04
	db $10, $08, $20, $22, $04
	db $10, $10, $18, $24, $04
	db $10, $18, $10, $26, $04
	db $10, $20, $08, $28, $04
	db $20, $00, $28, $2a, $04
	db $20, $08, $20, $2c, $04
	db $20, $10, $18, $2e, $04
	db $20, $18, $10, $30, $04
	db $20, $20, $08, $32, $04
	db $20, $28, $00, $34, $04
	db $ff
BattleAnimObjectOam_3f_431c:
	db $00, $00, $28, $36, $04
	db $00, $08, $20, $38, $04
	db $00, $10, $18, $3a, $04
	db $10, $00, $28, $3c, $04
	db $10, $08, $20, $3e, $04
	db $10, $10, $18, $40, $04
	db $10, $18, $10, $42, $04
	db $10, $20, $08, $44, $04
	db $10, $28, $00, $46, $04
	db $20, $08, $20, $48, $04
	db $20, $10, $18, $4a, $04
	db $20, $18, $10, $4c, $04
	db $20, $20, $08, $4e, $04
	db $20, $28, $00, $50, $04
	db $ff
BattleAnimObjectOam_3f_4363:
	db $10, $08, $20, $52, $04
	db $10, $10, $18, $54, $04
	db $10, $18, $10, $56, $04
	db $10, $20, $08, $58, $04
	db $10, $28, $00, $5a, $04
	db $20, $08, $20, $5c, $04
	db $20, $10, $18, $5e, $04
	db $20, $18, $10, $60, $04
	db $20, $20, $08, $62, $04
	db $20, $28, $00, $64, $04
	db $ff
BattleAnimObjectOam_3f_4396:
	db $10, $08, $20, $66, $04
	db $10, $10, $18, $68, $04
	db $10, $18, $10, $6a, $04
	db $20, $08, $20, $6c, $04
	db $20, $10, $18, $6e, $04
	db $20, $18, $10, $70, $04
	db $ff
BattleAnimObjectOamFrames_3f_43b5:
	dw BattleAnimObjectOam_3f_43bd
	dw BattleAnimObjectOam_3f_43bd
	dw BattleAnimObjectOam_3f_43e6
	dw BattleAnimObjectOam_3f_4414
BattleAnimObjectOam_3f_43bd:
	db $00, $00, $20, $00, $04
	db $00, $08, $18, $02, $04
	db $00, $10, $10, $04, $04
	db $10, $00, $20, $06, $04
	db $10, $08, $18, $08, $04
	db $10, $10, $10, $0a, $04
	db $10, $18, $08, $0c, $04
	db $10, $20, $00, $0e, $04
	db $ff
BattleAnimObjectOam_3f_43e6:
	db $00, $08, $18, $10, $04
	db $00, $10, $10, $12, $04
	db $00, $18, $08, $14, $04
	db $00, $20, $00, $16, $04
	db $08, $00, $20, $18, $04
	db $10, $08, $18, $1a, $04
	db $10, $10, $10, $1c, $04
	db $10, $18, $08, $1e, $04
	db $10, $20, $00, $20, $04
	db $ff
BattleAnimObjectOam_3f_4414:
	db $00, $08, $18, $22, $04
	db $00, $10, $10, $24, $04
	db $00, $18, $08, $26, $04
	db $00, $20, $00, $28, $04
	db $08, $00, $20, $2a, $04
	db $10, $08, $18, $2c, $04
	db $10, $10, $10, $2e, $04
	db $ff
BattleAnimObjectOamFrames_3f_4438:
	dw BattleAnimObjectOam_3f_4444
	dw BattleAnimObjectOam_3f_4444
	dw BattleAnimObjectOam_3f_4463
	dw BattleAnimObjectOam_3f_4491
	dw BattleAnimObjectOam_3f_44ce
	dw BattleAnimObjectOam_3f_4515
BattleAnimObjectOam_3f_4444:
	db $20, $08, $10, $00, $04
	db $20, $10, $08, $02, $04
	db $30, $00, $18, $04, $04
	db $30, $08, $10, $06, $04
	db $30, $10, $08, $08, $04
	db $30, $18, $00, $0a, $04
	db $ff
BattleAnimObjectOam_3f_4463:
	db $10, $10, $08, $0c, $04
	db $20, $00, $18, $0e, $04
	db $20, $08, $10, $10, $04
	db $20, $10, $08, $12, $04
	db $20, $18, $00, $14, $04
	db $30, $00, $18, $16, $04
	db $30, $08, $10, $18, $04
	db $30, $10, $08, $1a, $04
	db $30, $18, $00, $1c, $04
	db $ff
BattleAnimObjectOam_3f_4491:
	db $10, $00, $18, $1e, $04
	db $10, $08, $10, $20, $04
	db $10, $10, $08, $22, $04
	db $10, $18, $00, $24, $04
	db $20, $00, $18, $26, $04
	db $20, $08, $10, $28, $04
	db $20, $10, $08, $2a, $04
	db $20, $18, $00, $2c, $04
	db $30, $00, $18, $2e, $04
	db $30, $08, $10, $30, $04
	db $30, $10, $08, $32, $04
	db $30, $18, $00, $34, $04
	db $ff
BattleAnimObjectOam_3f_44ce:
	db $00, $00, $18, $36, $04
	db $00, $08, $10, $38, $04
	db $00, $10, $08, $3a, $04
	db $00, $18, $00, $3c, $04
	db $10, $00, $18, $3e, $04
	db $10, $08, $10, $40, $04
	db $10, $10, $08, $42, $04
	db $10, $18, $00, $44, $04
	db $20, $00, $18, $46, $04
	db $20, $08, $10, $48, $04
	db $20, $10, $08, $4a, $04
	db $20, $18, $00, $4c, $04
	db $30, $08, $10, $4e, $04
	db $30, $10, $08, $50, $04
	db $ff
BattleAnimObjectOam_3f_4515:
	db $00, $08, $10, $52, $04
	db $00, $10, $08, $54, $04
	db $10, $08, $10, $56, $04
	db $10, $10, $08, $58, $04
	db $20, $08, $10, $5a, $04
	db $20, $10, $08, $5c, $04
	db $30, $08, $10, $5e, $04
	db $30, $10, $08, $60, $04
	db $ff
BattleAnimObjectOamFrames_3f_453e:
	dw BattleAnimObjectOam_3f_454a
	dw BattleAnimObjectOam_3f_454a
	dw BattleAnimObjectOam_3f_4591
	dw BattleAnimObjectOam_3f_45dd
	dw BattleAnimObjectOam_3f_462e
	dw BattleAnimObjectOam_3f_454a
BattleAnimObjectOam_3f_454a:
	db $08, $00, $38, $00, $04
	db $08, $08, $30, $02, $04
	db $08, $10, $28, $04, $04
	db $08, $18, $20, $06, $04
	db $08, $20, $18, $08, $04
	db $08, $28, $10, $0a, $04
	db $08, $30, $08, $0c, $04
	db $18, $00, $38, $0e, $04
	db $18, $08, $30, $10, $04
	db $18, $10, $28, $12, $04
	db $18, $18, $20, $14, $04
	db $18, $20, $18, $16, $04
	db $18, $28, $10, $18, $04
	db $18, $30, $08, $1a, $04
	db $ff
BattleAnimObjectOam_3f_4591:
	db $08, $00, $38, $1c, $04
	db $08, $08, $30, $1e, $04
	db $08, $10, $28, $20, $04
	db $08, $18, $20, $22, $04
	db $08, $20, $18, $24, $04
	db $08, $28, $10, $26, $04
	db $08, $30, $08, $28, $04
	db $08, $38, $00, $2a, $04
	db $18, $00, $38, $2c, $04
	db $18, $08, $30, $2e, $04
	db $18, $10, $28, $30, $04
	db $18, $18, $20, $32, $04
	db $18, $20, $18, $34, $04
	db $18, $28, $10, $36, $04
	db $18, $30, $08, $38, $04
	db $ff
BattleAnimObjectOam_3f_45dd:
	db $08, $00, $38, $3a, $04
	db $08, $08, $30, $3c, $04
	db $08, $10, $28, $3e, $04
	db $08, $18, $20, $40, $04
	db $08, $20, $18, $42, $04
	db $08, $28, $10, $44, $04
	db $08, $30, $08, $46, $04
	db $08, $38, $00, $48, $04
	db $18, $00, $38, $4a, $04
	db $18, $08, $30, $4c, $04
	db $18, $10, $28, $4e, $04
	db $18, $18, $20, $50, $04
	db $18, $20, $18, $52, $04
	db $18, $28, $10, $54, $04
	db $18, $30, $08, $56, $04
	db $18, $38, $00, $58, $04
	db $ff
BattleAnimObjectOam_3f_462e:
	db $08, $00, $38, $5a, $04
	db $08, $08, $30, $5c, $04
	db $08, $10, $28, $5e, $04
	db $08, $18, $20, $60, $04
	db $08, $20, $18, $62, $04
	db $18, $00, $38, $64, $04
	db $18, $08, $30, $66, $04
	db $18, $10, $28, $68, $04
	db $18, $18, $20, $6a, $04
	db $18, $20, $18, $6c, $04
	db $ff
BattleAnimObjectOamFrames_3f_4661:
	dw BattleAnimObjectOam_3f_466d
	dw BattleAnimObjectOam_3f_466d
	dw BattleAnimObjectOam_3f_46a0
	dw BattleAnimObjectOam_3f_46dd
	dw BattleAnimObjectOam_3f_4756
	dw BattleAnimObjectOam_3f_47b1
BattleAnimObjectOam_3f_466d:
	db $00, $18, $20, $00, $04
	db $00, $20, $18, $02, $04
	db $10, $08, $30, $04, $04
	db $10, $18, $20, $06, $04
	db $10, $20, $18, $08, $04
	db $10, $30, $08, $0a, $04
	db $20, $08, $30, $0c, $04
	db $20, $18, $20, $0e, $04
	db $20, $20, $18, $10, $04
	db $20, $30, $08, $12, $04
	db $ff
BattleAnimObjectOam_3f_46a0:
	db $00, $08, $30, $14, $04
	db $00, $18, $20, $16, $04
	db $00, $20, $18, $18, $04
	db $00, $30, $08, $1a, $04
	db $10, $08, $30, $1c, $04
	db $10, $18, $20, $1e, $04
	db $10, $20, $18, $20, $04
	db $10, $30, $08, $22, $04
	db $20, $08, $30, $24, $04
	db $20, $18, $20, $26, $04
	db $20, $20, $18, $28, $04
	db $20, $30, $08, $2a, $04
	db $ff
BattleAnimObjectOam_3f_46dd:
	db $00, $00, $38, $2c, $04
	db $00, $08, $30, $2e, $04
	db $00, $10, $28, $30, $04
	db $00, $18, $20, $32, $04
	db $00, $20, $18, $34, $04
	db $00, $28, $10, $36, $04
	db $00, $30, $08, $38, $04
	db $00, $38, $00, $3a, $04
	db $10, $00, $38, $3c, $04
	db $10, $08, $30, $3e, $04
	db $10, $10, $28, $40, $04
	db $10, $18, $20, $42, $04
	db $10, $20, $18, $44, $04
	db $10, $28, $10, $46, $04
	db $10, $30, $08, $48, $04
	db $10, $38, $00, $4a, $04
	db $20, $00, $38, $4c, $04
	db $20, $08, $30, $4e, $04
	db $20, $10, $28, $50, $04
	db $20, $18, $20, $52, $04
	db $20, $20, $18, $54, $04
	db $20, $28, $10, $56, $04
	db $20, $30, $08, $58, $04
	db $20, $38, $00, $5a, $04
	db $ff
BattleAnimObjectOam_3f_4756:
	db $00, $00, $38, $5c, $04
	db $00, $10, $28, $5e, $04
	db $00, $18, $20, $60, $04
	db $00, $28, $10, $62, $04
	db $00, $30, $08, $64, $04
	db $00, $38, $00, $66, $04
	db $10, $00, $38, $68, $04
	db $10, $10, $28, $6a, $04
	db $10, $18, $20, $6c, $04
	db $10, $28, $10, $6e, $04
	db $10, $30, $08, $70, $04
	db $10, $38, $00, $72, $04
	db $20, $00, $38, $74, $04
	db $20, $10, $28, $76, $04
	db $20, $18, $20, $78, $04
	db $20, $28, $10, $7a, $04
	db $20, $30, $08, $7c, $04
	db $20, $38, $00, $7e, $04
	db $ff
BattleAnimObjectOam_3f_47b1:
	db $00, $30, $08, $14, $04
	db $00, $20, $18, $16, $04
	db $00, $18, $20, $18, $04
	db $00, $08, $30, $1a, $04
	db $10, $30, $08, $1c, $04
	db $10, $20, $18, $1e, $04
	db $10, $18, $20, $20, $04
	db $10, $08, $30, $22, $04
	db $20, $30, $08, $24, $04
	db $20, $20, $18, $26, $04
	db $20, $18, $20, $28, $04
	db $20, $08, $30, $2a, $04
	db $ff
BattleAnimObjectOamFrames_3f_47ee:
	dw BattleAnimObjectOam_3f_47f8
	dw BattleAnimObjectOam_3f_47f8
	dw BattleAnimObjectOam_3f_481c
	dw BattleAnimObjectOam_3f_4863
	dw BattleAnimObjectOam_3f_48be
BattleAnimObjectOam_3f_47f8:
	db $00, $20, $08, $00, $04
	db $00, $28, $00, $02, $04
	db $10, $18, $10, $04, $04
	db $10, $20, $08, $06, $04
	db $10, $28, $00, $08, $04
	db $20, $20, $08, $0a, $04
	db $20, $28, $00, $0c, $04
	db $ff
BattleAnimObjectOam_3f_481c:
	db $00, $20, $08, $0e, $04
	db $00, $28, $00, $10, $04
	db $10, $00, $28, $12, $04
	db $10, $08, $20, $14, $04
	db $10, $10, $18, $16, $04
	db $10, $18, $10, $18, $04
	db $10, $20, $08, $1a, $04
	db $10, $28, $00, $1c, $04
	db $20, $00, $28, $1e, $04
	db $20, $08, $20, $20, $04
	db $20, $10, $18, $22, $04
	db $20, $18, $10, $24, $04
	db $20, $20, $08, $26, $04
	db $20, $28, $00, $28, $04
	db $ff
BattleAnimObjectOam_3f_4863:
	db $00, $00, $28, $2a, $04
	db $00, $08, $20, $2c, $04
	db $00, $10, $18, $2e, $04
	db $00, $18, $10, $30, $04
	db $00, $20, $08, $32, $04
	db $00, $28, $00, $34, $04
	db $10, $00, $28, $36, $04
	db $10, $08, $20, $38, $04
	db $10, $10, $18, $3a, $04
	db $10, $18, $10, $3c, $04
	db $10, $20, $08, $3e, $04
	db $10, $28, $00, $40, $04
	db $20, $00, $28, $42, $04
	db $20, $08, $20, $44, $04
	db $20, $10, $18, $46, $04
	db $20, $18, $10, $48, $04
	db $20, $20, $08, $4a, $04
	db $20, $28, $00, $4c, $04
	db $ff
BattleAnimObjectOam_3f_48be:
	db $00, $00, $28, $4e, $04
	db $00, $08, $20, $50, $04
	db $00, $10, $18, $52, $04
	db $00, $18, $10, $54, $04
	db $00, $20, $08, $56, $04
	db $00, $28, $00, $58, $04
	db $10, $00, $28, $5a, $04
	db $10, $08, $20, $5c, $04
	db $10, $10, $18, $5e, $04
	db $10, $18, $10, $60, $04
	db $10, $20, $08, $62, $04
	db $10, $28, $00, $64, $04
	db $20, $00, $28, $66, $04
	db $20, $08, $20, $68, $04
	db $20, $10, $18, $6a, $04
	db $20, $18, $10, $6c, $04
	db $20, $20, $08, $6e, $04
	db $20, $28, $00, $70, $04
	db $ff
BattleAnimObjectOamFrames_3f_4919:
	dw BattleAnimObjectOam_3f_4923
	dw BattleAnimObjectOam_3f_4923
	dw BattleAnimObjectOam_3f_4942
	dw BattleAnimObjectOam_3f_4942
	dw BattleAnimObjectOam_3f_4942
BattleAnimObjectOam_3f_4923:
	db $00, $00, $10, $00, $04
	db $00, $08, $08, $02, $04
	db $00, $10, $00, $04, $04
	db $10, $00, $10, $06, $04
	db $10, $08, $08, $08, $04
	db $10, $10, $00, $0a, $04
	db $ff
BattleAnimObjectOam_3f_4942:
	db $00, $00, $10, $0c, $04
	db $00, $08, $08, $0e, $04
	db $00, $10, $00, $10, $04
	db $10, $00, $10, $12, $04
	db $10, $08, $08, $14, $04
	db $10, $10, $00, $16, $04
	db $ff
BattleAnimObjectOamFrames_3f_4961:
	dw BattleAnimObjectOam_3f_4971
	dw BattleAnimObjectOam_3f_4971
	dw BattleAnimObjectOam_3f_497c
	dw BattleAnimObjectOam_3f_4987
	dw BattleAnimObjectOam_3f_4992
	dw BattleAnimObjectOam_3f_499d
	dw BattleAnimObjectOam_3f_49e9
	dw BattleAnimObjectOam_3f_4a12
BattleAnimObjectOam_3f_4971:
	db $00, $00, $08, $00, $04
	db $00, $08, $00, $02, $04
	db $ff
BattleAnimObjectOam_3f_497c:
	db $00, $00, $08, $04, $04
	db $00, $08, $00, $06, $04
	db $ff
BattleAnimObjectOam_3f_4987:
	db $00, $00, $08, $08, $04
	db $00, $08, $00, $0a, $04
	db $ff
BattleAnimObjectOam_3f_4992:
	db $00, $00, $08, $0c, $04
	db $00, $08, $00, $0e, $04
	db $ff
BattleAnimObjectOam_3f_499d:
	db $00, $08, $20, $10, $04
	db $00, $10, $18, $12, $04
	db $00, $18, $10, $14, $04
	db $00, $20, $08, $16, $04
	db $00, $28, $00, $18, $04
	db $10, $00, $28, $1a, $04
	db $10, $08, $20, $1c, $04
	db $10, $20, $08, $1e, $04
	db $10, $28, $00, $20, $04
	db $20, $00, $28, $22, $04
	db $20, $08, $20, $24, $04
	db $20, $10, $18, $26, $04
	db $20, $18, $10, $28, $04
	db $20, $20, $08, $2a, $04
	db $20, $28, $00, $2c, $04
	db $ff
BattleAnimObjectOam_3f_49e9:
	db $08, $08, $20, $2e, $04
	db $08, $10, $18, $30, $04
	db $08, $18, $10, $32, $04
	db $08, $20, $08, $34, $04
	db $18, $08, $20, $36, $04
	db $18, $10, $18, $38, $04
	db $18, $18, $10, $3a, $04
	db $18, $20, $08, $3c, $04
	db $ff
BattleAnimObjectOam_3f_4a12:
	db $00, $18, $10, $3e, $04
	db $10, $10, $18, $40, $04
	db $10, $18, $10, $42, $04
	db $10, $20, $08, $44, $04
	db $ff
BattleAnimObjectOamFrames_3f_4a27:
	dw BattleAnimObjectOam_3f_4a31
	dw BattleAnimObjectOam_3f_4a31
	dw BattleAnimObjectOam_3f_4a3c
	dw BattleAnimObjectOam_3f_4a47
	dw BattleAnimObjectOam_3f_4a52
BattleAnimObjectOam_3f_4a31:
	db $00, $00, $08, $00, $04
	db $00, $08, $00, $02, $04
	db $ff
BattleAnimObjectOam_3f_4a3c:
	db $00, $00, $08, $04, $04
	db $00, $08, $00, $06, $04
	db $ff
BattleAnimObjectOam_3f_4a47:
	db $00, $00, $08, $08, $04
	db $00, $08, $00, $0a, $04
	db $ff
BattleAnimObjectOam_3f_4a52:
	db $00, $00, $08, $0c, $04
	db $00, $08, $00, $0e, $04
	db $ff
BattleAnimObjectOamFrames_3f_4a5d:
	dw BattleAnimObjectOam_3f_4a69
	dw BattleAnimObjectOam_3f_4a69
	dw BattleAnimObjectOam_3f_4a92
	dw BattleAnimObjectOam_3f_4abb
	dw BattleAnimObjectOam_3f_4abb
	dw BattleAnimObjectOam_3f_4a69
BattleAnimObjectOam_3f_4a69:
	db $08, $00, $18, $00, $04
	db $08, $08, $10, $02, $04
	db $08, $10, $08, $04, $04
	db $08, $18, $00, $06, $04
	db $18, $00, $18, $08, $04
	db $18, $08, $10, $0a, $04
	db $18, $10, $08, $0c, $04
	db $18, $18, $00, $0e, $04
	db $ff
BattleAnimObjectOam_3f_4a92:
	db $08, $00, $18, $10, $04
	db $08, $08, $10, $12, $04
	db $08, $10, $08, $14, $04
	db $08, $18, $00, $16, $04
	db $18, $00, $18, $18, $04
	db $18, $08, $10, $1a, $04
	db $18, $10, $08, $1c, $04
	db $18, $18, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_4abb:
	db $10, $00, $18, $20, $04
	db $10, $08, $10, $22, $04
	db $10, $10, $08, $24, $04
	db $10, $18, $00, $26, $04
	db $ff
BattleAnimObjectOamFrames_3f_4ad0:
	dw BattleAnimObjectOam_3f_4ad8
	dw BattleAnimObjectOam_3f_4ad8
	dw BattleAnimObjectOam_3f_4af7
	dw BattleAnimObjectOam_3f_4b1b
BattleAnimObjectOam_3f_4ad8:
	db $00, $00, $20, $00, $04
	db $00, $08, $18, $02, $04
	db $00, $10, $10, $04, $04
	db $00, $18, $08, $06, $04
	db $10, $00, $20, $08, $04
	db $10, $08, $18, $0a, $04
	db $ff
BattleAnimObjectOam_3f_4af7:
	db $00, $00, $20, $0c, $04
	db $00, $08, $18, $0e, $04
	db $00, $10, $10, $10, $04
	db $00, $18, $08, $12, $04
	db $00, $20, $00, $14, $04
	db $10, $18, $08, $16, $04
	db $10, $20, $00, $18, $04
	db $ff
BattleAnimObjectOam_3f_4b1b:
	db $00, $00, $20, $1a, $04
	db $00, $08, $18, $1c, $04
	db $00, $10, $10, $1e, $04
	db $10, $00, $20, $20, $04
	db $10, $08, $18, $22, $04
	db $10, $10, $10, $24, $04
	db $10, $18, $08, $26, $04
	db $10, $20, $00, $28, $04
	db $ff
BattleAnimObjectOamFrames_3f_4b44:
	dw BattleAnimObjectOam_3f_4b4c
	dw BattleAnimObjectOam_3f_4b4c
	dw BattleAnimObjectOam_3f_4b9d
	dw BattleAnimObjectOam_3f_4be9
BattleAnimObjectOam_3f_4b4c:
	db $00, $00, $28, $00, $04
	db $00, $08, $20, $02, $04
	db $00, $10, $18, $04, $04
	db $00, $18, $10, $06, $04
	db $00, $20, $08, $08, $04
	db $00, $28, $00, $0a, $04
	db $10, $00, $28, $0c, $04
	db $10, $08, $20, $0e, $04
	db $10, $10, $18, $10, $04
	db $10, $18, $10, $12, $04
	db $10, $20, $08, $14, $04
	db $20, $08, $20, $16, $04
	db $20, $10, $18, $18, $04
	db $20, $18, $10, $1a, $04
	db $20, $20, $08, $1c, $04
	db $20, $28, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_4b9d:
	db $00, $00, $28, $20, $04
	db $00, $08, $20, $22, $04
	db $00, $10, $18, $24, $04
	db $00, $18, $10, $26, $04
	db $00, $20, $08, $28, $04
	db $00, $28, $00, $2a, $04
	db $10, $00, $28, $2c, $04
	db $10, $08, $20, $2e, $04
	db $10, $10, $18, $30, $04
	db $10, $18, $10, $32, $04
	db $10, $20, $08, $34, $04
	db $20, $08, $20, $36, $04
	db $20, $10, $18, $38, $04
	db $20, $18, $10, $3a, $04
	db $20, $20, $08, $3c, $04
	db $ff
BattleAnimObjectOam_3f_4be9:
	db $00, $00, $28, $3e, $04
	db $00, $08, $20, $40, $04
	db $00, $10, $18, $42, $04
	db $00, $18, $10, $44, $04
	db $00, $20, $08, $46, $04
	db $00, $28, $00, $48, $04
	db $10, $08, $20, $4a, $04
	db $10, $10, $18, $4c, $04
	db $10, $18, $10, $4e, $04
	db $10, $20, $08, $50, $04
	db $10, $28, $00, $52, $04
	db $20, $00, $28, $54, $04
	db $20, $08, $20, $56, $04
	db $20, $10, $18, $58, $04
	db $20, $18, $10, $5a, $04
	db $20, $20, $08, $5c, $04
	db $ff
BattleAnimObjectOamFrames_3f_4c3a:
	dw BattleAnimObjectOam_3f_4c44
	dw BattleAnimObjectOam_3f_4c44
	dw BattleAnimObjectOam_3f_4c63
	dw BattleAnimObjectOam_3f_4caa
	dw BattleAnimObjectOam_3f_4cf1
BattleAnimObjectOam_3f_4c44:
	db $00, $00, $30, $00, $04
	db $00, $08, $28, $02, $04
	db $00, $10, $20, $04, $04
	db $10, $00, $30, $06, $04
	db $10, $08, $28, $08, $04
	db $10, $10, $20, $0a, $04
	db $ff
BattleAnimObjectOam_3f_4c63:
	db $00, $00, $30, $0c, $04
	db $00, $08, $28, $0e, $04
	db $00, $10, $20, $10, $04
	db $00, $18, $18, $12, $04
	db $00, $20, $10, $14, $04
	db $00, $28, $08, $16, $04
	db $00, $30, $00, $18, $04
	db $10, $00, $30, $1a, $04
	db $10, $08, $28, $1c, $04
	db $10, $10, $20, $1e, $04
	db $10, $18, $18, $20, $04
	db $10, $20, $10, $22, $04
	db $10, $28, $08, $24, $04
	db $10, $30, $00, $26, $04
	db $ff
BattleAnimObjectOam_3f_4caa:
	db $00, $30, $00, $0c, $24
	db $00, $28, $08, $0e, $24
	db $00, $20, $10, $10, $24
	db $00, $18, $18, $12, $24
	db $00, $10, $20, $14, $24
	db $00, $08, $28, $16, $24
	db $00, $00, $30, $18, $24
	db $10, $30, $00, $1a, $24
	db $10, $28, $08, $1c, $24
	db $10, $20, $10, $1e, $24
	db $10, $18, $18, $20, $24
	db $10, $10, $20, $22, $24
	db $10, $08, $28, $24, $24
	db $10, $00, $30, $26, $24
	db $ff
BattleAnimObjectOam_3f_4cf1:
	db $00, $20, $10, $28, $04
	db $00, $28, $08, $2a, $04
	db $00, $30, $00, $2c, $04
	db $10, $20, $10, $2e, $04
	db $10, $28, $08, $30, $04
	db $10, $30, $00, $32, $04
	db $ff
BattleAnimObjectOamFrames_3f_4d10:
	dw BattleAnimObjectOam_3f_4d26
	dw BattleAnimObjectOam_3f_4d26
	dw BattleAnimObjectOam_3f_4d59
	dw BattleAnimObjectOam_3f_4d8c
	dw BattleAnimObjectOam_3f_4dbf
	dw BattleAnimObjectOam_3f_4dd9
	dw BattleAnimObjectOam_3f_4e02
	dw BattleAnimObjectOam_3f_4e21
	dw BattleAnimObjectOam_3f_4e4a
	dw BattleAnimObjectOam_3f_4e69
	dw BattleAnimObjectOam_3f_4e88
BattleAnimObjectOam_3f_4d26:
	db $00, $00, $20, $00, $04
	db $00, $08, $18, $02, $04
	db $00, $10, $10, $04, $04
	db $00, $18, $08, $06, $04
	db $00, $20, $00, $08, $04
	db $10, $00, $20, $0a, $04
	db $10, $08, $18, $0c, $04
	db $10, $10, $10, $0e, $04
	db $10, $18, $08, $10, $04
	db $10, $20, $00, $12, $04
	db $ff
BattleAnimObjectOam_3f_4d59:
	db $00, $00, $20, $14, $04
	db $00, $08, $18, $16, $04
	db $00, $10, $10, $18, $04
	db $00, $18, $08, $1a, $04
	db $00, $20, $00, $1c, $04
	db $10, $00, $20, $1e, $04
	db $10, $08, $18, $20, $04
	db $10, $10, $10, $22, $04
	db $10, $18, $08, $24, $04
	db $10, $20, $00, $26, $04
	db $ff
BattleAnimObjectOam_3f_4d8c:
	db $00, $00, $20, $28, $04
	db $00, $08, $18, $2a, $04
	db $00, $10, $10, $2c, $04
	db $00, $18, $08, $2e, $04
	db $00, $20, $00, $30, $04
	db $10, $00, $20, $32, $04
	db $10, $08, $18, $34, $04
	db $10, $10, $10, $36, $04
	db $10, $18, $08, $38, $04
	db $10, $20, $00, $3a, $04
	db $ff
BattleAnimObjectOam_3f_4dbf:
	db $10, $08, $10, $3c, $04
	db $20, $00, $18, $3e, $04
	db $20, $08, $10, $40, $04
	db $20, $10, $08, $42, $04
	db $20, $18, $00, $44, $04
	db $ff
BattleAnimObjectOam_3f_4dd9:
	db $00, $00, $18, $46, $04
	db $00, $08, $10, $48, $04
	db $10, $00, $18, $4a, $04
	db $10, $08, $10, $4c, $04
	db $10, $10, $08, $4e, $04
	db $20, $00, $18, $50, $04
	db $20, $08, $10, $52, $04
	db $20, $10, $08, $54, $04
	db $ff
BattleAnimObjectOam_3f_4e02:
	db $08, $00, $18, $56, $04
	db $08, $08, $10, $58, $04
	db $08, $10, $08, $5a, $04
	db $08, $18, $00, $5c, $04
	db $18, $08, $10, $5e, $04
	db $18, $10, $08, $60, $04
	db $ff
BattleAnimObjectOam_3f_4e21:
	db $00, $10, $08, $62, $04
	db $00, $18, $00, $64, $04
	db $10, $08, $10, $66, $04
	db $10, $10, $08, $68, $04
	db $10, $18, $00, $6a, $04
	db $20, $08, $10, $6c, $04
	db $20, $10, $08, $6e, $04
	db $20, $18, $00, $70, $04
	db $ff
BattleAnimObjectOam_3f_4e4a:
	db $00, $00, $10, $00, $05
	db $00, $08, $08, $02, $05
	db $00, $10, $00, $04, $05
	db $10, $00, $10, $06, $05
	db $10, $08, $08, $08, $05
	db $10, $10, $00, $0a, $05
	db $ff
BattleAnimObjectOam_3f_4e69:
	db $00, $00, $10, $0c, $05
	db $00, $08, $08, $0e, $05
	db $00, $10, $00, $10, $05
	db $10, $00, $10, $12, $05
	db $10, $08, $08, $14, $05
	db $10, $10, $00, $16, $05
	db $ff
BattleAnimObjectOam_3f_4e88:
	db $00, $08, $08, $18, $05
	db $10, $00, $10, $1a, $05
	db $10, $08, $08, $1c, $05
	db $10, $10, $00, $1e, $05
	db $ff
BattleAnimObjectOamFrames_3f_4e9d:
	dw BattleAnimObjectOam_3f_4ead
	dw BattleAnimObjectOam_3f_4ead
	dw BattleAnimObjectOam_3f_4ec2
	dw BattleAnimObjectOam_3f_4eeb
	dw BattleAnimObjectOam_3f_4f1e
	dw BattleAnimObjectOam_3f_4f6a
	dw BattleAnimObjectOam_3f_4fbb
	dw BattleAnimObjectOam_3f_5016
BattleAnimObjectOam_3f_4ead:
	db $10, $00, $28, $00, $04
	db $10, $08, $20, $02, $04
	db $20, $00, $28, $04, $04
	db $20, $08, $20, $06, $04
	db $ff
BattleAnimObjectOam_3f_4ec2:
	db $10, $00, $28, $08, $04
	db $10, $08, $20, $0a, $04
	db $10, $10, $18, $0c, $04
	db $10, $18, $10, $0e, $04
	db $20, $00, $28, $10, $04
	db $20, $08, $20, $12, $04
	db $20, $10, $18, $14, $04
	db $20, $18, $10, $16, $04
	db $ff
BattleAnimObjectOam_3f_4eeb:
	db $00, $10, $18, $18, $04
	db $00, $18, $10, $1a, $04
	db $10, $00, $28, $1c, $04
	db $10, $08, $20, $1e, $04
	db $10, $10, $18, $20, $04
	db $10, $18, $10, $22, $04
	db $20, $00, $28, $24, $04
	db $20, $08, $20, $26, $04
	db $20, $10, $18, $28, $04
	db $20, $18, $10, $2a, $04
	db $ff
BattleAnimObjectOam_3f_4f1e:
	db $00, $08, $20, $2c, $04
	db $00, $10, $18, $2e, $04
	db $00, $18, $10, $30, $04
	db $00, $20, $08, $32, $04
	db $00, $28, $00, $34, $04
	db $10, $00, $28, $36, $04
	db $10, $08, $20, $38, $04
	db $10, $10, $18, $3a, $04
	db $10, $18, $10, $3c, $04
	db $10, $20, $08, $3e, $04
	db $10, $28, $00, $40, $04
	db $20, $00, $28, $42, $04
	db $20, $08, $20, $44, $04
	db $20, $10, $18, $46, $04
	db $20, $18, $10, $48, $04
	db $ff
BattleAnimObjectOam_3f_4f6a:
	db $00, $08, $20, $00, $04
	db $00, $10, $18, $02, $04
	db $00, $18, $10, $04, $04
	db $00, $20, $08, $06, $04
	db $00, $28, $00, $08, $04
	db $10, $00, $28, $0a, $04
	db $10, $08, $20, $0c, $04
	db $10, $10, $18, $0e, $04
	db $10, $18, $10, $10, $04
	db $10, $20, $08, $12, $04
	db $10, $28, $00, $14, $04
	db $20, $00, $28, $16, $04
	db $20, $08, $20, $18, $04
	db $20, $10, $18, $1a, $04
	db $20, $18, $10, $1c, $04
	db $20, $20, $08, $1e, $04
	db $ff
BattleAnimObjectOam_3f_4fbb:
	db $00, $00, $28, $20, $04
	db $00, $08, $20, $22, $04
	db $00, $10, $18, $24, $04
	db $00, $18, $10, $26, $04
	db $00, $20, $08, $28, $04
	db $00, $28, $00, $2a, $04
	db $10, $00, $28, $2c, $04
	db $10, $08, $20, $2e, $04
	db $10, $10, $18, $30, $04
	db $10, $18, $10, $32, $04
	db $10, $20, $08, $34, $04
	db $10, $28, $00, $36, $04
	db $20, $00, $28, $38, $04
	db $20, $08, $20, $3a, $04
	db $20, $10, $18, $3c, $04
	db $20, $18, $10, $3e, $04
	db $20, $20, $08, $40, $04
	db $20, $28, $00, $42, $04
	db $ff
BattleAnimObjectOam_3f_5016:
	db $00, $00, $28, $44, $04
	db $00, $08, $20, $46, $04
	db $00, $10, $18, $48, $04
	db $00, $18, $10, $4a, $04
	db $00, $20, $08, $4c, $04
	db $00, $28, $00, $4e, $04
	db $10, $00, $28, $50, $04
	db $10, $08, $20, $52, $04
	db $10, $10, $18, $54, $04
	db $10, $18, $10, $56, $04
	db $10, $20, $08, $58, $04
	db $10, $28, $00, $5a, $04
	db $20, $00, $28, $5c, $04
	db $20, $08, $20, $5e, $04
	db $20, $10, $18, $60, $04
	db $20, $18, $10, $62, $04
	db $20, $20, $08, $64, $04
	db $ff
BattleAnimObjectOamFrames_3f_506c:
	dw BattleAnimObjectOam_3f_5078
	dw BattleAnimObjectOam_3f_5078
	dw BattleAnimObjectOam_3f_5097
	dw BattleAnimObjectOam_3f_50ac
	dw BattleAnimObjectOam_3f_50ac
	dw BattleAnimObjectOam_3f_5078
BattleAnimObjectOam_3f_5078:
	db $18, $00, $28, $00, $04
	db $18, $08, $20, $02, $04
	db $18, $10, $18, $04, $04
	db $18, $18, $10, $06, $04
	db $18, $20, $08, $08, $04
	db $18, $28, $00, $0a, $04
	db $ff
BattleAnimObjectOam_3f_5097:
	db $18, $00, $28, $0c, $04
	db $18, $08, $20, $0e, $04
	db $18, $10, $18, $10, $04
	db $18, $18, $10, $12, $04
	db $ff
BattleAnimObjectOam_3f_50ac:
	db $18, $00, $28, $14, $04
	db $18, $08, $20, $16, $04
	db $ff
BattleAnimObjectOamFrames_3f_50b7:
	dw BattleAnimObjectOam_3f_50c5
	dw BattleAnimObjectOam_3f_50c5
	dw BattleAnimObjectOam_3f_50e4
	dw BattleAnimObjectOam_3f_5103
	dw BattleAnimObjectOam_3f_5122
	dw BattleAnimObjectOam_3f_513c
	dw BattleAnimObjectOam_3f_5156
BattleAnimObjectOam_3f_50c5:
	db $00, $08, $10, $00, $05
	db $00, $10, $08, $02, $05
	db $00, $18, $00, $04, $05
	db $10, $00, $18, $06, $05
	db $10, $08, $10, $08, $05
	db $10, $10, $08, $0a, $05
	db $ff
BattleAnimObjectOam_3f_50e4:
	db $00, $08, $10, $0c, $05
	db $00, $10, $08, $0e, $05
	db $00, $18, $00, $10, $05
	db $10, $00, $18, $12, $05
	db $10, $08, $10, $14, $05
	db $10, $10, $08, $16, $05
	db $ff
BattleAnimObjectOam_3f_5103:
	db $00, $08, $10, $18, $05
	db $00, $10, $08, $1a, $05
	db $00, $18, $00, $1c, $05
	db $10, $00, $18, $1e, $05
	db $10, $08, $10, $20, $05
	db $10, $10, $08, $22, $05
	db $ff
BattleAnimObjectOam_3f_5122:
	db $10, $00, $20, $24, $04
	db $10, $08, $18, $26, $04
	db $10, $10, $10, $28, $04
	db $10, $18, $08, $2a, $04
	db $10, $20, $00, $2c, $04
	db $ff
BattleAnimObjectOam_3f_513c:
	db $10, $00, $20, $2e, $04
	db $10, $08, $18, $30, $04
	db $10, $10, $10, $32, $04
	db $10, $18, $08, $34, $04
	db $10, $20, $00, $36, $04
	db $ff
BattleAnimObjectOam_3f_5156:
	db $00, $08, $18, $38, $04
	db $00, $10, $10, $3a, $04
	db $00, $18, $08, $3c, $04
	db $10, $00, $20, $3e, $04
	db $10, $08, $18, $40, $04
	db $10, $10, $10, $42, $04
	db $10, $18, $08, $44, $04
	db $10, $20, $00, $46, $04
	db $ff
BattleAnimObjectOamFrames_3f_517f:
	dw BattleAnimObjectOam_3f_5191
	dw BattleAnimObjectOam_3f_5191
	dw BattleAnimObjectOam_3f_520f
	dw BattleAnimObjectOam_3f_528d
	dw BattleAnimObjectOam_3f_52ac
	dw BattleAnimObjectOam_3f_52d0
	dw BattleAnimObjectOam_3f_52e0
	dw BattleAnimObjectOam_3f_52ff
	dw BattleAnimObjectOam_3f_5319
BattleAnimObjectOam_3f_5191:
	db $00, $08, $38, $00, $04
	db $00, $10, $30, $02, $04
	db $00, $18, $28, $04, $04
	db $00, $20, $20, $06, $04
	db $00, $28, $18, $08, $04
	db $00, $30, $10, $0a, $04
	db $00, $38, $08, $0c, $04
	db $10, $00, $40, $0e, $04
	db $10, $08, $38, $10, $04
	db $10, $10, $30, $12, $04
	db $10, $18, $28, $14, $04
	db $10, $20, $20, $16, $04
	db $10, $28, $18, $18, $04
	db $10, $30, $10, $1a, $04
	db $10, $38, $08, $1c, $04
	db $10, $40, $00, $1e, $04
	db $20, $00, $40, $20, $04
	db $20, $08, $38, $22, $04
	db $20, $10, $30, $24, $04
	db $20, $18, $28, $26, $04
	db $20, $20, $20, $28, $04
	db $20, $28, $18, $2a, $04
	db $20, $30, $10, $2c, $04
	db $20, $38, $08, $2e, $04
	db $20, $40, $00, $30, $04
	db $ff
BattleAnimObjectOam_3f_520f:
	db $00, $00, $40, $32, $04
	db $00, $08, $38, $34, $04
	db $00, $10, $30, $36, $04
	db $00, $18, $28, $38, $04
	db $00, $20, $20, $3a, $04
	db $00, $28, $18, $3c, $04
	db $00, $30, $10, $3e, $04
	db $00, $38, $08, $40, $04
	db $00, $40, $00, $42, $04
	db $10, $00, $40, $44, $04
	db $10, $08, $38, $46, $04
	db $10, $10, $30, $48, $04
	db $10, $18, $28, $4a, $04
	db $10, $20, $20, $4c, $04
	db $10, $28, $18, $4e, $04
	db $10, $30, $10, $50, $04
	db $10, $38, $08, $52, $04
	db $10, $40, $00, $54, $04
	db $20, $08, $38, $56, $04
	db $20, $10, $30, $58, $04
	db $20, $18, $28, $5a, $04
	db $20, $20, $20, $5c, $04
	db $20, $28, $18, $5e, $04
	db $20, $30, $10, $60, $04
	db $20, $38, $08, $62, $04
	db $ff
BattleAnimObjectOam_3f_528d:
	db $00, $00, $20, $00, $04
	db $00, $08, $18, $02, $04
	db $00, $10, $10, $04, $04
	db $10, $08, $18, $06, $04
	db $10, $10, $10, $08, $04
	db $10, $18, $08, $0a, $04
	db $ff
BattleAnimObjectOam_3f_52ac:
	db $00, $08, $18, $0c, $04
	db $00, $10, $10, $0e, $04
	db $10, $08, $18, $10, $04
	db $10, $10, $10, $12, $04
	db $10, $18, $08, $14, $04
	db $20, $18, $08, $16, $04
	db $20, $20, $00, $18, $04
	db $ff
BattleAnimObjectOam_3f_52d0:
	db $10, $10, $10, $1a, $04
	db $18, $18, $08, $1c, $04
	db $20, $20, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_52e0:
	db $00, $10, $10, $20, $04
	db $00, $18, $08, $22, $04
	db $00, $20, $00, $24, $04
	db $10, $08, $18, $26, $04
	db $10, $10, $10, $28, $04
	db $10, $18, $08, $2a, $04
	db $ff
BattleAnimObjectOam_3f_52ff:
	db $08, $18, $08, $2c, $04
	db $10, $08, $18, $2e, $04
	db $10, $10, $10, $30, $04
	db $20, $00, $20, $32, $04
	db $20, $08, $18, $34, $04
	db $ff
BattleAnimObjectOam_3f_5319:
	db $10, $10, $10, $36, $04
	db $18, $08, $18, $38, $04
	db $20, $00, $20, $3a, $04
	db $ff
BattleAnimObjectOamFrames_3f_5329:
	dw BattleAnimObjectOam_3f_5331
	dw BattleAnimObjectOam_3f_5331
	dw BattleAnimObjectOam_3f_5350
	dw BattleAnimObjectOam_3f_536f
BattleAnimObjectOam_3f_5331:
	db $00, $00, $28, $00, $04
	db $00, $08, $20, $02, $04
	db $00, $10, $18, $04, $04
	db $00, $18, $10, $06, $04
	db $00, $20, $08, $08, $04
	db $00, $28, $00, $0a, $04
	db $ff
BattleAnimObjectOam_3f_5350:
	db $00, $00, $28, $0c, $04
	db $00, $08, $20, $0e, $04
	db $00, $10, $18, $10, $04
	db $00, $18, $10, $12, $04
	db $00, $20, $08, $14, $04
	db $00, $28, $00, $16, $04
	db $ff
BattleAnimObjectOam_3f_536f:
	db $00, $00, $28, $18, $04
	db $00, $08, $20, $1a, $04
	db $00, $10, $18, $1c, $04
	db $00, $18, $10, $1e, $04
	db $00, $20, $08, $20, $04
	db $00, $28, $00, $22, $04
	db $ff
BattleAnimObjectOamFrames_3f_538e:
	dw BattleAnimObjectOam_3f_539c
	dw BattleAnimObjectOam_3f_539c
	dw BattleAnimObjectOam_3f_53b6
	dw BattleAnimObjectOam_3f_53d0
	dw BattleAnimObjectOam_3f_53e0
	dw BattleAnimObjectOam_3f_5404
	dw BattleAnimObjectOam_3f_5423
BattleAnimObjectOam_3f_539c:
	db $00, $00, $28, $00, $04
	db $00, $08, $20, $02, $04
	db $10, $00, $28, $04, $04
	db $10, $08, $20, $06, $04
	db $10, $10, $18, $08, $04
	db $ff
BattleAnimObjectOam_3f_53b6:
	db $10, $00, $28, $0a, $04
	db $10, $08, $20, $0c, $04
	db $10, $10, $18, $0e, $04
	db $10, $18, $10, $10, $04
	db $20, $18, $10, $12, $04
	db $ff
BattleAnimObjectOam_3f_53d0:
	db $18, $18, $10, $14, $04
	db $20, $20, $08, $16, $04
	db $20, $28, $00, $18, $04
	db $ff
BattleAnimObjectOam_3f_53e0:
	db $08, $00, $28, $1a, $04
	db $08, $08, $20, $1c, $04
	db $08, $10, $18, $1e, $04
	db $08, $18, $10, $20, $04
	db $18, $08, $20, $22, $04
	db $18, $10, $18, $24, $04
	db $18, $18, $10, $26, $04
	db $ff
BattleAnimObjectOam_3f_5404:
	db $08, $00, $28, $28, $04
	db $08, $08, $20, $2a, $04
	db $08, $10, $18, $2c, $04
	db $18, $00, $28, $2e, $04
	db $18, $08, $20, $30, $04
	db $18, $10, $18, $32, $04
	db $ff
BattleAnimObjectOam_3f_5423:
	db $08, $00, $28, $34, $04
	db $08, $08, $20, $36, $04
	db $08, $10, $18, $38, $04
	db $18, $00, $28, $3a, $04
	db $18, $08, $20, $3c, $04
	db $18, $10, $18, $3e, $04
	db $ff
BattleAnimObjectOamFrames_3f_5442:
	dw BattleAnimObjectOam_3f_5458
	dw BattleAnimObjectOam_3f_5458
	dw BattleAnimObjectOam_3f_5463
	dw BattleAnimObjectOam_3f_548c
	dw BattleAnimObjectOam_3f_54c9
	dw BattleAnimObjectOam_3f_5515
	dw BattleAnimObjectOam_3f_5566
	dw BattleAnimObjectOam_3f_5580
	dw BattleAnimObjectOam_3f_559f
	dw BattleAnimObjectOam_3f_55b4
	dw BattleAnimObjectOam_3f_55ce
BattleAnimObjectOam_3f_5458:
	db $10, $10, $18, $00, $04
	db $10, $18, $10, $02, $04
	db $ff
BattleAnimObjectOam_3f_5463:
	db $08, $08, $20, $04, $04
	db $08, $10, $18, $06, $04
	db $08, $18, $10, $08, $04
	db $08, $20, $08, $0a, $04
	db $18, $08, $20, $0c, $04
	db $18, $10, $18, $0e, $04
	db $18, $18, $10, $10, $04
	db $18, $20, $08, $12, $04
	db $ff
BattleAnimObjectOam_3f_548c:
	db $00, $10, $18, $14, $04
	db $00, $18, $10, $16, $04
	db $00, $20, $08, $18, $04
	db $00, $28, $00, $1a, $04
	db $10, $08, $20, $1c, $04
	db $10, $10, $18, $1e, $04
	db $10, $18, $10, $20, $04
	db $10, $20, $08, $22, $04
	db $10, $28, $00, $24, $04
	db $20, $00, $28, $26, $04
	db $20, $08, $20, $28, $04
	db $20, $10, $18, $2a, $04
	db $ff
BattleAnimObjectOam_3f_54c9:
	db $00, $10, $18, $2c, $04
	db $00, $18, $10, $2e, $04
	db $00, $20, $08, $30, $04
	db $00, $28, $00, $32, $04
	db $10, $00, $28, $34, $04
	db $10, $08, $20, $36, $04
	db $10, $10, $18, $38, $04
	db $10, $18, $10, $3a, $04
	db $10, $20, $08, $3c, $04
	db $10, $28, $00, $3e, $04
	db $20, $00, $28, $40, $04
	db $20, $08, $20, $42, $04
	db $20, $10, $18, $44, $04
	db $20, $18, $10, $46, $04
	db $20, $20, $08, $48, $04
	db $ff
BattleAnimObjectOam_3f_5515:
	db $00, $00, $28, $4a, $04
	db $00, $08, $20, $4c, $04
	db $00, $10, $18, $4e, $04
	db $00, $18, $10, $50, $04
	db $00, $20, $08, $52, $04
	db $00, $28, $00, $54, $04
	db $10, $00, $28, $56, $04
	db $10, $08, $20, $58, $04
	db $10, $10, $18, $5a, $04
	db $10, $18, $10, $5c, $04
	db $10, $20, $08, $5e, $04
	db $10, $28, $00, $60, $04
	db $20, $00, $28, $62, $04
	db $20, $08, $20, $64, $04
	db $20, $10, $18, $66, $04
	db $20, $18, $10, $68, $04
	db $ff
BattleAnimObjectOam_3f_5566:
	db $08, $10, $18, $6a, $04
	db $08, $18, $10, $6c, $04
	db $08, $20, $08, $6e, $04
	db $18, $08, $20, $70, $04
	db $18, $10, $18, $72, $04
	db $ff
BattleAnimObjectOam_3f_5580:
	db $00, $10, $10, $00, $05
	db $00, $18, $08, $02, $05
	db $00, $20, $00, $04, $05
	db $10, $10, $10, $06, $05
	db $10, $18, $08, $08, $05
	db $10, $20, $00, $0a, $05
	db $ff
BattleAnimObjectOam_3f_559f:
	db $00, $10, $10, $0c, $05
	db $00, $18, $08, $0e, $05
	db $10, $10, $10, $10, $05
	db $10, $18, $08, $12, $05
	db $ff
BattleAnimObjectOam_3f_55b4:
	db $00, $10, $10, $14, $05
	db $00, $18, $08, $16, $05
	db $10, $08, $18, $18, $05
	db $10, $10, $10, $1a, $05
	db $10, $18, $08, $1c, $05
	db $ff
BattleAnimObjectOam_3f_55ce:
	db $00, $10, $10, $1e, $05
	db $00, $18, $08, $20, $05
	db $10, $10, $10, $22, $05
	db $10, $18, $08, $24, $05
	db $ff
BattleAnimObjectOamFrames_3f_55e3:
	dw BattleAnimObjectOam_3f_55f3
	dw BattleAnimObjectOam_3f_55f3
	dw BattleAnimObjectOam_3f_55fe
	dw BattleAnimObjectOam_3f_5609
	dw BattleAnimObjectOam_3f_5628
	dw BattleAnimObjectOam_3f_5656
	dw BattleAnimObjectOam_3f_56b1
	dw BattleAnimObjectOam_3f_570c
BattleAnimObjectOam_3f_55f3:
	db $18, $10, $18, $00, $04
	db $18, $18, $10, $02, $04
	db $ff
BattleAnimObjectOam_3f_55fe:
	db $18, $10, $18, $04, $04
	db $18, $18, $10, $06, $04
	db $ff
BattleAnimObjectOam_3f_5609:
	db $08, $08, $20, $08, $04
	db $08, $10, $18, $0a, $04
	db $08, $18, $10, $0c, $04
	db $18, $08, $20, $0e, $04
	db $18, $10, $18, $10, $04
	db $18, $18, $10, $12, $04
	db $ff
BattleAnimObjectOam_3f_5628:
	db $10, $08, $20, $00, $04
	db $10, $10, $18, $02, $04
	db $10, $18, $10, $04, $04
	db $10, $20, $08, $06, $04
	db $18, $00, $28, $08, $04
	db $20, $08, $20, $0a, $04
	db $20, $10, $18, $0c, $04
	db $20, $18, $10, $0e, $04
	db $20, $20, $08, $10, $04
	db $ff
BattleAnimObjectOam_3f_5656:
	db $00, $00, $28, $12, $04
	db $00, $08, $20, $14, $04
	db $00, $10, $18, $16, $04
	db $00, $18, $10, $18, $04
	db $00, $20, $08, $1a, $04
	db $00, $28, $00, $1c, $04
	db $10, $00, $28, $1e, $04
	db $10, $08, $20, $20, $04
	db $10, $10, $18, $22, $04
	db $10, $18, $10, $24, $04
	db $10, $20, $08, $26, $04
	db $10, $28, $00, $28, $04
	db $20, $00, $28, $2a, $04
	db $20, $08, $20, $2c, $04
	db $20, $10, $18, $2e, $04
	db $20, $18, $10, $30, $04
	db $20, $20, $08, $32, $04
	db $20, $28, $00, $34, $04
	db $ff
BattleAnimObjectOam_3f_56b1:
	db $00, $00, $28, $36, $04
	db $00, $08, $20, $38, $04
	db $00, $10, $18, $3a, $04
	db $00, $18, $10, $3c, $04
	db $00, $20, $08, $3e, $04
	db $00, $28, $00, $40, $04
	db $10, $00, $28, $42, $04
	db $10, $08, $20, $44, $04
	db $10, $10, $18, $46, $04
	db $10, $18, $10, $48, $04
	db $10, $20, $08, $4a, $04
	db $10, $28, $00, $4c, $04
	db $20, $00, $28, $4e, $04
	db $20, $08, $20, $50, $04
	db $20, $10, $18, $52, $04
	db $20, $18, $10, $54, $04
	db $20, $20, $08, $56, $04
	db $20, $28, $00, $58, $04
	db $ff
BattleAnimObjectOam_3f_570c:
	db $00, $00, $28, $5a, $04
	db $00, $08, $20, $5c, $04
	db $00, $10, $18, $5e, $04
	db $00, $18, $10, $60, $04
	db $00, $20, $08, $62, $04
	db $00, $28, $00, $64, $04
	db $10, $00, $28, $66, $04
	db $10, $08, $20, $68, $04
	db $10, $10, $18, $6a, $04
	db $10, $18, $10, $6c, $04
	db $10, $20, $08, $6e, $04
	db $10, $28, $00, $70, $04
	db $20, $00, $28, $72, $04
	db $20, $08, $20, $74, $04
	db $20, $10, $18, $76, $04
	db $20, $18, $10, $78, $04
	db $20, $20, $08, $7a, $04
	db $20, $28, $00, $7c, $04
	db $ff
BattleAnimObjectOamFrames_3f_5767:
	dw BattleAnimObjectOam_3f_5777
	dw BattleAnimObjectOam_3f_5777
	dw BattleAnimObjectOam_3f_57a0
	dw BattleAnimObjectOam_3f_57c9
	dw BattleAnimObjectOam_3f_57f2
	dw BattleAnimObjectOam_3f_581b
	dw BattleAnimObjectOam_3f_5844
	dw BattleAnimObjectOam_3f_586d
BattleAnimObjectOam_3f_5777:
	db $00, $00, $38, $00, $04
	db $00, $08, $30, $02, $04
	db $00, $10, $28, $04, $04
	db $00, $18, $20, $06, $04
	db $00, $20, $18, $08, $04
	db $00, $28, $10, $0a, $04
	db $00, $30, $08, $0c, $04
	db $00, $38, $00, $0e, $04
	db $ff
BattleAnimObjectOam_3f_57a0:
	db $00, $00, $38, $10, $04
	db $00, $08, $30, $12, $04
	db $00, $10, $28, $14, $04
	db $00, $18, $20, $16, $04
	db $00, $20, $18, $18, $04
	db $00, $28, $10, $1a, $04
	db $00, $30, $08, $1c, $04
	db $00, $38, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_57c9:
	db $00, $00, $38, $20, $04
	db $00, $08, $30, $22, $04
	db $00, $10, $28, $24, $04
	db $00, $18, $20, $26, $04
	db $00, $20, $18, $28, $04
	db $00, $28, $10, $2a, $04
	db $00, $30, $08, $2c, $04
	db $00, $38, $00, $2e, $04
	db $ff
BattleAnimObjectOam_3f_57f2:
	db $00, $00, $38, $30, $04
	db $00, $08, $30, $32, $04
	db $00, $10, $28, $34, $04
	db $00, $18, $20, $36, $04
	db $00, $20, $18, $38, $04
	db $00, $28, $10, $3a, $04
	db $00, $30, $08, $3c, $04
	db $00, $38, $00, $3e, $04
	db $ff
BattleAnimObjectOam_3f_581b:
	db $00, $00, $38, $40, $04
	db $00, $08, $30, $42, $04
	db $00, $10, $28, $44, $04
	db $00, $18, $20, $46, $04
	db $00, $20, $18, $48, $04
	db $00, $28, $10, $4a, $04
	db $00, $30, $08, $4c, $04
	db $00, $38, $00, $4e, $04
	db $ff
BattleAnimObjectOam_3f_5844:
	db $00, $00, $38, $50, $04
	db $00, $08, $30, $52, $04
	db $00, $10, $28, $54, $04
	db $00, $18, $20, $56, $04
	db $00, $20, $18, $58, $04
	db $00, $28, $10, $5a, $04
	db $00, $30, $08, $5c, $04
	db $00, $38, $00, $5e, $04
	db $ff
BattleAnimObjectOam_3f_586d:
	db $00, $00, $38, $60, $04
	db $00, $08, $30, $62, $04
	db $00, $10, $28, $64, $04
	db $00, $18, $20, $66, $04
	db $00, $20, $18, $68, $04
	db $00, $28, $10, $6a, $04
	db $00, $30, $08, $6c, $04
	db $00, $38, $00, $6e, $04
	db $ff
BattleAnimObjectOamFrames_3f_5896:
	dw BattleAnimObjectOam_3f_58a4
	dw BattleAnimObjectOam_3f_58a4
	dw BattleAnimObjectOam_3f_58af
	dw BattleAnimObjectOam_3f_58ba
	dw BattleAnimObjectOam_3f_58c5
	dw BattleAnimObjectOam_3f_58d5
	dw BattleAnimObjectOam_3f_58e5
BattleAnimObjectOam_3f_58a4:
	db $00, $00, $08, $00, $04
	db $00, $08, $00, $02, $04
	db $ff
BattleAnimObjectOam_3f_58af:
	db $00, $00, $08, $04, $04
	db $00, $08, $00, $06, $04
	db $ff
BattleAnimObjectOam_3f_58ba:
	db $00, $00, $08, $08, $04
	db $00, $08, $00, $0a, $04
	db $ff
BattleAnimObjectOam_3f_58c5:
	db $00, $00, $10, $0c, $04
	db $00, $08, $08, $0e, $04
	db $00, $10, $00, $10, $04
	db $ff
BattleAnimObjectOam_3f_58d5:
	db $00, $00, $10, $12, $04
	db $00, $08, $08, $14, $04
	db $00, $10, $00, $16, $04
	db $ff
BattleAnimObjectOam_3f_58e5:
	db $00, $00, $10, $18, $04
	db $00, $08, $08, $1a, $04
	db $00, $10, $00, $1c, $04
	db $ff
BattleAnimObjectOamFrames_3f_58f5:
	dw BattleAnimObjectOam_3f_5909
	dw BattleAnimObjectOam_3f_5909
	dw BattleAnimObjectOam_3f_5932
	dw BattleAnimObjectOam_3f_595b
	dw BattleAnimObjectOam_3f_5984
	dw BattleAnimObjectOam_3f_59ad
	dw BattleAnimObjectOam_3f_59d6
	dw BattleAnimObjectOam_3f_5a04
	dw BattleAnimObjectOam_3f_5a3c
	dw BattleAnimObjectOam_3f_5a65
BattleAnimObjectOam_3f_5909:
	db $00, $00, $18, $00, $04
	db $00, $08, $10, $02, $04
	db $00, $10, $08, $04, $04
	db $00, $18, $00, $06, $04
	db $10, $00, $18, $08, $04
	db $10, $08, $10, $0a, $04
	db $10, $10, $08, $0c, $04
	db $10, $18, $00, $0e, $04
	db $ff
BattleAnimObjectOam_3f_5932:
	db $00, $00, $18, $10, $04
	db $00, $08, $10, $12, $04
	db $00, $10, $08, $14, $04
	db $00, $18, $00, $16, $04
	db $10, $00, $18, $18, $04
	db $10, $08, $10, $1a, $04
	db $10, $10, $08, $1c, $04
	db $10, $18, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_595b:
	db $00, $00, $18, $20, $04
	db $00, $08, $10, $22, $04
	db $00, $10, $08, $24, $04
	db $00, $18, $00, $26, $04
	db $10, $00, $18, $28, $04
	db $10, $08, $10, $2a, $04
	db $10, $10, $08, $2c, $04
	db $10, $18, $00, $2e, $04
	db $ff
BattleAnimObjectOam_3f_5984:
	db $00, $00, $18, $30, $04
	db $00, $08, $10, $32, $04
	db $00, $10, $08, $34, $04
	db $00, $18, $00, $36, $04
	db $10, $00, $18, $38, $04
	db $10, $08, $10, $3a, $04
	db $10, $10, $08, $3c, $04
	db $10, $18, $00, $3e, $04
	db $ff
BattleAnimObjectOam_3f_59ad:
	db $00, $00, $18, $40, $04
	db $00, $08, $10, $42, $04
	db $00, $10, $08, $44, $04
	db $00, $18, $00, $46, $04
	db $10, $00, $18, $48, $04
	db $10, $08, $10, $4a, $04
	db $10, $10, $08, $4c, $04
	db $10, $18, $00, $4e, $04
	db $ff
BattleAnimObjectOam_3f_59d6:
	db $00, $00, $28, $00, $04
	db $00, $08, $20, $02, $04
	db $00, $10, $18, $04, $04
	db $00, $18, $10, $06, $04
	db $00, $20, $08, $08, $04
	db $00, $28, $00, $0a, $04
	db $10, $10, $18, $0c, $04
	db $10, $18, $10, $0e, $04
	db $10, $28, $00, $10, $04
	db $ff
BattleAnimObjectOam_3f_5a04:
	db $00, $00, $28, $12, $04
	db $00, $08, $20, $14, $04
	db $00, $10, $18, $16, $04
	db $00, $18, $10, $18, $04
	db $00, $20, $08, $1a, $04
	db $00, $28, $00, $1c, $04
	db $10, $00, $28, $1e, $04
	db $10, $08, $20, $20, $04
	db $10, $10, $18, $22, $04
	db $10, $18, $10, $24, $04
	db $10, $28, $00, $26, $04
	db $ff
BattleAnimObjectOam_3f_5a3c:
	db $00, $18, $10, $28, $04
	db $08, $20, $08, $2a, $04
	db $10, $00, $28, $2c, $04
	db $10, $08, $20, $2e, $04
	db $10, $18, $10, $30, $04
	db $10, $28, $00, $32, $04
	db $20, $08, $20, $34, $04
	db $20, $10, $18, $36, $04
	db $ff
BattleAnimObjectOam_3f_5a65:
	db $10, $20, $08, $38, $04
	db $20, $00, $28, $3a, $04
	db $20, $10, $18, $3c, $04
	db $20, $28, $00, $3e, $04
	db $ff
BattleAnimObjectOamFrames_3f_5a7a:
	dw BattleAnimObjectOam_3f_5a86
	dw BattleAnimObjectOam_3f_5a86
	dw BattleAnimObjectOam_3f_5ad7
	dw BattleAnimObjectOam_3f_5af6
	dw BattleAnimObjectOam_3f_5b3d
	dw BattleAnimObjectOam_3f_5a86
BattleAnimObjectOam_3f_5a86:
	db $08, $00, $38, $00, $04
	db $08, $08, $30, $02, $04
	db $08, $10, $28, $04, $04
	db $08, $18, $20, $06, $04
	db $08, $20, $18, $08, $04
	db $08, $28, $10, $0a, $04
	db $08, $30, $08, $0c, $04
	db $08, $38, $00, $0e, $04
	db $18, $00, $38, $10, $04
	db $18, $08, $30, $12, $04
	db $18, $10, $28, $14, $04
	db $18, $18, $20, $16, $04
	db $18, $20, $18, $18, $04
	db $18, $28, $10, $1a, $04
	db $18, $30, $08, $1c, $04
	db $18, $38, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_5ad7:
	db $08, $00, $28, $20, $04
	db $08, $08, $20, $22, $04
	db $08, $10, $18, $24, $04
	db $08, $18, $10, $26, $04
	db $08, $20, $08, $28, $04
	db $08, $28, $00, $2a, $04
	db $ff
BattleAnimObjectOam_3f_5af6:
	db $08, $00, $28, $2c, $04
	db $08, $08, $20, $2e, $04
	db $08, $10, $18, $30, $04
	db $08, $18, $10, $32, $04
	db $10, $20, $08, $34, $04
	db $18, $00, $28, $36, $04
	db $18, $08, $20, $38, $04
	db $18, $10, $18, $3a, $04
	db $18, $18, $10, $3c, $04
	db $20, $20, $08, $3e, $04
	db $28, $00, $28, $40, $04
	db $28, $08, $20, $42, $04
	db $28, $10, $18, $44, $04
	db $28, $18, $10, $46, $04
	db $ff
BattleAnimObjectOam_3f_5b3d:
	db $28, $00, $28, $48, $04
	db $28, $08, $20, $4a, $04
	db $28, $10, $18, $4c, $04
	db $28, $18, $10, $4e, $04
	db $28, $20, $08, $50, $04
	db $28, $28, $00, $52, $04
	db $ff
BattleAnimObjectOamFrames_3f_5b5c:
	dw BattleAnimObjectOam_3f_5b6a
	dw BattleAnimObjectOam_3f_5b6a
	dw BattleAnimObjectOam_3f_5b7f
	dw BattleAnimObjectOam_3f_5b9e
	dw BattleAnimObjectOam_3f_5bb8
	dw BattleAnimObjectOam_3f_5be1
	dw BattleAnimObjectOam_3f_5c0a
BattleAnimObjectOam_3f_5b6a:
	db $00, $10, $18, $00, $05
	db $00, $18, $10, $02, $05
	db $00, $20, $08, $04, $05
	db $00, $28, $00, $06, $05
	db $ff
BattleAnimObjectOam_3f_5b7f:
	db $08, $00, $28, $08, $05
	db $08, $08, $20, $0a, $05
	db $08, $10, $18, $0c, $05
	db $08, $18, $10, $0e, $05
	db $08, $20, $08, $10, $05
	db $08, $28, $00, $12, $05
	db $ff
BattleAnimObjectOam_3f_5b9e:
	db $10, $08, $20, $14, $05
	db $10, $10, $18, $16, $05
	db $10, $18, $10, $18, $05
	db $10, $20, $08, $1a, $05
	db $10, $28, $00, $1c, $05
	db $ff
BattleAnimObjectOam_3f_5bb8:
	db $00, $00, $18, $1e, $04
	db $00, $08, $10, $20, $04
	db $00, $10, $08, $22, $04
	db $00, $18, $00, $24, $04
	db $10, $00, $18, $26, $04
	db $10, $08, $10, $28, $04
	db $10, $10, $08, $2a, $04
	db $10, $18, $00, $2c, $04
	db $ff
BattleAnimObjectOam_3f_5be1:
	db $00, $00, $18, $2e, $04
	db $00, $08, $10, $30, $04
	db $00, $10, $08, $32, $04
	db $00, $18, $00, $34, $04
	db $10, $00, $18, $36, $04
	db $10, $08, $10, $38, $04
	db $10, $10, $08, $3a, $04
	db $10, $18, $00, $3c, $04
	db $ff
BattleAnimObjectOam_3f_5c0a:
	db $00, $00, $18, $3e, $04
	db $00, $08, $10, $40, $04
	db $00, $10, $08, $42, $04
	db $00, $18, $00, $44, $04
	db $10, $00, $18, $46, $04
	db $10, $08, $10, $48, $04
	db $10, $10, $08, $4a, $04
	db $10, $18, $00, $4c, $04
	db $ff
BattleAnimObjectOamFrames_3f_5c33:
	dw BattleAnimObjectOam_3f_5c3f
	dw BattleAnimObjectOam_3f_5c3f
	dw BattleAnimObjectOam_3f_5c54
	dw BattleAnimObjectOam_3f_5c87
	dw BattleAnimObjectOam_3f_5cd3
	dw BattleAnimObjectOam_3f_5d29
BattleAnimObjectOam_3f_5c3f:
	db $20, $08, $20, $00, $04
	db $20, $10, $18, $02, $04
	db $20, $18, $10, $04, $04
	db $20, $20, $08, $06, $04
	db $ff
BattleAnimObjectOam_3f_5c54:
	db $10, $08, $20, $08, $04
	db $10, $10, $18, $0a, $04
	db $10, $18, $10, $0c, $04
	db $10, $20, $08, $0e, $04
	db $20, $00, $28, $10, $04
	db $20, $08, $20, $12, $04
	db $20, $10, $18, $14, $04
	db $20, $18, $10, $16, $04
	db $20, $20, $08, $18, $04
	db $20, $28, $00, $1a, $04
	db $ff
BattleAnimObjectOam_3f_5c87:
	db $00, $10, $18, $1c, $04
	db $00, $18, $10, $1e, $04
	db $00, $20, $08, $20, $04
	db $10, $00, $28, $22, $04
	db $10, $08, $20, $24, $04
	db $10, $10, $18, $26, $04
	db $10, $18, $10, $28, $04
	db $10, $20, $08, $2a, $04
	db $10, $28, $00, $2c, $04
	db $20, $00, $28, $2e, $04
	db $20, $08, $20, $30, $04
	db $20, $10, $18, $32, $04
	db $20, $18, $10, $34, $04
	db $20, $20, $08, $36, $04
	db $20, $28, $00, $38, $04
	db $ff
BattleAnimObjectOam_3f_5cd3:
	db $00, $00, $28, $3a, $04
	db $00, $08, $20, $3c, $04
	db $00, $10, $18, $3e, $04
	db $00, $18, $10, $40, $04
	db $00, $20, $08, $42, $04
	db $00, $28, $00, $44, $04
	db $10, $08, $20, $46, $04
	db $10, $10, $18, $48, $04
	db $10, $18, $10, $4a, $04
	db $10, $20, $08, $4c, $04
	db $10, $28, $00, $4e, $04
	db $20, $00, $28, $50, $04
	db $20, $08, $20, $52, $04
	db $20, $10, $18, $54, $04
	db $20, $18, $10, $56, $04
	db $20, $20, $08, $58, $04
	db $20, $28, $00, $5a, $04
	db $ff
BattleAnimObjectOam_3f_5d29:
	db $00, $00, $28, $5c, $04
	db $00, $08, $20, $5e, $04
	db $00, $10, $18, $60, $04
	db $00, $18, $10, $62, $04
	db $00, $20, $08, $64, $04
	db $00, $28, $00, $66, $04
	db $10, $00, $28, $68, $04
	db $10, $08, $20, $6a, $04
	db $10, $10, $18, $6c, $04
	db $10, $18, $10, $6e, $04
	db $10, $20, $08, $70, $04
	db $10, $28, $00, $72, $04
	db $20, $00, $28, $74, $04
	db $20, $08, $20, $76, $04
	db $20, $10, $18, $78, $04
	db $20, $18, $10, $7a, $04
	db $20, $20, $08, $7c, $04
	db $20, $28, $00, $7e, $04
	db $ff
BattleAnimObjectOamFrames_3f_5d84:
	dw BattleAnimObjectOam_3f_5d90
	dw BattleAnimObjectOam_3f_5d90
	dw BattleAnimObjectOam_3f_5d9b
	dw BattleAnimObjectOam_3f_5dbf
	dw BattleAnimObjectOam_3f_5e10
	dw BattleAnimObjectOam_3f_5e6b
BattleAnimObjectOam_3f_5d90:
	db $10, $10, $18, $00, $04
	db $10, $18, $10, $02, $04
	db $ff
BattleAnimObjectOam_3f_5d9b:
	db $00, $10, $18, $04, $04
	db $00, $18, $10, $06, $04
	db $00, $20, $08, $08, $04
	db $10, $08, $20, $0a, $04
	db $10, $10, $18, $0c, $04
	db $10, $18, $10, $0e, $04
	db $10, $20, $08, $10, $04
	db $ff
BattleAnimObjectOam_3f_5dbf:
	db $00, $00, $28, $12, $04
	db $00, $08, $20, $14, $04
	db $00, $10, $18, $16, $04
	db $00, $18, $10, $18, $04
	db $00, $20, $08, $1a, $04
	db $00, $28, $00, $1c, $04
	db $10, $00, $28, $1e, $04
	db $10, $08, $20, $20, $04
	db $10, $10, $18, $22, $04
	db $10, $18, $10, $24, $04
	db $10, $20, $08, $26, $04
	db $10, $28, $00, $28, $04
	db $20, $10, $18, $2a, $04
	db $20, $18, $10, $2c, $04
	db $20, $20, $08, $2e, $04
	db $20, $28, $00, $30, $04
	db $ff
BattleAnimObjectOam_3f_5e10:
	db $00, $00, $28, $32, $04
	db $00, $08, $20, $34, $04
	db $00, $10, $18, $36, $04
	db $00, $18, $10, $38, $04
	db $00, $20, $08, $3a, $04
	db $00, $28, $00, $3c, $04
	db $10, $00, $28, $3e, $04
	db $10, $08, $20, $40, $04
	db $10, $10, $18, $42, $04
	db $10, $18, $10, $44, $04
	db $10, $20, $08, $46, $04
	db $10, $28, $00, $48, $04
	db $20, $00, $28, $4a, $04
	db $20, $08, $20, $4c, $04
	db $20, $10, $18, $4e, $04
	db $20, $18, $10, $50, $04
	db $20, $20, $08, $52, $04
	db $20, $28, $00, $54, $04
	db $ff
BattleAnimObjectOam_3f_5e6b:
	db $00, $00, $28, $56, $04
	db $00, $08, $20, $58, $04
	db $00, $10, $18, $5a, $04
	db $00, $18, $10, $5c, $04
	db $00, $20, $08, $5e, $04
	db $00, $28, $00, $60, $04
	db $10, $00, $28, $62, $04
	db $10, $08, $20, $64, $04
	db $10, $10, $18, $66, $04
	db $10, $18, $10, $68, $04
	db $10, $20, $08, $6a, $04
	db $10, $28, $00, $6c, $04
	db $20, $00, $28, $6e, $04
	db $20, $08, $20, $70, $04
	db $20, $10, $18, $72, $04
	db $20, $18, $10, $74, $04
	db $20, $20, $08, $76, $04
	db $20, $28, $00, $78, $04
	db $ff
BattleAnimObjectOamFrames_3f_5ec6:
	dw BattleAnimObjectOam_3f_5ed4
	dw BattleAnimObjectOam_3f_5ed4
	dw BattleAnimObjectOam_3f_5edf
	dw BattleAnimObjectOam_3f_5ef4
	dw BattleAnimObjectOam_3f_5f09
	dw BattleAnimObjectOam_3f_5f23
	dw BattleAnimObjectOam_3f_5f4c
BattleAnimObjectOam_3f_5ed4:
	db $08, $08, $10, $00, $04
	db $08, $10, $08, $02, $04
	db $ff
BattleAnimObjectOam_3f_5edf:
	db $00, $08, $10, $04, $04
	db $00, $10, $08, $06, $04
	db $10, $08, $10, $08, $04
	db $10, $10, $08, $0a, $04
	db $ff
BattleAnimObjectOam_3f_5ef4:
	db $00, $08, $10, $0c, $04
	db $00, $10, $08, $0e, $04
	db $10, $08, $10, $10, $04
	db $10, $10, $08, $12, $04
	db $ff
BattleAnimObjectOam_3f_5f09:
	db $00, $08, $10, $14, $04
	db $00, $10, $08, $16, $04
	db $08, $18, $00, $18, $04
	db $10, $08, $10, $1a, $04
	db $10, $10, $08, $1c, $04
	db $ff
BattleAnimObjectOam_3f_5f23:
	db $00, $00, $18, $1e, $04
	db $00, $08, $10, $20, $04
	db $00, $10, $08, $22, $04
	db $00, $18, $00, $24, $04
	db $10, $00, $18, $26, $04
	db $10, $08, $10, $28, $04
	db $10, $10, $08, $2a, $04
	db $10, $18, $00, $2c, $04
	db $ff
BattleAnimObjectOam_3f_5f4c:
	db $00, $00, $18, $2e, $04
	db $00, $08, $10, $30, $04
	db $00, $10, $08, $32, $04
	db $00, $18, $00, $34, $04
	db $10, $00, $18, $36, $04
	db $10, $08, $10, $38, $04
	db $10, $10, $08, $3a, $04
	db $10, $18, $00, $3c, $04
	db $ff
BattleAnimObjectOamFrames_3f_5f75:
	dw BattleAnimObjectOam_3f_5f7b
	dw BattleAnimObjectOam_3f_5f7b
	dw BattleAnimObjectOam_3f_5fcc
BattleAnimObjectOam_3f_5f7b:
	db $00, $00, $38, $00, $04
	db $00, $08, $30, $02, $04
	db $00, $10, $28, $04, $04
	db $00, $18, $20, $06, $04
	db $00, $20, $18, $08, $04
	db $00, $28, $10, $0a, $04
	db $00, $30, $08, $0c, $04
	db $00, $38, $00, $0e, $04
	db $10, $00, $38, $10, $04
	db $10, $08, $30, $12, $04
	db $10, $10, $28, $14, $04
	db $10, $18, $20, $16, $04
	db $10, $20, $18, $18, $04
	db $10, $28, $10, $1a, $04
	db $10, $30, $08, $1c, $04
	db $10, $38, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_5fcc:
	db $00, $00, $38, $20, $04
	db $00, $08, $30, $22, $04
	db $00, $10, $28, $24, $04
	db $00, $18, $20, $26, $04
	db $00, $20, $18, $28, $04
	db $00, $28, $10, $2a, $04
	db $00, $30, $08, $2c, $04
	db $00, $38, $00, $2e, $04
	db $10, $00, $38, $30, $04
	db $10, $08, $30, $32, $04
	db $10, $10, $28, $34, $04
	db $10, $18, $20, $36, $04
	db $10, $20, $18, $38, $04
	db $10, $28, $10, $3a, $04
	db $10, $30, $08, $3c, $04
	db $10, $38, $00, $3e, $04
	db $ff
BattleAnimObjectOamFrames_3f_601d:
	dw BattleAnimObjectOam_3f_6029
	dw BattleAnimObjectOam_3f_6029
	dw BattleAnimObjectOam_3f_6034
	dw BattleAnimObjectOam_3f_604e
	dw BattleAnimObjectOam_3f_606d
	dw BattleAnimObjectOam_3f_6087
BattleAnimObjectOam_3f_6029:
	db $00, $00, $38, $00, $04
	db $00, $08, $30, $02, $04
	db $ff
BattleAnimObjectOam_3f_6034:
	db $00, $08, $30, $04, $04
	db $00, $10, $28, $06, $04
	db $00, $18, $20, $08, $04
	db $00, $20, $18, $0a, $04
	db $00, $28, $10, $0c, $04
	db $ff
BattleAnimObjectOam_3f_604e:
	db $00, $08, $30, $0e, $04
	db $00, $10, $28, $10, $04
	db $00, $18, $20, $12, $04
	db $00, $20, $18, $14, $04
	db $00, $28, $10, $16, $04
	db $00, $30, $08, $18, $04
	db $ff
BattleAnimObjectOam_3f_606d:
	db $00, $18, $20, $1a, $04
	db $00, $20, $18, $1c, $04
	db $00, $28, $10, $1e, $04
	db $00, $30, $08, $20, $04
	db $00, $38, $00, $22, $04
	db $ff
BattleAnimObjectOam_3f_6087:
	db $00, $30, $08, $24, $04
	db $00, $38, $00, $26, $04
	db $ff
BattleAnimObjectOamFrames_3f_6092:
	dw BattleAnimObjectOam_3f_60b8
	dw BattleAnimObjectOam_3f_60b8
	dw BattleAnimObjectOam_3f_60be
	dw BattleAnimObjectOam_3f_60ce
	dw BattleAnimObjectOam_3f_60f7
	dw BattleAnimObjectOam_3f_611b
	dw BattleAnimObjectOam_3f_612b
	dw BattleAnimObjectOam_3f_6154
	dw BattleAnimObjectOam_3f_6178
	dw BattleAnimObjectOam_3f_618d
	dw BattleAnimObjectOam_3f_61b6
	dw BattleAnimObjectOam_3f_61d5
	dw BattleAnimObjectOam_3f_6221
	dw BattleAnimObjectOam_3f_6272
	dw BattleAnimObjectOam_3f_62aa
	dw BattleAnimObjectOam_3f_62f6
	dw BattleAnimObjectOam_3f_6347
	dw BattleAnimObjectOam_3f_637f
	dw BattleAnimObjectOam_3f_63c1
BattleAnimObjectOam_3f_60b8:
	db $18, $18, $20, $00, $04
	db $ff
BattleAnimObjectOam_3f_60be:
	db $08, $08, $30, $02, $04
	db $08, $10, $28, $04, $04
	db $18, $20, $18, $06, $04
	db $ff
BattleAnimObjectOam_3f_60ce:
	db $00, $00, $38, $08, $04
	db $00, $08, $30, $0a, $04
	db $00, $10, $28, $0c, $04
	db $10, $00, $38, $0e, $04
	db $10, $08, $30, $10, $04
	db $10, $10, $28, $12, $04
	db $28, $28, $10, $14, $04
	db $28, $30, $08, $16, $04
	db $ff
BattleAnimObjectOam_3f_60f7:
	db $18, $20, $18, $18, $04
	db $20, $28, $10, $1a, $04
	db $20, $30, $08, $1c, $04
	db $20, $38, $00, $1e, $04
	db $30, $28, $10, $20, $04
	db $30, $30, $08, $22, $04
	db $30, $38, $00, $24, $04
	db $ff
BattleAnimObjectOam_3f_611b:
	db $10, $20, $18, $26, $04
	db $10, $28, $10, $28, $04
	db $20, $18, $20, $2a, $04
	db $ff
BattleAnimObjectOam_3f_612b:
	db $00, $28, $10, $2c, $04
	db $00, $30, $08, $2e, $04
	db $00, $38, $00, $30, $04
	db $10, $28, $10, $32, $04
	db $10, $30, $08, $34, $04
	db $10, $38, $00, $36, $04
	db $20, $10, $28, $38, $04
	db $20, $18, $20, $3a, $04
	db $ff
BattleAnimObjectOam_3f_6154:
	db $18, $20, $18, $3c, $04
	db $20, $00, $38, $3e, $04
	db $20, $08, $30, $40, $04
	db $20, $10, $28, $42, $04
	db $30, $00, $38, $44, $04
	db $30, $08, $30, $46, $04
	db $30, $10, $28, $48, $04
	db $ff
BattleAnimObjectOam_3f_6178:
	db $18, $28, $10, $4a, $04
	db $18, $30, $08, $4c, $04
	db $20, $10, $28, $4e, $04
	db $20, $18, $20, $50, $04
	db $ff
BattleAnimObjectOam_3f_618d:
	db $10, $08, $30, $52, $04
	db $10, $10, $28, $54, $04
	db $10, $28, $10, $56, $04
	db $10, $30, $08, $58, $04
	db $10, $38, $00, $5a, $04
	db $20, $28, $10, $5c, $04
	db $20, $30, $08, $5e, $04
	db $20, $38, $00, $60, $04
	db $ff
BattleAnimObjectOam_3f_61b6:
	db $08, $00, $38, $62, $04
	db $08, $08, $30, $64, $04
	db $08, $10, $28, $66, $04
	db $18, $00, $38, $68, $04
	db $18, $08, $30, $6a, $04
	db $18, $10, $28, $6c, $04
	db $ff
BattleAnimObjectOam_3f_61d5:
	db $00, $00, $28, $00, $04
	db $00, $08, $20, $02, $04
	db $00, $18, $10, $04, $04
	db $00, $20, $08, $06, $04
	db $10, $00, $28, $08, $04
	db $10, $08, $20, $0a, $04
	db $10, $10, $18, $0c, $04
	db $10, $18, $10, $0e, $04
	db $10, $20, $08, $10, $04
	db $10, $28, $00, $12, $04
	db $20, $00, $28, $14, $04
	db $20, $08, $20, $16, $04
	db $20, $10, $18, $18, $04
	db $20, $18, $10, $1a, $04
	db $20, $20, $08, $1c, $04
	db $ff
BattleAnimObjectOam_3f_6221:
	db $00, $00, $28, $1e, $04
	db $00, $08, $20, $20, $04
	db $00, $10, $18, $22, $04
	db $00, $18, $10, $24, $04
	db $00, $20, $08, $26, $04
	db $10, $00, $28, $28, $04
	db $10, $08, $20, $2a, $04
	db $10, $10, $18, $2c, $04
	db $10, $18, $10, $2e, $04
	db $10, $20, $08, $30, $04
	db $10, $28, $00, $32, $04
	db $20, $00, $28, $34, $04
	db $20, $08, $20, $36, $04
	db $20, $10, $18, $38, $04
	db $20, $18, $10, $3a, $04
	db $20, $20, $08, $3c, $04
	db $ff
BattleAnimObjectOam_3f_6272:
	db $00, $00, $28, $3e, $04
	db $00, $08, $20, $40, $04
	db $10, $00, $28, $42, $04
	db $10, $08, $20, $44, $04
	db $10, $10, $18, $46, $04
	db $10, $18, $10, $48, $04
	db $10, $20, $08, $4a, $04
	db $10, $28, $00, $4c, $04
	db $20, $00, $28, $4e, $04
	db $20, $08, $20, $50, $04
	db $20, $10, $18, $52, $04
	db $ff
BattleAnimObjectOam_3f_62aa:
	db $00, $28, $00, $00, $24
	db $00, $20, $08, $02, $24
	db $00, $10, $18, $04, $24
	db $00, $08, $20, $06, $24
	db $10, $28, $00, $08, $24
	db $10, $20, $08, $0a, $24
	db $10, $18, $10, $0c, $24
	db $10, $10, $18, $0e, $24
	db $10, $08, $20, $10, $24
	db $10, $00, $28, $12, $24
	db $20, $28, $00, $14, $24
	db $20, $20, $08, $16, $24
	db $20, $18, $10, $18, $24
	db $20, $10, $18, $1a, $24
	db $20, $08, $20, $1c, $24
	db $ff
BattleAnimObjectOam_3f_62f6:
	db $00, $28, $00, $1e, $24
	db $00, $20, $08, $20, $24
	db $00, $18, $10, $22, $24
	db $00, $10, $18, $24, $24
	db $00, $08, $20, $26, $24
	db $10, $28, $00, $28, $24
	db $10, $20, $08, $2a, $24
	db $10, $18, $10, $2c, $24
	db $10, $10, $18, $2e, $24
	db $10, $08, $20, $30, $24
	db $10, $00, $28, $32, $24
	db $20, $28, $00, $34, $24
	db $20, $20, $08, $36, $24
	db $20, $18, $10, $38, $24
	db $20, $10, $18, $3a, $24
	db $20, $08, $20, $3c, $24
	db $ff
BattleAnimObjectOam_3f_6347:
	db $00, $28, $00, $3e, $24
	db $00, $20, $08, $40, $24
	db $10, $28, $00, $42, $24
	db $10, $20, $08, $44, $24
	db $10, $18, $10, $46, $24
	db $10, $10, $18, $48, $24
	db $10, $08, $20, $4a, $24
	db $10, $00, $28, $4c, $24
	db $20, $28, $00, $4e, $24
	db $20, $20, $08, $50, $24
	db $20, $18, $10, $52, $24
	db $ff
BattleAnimObjectOam_3f_637f:
	db $00, $20, $08, $54, $04
	db $10, $00, $28, $56, $04
	db $10, $08, $20, $58, $04
	db $10, $10, $18, $5a, $04
	db $10, $18, $10, $5c, $04
	db $10, $20, $08, $5e, $04
	db $10, $28, $00, $60, $04
	db $20, $00, $28, $62, $04
	db $20, $08, $20, $64, $04
	db $20, $10, $18, $66, $04
	db $20, $18, $10, $68, $04
	db $20, $20, $08, $6a, $04
	db $20, $28, $00, $6c, $04
	db $ff
BattleAnimObjectOam_3f_63c1:
	db $10, $10, $18, $6e, $04
	db $20, $00, $28, $70, $04
	db $20, $08, $20, $72, $04
	db $20, $10, $18, $74, $04
	db $20, $18, $10, $76, $04
	db $20, $20, $08, $78, $04
	db $20, $28, $00, $7a, $04
	db $ff
BattleAnimObjectOamFrames_3f_63e5:
	dw BattleAnimObjectOam_3f_63f3
	dw BattleAnimObjectOam_3f_63f3
	dw BattleAnimObjectOam_3f_644e
	dw BattleAnimObjectOam_3f_64b8
	dw BattleAnimObjectOam_3f_6522
	dw BattleAnimObjectOam_3f_658c
	dw BattleAnimObjectOam_3f_65f6
BattleAnimObjectOam_3f_63f3:
	db $00, $10, $20, $00, $04
	db $00, $18, $18, $02, $04
	db $00, $20, $10, $04, $04
	db $00, $28, $08, $06, $04
	db $00, $30, $00, $08, $04
	db $10, $08, $28, $0a, $04
	db $10, $10, $20, $0c, $04
	db $10, $18, $18, $0e, $04
	db $10, $20, $10, $10, $04
	db $10, $28, $08, $12, $04
	db $10, $30, $00, $14, $04
	db $20, $00, $30, $16, $04
	db $20, $08, $28, $18, $04
	db $20, $10, $20, $1a, $04
	db $20, $18, $18, $1c, $04
	db $20, $20, $10, $1e, $04
	db $20, $28, $08, $20, $04
	db $20, $30, $00, $22, $04
	db $ff
BattleAnimObjectOam_3f_644e:
	db $00, $00, $30, $24, $04
	db $00, $08, $28, $26, $04
	db $00, $10, $20, $28, $04
	db $00, $18, $18, $2a, $04
	db $00, $20, $10, $2c, $04
	db $00, $28, $08, $2e, $04
	db $00, $30, $00, $30, $04
	db $10, $00, $30, $32, $04
	db $10, $08, $28, $34, $04
	db $10, $10, $20, $36, $04
	db $10, $18, $18, $38, $04
	db $10, $20, $10, $3a, $04
	db $10, $28, $08, $3c, $04
	db $10, $30, $00, $3e, $04
	db $20, $00, $30, $40, $04
	db $20, $08, $28, $42, $04
	db $20, $10, $20, $44, $04
	db $20, $18, $18, $46, $04
	db $20, $20, $10, $48, $04
	db $20, $28, $08, $4a, $04
	db $20, $30, $00, $4c, $04
	db $ff
BattleAnimObjectOam_3f_64b8:
	db $00, $00, $30, $4e, $04
	db $00, $08, $28, $50, $04
	db $00, $10, $20, $52, $04
	db $00, $18, $18, $54, $04
	db $00, $20, $10, $56, $04
	db $00, $28, $08, $58, $04
	db $00, $30, $00, $5a, $04
	db $10, $00, $30, $5c, $04
	db $10, $08, $28, $5e, $04
	db $10, $10, $20, $60, $04
	db $10, $18, $18, $62, $04
	db $10, $20, $10, $64, $04
	db $10, $28, $08, $66, $04
	db $10, $30, $00, $68, $04
	db $20, $00, $30, $6a, $04
	db $20, $08, $28, $6c, $04
	db $20, $10, $20, $6e, $04
	db $20, $18, $18, $70, $04
	db $20, $20, $10, $72, $04
	db $20, $28, $08, $74, $04
	db $20, $30, $00, $76, $04
	db $ff
BattleAnimObjectOam_3f_6522:
	db $00, $00, $30, $00, $04
	db $00, $08, $28, $02, $04
	db $00, $10, $20, $04, $04
	db $00, $18, $18, $06, $04
	db $00, $20, $10, $08, $04
	db $00, $28, $08, $0a, $04
	db $00, $30, $00, $0c, $04
	db $10, $00, $30, $0e, $04
	db $10, $08, $28, $10, $04
	db $10, $10, $20, $12, $04
	db $10, $18, $18, $14, $04
	db $10, $20, $10, $16, $04
	db $10, $28, $08, $18, $04
	db $10, $30, $00, $1a, $04
	db $20, $00, $30, $1c, $04
	db $20, $08, $28, $1e, $04
	db $20, $10, $20, $20, $04
	db $20, $18, $18, $22, $04
	db $20, $20, $10, $24, $04
	db $20, $28, $08, $26, $04
	db $20, $30, $00, $28, $04
	db $ff
BattleAnimObjectOam_3f_658c:
	db $00, $00, $30, $2a, $04
	db $00, $08, $28, $2c, $04
	db $00, $10, $20, $2e, $04
	db $00, $18, $18, $30, $04
	db $00, $20, $10, $32, $04
	db $00, $28, $08, $34, $04
	db $00, $30, $00, $36, $04
	db $10, $00, $30, $38, $04
	db $10, $08, $28, $3a, $04
	db $10, $10, $20, $3c, $04
	db $10, $18, $18, $3e, $04
	db $10, $20, $10, $40, $04
	db $10, $28, $08, $42, $04
	db $10, $30, $00, $44, $04
	db $20, $00, $30, $46, $04
	db $20, $08, $28, $48, $04
	db $20, $10, $20, $4a, $04
	db $20, $18, $18, $4c, $04
	db $20, $20, $10, $4e, $04
	db $20, $28, $08, $50, $04
	db $20, $30, $00, $52, $04
	db $ff
BattleAnimObjectOam_3f_65f6:
	db $00, $00, $30, $54, $04
	db $00, $08, $28, $56, $04
	db $00, $10, $20, $58, $04
	db $00, $18, $18, $5a, $04
	db $00, $20, $10, $5c, $04
	db $00, $28, $08, $5e, $04
	db $00, $30, $00, $60, $04
	db $10, $00, $30, $62, $04
	db $10, $08, $28, $64, $04
	db $10, $10, $20, $66, $04
	db $10, $18, $18, $68, $04
	db $10, $20, $10, $6a, $04
	db $10, $28, $08, $6c, $04
	db $10, $30, $00, $6e, $04
	db $20, $00, $30, $70, $04
	db $20, $08, $28, $72, $04
	db $20, $10, $20, $74, $04
	db $20, $18, $18, $76, $04
	db $20, $20, $10, $78, $04
	db $20, $28, $08, $7a, $04
	db $20, $30, $00, $7c, $04
	db $ff
BattleAnimObjectOamFrames_3f_6660:
	dw BattleAnimObjectOam_3f_6668
	dw BattleAnimObjectOam_3f_6668
	dw BattleAnimObjectOam_3f_6691
	dw BattleAnimObjectOam_3f_66ba
BattleAnimObjectOam_3f_6668:
	db $00, $00, $18, $00, $04
	db $00, $08, $10, $02, $04
	db $00, $10, $08, $04, $04
	db $00, $18, $00, $06, $04
	db $10, $00, $18, $08, $04
	db $10, $08, $10, $0a, $04
	db $10, $10, $08, $0c, $04
	db $10, $18, $00, $0e, $04
	db $ff
BattleAnimObjectOam_3f_6691:
	db $00, $00, $18, $10, $04
	db $00, $08, $10, $12, $04
	db $00, $10, $08, $14, $04
	db $00, $18, $00, $16, $04
	db $10, $00, $18, $18, $04
	db $10, $08, $10, $1a, $04
	db $10, $10, $08, $1c, $04
	db $10, $18, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_66ba:
	db $00, $00, $18, $20, $04
	db $00, $08, $10, $22, $04
	db $00, $10, $08, $24, $04
	db $00, $18, $00, $26, $04
	db $10, $00, $18, $28, $04
	db $10, $08, $10, $2a, $04
	db $10, $10, $08, $2c, $04
	db $10, $18, $00, $2e, $04
	db $ff
BattleAnimObjectOamFrames_3f_66e3:
	dw BattleAnimObjectOam_3f_66ef
	dw BattleAnimObjectOam_3f_66ef
	dw BattleAnimObjectOam_3f_66fa
	dw BattleAnimObjectOam_3f_6723
	dw BattleAnimObjectOam_3f_674c
	dw BattleAnimObjectOam_3f_6775
BattleAnimObjectOam_3f_66ef:
	db $08, $08, $10, $00, $04
	db $08, $10, $08, $02, $04
	db $ff
BattleAnimObjectOam_3f_66fa:
	db $00, $00, $18, $04, $04
	db $00, $08, $10, $06, $04
	db $00, $10, $08, $08, $04
	db $00, $18, $00, $0a, $04
	db $10, $00, $18, $0c, $04
	db $10, $08, $10, $0e, $04
	db $10, $10, $08, $10, $04
	db $10, $18, $00, $12, $04
	db $ff
BattleAnimObjectOam_3f_6723:
	db $00, $00, $18, $14, $04
	db $00, $08, $10, $16, $04
	db $00, $10, $08, $18, $04
	db $00, $18, $00, $1a, $04
	db $10, $00, $18, $1c, $04
	db $10, $08, $10, $1e, $04
	db $10, $10, $08, $20, $04
	db $10, $18, $00, $22, $04
	db $ff
BattleAnimObjectOam_3f_674c:
	db $00, $00, $18, $24, $04
	db $00, $08, $10, $26, $04
	db $00, $10, $08, $28, $04
	db $00, $18, $00, $2a, $04
	db $10, $00, $18, $2c, $04
	db $10, $08, $10, $2e, $04
	db $10, $10, $08, $30, $04
	db $10, $18, $00, $32, $04
	db $ff
BattleAnimObjectOam_3f_6775:
	db $00, $00, $18, $34, $04
	db $00, $08, $10, $36, $04
	db $00, $10, $08, $38, $04
	db $00, $18, $00, $3a, $04
	db $10, $00, $18, $3c, $04
	db $10, $08, $10, $3e, $04
	db $10, $10, $08, $40, $04
	db $10, $18, $00, $42, $04
	db $ff
BattleAnimObjectOamFrames_3f_679e:
	dw BattleAnimObjectOam_3f_67a8
	dw BattleAnimObjectOam_3f_67a8
	dw BattleAnimObjectOam_3f_67d1
	dw BattleAnimObjectOam_3f_67fa
	dw BattleAnimObjectOam_3f_6823
BattleAnimObjectOam_3f_67a8:
	db $00, $00, $18, $00, $04
	db $00, $08, $10, $02, $04
	db $00, $10, $08, $04, $04
	db $00, $18, $00, $06, $04
	db $10, $00, $18, $08, $04
	db $10, $08, $10, $0a, $04
	db $10, $10, $08, $0c, $04
	db $10, $18, $00, $0e, $04
	db $ff
BattleAnimObjectOam_3f_67d1:
	db $00, $00, $18, $10, $04
	db $00, $08, $10, $12, $04
	db $00, $10, $08, $14, $04
	db $00, $18, $00, $16, $04
	db $10, $00, $18, $18, $04
	db $10, $08, $10, $1a, $04
	db $10, $10, $08, $1c, $04
	db $10, $18, $00, $1e, $04
	db $ff
BattleAnimObjectOam_3f_67fa:
	db $00, $00, $18, $20, $04
	db $00, $08, $10, $22, $04
	db $00, $10, $08, $24, $04
	db $00, $18, $00, $26, $04
	db $10, $00, $18, $28, $04
	db $10, $08, $10, $2a, $04
	db $10, $10, $08, $2c, $04
	db $10, $18, $00, $2e, $04
	db $ff
BattleAnimObjectOam_3f_6823:
	db $00, $00, $18, $30, $04
	db $00, $08, $10, $32, $04
	db $00, $10, $08, $34, $04
	db $00, $18, $00, $36, $04
	db $10, $00, $18, $38, $04
	db $10, $08, $10, $3a, $04
	db $10, $10, $08, $3c, $04
	db $10, $18, $00, $3e, $04
	db $ff
