Func_032_4000::
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4009
	ld [hl], $A0
	add hl, de
	dec c
	jr nz, .asm_4009
	xor a
	ld [wd1fb], a
	ld a, [wd986]
	and a
	jr z, .asm_4026
	ld a, [wd9ea]
	and a
	jr z, .asm_4026
	farcall Func_4d_5f3a
	ret
.asm_4026
	ld a, [wBattleState]
	cp $07
	jr z, .asm_4053
	cp $45
	jr z, .asm_4057
	ld a, [wBattleAnimID]
	cp $39
	jr c, .asm_4048
	cp $63
	jr c, .asm_404c
	cp $91
	jr c, .asm_4041
	ret
.asm_4041
	farcall Func_03f_4000
	ret
.asm_4048
	call .asm_405b
	ret
.asm_404c
	farcall Func_038_4000
	ret
.asm_4053
	call .asm_411d
	ret
.asm_4057
	call Func_032_4202
	ret
.asm_405b
	ld hl, wd1a0
.asm_405e
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_4111
	ld [wd0c1], a
	ld de, MapSpriteData_Pointers
	ld a, [wBattleAnimID]
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
.asm_408b
	ld a, [hli]
	cp $FF
	jp z, .asm_410d
	add c
	ld [de], a
	inc de
	ld a, [wd986]
	and a
	jr nz, .asm_40ca
	ld a, [wBattleAnimID]
	cp $04
	jr z, .asm_40ca
	cp $0C
	jr z, .asm_40ca
	cp $0D
	jr z, .asm_40ca
	cp $0E
	jr z, .asm_40ca
	cp $10
	jr z, .asm_40ca
	cp $15
	jr z, .asm_40ca
	cp $18
	jr z, .asm_40ca
	cp $24
	jr z, .asm_40ca
	cp $28
	jr z, .asm_40ca
	cp $36
	jr z, .asm_40ca
	inc hl
	ld a, [hli]
	add b
	jr .asm_40cd
.asm_40ca
	ld a, [hli]
	add b
	inc hl
.asm_40cd
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wd986]
	and a
	jr nz, .asm_4109
	ld a, [wBattleAnimID]
	cp $04
	jr z, .asm_4109
	cp $0C
	jr z, .asm_4109
	cp $0D
	jr z, .asm_4109
	cp $0E
	jr z, .asm_4109
	cp $10
	jr z, .asm_4109
	cp $15
	jr z, .asm_4109
	cp $18
	jr z, .asm_4109
	cp $24
	jr z, .asm_4109
	cp $28
	jr z, .asm_4109
	cp $36
	jr z, .asm_4109
	ld a, [de]
	or $20
	ld [de], a
.asm_4109
	inc de
	jp .asm_408b
.asm_410d
	ld a, e
	ld [wd1fb], a
.asm_4111
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	jp .asm_405e
.asm_411d
	ld hl, wd1a0
.asm_4120
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_4166
	ld [wd0c1], a
	ld de, MapSpriteData_State07_Pointers
	ld a, [wd98f]
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
.asm_414d
	ld a, [hli]
	cp $FF
	jr z, .asm_4162
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_414d
.asm_4162
	ld a, e
	ld [wd1fb], a
.asm_4166
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	jp .asm_4120
MapSpriteData_State07_Pointers:
	dr $c8172, $c818e
MapSpriteData_State07:
	dr $c818e, $c8202
Func_032_4202:
	ld hl, wd1a0
.asm_4205
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_424b
	ld [wd0c1], a
	ld de, MapSpriteData_State45_Pointers
	ld a, [wd98f]
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
.asm_4232
	ld a, [hli]
	cp $FF
	jr z, .asm_4247
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_4232
.asm_4247
	ld a, e
	ld [wd1fb], a
.asm_424b
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	jp .asm_4205
MapSpriteData_State45_Pointers:
	dr $c8257, $c8269
MapSpriteData_State45:
	dr $c8269, $c8279
