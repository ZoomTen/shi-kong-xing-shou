Func_030_4000::
	ld a, [wd986]
	and a
	jr z, .asm_4018
	ld a, [wd9ea]
	and a
	jr z, .asm_4018

	xor a
	ld [wd9ea], a
	ld de, Jumptable_030_4335
	ld a, [wd9f3]
	jr .asm_401e

.asm_4018
	ld de, MoveEffectPointers
	ld a, [wBattleAnimID]

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
	call Func_030_4187
	and a
	jp nz, .asm_40ed
	call Func_030_42ab
	ld a, [wd9c7]
	and a
	jp z, .asm_40ed
	call AdvanceRNG
	ld de, BattleAnimMoveParam_030_40f8
	ld a, [wBattleAnimID]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	jp z, .asm_40f2
	ld [hMathOperand], a
	ld a, [wd98d]
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
	ld [hMathValue], a
	xor a
	ld [hMathValue + 1], a
	ld [hMathValue + 2], a
	farcall Multiply32By8
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
	ld [hMathValue], a
	xor a
	ld [hMathValue + 1], a
	ld [hMathValue + 2], a
	farcall Multiply32By8
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
	ld [hMathOperand], a
	farcall Divide32By16_4Digit
	ld a, [hMathValue]
	ld [wd993], a
	ld a, [wd991]
	ld [hMathValue], a
	xor a
	ld [hMathValue + 1], a
	ld [hMathValue + 2], a
	ld a, $64
	ld [hMathOperand], a
	farcall Multiply32By8
	ld a, $ff
	ld [hMathOperand], a
	farcall Divide32By16_4Digit
	ld a, [hMathValue]
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
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wBattleAnimID
BattleAnimMoveParam_030_40f8:
	db $00, $4b, $64, $5f, $64, $5a, $55, $37, $64, $55, $64, $00, $00, $37, $64, $64
	db $64, $00, $00, $64, $64, $4b, $64, $64, $00, $5f, $55, $00, $64, $37, $64, $64
	db $64, $64, $1e, $3c, $00, $50, $00, $00, $00, $00, $5a, $64, $64, $64, $5a, $19
	db $00, $5a, $64, $64, $64, $55, $64, $55, $4b, $50, $64, $64, $64, $64, $64, $32
	db $64, $46, $64, $64, $50, $64, $50, $64, $64, $64, $55, $5a, $46, $64, $55, $55
	db $4b, $41, $5a, $64, $64, $5a, $1e, $64, $4b, $64, $46, $55, $64, $64, $64, $64
	db $64, $64, $5a, $50, $46, $4b, $46, $64, $5f, $64, $64, $50, $50, $3c, $64, $50
	db $3c, $46, $64, $55, $50, $50, $5a, $00, $5a, $50, $00, $5a, $5f, $64, $64, $00
	db $37, $55, $00, $4b, $28, $00, $00, $00, $00, $37, $00, $00, $00, $64, $64
Func_030_4187:
	ld de, BattleAnimMoveParam_030_4214
	ld a, [wBattleAnimID]
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
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wBattleAnimID
BattleAnimMoveParam_030_4214:
	db $00, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $01, $00, $00, $01, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $01, $00, $02, $00, $00, $00, $00, $00, $00
	db $00, $01, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $01, $00, $00
	db $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00

Func_030_42ab:
	ld a, $01
	ld [wd9b2], a
	xor a
	ld [wd9af], a
	call Func_125b
	ld d, a
	farcall Func_01e_4284
	ld de, Pointers_030_42db
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

Pointers_030_42db:
	dw Pointers_030_42db_42ed
	dw Pointers_030_42db_42ed
	dw Pointers_030_42db_42f6
	dw Pointers_030_42db_42ff
	dw Pointers_030_42db_4308
	dw Pointers_030_42db_4311
	dw Pointers_030_42db_431a
	dw Pointers_030_42db_4323
	dw Pointers_030_42db_432c
Pointers_030_42db_42ed:
	db $0a, $08, $05, $0a, $0a, $0a, $0a, $0d, $0a
Pointers_030_42db_42f6:
	db $0a, $0d, $08, $05, $0a, $0a, $0a, $0a, $0a
Pointers_030_42db_42ff:
	db $0a, $0a, $0d, $08, $0a, $0a, $0a, $05, $0a
Pointers_030_42db_4308:
	db $0a, $0a, $0a, $0a, $08, $05, $0a, $0a, $0d
Pointers_030_42db_4311:
	db $0a, $0a, $0a, $0a, $0d, $08, $05, $0a, $0a
Pointers_030_42db_431a:
	db $0a, $0a, $0a, $0a, $0a, $0d, $08, $0a, $05
Pointers_030_42db_4323:
	db $0a, $05, $0a, $0d, $0a, $0a, $0a, $08, $0a
Pointers_030_42db_432c:
	db $0a, $0a, $0a, $0a, $05, $0a, $0d, $0a, $08

Jumptable_030_4335:
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
	ld a, [wd985]
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
	ld a, [wd985]
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
	ld hl, wMonBox
	ld a, [wMonBoxCount]
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
	ld a, [wMonBoxCount]
	inc a
	ld [wMonBoxCount], a
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
	ldh [hMathValue + 1], a
	ld a, [wd99a]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 2], a
	call Func_123a
	ld a, $05
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	call Func_123a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ldh a, [hMathValue + 1]
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
	ld de, Pointers_030_565c
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
	ld de, Pointers_030_58f8
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
	ld de, wdcbc
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
	ld de, wdcbc
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
	ld hl, wMoney + 2
	ld a, [hld]
	ldh [hMathValue], a
	ld a, [hld]
	ldh [hMathValue + 1], a
	ld a, [hld]
	ldh [hMathValue + 2], a
	call Func_123a
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	call Func_123a
	ld hl, wMoney + 2
	ldh a, [hMathValue]
	ld [hld], a
	ldh a, [hMathValue + 1]
	ld [hld], a
	ldh a, [hMathValue + 2]
	ld [hld], a
	ret
.asm_47d3
	ld de, wdb00
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
	ld hl, wMoney + 2
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
	jp Func_030_4a44
.asm_4803
	ld a, $01
	ld [wd9ba], a
	jp Func_030_4a44

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
	farcall Func_026_4d47
	xor a
	ld [wd9c8], a
	ret
.asm_4901
	xor a
	ld [wd9b8], a
	ld a, [wd9c9]
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
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
	ld [wd9b6 + 1], a
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
	jp Func_030_5103

Func_030_4a3d:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
Func_030_4a44:
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
	ld [wBattleState], a
	ld [wd98b], a
	ld de, Script_023_57e1
	farcall Func_02e_4000
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
	call Func_030_537b
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
	ld [wBattleState], a
	ld [wd98b], a
	ld de, Script_023_57f4
	farcall Func_02e_4000
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
	jp Func_030_4e42

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
	farcall Func_01e_4284
	ld a, [wFacingTileX]
	cp $07
	ret nz
	call Func_030_4c8f
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
Func_030_4c8f:
	ld a, [wd9b1]
	and a
	jr nz, .asm_4c9f
	ld a, [wd9b0]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_4ca6
.asm_4c9f
	ldh [hMathValue], a
	ld a, [wd9b0]
	ldh [hMathValue + 1], a
.asm_4ca6
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .asm_4cc1
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret
.asm_4cc1
	ld [wd9b0], a
	ldh a, [hMathValue]
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
	ld [wBattleState], a
	ld [wd98b], a
	ld de, Script_023_57d1
	farcall Func_02e_4000
	call DelayFrame
	ld a, $02
	ld [wd98b], a
	ld a, $01
	ld [wd9b5], a
	jp Func_030_4d24

Func_030_4d13:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab
	ld a, $01
	ld [wd9b5], a
	ld a, $02
	ld [wd98b], a
Func_030_4d24:
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
Func_030_4d2d:
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
	farcall Func_02d_4000
	call Func_030_5372
	xor a
	ld [wBattleState], a
	ld [wd98b], a
	ld de, Script_023_580f
	farcall Func_02e_4000
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
	call Func_030_537b
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
	jp Func_030_4d2d

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
Func_030_4e42:
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
	ldh [hMathValue + 1], a
	ld a, [wd9b0]
	ldh [hMathValue], a
	jr .asm_4eeb
.asm_4ee1
	ld a, [wd9b1]
	ldh [hMathValue], a
	ld a, [wd9b0]
	ldh [hMathValue + 1], a
