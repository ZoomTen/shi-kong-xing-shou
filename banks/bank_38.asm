Func_038_4000:
	ld hl, wd1a0
.asm_4003
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_40b8
	ld [wd0c1], a
	ld de, SpriteComposition_Pointers
	ld a, [wBattleAnimID]
	sub $39
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
	jp z, .asm_40b4
	add c
	ld [de], a
	inc de
	ld a, [wd986]
	and a
	jr nz, .asm_4071
	ld a, [wBattleAnimID]
	cp $48
	jr z, .asm_4071
	cp $4A
	jr z, .asm_4071
	cp $4C
	jr z, .asm_4071
	cp $4E
	jr z, .asm_4071
	cp $50
	jr z, .asm_4071
	cp $56
	jr z, .asm_4071
	cp $5D
	jr z, .asm_4071
	cp $5E
	jr z, .asm_4071
	cp $60
	jr z, .asm_4071
	cp $62
	jr z, .asm_4071
	inc hl
	ld a, [hli]
	add b
	jr .asm_4074
.asm_4071
	ld a, [hli]
	add b
	inc hl
.asm_4074
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wd986]
	and a
	jr nz, .asm_40b0
	ld a, [wBattleAnimID]
	cp $48
	jr z, .asm_40b0
	cp $4A
	jr z, .asm_40b0
	cp $4C
	jr z, .asm_40b0
	cp $4E
	jr z, .asm_40b0
	cp $50
	jr z, .asm_40b0
	cp $56
	jr z, .asm_40b0
	cp $5D
	jr z, .asm_40b0
	cp $5E
	jr z, .asm_40b0
	cp $60
	jr z, .asm_40b0
	cp $62
	jr z, .asm_40b0
	ld a, [de]
	or $20
	ld [de], a
.asm_40b0
	inc de
	jp .asm_4032
.asm_40b4
	ld a, e
	ld [wd1fb], a
.asm_40b8
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	jp .asm_4003
SpriteComposition_Pointers:
	dw SpriteComposition_Map39
	dw SpriteComposition_Map3A
	dw SpriteComposition_Map3B
	dw SpriteComposition_Map3C
	dw SpriteComposition_Map3D
	dw SpriteComposition_Map3E
	dw SpriteComposition_Map3F
	dw SpriteComposition_Map40
	dw SpriteComposition_Map41
	dw SpriteComposition_Map42
	dw SpriteComposition_Map43
	dw SpriteComposition_Map44
	dw SpriteComposition_Map45
	dw SpriteComposition_Map46
	dw SpriteComposition_Map47
	dw SpriteComposition_Map48
	dw SpriteComposition_Map49
	dw SpriteComposition_Map4A
	dw SpriteComposition_Map4B
	dw SpriteComposition_Map4C
	dw SpriteComposition_Map4D
	dw SpriteComposition_Map4E
	dw SpriteComposition_Map4F
	dw SpriteComposition_Map50
	dw SpriteComposition_Map51
	dw SpriteComposition_Map51
	dw SpriteComposition_Map53
	dw SpriteComposition_Map53
	dw SpriteComposition_Map55
	dw SpriteComposition_Map56
	dw SpriteComposition_Map57
	dw SpriteComposition_Map57
	dw SpriteComposition_Map59
	dw SpriteComposition_Map5A
	dw SpriteComposition_Map5B
	dw SpriteComposition_Map5C
	dw SpriteComposition_Map5D
	dw SpriteComposition_Map5E
	dw SpriteComposition_Map5F
	dw SpriteComposition_Map60
	dw SpriteComposition_Map61
	dw SpriteComposition_Map62
SpriteComposition_Map39:
	dw SpriteComposition_Map39_412e
	dw SpriteComposition_Map39_412e
	dw SpriteComposition_Map39_417f
	dw SpriteComposition_Map39_41d0
	dw SpriteComposition_Map39_4221
	dw SpriteComposition_Map39_4272
	dw SpriteComposition_Map39_42b9
	dw SpriteComposition_Map39_4300
	dw SpriteComposition_Map39_4347
	dw SpriteComposition_Map39_438e
	dw SpriteComposition_Map39_439e
SpriteComposition_Map39_412e:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $10, $00
	db $28, $0c, $04, $10, $08, $20, $0e, $04, $10, $20, $08, $10, $04, $10, $28, $00
	db $12, $04, $20, $00, $28, $14, $04, $20, $08, $20, $16, $04, $20, $10, $18, $18
	db $04, $20, $18, $10, $1a, $04, $20, $20, $08, $1c, $04, $20, $28, $00, $1e, $04
	db $ff
SpriteComposition_Map39_417f:
	db $00, $00, $28, $20, $04, $00, $08, $20, $22, $04, $00, $10, $18, $24, $04, $00
	db $18, $10, $26, $04, $00, $20, $08, $28, $04, $00, $28, $00, $2a, $04, $10, $00
	db $28, $2c, $04, $10, $08, $20, $2e, $04, $10, $20, $08, $30, $04, $10, $28, $00
	db $32, $04, $20, $00, $28, $34, $04, $20, $08, $20, $36, $04, $20, $10, $18, $38
	db $04, $20, $18, $10, $3a, $04, $20, $20, $08, $3c, $04, $20, $28, $00, $3e, $04
	db $ff
SpriteComposition_Map39_41d0:
	db $00, $00, $28, $40, $04, $00, $08, $20, $42, $04, $00, $10, $18, $44, $04, $00
	db $18, $10, $46, $04, $00, $20, $08, $48, $04, $00, $28, $00, $4a, $04, $10, $00
	db $28, $4c, $04, $10, $08, $20, $4e, $04, $10, $20, $08, $50, $04, $10, $28, $00
	db $52, $04, $20, $00, $28, $54, $04, $20, $08, $20, $56, $04, $20, $10, $18, $58
	db $04, $20, $18, $10, $5a, $04, $20, $20, $08, $5c, $04, $20, $28, $00, $5e, $04
	db $ff
SpriteComposition_Map39_4221:
	db $00, $00, $28, $60, $04, $00, $08, $20, $62, $04, $00, $10, $18, $64, $04, $00
	db $18, $10, $66, $04, $00, $20, $08, $68, $04, $00, $28, $00, $6a, $04, $10, $00
	db $28, $6c, $04, $10, $08, $20, $6e, $04, $10, $20, $08, $70, $04, $10, $28, $00
	db $72, $04, $20, $00, $28, $74, $04, $20, $08, $20, $76, $04, $20, $10, $18, $78
	db $04, $20, $18, $10, $7a, $04, $20, $20, $08, $7c, $04, $20, $28, $00, $7e, $04
	db $ff
SpriteComposition_Map39_4272:
	db $00, $08, $20, $00, $04, $00, $10, $18, $02, $04, $00, $18, $10, $04, $04, $00
	db $20, $08, $06, $04, $10, $00, $28, $08, $04, $10, $08, $20, $0a, $04, $10, $20
	db $08, $0c, $04, $10, $28, $00, $0e, $04, $20, $00, $28, $10, $04, $20, $08, $20
	db $12, $04, $20, $10, $18, $14, $04, $20, $18, $10, $16, $04, $20, $20, $08, $18
	db $04, $20, $28, $00, $1a, $04, $ff
SpriteComposition_Map39_42b9:
	db $00, $08, $20, $1c, $04, $00, $10, $18, $1e, $04, $00, $18, $10, $20, $04, $00
	db $20, $08, $22, $04, $10, $00, $28, $24, $04, $10, $08, $20, $26, $04, $10, $20
	db $08, $28, $04, $10, $28, $00, $2a, $04, $20, $00, $28, $2c, $04, $20, $08, $20
	db $2e, $04, $20, $10, $18, $30, $04, $20, $18, $10, $32, $04, $20, $20, $08, $34
	db $04, $20, $28, $00, $36, $04, $ff
SpriteComposition_Map39_4300:
	db $00, $08, $20, $38, $04, $00, $10, $18, $3a, $04, $00, $18, $10, $3c, $04, $00
	db $20, $08, $3e, $04, $10, $00, $28, $40, $04, $10, $08, $20, $42, $04, $10, $20
	db $08, $44, $04, $10, $28, $00, $46, $04, $20, $00, $28, $48, $04, $20, $08, $20
	db $4a, $04, $20, $10, $18, $4c, $04, $20, $18, $10, $4e, $04, $20, $20, $08, $50
	db $04, $20, $28, $00, $52, $04, $ff
SpriteComposition_Map39_4347:
	db $00, $08, $20, $54, $04, $00, $10, $18, $56, $04, $00, $18, $10, $58, $04, $00
	db $20, $08, $5a, $04, $10, $00, $28, $5c, $04, $10, $08, $20, $5e, $04, $10, $20
	db $08, $60, $04, $10, $28, $00, $62, $04, $20, $00, $28, $64, $04, $20, $08, $20
	db $66, $04, $20, $10, $18, $68, $04, $20, $18, $10, $6a, $04, $20, $20, $08, $6c
	db $04, $20, $28, $00, $6e, $04, $ff
SpriteComposition_Map39_438e:
	db $00, $00, $20, $70, $04, $00, $08, $18, $72, $04, $00, $10, $10, $74, $04, $ff
SpriteComposition_Map39_439e:
	db $00, $00, $20, $76, $04, $00, $08, $18, $78, $04, $00, $10, $10, $7a, $04, $00
	db $18, $08, $7c, $04, $00, $20, $00, $7e, $04, $ff
SpriteComposition_Map3A:
	dw SpriteComposition_Map3A_43ce
	dw SpriteComposition_Map3A_43ce
	dw SpriteComposition_Map3A_4415
	dw SpriteComposition_Map3A_4452
	dw SpriteComposition_Map3A_4471
	dw SpriteComposition_Map3A_449a
	dw SpriteComposition_Map3A_44aa
	dw SpriteComposition_Map3A_44f6
	dw SpriteComposition_Map3A_4533
	dw SpriteComposition_Map3A_4552
	dw SpriteComposition_Map3A_457b
SpriteComposition_Map3A_43ce:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $10, $00
	db $28, $0c, $04, $10, $08, $20, $0e, $04, $10, $10, $18, $10, $04, $10, $18, $10
	db $12, $04, $10, $20, $08, $14, $04, $10, $28, $00, $16, $04, $20, $20, $08, $18
	db $04, $20, $28, $00, $1a, $04, $ff
