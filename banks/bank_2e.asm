Func_02e_4000:
	ld a, e
	ld [wd088], a
	ld a, d
	ld [wd089], a
	jr Func_02e_400a.asm_403c

Func_02e_400a:
	ld a, [wd986]
	and a
	jr z, .asm_401e
	ld a, [wd9ea]
	and a
	jr z, .asm_401e
	farcall unk_023_55fa
	jr .asm_403c
.asm_401e
	ld de, wd9e2
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [wd988], a
	ld d, a
	farcall Func_01e_42e4
	ld a, [wd988]
	farcall unk_023_4000
.asm_403c
	call Func_02e_6e42
	xor a
	ld [hFFC6], a
.asm_4043
	farcall Func_032_4000
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ld a, [hFFC6]
	and a
	jr nz, .asm_4068
	call .asm_406d
	farcall Func_030_5beb
	farcall Func_030_5bcc
	jr .asm_4043
.asm_4068
	xor a
	ld [hFFC6], a
	ret
.asm_406d
	ld de, Mode_StateJumpTable
	ld a, [wd989]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
Mode_StateJumpTable:
	dr $b807c, $b811e
Func_02e_411e:
	call Func_13b7
	ret

Func_02e_4122:
	farcall unk_02f_4008
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd98c], a
	ret

Func_02e_4136:
	call Func_02e_411e
	ld a, [wd989]
	ld b, a
	call Func_02e_411e
	ld a, [wd989]
	ld c, a
	call Func_02e_411e
	ld a, [wd989]
	ld d, a
	call Func_02e_411e
	ld a, [wd989]
	ld e, a
	push de
	ld de, wd1a0
.asm_4156
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_417d
	ld l, e
	ld h, d
	ld a, [wd986]
	and a
	jr nz, .asm_416d
	pop de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	jr .asm_4172
.asm_416d
	pop de
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
.asm_4172
	push hl
	call Func_02e_411e
	ld a, [wd989]
	pop hl
	ld [hl], a
	jr .asm_418c
.asm_417d
	ld hl, $0008
	add hl, de
	push hl
	pop de
	ld a, l
	cp $E0
	jr c, .asm_4156
	pop de
	call Func_02e_411e
.asm_418c
	xor a
	ld [wd989], a
	ret

Func_02e_4191:
	ld a, $01
	ld [hFFC6], a
	xor a
	ld [wd989], a
	ld [wd9ad], a
	ld [wd9ae], a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd98e], a
	ld a, $0C
	call PlaySound
	ret

Func_02e_41af:
	ld a, [wd98b]
	and a
	jr nz, .asm_41c3
	call Func_02e_4203
	ld a, $01
	ld [wd98b], a
	ld a, $04
	ld [wd989], a
	ret
.asm_41c3
	ld a, [wd98d]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wd1a0
	add hl, de
	ld a, [wd98e]
	ld c, a
	ldh a, [hFadeFrameCounter]
	and c
	ret nz
	ld a, [wd98c]
	ld b, a
	ld a, [wd98b]
	cp b
	jr nc, .asm_41fb
	inc hl
	inc hl
	ld a, [wd98f]
	ld d, a
	ld a, [hl]
	cp d
	jr nz, .asm_41f2
	ld a, [wd990]
	ld [hl], a
	jr .asm_41f3
.asm_41f2
	ld [hl], d
.asm_41f3
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	ret
.asm_41fb
	xor a
	ld [wd989], a
	ld [wd98b], a
	ret
Func_02e_4203:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98d], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98e], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98c], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ret

Func_02e_4231:
	ld a, [wd98b]
	and a
	jr nz, .asm_426a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98d], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98c], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ld a, $05
	ld [wd989], a
	ret
.asm_426a
	ld a, [wd98d]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wd1a0
	add hl, de
	ld c, l
	ld b, h
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr nz, .asm_42a2
	ld a, [wd98c]
	ld b, a
	ld a, [wd98b]
	cp b
	jp nc, .asm_4375
	inc a
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_42a2
	ld a, [wd986]
	and a
	jr nz, .asm_42f7
	ld a, [wd988]
	cp $0C
	jr z, .asm_42f7
	cp $2E
	jr z, .asm_42f7
	cp $33
	jr z, .asm_42f7
	ld a, [wd988]
	cp $17
	jr z, .asm_42f7
	cp $37
	jr z, .asm_42f7
	cp $3E
	jr z, .asm_42f7
	cp $44
	jr z, .asm_42f7
	cp $51
	jr z, .asm_42f7
	cp $52
	jr z, .asm_42f7
	cp $65
	jr z, .asm_42f7
	cp $6B
	jr z, .asm_42f7
	cp $77
	jr z, .asm_42f7
	cp $7A
	jr z, .asm_42f7
	cp $83
	jr z, .asm_42f7
	cp $89
	jr z, .asm_42f7
	ld a, [hli]
	ld d, a
	ld a, [bc]
	sub d
	ld [bc], a
	inc bc
	ld a, [hli]
	ld d, a
	ld a, [bc]
	sub d
	ld [bc], a
	jr .asm_42ff
.asm_42f7
	ld a, [bc]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, [bc]
	add [hl]
	ld [bc], a
.asm_42ff
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ld a, [wd986]
	and a
	jr z, .asm_4311
	ld a, [wd9ea]
	and a
	ret nz
.asm_4311
	ld a, [wd988]
	cp $3E
	jp z, .asm_438e
	cp $44
	jp z, .asm_438e
	cp $7B
	jp z, .asm_438e
	cp $72
	jp z, .asm_439e
	cp $73
	jr z, .asm_4367
	cp $74
	jr z, .asm_4367
	cp $58
	jr z, .asm_4362
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld a, [wd988]
	cp $08
	jr z, .asm_4367
	cp $17
	jr z, .asm_4367
	cp $42
	jr z, .asm_4367
	cp $48
	jr z, .asm_4367
	cp $4E
	jr z, .asm_4367
	cp $65
	jr z, .asm_4367
	cp $69
	jr z, .asm_4367
	cp $80
	jr z, .asm_4367
	cp $13
	jp z, .asm_4380
	ret
.asm_4362
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
.asm_4367
	inc bc
	ld a, [bc]
	cp $01
	jr nz, .asm_4371
	ld a, $02
	ld [bc], a
	ret
.asm_4371
	ld a, $01
	ld [bc], a
	ret
.asm_4375
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98e], a
	ret
.asm_4380
	inc bc
	ld a, [bc]
	cp $04
	jr nz, .asm_438a
	ld a, $05
	ld [bc], a
	ret
.asm_438a
	ld a, $04
	ld [bc], a
	ret
.asm_438e
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	inc bc
	ld a, [bc]
	inc a
	ld [bc], a
	cp $04
	ret c
	ld a, $01
	ld [bc], a
	ret
.asm_439e
	inc bc
	ld a, [bc]
	inc a
	ld [bc], a
	cp $05
	ret c
	ld a, $01
	ld [bc], a
	ret

Func_02e_43a9:
	ld a, [wd98b]
	and a
	jr nz, .asm_43d1
	ld a, $2F
	call PlaySound
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98c], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $01
	ld [wd98b], a
	ld a, $06
	ld [wd989], a
	ret
.asm_43d1
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_43ea
	ld a, [wd990]
	and a
	jr nz, .asm_43f0
.asm_43e2
	ld de, Mode_Tilemap_5179
	ld hl, $9802
	jr .asm_43f6
.asm_43ea
	ld a, [wd990]
	and a
	jr nz, .asm_43e2
.asm_43f0
	ld de, Mode_Tilemap_519d
	ld hl, $98CC
.asm_43f6
	ld bc, $0606
	ld a, $06
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	ld a, [wd98b]
	bit 0, a
	jr z, .asm_440d
	ld e, $00
	call ClearBGMapBox
	jr .asm_4410
.asm_440d
	call PlaceTilemap