.asm_4eeb
	xor a
	ldh [hMathValue + 2], a
	ld a, $04
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
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
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	ldh [hMathValue + 2], a
	ld a, $02
	ld [hMathOperand], a
	farcall Multiply32By8
	ldh a, [hMathValue]
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
	ld [wBattleState], a
	ld [wd98b], a
	ld de, Script_023_580f
	farcall Func_02e_4000
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
Func_030_5103:
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
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_520d
.asm_5206
	ldh [hMathValue], a
	ld a, [wd99a]
	ldh [hMathValue + 1], a
.asm_520d
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .asm_5228
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret
.asm_5228
	ld [wd9b0], a
	ldh a, [hMathValue]
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
	farcall Func_02d_4000
	call Func_030_5372
	xor a
	ld [wBattleState], a
	ld [wd98b], a
	ld de, Script_023_580f
	farcall Func_02e_4000
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
	call Func_030_537b
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
Func_030_5372:
	ld c, $20
.asm_5374
	call DelayFrame
	dec c
	jr nz, .asm_5374
	ret
Func_030_537b:
	ld [wd9b1], a
	and a
	jr nz, .asm_538b
	ld a, [wd9b0]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_5393
.asm_538b
	xor a
	ldh [hMathValue + 1], a
	ld a, [wd9b0]
	ldh [hMathValue], a
.asm_5393
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Multiply32By8
	ldh a, [hMathValue + 1]
	and a
	jr z, .asm_53b0
	ldh a, [hMathValue + 1]
	ld [wd9b0], a
	ldh a, [hMathValue]
	ld [wd9b1], a
	ret
.asm_53b0
	ldh a, [hMathValue]
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
	ld a, [wd985]
	ld h, a
	jr .asm_5406

.asm_53fe
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
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
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_54ba
.asm_54b3
	ldh [hMathValue], a
	ld a, [wd998]
	ldh [hMathValue + 1], a
.asm_54ba
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .asm_54d5
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret
.asm_54d5
	ld [wd9b0], a
	ldh a, [hMathValue]
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
	farcall Func_02b_5651
	ld a, [wd9b0]
	ldh [hMathValue], a
	ld a, [wd9b1]
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	call Func_123a
	pop af
	dec a
	ldh [hMathOperand], a
	farcall Multiply32By8
	call Func_123a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ldh a, [hMathValue + 1]
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
	ld a, [wd98d]
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
	jr nz, Func_030_55c2

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
Func_030_55c2:
	ld a, [wd98d]
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

Pointers_030_565c:
	dw .image_566a
	dw .image_572c
	dw .image_57ae
	dw .image_57f0
	dw .image_5832
	dw .image_5874
	dw .image_58b6

.image_566a
	dw .image_566a_e - .image_566a_d
.image_566a_d
	INCBIN "gfx/battle/image_30_566c.interleave.w16.2bpp"
.image_566a_e

.image_572c
	dw .image_572c_e - .image_572c_d
.image_572c_d
	INCBIN "gfx/battle/image_30_572e.interleave.w16.2bpp"
.image_572c_e

.image_57ae
	dw .image_57ae_e - .image_57ae_d
.image_57ae_d
	INCBIN "gfx/misc/gfx_30_57b0.2bpp"
.image_57ae_e

.image_57f0
	dw .image_57f0_e - .image_57f0_d
.image_57f0_d
	INCBIN "gfx/misc/gfx_30_57f2.2bpp"
.image_57f0_e

.image_5832
	dw .image_5832_e - .image_5832_d
.image_5832_d
	INCBIN "gfx/misc/gfx_30_5834.2bpp"
.image_5832_e

.image_5874
	dw .image_5874_e - .image_5874_d
.image_5874_d
	INCBIN "gfx/misc/gfx_30_5876.2bpp"
.image_5874_e

.image_58b6
	dw .image_58b6_e - .image_58b6_d
.image_58b6_d
	INCBIN "gfx/misc/gfx_30_58b8.2bpp"
.image_58b6_e

Pointers_030_58f8:
	dw SubImage_030_5906
	dw SubImage_030_5968
	dw SubImage_030_59ca
	dw SubImage_030_5a2c
	dw SubImage_030_5a8e
	dw SubImage_030_5af0
	dw SubImage_030_5b52
GFX_030_5906:
SubImage_030_5906:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5906.2bpp"
.e

SubImage_030_5968:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5968.2bpp"
.e

SubImage_030_59ca:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_59ca.2bpp"
.e

SubImage_030_5a2c:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5a2c.2bpp"
.e

SubImage_030_5a8e:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5a8e.2bpp"
.e

SubImage_030_5af0:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5af0.2bpp"
.e

SubImage_030_5b52:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5b52.2bpp"
.e
Palettes_030_5bb4: ; 3 palettes (orphan)
	RGB 28, 7, 28
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
Func_030_5bcc:
	ld a, [wd9a0]
	and a
	ret z
	cp $01
	jp z, Func_030_6f88
	cp $02
	jp z, Func_030_6ff6
	cp $03
	jp z, Func_030_704a
	cp $04
	jp z, Func_030_70b7
	cp $05
	jp z, Func_030_711c
	ret
Func_030_5beb:
	ld a, [wd9ad]
	and a
	ret z
	ld a, [wBattleAnimID]
	cp $3b
	jp z, Func_030_6b36
	cp $3c
	jp z, Func_030_6bf2
	cp $3d
	jp z, Func_030_6c7f
	cp $41
	jp z, Func_030_6d38
	cp $45
	jp z, Func_030_6d76
	cp $48
	jp z, Func_030_6e19
	cp $4a
	jp z, Func_030_6e5a
	cp $4b
	jp z, Func_030_6ea0
	cp $4e
	jp z, Func_030_6ec2
	cp $53
	jp z, Func_030_6a5e
	cp $54
	jp z, Func_030_693a
	cp $56
	jp z, Func_030_692a
	cp $57
	jp z, Func_030_68dc
	cp $5c
	jp z, Func_030_68be
	cp $63
	jp z, Func_030_6816
	cp $6a
	jp z, Func_030_671c
	cp $6b
	jp z, Func_030_66e1
	cp $6c
	jp z, Func_030_6591
	cp $6f
	jp z, Func_030_63a8
	cp $76
	jp z, Func_030_635e
	cp $79
	jp z, Func_030_6349
	cp $7e
	jp z, Func_030_6136
	cp $81
	jp z, Func_030_609f
	cp $82
	jp z, Func_030_5fe0
	cp $83
	jp z, Func_030_5e79
	cp $88
	jp z, Func_030_5dd8
	cp $8a
	jp z, Func_030_5d56
	cp $8b
	jp z, Func_030_5d09
	cp $8c
	jp z, Func_030_5c85
	ret
Func_030_5c85:
	ld bc, wd1a8
.asm_5c88
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5cc5
	ldh a, [hFadeFrameCounter]
	and $3f
	jr nz, .asm_5cea
	ld [hl], $01
	ld de, BattleAnimStepTable_030_5cff
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, $03
	ld [bc], a
	dec bc
	dec bc
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $05
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_5cc5
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_5cea
	ld de, BattleAnimData_030_5cf7
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld l, [hl]
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_5ce3
	ld hl, $0002
	add hl, bc
	ld [hl], a
	jr .asm_5cea
.asm_5ce3
	ld hl, $0000
	add hl, bc
	call Func_030_7181