SpriteComposition_Map3A_4415:
	db $00, $00, $28, $1c, $04, $00, $08, $20, $1e, $04, $00, $10, $18, $20, $04, $00
	db $18, $10, $22, $04, $00, $20, $08, $24, $04, $00, $28, $00, $26, $04, $10, $00
	db $28, $28, $04, $10, $08, $20, $2a, $04, $10, $10, $18, $2c, $04, $10, $18, $10
	db $2e, $04, $10, $20, $08, $30, $04, $10, $28, $00, $32, $04, $ff
SpriteComposition_Map3A_4452:
	db $00, $00, $28, $34, $04, $00, $08, $20, $36, $04, $00, $10, $18, $38, $04, $00
	db $18, $10, $3a, $04, $10, $00, $28, $3c, $04, $10, $08, $20, $3e, $04, $ff
SpriteComposition_Map3A_4471:
	db $00, $00, $28, $40, $04, $10, $00, $28, $42, $04, $10, $08, $20, $44, $04, $10
	db $10, $18, $46, $04, $20, $08, $20, $48, $04, $20, $10, $18, $4a, $04, $20, $18
	db $10, $4c, $04, $20, $20, $08, $4e, $04, $ff
SpriteComposition_Map3A_449a:
	db $18, $10, $18, $50, $04, $18, $18, $10, $52, $04, $18, $20, $08, $54, $04, $ff
SpriteComposition_Map3A_44aa:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $10
	db $00, $28, $06, $04, $10, $08, $20, $08, $04, $10, $10, $18, $0a, $04, $10, $18
	db $10, $0c, $04, $10, $20, $08, $0e, $04, $10, $28, $00, $10, $04, $20, $00, $28
	db $12, $04, $20, $08, $20, $14, $04, $20, $10, $18, $16, $04, $20, $18, $10, $18
	db $04, $20, $20, $08, $1a, $04, $20, $28, $00, $1c, $04, $ff
SpriteComposition_Map3A_44f6:
	db $10, $00, $28, $1e, $04, $10, $08, $20, $20, $04, $10, $10, $18, $22, $04, $10
	db $18, $10, $24, $04, $10, $20, $08, $26, $04, $10, $28, $00, $28, $04, $20, $00
	db $28, $2a, $04, $20, $08, $20, $2c, $04, $20, $10, $18, $2e, $04, $20, $18, $10
	db $30, $04, $20, $20, $08, $32, $04, $20, $28, $00, $34, $04, $ff
SpriteComposition_Map3A_4533:
	db $10, $20, $08, $36, $04, $10, $28, $00, $38, $04, $20, $10, $18, $3a, $04, $20
	db $18, $10, $3c, $04, $20, $20, $08, $3e, $04, $20, $28, $00, $40, $04, $ff
SpriteComposition_Map3A_4552:
	db $00, $08, $20, $42, $04, $00, $10, $18, $44, $04, $00, $18, $10, $46, $04, $00
	db $20, $08, $48, $04, $00, $28, $00, $4a, $04, $10, $20, $08, $4c, $04, $10, $28
	db $00, $4e, $04, $20, $28, $00, $50, $04, $ff
SpriteComposition_Map3A_457b:
	db $08, $08, $20, $52, $04, $08, $10, $18, $54, $04, $08, $18, $10, $56, $04, $ff
SpriteComposition_Map3B:
	dw SpriteComposition_Map3B_4597
	dw SpriteComposition_Map3B_4597
	dw SpriteComposition_Map3B_45ac
	dw SpriteComposition_Map3B_45c1
	dw SpriteComposition_Map3B_45d6
	dw SpriteComposition_Map3B_45eb
SpriteComposition_Map3B_4597:
	db $00, $00, $08, $00, $04, $00, $08, $00, $02, $04, $10, $00, $08, $04, $04, $10
	db $08, $00, $06, $04, $ff
SpriteComposition_Map3B_45ac:
	db $00, $00, $08, $08, $04, $00, $08, $00, $0a, $04, $10, $00, $08, $0c, $04, $10
	db $08, $00, $0e, $04, $ff
SpriteComposition_Map3B_45c1:
	db $00, $00, $08, $10, $04, $00, $08, $00, $12, $04, $10, $00, $08, $14, $04, $10
	db $08, $00, $16, $04, $ff
SpriteComposition_Map3B_45d6:
	db $00, $00, $08, $18, $04, $00, $08, $00, $1a, $04, $10, $00, $08, $1c, $04, $10
	db $08, $00, $1e, $04, $ff
SpriteComposition_Map3B_45eb:
	db $00, $00, $28, $20, $04, $00, $08, $20, $22, $04, $00, $10, $18, $24, $04, $00
	db $18, $10, $26, $04, $00, $20, $08, $28, $04, $00, $28, $00, $2a, $04, $10, $00
	db $28, $2c, $04, $10, $08, $20, $2e, $04, $10, $28, $00, $30, $04, $20, $00, $28
	db $32, $04, $20, $08, $20, $34, $04, $20, $10, $18, $36, $04, $20, $18, $10, $38
	db $04, $20, $20, $08, $3a, $04, $20, $28, $00, $3c, $04, $ff
SpriteComposition_Map3C:
	dw SpriteComposition_Map3C_4645
	dw SpriteComposition_Map3C_4645
	dw SpriteComposition_Map3C_4650
	dw SpriteComposition_Map3C_4665
	dw SpriteComposition_Map3C_46c0
	dw SpriteComposition_Map3C_4665
	dw SpriteComposition_Map3C_471b
SpriteComposition_Map3C_4645:
	db $10, $08, $20, $00, $04, $10, $10, $18, $02, $04, $ff
SpriteComposition_Map3C_4650:
	db $08, $08, $20, $04, $04, $08, $10, $18, $06, $04, $18, $18, $10, $08, $04, $18
	db $20, $08, $0a, $04, $ff
SpriteComposition_Map3C_4665:
	db $00, $00, $28, $0c, $04, $00, $08, $20, $0e, $04, $00, $10, $18, $10, $04, $00
	db $18, $10, $12, $04, $00, $20, $08, $14, $04, $00, $28, $00, $16, $04, $10, $00
	db $28, $18, $04, $10, $08, $20, $1a, $04, $10, $10, $18, $1c, $04, $10, $18, $10
	db $1e, $04, $10, $20, $08, $20, $04, $10, $28, $00, $22, $04, $20, $00, $28, $24
	db $04, $20, $08, $20, $26, $04, $20, $10, $18, $28, $04, $20, $18, $10, $2a, $04
	db $20, $20, $08, $2c, $04, $20, $28, $00, $2e, $04, $ff
SpriteComposition_Map3C_46c0:
	db $00, $00, $28, $30, $04, $00, $08, $20, $32, $04, $00, $10, $18, $34, $04, $00
	db $18, $10, $36, $04, $00, $20, $08, $38, $04, $00, $28, $00, $3a, $04, $10, $00
	db $28, $3c, $04, $10, $08, $20, $3e, $04, $10, $10, $18, $40, $04, $10, $18, $10
	db $42, $04, $10, $20, $08, $44, $04, $10, $28, $00, $46, $04, $20, $00, $28, $48
	db $04, $20, $08, $20, $4a, $04, $20, $10, $18, $4c, $04, $20, $18, $10, $4e, $04
	db $20, $20, $08, $50, $04, $20, $28, $00, $52, $04, $ff
SpriteComposition_Map3C_471b:
	db $00, $00, $28, $54, $04, $00, $08, $20, $56, $04, $00, $10, $18, $58, $04, $00
	db $18, $10, $5a, $04, $00, $20, $08, $5c, $04, $00, $28, $00, $5e, $04, $10, $00
	db $28, $60, $04, $10, $08, $20, $62, $04, $10, $10, $18, $64, $04, $10, $18, $10
	db $66, $04, $10, $20, $08, $68, $04, $10, $28, $00, $6a, $04, $20, $00, $28, $6c
	db $04, $20, $08, $20, $6e, $04, $20, $10, $18, $70, $04, $20, $18, $10, $72, $04
	db $20, $20, $08, $74, $04, $20, $28, $00, $76, $04, $ff
SpriteComposition_Map3D:
	dw SpriteComposition_Map3D_4780
	dw SpriteComposition_Map3D_4780
	dw SpriteComposition_Map3D_478b
	dw SpriteComposition_Map3D_47b4
	dw SpriteComposition_Map3D_47dd
SpriteComposition_Map3D_4780:
	db $08, $08, $10, $00, $04, $08, $10, $08, $02, $04, $ff
SpriteComposition_Map3D_478b:
	db $00, $00, $18, $04, $04, $00, $08, $10, $06, $04, $00, $10, $08, $08, $04, $00
	db $18, $00, $0a, $04, $10, $00, $18, $0c, $04, $10, $08, $10, $0e, $04, $10, $10
	db $08, $10, $04, $10, $18, $00, $12, $04, $ff
SpriteComposition_Map3D_47b4:
	db $00, $00, $18, $14, $04, $00, $08, $10, $16, $04, $00, $10, $08, $18, $04, $00
	db $18, $00, $1a, $04, $10, $00, $18, $1c, $04, $10, $08, $10, $1e, $04, $10, $10
	db $08, $20, $04, $10, $18, $00, $22, $04, $ff
SpriteComposition_Map3D_47dd:
	db $00, $00, $20, $24, $04, $00, $08, $18, $26, $04, $00, $10, $10, $28, $04, $00
	db $18, $08, $2a, $04, $00, $20, $00, $2c, $04, $10, $00, $20, $2e, $04, $10, $08
	db $18, $30, $04, $10, $10, $10, $32, $04, $10, $18, $08, $34, $04, $10, $20, $00
	db $36, $04, $20, $00, $20, $38, $04, $20, $08, $18, $3a, $04, $20, $10, $10, $3c
	db $04, $20, $18, $08, $3e, $04, $20, $20, $00, $40, $04, $ff
SpriteComposition_Map3E:
	dr $e0829, $e0944
SpriteComposition_Map3F:
	dw SpriteComposition_Map3F_494c
	dw SpriteComposition_Map3F_494c
	dw SpriteComposition_Map3F_4975
	dw SpriteComposition_Map3F_499e
SpriteComposition_Map3F_494c:
	db $00, $00, $18, $00, $04, $00, $08, $10, $02, $04, $00, $10, $08, $04, $04, $00
	db $18, $00, $06, $04, $10, $00, $18, $08, $04, $10, $08, $10, $0a, $04, $10, $10
	db $08, $0c, $04, $10, $18, $00, $0e, $04, $ff
SpriteComposition_Map3F_4975:
	db $00, $00, $18, $10, $04, $00, $08, $10, $12, $04, $00, $10, $08, $14, $04, $00
	db $18, $00, $16, $04, $10, $00, $18, $18, $04, $10, $08, $10, $1a, $04, $10, $10
	db $08, $1c, $04, $10, $18, $00, $1e, $04, $ff