.asm_4410
	ld a, [wd98c]
	ld b, a
	ld a, [wd98b]
	cp b
	jr nc, .asm_441f
	inc a
	ld [wd98b], a
	ret
.asm_441f
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98e], a
	ld [wd98c], a
	ret

Func_02e_442d:
	ld a, [wd98b]
	and a
	jr nz, .asm_4468
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld de, Mode_SoundTbl_4478
	ld a, [wd98f]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [de]
	call PlaySound
	farcall Func_030_45c9
	ld a, $01
	ld [wd98b], a
	ld a, $07
	ld [wd989], a
	xor a
	ld [wd98e], a
	ret
.asm_4468
	ld de, Mode_StatePtrs_447b
	ld a, [wd98f]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.asm_4477
	ret
Mode_SoundTbl_4478:
	dr $b8478, $b847b
Mode_StatePtrs_447b:
	dr $b847b, $b8489
Func_02e_4489:
	ld a, [wd98e]
	and a
	jr nz, .asm_44de
	ld a, [wd986]
	and a
	jr nz, .asm_449d
	ld a, [wd990]
	and a
	jr nz, .asm_44a3
	jr .asm_44ba
.asm_449d
	ld a, [wd990]
	and a
	jr nz, .asm_44ba
.asm_44a3
	xor a
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $88
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $8C
	jr .asm_44d0
.asm_44ba
	ld a, $01
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $18
	inc hl
	ld [hl], $20
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $20
	inc hl
	ld [hl], $18
.asm_44d0
	inc hl
	ld [hl], $01
	ld a, $01
	ld [wd98e], a
	ld a, $07
	ld [wd989], a
	ret
.asm_44de
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hli], a
	ld a, [wd98d]
	and a
	jr z, .asm_44f5
	ld a, [hl]
	sub $02
	jr .asm_44f8
.asm_44f5
	ld a, [hl]
	add $02
.asm_44f8
	ld [hli], a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $07
	ret c
	ld bc, wd1a0
	ld hl, $0003
	add hl, bc
	ld a, [hli]
	ld [bc], a
	ld a, [hli]
	inc bc
	ld [bc], a
	inc bc
	xor a
	ld [bc], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	cp $03
	ret nz
	xor a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd989], a
	ret

Func_02e_4523:
	ld a, [wd98e]
	and a
	jr nz, .asm_4561
	ld a, [wd986]
	and a
	jr nz, .asm_4537
	ld a, [wd990]
	and a
	jr nz, .asm_453d
	jr .asm_454b
.asm_4537
	ld a, [wd990]
	and a
	jr nz, .asm_454b
.asm_453d
	xor a
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	jr .asm_4558
.asm_454b
	ld a, $01
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $14
.asm_4558
	inc hl
	ld [hl], $01
	ld a, $01
	ld [wd98e], a
	ret
.asm_4561
	ld a, [wd98e]
	bit 0, a
	jr nz, .asm_4570
	ld hl, wd1a0
	ld a, [hl]
	inc hl
	dec [hl]
	jr .asm_4576
.asm_4570
	ld hl, wd1a0
	ld a, [hl]
	inc hl
	inc [hl]
.asm_4576
	ldh a, [hFadeFrameCounter]
	and $0F
	ret nz
	inc hl
	ld a, [hl]
	inc a
	ld [hl], a
	cp $04
	ret c
	ld [hl], $01
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	cp $04
	ret nz
	xor a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd989], a
	ld hl, wd1a0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Func_02e_45a0:
	ldh a, [hFadeFrameCounter]
	and $0F
	ret nz
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	cp $0A
	jr nc, .asm_460c
	bit 0, a
	jr nz, .asm_45bc
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $00
	ret
.asm_45bc
	ld a, [wd986]
	and a
	jr nz, .asm_45e7
	ld a, [wd990]
	and a
	jr nz, .asm_45ed
.asm_45c8
	ld a, [wd98c]
	bit 1, a
	jr z, .asm_45db
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $40
	inc hl
	ld [hl], $01
	ret
.asm_45db
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $10
	inc hl
	ld [hl], $01
	ret
.asm_45e7
	ld a, [wd990]
	and a
	jr nz, .asm_45c8
.asm_45ed
	ld a, [wd98c]
	bit 1, a
	jr z, .asm_4600
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $90
	inc hl
	ld [hl], $01
	ret
.asm_4600
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $60
	inc hl
	ld [hl], $01
	ret
.asm_460c
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $00
	xor a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd989], a
	ret

Func_02e_4621:
	ld a, [wd98e]
	and a
	jr nz, .asm_466d
	ld a, [wd986]
	and a
	jr nz, .asm_4635
	ld a, [wd990]
	and a
	jr nz, .asm_463b
	jr .asm_464f
.asm_4635
	ld a, [wd990]
	and a
	jr nz, .asm_464f
.asm_463b
	xor a
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $74
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $0C
	jr .asm_4662
.asm_464f
	ld a, $01
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $2C
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $0C
.asm_4662
	ld a, $01
	ld [wd98e], a
	ld a, $07
	ld [wd989], a
	ret
.asm_466d
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	bit 0, a
	jr nz, .asm_468e
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $02
	ld [hl], a
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	and a
	ret nz
	jr .asm_469e
.asm_468e
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $02
	ld [hl], a
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	and a
	ret nz
	jr .asm_469e
.asm_469e
	xor a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd989], a
	ld hl, wd1a0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Func_02e_46b0:
	ld a, [wd98e]
	and a
	jr nz, .asm_4702
	ld a, [wd986]
	and a
	jr nz, .asm_46c4
	ld a, [wd990]
	and a
	jr nz, .asm_46ca
	jr .asm_46e1
.asm_46c4
	ld a, [wd990]
	and a
	jr nz, .asm_46e1
.asm_46ca
	xor a
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $60
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $04
	inc hl
	ld [hl], $01
	jr .asm_46f7
.asm_46e1
	ld a, $01
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $10
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $04
	inc hl
	ld [hl], $01
.asm_46f7
	ld a, $01
	ld [wd98e], a
	ld a, $07
	ld [wd989], a
	ret
.asm_4702
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4716
	ld [hl], $00
	jr .asm_4718
.asm_4716
	ld [hl], $01
.asm_4718
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0004
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	ld de, Mode_DeltaTbl_4763
	add hl, de
	ld a, [hl]
	cp $FF
	jr z, .asm_4751
	ld d, a
	inc hl
	ld a, [hl]
	ld e, a
	ld hl, wd1a0
	ld a, [hl]
	add d
	ld [hl], a
	inc hl
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $04
	inc hl
	inc [hl]
	jr .asm_46f7
.asm_4751
	xor a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd989], a
	ld hl, wd1a0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
Mode_DeltaTbl_4763:
	dr $b8763, $b876d
Func_02e_476d:
	ld a, [wd98b]
	and a
	jr nz, .asm_47e7
	ld a, $3D
	call PlaySound
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $08
	ld [wd989], a
	ld a, [wd986]
	and a
	jr nz, .asm_47be
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $72
	inc hl
	ld [hl], $10
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_47be
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $B5
	inc hl
	ld [hl], $10
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_47e7
	ld a, [wd986]
	and a
	jr nz, .asm_4810
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4834
	ld a, [hSCX]
	sub [hl]
	ld [hSCX], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ret
.asm_4810
	ld a, [wWX]
	ld b, a
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_4834
	add b
	ld [wWX], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ret
.asm_4834
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	di
	ld a, $8F
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $6F
	inc hl
	ld [hl], $10
	ld a, [wd986]
	and a
	jr nz, .asm_4868
	ld de, Mode_Tilemap_4883
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	jr .asm_487c
.asm_4868
	ld de, Mode_Tilemap_48a1
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
.asm_487c
	farcall Func_02b_402b
	ret
Mode_Tilemap_4883:
	dr $b8883, $b88a1
Mode_Tilemap_48a1:
	dr $b88a1, $b88c9
