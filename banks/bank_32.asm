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
	dr $c8279, $c82eb
MapSpriteData:
	dr $c82eb, $cbc19
MapSpriteData_Padding:
	dr $cbc19, $cbc20