.asm_5cea
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp nz, .asm_5c88
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_5cf7`
BattleAnimData_030_5cf7:
	db $03, $04, $05, $00, $05, $00, $05, $ff
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): per-[wd9ae] 2B coord-delta added to sprite pos at wd1a0
BattleAnimStepTable_030_5cff:
	db $d0, $08, $d0, $18, $d0, $00, $d0, $20, $d0, $10
Func_030_5d09:
	ld bc, wd1a8
.asm_5d0c
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, Func_30_5d61
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	jr nc, .asm_5d2a
	and $01
	jr nz, .asm_5d49
	ld hl, $0000
	add hl, bc
	dec [hl]
	jr .asm_5d31
.asm_5d2a
	ld hl, $0000
	add hl, bc
	call Func_030_7181
.asm_5d31
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and $03
	jr nz, .asm_5d49
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $03
	jr nz, .asm_5d47
	ld [hl], $04
	jr .asm_5d49
.asm_5d47
	ld [hl], $03
.asm_5d49
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp nz, .asm_5d0c
	ret
Func_030_5d56:
	ld bc, wd1a8
Func_30_5d59:
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, Func_30_5d96
Func_30_5d61:
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, Func_30_5dc1
	ld [hl], $01
	ld de, BattleAnimStepTable_030_5dce
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, $04
	ld [bc], a
	dec bc
	dec bc
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $05
	ret c
	xor a
	ld [wd9ae], a
	ret
Func_30_5d96:
	ld hl, $0000
	add hl, bc
	dec [hl]
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	jr c, .asm_5dac
	ld hl, $0000
	add hl, bc
	call Func_030_7181
.asm_5dac
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, Func_30_5dc1
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $04
	jr nz, .asm_5dbf
	ld [hl], $05
	jr Func_30_5dc1
.asm_5dbf
	ld [hl], $04
Func_30_5dc1:
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp nz, Func_30_5d59
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_5dce:
	db $f8, $00, $00, $10, $04, $20, $fc, $08, $04, $18
Func_030_5dd8:
	ld bc, wd1a8
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5e24
	ld [hl], $01
	ld de, BattleAnimStepTable_030_5e69
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, $02
	ld [bc], a
	ld bc, wd1b0
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	ld a, $03
	ld [bc], a
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $04
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_5e24
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld bc, wd1a8
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	cp $01
	jr z, .asm_5e59
	cp $02
	jr z, .asm_5e49
	ld [hl], $00
	ld hl, $0002
	add hl, bc
	ld [hl], $00
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $00
	ret
.asm_5e49
	ld [hl], $03
	ld hl, $0002
	add hl, bc
	ld [hl], $02
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $03
	ret
.asm_5e59
	ld [hl], $02
	ld hl, $0002
	add hl, bc
	ld [hl], $03
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $02
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_5e69:
	db $04, $fc, $fc, $04, $04, $04, $fc, $fc, $00, $04, $00, $fc, $fc, $04, $04, $04
Func_030_5e79:
	ld a, [wd9ae]
	and a
	jr z, .asm_5ef1
	ld bc, wd1a0
.asm_5e82
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5ea7
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $07
	jr nz, .asm_5ee5
	ld hl, $0002
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $06
	jr c, .asm_5ee5
	ld hl, $0000
	add hl, bc
	call Func_030_7181
	jr .asm_5ee5
.asm_5ea7
	ldh a, [hFadeFrameCounter]
	and $0f
	jr nz, .asm_5ee5
	ld de, BattleAnimStepTable_030_5f2a
	ld a, [wd9ae]
	sub $01
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wd986]
	add a
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], $03
	inc hl
	inc hl
	ld [hl], $01
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	ld a, $01
	ld [wd9ae], a
	ret
.asm_5ee5
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jr c, .asm_5e82
	ret
.asm_5ef1
	ld a, [wd986]
	and a
	jr z, .asm_5efc
	ld de, BattleAnimData_030_5f3e
	jr .asm_5eff
.asm_5efc
	ld de, BattleAnimData_030_5f8f
.asm_5eff
	ld bc, wd1a0
	ld hl, $0003
	add hl, bc
	inc [hl]
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr nz, .asm_5f21
	ld a, $01
	ld [wd9ae], a
	ld a, $03
	ld [wd9a0], a
	ld a, $0b
	ld [wd99f], a
	ret
.asm_5f21
	ld a, [bc]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, [bc]
	add [hl]
	ld [bc], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): 2D table [wd9ae-1]x[wd986], sprite/coord record
BattleAnimStepTable_030_5f2a:
	db $40, $60, $10, $10, $50, $70, $20, $20, $38, $80, $08, $30, $58, $68, $28, $18
	db $58, $80, $28, $30
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_5f3e`
BattleAnimData_030_5f3e:
	db $ff, $ff, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe
	db $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe
	db $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe
	db $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe
	db $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe
	db $88
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_5f8f`
BattleAnimData_030_5f8f:
	db $00, $01, $02, $02, $01, $02, $02, $02, $02, $02, $01, $02, $02, $02, $01, $02
	db $02, $02, $01, $02, $02, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02, $02
	db $01, $02, $02, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02, $02, $02, $02
	db $01, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02, $02, $02, $02, $01, $02
	db $02, $02, $01, $02, $02, $02, $01, $02, $02, $02, $02, $02, $01, $02, $02, $02
	db $88
Func_030_5fe0:
	ld a, [wd9ae]
	and a
	jr z, .asm_5fff
	cp $01
	jr z, .asm_602a
	cp $02
	jr z, .asm_606c
	cp $03
	jr z, .asm_602a
	cp $04
	jr z, .asm_6071
	cp $05
	jr z, .asm_602a
	cp $06
	jr z, .asm_6076
	ret
.asm_5fff
	ld de, BattleAnimData_030_607b
.asm_6002
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	push hl
	pop de
	ld hl, wd1a0
	ld c, $03
.asm_6011
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld [hl], $05
	inc de
	inc de
	ld a, l
	add $06
	ld l, a
	dec c
	jr nz, .asm_6011
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
.asm_602a
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $05
	jr z, .asm_6056
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $05
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $05
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $05
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
.asm_6056
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $06
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $06
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $06
	ret
.asm_606c
	ld de, BattleAnimData_030_6087
	jr .asm_6002
.asm_6071
	ld de, BattleAnimData_030_6093
	jr .asm_6002
.asm_6076
	xor a
	ld [wd9ae], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): per-[wd986] sprite-position setup (copied to wd1a0)
BattleAnimData_030_607b:
	db $10, $18, $40, $68, $20, $40, $50, $90, $30, $28, $60, $78
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6087`
BattleAnimData_030_6087:
	db $10, $28, $40, $78, $30, $18, $60, $68, $20, $40, $50, $90
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6093`
BattleAnimData_030_6093:
	db $20, $28, $50, $68, $30, $38, $60, $78, $10, $40, $40, $90
Func_030_609f:
	ld a, [wd9ae]
	and a
	jr z, .asm_60af
	cp $01
	jr z, .asm_60fe
	cp $02
	jp z, .asm_6104
	ret
.asm_60af
	ld a, $01
	ld [wd9ae], a
	ld a, [wd986]
	and a
	jr nz, .asm_60dc
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $02
	ld hl, wd1a8
	ld [hl], $40
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $02
	ld hl, wd1b0
	ld [hl], $40
	inc hl
	ld [hl], $88
	inc hl
	ld [hl], $02
	ret
.asm_60dc
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $02
	ld hl, wd1a8
	ld [hl], $10
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $02
	ld hl, wd1b0
	ld [hl], $10
	inc hl
	ld [hl], $38
	inc hl
	ld [hl], $02
	ret
.asm_60fe
	ld a, $02
	ld [wd9ae], a
	ret
.asm_6104
	ld hl, wd1a0
	inc [hl]
	inc [hl]
	ld hl, wd1a8
	inc [hl]
	inc [hl]
	ld hl, wd1b0
	inc [hl]
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $10
	ret c
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $03
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $03
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $03
	ld a, $03
	ld [wd9ae], a
	ret
Func_030_6136:
	ld a, [wd9ae]
	and a
	jp z, .asm_6326
	cp $01
	jp z, .asm_62ea
	cp $02
	jp z, .asm_6273
	cp $03
	jp z, .asm_6237
	cp $04
	jp z, .asm_6214
	cp $05
	jp z, .asm_61d8
	cp $06
	jp z, .asm_61ad
	cp $07
	jp z, .asm_6171
	cp $08
	jp z, .asm_6166
	ret
.asm_6166
	call Func_030_7189
	xor a
	ld [wd9ad], a
	ld [wd9ae], a
	ret
.asm_6171
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_618e
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $01
	jr nz, .asm_618a
	ld [hl], $00
	jr .asm_619e
.asm_618a
	ld [hl], $01
	jr .asm_619e
.asm_618e
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $0a
	jr nz, .asm_619c
	ld [hl], $00
	jr .asm_619e
.asm_619c
	ld [hl], $0a
.asm_619e
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $08
	ld [wd9ae], a
	ret
.asm_61ad
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_61c8
	ld hl, wd1a0
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	cp $02
	ret nc
	ld a, $07
	ld [wd9ae], a
	ret
.asm_61c8
	ld hl, wd1a0
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	cp $0b
	ret nc
	ld a, $07
	ld [wd9ae], a
	ret
.asm_61d8
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_61f5
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $09
	jr nz, .asm_61f1
	ld [hl], $00
	jr .asm_6205
.asm_61f1
	ld [hl], $09
	jr .asm_6205
.asm_61f5
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $12
	jr nz, .asm_6203
	ld [hl], $00
	jr .asm_6205
.asm_6203
	ld [hl], $12
.asm_6205
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $06
	ld [wd9ae], a
	ret
.asm_6214
	ld a, $05
	ld [wd9ae], a
	ld a, [wd986]
	and a
	jr nz, .asm_622b
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $30
	inc hl
	ld [hl], $09
	ret
.asm_622b
	ld hl, wd1a0
	ld [hl], $58
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $12
	ret
.asm_6237
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_6254
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $12
	jr nz, .asm_6250
	ld [hl], $00
	jr .asm_6264
.asm_6250
	ld [hl], $12
	jr .asm_6264
.asm_6254
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $09
	jr nz, .asm_6262
	ld [hl], $00
	jr .asm_6264
.asm_6262
	ld [hl], $09
.asm_6264
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $04
	ld [wd9ae], a
	ret
.asm_6273
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_628f
	ld hl, wd1a0
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $12
	ret c
	ld a, $03
	ld [wd9ae], a
	jr .asm_629e
.asm_628f
	ld hl, wd1a0
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $09
	ret c
	ld a, $03
	ld [wd9ae], a
.asm_629e
	ld a, $01
	ld [wd9b5], a
	farcall Func_02b_4098
	ld a, [wd986]
	and a
	jr nz, .asm_62b9
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_62c1
.asm_62b9
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_62c1
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	ret nz
	ld a, $05
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld [wd9ad], a
	ld [wd9ae], a
	ld a, $01
	ld [hFFC6], a
	xor a
	ld [wBattleState], a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd98e], a
	ret
.asm_62ea
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wd986]
	and a
	jr nz, .asm_6307
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $0a
	jr nz, .asm_6303
	ld [hl], $00
	jr .asm_6317
.asm_6303
	ld [hl], $0a
	jr .asm_6317
.asm_6307
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $01
	jr nz, .asm_6315
	ld [hl], $00
	jr .asm_6317
.asm_6315
	ld [hl], $01
.asm_6317
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $02
	ld [wd9ae], a
	ret
.asm_6326
	ld a, $01
	ld [wd9ae], a
	ld a, [wd986]
	and a
	jr nz, .asm_633d
	ld hl, wd1a0
	ld [hl], $58
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $0a
	ret
.asm_633d
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $30
	inc hl
	ld [hl], $01
	ret
Func_030_6349:
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $02
	jr z, .asm_635b
	ld [hl], $02
	ret
.asm_635b
	ld [hl], $03
	ret
Func_030_635e:
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_6374
	ld hl, wd1a8
	inc hl
	inc hl
	ld a, [hl]
	cp $01
	jr z, .asm_6372
	ld [hl], $01
	jr .asm_6374
.asm_6372
	ld [hl], $02
.asm_6374
	ld a, [wd9ae]
	and a
	jp z, .asm_6381
	cp $01
	jp z, .asm_6395
	ret
.asm_6381
	ld hl, wd1a8
	inc hl
	dec [hl]
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld [hl], $00
	ld a, $01
	ld [wd9ae], a
	ret
.asm_6395
	ld hl, wd1a8
	inc hl
	inc [hl]
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld [hl], $00
	xor a
	ld [wd9ae], a
	ret
Func_030_63a8:
	ld a, [wd9ae]
	and a
	jp z, .asm_6495
	cp $01
	jp z, .asm_6471
	cp $02
	jp z, .asm_6495
	cp $03
	jp z, .asm_6447
	cp $04
	jr z, .asm_6416
	cp $05
	jr z, .asm_63c6
.asm_63c6
	ld bc, wd1a0
	ld de, BattleAnimSeq_030_64d0
	ld hl, $0004
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr nz, .asm_63e7
.asm_63dc
	call Func_030_7189
	xor a
	ld [wd9ad], a
	ld [wd9ae], a
	ret
.asm_63e7
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a0
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	ld bc, wd1a8
	ld de, BattleAnimSeq_030_64d0
	ld hl, $0004
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_63dc
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a8
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	ret
.asm_6416
	ld de, BattleAnimData_030_64cc
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a0
	ld a, d
	sub $09
	ld [hl], a
	inc hl
	ld a, e
	sub $07
	ld [hl], a
	inc hl
	ld [hl], $01
	inc hl
	inc hl
	ld [hl], $04
	ld hl, wd1a8
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], $02
	ld a, $05
	ld [wd9ae], a
	ret
.asm_6447
	ld hl, wd1a0
	dec [hl]
	inc hl
	dec [hl]
	ld hl, wd1a8
	inc [hl]
	inc hl
	dec [hl]
	ld hl, wd1b0
	inc [hl]
	inc hl
	inc [hl]
	ld hl, wd1b8
	dec [hl]
	inc hl
	inc [hl]
	ld bc, $0003
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld a, $04
	ld [wd9ae], a
	call Func_030_7189
	ret
.asm_6471
	ld hl, wd1a0
	dec [hl]
	ld hl, wd1a8
	inc hl
	dec [hl]
	ld hl, wd1b0
	inc [hl]
	ld hl, wd1b8
	inc hl
	inc [hl]
	ld bc, $0003
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld a, $02
	ld [wd9ae], a
	call Func_030_7189
	ret
.asm_6495
	ld de, BattleAnimData_030_64c8
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a0
	ld c, $04
.asm_64a9
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], $01
	ld a, [wd9ae]
	and a
	jr z, .asm_64b7
	ld [hl], $02
.asm_64b7
	push bc
	ld bc, $0006
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_64a9
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd986
BattleAnimData_030_64c8:
	db $20, $28, $50, $78
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd986
BattleAnimData_030_64cc:
	db $40, $a0, $10, $50
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): $88-terminated anim/movement sequence (auto-stepped via [bc+4])
BattleAnimSeq_030_64d0:
	db $ff, $00, $fd, $ff, $fd, $fe, $fd, $fd, $fd, $fd, $fe, $fd, $fe, $fd, $fe, $fd
	db $ff, $fd, $ff, $fd, $ff, $fd, $00, $fd, $ff, $fd, $00, $fd, $00, $fd, $00, $fd
	db $01, $fd, $00, $fd, $01, $fd, $02, $fd, $01, $fd, $02, $fd, $01, $fd, $03, $fd
	db $03, $fd, $03, $fe, $03, $fe, $03, $fe, $03, $ff, $03, $00, $03, $ff, $03, $00
	db $03, $00, $03, $01, $03, $01, $03, $01, $03, $02, $03, $02, $03, $03, $03, $03
	db $02, $04, $03, $04, $01, $04, $02, $04, $00, $04, $01, $04, $00, $04, $00, $04
	db $ff, $04, $ff, $04, $fc, $04, $fc, $03, $fc, $03, $fc, $02, $fc, $01, $fc, $00
	db $fc, $00, $fc, $00, $fc, $fe, $fc, $fe, $fc, $ff, $fc, $fc, $fc, $fc, $fe, $fc
	db $ff, $fc, $ff, $fc, $00, $fc, $01, $fc, $02, $fc, $03, $fc, $04, $fc, $04, $fd
	db $04, $ff, $04, $ff, $04, $00, $05, $01, $05, $02, $05, $05, $04, $05, $02, $05
	db $01, $05, $fe, $05, $fc, $05, $fb, $04, $fb, $01, $fb, $00, $fb, $fe, $fb, $fc
	db $fd, $fb, $00, $fb, $03, $fb, $04, $fc, $05, $ff, $04, $04, $00, $05, $fb, $03
	db $88
Func_030_6591:
	ld bc, wd1a8
.asm_6594
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_65b9
	cp $01
	jp z, .asm_65f9
	cp $02
	jp z, .asm_6633
	cp $03
	jp z, .asm_666a
	cp $04
	jp z, .asm_6633
	cp $05
	jp z, .asm_669b
	jp .asm_66bc
.asm_65b9
	ldh a, [hFadeFrameCounter]
	and $0f
	jp nz, .asm_66bc
	ld de, BattleAnimStepTable_030_66c9
	ld a, [wd9ae]
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
	inc de
	ld [hli], a
	ld [hl], $02
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $03
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_65f9
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $30
	jr c, .asm_6611
	ld [hl], $00
	dec hl
	ld [hl], $02
	ld hl, $0002
	add hl, bc
	ld [hl], $04
	jp .asm_66bc
.asm_6611
	ld hl, $0000
	add hl, bc
	dec [hl]
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and $03
	jp nz, .asm_66bc
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $02
	jr nz, .asm_662e
	ld [hl], $03
	jp .asm_66bc
.asm_662e
	ld [hl], $02
	jp .asm_66bc
.asm_6633
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $0f
	jr c, .asm_6643
	ld [hl], $00
	dec hl
	inc [hl]
	jr .asm_66bc
.asm_6643
	ld a, [wd986]
	and a
	jr nz, .asm_6659
	ld hl, $0000
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	inc hl
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	jr .asm_66bc
.asm_6659
	ld hl, $0000
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	inc hl
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jr .asm_66bc
.asm_666a
	ld de, BattleAnimStepTable_030_66d5
	ld a, [wd9ae]
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
	inc de
	ld [hli], a
	ld hl, $0004
	add hl, bc
	ld [hl], $04
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	jr .asm_66bc
.asm_669b
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $03
	jr nz, .asm_66ae
	ld [hl], $00
	ld hl, $0004
	add hl, bc
	ld [hl], $06
	jr .asm_66bc
.asm_66ae
	ld [hl], $03
	ld a, $03
	ld [wd9a0], a
	ld a, $01
	ld [wd99f], a
	jr .asm_66bc
.asm_66bc
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $c0
	jp c, .asm_6594
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_66c9:
	db $30, $28, $70, $78, $30, $18, $70, $68, $30, $38, $70, $88
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_66d5:
	db $80, $a0, $50, $d0, $80, $90, $50, $e0, $80, $b0, $50, $f0
Func_030_66e1:
	ld a, [wd9ae]
	and a
	jr z, .asm_66e8
	ret
.asm_66e8
	ld hl, wd1a8
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_66f5
	dec hl
	dec [hl]
	dec hl
	dec [hl]
.asm_66f5
	ld hl, wd1b0
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_6702
	dec hl
	inc [hl]
	dec hl
	dec [hl]
.asm_6702
	ld hl, wd1b8
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_670f
	dec hl
	dec [hl]
	dec hl
	inc [hl]
.asm_670f
	ld hl, wd1c0
	inc hl
	inc hl
	ld a, [hl]
	and a
	ret z
	dec hl
	inc [hl]
	dec hl
	inc [hl]
	ret
Func_030_671c:
	ld bc, wd1a0
.asm_671f
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_673d
	cp $01
	jp z, .asm_6781
	cp $02
	jp z, .asm_67ab
	cp $03
	jp z, .asm_6781
	cp $04
	jp z, .asm_67dd
	ret
.asm_673d
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_67e5
	ld de, BattleAnimData_030_67f2
	ld a, [wd9ae]
	add a
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld a, [wd986]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $03
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_6781
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $14
	jr c, .asm_6791
	ld [hl], $00
	dec hl
	inc [hl]
	jr .asm_67e5
.asm_6791
	ld a, [wd986]
	and a
	jr nz, .asm_67a1
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	add $08
	ld [hl], a
	jr .asm_67e5
.asm_67a1
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	sub $08
	ld [hl], a
	jr .asm_67e5
.asm_67ab
	ld de, BattleAnimData_030_6804
	ld a, [wd9ae]
	add a
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld a, [wd986]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, $0004
	add hl, bc
	ld [hl], $03
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	jr .asm_67e5
.asm_67dd
	ld hl, $0002
	add hl, bc
	ld [hl], $00
	jr .asm_67e5
.asm_67e5
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $b8
	jp c, .asm_671f
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_67f2`
BattleAnimData_030_67f2:
	db $20, $30, $01, $50, $60, $01, $10, $30, $02, $40, $60, $02, $30, $30, $02, $60
	db $60, $02
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6804`
BattleAnimData_030_6804:
	db $50, $30, $01, $20, $60, $01, $40, $30, $02, $10, $60, $02, $60, $30, $02, $30
	db $60, $02
Func_030_6816:
	ld a, [wd9ae]
	and a
	jr z, .asm_6825
	cp $01
	jr z, .asm_6861
	cp $02
	jr z, .asm_6882
	ret
.asm_6825
	ld de, BattleAnimData_030_68b2
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld bc, wd1a0
.asm_6835
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, [wd98b]
	inc a
	ld [hl], a
	inc de
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	inc de
	inc de
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	cp $03
	jr c, .asm_6835
	ld a, $01
	ld [wd9ae], a
	xor a
	ld [wd98b], a
	ret
.asm_6861
	ldh a, [hFadeFrameCounter]
	and $0f
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	inc [hl]
	ld hl, wd1a8
	inc hl
	inc hl
	inc [hl]
	ld hl, wd1b0
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $05
	ret c
	ld a, $02
	ld [wd9ae], a
	ret
.asm_6882
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr nz, .asm_68a1
	ld [hl], $05
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $05
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $05
	ret
.asm_68a1
	ld [hl], $00
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $00
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $00
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd986
BattleAnimData_030_68b2:
	db $54, $68, $24, $18, $4c, $78, $1c, $28, $4c, $88, $30, $38
Func_030_68be:
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld de, wd1a8
	inc de
	inc de
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr nz, .asm_68d7
	ld a, $06
	ld [hl], a
	ld [de], a
	jr Func_30_68f8
.asm_68d7
	xor a
	ld [hl], a
	ld [de], a
	jr Func_30_68f8
Func_030_68dc:
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld de, wd1a8
	inc de
	inc de
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr nz, .asm_68f5
	ld a, $03
	ld [hl], a
	ld [de], a
	jr Func_30_68f8
.asm_68f5
	xor a
	ld [hl], a
	ld [de], a
Func_30_68f8:
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	and $01
	jr z, .asm_6919
	ld hl, wd1a8
	inc hl
	ld a, [hl]
	sub $08
	ld [hl], a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $08
	ld [hl], a
	ret
.asm_6919
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $08
	ld [hl], a
	ld hl, wd1a8
	inc hl
	ld a, [hl]
	add $08
	ld [hl], a
	ret
Func_030_692a:
	ldh a, [hFadeFrameCounter]
	and $0f
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $04
	ret z
	inc [hl]
	ret
Func_030_693a:
	ld bc, wd1a0
.asm_693d
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_6951
	cp $01
	jp z, .asm_6999
	cp $02
	jp z, .asm_69bb
	ret
.asm_6951
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .asm_69e4
	ld de, BattleAnimStepTable_030_69f1
	ld a, [wd9ae]
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
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $01
	ld [hl], a
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_6999
	ld de, BattleAnimSeq_030_6a09
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_69dd
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	jr .asm_69e4
.asm_69bb
	ld de, BattleAnimSeq_030_6a09
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_69dd
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	sub e
	ld [hli], a
	jr .asm_69e4
.asm_69dd
	ld hl, $0000
	add hl, bc
	call Func_030_7181
.asm_69e4
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_693d
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_69f1:
	db $30, $78, $00, $20, $30, $88, $00, $30, $30, $70, $00, $18, $30, $80, $00, $28
	db $30, $68, $00, $10, $30, $90, $00, $38
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by hl
BattleAnimSeq_030_6a09:
	db $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $ff, $00, $fd, $01, $fd, $01, $fd, $01, $fd, $02, $fd, $02, $fe, $03, $fe, $03
	db $02, $02, $01, $02, $02, $01, $02, $02, $02, $01, $02, $01, $02, $01, $02, $01
	db $02, $00, $00, $02, $fe, $02, $fe, $02, $fe, $02, $ff, $02, $00, $02, $ff, $02
	db $03, $03, $03, $02, $88
Func_030_6a5e:
	ld a, [wd9ae]
	and a
	jr nz, .asm_6aa1
	ld a, $01
	ld [wd9ae], a
	ld a, [wd986]
	and a
	jr nz, .asm_6a86
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $01
	ld hl, wd1a8
	ld [hl], $40
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $01
	ret
.asm_6a86
	ld hl, wd1a0
	ld [hl], $70
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $01
	ld hl, wd1a8
	ld [hl], $70
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $01
	xor a
	ld [wd98e], a
	ret
.asm_6aa1
	ld bc, wd1a0
	ld de, BattleAnimData_030_6adb
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_6ad0
	ld d, a
	ld a, [hl]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	ld hl, $0008
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	sub e
	ld [hli], a
	ret
.asm_6ad0
	xor a
	ld [wd9ad], a
	ld [wd9ae], a
	call Func_030_7189
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); indexed table (index wd98e)
BattleAnimData_030_6adb:
	db $ff, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $01, $fd, $00, $fd, $01, $fd, $02
	db $fd, $02, $ff, $02, $ff, $02, $01, $02, $01, $02, $02, $02, $02, $01, $02, $01
	db $02, $00, $02, $01, $02, $00, $02, $01, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $00, $02, $fd, $00, $fd, $00, $fd, $01, $fd, $03, $ff, $03, $01, $02
	db $01, $02, $02, $02, $02, $01, $02, $01, $02, $00, $02, $01, $00, $02, $fe, $01
	db $fe, $02, $ff, $03, $01, $03, $02, $02, $02, $01, $88
Func_030_6b36:
	ld a, [wd9ae]
	cp $01
	jp z, Func_030_6b77
	cp $02
	jp z, Func_30_6ba6
	cp $03
	jp z, Func_030_6b77
	cp $04
	jp z, Func_30_6bcb
	cp $05
	jp z, Func_030_6b77
	ld a, $01
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $20
	ld [hli], a
	ld [hl], $06
	ret
Func_030_6b77:
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld de, wd1a0
	ld hl, $000a
	add hl, de
	ld a, [hl]
	cp $06
	jr nz, .asm_6b8b
	ld [hl], $07
	ret
.asm_6b8b
	ld [hl], $06
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	call Func_030_7181
	xor a
	ld [wd9ad], a
	ret
Func_30_6ba6:
	ld a, $03
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $10
	ld [hli], a
	ld [hl], $06
	ret
Func_30_6bcb:
	ld a, $05
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $06
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd986
BattleAnimData_030_6bee:
	db $40, $60, $10, $10
Func_030_6bf2:
	ld a, [wd9ae]
	cp $01
	jp z, Func_030_6b77
	cp $02
	jp z, Func_30_6c33
	cp $03
	jp z, Func_030_6b77
	cp $04
	jp z, Func_30_6c58
	cp $05
	jp z, Func_030_6b77
	ld a, $01
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $20
	ld [hli], a
	ld [hl], $06
	ret
Func_30_6c33:
	ld a, $03
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	add $20
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $06
	ret
Func_30_6c58:
	ld a, $05
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	add $10
	inc de
	ld [hli], a
	ld a, [de]
	add $10
	ld [hli], a
	ld [hl], $06
	ret
Func_030_6c7f:
	ld a, [wd9ae]
	cp $01
	jp z, .asm_6cc0
	cp $02
	jp z, Func_30_6c33
	cp $03
	jp z, .asm_6cc0
	cp $04
	jp z, Func_30_6c58
	cp $05
	jp z, .asm_6cc0
	ld a, $01
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $20
	ld [hli], a
	ld [hl], $06
	ret
.asm_6cc0
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld de, wd1a0
	ld hl, $000a
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $08
	ret c
	ld [hl], $06
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	call Func_030_7181
	xor a
	ld [wd9ad], a
	ret
	ld a, $03
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	add $20
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $06
	ret
	ld a, $05
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wd986]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	add $10
	inc de
	ld [hli], a
	ld a, [de]
	add $10
	ld [hli], a
	ld [hl], $06
	ret
Func_030_6d38:
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld bc, wd1a0
.asm_6d40
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_6d63
	inc hl
	inc [hl]
	ld a, [hl]
	ld de, BattleAnimSeq_030_6d6f
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .asm_6d5e
	ld l, c
	ld h, b
	call Func_030_7181
	jr .asm_6d63
.asm_6d5e
	ld hl, $0002
	add hl, bc
	ld [hl], a
.asm_6d63
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jr c, .asm_6d40
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); indexed table (index hl)
BattleAnimSeq_030_6d6f:
	db $01, $02, $03, $03, $02, $01, $ff
Func_030_6d76:
	ld bc, wd1a0
.asm_6d79
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	cp $01
	jp z, .asm_6dc9
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_6de4
	ld de, BattleAnimData_030_6df1
	ld a, [wd9ae]
	cp $0a
	jr c, .asm_6d9e
	xor a
	ld [wd9ae], a
	ld [wd9ad], a
	call Func_030_7189
	ret
.asm_6d9e
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
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
.asm_6dc9
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_6de4
	ld hl, $0002
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $05
	jp c, .asm_6de4
	ld [hl], $00
	ld hl, $0004
	add hl, bc
	ld [hl], $00
	jr .asm_6de4
.asm_6de4
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_6d79
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6df1`
BattleAnimData_030_6df1:
	db $40, $60, $10, $10, $50, $70, $20, $20, $60, $58, $30, $08, $48, $88, $18, $38
	db $48, $68, $18, $20, $60, $80, $30, $30, $40, $68, $10, $18, $50, $70, $20, $20
	db $60, $80, $30, $30, $48, $88, $18, $38