Func_02e_48c9:
	ld a, [wd98b]
	and a
	jr nz, .asm_48dd
	call Func_02e_4203
	ld a, $01
	ld [wd98b], a
	ld a, $09
	ld [wd989], a
	ret
.asm_48dd
	ld a, [wd98d]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wd1a0
	add hl, de
	ld a, [wd98e]
	ld c, a
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	inc hl
	inc hl
	push hl
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98c]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	pop hl
	cp $FF
	jr z, .asm_4914
	ld [hl], a
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	ret
.asm_4914
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd98e], a
	ret

Func_02e_4922:
	call Func_02e_411e
	ld a, [wd986]
	and a
	jr nz, .asm_493b
	ld a, [wd989]
	and a
	jr z, .asm_4941
.asm_4931
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr .asm_4949
.asm_493b
	ld a, [wd989]
	and a
	jr nz, .asm_4931
.asm_4941
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
.asm_4949
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 5, a
	ld [hl], a
	xor a
	ld [wd989], a
	ret

Func_02e_4956:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99e], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99c], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99d], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99f], a
	ld a, $01
	ld [wd9a0], a
	xor a
	ld [wd989], a
	ret

Func_02e_4984:
	ld a, [wd98b]
	cp $01
	jp z, .asm_49f1
	cp $02
	jp z, .asm_4a02
	cp $03
	jp z, .asm_4a13
	cp $04
	jp z, .asm_4a24
	cp $05
	jp z, .asm_4a35
	cp $06
	jp z, .asm_4a46
	cp $07
	jp z, .asm_4aba
	cp $08
	jp z, .asm_4a80
	cp $09
	jp z, .asm_4a68
	cp $0A
	jp z, .asm_4a98
	cp $0B
	jp z, .asm_4aa9
	cp $6F
	jp z, .asm_4a57
	ld a, [wd986]
	and a
	jr nz, .asm_49db
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $20
	inc hl
	ld [hl], $01
	ld a, $08
	ld [wd98b], a
	jr .asm_49eb
.asm_49db
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $01
	ld a, $09
	ld [wd98b], a
.asm_49eb
	ld a, $0C
	ld [wd989], a
	ret
.asm_49f1
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C0
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_4a02
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $A0
	inc hl
	ld [hl], $05
	ld a, $03
	ld [wd98b], a
	ret
.asm_4a13
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $30
	ret nz
	ld a, $0B
	ld [wd98b], a
	ret
.asm_4a24
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $B0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_4a35
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $D0
	inc hl
	ld [hl], $05
	ld a, $06
	ld [wd98b], a
	ret
.asm_4a46
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $48
	ret nz
	ld a, $0A
	ld [wd98b], a
	ret
.asm_4a57
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $60
	inc hl
	ld [hl], $05
	ld a, $01
	ld [wd98b], a
	ret
.asm_4a68
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $05
	ret c
	ld a, $6F
	ld [wd98b], a
	ret
.asm_4a80
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $05
	ret c
	ld a, $04
	ld [wd98b], a
	ret
.asm_4a98
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $06
	ld a, $07
	ld [wd98b], a
	ret
.asm_4aa9
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $20
	inc hl
	ld [hl], $06
	ld a, $07
	ld [wd98b], a
	ret
.asm_4aba
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $0B
	ret c
	ld [hl], $00
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret
Func_02e_4adf:
	ld e, $08
	xor a
.asm_4ae2
	ld [hli], a
	dec e
	jr nz, .asm_4ae2
	ret
Func_02e_4ae7:
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_4aed
	ld [hli], a
	dec c
	jr nz, .asm_4aed
	ret

Func_02e_4af2:
	ld a, [wd98b]
	cp $01
	jp z, .asm_4b46
	cp $02
	jp z, .asm_4b68
	cp $03
	jp z, .asm_4b79
	cp $07
	jp z, .asm_4bf0
	cp $04
	jp z, .asm_4b9b
	cp $05
	jp z, .asm_4bbd
	cp $06
	jp z, .asm_4bce
	ld a, [wd986]
	and a
	jr nz, .asm_4b30
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $01
	ld a, $04
	ld [wd98b], a
	jr .asm_4b40
.asm_4b30
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $01
	ld a, $01
	ld [wd98b], a
.asm_4b40
	ld a, $0D
	ld [wd989], a
	ret
.asm_4b46
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hl], a
	cp $D0
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_4b68
	ld hl, wd1a0
	ld [hl], $D0
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $01
	ld a, $03
	ld [wd98b], a
	ret
.asm_4b79
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	ld a, [hl]
	add $02
	ld [hl], a
	cp $10
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_4b9b
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hl], a
	cp $D0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_4bbd
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $01
	ld a, $06
	ld [wd98b], a
	ret
.asm_4bce
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	ld a, [hl]
	add $02
	ld [hl], a
	cp $40
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_4bf0
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $05
	xor a
	ld [wd98b], a
	ld [wd989], a
	ret

Func_02e_4bff:
	call Func_02e_411e
	ld a, [wd989]
	ld [wTempBank], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	call FarCopyBytes_vTiles0
	xor a
	ld [wd989], a
	ret

Func_02e_4c22:
	call AdvanceRNG
	ld a, [wd991]
	and $01
	jr z, .asm_4c37
	call Func_02e_411e
	call Func_02e_4c3d
	xor a
	ld [wd989], a
	ret
.asm_4c37
	call Func_02e_411e
	jp Func_02e_4136
Func_02e_4c3d:
	push de
	ld a, [wd088]
	ld e, a
	ld a, [wd089]
	ld d, a
	ld a, [wd989]
	ld l, a
	ld h, $00
	add hl, de
	ld a, l
	ld [wd088], a
	ld a, h
	ld [wd089], a
	pop de
	ret

Func_02e_4c57:
	ld a, [wd98b]
	cp $01
	jp z, .asm_4cb5
	cp $02
	jp z, .asm_4cd3
	cp $03
	jp z, .asm_4ce4
	cp $04
	jp z, .asm_4d02
	cp $05
	jp z, .asm_4d20
	cp $06
	jp z, .asm_4d31
	cp $07
	jp z, .asm_4d4f
	cp $08
	jp z, .asm_4d60
	cp $09
	jp z, .asm_4d71
	ld a, [wd986]
	and a
	jr nz, .asm_4c9f
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $38
	inc hl
	ld [hl], $01
	ld a, $04
	ld [wd98b], a
	jr .asm_4caf
.asm_4c9f
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $01
	ld a, $01
	ld [wd98b], a
.asm_4caf
	ld a, $10
	ld [wd989], a
	ret
.asm_4cb5
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_4cd3
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $B0
	inc hl
	ld [hl], $01
	ld a, $03
	ld [wd98b], a
	ret
.asm_4ce4
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $40
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_4d02
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $B0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_4d20
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $01
	ld a, $06
	ld [wd98b], a
	ret
.asm_4d31
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, $03
	sub b
	ld [hl], a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $38
	ret nz
	ld a, $08
	ld [wd98b], a
	ret
.asm_4d4f
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $40
	inc hl
	ld [hl], $03
	ld a, $09
	ld [wd98b], a
	ret
.asm_4d60
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $60
	inc hl
	ld [hl], $03
	ld a, $09
	ld [wd98b], a
	ret
.asm_4d71
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $07
	jr nc, .asm_4d85
	ret nz
.asm_4d85
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_4d96:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99e], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99f], a
	ld a, $02
	ld [wd9a0], a
	xor a
	ld [wd989], a
	ret

Func_02e_4db2:
	ld a, [wd98b]
	and a
	jr nz, .asm_4dd5
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98e], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98c], a
	ld a, $01
	ld [wd98b], a
	ld a, $12
	ld [wd989], a
	ret
.asm_4dd5
	ld a, [wd98e]
	ld b, a
	ldh a, [hFadeFrameCounter]
	and b
	ret nz
	ld a, [wd98c]
	dec a
	ld [wd98c], a
	and a
	ret nz
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd98e], a
	ret

