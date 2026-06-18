Func_030_4000::
	ld a, [wd986]
	and a
	jr z, .asm_4018
	ld a, [wd9ea]
	and a
	jr z, .asm_4018

	xor a
	ld [wd9ea], a
	ld de, unk_030_4335
	ld a, [wd9f3]
	jr .asm_401e

.asm_4018
	ld de, MoveEffectPointers
	ld a, [wd988]

.asm_401e
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Func_030_4027::
	call .asm_4187
	and a
	jp nz, .asm_40ed
	call Func_030_42ab
	ld a, [wd9c7]
	and a
	jp z, .asm_40ed
	call AdvanceRNG
	ld de, $40f8
	ld a, [wd988]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	jp z, .asm_40f2
	ld [hFFC7], a
	ld a, [$d98d]
	and a
	jr z, .asm_407d
	ld de, wd93c
	ld a, [wd987]
	add a
	ld l, a
	add a
	add a
	add l
	add $02
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [hFFCB], a
	xor a
	ld [hFFCC], a
	ld [hFFCD], a
	ld hl, $414a
	ld b, $25
	rst $30
	ld de, wd900
	ld a, [wd983]
	jr .asm_40a5
.asm_407d
	ld de, wd900
	ld a, [wd983]
	add a
	ld l, a
	add a
	add a
	add l
	add $02
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [hFFCB], a
	xor a
	ld [hFFCC], a
	ld [hFFCD], a
	ld hl, $414a
	ld b, $25
	rst $30
	ld de, wd93c
	ld a, [wd987]
.asm_40a5
	add a
	ld l, a
	add a
	add a
	add l
	add $03
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [hFFC7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	ld a, [hFFCB]
	ld [wd993], a
	ld a, [wd991]
	ld [hFFCB], a
	xor a
	ld [hFFCC], a
	ld [hFFCD], a
	ld a, $64
	ld [hFFC7], a
	ld hl, $414a
	ld b, $25
	rst $30
	ld a, $ff
	ld [hFFC7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	ld a, [hFFCB]
	ld b, a
	ld a, [wd993]
	cp b
	jr nc, .asm_40f2
.asm_40ed
	xor a
	ld [wd993], a
	ret
.asm_40f2
	ld a, $01
	ld [wd993], a
	ret
	nop
	ld c, e
	ld h, h
	ld e, a
	ld h, h
	ld e, d
	ld d, l
	scf
	ld h, h
	ld d, l
	ld h, h
	nop
	nop
	scf
	ld h, h
	ld h, h
	ld h, h
	nop
	nop
	ld h, h
	ld h, h
	ld c, e
	ld h, h
	ld h, h
	nop
	ld e, a
	ld d, l
	nop
	ld h, h
	scf
	ld h, h
	ld h, h
	ld h, h
	ld h, h
	ld e, $3c
	nop
	ld d, b
	nop
	nop
	nop
	nop
	ld e, d
	ld h, h
	ld h, h
	ld h, h
	ld e, d
	add hl, de
	nop
	ld e, d
	ld h, h
	ld h, h
	ld h, h
	ld d, l
	ld h, h
	ld d, l
	ld c, e
	ld d, b
	ld h, h
	ld h, h
	ld h, h
	ld h, h
	ld h, h
	ld [hld], a
	ld h, h
	ld b, [hl]
	ld h, h
	ld h, h
	ld d, b
	ld h, h
	ld d, b
	ld h, h
	ld h, h
	ld h, h
	ld d, l
	ld e, d
	ld b, [hl]
	ld h, h
	ld d, l
	ld d, l
	ld c, e
	ld b, c
	ld e, d
	ld h, h
	ld h, h
	ld e, d
	ld e, $64
	ld c, e
	ld h, h
	ld b, [hl]
	ld d, l
	ld h, h
	ld h, h
	ld h, h
	ld h, h
	ld h, h
	ld h, h
	ld e, d
	ld d, b
	ld b, [hl]
	ld c, e
	ld b, [hl]
	ld h, h
	ld e, a
	ld h, h
	ld h, h
	ld d, b
	ld d, b
	inc a
	ld h, h
	ld d, b
	inc a
	ld b, [hl]
	ld h, h
	ld d, l
	ld d, b
	ld d, b
	ld e, d
	nop
	ld e, d
	ld d, b
	nop
	ld e, d
	ld e, a
	ld h, h
	ld h, h
	nop
	scf
	ld d, l
	nop
	ld c, e
	jr z, .asm_417e
.asm_417e
	nop
	nop
	nop
	scf
	nop
	nop
	nop
	ld h, h
	ld h, h
.asm_4187
	ld de, $4214
	ld a, [wd988]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $01
	jr z, .asm_41a1
	cp $02
	jr z, .asm_41bd
	cp $03
	jr z, .asm_41da
	ret
.asm_41a1
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	jr .asm_420f
.asm_41bd
	ld a, $01
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	jr .asm_420f
.asm_41da
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $01
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
.asm_420f
	xor a
	ret
.asm_4211
	ld a, $01
	ret
	nop
	nop
	ld bc, $0100
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld bc, $0300
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld bc, $0000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld bc, $0000
	ld bc, $0000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld bc, $0200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld bc, $0000
	nop
	nop
	ld [bc], a
	nop
	nop
	nop
	nop
	nop
	nop
	ld bc, $0000
	ld bc, $0000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld bc, $0001
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

Func_030_42ab:
	ld a, $01
	ld [wd9b2], a
	xor a
	ld [wd9af], a
	call Func_125b
	ld d, a
	ld hl, $4284
	ld b, $1e
	rst $30
	ld de, unk_030_42db
	ld a, [wd8ff]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wFacingTileX]
	and $0f
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [wd9c7], a
	ret

unk_030_42db:
	dr $c02db, $c0335

unk_030_4335:
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_542e
	dw Func_030_541a
	dw Func_030_5141
	dw Func_030_4fd4
	dw Func_030_4fef
	dw Func_030_51c2
	dw Func_030_505d
	dw Func_030_442a
	dw Func_030_5448
	dw Func_030_4bcb
	dw Func_030_4442
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385

Func_030_4385:
	ld a, [wd993]
	and a
	jr nz, .asm_4395

	ld a, $52
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret

.asm_4395:
	ld a, [wd984]
	ld e, a
	ld a, [wd984 + 1]
	ld d, a
	call SetCaughtMon
	ld a, $ff
	ld [wd9ea], a
	ld bc, wPartyMons
.room_in_party
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .next_slot

; Copy wild mon data into empty slot
	ld a, [wd984]
	ld e, a
	ld a, [wd984 + 1]
	ld d, a
	ld b, PARTYMON_STRUCT_LENGTH
.copy
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .copy

	ld a, $01
	ld [wd9b5], a
	ld a, $51
	ld [wd3ff], a
	ld a, $05
	ld [wd98b], a
	ret

.next_slot
	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp LOW($d280)
	jr c, .room_in_party

; No free slot
	ld a, $01
	ld [wd9b5], a
	ld a, $53
	ld [wd3ff], a
	ld a, $05
	ld [wd98b], a
	call Func_030_43ee
	ret

Func_030_43ee:
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, wdb20
	ld a, [$dc9c]
	ld de, $0013
	and a
	jr z, .asm_4406
.asm_4402
	add hl, de
	dec a
	jr nz, .asm_4402
.asm_4406
	ld e, $13
.asm_4408
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .asm_4408
	ld a, [$dc9c]
	inc a
	ld [$dc9c], a
	ret

SetCaughtMon:
	push de
	push hl
	ld hl, wd7cb
; check if species is valid
	ld a, [de]
	cp NUM_MONS
	jr nc, .exit

; @bug: $00 is considered valid, however 'dec a' causes this to become $ff
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], $02
.exit
	pop de
	pop hl
	ret