SpriteComposition_Map3F_499e:
	db $00, $00, $18, $20, $04, $00, $08, $10, $22, $04, $00, $10, $08, $24, $04, $00
	db $18, $00, $26, $04, $10, $00, $18, $28, $04, $10, $08, $10, $2a, $04, $10, $10
	db $08, $2c, $04, $10, $18, $00, $2e, $04, $ff
SpriteComposition_Map40:
	dw SpriteComposition_Map40_49d7
	dw SpriteComposition_Map40_49d7
	dw SpriteComposition_Map40_49e7
	dw SpriteComposition_Map40_49f7
	dw SpriteComposition_Map40_4a07
	dw SpriteComposition_Map40_4a26
	dw SpriteComposition_Map40_4a59
	dw SpriteComposition_Map40_4a8c
SpriteComposition_Map40_49d7:
	db $08, $08, $18, $00, $04, $08, $10, $10, $02, $04, $08, $18, $08, $04, $04, $ff
SpriteComposition_Map40_49e7:
	db $08, $08, $18, $06, $04, $08, $10, $10, $08, $04, $08, $18, $08, $0a, $04, $ff
SpriteComposition_Map40_49f7:
	db $08, $08, $18, $0c, $04, $08, $10, $10, $0e, $04, $08, $18, $08, $10, $04, $ff
SpriteComposition_Map40_4a07:
	db $00, $08, $18, $12, $04, $00, $10, $10, $14, $04, $00, $18, $08, $16, $04, $10
	db $08, $18, $18, $04, $10, $10, $10, $1a, $04, $10, $18, $08, $1c, $04, $ff
SpriteComposition_Map40_4a26:
	db $00, $00, $20, $1e, $04, $00, $08, $18, $20, $04, $00, $10, $10, $22, $04, $00
	db $18, $08, $24, $04, $00, $20, $00, $26, $04, $10, $00, $20, $28, $04, $10, $08
	db $18, $2a, $04, $10, $10, $10, $2c, $04, $10, $18, $08, $2e, $04, $10, $20, $00
	db $30, $04, $ff
SpriteComposition_Map40_4a59:
	db $00, $00, $20, $32, $04, $00, $08, $18, $34, $04, $00, $10, $10, $36, $04, $00
	db $18, $08, $38, $04, $00, $20, $00, $3a, $04, $10, $00, $20, $3c, $04, $10, $08
	db $18, $3e, $04, $10, $10, $10, $40, $04, $10, $18, $08, $42, $04, $10, $20, $00
	db $44, $04, $ff
SpriteComposition_Map40_4a8c:
	db $00, $00, $20, $46, $04, $00, $08, $18, $48, $04, $00, $10, $10, $4a, $04, $00
	db $18, $08, $4c, $04, $00, $20, $00, $4e, $04, $10, $00, $20, $50, $04, $10, $08
	db $18, $52, $04, $10, $10, $10, $54, $04, $10, $18, $08, $56, $04, $10, $20, $00
	db $58, $04, $20, $00, $20, $5a, $04, $20, $08, $18, $5c, $04, $20, $10, $10, $5e
	db $04, $20, $18, $08, $60, $04, $20, $20, $00, $62, $04, $ff
SpriteComposition_Map41:
	dw SpriteComposition_Map41_4aea
	dw SpriteComposition_Map41_4aea
	dw SpriteComposition_Map41_4aff
	dw SpriteComposition_Map41_4b0f
	dw SpriteComposition_Map41_4b1f
	dw SpriteComposition_Map41_4aea
	dw SpriteComposition_Map41_4aea
	dw SpriteComposition_Map41_4aff
	dw SpriteComposition_Map41_4aff
SpriteComposition_Map41_4aea:
	db $00, $00, $18, $00, $04, $00, $08, $10, $02, $04, $00, $10, $08, $04, $04, $00
	db $18, $00, $06, $04, $ff
SpriteComposition_Map41_4aff:
	db $00, $00, $10, $08, $04, $00, $08, $08, $0a, $04, $00, $10, $00, $0c, $04, $ff
SpriteComposition_Map41_4b0f:
	db $00, $00, $10, $0e, $04, $00, $08, $08, $10, $04, $00, $10, $00, $12, $04, $ff
SpriteComposition_Map41_4b1f:
	db $00, $00, $10, $14, $04, $00, $08, $08, $16, $04, $00, $10, $00, $18, $04, $ff
SpriteComposition_Map42:
	dw SpriteComposition_Map42_4b3d
	dw SpriteComposition_Map42_4b3d
	dw SpriteComposition_Map42_4b66
	dw SpriteComposition_Map42_4b8f
	dw SpriteComposition_Map42_4bb8
	dw SpriteComposition_Map42_4be1
	dw SpriteComposition_Map42_4bf1
SpriteComposition_Map42_4b3d:
	db $00, $00, $18, $00, $04, $00, $08, $10, $02, $04, $00, $10, $08, $04, $04, $00
	db $18, $00, $06, $04, $10, $00, $18, $08, $04, $10, $08, $10, $0a, $04, $10, $10
	db $08, $0c, $04, $10, $18, $00, $0e, $04, $ff
SpriteComposition_Map42_4b66:
	db $00, $00, $18, $10, $04, $00, $08, $10, $12, $04, $00, $10, $08, $14, $04, $00
	db $18, $00, $16, $04, $10, $00, $18, $18, $04, $10, $08, $10, $1a, $04, $10, $10
	db $08, $1c, $04, $10, $18, $00, $1e, $04, $ff
SpriteComposition_Map42_4b8f:
	db $00, $00, $18, $20, $04, $00, $08, $10, $22, $04, $00, $10, $08, $24, $04, $00
	db $18, $00, $26, $04, $10, $00, $18, $28, $04, $10, $08, $10, $2a, $04, $10, $10
	db $08, $2c, $04, $10, $18, $00, $2e, $04, $ff
SpriteComposition_Map42_4bb8:
	db $00, $00, $18, $30, $04, $00, $08, $10, $32, $04, $00, $10, $08, $34, $04, $00
	db $18, $00, $36, $04, $10, $00, $18, $38, $04, $10, $08, $10, $3a, $04, $10, $10
	db $08, $3c, $04, $10, $18, $00, $3e, $04, $ff
SpriteComposition_Map42_4be1:
	db $00, $00, $10, $40, $04, $00, $08, $08, $42, $04, $00, $10, $00, $44, $04, $ff
SpriteComposition_Map42_4bf1:
	db $00, $00, $20, $46, $04, $00, $08, $18, $48, $04, $00, $10, $10, $4a, $04, $00
	db $18, $08, $4c, $04, $00, $20, $00, $4e, $04, $ff
SpriteComposition_Map43:
	dw SpriteComposition_Map43_4c19
	dw SpriteComposition_Map43_4c19
	dw SpriteComposition_Map43_4c24
	dw SpriteComposition_Map43_4c2f
	dw SpriteComposition_Map43_4c5d
	dw SpriteComposition_Map43_4c77
	dw SpriteComposition_Map43_4ca0
SpriteComposition_Map43_4c19:
	db $10, $20, $08, $00, $04, $10, $28, $00, $02, $04, $ff
SpriteComposition_Map43_4c24:
	db $10, $20, $08, $04, $04, $10, $28, $00, $06, $04, $ff
SpriteComposition_Map43_4c2f:
	db $00, $00, $28, $08, $04, $00, $08, $20, $0a, $04, $00, $10, $18, $0c, $04, $00
	db $18, $10, $0e, $04, $00, $20, $08, $10, $04, $10, $00, $28, $12, $04, $10, $08
	db $20, $14, $04, $10, $10, $18, $16, $04, $10, $20, $08, $18, $04, $ff
SpriteComposition_Map43_4c5d:
	db $08, $00, $28, $1a, $04, $18, $00, $28, $1c, $04, $18, $08, $20, $1e, $04, $18
	db $10, $18, $20, $04, $18, $18, $10, $22, $04, $ff
SpriteComposition_Map43_4c77:
	db $10, $18, $10, $24, $04, $10, $20, $08, $26, $04, $10, $28, $00, $28, $04, $18
	db $08, $20, $2a, $04, $20, $10, $18, $2c, $04, $20, $18, $10, $2e, $04, $20, $20
	db $08, $30, $04, $20, $28, $00, $32, $04, $ff
SpriteComposition_Map43_4ca0:
	db $08, $08, $20, $34, $04, $08, $10, $18, $36, $04, $08, $18, $10, $38, $04, $08
	db $20, $08, $3a, $04, $08, $28, $00, $3c, $04, $18, $20, $08, $3e, $04, $ff
SpriteComposition_Map44:
	dw SpriteComposition_Map44_4cd9
	dw SpriteComposition_Map44_4cd9
	dw SpriteComposition_Map44_4cf8
	dw SpriteComposition_Map44_4d17
	dw SpriteComposition_Map44_4d36
	dw SpriteComposition_Map44_4d55
	dw SpriteComposition_Map44_4d6a
	dw SpriteComposition_Map44_4d93
	dw SpriteComposition_Map44_4dbc
	dw SpriteComposition_Map44_4de0
	dw SpriteComposition_Map44_4dff
	dw SpriteComposition_Map44_4e1e
	dw SpriteComposition_Map44_4e3d
SpriteComposition_Map44_4cd9:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $ff
SpriteComposition_Map44_4cf8:
	db $00, $00, $28, $0c, $04, $00, $08, $20, $0e, $04, $00, $10, $18, $10, $04, $00
	db $18, $10, $12, $04, $00, $20, $08, $14, $04, $00, $28, $00, $16, $04, $ff
SpriteComposition_Map44_4d17:
	db $00, $00, $28, $18, $04, $00, $08, $20, $1a, $04, $00, $10, $18, $1c, $04, $00
	db $18, $10, $1e, $04, $00, $20, $08, $20, $04, $00, $28, $00, $22, $04, $ff
SpriteComposition_Map44_4d36:
	db $00, $00, $28, $24, $04, $00, $08, $20, $26, $04, $00, $10, $18, $28, $04, $00
	db $18, $10, $2a, $04, $00, $20, $08, $2c, $04, $00, $28, $00, $2e, $04, $ff
SpriteComposition_Map44_4d55:
	db $00, $00, $28, $30, $04, $00, $08, $20, $32, $04, $00, $10, $18, $34, $04, $00
	db $18, $10, $36, $04, $ff