Func_02e_4df4:
	ld a, [wd98b]
	cp $01
	jp z, .asm_4e48
	cp $02
	jp z, .asm_4e59
	cp $03
	jp z, .asm_4e6a
	cp $04
	jp z, .asm_4e7b
	cp $05
	jp z, .asm_4e8c
	cp $06
	jp z, .asm_4e9d
	cp $07
	jp z, .asm_4eae
	ld a, [wd986]
	and a
	jr nz, .asm_4e32
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $38
	inc hl
	ld [hl], $05
	ld a, $04
	ld [wd98b], a
	jr .asm_4e42
.asm_4e32
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $05
	ld a, $01
	ld [wd98b], a
.asm_4e42
	ld a, $13
	ld [wd989], a
	ret
.asm_4e48
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_4e59
	ld hl, wd1a0
	ld [hl], $20
	inc hl
	ld [hl], $B0
	inc hl
	ld [hl], $05
	ld a, $03
	ld [wd98b], a
	ret
.asm_4e6a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $14
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_4e7b
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $B0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_4e8c
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $05
	ld a, $06
	ld [wd98b], a
	ret
.asm_4e9d
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $64
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_4eae
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4ebc
	xor a
	jr .asm_4ebe
.asm_4ebc
	ld a, $05
.asm_4ebe
	ld [hl], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	cp $20
	ret nz
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_4eda:
	call Func_02e_4ae7
	xor a
	ld [wd989], a
	ld [wd9ad], a
	ld [wd9ae], a
	ret

Func_02e_4ee8:
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, $06
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	xor a
	ld [wd989], a
	ret

Func_02e_4f20:
	ld de, Mode_Tilemap_4883
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Mode_Tilemap_48a1
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	farcall Func_02b_402b
	farcall Func_02b_6abc
	xor a
	ld [wd989], a
	ret

Func_02e_4f59:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99f], a
	ld a, $03
	ld [wd9a0], a
	xor a
	ld [wd989], a
	ret

Func_02e_4f6c:
	ld a, [wd98b]
	and a
	jr nz, .asm_4fe1
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $18
	ld [wd989], a
	ld a, [wd986]
	and a
	jr z, .asm_4fb8
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $72
	inc hl
	ld [hl], $10
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_4fb8
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $B5
	inc hl
	ld [hl], $10
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_4fe1
	ld a, [wd986]
	and a
	jr z, .asm_500a
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_502e
	ld a, [hSCX]
	sub [hl]
	ld [hSCX], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ret
.asm_500a
	ld a, [wWX]
	ld b, a
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_502e
	add b
	ld [wWX], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ret
.asm_502e
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	di
	ld a, $8F
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $6F
	inc hl
	ld [hl], $10
	ld a, [wd986]
	and a
	jr z, .asm_5062
	ld de, Mode_Tilemap_4883
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	jr .asm_5076
.asm_5062
	ld de, Mode_Tilemap_48a1
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
.asm_5076
	farcall Func_02b_402b
	ret

Func_02e_507d:
	ld a, [wd98b]
	and a
	jr nz, .asm_5097
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98e], a
	ld a, $01
	ld [wd98b], a
	ld a, $19
	ld [wd989], a
	ret
.asm_5097
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld de, wd1a0
.asm_509f
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_50af
	ld hl, $0003
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_50cb
.asm_50af
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_50c3
	ld a, [hl]
	push hl
	ld hl, $0003
	add hl, de
	ld [hl], a
	pop hl
	ld [hl], $00
	jr .asm_50cb
.asm_50c3
	push hl
	ld hl, $0003
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
.asm_50cb
	ld hl, $0008
	add hl, de
	push hl
	pop de
	ld a, l
	cp $E0
	jr c, .asm_509f
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	and a
	ret nz
	xor a
	ld [wd98b], a
	ld [wd989], a
	ret

Func_02e_50e7:
	ld a, [wd98b]
	and a
	jr nz, .asm_50fb
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	ld a, $1A
	ld [wd989], a
.asm_50fb
	ld hl, wd100
	ld a, [wd98b]
	ld c, a
	and a
	jr z, .asm_510f
	xor a
.asm_5106
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_5106
.asm_510f
	ld a, [wd98b]
	ld c, a
	ld a, $06
	sub c
	add a
	ld c, a
	add a
	add c
	ld c, a
	and a
	jr z, .asm_513e
	ld a, [wd986]
	and a
	jr nz, .asm_512f
	ld a, [wd98f]
	and a
	jr nz, .asm_5135
.asm_512a
	ld de, Mode_Tilemap_5179
	jr .asm_5138
.asm_512f
	ld a, [wd98f]
	and a
	jr nz, .asm_512a
.asm_5135
	ld de, Mode_Tilemap_519d
.asm_5138
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_5138
.asm_513e
	ld a, [wd986]
	and a
	jr nz, .asm_514f
	ld a, [wd98f]
	and a
	jr nz, .asm_5155
.asm_514a
	ld hl, $9802
	jr .asm_5158
.asm_514f
	ld a, [wd98f]
	and a
	jr nz, .asm_514a
.asm_5155
	ld hl, $98CC
.asm_5158
	ld bc, $0606
	ld de, wd100
	ld a, $06
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	cp $07
	ret c
	xor a
	ld [wd989], a
	ld [wd98b], a
	ret
Mode_Tilemap_5179:
	dr $b9179, $b919d
Mode_Tilemap_519d:
	dr $b919d, $b91c1
Func_02e_51c1:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98d], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, [wd986]
	and a
	jr nz, .asm_5200
	ld a, [wd990]
	and a
	jr nz, .asm_5206
.asm_51df
	ld a, [wEnemyMonSpecies]
	ld [wd9c8], a
	ld a, [wd98d]
	cp $88
	jr nz, .asm_51ef
	ld a, [wd9e5]
.asm_51ef
	ld [wEnemyMonSpecies], a
	call LoadEnemyMonPic
	farcall Func_026_4d47
	xor a
	ld [wd989], a
	ret
.asm_5200
	ld a, [wd990]
	and a
	jr nz, .asm_51df
.asm_5206
	ld a, [wd9e5]
	ld [wd9c9], a
	ld a, [wd98d]
	cp $88
	jr nz, .asm_5216
	ld a, [wEnemyMonSpecies]
.asm_5216
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	xor a
	ld [wd989], a
	ret

Func_02e_5227:
	call Func_02e_411e
	ld a, [wd989]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wd1a0
	add hl, de
	push hl
	pop de
	ld a, [wd986]
	and a
	jr nz, .asm_5263
	call Func_02e_411e
	ld a, [wd989]
	ld [de], a
	inc de
	call Func_02e_411e
	ld a, [wd989]
	ld [de], a
	inc de
	call Func_02e_411e
	ld a, [wd989]
	ld [de], a
	ld a, $03
	ld [wd989], a
	call Func_02e_4c3d
	xor a
	ld [wd989], a
	ret
.asm_5263
	ld a, $03
	ld [wd989], a
	call Func_02e_4c3d
	call Func_02e_411e
	ld a, [wd989]
	ld [de], a
	inc de
	call Func_02e_411e
	ld a, [wd989]
	ld [de], a
	inc de
	call Func_02e_411e
	ld a, [wd989]
	ld [de], a
	xor a
	ld [wd989], a
	ret

Func_02e_5287:
	ld a, [wd98b]
	and a
	jr nz, .asm_529b
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $1D
	ld [wd989], a
.asm_529b
	farcall unk_033_4000
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	cp $0A
	ret c
	xor a
	ld [wd989], a
	ld [wd98b], a
	ret

Func_02e_52b3:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	farcall unk_02f_4000
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd98c], a
	ret