Func_030_442a:
	ld a, $01
	ld [wd9b2], a
	ld [wd9b5], a
	ld a, $03
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $54
	ld [wd3ff], a
	ret

Func_030_4442:
	ld a, $06
	ld [wd98b], a
	ret
	ld a, $06
	ld [wd98b], a
	ret
	xor a
	ld [wd9b5], a
	ld a, $40
	ld [wd3ff], a
	ld a, $04
	ld [wd98b], a
	ld a, [wd986]
	and a
	jr nz, .asm_4467
	call Func_12bd
	jr .asm_446a
.asm_4467
	call Func_128e
.asm_446a
	ld a, [wd99b]
	ldh [$ffcc], a
	ld a, [wd99a]
	ldh [$ffcb], a
	xor a
	ldh [$ffcd], a
	call Func_123a
	ld a, $05
	ldh [$ffc7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	call Func_123a
	ldh a, [$ffcb]
	ld [wd9b0], a
	ldh a, [$ffcc]
	ld [wd9b1], a
	ret
	ld a, $01
	ld [wd9b5], a
	ld a, $34
	ld [wd3ff], a
	ld a, $03
	ld [wd98b], a
	ld a, $1e
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ret

MoveEffectPointers:
	dw Func_030_55a5 ; $00
	dw Func_030_555c ; $01
	dw Func_030_5603 ; $02
	dw Func_030_564a ; $03
	dw Func_030_54de ; $04
	dw Func_030_5486 ; $05
	dw Func_030_5465 ; $06
	dw Func_030_55a5 ; $07
	dw Func_030_5441 ; $08
	dw Func_030_564a ; $09
	dw Func_030_564a ; $0a
	dw Func_030_542e ; $0b
	dw Func_030_541a ; $0c
	dw Func_030_53ba ; $0d
	dw Func_030_52c3 ; $0e
	dw Func_030_564a ; $0f
	dw Func_030_5249 ; $10
	dw Func_030_5231 ; $11
	dw Func_030_51da ; $12
	dw Func_030_51bb ; $13
	dw Func_030_5190 ; $14
	dw Func_030_5249 ; $15
	dw Func_030_5155 ; $16
	dw Func_030_5441 ; $17
	dw Func_030_542e ; $18
	dw Func_030_564a ; $19
	dw Func_030_564a ; $1a
	dw Func_030_513a ; $1b
	dw Func_030_564a ; $1c
	dw Func_030_50f8 ; $1d
	dw Func_030_564a ; $1e
	dw Func_030_564a ; $1f
	dw Func_030_564a ; $20
	dw Func_030_564a ; $21
	dw Func_030_50cc ; $22
	dw Func_030_50a4 ; $23
	dw Func_030_5074 ; $24
	dw Func_030_5056 ; $25
	dw Func_030_5003 ; $26
	dw Func_030_4fe8 ; $27
	dw Func_030_541a ; $28
	dw Func_030_4fd4 ; $29
	dw Func_030_564a ; $2a
	dw Func_030_564a ; $2b
	dw Func_030_564a ; $2c
	dw Func_030_564a ; $2d
	dw Func_030_564a ; $2e
	dw Func_030_4f9f ; $2f
	dw Func_030_541a ; $30
	dw Func_030_5155 ; $31
	dw Func_030_564a ; $32
	dw Func_030_564a ; $33
	dw Func_030_4f5f ; $34
	dw Func_030_564a ; $35
	dw Func_030_4f10 ; $36
	dw Func_030_564a ; $37
	dw Func_030_564a ; $38
	dw Func_030_4eca ; $39
	dw Func_030_4eca ; $3a
	dw Func_030_4e79 ; $3b
	dw Func_030_4e28 ; $3c
	dw Func_030_4e0b ; $3d
	dw Func_030_4d64 ; $3e
	dw Func_030_564a ; $3f
	dw Func_030_4d13 ; $40
	dw Func_030_564a ; $41
	dw Func_030_4d13 ; $42
	dw Func_030_564a ; $43
	dw Func_030_564a ; $44
	dw Func_030_5190 ; $45
	dw Func_030_4cca ; $46
	dw Func_030_4c50 ; $47
	dw Func_030_564a ; $48
	dw Func_030_564a ; $49
	dw Func_030_4c12 ; $4a
	dw Func_030_564a ; $4b
	dw Func_030_564a ; $4c
	dw Func_030_4be3 ; $4d
	dw Func_030_4bb1 ; $4e
	dw Func_030_4b94 ; $4f
	dw Func_030_564a ; $50
	dw Func_030_564a ; $51
	dw Func_030_564a ; $52
	dw Func_030_4b4d ; $53
	dw Func_030_564a ; $54
	dw Func_030_564a ; $55
	dw Func_030_50cc ; $56
	dw Func_030_4e79 ; $57
	dw Func_030_564a ; $58
	dw Func_030_4b30 ; $59
	dw Func_030_4e79 ; $5a
	dw Func_030_4b30 ; $5b
	dw Func_030_4e93 ; $5c
	dw Func_030_4b1b ; $5d
	dw Func_030_564a ; $5e
	dw Func_030_4aec ; $5f
	dw Func_030_564a ; $60
	dw Func_030_4aa5 ; $61
	dw Func_030_564a ; $62
	dw Func_030_4a89 ; $63
	dw Func_030_55a5 ; $64
	dw Func_030_4b2d ; $65
	dw Func_030_4a3d ; $66
	dw Func_030_4b30 ; $67
	dw Func_030_4a20 ; $68
	dw Func_030_4a20 ; $69
	dw Func_030_4a03 ; $6a
	dw Func_030_49d2 ; $6b
	dw Func_030_564a ; $6c
	dw Func_030_55a5 ; $6d
	dw Func_030_50f8 ; $6e
	dw Func_030_5441 ; $6f
	dw Func_030_498e ; $70
	dw Func_030_53ba ; $71
	dw Func_030_4aec ; $72
	dw Func_030_4aec ; $73
	dw Func_030_4aec ; $74
	dw Func_030_564a ; $75
	dw Func_030_564a ; $76
	dw Func_030_4973 ; $77
	dw Func_030_4950 ; $78
	dw Func_030_4950 ; $79
	dw Func_030_4919 ; $7a
	dw Func_030_48c5 ; $7b
	dw Func_030_48bb ; $7c
	dw Func_030_4873 ; $7d
	dw Func_030_485d ; $7e
	dw Func_030_480b ; $7f
	dw Func_030_4a3d ; $80
	dw Func_030_47ee ; $81
	dw Func_030_51da ; $82
	dw Func_030_564a ; $83
	dw Func_030_4793 ; $84
	dw Func_030_470d ; $85
	dw Func_030_46ed ; $86
	dw Func_030_46ce ; $87
	dw Func_030_4689 ; $88
	dw Func_030_4641 ; $89
	dw Func_030_462d ; $8a
	dw Func_030_4619 ; $8b
	dw Func_030_4605 ; $8c
	dw Func_030_45fb ; $8d
	dw Func_030_564a ; $8e

Func_030_45c9:
	ld de, unk_030_565c
	ld a, [wd98f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; size
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $8000
	call CopyBytesVRAM
	ret

Func_030_45e2:
	ld de, unk_030_58f8
	ld a, [wd98f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; size
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $8000
	call CopyBytesVRAM
	ret

Func_030_45fb:
	ld a, $02
	ld [wd98b], a
	xor a
	ld [wd9b5], a
	ret

Func_030_4605:
	xor a
	ld [wd9b2], a
	ld a, $04
	ld [wd9af], a
	ld a, $8c
	call SetStatTile
	ld a, $34
	ld [wd3ff], a
	ret

Func_030_4619:
	xor a
	ld [wd9b2], a
	ld a, $04
	ld [wd9af], a
	ld a, $8b
	call SetStatTile
	ld a, $34
	ld [wd3ff], a
	ret

Func_030_462d:
	xor a
	ld [wd9b2], a
	ld a, $04
	ld [wd9af], a
	ld a, $8a
	call SetStatTile
	ld a, $34
	ld [wd3ff], a
	ret

Func_030_4641:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [wd986]
	and a
	jr nz, .asm_4658
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4660
.asm_4658
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4660
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	jp z, Func_030_55ab
	ld a, [hli]
	cp $11
	jp z, Func_030_55ab
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 1, a
	set 2, a
	set 3, a
	set 5, a
	ld [hl], a
	ld a, $4e
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4689:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	xor a
	ld [wd9b2], a
	ld [wd98b], a
	ld a, $5c
	ld [wd3ff], a
	ld a, $04
	ld [wd9af], a
	ld a, $88
	call SetStatTile
	ld a, $05
	ld [wd9af], a
	ld a, $02
	call SetStatTile
.asm_46b0
	call AdvanceRNG
	ld a, [wd991]
	cp $82
	jr nc, .asm_46b0
	ld a, [wd986]
	and a
	jr nz, .asm_46c7
	ld a, [wd991]
	ld [wd9e2], a
	ret
.asm_46c7
	ld a, [wd991]
	ld [wd9e3], a
	ret

Func_030_46ce:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	xor a
	ld [wd9b2], a
	ld a, $04
	ld [wd9af], a
	ld a, $87
	call SetStatTile
	ld a, $34
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret

Func_030_46ed:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [hFFD6]
	and a
	jp nz, Func_030_55ab
	ld de, wd9f5
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, de
	ld [hl], $02
	ld a, $06
	ld [wd98b], a
	ret

Func_030_470d:
	ld a, [wd986]
	and a
	jr nz, .asm_474d
	ld a, $01
	ld [wd9b5], a
	ld a, $59
	ld [wd3ff], a
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	ld de, $dcbc
	ld b, $0c
.asm_472f
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_472f
	ld a, [wActiveMonPtr]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	pop de
	pop hl
	ld b, $0c
.asm_4746
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_4746
	ret
.asm_474d
	ld a, [wdb1c]
	and a
	jp nz, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $59
	ld [wd3ff], a
	ld a, [wActiveMonPtr]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	ld de, $dcbc
	ld b, $0c
.asm_4770
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_4770
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	pop de
	pop hl
	ld b, $0c
.asm_4787
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_4787
	ld a, $01
	ld [wdb1c], a
	ret

Func_030_4793:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $58
	ld [wd3ff], a
	ld a, [wd986]
	and a
	jr nz, .asm_47d3
	ld a, $01
	ld [wd9f7], a
	ld hl, $d0d9
	ld a, [hld]
	ldh [$ffcb], a
	ld a, [hld]
	ldh [$ffcc], a
	ld a, [hld]
	ldh [$ffcd], a
	call Func_123a
	ld a, $02
	ldh [$ffc7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	call Func_123a
	ld hl, $d0d9
	ldh a, [$ffcb]
	ld [hld], a
	ldh a, [$ffcc]
	ld [hld], a
	ldh a, [$ffcd]
	ld [hld], a
	ret
.asm_47d3
	ld de, $db00
	ld a, [wd987]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	inc hl
	inc hl
	push hl
	pop de
	ld hl, $d0d9
	ld a, [de]
	add [hl]
	ld [hld], a
	inc de
	ld a, [de]
	adc a, [hl]
	ld [hld], a
	ret

Func_030_47ee:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [wd986]
	and a
	jr nz, .asm_4803
	ld a, $01
	ld [wd9bb], a
	jp $4a44
.asm_4803
	ld a, $01
	ld [wd9ba], a
	jp $4a44

Func_030_480b:
	ld a, $4d
	ld [wd3ff], a
	xor a
	ld [wd9b2], a
	call .asm_481c
	ld a, $01
	ld [wd9b2], a
.asm_481c
	xor a
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $01
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $02
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $03
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $08
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $09
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $4d
	ld [wd3ff], a
	ret

Func_030_485d:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	xor a
	ld [wd9b5], a
	ld a, $04
	ld [wd98b], a
	ld a, $40
	ld [wd3ff], a
	ret

Func_030_4873:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $4c
	ld [wd3ff], a
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_48a7
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	ld a, $02
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	ld a, $7d
	call SetStatTile
	ret
.asm_48a7
	ld a, [wd986]
	and a
	jr nz, .asm_48b4
	ld a, [wd9e3]
	ld [wd9e2], a
	ret
.asm_48b4
	ld a, [wd9e2]
	ld [wd9e3], a
	ret

Func_030_48bb:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	jp Func_030_4bcb

Func_030_48c5:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd986]
	and a
	jr nz, .asm_4901
	xor a
	ld [wd9b9], a
	ld a, [wd9c8]
	ld [wEnemyMonSpecies], a
	call LoadEnemyMonPic
	ld hl, $4d47
	ld b, $26
	rst $30
	xor a
	ld [wd9c8], a
	ret
.asm_4901
	xor a
	ld [wd9b8], a
	ld a, [wd9c9]
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	ld hl, $4d1b
	ld b, $26
	rst $30
	xor a
	ld [wd9c9], a
	ret

Func_030_4919:
	ld a, $4b
	ld [wd3ff], a
	call AdvanceRNG
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	ld a, [wd991]
	and $03
	add $02
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	ld a, $7a
	call SetStatTile
	ld a, [wd986]
	and a
	jr nz, .asm_494a
	ld a, $01
	ld [wd9b9], a
	ret
.asm_494a
	ld a, $01
	ld [wd9b8], a
	ret

Func_030_4950:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	ld a, [wd986]
	and a
	jr nz, .asm_496d
	ld a, $01
	ld [$d9b7], a
	ret
.asm_496d
	ld a, $01
	ld [wd9b6], a
	ret

Func_030_4973:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $4a
	ld [wd3ff], a
	xor a
	ld [wd9b2], a
	ld a, $04
	ld [wd9af], a
	ld a, $77
	call SetStatTile
	ret

Func_030_498e:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	call AdvanceRNG
	ld a, $01
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	ld a, [wd991]
	and $03
	add $02
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	ld a, $70
	call SetStatTile
	ld a, $49
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ld a, [wd986]
	and a
	jr nz, .asm_49cc
	ld a, $8e
	ld [wd9e3], a
	ret
.asm_49cc
	ld a, $8e
	ld [wd9e2], a
	ret

Func_030_49d2:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	ld a, $01
	call SetStatTile
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	ld a, [wd986]
	and a
	jr z, .asm_49fd
	ld a, $01
	ld [wd9b3], a
	ret
.asm_49fd
	ld a, $01
	ld [wd9b4], a
	ret

Func_030_4a03:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	jp Func_030_505d

Func_030_4a20:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc
	jp $5103

Func_030_4a3d:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [wd986]
	and a
	jr nz, .asm_4a54
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4a5c
.asm_4a54
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4a5c
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	jp z, Func_030_55ab
	cp $15
	jp z, Func_030_55ab
	ld a, [hli]
	cp $11
	jp z, Func_030_55ab
	cp $15
	jp z, Func_030_55ab
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 0, a
	ld [hl], a
	ld a, $1a
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4a89:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $48
	ld [wd3ff], a
	ld a, $04
	ld [wd9af], a
	ld a, $63
	call SetStatTile
	ret

Func_030_4aa5:
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4aca
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $02
	call SetStatTile
	ld a, $46
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret
.asm_4aca
	xor a
	call SetStatTile
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $57e1
	ld hl, Func_030_4000
	ld b, $2e
	rst $30
	call DelayFrame
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4aec:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $32
	ret nc
	ld a, $01
	ld [wd9b2], a
	ld a, $01
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $1f
	ld [wd3ff], a
	ret

Func_030_4b1b:
	call $537B
	ld a, $40
	ld [wd3ff], a
	ld a, $04
	ld [wd98b], a
	xor a
	ld [wd9b5], a
	ret

Func_030_4b2d:
	jp Func_030_4e93

Func_030_4b30:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	jp Func_030_4e93

Func_030_4b4d:
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4b72
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $02
	call SetStatTile
	ld a, $47
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret
.asm_4b72
	xor a
	call SetStatTile
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $57f4
	ld hl, Func_030_4000
	ld b, $2e
	rst $30
	call DelayFrame
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4b94:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	jp $4e42

Func_030_4bb1:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $32
	ret nc

Func_030_4bcb:
	ld a, $01
	ld [wd9b2], a
	ld [wd9b5], a
	ld a, $08
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $21
	ld [wd3ff], a
	ret

Func_030_4be3:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	ld a, $01
	ld [wd9b2], a
	ld a, $01
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $1f
	ld [wd3ff], a
	ret

Func_030_4c12:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $34
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ld a, [wd986]
	and a
	jr nz, .asm_4c2e
	ld a, [wd9e5]
	ld d, a
	jr .asm_4c32
.asm_4c2e
	ld a, [wEnemyMonSpecies]
	ld d, a
.asm_4c32
	ld hl, $4284
	ld b, $1e
	rst $30
	ld a, [wFacingTileX]
	cp $07
	ret nz
	call $4c8f
	ld a, $40
	ld [wd3ff], a
	ld a, $04
	ld [wd98b], a
	xor a
	ld [wd9b5], a
	ret

Func_030_4c50:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [wd986]
	and a
	jr nz, .asm_4c63
	ld a, [wd9e5]
	ld d, a
	jr .asm_4c67
.asm_4c63
	ld a, [wEnemyMonSpecies]
	ld d, a
.asm_4c67
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	ld a, $01
	ld [wd9b2], a
	ld a, $08
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $21
	ld [wd3ff], a
	ret
	ld a, [wd9b1]
	and a
	jr nz, .asm_4c9f
	ld a, [wd9b0]
	ldh [$ffcb], a
	xor a
	ldh [$ffcc], a
	jr .asm_4ca6
.asm_4c9f
	ldh [$ffcb], a
	ld a, [wd9b0]
	ldh [$ffcc], a
.asm_4ca6
	xor a
	ldh [$ffcd], a
	ld a, $02
	ldh [$ffc7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	ldh a, [$ffcc]
	and a
	jr nz, .asm_4cc1
	ld [wd9b1], a
	ldh a, [$ffcb]
	ld [wd9b0], a
	ret
.asm_4cc1
	ld [wd9b0], a
	ldh a, [$ffcb]
	ld [wd9b1], a
	ret

Func_030_4cca:
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4cef
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $02
	call SetStatTile
	ld a, $46
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret
.asm_4cef
	xor a
	call SetStatTile
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $57d1
	ld hl, Func_030_4000
	ld b, $2e
	rst $30
	call DelayFrame
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	jp $4d24

Func_030_4d13:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	ld a, [wd986]
	and a
	jr nz, .asm_4d3d
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4d45
.asm_4d3d
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4d45
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 2, a
	ld [hl], a
	ld a, $19
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4d64:
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4d8c
	ld a, $01
	call SetStatTile
	ld a, $36
	ld [wd3ff], a
	xor a
	ld [wd9b2], a
	ld a, $04
	ld [wd9af], a
	ld a, $3e
	call SetStatTile
	ret
.asm_4d8c
	dec a
	jr z, .asm_4da4
	call SetStatTile
	ld a, $36
	ld [wd3ff], a
	ld a, $03
	ld [wd98b], a
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ret
.asm_4da4
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	call SetStatTile
	xor a
	ld [wd9b5], a
	ld a, $37
	ld [wd3ff], a
	ld hl, Func_030_4000
	ld b, $2d
	rst $30
	call $5372
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $580f
	ld hl, Func_030_4000
	ld b, $2e
	rst $30
	call DelayFrame
	ld a, $03
	ld [wd98b], a
	xor a
	ld [wd9b2], a
	ld a, $06
	ld [wd9af], a
	call GetStatTile
	ld [wd9b0], a
	ld a, $07
	ld [wd9af], a
	call GetStatTile
	call $537b
	ld a, $06
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $07
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4e0b:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc
	jp $4d2d

Func_030_4e28:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc
	ld a, [wd986]
	and a
	jr nz, .asm_4e52
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4e5a
.asm_4e52
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4e5a
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 3, a
	ld [hl], a
	ld a, $18
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4e79:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc

Func_030_4e93:
	ld a, [wd986]
	and a
	jr nz, .asm_4ea3
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4eab
.asm_4ea3
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4eab
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 1, a
	ld [hl], a
	ld a, $1e
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4eca:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [wd9b1]
	and a
	jr nz, .asm_4ee1
	xor a
	ldh [$ffcc], a
	ld a, [wd9b0]
	ldh [$ffcb], a
	jr .asm_4eeb
.asm_4ee1
	ld a, [wd9b1]
	ldh [$ffcb], a
	ld a, [wd9b0]
	ldh [$ffcc], a
.asm_4eeb
	xor a
	ldh [$ffcd], a
	ld a, $04
	ldh [$ffc7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	ldh a, [$ffcb]
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	xor a
	ld [wd9b5], a
	ld a, $03
	ld [wd98b], a
	ld a, $34
	ld [wd3ff], a
	ret

Func_030_4f10:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [wd986]
	and a
	jr z, .asm_4f27
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4f2f
.asm_4f27
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4f2f
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	ldh [$ffcb], a
	xor a
	ldh [$ffcc], a
	ldh [$ffcd], a
	ld a, $02
	ld [hFFC7], a
	ld hl, $414a
	ld b, $25
	rst $30
	ldh a, [$ffcb]
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ld a, $34
	ld [wd3ff], a
	ld a, $03
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4f5f:
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4f7d
	ld a, $02
	call SetStatTile
	ld a, $46
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret
.asm_4f7d
	xor a
	call SetStatTile
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $580f
	ld hl, Func_030_4000
	ld b, $2e
	rst $30
	call DelayFrame
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_4f9f:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, [wd986]
	and a
	jr z, .asm_4fb6
	call Func_12bd
	jr .asm_4fb9
.asm_4fb6
	call Func_128e
.asm_4fb9
	ld a, [wd998]
	sub $05
	ld [wd9b0], a
	ld a, [wd999]
	sbc a, $00
	ld [wd9b1], a
	ld a, $03
	ld [wd98b], a
	ld a, $14
	ld [wd3ff], a
	ret

Func_030_4fd4:
	xor a
	ld [wd9b2], a
	ld a, $02
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $3c
	ld [wd3ff], a
	ret

Func_030_4fe8:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab

Func_030_4fef:
	xor a
	ld [wd9b2], a
	ld a, $08
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $3a
	ld [wd3ff], a
	ret

Func_030_5003:
	ld a, $1c
	ld [wd3ff], a
	ld a, $04
	ld [wd98b], a
	xor a
	ld [wd9b5], a
	ld a, [wd986]
	and a
	jr nz, .asm_501c
	call Func_12bd
	jr .asm_501f
.asm_501c
	call Func_128e
.asm_501f
	ld a, [wd998]
	ld c, a
	ld a, [wd999]
	ld b, a
	ld a, [wd99a]
	sub c
	ld [wd9b0], a
	ld a, [wd99b]
	sbc a, b
	ld [wd9b1], a
	ld a, [wd986]
	and a
	jr z, .asm_5045
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_504d
.asm_5045
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_504d
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 4, a
	ld [hl], a
	ret

Func_030_5056:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab

Func_030_505d:
	ld a, $01
	ld [wd9b2], a
	ld [wd9b5], a
	xor a
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $44
	ld [wd3ff], a
	ret

Func_030_5074:
	ld a, $43
	ld [wd3ff], a
	xor a
	ld [wd9b2], a
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $01
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $02
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $03
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ret

Func_030_50a4:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [hFFD6]
	and a
	jp nz, Func_030_55ab
	ld hl, wd9f5
	ld a, [wd986]
	and a
	jr z, .asm_50be
	ld hl, wd9f6
.asm_50be
	ld a, $02
	ld [hl], a
	ld a, $42
	ld [wd3ff], a
	ld a, $06
	ld [wd98b], a
	ret

Func_030_50cc:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, [wd986]
	and a
	jr z, .asm_50e3
	call Func_12bd
	jr .asm_50e6
.asm_50e3
	call Func_128e
.asm_50e6
	ld a, [wd998]
	ld [wd9b0], a
	ld a, [wd999]
	ld [wd9b1], a
	ld a, $03
	ld [wd98b], a
	ret

Func_030_50f8:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	xor a
	ld [wd98b], a
	ld a, $1b
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ld a, [wd986]
	and a
	jr nz, .asm_511d
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_5125
.asm_511d
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_5125
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 5, a
	ld [hl], a
	ret

Func_030_513a:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab

Func_030_5141:
	xor a
	ld [wd9b2], a
	ld a, $03
	ld [wd9af], a
	ld a, $03
	call AddStatTile
	ld a, $41
	ld [wd3ff], a
	ret

Func_030_5155:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	ld a, [wd986]
	and a
	jr nz, .asm_517f
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_5187
.asm_517f
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_5187
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 7, a
	ld [hl], a
	ret

Func_030_5190:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	xor a
	ld [wd9b5], a
	ld a, [wd986]
	and a
	jr nz, .asm_51a6
	call Func_12bd
	jr .asm_51a9
.asm_51a6
	call Func_128e
.asm_51a9
	ld a, [wd998]
	ld [wd9b0], a
	ld a, [wd999]
	ld [wd9b1], a
	ld a, $03
	ld [wd98b], a
	ret

Func_030_51bb:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab

Func_030_51c2:
	ld a, $01
	ld [wd9b2], a
	ld [wd9b5], a
	ld a, $01
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $1f
	ld [wd3ff], a
	ret

Func_030_51da:
	xor a
	ld [wd9b5], a
	ld a, $40
	ld [wd3ff], a
	ld a, $04
	ld [wd98b], a
	ld a, [wd986]
	and a
	jr nz, .asm_51f3
	call Func_12bd
	jr .asm_51f6
.asm_51f3
	call Func_128e
.asm_51f6
	ld a, [wd99b]
	and a
	jr nz, .asm_5206
	ld a, [wd99a]
	ldh [$ffcb], a
	xor a
	ldh [$ffcc], a
	jr .asm_520d
.asm_5206
	ldh [$ffcb], a
	ld a, [wd99a]
	ldh [$ffcc], a
.asm_520d
	xor a
	ldh [$ffcd], a
	ld a, $02
	ldh [$ffc7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	ldh a, [$ffcc]
	and a
	jr nz, .asm_5228
	ld [wd9b1], a
	ldh a, [$ffcb]
	ld [wd9b0], a
	ret
.asm_5228
	ld [wd9b0], a
	ldh a, [$ffcb]
	ld [wd9b1], a
	ret

Func_030_5231:
	xor a
	ld [wd9b2], a
	ld a, $09
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $45
	ld [wd3ff], a
	xor a
	ld [wd9b5], a
	ret

Func_030_5249:
	ld a, $01
	ld [wd9b5], a
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_527d
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $02
	push af
	call SetStatTile
	ld a, $01
	ld [wd9b2], a
	pop af
	call SetStatTile
	ld a, $02
	ld [wd98b], a
	call .asm_52b1
	ret
.asm_527d
	dec a
	and a
	jr z, .asm_5292
	call SetStatTile
	ld a, $34
	ld [wd3ff], a
	ld a, $02
	ld [wd98b], a
	call .asm_52b1
	ret
.asm_5292
	call SetStatTile
	ld a, $01
	ld [wd9b2], a
	xor a
	call SetStatTile
	ld a, $01
	ld [wd9b5], a
	ld a, $34
	ld [wd3ff], a
	ld a, $02
	ld [wd98b], a
	call .asm_52b1
	ret
.asm_52b1
	ld a, [wd986]
	and a
	jr nz, .asm_52bd
	ld a, $01
	ld [wd9b3], a
	ret
.asm_52bd
	ld a, $01
	ld [wd9b4], a
	ret

Func_030_52c3:
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_52f3
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $02
	call SetStatTile
	ld a, $36
	ld [wd3ff], a
	xor a
	ld [wd9b2], a
	ld a, $04
	ld [wd9af], a
	ld a, $0e
	call SetStatTile
	ret
.asm_52f3
	dec a
	jr z, .asm_530b
	call SetStatTile
	ld a, $36
	ld [wd3ff], a
	ld a, $03
	ld [wd98b], a
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ret
.asm_530b
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	call SetStatTile
	xor a
	ld [wd9b5], a
	ld a, $37
	ld [wd3ff], a
	ld hl, Func_030_4000
	ld b, $2d
	rst $30
	call .asm_5372
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $580f
	ld hl, Func_030_4000
	ld b, $2e
	rst $30
	call DelayFrame
	ld a, $03
	ld [wd98b], a
	xor a
	ld [wd9b2], a
	ld a, $06
	ld [wd9af], a
	call GetStatTile
	ld [wd9b0], a
	ld a, $07
	ld [wd9af], a
	call GetStatTile
	call .asm_537b
	ld a, $06
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $07
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $01
	ld [wd9b5], a
	ret
.asm_5372
	ld c, $20
.asm_5374
	call DelayFrame
	dec c
	jr nz, .asm_5374
	ret
.asm_537b
	ld [wd9b1], a
	and a
	jr nz, .asm_538b
	ld a, [wd9b0]
	ldh [$ffcb], a
	xor a
	ldh [$ffcc], a
	jr .asm_5393
.asm_538b
	xor a
	ldh [$ffcc], a
	ld a, [wd9b0]
	ldh [$ffcb], a
.asm_5393
	xor a
	ldh [$ffcd], a
	ld a, $02
	ldh [$ffc7], a
	ld hl, $414a
	ld b, $25
	rst $30
	ldh a, [$ffcc]
	and a
	jr z, .asm_53b0
	ldh a, [$ffcc]
	ld [wd9b0], a
	ldh a, [$ffcb]
	ld [wd9b1], a
	ret
.asm_53b0
	ldh a, [$ffcb]
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ret

Func_030_53ba:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab

.asm_53c1
	ld a, $01
	ld [wd9b5], a
	ld a, $3e
	ld [wd3ff], a
	call AdvanceRNG
	call Func_030_53ee
	and a
	jr z, .asm_53c1

	ld a, [wd986]
	and a
	jr z, .asm_53df
	ld de, wd97c
	jr .asm_53e2

.asm_53df
	ld de, wd978
.asm_53e2
	ld a, [wd991]
	and $03
	ld l, a
	ld h, 0
	add hl, de
	ld [hl], $01
	ret

Func_030_53ee:
	ld a, [wd986]
	and a
	jr z, .asm_53fe

	ld a, [wd984]
	ld l, a
	ld a, [wd984 + 1]
	ld h, a
	jr .asm_5406

.asm_53fe
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a

.asm_5406
	ld bc, 7
	add hl, bc
	ld a, [wd991]
	and $03
	jr z, .asm_5418

.asm_5411
	ld bc, 3
	add hl, bc
	dec a
	jr nz, .asm_5411

.asm_5418
	ld a, [hl]
	ret

Func_030_541a:
	xor a
	ld [wd9b2], a
	ld a, $01
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $38
	ld [wd3ff], a
	ret

Func_030_542e:
	xor a
	ld [wd9b2], a
	xor a
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $3b
	ld [wd3ff], a
	ret

Func_030_5441:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab

Func_030_5448:
	ld a, $01
	ld [wd9b2], a
	ld [wd9b5], a
	ld a, $02
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $01
	ld [wd9b5], a
	ld a, $20
	ld [wd3ff], a
	ret

Func_030_5465:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b2], a
	ld a, $01
	ld [wd9af], a
	ld a, $fe
	call AddStatTile
	ld a, $1f
	ld [wd3ff], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_5486:
	ld a, $01
	ld [wd9b5], a
	ld a, $34
	ld [wd3ff], a
	ld a, $03
	ld [wd98b], a
	ld a, [wd986]
	and a
	jr z, .asm_54a0
	call Func_12bd
	jr .asm_54a3
.asm_54a0
	call Func_128e
.asm_54a3
	ld a, [wd999]
	and a
	jr nz, .asm_54b3
	ld a, [wd998]
	ldh [$ffcb], a
	xor a
	ldh [$ffcc], a
	jr .asm_54ba
.asm_54b3
	ldh [$ffcb], a
	ld a, [wd998]
	ldh [$ffcc], a
.asm_54ba
	xor a
	ldh [$ffcd], a
	ld a, $02
	ldh [$ffc7], a
	ld hl, $41b8
	ld b, $25
	rst $30
	ldh a, [$ffcc]
	and a
	jr nz, .asm_54d5
	ld [wd9b1], a
	ldh a, [$ffcb]
	ld [wd9b0], a
	ret
.asm_54d5
	ld [wd9b0], a
	ldh a, [$ffcb]
	ld [wd9b1], a
	ret

Func_030_54de:
	ld a, [wd9c7]
	and a
	jp z, Func_030_55ab
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_551e
	ld a, $04
	ld [wd9af], a
	ld a, $04
	call AddStatTile
	xor a
	ld [wd9af], a
	ld a, $05
	call AddStatTile
	ld a, $01
	ld [wd9af], a
	ld a, $fb
	call AddStatTile
	ld a, $05
	ld [wd9af], a
	ld a, $02
	push af
	call SetStatTile
	jr .asm_5524
.asm_551e
	add $02
	push af
	call SetStatTile
.asm_5524
	ld hl, $5651
	ld b, $2b
	rst $30
	ld a, [wd9b0]
	ldh [$ffcb], a
	ld a, [wd9b1]
	ldh [$ffcc], a
	xor a
	ldh [$ffcd], a
	call Func_123a
	pop af
	dec a
	ldh [$ffc7], a
	ld hl, $414a
	ld b, $25
	rst $30
	call Func_123a
	ldh a, [$ffcb]
	ld [wd9b0], a
	ldh a, [$ffcc]
	ld [wd9b1], a
	ld a, $03
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret

Func_030_555c:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, [$d98d]
	and a
	jr nz, .asm_5573
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_557b
.asm_5573
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_557b
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 4, a
	ld [hl], a
	ld a, $01
	ld [wd9b5], a
	ld a, $1c
	ld [wd3ff], a
	ld a, $02
	ld [wd98b], a
	ret

Func_030_55a5:
	ld a, [wd993]
	and a
	jr nz, $55c2

Func_030_55ab:
	call AdvanceRNG
	ld a, [wd991]
	and $03
	add $0f
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret
	ld a, [$d98d]
	and a
	jr nz, .asm_55d2
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_55da
.asm_55d2
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_55da
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 4, a
	ld [hl], a
	ld a, $01
	ld [wd9b5], a
	ld a, $1c
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret

Func_030_5603:
	xor a
	ld [wd9b2], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_562a
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $02
	call SetStatTile
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret
.asm_562a
	dec a
	and a
	jr z, .asm_563c
	call SetStatTile
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret
.asm_563c
	call SetStatTile
	ld a, $34
	ld [wd3ff], a
	ld a, $01
	ld [wd98b], a
	ret

Func_030_564a:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	ret

unk_030_565c:
	dw .image_566a
	dw .image_572c
	dw .image_57ae
	dw .image_57f0
	dw .image_5832
	dw .image_5874
	dw .image_58b6

.image_566a
	dw $00c0
	INCBIN "gfx/battle/image_30_566c.interleave.w16.2bpp"

.image_572c
	dw $0080
	INCBIN "gfx/battle/image_30_572e.interleave.w16.2bpp"

.image_57ae
	dw $0040
	dr $c17b0, $c17f0

.image_57f0
	dw $0040
	dr $c17f2, $c1832

.image_5832
	dw $0040
	dr $c1834, $c1874

.image_5874
	dw $0040
	dr $c1876, $c18b6

.image_58b6
	dw $0040
	dr $c18b8, $c18f8

unk_030_58f8:
	dr $c18f8, $c39a0