SpriteComposition_Map44_4d6a:
	db $00, $00, $28, $38, $04, $00, $08, $20, $3a, $04, $00, $10, $18, $3c, $04, $00
	db $18, $10, $3e, $04, $10, $10, $18, $40, $04, $10, $18, $10, $42, $04, $10, $20
	db $08, $44, $04, $10, $28, $00, $46, $04, $ff
SpriteComposition_Map44_4d93:
	db $00, $00, $28, $48, $04, $00, $08, $20, $4a, $04, $00, $10, $18, $4c, $04, $00
	db $18, $10, $4e, $04, $10, $10, $18, $50, $04, $10, $18, $10, $52, $04, $10, $20
	db $08, $54, $04, $10, $28, $00, $56, $04, $ff
SpriteComposition_Map44_4dbc:
	db $00, $00, $28, $58, $04, $00, $08, $20, $5a, $04, $00, $10, $18, $5c, $04, $00
	db $18, $10, $5e, $04, $10, $18, $10, $60, $04, $10, $20, $08, $62, $04, $10, $28
	db $00, $64, $04, $ff
SpriteComposition_Map44_4de0:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $ff
SpriteComposition_Map44_4dff:
	db $00, $00, $28, $0c, $04, $00, $08, $20, $0e, $04, $00, $10, $18, $10, $04, $00
	db $18, $10, $12, $04, $00, $20, $08, $14, $04, $00, $28, $00, $16, $04, $ff
SpriteComposition_Map44_4e1e:
	db $00, $00, $28, $18, $04, $00, $08, $20, $1a, $04, $00, $10, $18, $1c, $04, $00
	db $18, $10, $1e, $04, $00, $20, $08, $20, $04, $00, $28, $00, $22, $04, $ff
SpriteComposition_Map44_4e3d:
	db $00, $00, $28, $24, $04, $00, $08, $20, $26, $04, $00, $10, $18, $28, $04, $00
	db $18, $10, $2a, $04, $ff
SpriteComposition_Map45:
	dw SpriteComposition_Map45_4e58
	dw SpriteComposition_Map45_4e58
	dw SpriteComposition_Map45_4eb3
SpriteComposition_Map45_4e58:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $10, $00
	db $28, $0c, $04, $10, $08, $20, $0e, $04, $10, $10, $18, $10, $04, $10, $18, $10
	db $12, $04, $10, $20, $08, $14, $04, $10, $28, $00, $16, $04, $20, $00, $28, $18
	db $04, $20, $08, $20, $1a, $04, $20, $10, $18, $1c, $04, $20, $18, $10, $1e, $04
	db $20, $20, $08, $20, $04, $20, $28, $00, $22, $04, $ff
SpriteComposition_Map45_4eb3:
	db $00, $00, $28, $24, $04, $00, $08, $20, $26, $04, $00, $10, $18, $28, $04, $00
	db $18, $10, $2a, $04, $00, $20, $08, $2c, $04, $00, $28, $00, $2e, $04, $10, $00
	db $28, $30, $04, $10, $08, $20, $32, $04, $10, $10, $18, $34, $04, $10, $18, $10
	db $36, $04, $10, $20, $08, $38, $04, $10, $28, $00, $3a, $04, $20, $00, $28, $3c
	db $04, $20, $08, $20, $3e, $04, $20, $10, $18, $40, $04, $20, $18, $10, $42, $04
	db $20, $20, $08, $44, $04, $20, $28, $00, $46, $04, $ff
SpriteComposition_Map46:
	dw SpriteComposition_Map46_4f1a
	dw SpriteComposition_Map46_4f1a
	dw SpriteComposition_Map46_4f2a
	dw SpriteComposition_Map46_4f3f
	dw SpriteComposition_Map46_4f59
	dw SpriteComposition_Map46_4f64
SpriteComposition_Map46_4f1a:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $ff
SpriteComposition_Map46_4f2a:
	db $00, $00, $28, $06, $04, $00, $08, $20, $08, $04, $00, $10, $18, $0a, $04, $00
	db $18, $10, $0c, $04, $ff
SpriteComposition_Map46_4f3f:
	db $00, $08, $20, $0e, $04, $00, $10, $18, $10, $04, $00, $18, $10, $12, $04, $00
	db $20, $08, $14, $04, $00, $28, $00, $16, $04, $ff
SpriteComposition_Map46_4f59:
	db $00, $20, $08, $18, $04, $00, $28, $00, $1a, $04, $ff
SpriteComposition_Map46_4f64:
	db $00, $28, $00, $1c, $04, $ff
SpriteComposition_Map47:
	dr $e0f6a, $e0f7f
SpriteComposition_Map48:
	dw SpriteComposition_Map48_4f87
	dw SpriteComposition_Map48_4f87
	dw SpriteComposition_Map48_4fb5
	dw SpriteComposition_Map48_4ff7
SpriteComposition_Map48_4f87:
	db $00, $08, $20, $00, $04, $00, $10, $18, $02, $04, $00, $18, $10, $04, $04, $00
	db $20, $08, $06, $04, $00, $28, $00, $08, $04, $10, $10, $18, $0a, $04, $10, $18
	db $10, $0c, $04, $10, $20, $08, $0e, $04, $10, $28, $00, $10, $04, $ff
SpriteComposition_Map48_4fb5:
	db $00, $00, $28, $12, $04, $00, $08, $20, $14, $04, $00, $10, $18, $16, $04, $00
	db $18, $10, $18, $04, $00, $20, $08, $1a, $04, $00, $28, $00, $1c, $04, $10, $00
	db $28, $1e, $04, $10, $08, $20, $20, $04, $10, $10, $18, $22, $04, $10, $18, $10
	db $24, $04, $10, $20, $08, $26, $04, $10, $28, $00, $28, $04, $20, $10, $18, $2a
	db $04, $ff
SpriteComposition_Map48_4ff7:
	db $00, $00, $28, $2c, $04, $00, $08, $20, $2e, $04, $00, $10, $18, $30, $04, $00
	db $18, $10, $32, $04, $00, $20, $08, $34, $04, $00, $28, $00, $36, $04, $10, $00
	db $28, $38, $04, $10, $08, $20, $3a, $04, $10, $10, $18, $3c, $04, $10, $18, $10
	db $3e, $04, $10, $20, $08, $40, $04, $10, $28, $00, $42, $04, $ff
SpriteComposition_Map49:
	dw SpriteComposition_Map49_5042
	dw SpriteComposition_Map49_5042
	dw SpriteComposition_Map49_5061
	dw SpriteComposition_Map49_5080
	dw SpriteComposition_Map49_509f
	dw SpriteComposition_Map49_50be
	dw SpriteComposition_Map49_50ec
SpriteComposition_Map49_5042:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $ff
SpriteComposition_Map49_5061:
	db $00, $00, $28, $0c, $04, $00, $08, $20, $0e, $04, $00, $10, $18, $10, $04, $00
	db $18, $10, $12, $04, $00, $20, $08, $14, $04, $00, $28, $00, $16, $04, $ff
SpriteComposition_Map49_5080:
	db $08, $00, $10, $18, $04, $08, $08, $08, $1a, $04, $08, $10, $00, $1c, $04, $18
	db $00, $10, $1e, $04, $18, $08, $08, $20, $04, $18, $10, $00, $22, $04, $ff
SpriteComposition_Map49_509f:
	db $08, $00, $10, $24, $04, $08, $08, $08, $26, $04, $08, $10, $00, $28, $04, $18
	db $00, $10, $2a, $04, $18, $08, $08, $2c, $04, $18, $10, $00, $2e, $04, $ff
SpriteComposition_Map49_50be:
	db $00, $00, $10, $30, $04, $00, $08, $08, $32, $04, $00, $10, $00, $34, $04, $10
	db $00, $10, $36, $04, $10, $08, $08, $38, $04, $10, $10, $00, $3a, $04, $20, $00
	db $10, $3c, $04, $20, $08, $08, $3e, $04, $20, $10, $00, $40, $04, $ff
SpriteComposition_Map49_50ec:
	db $00, $00, $10, $42, $04, $00, $08, $08, $44, $04, $10, $00, $10, $46, $04, $10
	db $08, $08, $48, $04, $20, $00, $10, $4a, $04, $20, $08, $08, $4c, $04, $ff
SpriteComposition_Map4A:
	dw SpriteComposition_Map4A_5113
	dw SpriteComposition_Map4A_5113
	dw SpriteComposition_Map4A_5164
	dw SpriteComposition_Map4A_51ba
SpriteComposition_Map4A_5113:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $10, $08
	db $20, $0c, $04, $10, $10, $18, $0e, $04, $10, $18, $10, $10, $04, $10, $20, $08
	db $12, $04, $10, $28, $00, $14, $04, $20, $00, $28, $16, $04, $20, $08, $20, $18
	db $04, $20, $10, $18, $1a, $04, $20, $18, $10, $1c, $04, $20, $20, $08, $1e, $04
	db $ff
SpriteComposition_Map4A_5164:
	db $00, $00, $28, $20, $04, $00, $10, $18, $22, $04, $00, $18, $10, $24, $04, $00
	db $20, $08, $26, $04, $00, $28, $00, $28, $04, $10, $00, $28, $2a, $04, $10, $08
	db $20, $2c, $04, $10, $10, $18, $2e, $04, $10, $18, $10, $30, $04, $10, $20, $08
	db $32, $04, $10, $28, $00, $34, $04, $20, $00, $28, $36, $04, $20, $08, $20, $38
	db $04, $20, $10, $18, $3a, $04, $20, $18, $10, $3c, $04, $20, $20, $08, $3e, $04
	db $20, $28, $00, $40, $04, $ff
SpriteComposition_Map4A_51ba:
	db $00, $08, $20, $42, $04, $00, $10, $18, $44, $04, $00, $20, $08, $46, $04, $10
	db $00, $28, $48, $04, $10, $08, $20, $4a, $04, $10, $10, $18, $4c, $04, $10, $18
	db $10, $4e, $04, $ff
SpriteComposition_Map4B:
	dw SpriteComposition_Map4B_51ee
	dw SpriteComposition_Map4B_51ee
	dw SpriteComposition_Map4B_5217
	dw SpriteComposition_Map4B_525e
	dw SpriteComposition_Map4B_52a5
	dw SpriteComposition_Map4B_52c9
	dw SpriteComposition_Map4B_5310
	dw SpriteComposition_Map4B_5352
SpriteComposition_Map4B_51ee:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $10, $00, $28, $08, $04, $10, $08, $20, $0a, $04, $10, $10
	db $18, $0c, $04, $10, $18, $10, $0e, $04, $ff