Func_02e_52d0:
	ld a, [wd98b]
	cp $01
	jp z, .asm_531b
	cp $02
	jp z, .asm_532b
	cp $04
	jp z, .asm_534d
	cp $05
	jp z, .asm_535d
	ld a, [wd986]
	and a
	jr nz, .asm_5302
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $30
	inc hl
	ld [hl], $04
	inc hl
	ld [hl], $06
	ld a, $04
	ld [wd98b], a
	jr .asm_5315
.asm_5302
	ld hl, wd1a0
	ld [hl], $38
	inc hl
	ld [hl], $50
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $06
	ld a, $01
	ld [wd98b], a
.asm_5315
	ld a, $1F
	ld [wd989], a
	ret
.asm_531b
	ld hl, wd1a0
	dec [hl]
	inc hl
	dec [hl]
	ld a, [hl]
	cp $38
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_532b
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $04
	ret c
	ld [hl], $01
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	jr .asm_537f
.asm_534d
	ld hl, wd1a0
	inc [hl]
	inc hl
	inc [hl]
	ld a, [hl]
	cp $50
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_535d
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $07
	ret c
	ld [hl], $04
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	jr .asm_537f
.asm_537f
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_5390:
	ld a, [wd98b]
	and a
	jr nz, .asm_53cf
	call Func_02e_4203
	ld a, [wd986]
	and a
	jr z, .asm_53bc
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $01
	ld [wd98b], a
	ld a, $20
	ld [wd989], a
	ret
.asm_53bc
	ld a, $02
	ld [wd989], a
	call Func_02e_4c3d
	ld a, $01
	ld [wd98b], a
	ld a, $20
	ld [wd989], a
	ret
.asm_53cf
	ld a, [wd98d]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wd1a0
	add hl, de
	ld a, [wd98e]
	ld c, a
	ldh a, [hFadeFrameCounter]
	and c
	ret nz
	ld a, [wd98c]
	ld b, a
	ld a, [wd98b]
	cp b
	jr nc, .asm_5407
	inc hl
	inc hl
	ld a, [wd98f]
	ld d, a
	ld a, [hl]
	cp d
	jr nz, .asm_53fe
	ld a, [wd990]
	ld [hl], a
	jr .asm_53ff
.asm_53fe
	ld [hl], d
.asm_53ff
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	ret
.asm_5407
	xor a
	ld [wd989], a
	ld [wd98b], a
	ret

Func_02e_540f:
	ld a, [wd98b]
	cp $01
	jr z, .asm_544c
	cp $02
	jr z, .asm_546d
	xor a
	ld [wd98e], a
	ld a, [wd986]
	and a
	jr nz, .asm_5436
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $03
	ld a, $02
	ld [wd98b], a
	jr .asm_5446
.asm_5436
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $03
	ld a, $01
	ld [wd98b], a
.asm_5446
	ld a, $21
	ld [wd989], a
	ret
.asm_544c
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	cp $10
	ret nz
	xor a
	ld [wd98e], a
	ld hl, wd1a0
	ld a, [hl]
	add $08
	ld [hl], a
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	inc hl
	dec [hl]
	ld a, [hl]
	and a
	ret nz
	jr .asm_548e
.asm_546d
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	cp $10
	ret nz
	xor a
	ld [wd98e], a
	ld hl, wd1a0
	ld a, [hl]
	add $08
	ld [hl], a
	inc hl
	ld a, [hl]
	sub $08
	ld [hl], a
	inc hl
	dec [hl]
	ld a, [hl]
	and a
	ret nz
	jr .asm_548e
.asm_548e
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98e], a
	ret

Func_02e_549f:
	ld a, [wd98b]
	cp $01
	jp z, .asm_54f3
	cp $02
	jp z, .asm_5518
	cp $03
	jp z, .asm_5529
	cp $07
	jp z, .asm_5589
	cp $04
	jp z, .asm_553e
	cp $05
	jp z, .asm_5563
	cp $06
	jp z, .asm_5574
	ld a, [wd986]
	and a
	jr nz, .asm_54dd
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $01
	ld a, $04
	ld [wd98b], a
	jr .asm_54ed
.asm_54dd
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $01
	ld a, $01
	ld [wd98b], a
.asm_54ed
	ld a, $22
	ld [wd989], a
	ret
.asm_54f3
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $05
	jr c, .asm_5508
	ld [hl], $01
.asm_5508
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hl], a
	cp $D0
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_5518
	ld hl, wd1a0
	ld [hl], $D0
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $05
	ld a, $03
	ld [wd98b], a
	ret
.asm_5529
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld a, [hl]
	add $02
	ld [hl], a
	cp $10
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_553e
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $05
	jr c, .asm_5553
	ld [hl], $01
.asm_5553
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hl], a
	cp $D0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_5563
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $05
	ld a, $06
	ld [wd98b], a
	ret
.asm_5574
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld a, [hl]
	add $02
	ld [hl], a
	cp $40
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_5589
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	inc a
	ld [hl], a
	cp $09
	ret c
	ld [hl], $00
	xor a
	ld [wd98b], a
	ld [wd989], a
	ret

Func_02e_55a3:
	ld a, [wd98b]
	and a
	jr nz, .asm_55ca
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $23
	ld [wd989], a
	xor a
	ld [wd98e], a
	ld a, $01
	ld [wd98b], a
	ret
.asm_55ca
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr nz, .asm_55ea
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98e], a
	ret
.asm_55ea
	ld a, [hSCX]
	add [hl]
	ld [hSCX], a
	inc hl
	ld a, [hSCY]
	add [hl]
	ld [hSCY], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ret

Func_02e_5601:
	ld a, [wd98b]
	and a
	jp nz, .asm_5690
	ld a, [hSCX]
	ld [wd9ab], a
	ld [wWX], a
	ld a, [hSCY]
	ld [wd9ac], a
	ld [wWY], a
	ld a, [wd986]
	and a
	jr z, .asm_5658
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $00
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $EB
	inc hl
	ld [hl], $10
	ld a, $18
	ld [wd98f], a
	ld a, $30
	ld [wd990], a
	ld a, $00
	ld [wd98c], a
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_5658
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $EB
	inc hl
	ld [hl], $10
	ld a, $48
	ld [wd98f], a
	ld a, $60
	ld [wd990], a
	ld a, $30
	ld [wd98c], a
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_5690
	ld a, [wWX]
	dec a
	ld [wWX], a
	ld a, [wd9ab]
	inc a
	ld [wd9ab], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	cp $20
	ret c
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	di
	ld a, $8F
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $6F
	inc hl
	ld [hl], $10
	ld a, [wd986]
	and a
	jr z, .asm_56dc
	ld de, Mode_Tilemap_4883
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	jr .asm_56f0
.asm_56dc
	ld de, Mode_Tilemap_48a1
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
.asm_56f0
	farcall Func_02b_402b
	xor a
	ld [wd989], a
	ld a, [hSCX]
	ld [wd9ab], a
	ld [wWX], a
	ld a, [hSCY]
	ld [wd9ac], a
	ld [wWY], a
	ret

Func_02e_570d:
	ld a, [wd98b]
	cp $01
	jp z, .asm_5761
	cp $02
	jp z, .asm_5772
	cp $03
	jp z, .asm_5783
	cp $04
	jp z, .asm_5794
	cp $05
	jp z, .asm_57a5
	cp $06
	jp z, .asm_57b6
	cp $07
	jp z, .asm_57c7
	ld a, [wd986]
	and a
	jr nz, .asm_574b
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $05
	ld a, $04
	ld [wd98b], a
	jr .asm_575b
.asm_574b
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $05
	ld a, $01
	ld [wd98b], a
.asm_575b
	ld a, $25
	ld [wd989], a
	ret
.asm_5761
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_5772
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $B0
	inc hl
	ld [hl], $05
	ld a, $03
	ld [wd98b], a
	ret
.asm_5783
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $14
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_5794
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $B0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_57a5
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $05
	ld a, $06
	ld [wd98b], a
	ret
.asm_57b6
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $64
	ret nz
	ld a, $07
	ld [wd98b], a
	ret