Func_030_6e19:
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld de, wd1a0
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $01
	jr nz, .asm_6e30
	ld [hl], $02
	jr .asm_6e32
.asm_6e30
	ld [hl], $01
.asm_6e32
	ld de, wd1a8
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $03
	jr nz, .asm_6e44
	ld [hl], $04
	jr .asm_6e46
.asm_6e44
	ld [hl], $03
.asm_6e46
	ld de, wd1b0
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $03
	jr nz, .asm_6e57
	ld [hl], $04
	ret
.asm_6e57
	ld [hl], $03
	ret
Func_030_6e5a:
	ldh a, [hFadeFrameCounter]
	and $0f
	ret nz
	ld de, BattleAnimStepTable_030_6e94
	ld a, [wd9ae]
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
	ld bc, wd1b0
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $05
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $03
	ret c
	xor a
	ld [wd9ae], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_6e94:
	db $40, $78, $10, $28, $40, $68, $10, $18, $40, $88, $10, $38
Func_030_6ea0:
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $04
	ret c
	ld a, [wd986]
	and a
	jr nz, .asm_6eb9
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $08
	ld [hl], a
	ret
.asm_6eb9
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $08
	ld [hl], a
	ret
Func_030_6ec2:
	ld bc, wd1a8
.asm_6ec5
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_6ed4
	cp $01
	jp z, .asm_6f13
	ret