SpriteComposition_Map4B_5217:
	db $00, $00, $28, $10, $04, $00, $08, $20, $12, $04, $00, $10, $18, $14, $04, $00
	db $18, $10, $16, $04, $10, $00, $28, $18, $04, $10, $08, $20, $1a, $04, $10, $10
	db $18, $1c, $04, $10, $18, $10, $1e, $04, $10, $20, $08, $20, $04, $20, $00, $28
	db $22, $04, $20, $08, $20, $24, $04, $20, $10, $18, $26, $04, $20, $18, $10, $28
	db $04, $20, $20, $08, $2a, $04, $ff
SpriteComposition_Map4B_525e:
	db $00, $00, $28, $2c, $04, $00, $08, $20, $2e, $04, $10, $00, $28, $30, $04, $10
	db $08, $20, $32, $04, $10, $10, $18, $34, $04, $10, $18, $10, $36, $04, $10, $20
	db $08, $38, $04, $10, $28, $00, $3a, $04, $20, $00, $28, $3c, $04, $20, $08, $20
	db $3e, $04, $20, $10, $18, $40, $04, $20, $18, $10, $42, $04, $20, $20, $08, $44
	db $04, $20, $28, $00, $46, $04, $ff
SpriteComposition_Map4B_52a5:
	db $00, $08, $30, $00, $04, $00, $10, $28, $02, $04, $00, $18, $20, $04, $04, $10
	db $00, $38, $06, $04, $10, $08, $30, $08, $04, $10, $10, $28, $0a, $04, $10, $18
	db $20, $0c, $04, $ff
SpriteComposition_Map4B_52c9:
	db $00, $00, $38, $0e, $04, $00, $08, $30, $10, $04, $00, $10, $28, $12, $04, $00
	db $18, $20, $14, $04, $00, $20, $18, $16, $04, $00, $28, $10, $18, $04, $00, $30
	db $08, $1a, $04, $10, $00, $38, $1c, $04, $10, $08, $30, $1e, $04, $10, $10, $28
	db $20, $04, $10, $18, $20, $22, $04, $10, $20, $18, $24, $04, $10, $28, $10, $26
	db $04, $10, $30, $08, $28, $04, $ff
SpriteComposition_Map4B_5310:
	db $00, $00, $38, $2a, $04, $00, $08, $30, $2c, $04, $00, $10, $28, $2e, $04, $00
	db $18, $20, $30, $04, $00, $20, $18, $32, $04, $00, $28, $10, $34, $04, $10, $00
	db $38, $36, $04, $10, $08, $30, $38, $04, $10, $10, $28, $3a, $04, $10, $18, $20
	db $3c, $04, $10, $20, $18, $3e, $04, $10, $28, $10, $40, $04, $10, $30, $08, $42
	db $04, $ff
SpriteComposition_Map4B_5352:
	db $00, $00, $38, $44, $04, $00, $08, $30, $46, $04, $00, $10, $28, $48, $04, $00
	db $18, $20, $4a, $04, $00, $20, $18, $4c, $04, $00, $28, $10, $4e, $04, $00, $30
	db $08, $50, $04, $10, $00, $38, $52, $04, $10, $08, $30, $54, $04, $10, $10, $28
	db $56, $04, $10, $18, $20, $58, $04, $10, $20, $18, $5a, $04, $10, $28, $10, $5c
	db $04, $10, $30, $08, $5e, $04, $10, $38, $00, $60, $04, $ff
SpriteComposition_Map4C:
	dw SpriteComposition_Map4C_53a6
	dw SpriteComposition_Map4C_53a6
	dw SpriteComposition_Map4C_53a6
	dw SpriteComposition_Map4C_53a6
SpriteComposition_Map4C_53a6:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $10, $00
	db $28, $0c, $04, $10, $08, $20, $0e, $04, $10, $10, $18, $10, $04, $10, $18, $10
	db $12, $04, $10, $20, $08, $14, $04, $10, $28, $00, $16, $04, $20, $00, $28, $18
	db $04, $20, $08, $20, $1a, $04, $20, $10, $18, $1c, $04, $20, $18, $10, $1e, $04
	db $20, $20, $08, $20, $04, $20, $28, $00, $22, $04, $ff
SpriteComposition_Map4D:
	dw SpriteComposition_Map4D_5419
	dw SpriteComposition_Map4D_5419
	dw SpriteComposition_Map4D_5424
	dw SpriteComposition_Map4D_542f
	dw SpriteComposition_Map4D_543a
	dw SpriteComposition_Map4D_544a
	dw SpriteComposition_Map4D_546e
	dw SpriteComposition_Map4D_547e
	dw SpriteComposition_Map4D_5489
	dw SpriteComposition_Map4D_5494
	dw SpriteComposition_Map4D_549f
	dw SpriteComposition_Map4D_54aa
SpriteComposition_Map4D_5419:
	db $00, $08, $08, $00, $04, $00, $10, $00, $02, $04, $ff
SpriteComposition_Map4D_5424:
	db $00, $08, $08, $04, $04, $00, $10, $00, $06, $04, $ff
SpriteComposition_Map4D_542f:
	db $00, $08, $08, $08, $04, $00, $10, $00, $0a, $04, $ff
SpriteComposition_Map4D_543a:
	db $00, $00, $10, $0c, $04, $00, $08, $08, $0e, $04, $00, $10, $00, $10, $04, $ff
SpriteComposition_Map4D_544a:
	db $00, $00, $30, $12, $04, $00, $08, $28, $14, $04, $00, $10, $20, $16, $04, $00
	db $18, $18, $18, $04, $00, $20, $10, $1a, $04, $00, $28, $08, $1c, $04, $00, $30
	db $00, $1e, $04, $ff
SpriteComposition_Map4D_546e:
	db $00, $00, $10, $20, $04, $00, $08, $08, $22, $04, $00, $10, $00, $24, $04, $ff
SpriteComposition_Map4D_547e:
	db $00, $00, $10, $26, $04, $00, $08, $08, $28, $04, $ff
SpriteComposition_Map4D_5489:
	db $00, $00, $10, $2a, $04, $00, $08, $08, $2c, $04, $ff
SpriteComposition_Map4D_5494:
	db $00, $00, $10, $2e, $04, $00, $08, $08, $30, $04, $ff
SpriteComposition_Map4D_549f:
	db $00, $00, $10, $32, $04, $00, $08, $08, $34, $04, $ff
SpriteComposition_Map4D_54aa:
	db $00, $00, $28, $36, $04, $00, $08, $20, $38, $04, $00, $10, $18, $3a, $04, $00
	db $18, $10, $3c, $04, $00, $20, $08, $3e, $04, $00, $28, $00, $40, $04, $10, $00
	db $28, $42, $04, $10, $08, $20, $44, $04, $10, $10, $18, $46, $04, $10, $18, $10
	db $48, $04, $10, $20, $08, $4a, $04, $10, $28, $00, $4c, $04, $20, $00, $28, $4e
	db $04, $20, $08, $20, $50, $04, $20, $10, $18, $52, $04, $20, $18, $10, $54, $04
	db $20, $20, $08, $56, $04, $20, $28, $00, $58, $04, $ff
SpriteComposition_Map4E:
	dw SpriteComposition_Map4E_550d
	dw SpriteComposition_Map4E_550d
	dw SpriteComposition_Map4E_550d
	dw SpriteComposition_Map4E_550d
SpriteComposition_Map4E_550d:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $10, $00
	db $28, $0c, $04, $10, $08, $20, $0e, $04, $10, $10, $18, $10, $04, $10, $18, $10
	db $12, $04, $10, $20, $08, $14, $04, $10, $28, $00, $16, $04, $20, $00, $28, $18
	db $04, $20, $08, $20, $1a, $04, $20, $10, $18, $1c, $04, $20, $18, $10, $1e, $04
	db $20, $20, $08, $20, $04, $20, $28, $00, $22, $04, $ff
SpriteComposition_Map4F:
	dw SpriteComposition_Map4F_5570
	dw SpriteComposition_Map4F_5570
	dw SpriteComposition_Map4F_55a3
	dw SpriteComposition_Map4F_55ef
SpriteComposition_Map4F_5570:
	db $00, $00, $20, $00, $04, $00, $08, $18, $02, $04, $00, $10, $10, $04, $04, $00
	db $18, $08, $06, $04, $00, $20, $00, $08, $04, $10, $00, $20, $0a, $04, $10, $08
	db $18, $0c, $04, $10, $10, $10, $0e, $04, $10, $18, $08, $10, $04, $10, $20, $00
	db $12, $04, $ff
SpriteComposition_Map4F_55a3:
	db $00, $00, $20, $14, $04, $00, $08, $18, $16, $04, $00, $10, $10, $18, $04, $00
	db $18, $08, $1a, $04, $00, $20, $00, $1c, $04, $10, $00, $20, $1e, $04, $10, $08
	db $18, $20, $04, $10, $10, $10, $22, $04, $10, $18, $08, $24, $04, $10, $20, $00
	db $26, $04, $20, $00, $20, $28, $04, $20, $08, $18, $2a, $04, $20, $10, $10, $2c
	db $04, $20, $18, $08, $2e, $04, $20, $20, $00, $30, $04, $ff
SpriteComposition_Map4F_55ef:
	db $00, $00, $20, $32, $04, $00, $08, $18, $34, $04, $00, $10, $10, $36, $04, $00
	db $18, $08, $38, $04, $00, $20, $00, $3a, $04, $10, $00, $20, $3c, $04, $10, $08
	db $18, $3e, $04, $10, $10, $10, $40, $04, $10, $18, $08, $42, $04, $10, $20, $00
	db $44, $04, $20, $00, $20, $46, $04, $20, $08, $18, $48, $04, $20, $10, $10, $4a
	db $04, $20, $18, $08, $4c, $04, $20, $20, $00, $4e, $04, $ff
SpriteComposition_Map50:
	dw SpriteComposition_Map50_5643
	dw SpriteComposition_Map50_5643
	dw SpriteComposition_Map50_5643
	dw SpriteComposition_Map50_5643
SpriteComposition_Map50_5643:
	db $00, $28, $00, $00, $04, $10, $08, $20, $02, $04, $10, $10, $18, $04, $04, $10
	db $20, $08, $06, $04, $20, $00, $28, $08, $04, $20, $08, $20, $0a, $04, $ff
SpriteComposition_Map51:
	dw SpriteComposition_Map51_566c
	dw SpriteComposition_Map51_566c
	dw SpriteComposition_Map51_5695
	dw SpriteComposition_Map51_56be
	dw SpriteComposition_Map51_56e7