MapSpriteData_Pointers:
	dw MapSpriteData_32_42eb
	dw MapSpriteData_32_42eb
	dw MapSpriteData_32_4337
	dw MapSpriteData_32_4395
	dw MapSpriteData_32_4418
	dw MapSpriteData_32_4679
	dw MapSpriteData_32_4792
	dw MapSpriteData_32_4847
	dw MapSpriteData_32_4870
	dw MapSpriteData_32_4b78
	dw MapSpriteData_32_4ca9
	dw MapSpriteData_32_4e37
	dw MapSpriteData_32_5113
	dw MapSpriteData_32_5374
	dw MapSpriteData_32_564a
	dw MapSpriteData_32_5964
	dw MapSpriteData_32_5a02
	dw MapSpriteData_32_5ac0
	dw MapSpriteData_32_5b43
	dw MapSpriteData_32_5c9d
	dw MapSpriteData_32_5dca
	dw MapSpriteData_32_5a02
	dw MapSpriteData_32_5fba
	dw MapSpriteData_32_6084
	dw MapSpriteData_32_6084
	dw MapSpriteData_32_6140
	dw MapSpriteData_32_6212
	dw MapSpriteData_32_6356
	dw MapSpriteData_32_63ed
	dw MapSpriteData_32_648e
	dw MapSpriteData_32_64f3
	dw MapSpriteData_32_64f3
	dw MapSpriteData_32_64f3
	dw MapSpriteData_32_6576
	dw MapSpriteData_32_65f2
	dw MapSpriteData_32_66ac
	dw MapSpriteData_32_674d
	dw MapSpriteData_32_69a8
	dw MapSpriteData_32_42eb
	dw MapSpriteData_32_6a07
	dw MapSpriteData_32_6c37
	dw MapSpriteData_32_6ce7
	dw MapSpriteData_32_6d91
	dw MapSpriteData_32_6fab
	dw MapSpriteData_32_6ff4
	dw MapSpriteData_32_7077
	dw MapSpriteData_32_7196
	dw MapSpriteData_32_72eb
	dw MapSpriteData_32_74d5
	dw MapSpriteData_32_7534
	dw MapSpriteData_32_7599
	dw MapSpriteData_32_764d
	dw MapSpriteData_32_76f7
	dw MapSpriteData_32_7794
	dw MapSpriteData_32_795f
	dw MapSpriteData_32_7b0f
	dw MapSpriteData_32_7bcd
MapSpriteData:
MapSpriteData_32_42eb:
	dr $c82eb, $c8337
MapSpriteData_32_4337:
	dr $c8337, $c8395
MapSpriteData_32_4395:
	dr $c8395, $c8418
MapSpriteData_32_4418:
	dr $c8418, $c8679
MapSpriteData_32_4679:
	dr $c8679, $c8792
MapSpriteData_32_4792:
	dr $c8792, $c8847
MapSpriteData_32_4847:
	dr $c8847, $c8870
MapSpriteData_32_4870:
	dr $c8870, $c8b78
MapSpriteData_32_4b78:
	dr $c8b78, $c8ca9
MapSpriteData_32_4ca9:
	dr $c8ca9, $c8e37
MapSpriteData_32_4e37:
	dr $c8e37, $c9113
MapSpriteData_32_5113:
	dr $c9113, $c9374
MapSpriteData_32_5374:
	dr $c9374, $c964a
MapSpriteData_32_564a:
	dr $c964a, $c9964
MapSpriteData_32_5964:
	dr $c9964, $c9a02
MapSpriteData_32_5a02:
	dr $c9a02, $c9ac0
MapSpriteData_32_5ac0:
	dr $c9ac0, $c9b43
MapSpriteData_32_5b43:
	dr $c9b43, $c9c9d
MapSpriteData_32_5c9d:
	dr $c9c9d, $c9dca
MapSpriteData_32_5dca:
	dr $c9dca, $c9fba
MapSpriteData_32_5fba:
	dr $c9fba, $ca084
MapSpriteData_32_6084:
	dr $ca084, $ca140
MapSpriteData_32_6140:
	dr $ca140, $ca212
MapSpriteData_32_6212:
	dr $ca212, $ca356
MapSpriteData_32_6356:
	dr $ca356, $ca3ed
MapSpriteData_32_63ed:
	dr $ca3ed, $ca48e
MapSpriteData_32_648e:
	dr $ca48e, $ca4f3
MapSpriteData_32_64f3:
	dr $ca4f3, $ca576
MapSpriteData_32_6576:
	dr $ca576, $ca5f2
MapSpriteData_32_65f2:
	dr $ca5f2, $ca6ac
MapSpriteData_32_66ac:
	dr $ca6ac, $ca74d
MapSpriteData_32_674d:
	dr $ca74d, $ca9a8
MapSpriteData_32_69a8:
	dr $ca9a8, $caa07
MapSpriteData_32_6a07:
	dr $caa07, $cac37
MapSpriteData_32_6c37:
	dr $cac37, $cace7
MapSpriteData_32_6ce7:
	dr $cace7, $cad91
MapSpriteData_32_6d91:
	dr $cad91, $cafab
MapSpriteData_32_6fab:
	dr $cafab, $caff4
MapSpriteData_32_6ff4:
	dr $caff4, $cb077
MapSpriteData_32_7077:
	dr $cb077, $cb196
MapSpriteData_32_7196:
	dr $cb196, $cb2eb
MapSpriteData_32_72eb:
	dr $cb2eb, $cb4d5
MapSpriteData_32_74d5:
	dr $cb4d5, $cb534
MapSpriteData_32_7534:
	dr $cb534, $cb599
MapSpriteData_32_7599:
	dr $cb599, $cb64d
MapSpriteData_32_764d:
	dr $cb64d, $cb6f7
MapSpriteData_32_76f7:
	dr $cb6f7, $cb794
MapSpriteData_32_7794:
	dr $cb794, $cb95f
MapSpriteData_32_795f:
	dr $cb95f, $cbb0f
MapSpriteData_32_7b0f:
	dr $cbb0f, $cbbcd
MapSpriteData_32_7bcd:
	dr $cbbcd, $cbc19
	ds 7