.asm_6ed4
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .asm_6f5b
	ld de, BattleAnimRngTable_030_6f68
	call AdvanceRNG
	ld a, [wd991]
	and $07
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
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $03
	ld [hl], a
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ret
.asm_6f13
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_6f5b
	ld a, [wd986]
	and a
	jr nz, .asm_6f3b
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $70
	jp z, .asm_6f54
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $60
	jp z, .asm_6f54
	jp .asm_6f5b
.asm_6f3b
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $30
	jp z, .asm_6f54
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $f8
	jp z, .asm_6f54
	jp .asm_6f5b
.asm_6f54
	ld hl, $0000
	add hl, bc
	call Func_030_7181
.asm_6f5b
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_6ec5
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): RNG-selected ([wd991]&7) 4B record
BattleAnimRngTable_030_6f68:
	db $30, $80, $00, $18, $30, $88, $00, $20, $30, $90, $00, $28, $30, $98, $00, $30
	db $30, $a0, $00, $38, $30, $a8, $00, $40, $30, $b0, $00, $48, $30, $b8, $00, $50
Func_030_6f88:
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jr z, Func_30_6fce
Func_30_6f98:
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_6fa9
	xor a
	ld [wd9a0], a
	ld [wd9aa], a
.asm_6fa9
	ld de, wPaletteBuffer
	ld a, [wd986]
	and a
	jr nz, .asm_6fc0
	ld a, [wd99e]
	and a
	jr nz, .asm_6fc6