SpriteComposition_Map51_566c:
	db $00, $00, $18, $00, $04, $00, $08, $10, $02, $04, $00, $10, $08, $04, $04, $00
	db $18, $00, $06, $04, $10, $00, $18, $08, $04, $10, $08, $10, $0a, $04, $10, $10
	db $08, $0c, $04, $10, $18, $00, $0e, $04, $ff
SpriteComposition_Map51_5695:
	db $00, $00, $18, $10, $04, $00, $08, $10, $12, $04, $00, $10, $08, $14, $04, $00
	db $18, $00, $16, $04, $10, $00, $18, $18, $04, $10, $08, $10, $1a, $04, $10, $10
	db $08, $1c, $04, $10, $18, $00, $1e, $04, $ff
SpriteComposition_Map51_56be:
	db $00, $00, $18, $20, $04, $00, $08, $10, $22, $04, $00, $10, $08, $24, $04, $00
	db $18, $00, $26, $04, $10, $00, $18, $28, $04, $10, $08, $10, $2a, $04, $10, $10
	db $08, $2c, $04, $10, $18, $00, $2e, $04, $ff
SpriteComposition_Map51_56e7:
	db $00, $00, $18, $30, $04, $00, $08, $10, $32, $04, $00, $10, $08, $34, $04, $00
	db $18, $00, $36, $04, $10, $00, $18, $38, $04, $10, $08, $10, $3a, $04, $10, $10
	db $08, $3c, $04, $10, $18, $00, $3e, $04, $ff
SpriteComposition_Map53:
	dw SpriteComposition_Map53_5718
	dw SpriteComposition_Map53_5718
	dw SpriteComposition_Map53_5750
	dw SpriteComposition_Map53_57a6
SpriteComposition_Map53_5718:
	db $10, $18, $18, $00, $04, $10, $20, $10, $02, $04, $10, $28, $08, $04, $04, $10
	db $30, $00, $06, $04, $20, $00, $30, $08, $04, $20, $08, $28, $0a, $04, $20, $10
	db $20, $0c, $04, $20, $18, $18, $0e, $04, $20, $20, $10, $10, $04, $20, $28, $08
	db $12, $04, $20, $30, $00, $14, $04, $ff
SpriteComposition_Map53_5750:
	db $00, $20, $10, $16, $04, $00, $28, $08, $18, $04, $00, $30, $00, $1a, $04, $10
	db $00, $30, $1c, $04, $10, $08, $28, $1e, $04, $10, $10, $20, $20, $04, $10, $18
	db $18, $22, $04, $10, $20, $10, $24, $04, $10, $28, $08, $26, $04, $10, $30, $00
	db $28, $04, $20, $00, $30, $2a, $04, $20, $08, $28, $2c, $04, $20, $10, $20, $2e
	db $04, $20, $18, $18, $30, $04, $20, $20, $10, $32, $04, $20, $28, $08, $34, $04
	db $20, $30, $00, $36, $04, $ff
SpriteComposition_Map53_57a6:
	db $00, $00, $30, $38, $04, $00, $08, $28, $3a, $04, $00, $10, $20, $3c, $04, $00
	db $18, $18, $3e, $04, $00, $20, $10, $40, $04, $00, $28, $08, $42, $04, $00, $30
	db $00, $44, $04, $10, $00, $30, $46, $04, $10, $08, $28, $48, $04, $10, $10, $20
	db $4a, $04, $10, $18, $18, $4c, $04, $10, $20, $10, $4e, $04, $10, $28, $08, $50
	db $04, $10, $30, $00, $52, $04, $20, $00, $30, $54, $04, $20, $08, $28, $56, $04
	db $20, $10, $20, $58, $04, $20, $18, $18, $5a, $04, $20, $20, $10, $5c, $04, $20
	db $28, $08, $5e, $04, $20, $30, $00, $60, $04, $ff
SpriteComposition_Map55:
	dw SpriteComposition_Map55_5822
	dw SpriteComposition_Map55_5822
	dw SpriteComposition_Map55_5873
	dw SpriteComposition_Map55_58c4
	dw SpriteComposition_Map55_5915
	dw SpriteComposition_Map55_5822
	dw SpriteComposition_Map55_5873
	dw SpriteComposition_Map55_58c4
	dw SpriteComposition_Map55_5915
SpriteComposition_Map55_5822:
	db $e8, $00, $28, $00, $04, $e8, $08, $20, $02, $04, $e8, $10, $18, $04, $04, $e8
	db $18, $10, $06, $04, $e8, $20, $08, $08, $04, $e8, $28, $00, $0a, $04, $f8, $00
	db $28, $0c, $04, $f8, $08, $20, $0e, $04, $f8, $10, $18, $10, $04, $f8, $18, $10
	db $12, $04, $f8, $20, $08, $14, $04, $f8, $28, $00, $16, $04, $08, $08, $20, $18
	db $04, $08, $10, $18, $1a, $04, $08, $18, $10, $1c, $04, $08, $20, $08, $1e, $04
	db $ff
SpriteComposition_Map55_5873:
	db $e8, $08, $20, $20, $04, $e8, $10, $18, $22, $04, $e8, $18, $10, $24, $04, $e8
	db $20, $08, $26, $04, $e8, $28, $00, $28, $04, $f8, $00, $28, $2a, $04, $f8, $08
	db $20, $2c, $04, $f8, $10, $18, $2e, $04, $f8, $18, $10, $30, $04, $f8, $20, $08
	db $32, $04, $f8, $28, $00, $34, $04, $08, $08, $20, $36, $04, $08, $10, $18, $38
	db $04, $08, $18, $10, $3a, $04, $08, $20, $08, $3c, $04, $08, $28, $00, $3e, $04
	db $ff
SpriteComposition_Map55_58c4:
	db $e8, $08, $20, $40, $04, $e8, $10, $18, $42, $04, $e8, $18, $10, $44, $04, $e8
	db $20, $08, $46, $04, $f8, $00, $28, $48, $04, $f8, $08, $20, $4a, $04, $f8, $10
	db $18, $4c, $04, $f8, $18, $10, $4e, $04, $f8, $20, $08, $50, $04, $f8, $28, $00
	db $52, $04, $08, $00, $28, $54, $04, $08, $08, $20, $56, $04, $08, $10, $18, $58
	db $04, $08, $18, $10, $5a, $04, $08, $20, $08, $5c, $04, $08, $28, $00, $5e, $04
	db $ff
SpriteComposition_Map55_5915:
	db $e8, $00, $28, $60, $04, $e8, $08, $20, $62, $04, $e8, $10, $18, $64, $04, $e8
	db $18, $10, $66, $04, $e8, $20, $08, $68, $04, $f8, $00, $28, $6a, $04, $f8, $08
	db $20, $6c, $04, $f8, $10, $18, $6e, $04, $f8, $18, $10, $70, $04, $f8, $20, $08
	db $72, $04, $f8, $28, $00, $74, $04, $08, $00, $28, $76, $04, $08, $08, $20, $78
	db $04, $08, $10, $18, $7a, $04, $08, $18, $10, $7c, $04, $08, $20, $08, $7e, $04
	db $ff
SpriteComposition_Map56:
	dw SpriteComposition_Map56_5974
	dw SpriteComposition_Map56_5974
	dw SpriteComposition_Map56_59a2
	dw SpriteComposition_Map56_59cb
	dw SpriteComposition_Map56_59db
	dw SpriteComposition_Map56_5a0e
	dw SpriteComposition_Map56_5a2d
SpriteComposition_Map56_5974:
	db $08, $00, $20, $00, $04, $08, $08, $18, $02, $04, $08, $10, $10, $04, $04, $08
	db $18, $08, $06, $04, $08, $20, $00, $08, $04, $18, $00, $20, $0a, $04, $18, $08
	db $18, $0c, $04, $18, $10, $10, $0e, $04, $18, $18, $08, $10, $04, $ff
SpriteComposition_Map56_59a2:
	db $08, $00, $20, $12, $04, $08, $08, $18, $14, $04, $08, $10, $10, $16, $04, $08
	db $18, $08, $18, $04, $18, $00, $20, $1a, $04, $18, $08, $18, $1c, $04, $18, $10
	db $10, $1e, $04, $18, $18, $08, $20, $04, $ff
SpriteComposition_Map56_59cb:
	db $08, $00, $20, $22, $04, $18, $00, $20, $24, $04, $18, $08, $18, $26, $04, $ff
SpriteComposition_Map56_59db:
	db $08, $00, $20, $28, $04, $08, $08, $18, $2a, $04, $08, $10, $10, $2c, $04, $08
	db $18, $08, $2e, $04, $08, $20, $00, $30, $04, $18, $00, $20, $32, $04, $18, $08
	db $18, $34, $04, $18, $10, $10, $36, $04, $18, $18, $08, $38, $04, $18, $20, $00
	db $3a, $04, $ff
SpriteComposition_Map56_5a0e:
	db $08, $10, $10, $3c, $04, $08, $18, $08, $3e, $04, $08, $20, $00, $40, $04, $18
	db $10, $10, $42, $04, $18, $18, $08, $44, $04, $18, $20, $00, $46, $04, $ff
SpriteComposition_Map56_5a2d:
	db $08, $20, $00, $48, $04, $18, $18, $08, $4a, $04, $18, $20, $00, $4c, $04, $ff
SpriteComposition_Map57:
	dw SpriteComposition_Map57_5a4d
	dw SpriteComposition_Map57_5a4d
	dw SpriteComposition_Map57_5a6c
	dw SpriteComposition_Map57_5a4d
	dw SpriteComposition_Map57_5a6c
	dw SpriteComposition_Map57_5a8b
	dw SpriteComposition_Map57_5aaa
	dw SpriteComposition_Map57_5ab5
SpriteComposition_Map57_5a4d:
	db $00, $00, $08, $00, $04, $00, $08, $00, $02, $04, $10, $00, $08, $04, $04, $10
	db $08, $00, $06, $04, $20, $00, $08, $08, $04, $20, $08, $00, $0a, $04, $ff
SpriteComposition_Map57_5a6c:
	db $00, $00, $08, $0c, $04, $00, $08, $00, $0e, $04, $10, $00, $08, $10, $04, $10
	db $08, $00, $12, $04, $20, $00, $08, $14, $04, $20, $08, $00, $16, $04, $ff
SpriteComposition_Map57_5a8b:
	db $00, $00, $08, $18, $04, $00, $08, $00, $1a, $04, $10, $00, $08, $1c, $04, $10
	db $08, $00, $1e, $04, $20, $00, $08, $20, $04, $20, $08, $00, $22, $04, $ff