.asm_57c7
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_57d8:
	ld a, [wd98b]
	cp $01
	jp z, .asm_582c
	cp $02
	jp z, .asm_583d
	cp $03
	jp z, .asm_584e
	cp $04
	jp z, .asm_5868
	cp $05
	jp z, .asm_5879
	cp $06
	jp z, .asm_588a
	cp $07
	jp z, .asm_58a4
	ld a, [wd986]
	and a
	jr nz, .asm_5816
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $05
	ld a, $04
	ld [wd98b], a
	jr .asm_5826
.asm_5816
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $05
	ld a, $01
	ld [wd98b], a
.asm_5826
	ld a, $26
	ld [wd989], a
	ret
.asm_582c
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_583d
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $B0
	inc hl
	ld [hl], $05
	ld a, $03
	ld [wd98b], a
	ret
.asm_584e
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $14
	ret nz
	ld a, $07
	ld [wd98b], a
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $01
	ret
.asm_5868
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $B0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_5879
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $05
	ld a, $06
	ld [wd98b], a
	ret
.asm_588a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $64
	ret nz
	ld a, $07
	ld [wd98b], a
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $01
	ret
.asm_58a4
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_58b8
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	inc a
	ld [hl], a
	jr .asm_58bf
.asm_58b8
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	dec a
	ld [hl], a
.asm_58bf
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $05
	ret c
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_58dd:
	ld a, $01
	ld [wd9ad], a
	xor a
	ld [wd989], a
	ld [wd9ae], a
	ret

Func_02e_58ea:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	farcall unk_033_4438
	xor a
	ld [wd989], a
	ret

Func_02e_5907:
	farcall Func_030_7194
	ret

Func_02e_590e:
	farcall Func_030_72d7
	ret

Func_02e_5915:
	farcall Func_030_75c7
	ret

Func_02e_591c:
	farcall Func_030_7610
	ret

Func_02e_5923:
	farcall Func_030_766a
	ret

Func_02e_592a:
	ld hl, wd1a0
	dec [hl]
	ld a, [hFadeFrameCounter]
	and $03
	ret nz
	inc hl
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0A
	jr nc, .asm_594e
	dec hl
	ld a, [hl]
	and a
	jr nz, .asm_5947
	ld a, [wd98e]
	ld [hl], a
	ret
.asm_5947
	ld a, [hl]
	ld [wd98e], a
	ld [hl], $00
	ret
.asm_594e
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ret

Func_02e_595c:
	ld hl, wd1a0
	inc [hl]
	ld a, [hFadeFrameCounter]
	and $03
	ret nz
	inc hl
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0A
	jr nc, .asm_5982
	dec hl
	ld a, [hl]
	and a
	jr nz, .asm_597a
	inc hl
	inc hl
	ld a, [hld]
	dec hl
	ld [hl], a
	ret
.asm_597a
	ld a, [hl]
	inc hl
	inc hl
	ld [hld], a
	dec hl
	ld [hl], $00
	ret
.asm_5982
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ret

Func_02e_598d:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99f], a
	ld a, $04
	ld [wd9a0], a
	xor a
	ld [wd989], a
	ret

Func_02e_59a0:
	ld bc, wd1a0
.asm_59a3
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_59b7
	cp $01
	jp z, .asm_59f6
	cp $02
	jp z, .asm_5a0f
	ret
.asm_59b7
	ldh a, [hFadeFrameCounter]
	and $1F
	jp nz, .asm_5a50
	ld de, Mode_CoordTbl_5a5d
	ld a, [wd98b]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $01
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	cp $06
	ret c
	xor a
	ld [wd98b], a
	ret
.asm_59f6
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_5a50
	ld hl, $0002
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $04
	jr c, .asm_5a50
	ld hl, $0004
	add hl, bc
	ld [hl], $02
	jp .asm_5a50
.asm_5a0f
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	jr nc, .asm_5a30
	and $03
	jr nz, .asm_5a50
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $04
	jr nz, .asm_5a2b
	ld [hl], $00
	jp .asm_5a50
.asm_5a2b
	ld [hl], $04
	jp .asm_5a50
.asm_5a30
	ld hl, $0000
	add hl, bc
	call Func_02e_4adf
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	cp $05
	jr nz, .asm_5a50
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98c], a
	call Func_02e_4ae7
	ret
.asm_5a50
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $E0
	jp c, .asm_59a3
	ret
Mode_CoordTbl_5a5d:
	dr $b9a5d, $b9a71
Func_02e_5a71:
	ld a, [wd98b]
	and a
	jr nz, .asm_5aa8
	ld a, $05
	ld [wd98b], a
	ld de, Mode_PtrTbl_5ad6
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wd1a0
.asm_5a8d
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	xor a
	ld [hli], a
	ld bc, $0004
	add hl, bc
	ld a, [wd98b]
	dec a
	ld [wd98b], a
	cp $02
	jr nc, .asm_5a8d
	ret
.asm_5aa8
	ld hl, wd1a0
	dec [hl]
	dec [hl]
	ld hl, wd1a8
	inc [hl]
	inc [hl]
	ld hl, wd1b0
	inc hl
	dec [hl]
	dec [hl]
	ld hl, wd1b8
	inc hl
	inc [hl]
	inc [hl]
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	cp $20
	ret c
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98e], a
	call Func_02e_4ae7
	ret
Mode_PtrTbl_5ad6:
	dr $b9ad6, $b9af2
Func_02e_5af2:
	ld a, [wd98b]
	and a
	jr nz, .asm_5b08
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	ld a, $33
	ld [wd989], a
	jr .asm_5b0d
.asm_5b08
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
.asm_5b0d
	ld hl, wd100
	ld a, [wd98b]
	ld c, a
	ld a, $06
	sub c
	ld c, a
	and a
	jr z, .asm_5b25
	xor a
.asm_5b1c
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_5b1c
.asm_5b25
	ld a, [wd98b]
	add a
	ld c, a
	add a
	add c
	ld c, a
	and a
	jr z, .asm_5b50
	ld a, [wd986]
	and a
	jr nz, .asm_5b41
	ld a, [wd98f]
	and a
	jr nz, .asm_5b47
.asm_5b3c
	ld de, Mode_Tilemap_5179
	jr .asm_5b4a
.asm_5b41
	ld a, [wd98f]
	and a
	jr nz, .asm_5b3c
.asm_5b47
	ld de, Mode_Tilemap_519d
.asm_5b4a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_5b4a
.asm_5b50
	ld a, [wd986]
	and a
	jr nz, .asm_5b61
	ld a, [wd98f]
	and a
	jr nz, .asm_5b67
.asm_5b5c
	ld hl, $9802
	jr .asm_5b6a
.asm_5b61
	ld a, [wd98f]
	and a
	jr nz, .asm_5b5c
.asm_5b67
	ld hl, $98CC
.asm_5b6a
	ld bc, $0606
	ld de, wd100
	ld a, $06
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	cp $07
	ret c
	xor a
	ld [wd989], a
	ld [wd98b], a
	ret

Func_02e_5b8b:
	ld a, [wd98b]
	cp $01
	jp z, .asm_5bc6
	cp $04
	jp z, .asm_5be3
	ld a, [wd986]
	and a
	jr nz, .asm_5bb0
	ld hl, wd1a0
	ld [hl], $2C
	inc hl
	ld [hl], $50
	inc hl
	ld [hl], $06
	ld a, $04
	ld [wd98b], a
	jr .asm_5bc0
.asm_5bb0
	ld hl, wd1a0
	ld [hl], $5C
	inc hl
	ld [hl], $30
	inc hl
	ld [hl], $06
	ld a, $01
	ld [wd98b], a
.asm_5bc0
	ld a, $34
	ld [wd989], a
	ret
.asm_5bc6
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $09
	jr c, .asm_5bd6
	ld [hl], $06
.asm_5bd6
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	jr .asm_5c00
.asm_5be3
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $09
	jr c, .asm_5bf3
	ld [hl], $06