.asm_6fb8
	ld a, $38
	ld l, a
	ld h, $00
	add hl, de
	jr Func_30_6fd6
.asm_6fc0
	ld a, [wd99e]
	and a
	jr nz, .asm_6fb8
.asm_6fc6
	ld a, $30
	ld l, a
	ld h, $00
	add hl, de
	jr Func_30_6fd6
Func_30_6fce:
	ld a, [wd99c]
	ld l, a
	ld a, [wd99d]
	ld h, a
Func_30_6fd6:
	ld b, $08
	ld a, [wd986]
	and a
	jr nz, .asm_6fea
	ld a, [wd99e]
	and a
	jr nz, .asm_6ff0
.asm_6fe4
	ld c, $b8
	call LoadPalettes_BCPD
	ret
.asm_6fea
	ld a, [wd99e]
	and a
	jr nz, .asm_6fe4
.asm_6ff0
	ld c, $b0
	call LoadPalettes_BCPD
	ret
Func_030_6ff6:
	ld a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, Func_30_6f98
	ld de, wPaletteBuffer
	ld a, [wd986]
	and a
	jr nz, .asm_701e
	ld a, [wd99e]
	and a
	jr nz, .asm_7024
.asm_7016
	ld a, $38
	ld l, a
	ld h, $00
	add hl, de
	jr .asm_702a
.asm_701e
	ld a, [wd99e]
	and a
	jr nz, .asm_7016
.asm_7024
	ld a, $30
	ld l, a
	ld h, $00
	add hl, de
.asm_702a
	ld b, $06
	ld a, [wd986]
	and a
	jr nz, .asm_703e
	ld a, [wd99e]
	and a
	jr nz, .asm_7044
.asm_7038
	ld c, $ba
	call LoadPalettes_BCPD
	ret
.asm_703e
	ld a, [wd99e]
	and a
	jr nz, .asm_7038