SpriteComposition_Map57_5aaa:
	db $00, $08, $10, $24, $04, $00, $10, $08, $26, $04, $ff
SpriteComposition_Map57_5ab5:
	db $00, $00, $18, $28, $04, $00, $08, $10, $2a, $04, $00, $10, $08, $2c, $04, $00
	db $18, $00, $2e, $04, $ff
SpriteComposition_Map59:
	dw SpriteComposition_Map59_5ad8
	dw SpriteComposition_Map59_5ad8
	dw SpriteComposition_Map59_5b01
	dw SpriteComposition_Map59_5b2f
	dw SpriteComposition_Map59_5b5d
	dw SpriteComposition_Map59_5b86
	dw SpriteComposition_Map59_5baf
SpriteComposition_Map59_5ad8:
	db $00, $00, $20, $00, $04, $00, $08, $18, $02, $04, $00, $10, $10, $04, $04, $00
	db $18, $08, $06, $04, $10, $08, $18, $08, $04, $10, $10, $10, $0a, $04, $10, $18
	db $08, $0c, $04, $10, $20, $00, $0e, $04, $ff
SpriteComposition_Map59_5b01:
	db $00, $00, $20, $10, $04, $00, $08, $18, $12, $04, $00, $10, $10, $14, $04, $00
	db $18, $08, $16, $04, $00, $20, $00, $18, $04, $10, $08, $18, $1a, $04, $10, $10
	db $10, $1c, $04, $10, $18, $08, $1e, $04, $10, $20, $00, $20, $04, $ff
SpriteComposition_Map59_5b2f:
	db $00, $00, $20, $22, $04, $00, $08, $18, $24, $04, $00, $10, $10, $26, $04, $00
	db $18, $08, $28, $04, $00, $20, $00, $2a, $04, $10, $08, $18, $2c, $04, $10, $10
	db $10, $2e, $04, $10, $18, $08, $30, $04, $10, $20, $00, $32, $04, $ff
SpriteComposition_Map59_5b5d:
	db $00, $08, $18, $34, $04, $00, $10, $10, $36, $04, $00, $18, $08, $38, $04, $10
	db $00, $20, $3a, $04, $10, $08, $18, $3c, $04, $10, $10, $10, $3e, $04, $10, $18
	db $08, $40, $04, $10, $20, $00, $42, $04, $ff
SpriteComposition_Map59_5b86:
	db $00, $00, $20, $44, $04, $00, $08, $18, $46, $04, $00, $10, $10, $48, $04, $00
	db $18, $08, $4a, $04, $10, $08, $18, $4c, $04, $10, $10, $10, $4e, $04, $10, $18
	db $08, $50, $04, $10, $20, $00, $52, $04, $ff
SpriteComposition_Map59_5baf:
	db $00, $00, $20, $54, $04, $00, $08, $18, $56, $04, $00, $10, $10, $58, $04, $00
	db $18, $08, $5a, $04, $10, $00, $20, $5c, $04, $10, $08, $18, $5e, $04, $10, $10
	db $10, $60, $04, $10, $18, $08, $62, $04, $10, $20, $00, $64, $04, $ff
SpriteComposition_Map5A:
	dw SpriteComposition_Map5A_5be7
	dw SpriteComposition_Map5A_5be7
	dw SpriteComposition_Map5A_5c38
	dw SpriteComposition_Map5A_5c89
	dw SpriteComposition_Map5A_5c89
SpriteComposition_Map5A_5be7:
	db $08, $00, $38, $00, $04, $08, $08, $30, $02, $04, $08, $10, $28, $04, $04, $08
	db $18, $20, $06, $04, $08, $20, $18, $08, $04, $08, $28, $10, $0a, $04, $08, $30
	db $08, $0c, $04, $08, $38, $00, $0e, $04, $18, $00, $38, $10, $04, $18, $08, $30
	db $12, $04, $18, $10, $28, $14, $04, $18, $18, $20, $16, $04, $18, $20, $18, $18
	db $04, $18, $28, $10, $1a, $04, $18, $30, $08, $1c, $04, $18, $38, $00, $1e, $04
	db $ff
SpriteComposition_Map5A_5c38:
	db $08, $00, $38, $20, $04, $08, $08, $30, $22, $04, $08, $10, $28, $24, $04, $08
	db $18, $20, $26, $04, $08, $20, $18, $28, $04, $08, $28, $10, $2a, $04, $08, $30
	db $08, $2c, $04, $08, $38, $00, $2e, $04, $18, $00, $38, $30, $04, $18, $08, $30
	db $32, $04, $18, $10, $28, $34, $04, $18, $18, $20, $36, $04, $18, $20, $18, $38
	db $04, $18, $28, $10, $3a, $04, $18, $30, $08, $3c, $04, $18, $38, $00, $3e, $04
	db $ff
SpriteComposition_Map5A_5c89:
	db $08, $00, $38, $40, $04, $08, $08, $30, $42, $04, $08, $10, $28, $44, $04, $08
	db $18, $20, $46, $04, $08, $20, $18, $48, $04, $08, $28, $10, $4a, $04, $08, $30
	db $08, $4c, $04, $08, $38, $00, $4e, $04, $18, $00, $38, $50, $04, $18, $08, $30
	db $52, $04, $18, $10, $28, $54, $04, $18, $18, $20, $56, $04, $18, $20, $18, $58
	db $04, $18, $28, $10, $5a, $04, $18, $30, $08, $5c, $04, $18, $38, $00, $5e, $04
	db $ff, $08, $00, $38, $60, $04, $08, $08, $30, $62, $04, $08, $10, $28, $64, $04
	db $08, $18, $20, $66, $04, $08, $20, $18, $68, $04, $08, $28, $10, $6a, $04, $08
	db $30, $08, $6c, $04, $08, $38, $00, $6e, $04, $18, $00, $38, $70, $04, $18, $08
	db $30, $72, $04, $18, $10, $28, $74, $04, $18, $18, $20, $76, $04, $18, $20, $18
	db $78, $04, $18, $28, $10, $7a, $04, $18, $30, $08, $7c, $04, $18, $38, $00, $7e
	db $04, $ff
SpriteComposition_Map5B:
	dw SpriteComposition_Map5B_5d35
	dw SpriteComposition_Map5B_5d35
	dw SpriteComposition_Map5B_5d72
	dw SpriteComposition_Map5B_5dcd
	dw SpriteComposition_Map5B_5e41
SpriteComposition_Map5B_5d35:
	db $00, $08, $20, $00, $04, $00, $10, $18, $02, $04, $00, $18, $10, $04, $04, $00
	db $20, $08, $06, $04, $10, $08, $20, $08, $04, $10, $10, $18, $0a, $04, $10, $18
	db $10, $0c, $04, $10, $20, $08, $0e, $04, $20, $10, $18, $10, $04, $20, $18, $10
	db $12, $04, $30, $10, $18, $14, $04, $30, $18, $10, $16, $04, $ff
SpriteComposition_Map5B_5d72:
	db $00, $00, $28, $18, $04, $00, $08, $20, $1a, $04, $00, $10, $18, $1c, $04, $00
	db $18, $10, $1e, $04, $00, $28, $00, $20, $04, $10, $00, $28, $22, $04, $10, $08
	db $20, $24, $04, $10, $10, $18, $26, $04, $10, $18, $10, $28, $04, $10, $20, $08
	db $2a, $04, $10, $28, $00, $2c, $04, $20, $08, $20, $2e, $04, $20, $10, $18, $30
	db $04, $20, $18, $10, $32, $04, $20, $20, $08, $34, $04, $30, $10, $18, $36, $04
	db $30, $18, $10, $38, $04, $30, $20, $08, $3a, $04, $ff
SpriteComposition_Map5B_5dcd:
	db $00, $00, $28, $00, $04, $00, $08, $20, $02, $04, $00, $10, $18, $04, $04, $00
	db $18, $10, $06, $04, $00, $20, $08, $08, $04, $00, $28, $00, $0a, $04, $10, $00
	db $28, $0c, $04, $10, $08, $20, $0e, $04, $10, $10, $18, $10, $04, $10, $18, $10
	db $12, $04, $10, $20, $08, $14, $04, $20, $00, $28, $16, $04, $20, $08, $20, $18
	db $04, $20, $10, $18, $1a, $04, $20, $18, $10, $1c, $04, $20, $20, $08, $1e, $04
	db $20, $28, $00, $20, $04, $30, $00, $28, $22, $04, $30, $08, $20, $24, $04, $30
	db $10, $18, $26, $04, $30, $18, $10, $28, $04, $30, $20, $08, $2a, $04, $30, $28
	db $00, $2c, $04, $ff
SpriteComposition_Map5B_5e41:
	db $00, $00, $28, $2e, $04, $00, $08, $20, $30, $04, $00, $10, $18, $32, $04, $00
	db $18, $10, $34, $04, $00, $20, $08, $36, $04, $00, $28, $00, $38, $04, $10, $00
	db $28, $3a, $04, $10, $08, $20, $3c, $04, $10, $10, $18, $3e, $04, $10, $18, $10
	db $40, $04, $10, $20, $08, $42, $04, $10, $28, $00, $44, $04, $20, $00, $28, $46
	db $04, $20, $08, $20, $48, $04, $20, $10, $18, $4a, $04, $20, $18, $10, $4c, $04
	db $20, $20, $08, $4e, $04, $30, $08, $20, $50, $04, $30, $10, $18, $52, $04, $30
	db $18, $10, $54, $04, $30, $20, $08, $56, $04, $30, $28, $00, $58, $04, $ff
SpriteComposition_Map5C:
	dw SpriteComposition_Map5C_5eb8
	dw SpriteComposition_Map5C_5eb8
	dw SpriteComposition_Map5C_5f1d
	dw SpriteComposition_Map5C_5f87
SpriteComposition_Map5C_5eb8:
	db $00, $00, $30, $00, $04, $00, $08, $28, $02, $04, $00, $10, $20, $04, $04, $00
	db $18, $18, $06, $04, $00, $20, $10, $08, $04, $00, $28, $08, $0a, $04, $00, $30
	db $00, $0c, $04, $10, $00, $30, $0e, $04, $10, $08, $28, $10, $04, $10, $10, $20
	db $12, $04, $10, $18, $18, $14, $04, $10, $20, $10, $16, $04, $10, $28, $08, $18
	db $04, $10, $30, $00, $1a, $04, $20, $00, $30, $1c, $04, $20, $08, $28, $1e, $04
	db $20, $18, $18, $20, $04, $20, $20, $10, $22, $04, $20, $28, $08, $24, $04, $20
	db $30, $00, $26, $04, $ff