.asm_5bf3
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $B0
	ret nz
	jr .asm_5c00
.asm_5c00
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_5c11:
	ld a, [wd98b]
	cp $01
	jp z, .asm_5c4c
	cp $04
	jp z, .asm_5c69
	ld a, [wd986]
	and a
	jr nz, .asm_5c36
	ld hl, wd1a0
	ld [hl], $5C
	inc hl
	ld [hl], $D0
	inc hl
	ld [hl], $06
	ld a, $04
	ld [wd98b], a
	jr .asm_5c46
.asm_5c36
	ld hl, wd1a0
	ld [hl], $2C
	inc hl
	ld [hl], $A0
	inc hl
	ld [hl], $06
	ld a, $01
	ld [wd98b], a
.asm_5c46
	ld a, $35
	ld [wd989], a
	ret
.asm_5c4c
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $09
	jr c, .asm_5c5c
	ld [hl], $06
.asm_5c5c
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	jr .asm_5c86
.asm_5c69
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $09
	jr c, .asm_5c79
	ld [hl], $06
.asm_5c79
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $A0
	ret nz
	jr .asm_5c86
.asm_5c86
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_5c97:
	ld a, [wd98b]
	cp $01
	jp z, .asm_5cd2
	cp $04
	jp z, .asm_5cef
	ld a, [wd986]
	and a
	jr nz, .asm_5cbc
	ld hl, wd1a0
	ld [hl], $24
	inc hl
	ld [hl], $58
	inc hl
	ld [hl], $0E
	ld a, $04
	ld [wd98b], a
	jr .asm_5ccc
.asm_5cbc
	ld hl, wd1a0
	ld [hl], $50
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $0E
	ld a, $01
	ld [wd98b], a
.asm_5ccc
	ld a, $36
	ld [wd989], a
	ret
.asm_5cd2
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $11
	jr c, .asm_5ce2
	ld [hl], $0E
.asm_5ce2
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	jr .asm_5d0c
.asm_5cef
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $11
	jr c, .asm_5cff
	ld [hl], $0E
.asm_5cff
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $B0
	ret nz
	jr .asm_5d0c
.asm_5d0c
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_5d1d:
	ld a, [wd98b]
	cp $01
	jp z, .asm_5d58
	cp $04
	jp z, .asm_5d75
	ld a, [wd986]
	and a
	jr nz, .asm_5d42
	ld hl, wd1a0
	ld [hl], $54
	inc hl
	ld [hl], $D0
	inc hl
	ld [hl], $0E
	ld a, $04
	ld [wd98b], a
	jr .asm_5d52
.asm_5d42
	ld hl, wd1a0
	ld [hl], $24
	inc hl
	ld [hl], $A0
	inc hl
	ld [hl], $0E
	ld a, $01
	ld [wd98b], a
.asm_5d52
	ld a, $37
	ld [wd989], a
	ret
.asm_5d58
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $11
	jr c, .asm_5d68
	ld [hl], $0E
.asm_5d68
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $C8
	ret nz
	jr .asm_5d92
.asm_5d75
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $11
	jr c, .asm_5d85
	ld [hl], $0E
.asm_5d85
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $04
	ld [hl], a
	cp $A0
	ret nz
	jr .asm_5d92
.asm_5d92
	ld hl, wd1a0
	call Func_02e_4adf
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ret

Func_02e_5da3:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd99f], a
	ld a, $05
	ld [wd9a0], a
	xor a
	ld [wd989], a
	ret

Func_02e_5db6:
	xor a
	ld [wd9ad], a
	ld [wd9ae], a
	ld [wd989], a
	ret

Func_02e_5dc1:
	farcall Func_030_4027
	ld a, [wd986]
	and a
	jr z, .asm_5dd2
	ld a, $01
	ld [wd993], a
.asm_5dd2
	ld a, [wd993]
	and a
	jr nz, .asm_5de2
	ld a, $03
	ld [wd989], a
	xor a
	ld [wd98c], a
	ret
.asm_5de2
	xor a
	ld [wd989], a
	ld [wd98c], a
	ret

Func_02e_5dea:
	farcall Func_030_4027
	call Func_02e_411e
	ld a, [wd993]
	and a
	jr nz, .asm_5e21
	ld a, [wd986]
	and a
	jr nz, .asm_5e09
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_5e11
.asm_5e09
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_5e11
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	bit 4, a
	jr nz, .asm_5e1d
	call Func_02e_4c3d
.asm_5e1d
	xor a
	ld [wd993], a
.asm_5e21
	xor a
	ld [wd989], a
	ret

Func_02e_5e26:
	ld a, $01
	ld [wd9b5], a
	farcall Func_02b_4098
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd98e], a
	ld a, [wd986]
	and a
	jr nz, .asm_5e4e
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_5e56
.asm_5e4e
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_5e56
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	ret nz
	ld a, $01
	ld [hFFC6], a
	xor a
	ld [wd989], a
	ld [wd9ad], a
	ld [wd9ae], a
	ld a, $05
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02e_5e76:
	call Func_02e_411e
	call AdvanceRNG
	ld a, [wd991]
	and $01
	jr z, .asm_5e86
	call Func_02e_4c3d
.asm_5e86
	xor a
	ld [wd989], a
	ret

Func_02e_5e8b:
	call Func_02e_411e
	ld a, [wd989]
	ld e, a
	call Func_02e_411e
	ld a, [wd989]
	ld d, a
	farcall Func_4d_5ed8
	xor a
	ld [wd989], a
	ret

Func_02e_5ea4:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	farcall Func_04d_4000
	xor a
	ld [wd989], a
	ret
Func_02e_5ec1:
	farcall unk_01e_6acd
	ld a, d
	and a
	jr z, .asm_5f00
	ld a, [$dce6]
	and a
	jr nz, .asm_5ed7
	ld a, [hFFD6]
	and a
	jr nz, .asm_5f00
.asm_5ed7
	call Func_132f
	and a
	jr z, .asm_5ee4
	ld a, [$dc9c]
	cp $14
	jr nc, .asm_5eef
.asm_5ee4
	farcall unk_023_56de
	xor a
	ld [wd989], a
	ret
.asm_5eef
	ld a, $5A
	ld [wd3ff], a
	farcall Func_02d_4000
	call .asm_5f0b
	call .asm_5f0b
.asm_5f00
	farcall unk_023_56f3
	xor a
	ld [wd989], a
	ret
.asm_5f0b
	ld c, $20
.asm_5f0d
	call DelayFrame
	dec c
	jr nz, .asm_5f0d
	ret
Func_02e_5f14:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, [wd986]
	and a
	jr nz, .asm_5f3a
	ld a, [wd990]
	and a
	jr nz, .asm_5f40
.asm_5f29
	ld a, [wEnemyMonSpecies]
	call LoadEnemyMonPic
	farcall Func_026_4d47
	xor a
	ld [wd989], a
	ret
.asm_5f3a
	ld a, [wd990]
	and a
	jr nz, .asm_5f29
.asm_5f40
	ld a, [wd9e5]
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	xor a
	ld [wd989], a
	ret
Func_02e_5f51:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd988], a
	farcall unk_02f_4008
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd98c], a
	ret
Func_02e_5f6e:
	call Func_02e_411e
	ld a, [hFFD6]
	ld b, a
	ld a, $01
	sub b
	ld [wd993], a
	ld a, [wd993]
	and a
	jr nz, .asm_5f84
	call Func_02e_4c3d
.asm_5f84
	xor a
	ld [wd989], a
	ret
Func_02e_5f89:
	call AdvanceRNG
	ld a, [wd991]
	and $01
	jr z, .asm_5f9e
	call Func_02e_411e
	call Func_02e_4c3d
	xor a
	ld [wd989], a
	ret
.asm_5f9e
	call Func_02e_411e
	jp Func_02e_411e
Func_02e_5fa4:
	ld a, [wd98b]
	and a
	jr nz, .asm_5fd6
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	farcall Func_030_45e2
	ld a, $01
	ld [wd98b], a
	ld a, $45
	ld [wd989], a
	xor a
	ld [wd98e], a
	ld a, $34
	call PlaySound
	ret
.asm_5fd6
	ld de, Jumptable_02e_6270
	ld a, [wd98f]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
Func_02e_5fe5:
	ret
Func_02e_5fe6:
	ld a, [wd98b]
	and a
	jr nz, .asm_605b
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98f], a
	call Func_02e_411e
	ld a, [wd989]
	ld [wd990], a
	ld a, $46
	ld [wd989], a
	ld a, [wd986]
	and a
	jr z, .asm_6032
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $72
	inc hl
	ld [hl], $10
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_6032
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $B5
	inc hl
	ld [hl], $10
	ld a, $01
	ld [wd98b], a
	xor a
	ld [wd98e], a
	ret
.asm_605b
	ld a, [wd986]
	and a
	jr z, .asm_6084
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_60a8
	ld a, [hSCX]
	sub [hl]
	ld [hSCX], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ret
.asm_6084
	ld a, [wWX]
	ld b, a
	ld a, [wd98f]
	ld e, a
	ld a, [wd990]
	ld d, a
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_60a8
	add b
	ld [wWX], a
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ret
.asm_60a8
	xor a
	ld [wd989], a
	ld [wd98e], a
	ld [wd98b], a
	di
	ld a, $8F
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $6F
	inc hl
	ld [hl], $10
	ld a, [wd986]
	and a
	jr z, .asm_60dc
	ld de, Mode_Tilemap_4883
	ld hl, $982A
	ld bc, $0A03
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $03
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	jr .asm_60f0
.asm_60dc
	ld de, Mode_Tilemap_48a1
	ld hl, $98E0
	ld bc, $0A04
	ld a, $0A
	ldh [hVRAMCopyWidth], a
	ld a, $04
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
.asm_60f0
	farcall Func_02b_402b
	ret
Func_02e_60f7:
	call Func_02e_411e
	ld a, [wd989]
	ld [wd98d], a
	call Func_02e_411e
	ld a, [wd989]
	ld e, a
	call Func_02e_411e
	ld a, [wd989]
	ld d, a
	ld a, [wd98d]
	push de
.asm_6112
	ld [$dcf1], a
	pop de
	push de
	call .asm_6174
	ld a, [$dcf1]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, wd1a0
	add hl, bc
	call .asm_613b
	ld a, [$dcf1]
	cp $00
	jp z, .asm_6139
	dec a
	ld [$dcf1], a
	jp .asm_6112
.asm_6139
	pop de
	ret
.asm_613b
	ld a, [wd986]
	and a
	jp nz, .asm_615b
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	inc de
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ret
.asm_615b
	inc de
	inc de
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ret
.asm_6174
	sla a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ret
Func_02e_617f:
	ld a, [wd98b]
	and a
	jr nz, .asm_6193
	call Func_02e_60f7
	ld a, $01
	ld [wd98b], a
	ld a, $48
	ld [wd989], a
	ret
.asm_6193
	farcall unk_02d_6e2c
	ret
Func_02e_619a:
	ld a, [wd98b]
	and a
	jr nz, .asm_61ae
	call Func_02e_60f7
	ld a, $01
	ld [wd98b], a
	ld a, $47
	ld [wd989], a
	ret
.asm_61ae
	farcall unk_02d_6d77
	ret
Func_02e_61b5:
	ld a, [wd98b]
	and a
	jr nz, .asm_61c6
	ld a, [wd9b5]
	ld [wd98f], a
	ld a, $49
	ld [wd989], a
.asm_61c6
	ld hl, wd100
	ld a, [wd98b]
	ld c, a
	and a
	jr z, .asm_61da
	xor a
.asm_61d1
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_61d1
.asm_61da
	ld a, [wd98b]
	ld c, a
	ld a, $06
	sub c
	add a
	ld c, a
	add a
	add c
	ld c, a
	and a
	jr z, .asm_6209
	ld a, [wd986]
	and a
	jr nz, .asm_61fa
	ld a, [wd98f]
	and a
	jr nz, .asm_6200
.asm_61f5
	ld de, Mode_Tilemap_5179
	jr .asm_6203
.asm_61fa
	ld a, [wd98f]
	and a
	jr nz, .asm_61f5
.asm_6200
	ld de, Mode_Tilemap_519d
.asm_6203
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_6203
.asm_6209
	ld a, [wd986]
	and a
	jr nz, .asm_621a
	ld a, [wd98f]
	and a
	jr nz, .asm_6220
.asm_6215
	ld hl, $9802
	jr .asm_6223
.asm_621a
	ld a, [wd98f]
	and a
	jr nz, .asm_6215
.asm_6220
	ld hl, $98CC
.asm_6223
	ld bc, $0606
	ld de, wd100
	ld a, $06
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	cp $07
	ret c
	xor a
	ld [wd989], a
	ld [wd98b], a
	ret
Func_02e_6244:
	xor a
	ld [wd989], a
	ret
Func_02e_6249:
	xor a
	ld [wd989], a
	ret
Func_02e_624e:
	xor a
	ld [wd989], a
	ret
Func_02e_6253:
	xor a
	ld [wd989], a
	ret
Func_02e_6258:
	xor a
	ld [wd989], a
	ret
Func_02e_625d:
	xor a
	ld [wd989], a
	ret
Func_02e_6262:
	call Func_02e_411e
	ld a, [wd989]
	call PlaySound
	xor a
	ld [wd989], a
	ret
Jumptable_02e_6270:
	dr $ba270, $ba27e
Func_02e_627e:
	ld a, [wd98e]
	and a
	jr nz, .asm_62ca
	ld a, [wd986]
	and a
	jr nz, .asm_6292
	ld a, [wd990]
	and a
	jr nz, .asm_6298
	jr .asm_62ac
.asm_6292
	ld a, [wd990]
	and a
	jr nz, .asm_62ac
.asm_6298
	xor a
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $70
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $08
	jr .asm_62bf
.asm_62ac
	ld a, $01
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $08
.asm_62bf
	ld a, $01
	ld [wd98e], a
	ld a, $45
	ld [wd989], a
	ret
.asm_62ca
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld a, [hl]
	add $04
	ld [hl], a
	inc hl
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	and a
	ret nz
	xor a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd989], a
	ld hl, wd1a0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
Func_02e_62ef:
	ld a, [wd98e]
	and a
	jr nz, .asm_633b
	ld a, [wd986]
	and a
	jr nz, .asm_6303
	ld a, [wd990]
	and a
	jr nz, .asm_6309
	jr .asm_631d
.asm_6303
	ld a, [wd990]
	and a
	jr nz, .asm_631d
.asm_6309
	xor a
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $60
	inc hl
	ld [hl], $70
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $08
	jr .asm_6330
.asm_631d
	ld a, $01
	ld [wd98d], a
	ld hl, wd1a0
	ld [hl], $30
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $08
.asm_6330
	ld a, $01
	ld [wd98e], a
	ld a, $45
	ld [wd989], a
	ret
.asm_633b
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld a, [hl]
	sub $04
	ld [hl], a
	inc hl
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	and a
	ret nz
	xor a
	ld [wd98e], a
	ld [wd98b], a
	ld [wd989], a
	ld hl, wd1a0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
MovementDeltas_02e_6360:
	dr $ba360, $ba7ce
ScrollDeltas_02e_67ce:
	dr $ba7ce, $ba94e
MovementDeltas_02e_694e:
	dr $ba94e, $ba970
ObjectAnimData_02e_6970:
	dr $ba970, $bae42
Func_02e_6e42:
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_6e48
	ld [hli], a
	dec c
	jr nz, .asm_6e48
	ret
unk_02e_6e4d:
	dr $bae4d, $bae4d