.asm_7044
	ld c, $b2
	call LoadPalettes_BCPD
	ret
Func_030_704a:
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, .asm_7084
	ld de, wPaletteBuffer
	ld c, $08
.asm_7060
	ld hl, $0000
	add hl, de
	xor a
	ld [hli], a
	ld [hli], a
	ld hl, $0006
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_7060
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
.asm_7084
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_7092
	xor a
	ld [wd9a0], a
.asm_7092
	ld de, wPaletteBuffer
	ld c, $08
.asm_7097
	ld hl, $0000
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	ld hl, $0006
	add hl, de
	xor a
	ld [hli], a
	ld [hli], a
	push hl
	pop de
	dec c
	jr nz, .asm_7097
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
Func_030_70b7:
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, .asm_70eb
	ld de, wPaletteBuffer
	ld c, $08
.asm_70cd
	ld hl, $0000
	add hl, de
	ld [hl], $80
	inc hl
	ld [hl], $7e
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_70cd
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
.asm_70eb
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_70f9
	xor a
	ld [wd9a0], a
.asm_70f9
	ld de, wPaletteBuffer
	ld c, $08
.asm_70fe
	ld hl, $0000
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_70fe
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
Func_030_711c:
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, .asm_7150
	ld de, wPaletteBuffer
	ld c, $08
.asm_7132
	ld hl, $0000
	add hl, de
	ld [hl], $1f
	inc hl
	ld [hl], $00
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_7132
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
.asm_7150
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_715e
	xor a
	ld [wd9a0], a
.asm_715e
	ld de, wPaletteBuffer
	ld c, $08
.asm_7163
	ld hl, $0000
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_7163
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
Func_030_7181:
	ld e, $08
	xor a
.asm_7184
	ld [hli], a
	dec e
	jr nz, .asm_7184
	ret
Func_030_7189:
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_718f
	ld [hli], a
	dec c
	jr nz, .asm_718f
	ret
Func_030_7194:
	ld a, [wd98b]
	cp $01
	jp z, .asm_71f2
	cp $02
	jp z, .asm_7202
	cp $03
	jp z, .asm_7213
	cp $04
	jp z, .asm_7226
	cp $05
	jp z, .asm_7236
	cp $06
	jp z, .asm_7247
	cp $07
	jp z, .asm_725a
	cp $08
	jp z, .asm_727e
	cp $09
	jp z, .asm_72b4
	ld a, [wd986]
	and a
	jr nz, .asm_71dc
	ld hl, wd1a0
	ld [hl], $80
	inc hl
	ld [hl], $58
	inc hl
	ld [hl], $01
	ld a, $04
	ld [wd98b], a
	jr .asm_71ec
.asm_71dc
	ld hl, wd1a0
	ld [hl], $80
	inc hl
	ld [hl], $08
	inc hl
	ld [hl], $01
	ld a, $01
	ld [wd98b], a
.asm_71ec
	ld a, $29
	ld [wBattleState], a
	ret
.asm_71f2
	ld hl, wd1a0
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $d0
	ret nz
	ld a, $02
	ld [wd98b], a
	ret
.asm_7202
	ld hl, wd1a0
	ld [hl], $d0
	inc hl
	ld [hl], $08
	inc hl
	ld [hl], $02
	ld a, $03
	ld [wd98b], a
	ret
.asm_7213
	ld hl, wd1a0
	ld a, [hl]
	add $04
	ld [hl], a
	cp $a0
	ret nz
	jp .asm_72c6
	ld a, $07
	ld [wd98b], a
	ret
.asm_7226
	ld hl, wd1a0
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $d0
	ret nz
	ld a, $05
	ld [wd98b], a
	ret
.asm_7236
	ld hl, wd1a0
	ld [hl], $d0
	inc hl
	ld [hl], $58
	inc hl
	ld [hl], $02
	ld a, $06
	ld [wd98b], a
	ret
.asm_7247
	ld hl, wd1a0
	ld a, [hl]
	add $04
	ld [hl], a
	cp $a0
	ret nz
	jp .asm_72c6
	ld a, $07
	ld [wd98b], a
	ret
.asm_725a
	ld a, [wd986]
	and a
	jr nz, .asm_726d
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $06
	jr .asm_7278
.asm_726d
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $06
.asm_7278
	ld a, $08
	ld [wd98b], a
	ret
.asm_727e
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $09
	ret c
	ld a, [wd986]
	and a
	jr nz, .asm_72a3
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $03
	jr .asm_72ae
.asm_72a3
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $03
.asm_72ae
	ld a, $09
	ld [wd98b], a
	ret
.asm_72b4
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $06
	ret c
.asm_72c6
	ld hl, wd1a0
	call Func_030_7181
	xor a
	ld [wBattleState], a
	ld [wd98e], a
	ld [wd98b], a
	ret
Func_030_72d7:
	ld a, [wd98b]
	cp $01
	jp z, .asm_73af
	cp $0b
	jp z, .asm_7399
	cp $6f
	jp z, .asm_7368
	cp $16
	jp z, .asm_73cb
	cp $de
	jp z, .asm_73e8
	cp $04
	jp z, .asm_74d5
	cp $2c
	jp z, .asm_74bf
	cp $2a
	jp z, .asm_748e
	cp $37
	jp z, .asm_74f3
	cp $06
	jp z, .asm_7419
	cp $07
	jp z, .asm_742d
	cp $08
	jp z, .asm_744b
	cp $09
	jp z, .asm_7468
	cp $63
	jp z, .asm_7573
	cp $62
	jp z, .asm_7590
	cp $58
	jp z, .asm_7557
	cp $4d
	jp z, .asm_7541
	cp $42
	jp z, .asm_7510
	ld a, [wd986]
	and a
	jr nz, .asm_734f
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $38
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $06
	ld a, $2a
	ld [wd98b], a
	jr .asm_7362
.asm_734f
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $05
	inc hl
	ld [hl], $06
	ld a, $6f
	ld [wd98b], a
.asm_7362
	ld a, $2a
	ld [wBattleState], a
	ret
.asm_7368
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_737c
	ld [hl], $00
	jr .asm_737e
.asm_737c
	ld [hl], $05
.asm_737e
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $04
	ld a, $0b
	ld [wd98b], a
	ret
.asm_7399
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $03
	ld a, $01
	ld [wd98b], a
	ret
.asm_73af
	ld hl, wd1a0
	ld a, [hl]
	dec a
	ld [hl], a
	inc hl
	ld a, [hl]
	dec a
	ld [hl], a
	cp $30
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $16
	ld [wd98b], a
	ret
.asm_73cb
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $01
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $de
	ld [wd98b], a
	ret
.asm_73e8
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_73fc
	ld [hl], $00
	jr .asm_73fe
.asm_73fc
	ld [hl], $01
.asm_73fe
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $06
	ld [wd98b], a
	ret
.asm_7419
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $03
	ld a, $07
	ld [wd98b], a
	ret
.asm_742d
	ld hl, wd1a0
	ld a, [hl]
	inc a
	ld [hl], a
	inc hl
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	ret nz
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $04
	ld a, $08
	ld [wd98b], a
	ret
.asm_744b
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $05
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $09
	ld [wd98b], a
	ret
.asm_7468
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	cp $05
	jr z, .asm_747d
	ld [hl], $05
	jr .asm_747f
.asm_747d
	ld [hl], $06
.asm_747f
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	jp .asm_75b6
.asm_748e
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_74a2
	ld [hl], $00
	jr .asm_74a4
.asm_74a2
	ld [hl], $01
.asm_74a4
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $2c
	ld [wd98b], a
	ret
.asm_74bf
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld [hl], $00
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $03
	ld a, $04
	ld [wd98b], a
	ret
.asm_74d5
	ld hl, wd1a0
	ld a, [hl]
	inc a
	ld [hl], a
	inc hl
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	ret nz
	ld hl, wd1a0
	ld [hl], $48
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $04
	ld a, $37
	ld [wd98b], a
	ret
.asm_74f3
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $05
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $42
	ld [wd98b], a
	ret
.asm_7510
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_7524
	ld [hl], $00
	jr .asm_7526
.asm_7524
	ld [hl], $05
.asm_7526
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $04
	ld a, $4d
	ld [wd98b], a
	ret
.asm_7541
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $03
	ld a, $58
	ld [wd98b], a
	ret
.asm_7557
	ld hl, wd1a0
	ld a, [hl]
	dec a
	ld [hl], a
	inc hl
	ld a, [hl]
	dec a
	ld [hl], a
	cp $30
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $63
	ld [wd98b], a
	ret
.asm_7573
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $01
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $62
	ld [wd98b], a
	ret