SpriteComposition_Map5C_5f1d:
	db $00, $00, $30, $28, $04, $00, $08, $28, $2a, $04, $00, $10, $20, $2c, $04, $00
	db $18, $18, $2e, $04, $00, $20, $10, $30, $04, $00, $28, $08, $32, $04, $00, $30
	db $00, $34, $04, $10, $00, $30, $36, $04, $10, $08, $28, $38, $04, $10, $10, $20
	db $3a, $04, $10, $18, $18, $3c, $04, $10, $20, $10, $3e, $04, $10, $28, $08, $40
	db $04, $10, $30, $00, $42, $04, $20, $00, $30, $44, $04, $20, $08, $28, $46, $04
	db $20, $10, $20, $48, $04, $20, $18, $18, $4a, $04, $20, $20, $10, $4c, $04, $20
	db $28, $08, $4e, $04, $20, $30, $00, $50, $04, $ff
SpriteComposition_Map5C_5f87:
	db $08, $08, $28, $52, $04, $08, $10, $20, $54, $04, $08, $18, $18, $56, $04, $08
	db $20, $10, $58, $04, $08, $28, $08, $5a, $04, $18, $08, $28, $5c, $04, $18, $10
	db $20, $5e, $04, $18, $18, $18, $60, $04, $18, $20, $10, $62, $04, $18, $28, $08
	db $64, $04, $ff
SpriteComposition_Map5D:
	dw SpriteComposition_Map5D_5fc8
	dw SpriteComposition_Map5D_5fc8
	dw SpriteComposition_Map5D_5ffb
	dw SpriteComposition_Map5D_602e
	dw SpriteComposition_Map5D_6066
	dw SpriteComposition_Map5D_6099
	dw SpriteComposition_Map5D_60d1
SpriteComposition_Map5D_5fc8:
	db $00, $00, $20, $00, $04, $00, $08, $18, $02, $04, $10, $00, $20, $04, $04, $10
	db $08, $18, $06, $04, $10, $10, $10, $08, $04, $10, $18, $08, $0a, $04, $20, $08
	db $18, $0c, $04, $20, $10, $10, $0e, $04, $20, $18, $08, $10, $04, $20, $20, $00
	db $12, $04, $ff
SpriteComposition_Map5D_5ffb:
	db $00, $00, $20, $14, $04, $00, $08, $18, $16, $04, $10, $00, $20, $18, $04, $10
	db $08, $18, $1a, $04, $10, $10, $10, $1c, $04, $10, $18, $08, $1e, $04, $20, $08
	db $18, $20, $04, $20, $10, $10, $22, $04, $20, $18, $08, $24, $04, $20, $20, $00
	db $26, $04, $ff
SpriteComposition_Map5D_602e:
	db $00, $00, $20, $28, $04, $00, $08, $18, $2a, $04, $10, $00, $20, $2c, $04, $10
	db $08, $18, $2e, $04, $10, $10, $10, $30, $04, $10, $18, $08, $32, $04, $20, $00
	db $20, $34, $04, $20, $08, $18, $36, $04, $20, $10, $10, $38, $04, $20, $18, $08
	db $3a, $04, $20, $20, $00, $3c, $04, $ff
SpriteComposition_Map5D_6066:
	db $00, $00, $20, $3e, $04, $00, $08, $18, $40, $04, $00, $10, $10, $42, $04, $10
	db $08, $18, $44, $04, $10, $10, $10, $46, $04, $10, $18, $08, $48, $04, $10, $20
	db $00, $4a, $04, $20, $10, $10, $4c, $04, $20, $18, $08, $4e, $04, $20, $20, $00
	db $50, $04, $ff
SpriteComposition_Map5D_6099:
	db $00, $00, $20, $52, $04, $00, $08, $18, $54, $04, $00, $10, $10, $56, $04, $00
	db $18, $08, $58, $04, $10, $08, $18, $5a, $04, $10, $10, $10, $5c, $04, $10, $18
	db $08, $5e, $04, $10, $20, $00, $60, $04, $20, $10, $10, $62, $04, $20, $18, $08
	db $64, $04, $20, $20, $00, $66, $04, $ff
SpriteComposition_Map5D_60d1:
	db $00, $00, $20, $68, $04, $00, $08, $18, $6a, $04, $00, $10, $10, $6c, $04, $00
	db $18, $08, $6e, $04, $00, $20, $00, $70, $04, $10, $08, $18, $72, $04, $10, $10
	db $10, $74, $04, $10, $18, $08, $76, $04, $10, $20, $00, $78, $04, $20, $10, $10
	db $7a, $04, $20, $18, $08, $7c, $04, $20, $20, $00, $7e, $04, $ff
SpriteComposition_Map5E:
	dw SpriteComposition_Map5E_6118
	dw SpriteComposition_Map5E_6118
	dw SpriteComposition_Map5E_613c
	dw SpriteComposition_Map5E_615b
	dw SpriteComposition_Map5E_617a
SpriteComposition_Map5E_6118:
	db $00, $18, $08, $00, $04, $00, $20, $00, $02, $04, $10, $00, $20, $04, $04, $10
	db $08, $18, $06, $04, $10, $10, $10, $08, $04, $10, $18, $08, $0a, $04, $10, $20
	db $00, $0c, $04, $ff
SpriteComposition_Map5E_613c:
	db $00, $10, $10, $0e, $04, $00, $18, $08, $10, $04, $00, $20, $00, $12, $04, $10
	db $08, $18, $14, $04, $10, $10, $10, $16, $04, $10, $18, $08, $18, $04, $ff
SpriteComposition_Map5E_615b:
	db $00, $10, $10, $1a, $04, $00, $18, $08, $1c, $04, $00, $20, $00, $1e, $04, $10
	db $10, $10, $20, $04, $10, $18, $08, $22, $04, $10, $20, $00, $24, $04, $ff
SpriteComposition_Map5E_617a:
	db $00, $00, $20, $26, $04, $00, $08, $18, $28, $04, $00, $10, $10, $2a, $04, $00
	db $18, $08, $2c, $04, $00, $20, $00, $2e, $04, $10, $18, $08, $30, $04, $10, $20
	db $00, $32, $04, $ff
SpriteComposition_Map5F:
	dw SpriteComposition_Map5F_61a8
	dw SpriteComposition_Map5F_61a8
	dw SpriteComposition_Map5F_61d1
	dw SpriteComposition_Map5F_61fa
	dw SpriteComposition_Map5F_6223
SpriteComposition_Map5F_61a8:
	db $00, $00, $18, $00, $04, $00, $08, $10, $02, $04, $00, $10, $08, $04, $04, $00
	db $18, $00, $06, $04, $10, $00, $18, $08, $04, $10, $08, $10, $0a, $04, $10, $10
	db $08, $0c, $04, $10, $18, $00, $0e, $04, $ff
SpriteComposition_Map5F_61d1:
	db $00, $00, $18, $10, $04, $00, $08, $10, $12, $04, $00, $10, $08, $14, $04, $00
	db $18, $00, $16, $04, $10, $00, $18, $18, $04, $10, $08, $10, $1a, $04, $10, $10
	db $08, $1c, $04, $10, $18, $00, $1e, $04, $ff
SpriteComposition_Map5F_61fa:
	db $00, $00, $18, $20, $04, $00, $08, $10, $22, $04, $00, $10, $08, $24, $04, $00
	db $18, $00, $26, $04, $10, $00, $18, $28, $04, $10, $08, $10, $2a, $04, $10, $10
	db $08, $2c, $04, $10, $18, $00, $2e, $04, $ff
SpriteComposition_Map5F_6223:
	db $00, $00, $18, $30, $04, $00, $08, $10, $32, $04, $00, $10, $08, $34, $04, $00
	db $18, $00, $36, $04, $10, $00, $18, $38, $04, $10, $08, $10, $3a, $04, $10, $10
	db $08, $3c, $04, $10, $18, $00, $3e, $04, $ff
SpriteComposition_Map60:
	dw SpriteComposition_Map60_6260
	dw SpriteComposition_Map60_6260
	dw SpriteComposition_Map60_626b
	dw SpriteComposition_Map60_6276
	dw SpriteComposition_Map60_6281
	dw SpriteComposition_Map60_628c
	dw SpriteComposition_Map60_6297
	dw SpriteComposition_Map60_62a2
	dw SpriteComposition_Map60_62ad
	dw SpriteComposition_Map60_62c7
SpriteComposition_Map60_6260:
	db $00, $00, $08, $00, $04, $00, $08, $00, $02, $04, $ff
SpriteComposition_Map60_626b:
	db $00, $00, $08, $04, $04, $00, $08, $00, $06, $04, $ff
SpriteComposition_Map60_6276:
	db $00, $00, $08, $08, $04, $00, $08, $00, $0a, $04, $ff
SpriteComposition_Map60_6281:
	db $00, $00, $08, $0c, $04, $00, $08, $00, $0e, $04, $ff
SpriteComposition_Map60_628c:
	db $00, $00, $08, $10, $04, $00, $08, $00, $12, $04, $ff
SpriteComposition_Map60_6297:
	db $00, $00, $08, $14, $04, $00, $08, $00, $16, $04, $ff
SpriteComposition_Map60_62a2:
	db $00, $00, $08, $18, $04, $00, $08, $00, $1a, $04, $ff
SpriteComposition_Map60_62ad:
	db $00, $00, $10, $1c, $05, $00, $08, $08, $1e, $05, $00, $10, $00, $20, $05, $10
	db $08, $08, $22, $05, $10, $10, $00, $24, $05, $ff
SpriteComposition_Map60_62c7:
	db $00, $00, $10, $26, $05, $00, $08, $08, $28, $05, $10, $08, $08, $2a, $05, $10
	db $10, $00, $2c, $05, $ff
SpriteComposition_Map61:
	dr $e22dc, $e23fb
SpriteComposition_Map62:
	dw SpriteComposition_Map62_6403
	dw SpriteComposition_Map62_6403
	dw SpriteComposition_Map62_640e
	dw SpriteComposition_Map62_6419
SpriteComposition_Map62_6403:
	db $00, $00, $08, $00, $06, $00, $08, $00, $02, $06, $ff
SpriteComposition_Map62_640e:
	db $00, $00, $08, $04, $05, $00, $08, $00, $06, $05, $ff
SpriteComposition_Map62_6419:
	db $00, $00, $08, $08, $04, $00, $08, $00, $0a, $04, $ff, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00