.asm_7590
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	cp $01
	jr z, .asm_75a5
	ld [hl], $01
	jr .asm_75a7
.asm_75a5
	ld [hl], $06
.asm_75a7
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	jp .asm_75b6
.asm_75b6
	ld hl, wd1a0
	call Func_030_7181
	xor a
	ld [wBattleState], a
	ld [wd98e], a
	ld [wd98b], a
	ret
Func_030_75c7:
	ld a, [wd986]
	and a
	jr nz, .asm_75e9
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $e0
	jr nz, .asm_75e3
	xor a
	ld [wBattleState], a
	ld hl, wd1a0
	call Func_030_7181
	ret
.asm_75e3
	ld a, [hl]
	add $02
	ld [hli], a
	jr .asm_7603
.asm_75e9
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $e0
	jr nz, .asm_75ff
	xor a
	ld [wBattleState], a
	ld hl, wd1a0
	call Func_030_7181
	ret
.asm_75ff
	ld a, [hl]
	sub $02
	ld [hli], a
.asm_7603
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	inc [hl]
	ld a, [hl]
	cp $06
	ret c
	ld [hl], $04
	ret
Func_030_7610:
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld de, wd1a8
	ld a, [wd986]
	and a
	jr nz, .asm_7633
	ld a, [de]
	add $02
	ld [de], a
	inc de
	ld a, [de]
	add $02
	ld [de], a
	inc de
	inc [hl]
	inc [hl]
	inc hl
	inc [hl]
	inc [hl]
	inc hl
	jr .asm_7643
.asm_7633
	ld a, [de]
	sub $02
	ld [de], a
	inc de
	ld a, [de]
	sub $02
	ld [de], a
	inc de
	dec [hl]
	dec [hl]
	inc hl
	dec [hl]
	dec [hl]
	inc hl
.asm_7643
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	inc [hl]
	ld a, [hl]
	cp $04
	jr c, .asm_7660
	ld [hl], $01
	inc hl
	inc [hl]
	ld a, [hl]
	cp $03
	ret c
	dec hl
	ld a, $05
	ld [hl], a
	ld [de], a
	xor a
	ld [wBattleState], a
	ret
.asm_7660
	ld a, [de]
	inc a
	ld [de], a
	cp $04
	ret c
	ld a, $01
	ld [de], a
	ret
Func_030_766a:
	ld de, wd1a0
.asm_766d
	ld hl, $0004
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_7684
	cp $01
	jp z, .asm_768d
	cp $02
	jp z, .asm_76ba
	cp $03
	jp z, .asm_76e4
.asm_7684
	ld hl, $0004
	add hl, de
	ld [hl], $01
	jp .asm_772e
.asm_768d
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .asm_772e
	ld hl, $0002
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $03
	jp c, .asm_772e
	ld hl, $0004
	add hl, de
	ld [hl], $02
	ld a, $03
	ld [wd9a0], a
	ld a, $05
	ld [wd99f], a
	ld a, $01
	ld [wd9ad], a
	xor a
	ld [wd9ae], a
	jr .asm_772e
.asm_76ba
	ld a, [wd986]
	and a
	jr nz, .asm_76d2
	ld hl, $0001
	add hl, de
	dec [hl]
	ld a, [hl]
	cp $58
	jr nz, .asm_7719
	ld hl, $0004
	add hl, de
	ld [hl], $03
	jr .asm_7719
.asm_76d2
	ld hl, $0001
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $38
	jr nz, .asm_7719
	ld hl, $0004
	add hl, de
	ld [hl], $03
	jr .asm_7719
.asm_76e4
	ld a, [wd986]
	and a
	jr nz, .asm_76f6
	ld hl, $0001
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $88
	jr nz, .asm_7719
	jr .asm_7700
.asm_76f6
	ld hl, $0001
	add hl, de
	dec [hl]
	ld a, [hl]
	cp $08
	jr nz, .asm_7719
.asm_7700
	ld hl, $0004
	add hl, de
	ld [hl], $02
	inc hl
	inc [hl]
	ld a, [hl]
	cp $01
	jr c, .asm_772e
	xor a
	ld [wBattleState], a
	ld [wd9ad], a
	ld [wd9ae], a
	jr .asm_7719
.asm_7719
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_772e
	ld hl, $0002
	add hl, de
	ld a, [hl]
	cp $03
	jr nz, .asm_772c
	ld [hl], $04
	jr .asm_772e
.asm_772c
	ld [hl], $03
.asm_772e
	ld hl, $0008
	add hl, de
	push hl
	pop de
	ld a, l
	cp $b0
	jp c, .asm_766d
	ret
Func_030_773b:
	ld bc, wd1a0
.asm_773e
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_7752
	cp $01
	jp z, .asm_77a0
	cp $02
	jp z, .asm_77e1
	ret
.asm_7752
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_783f
	ld de, BattleAnimRngTable_030_6f68
	call AdvanceRNG
	ld a, [wd991]
	and $07
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
	call AdvanceRNG
	ld a, [wd991]
	and $03
	add $01
	cp $04
	jr c, .asm_778f
	ld a, $02
.asm_778f
	ld [hl], a
	ld hl, $0004
	add hl, bc
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $01
	ld [hl], a
	ret
.asm_77a0
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_783f
	ld a, [wd986]
	and a
	jr nz, .asm_77c8
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $70
	jp z, .asm_7822
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $60
	jp z, .asm_7822
	jp .asm_783f
.asm_77c8
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $30
	jp z, .asm_7822
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $f8
	jp z, .asm_7822
	jp .asm_783f
.asm_77e1
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_783f
	ld a, [wd986]
	and a
	jr nz, .asm_7809
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hli], a
	cp $70
	jp z, .asm_7822
	ld a, [hl]
	sub $04
	ld [hli], a
	cp $60
	jp z, .asm_7822
	jp .asm_783f
.asm_7809
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hli], a
	cp $30
	jp z, .asm_7822
	ld a, [hl]
	sub $04
	ld [hli], a
	cp $f8
	jp z, .asm_7822
	jp .asm_783f
.asm_7822
	ld hl, $0000
	add hl, bc
	call Func_030_7181
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	cp $14
	jr nz, .asm_783f
	xor a
	ld [wBattleState], a
	ld [wd98b], a
	call Func_030_7189
	ret
.asm_783f
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_773e
	ret
Func_030_784c:
	ld bc, wd1a0
.asm_784f
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_7876
	cp $01
	jp z, .asm_78b0
	cp $02
	jp z, .asm_78c5
	cp $03
	jp z, .asm_78db
	cp $04
	jp z, .asm_790e
	cp $05
	jp z, .asm_7938
	cp $06
	jp z, .asm_7953
	ret
.asm_7876
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld de, BattleAnimData_030_7981
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
	xor a
	ld [wd98c], a
	ret
.asm_78b0
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $03
	jp c, .asm_7974
	ld hl, $0004
	add hl, bc
	ld [hl], $02
	jp .asm_7974
.asm_78c5
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $e0
	jp nz, .asm_7974
	ld hl, $0004
	add hl, bc
	ld [hl], $03
	jp .asm_7974
.asm_78db
	ld de, BattleAnimData_030_798d
	ld a, [wd98e]
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
	ld [hl], $09
	ld hl, $0004
	add hl, bc
	ld [hl], $04
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	jp .asm_7974
.asm_790e
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld a, [wd986]
	and a
	jr nz, .asm_7924
	ld a, [hl]
	cp $50
	jp nz, .asm_7974
	jr .asm_792a
.asm_7924
	ld a, [hl]
	cp $20
	jp nz, .asm_7974
.asm_792a
	ld hl, $0002
	add hl, bc
	ld [hl], $04
	ld hl, $0004
	add hl, bc
	ld [hl], $05
	jr .asm_7974
.asm_7938
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_7974
	ld hl, $0002
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $08
	jp c, .asm_7974
	ld [hl], $00
	ld hl, $0004
	add hl, bc
	ld [hl], $06
	jr .asm_7974
.asm_7953
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_7974
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	cp $0a
	jr c, .asm_7974
	xor a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd98e], a
	ld [wBattleState], a
	jp .asm_7974
.asm_7974
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $b8
	jp c, .asm_784f
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd98b
BattleAnimData_030_7981:
	db $30, $28, $50, $78, $30, $18, $50, $68, $30, $38, $50, $88
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd98e
BattleAnimData_030_798d:
	db $f0, $70, $f0, $20, $f0, $60, $f0, $10, $f0, $80, $f0, $30
; TODO: unk_ - battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); orphan (no direct reference; computed pointer or dead)
unk_030_7999:
