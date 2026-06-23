MACRO levelup_move ; level, move
	db \1, \2
ENDM

Func_04a_4000:
	ld de, Learnset_Pointers
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld a, [bc]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_4014
	ld a, [wd9e8]
	cp [hl]
	jr z, .asm_4023
	ld a, [hl]
	cp $FF
	jr z, .asm_4082
	inc hl
	inc hl
	jr .asm_4014
.asm_4023
	inc hl
	ld a, [hl]
	ld [wd9e3], a
	ld d, a
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld bc, $0003
	ld e, $04
.asm_403a
	ld a, [hl]
	cp d
	jr z, .asm_4082
	and a
	jr z, .asm_406e
	add hl, bc
	dec e
	jr nz, .asm_403a
	call ClearBGMap0
	call Func_04a_412a
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0D
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld de, wd1a0
	ld a, $0B
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedOption]
	ld [hli], a
	ret
.asm_406e
	ld a, [wd9e3]
	ld [hli], a
	ld [wd9bf], a
	push hl
	farcall Func_024_4053
	pop hl
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
.asm_4082
	ld a, $0C
	ld [hFFC5], a
	call Func_04a_412a
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret

LearnLevelUpMove:
	ld de, Learnset_Pointers
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld a, [bc]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_40ac
	ld a, [wd9e8]
	cp [hl]
	jr z, .asm_40ba
	ld a, [hl]
	cp $FF
	ret z
	inc hl
	inc hl
	jr .asm_40ac
.asm_40ba
	inc hl
	ld a, [hl]
	ld [wd9e3], a
	ld d, a
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld bc, $0003
	ld e, $04
.asm_40d1
	ld a, [hl]
	cp d
	ret z
	and a
	jr z, .asm_4108
	add hl, bc
	dec e
	jr nz, .asm_40d1
	ld a, $33
	ld [wd3ff], a
	farcall Func_02d_4000
	call ClearBGMap0
	call Func_04a_412a
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0D
	ld [hFFC5], a
.asm_40f6
	call DelayFrame
	ld a, [hFFC5]
	and a
	jr z, .asm_4107
	farcall Func_024_40fd
	jr .asm_40f6
.asm_4107
	ret
.asm_4108
	push hl
	ld a, $33
	ld [wd3ff], a
	farcall Func_02d_4000
	pop hl
	ld a, [wd9e3]
	ld [hli], a
	push hl
	ld [wd9bf], a
	farcall Func_024_4053
	pop hl
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ret

Func_04a_412a:
	ld hl, wcde0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ret
Learnset_Pointers:
	dw Learnset_Default
	dw Learnset_Default
	dw Learnset_42a4
	dw Learnset_42bf
	dw Learnset_42dc
	dw Learnset_42f9
	dw Learnset_4314
	dw Learnset_4333
	dw Learnset_434e
	dw Learnset_436b
	dw Learnset_4386
	dw Learnset_439f
	dw Learnset_43ba
	dw Learnset_43d5
	dw Learnset_43f0
	dw Learnset_440b
	dw Learnset_4426
	dw Learnset_443f
	dw Learnset_4460
	dw Learnset_4479
	dw Learnset_4492
	dw Learnset_44b1
	dw Learnset_44ce
	dw Learnset_44e7
	dw Learnset_4508
	dw Learnset_4521
	dw Learnset_453e
	dw Learnset_4555
	dw Learnset_456c
	dw Learnset_458b
	dw Learnset_45a2
	dw Learnset_45bd
	dw Learnset_45da
	dw Learnset_45f1
	dw Learnset_460e
	dw Learnset_462b
	dw Learnset_4644
	dw Learnset_465f
	dw Learnset_467c
	dw Learnset_4695
	dw Learnset_46b0
	dw Learnset_46cd
	dw Learnset_46ec
	dw Learnset_470d
	dw Learnset_4724
	dw Learnset_473f
	dw Learnset_4758
	dw Learnset_476d
	dw Learnset_4786
	dw Learnset_479f
	dw Learnset_47b8
	dw Learnset_47d1
	dw Learnset_47e8
	dw Learnset_47ff
	dw Learnset_4816
	dw Learnset_482d
	dw Learnset_4846
	dw Learnset_4865
	dw Learnset_487a
	dw Learnset_4899
	dw Learnset_48b2
	dw Learnset_48cd
	dw Learnset_48ea
	dw Learnset_48ff
	dw Learnset_491c
	dw Learnset_493d
	dw Learnset_4954
	dw Learnset_496f
	dw Learnset_4988
	dw Learnset_49a3
	dw Learnset_49ba
	dw Learnset_49d1
	dw Learnset_49ea
	dw Learnset_4a09
	dw Learnset_4a26
	dw Learnset_4a3d
	dw Learnset_4a58
	dw Learnset_4a73
	dw Learnset_4a90
	dw Learnset_4aaf
	dw Learnset_4acc
	dw Learnset_4ae3
	dw Learnset_4afe
	dw Learnset_4b15
	dw Learnset_4b2c
	dw Learnset_4b45
	dw Learnset_4b62
	dw Learnset_4b7d
	dw Learnset_4b9c
	dw Learnset_4bb3
	dw Learnset_4bce
	dw Learnset_4be5
	dw Learnset_4bfe
	dw Learnset_4c19
	dw Learnset_4c32
	dw Learnset_4c4b
	dw Learnset_4c68
	dw Learnset_4c81
	dw Learnset_4ca2
	dw Learnset_4cb9
	dw Learnset_4cd2
	dw Learnset_4ce7
	dw Learnset_4d02
	dw Learnset_4d1f
	dw Learnset_4d36
	dw Learnset_4d51
	dw Learnset_4d6e
	dw Learnset_4d89
	dw Learnset_4da8
	dw Learnset_4dc1
	dw Learnset_4dd8
	dw Learnset_4df3
	dw Learnset_4e12
	dw Learnset_4e2d
	dw Learnset_4e46
	dw Learnset_4e5d
	dw Learnset_4e76
	dw Learnset_4e8f
	dw Learnset_4eb0
	dw Learnset_4ecf
	dw Learnset_4ee6
	dw Learnset_4f03
	dw Learnset_4f1c
	dw Learnset_4f35
	dw Learnset_4f4c
	dw Learnset_4f65
	dw Learnset_4f7a
	dw Learnset_4f93
	dw Learnset_4fae
	dw Learnset_4fcb
	dw Learnset_4fe2
	dw Learnset_4ff9
	dw Learnset_5012
	dw Learnset_502f
	dw Learnset_5048
	dw Learnset_5067
	dw Learnset_5086
	dw Learnset_509f
	dw Learnset_50bc
	dw Learnset_50bf
	dw Learnset_50de
	dw Learnset_50fb
	dw Learnset_5114
	dw Learnset_512b
	dw Learnset_5142
	dw Learnset_515f
	dw Learnset_5178
	dw Learnset_5195
	dw Learnset_51ac
	dw Learnset_51c5
	dw Learnset_51e4
	dw Learnset_51fd
	dw Learnset_521b
	dw Learnset_5234
	dw Learnset_5235
	dw Learnset_524c
	dw Learnset_525d
	dw Learnset_5272
	dw Learnset_5283
	dw Learnset_529a
Learnset_Default:
	levelup_move 4, $2b
	levelup_move 7, $25
	levelup_move 15, $1a
	levelup_move 20, $38
	levelup_move 25, $19
	levelup_move 30, $33
	levelup_move 33, $35
	levelup_move 37, $3d
	levelup_move 41, $39
	levelup_move 45, $7d
	levelup_move 49, $3a
	levelup_move 54, $3e
	levelup_move 59, $83
	db $ff
Learnset_42a4:
	levelup_move 5, $03
	levelup_move 8, $29
	levelup_move 11, $39
	levelup_move 15, $27
	levelup_move 20, $0d
	levelup_move 26, $3e
	levelup_move 33, $3a
	levelup_move 36, $36
	levelup_move 40, $87
	levelup_move 44, $37
	levelup_move 48, $3f
	levelup_move 53, $56
	levelup_move 57, $14
	db $ff
Learnset_42bf:
	levelup_move 4, $13
	levelup_move 7, $1a
	levelup_move 11, $17
	levelup_move 16, $31
	levelup_move 20, $37
	levelup_move 24, $1d
	levelup_move 30, $28
	levelup_move 33, $39
	levelup_move 35, $3c
	levelup_move 37, $8b
	levelup_move 40, $3f
	levelup_move 46, $30
	levelup_move 53, $0e
	levelup_move 60, $4d
	db $ff
Learnset_42dc:
	levelup_move 7, $1f
	levelup_move 10, $2b
	levelup_move 14, $20
	levelup_move 19, $07
	levelup_move 24, $15
	levelup_move 28, $34
	levelup_move 30, $2d
	levelup_move 32, $22
	levelup_move 33, $06
	levelup_move 35, $3e
	levelup_move 40, $35
	levelup_move 45, $16
	levelup_move 52, $3a
	levelup_move 59, $36
	db $ff
Learnset_42f9:
	levelup_move 4, $08
	levelup_move 7, $0d
	levelup_move 12, $23
	levelup_move 18, $29
	levelup_move 21, $2d
	levelup_move 27, $06
	levelup_move 30, $36
	levelup_move 35, $17
	levelup_move 36, $2a
	levelup_move 42, $2e
	levelup_move 47, $31
	levelup_move 55, $3f
	levelup_move 61, $30
	db $ff
Learnset_4314:
	levelup_move 4, $13
	levelup_move 6, $1f
	levelup_move 9, $32
	levelup_move 12, $0b
	levelup_move 15, $3b
	levelup_move 20, $28
	levelup_move 24, $3c
	levelup_move 29, $3d
	levelup_move 30, $24
	levelup_move 33, $35
	levelup_move 38, $36
	levelup_move 42, $12
	levelup_move 48, $20
	levelup_move 56, $3f
	levelup_move 60, $88
	db $ff
Learnset_4333:
	levelup_move 4, $0b
	levelup_move 10, $08
	levelup_move 14, $31
	levelup_move 18, $25
	levelup_move 19, $03
	levelup_move 24, $0d
	levelup_move 25, $19
	levelup_move 30, $29
	levelup_move 39, $35
	levelup_move 42, $83
	levelup_move 48, $38
	levelup_move 54, $35
	levelup_move 59, $62
	db $ff
Learnset_434e:
	levelup_move 3, $13
	levelup_move 8, $15
	levelup_move 11, $27
	levelup_move 14, $10
	levelup_move 17, $36
	levelup_move 18, $26
	levelup_move 25, $0f
	levelup_move 29, $1d
	levelup_move 34, $39
	levelup_move 40, $3e
	levelup_move 45, $0e
	levelup_move 49, $01
	levelup_move 54, $35
	levelup_move 59, $14
	db $ff
Learnset_436b:
	levelup_move 5, $25
	levelup_move 10, $37
	levelup_move 14, $13
	levelup_move 16, $1f
	levelup_move 20, $27
	levelup_move 25, $34
	levelup_move 31, $0c
	levelup_move 34, $2a
	levelup_move 41, $14
	levelup_move 46, $3b
	levelup_move 52, $54
	levelup_move 56, $06
	levelup_move 61, $35
	db $ff
Learnset_4386:
	levelup_move 8, $02
	levelup_move 10, $0b
	levelup_move 13, $31
	levelup_move 18, $1d
	levelup_move 25, $20
	levelup_move 29, $0d
	levelup_move 30, $0f
	levelup_move 38, $0a
	levelup_move 43, $0e
	levelup_move 47, $16
	levelup_move 52, $39
	levelup_move 58, $3e
	db $ff
Learnset_439f:
	levelup_move 4, $25
	levelup_move 7, $1c
	levelup_move 8, $13
	levelup_move 10, $17
	levelup_move 11, $21
	levelup_move 21, $29
	levelup_move 29, $41
	levelup_move 35, $8a
	levelup_move 42, $43
	levelup_move 46, $40
	levelup_move 50, $42
	levelup_move 55, $45
	levelup_move 60, $83
	db $ff
Learnset_43ba:
	levelup_move 6, $13
	levelup_move 11, $40
	levelup_move 16, $1e
	levelup_move 20, $08
	levelup_move 24, $41
	levelup_move 31, $06
	levelup_move 35, $43
	levelup_move 40, $46
	levelup_move 43, $8a
	levelup_move 47, $42
	levelup_move 51, $44
	levelup_move 55, $7a
	levelup_move 57, $7b
	db $ff
Learnset_43d5:
	levelup_move 10, $0c
	levelup_move 16, $15
	levelup_move 18, $41
	levelup_move 21, $19
	levelup_move 25, $0a
	levelup_move 28, $04
	levelup_move 32, $02
	levelup_move 37, $06
	levelup_move 41, $46
	levelup_move 43, $45
	levelup_move 48, $40
	levelup_move 55, $43
	levelup_move 61, $7e
	db $ff
Learnset_43f0:
	levelup_move 3, $0e
	levelup_move 8, $18
	levelup_move 14, $0f
	levelup_move 17, $40
	levelup_move 24, $13
	levelup_move 29, $03
	levelup_move 35, $41
	levelup_move 39, $42
	levelup_move 40, $05
	levelup_move 44, $43
	levelup_move 50, $44
	levelup_move 55, $45
	levelup_move 61, $46
	db $ff
Learnset_440b:
	levelup_move 4, $0c
	levelup_move 10, $30
	levelup_move 15, $41
	levelup_move 18, $03
	levelup_move 21, $7d
	levelup_move 24, $20
	levelup_move 28, $1b
	levelup_move 32, $83
	levelup_move 41, $45
	levelup_move 42, $22
	levelup_move 46, $40
	levelup_move 52, $42
	levelup_move 61, $43
	db $ff
Learnset_4426:
	levelup_move 8, $05
	levelup_move 12, $0b
	levelup_move 15, $03
	levelup_move 24, $21
	levelup_move 28, $24
	levelup_move 30, $40
	levelup_move 37, $7f
	levelup_move 40, $84
	levelup_move 45, $41
	levelup_move 50, $42
	levelup_move 56, $43
	levelup_move 62, $46
	db $ff
Learnset_443f:
	levelup_move 5, $0b
	levelup_move 7, $19
	levelup_move 10, $23
	levelup_move 13, $04
	levelup_move 19, $40
	levelup_move 22, $05
	levelup_move 24, $41
	levelup_move 26, $24
	levelup_move 29, $02
	levelup_move 34, $30
	levelup_move 40, $42
	levelup_move 41, $43
	levelup_move 43, $86
	levelup_move 49, $45
	levelup_move 55, $46
	levelup_move 60, $8a
	db $ff
Learnset_4460:
	levelup_move 5, $13
	levelup_move 10, $40
	levelup_move 13, $0d
	levelup_move 17, $1d
	levelup_move 19, $41
	levelup_move 25, $29
	levelup_move 30, $8a
	levelup_move 34, $43
	levelup_move 42, $46
	levelup_move 46, $42
	levelup_move 51, $45
	levelup_move 57, $7f
	db $ff
Learnset_4479:
	levelup_move 5, $25
	levelup_move 10, $40
	levelup_move 14, $11
	levelup_move 18, $41
	levelup_move 21, $20
	levelup_move 24, $80
	levelup_move 29, $18
	levelup_move 33, $45
	levelup_move 40, $14
	levelup_move 47, $42
	levelup_move 53, $43
	levelup_move 59, $46
	db $ff
Learnset_4492:
	levelup_move 7, $2c
	levelup_move 10, $25
	levelup_move 15, $1f
	levelup_move 19, $27
	levelup_move 20, $0f
	levelup_move 24, $20
	levelup_move 27, $7e
	levelup_move 30, $83
	levelup_move 33, $81
	levelup_move 37, $46
	levelup_move 43, $89
	levelup_move 47, $40
	levelup_move 53, $41
	levelup_move 58, $42
	levelup_move 62, $43
	db $ff
Learnset_44b1:
	levelup_move 6, $25
	levelup_move 12, $1c
	levelup_move 15, $47
	levelup_move 19, $13
	levelup_move 21, $48
	levelup_move 26, $29
	levelup_move 30, $09
	levelup_move 33, $49
	levelup_move 36, $4b
	levelup_move 42, $05
	levelup_move 46, $4a
	levelup_move 51, $4c
	levelup_move 57, $4d
	levelup_move 62, $4e
	db $ff
Learnset_44ce:
	levelup_move 5, $17
	levelup_move 8, $04
	levelup_move 16, $47
	levelup_move 21, $81
	levelup_move 25, $49
	levelup_move 28, $0a
	levelup_move 32, $11
	levelup_move 41, $30
	levelup_move 43, $4b
	levelup_move 48, $48
	levelup_move 55, $4a
	levelup_move 61, $4e
	db $ff
Learnset_44e7:
	levelup_move 5, $0b
	levelup_move 8, $03
	levelup_move 12, $29
	levelup_move 14, $0f
	levelup_move 17, $17
	levelup_move 22, $48
	levelup_move 25, $23
	levelup_move 28, $4b
	levelup_move 29, $49
	levelup_move 32, $0a
	levelup_move 35, $02
	levelup_move 40, $4f
	levelup_move 44, $47
	levelup_move 50, $4a
	levelup_move 56, $4e
	levelup_move 60, $4d
	db $ff
Learnset_4508:
	levelup_move 2, $2c
	levelup_move 7, $13
	levelup_move 13, $47
	levelup_move 16, $49
	levelup_move 24, $15
	levelup_move 26, $4a
	levelup_move 33, $28
	levelup_move 40, $05
	levelup_move 43, $8b
	levelup_move 48, $4b
	levelup_move 54, $4d
	levelup_move 62, $4f
	db $ff
Learnset_4521:
	levelup_move 4, $17
	levelup_move 8, $20
	levelup_move 10, $08
	levelup_move 15, $04
	levelup_move 21, $4c
	levelup_move 24, $0b
	levelup_move 25, $4d
	levelup_move 30, $24
	levelup_move 33, $0a
	levelup_move 39, $8b
	levelup_move 43, $47
	levelup_move 48, $48
	levelup_move 53, $4a
	levelup_move 59, $4e
	db $ff
Learnset_453e:
	levelup_move 5, $0d
	levelup_move 8, $47
	levelup_move 12, $0c
	levelup_move 19, $48
	levelup_move 24, $0f
	levelup_move 38, $4e
	levelup_move 44, $4b
	levelup_move 45, $8b
	levelup_move 50, $4a
	levelup_move 53, $4d
	levelup_move 61, $4f
	db $ff
Learnset_4555:
	levelup_move 8, $7c
	levelup_move 15, $12
	levelup_move 20, $18
	levelup_move 23, $30
	levelup_move 29, $49
	levelup_move 35, $89
	levelup_move 42, $82
	levelup_move 47, $4a
	levelup_move 53, $4e
	levelup_move 59, $4f
	levelup_move 62, $4d
	db $ff
Learnset_456c:
	levelup_move 3, $0c
	levelup_move 8, $13
	levelup_move 15, $03
	levelup_move 18, $0b
	levelup_move 20, $47
	levelup_move 25, $08
	levelup_move 29, $49
	levelup_move 31, $29
	levelup_move 34, $12
	levelup_move 36, $4b
	levelup_move 41, $4c
	levelup_move 45, $48
	levelup_move 51, $4a
	levelup_move 56, $4d
	levelup_move 63, $4e
	db $ff
Learnset_458b:
	levelup_move 5, $0f
	levelup_move 11, $0e
	levelup_move 17, $09
	levelup_move 25, $48
	levelup_move 30, $13
	levelup_move 36, $4a
	levelup_move 45, $7f
	levelup_move 49, $49
	levelup_move 54, $4b
	levelup_move 58, $4c
	levelup_move 61, $4d
	db $ff
Learnset_45a2:
	levelup_move 4, $13
	levelup_move 10, $47
	levelup_move 18, $7c
	levelup_move 25, $48
	levelup_move 29, $29
	levelup_move 33, $06
	levelup_move 37, $4a
	levelup_move 41, $82
	levelup_move 45, $4b
	levelup_move 51, $49
	levelup_move 56, $4c
	levelup_move 60, $4d
	levelup_move 62, $4e
	db $ff
Learnset_45bd:
	levelup_move 10, $0b
	levelup_move 16, $17
	levelup_move 21, $23
	levelup_move 24, $1d
	levelup_move 25, $5e
	levelup_move 29, $12
	levelup_move 31, $66
	levelup_move 34, $06
	levelup_move 37, $28
	levelup_move 43, $62
	levelup_move 46, $5d
	levelup_move 51, $60
	levelup_move 56, $61
	levelup_move 60, $64
	db $ff
Learnset_45da:
	levelup_move 3, $13
	levelup_move 9, $08
	levelup_move 14, $7e
	levelup_move 20, $18
	levelup_move 24, $64
	levelup_move 26, $16
	levelup_move 37, $63
	levelup_move 42, $61
	levelup_move 47, $62
	levelup_move 53, $65
	levelup_move 59, $66
	db $ff
Learnset_45f1:
	levelup_move 3, $13
	levelup_move 9, $5d
	levelup_move 14, $27
	levelup_move 18, $63
	levelup_move 20, $32
	levelup_move 26, $77
	levelup_move 30, $11
	levelup_move 34, $33
	levelup_move 39, $7f
	levelup_move 43, $61
	levelup_move 45, $5e
	levelup_move 51, $5f
	levelup_move 58, $65
	levelup_move 63, $66
	db $ff
Learnset_460e:
	levelup_move 5, $60
	levelup_move 9, $10
	levelup_move 13, $13
	levelup_move 19, $80
	levelup_move 25, $65
	levelup_move 27, $0f
	levelup_move 30, $28
	levelup_move 33, $0d
	levelup_move 36, $5f
	levelup_move 40, $61
	levelup_move 42, $5d
	levelup_move 49, $5e
	levelup_move 54, $62
	levelup_move 58, $63
	db $ff
Learnset_462b:
	levelup_move 8, $25
	levelup_move 18, $5f
	levelup_move 21, $17
	levelup_move 25, $80
	levelup_move 27, $60
	levelup_move 34, $81
	levelup_move 36, $1d
	levelup_move 42, $83
	levelup_move 47, $5d
	levelup_move 51, $61
	levelup_move 54, $2d
	levelup_move 60, $2f
	db $ff
Learnset_4644:
	levelup_move 3, $25
	levelup_move 7, $66
	levelup_move 11, $5d
	levelup_move 13, $0c
	levelup_move 16, $15
	levelup_move 20, $20
	levelup_move 24, $02
	levelup_move 28, $7e
	levelup_move 34, $81
	levelup_move 45, $7c
	levelup_move 50, $80
	levelup_move 56, $83
	levelup_move 60, $16
	db $ff
Learnset_465f:
	levelup_move 5, $17
	levelup_move 9, $1f
	levelup_move 14, $5d
	levelup_move 19, $29
	levelup_move 22, $5e
	levelup_move 25, $08
	levelup_move 30, $5f
	levelup_move 37, $60
	levelup_move 40, $24
	levelup_move 42, $61
	levelup_move 45, $64
	levelup_move 50, $62
	levelup_move 55, $66
	levelup_move 59, $63
	db $ff
Learnset_467c:
	levelup_move 10, $13
	levelup_move 14, $5d
	levelup_move 20, $23
	levelup_move 26, $65
	levelup_move 29, $28
	levelup_move 31, $0a
	levelup_move 33, $61
	levelup_move 37, $63
	levelup_move 42, $62
	levelup_move 47, $81
	levelup_move 51, $14
	levelup_move 54, $27
	db $ff
Learnset_4695:
	levelup_move 3, $18
	levelup_move 8, $64
	levelup_move 12, $80
	levelup_move 15, $29
	levelup_move 16, $65
	levelup_move 22, $0d
	levelup_move 28, $66
	levelup_move 33, $63
	levelup_move 40, $5f
	levelup_move 43, $62
	levelup_move 49, $61
	levelup_move 53, $60
	levelup_move 59, $5e
	db $ff
Learnset_46b0:
	levelup_move 5, $13
	levelup_move 10, $66
	levelup_move 14, $25
	levelup_move 16, $5d
	levelup_move 21, $27
	levelup_move 25, $0f
	levelup_move 30, $86
	levelup_move 34, $60
	levelup_move 39, $64
	levelup_move 43, $7e
	levelup_move 47, $61
	levelup_move 52, $62
	levelup_move 56, $65
	levelup_move 61, $6e
	db $ff
Learnset_46cd:
	levelup_move 5, $08
	levelup_move 10, $15
	levelup_move 13, $86
	levelup_move 16, $25
	levelup_move 19, $72
	levelup_move 24, $07
	levelup_move 27, $84
	levelup_move 30, $20
	levelup_move 34, $7a
	levelup_move 35, $7b
	levelup_move 40, $73
	levelup_move 45, $74
	levelup_move 51, $75
	levelup_move 59, $76
	levelup_move 62, $16
	db $ff
Learnset_46ec:
	levelup_move 5, $1e
	levelup_move 8, $08
	levelup_move 12, $29
	levelup_move 14, $03
	levelup_move 17, $18
	levelup_move 19, $72
	levelup_move 24, $73
	levelup_move 26, $05
	levelup_move 30, $24
	levelup_move 34, $74
	levelup_move 38, $05
	levelup_move 43, $22
	levelup_move 47, $75
	levelup_move 51, $76
	levelup_move 55, $7a
	levelup_move 57, $7b
	db $ff
Learnset_470d:
	levelup_move 10, $07
	levelup_move 15, $7e
	levelup_move 21, $81
	levelup_move 26, $28
	levelup_move 34, $1b
	levelup_move 38, $76
	levelup_move 43, $7a
	levelup_move 46, $70
	levelup_move 51, $86
	levelup_move 56, $89
	levelup_move 60, $72
	db $ff
Learnset_4724:
	levelup_move 11, $03
	levelup_move 16, $7c
	levelup_move 19, $72
	levelup_move 25, $73
	levelup_move 26, $0b
	levelup_move 30, $74
	levelup_move 33, $7f
	levelup_move 36, $75
	levelup_move 42, $76
	levelup_move 46, $08
	levelup_move 52, $16
	levelup_move 57, $27
	levelup_move 61, $84
	db $ff
Learnset_473f:
	levelup_move 10, $1e
	levelup_move 16, $0b
	levelup_move 24, $16
	levelup_move 33, $7a
	levelup_move 35, $7b
	levelup_move 39, $24
	levelup_move 40, $14
	levelup_move 42, $84
	levelup_move 44, $82
	levelup_move 48, $72
	levelup_move 53, $73
	levelup_move 59, $74
	db $ff
Learnset_4758:
	levelup_move 10, $72
	levelup_move 16, $7c
	levelup_move 25, $73
	levelup_move 31, $0a
	levelup_move 33, $74
	levelup_move 36, $89
	levelup_move 43, $88
	levelup_move 49, $75
	levelup_move 55, $76
	levelup_move 60, $26
	db $ff
Learnset_476d:
	levelup_move 11, $1a
	levelup_move 14, $17
	levelup_move 17, $11
	levelup_move 19, $03
	levelup_move 24, $7a
	levelup_move 34, $12
	levelup_move 38, $7b
	levelup_move 44, $75
	levelup_move 49, $72
	levelup_move 54, $73
	levelup_move 58, $74
	levelup_move 62, $76
	db $ff
Learnset_4786:
	levelup_move 7, $08
	levelup_move 16, $20
	levelup_move 20, $27
	levelup_move 24, $6f
	levelup_move 28, $73
	levelup_move 32, $86
	levelup_move 36, $7a
	levelup_move 40, $7b
	levelup_move 42, $70
	levelup_move 47, $7e
	levelup_move 51, $72
	levelup_move 57, $76
	db $ff
Learnset_479f:
	levelup_move 4, $27
	levelup_move 10, $0b
	levelup_move 18, $72
	levelup_move 20, $6e
	levelup_move 24, $42
	levelup_move 30, $73
	levelup_move 35, $74
	levelup_move 41, $76
	levelup_move 46, $0e
	levelup_move 51, $14
	levelup_move 56, $16
	levelup_move 61, $75
	db $ff
Learnset_47b8:
	levelup_move 6, $13
	levelup_move 12, $03
	levelup_move 16, $23
	levelup_move 18, $04
	levelup_move 20, $0f
	levelup_move 25, $28
	levelup_move 33, $05
	levelup_move 40, $75
	levelup_move 44, $72
	levelup_move 49, $73
	levelup_move 56, $74
	levelup_move 63, $77
	db $ff
Learnset_47d1:
	levelup_move 7, $13
	levelup_move 16, $50
	levelup_move 22, $0e
	levelup_move 25, $28
	levelup_move 27, $0a
	levelup_move 29, $29
	levelup_move 34, $52
	levelup_move 43, $54
	levelup_move 49, $51
	levelup_move 56, $53
	levelup_move 62, $55
	db $ff
Learnset_47e8:
	levelup_move 4, $0c
	levelup_move 11, $10
	levelup_move 16, $53
	levelup_move 24, $0d
	levelup_move 31, $52
	levelup_move 37, $56
	levelup_move 45, $83
	levelup_move 49, $50
	levelup_move 53, $51
	levelup_move 57, $54
	levelup_move 63, $55
	db $ff
Learnset_47ff:
	levelup_move 9, $50
	levelup_move 15, $51
	levelup_move 21, $52
	levelup_move 28, $53
	levelup_move 34, $54
	levelup_move 40, $55
	levelup_move 45, $56
	levelup_move 48, $04
	levelup_move 51, $06
	levelup_move 55, $1a
	levelup_move 61, $6c
	db $ff
Learnset_4816:
	levelup_move 6, $25
	levelup_move 14, $15
	levelup_move 20, $0e
	levelup_move 22, $51
	levelup_move 27, $0a
	levelup_move 30, $52
	levelup_move 35, $54
	levelup_move 42, $56
	levelup_move 48, $53
	levelup_move 55, $55
	levelup_move 60, $14
	db $ff
Learnset_482d:
	levelup_move 6, $1a
	levelup_move 12, $24
	levelup_move 15, $15
	levelup_move 17, $50
	levelup_move 21, $51
	levelup_move 26, $0b
	levelup_move 28, $52
	levelup_move 35, $24
	levelup_move 43, $53
	levelup_move 49, $54
	levelup_move 55, $55
	levelup_move 61, $56
	db $ff
Learnset_4846:
	levelup_move 10, $15
	levelup_move 16, $51
	levelup_move 19, $52
	levelup_move 21, $53
	levelup_move 23, $54
	levelup_move 24, $12
	levelup_move 26, $03
	levelup_move 30, $55
	levelup_move 33, $56
	levelup_move 40, $7f
	levelup_move 42, $82
	levelup_move 46, $06
	levelup_move 51, $1a
	levelup_move 56, $24
	levelup_move 60, $28
	db $ff
Learnset_4865:
	levelup_move 11, $50
	levelup_move 20, $1d
	levelup_move 26, $51
	levelup_move 31, $52
	levelup_move 36, $28
	levelup_move 40, $53
	levelup_move 43, $54
	levelup_move 47, $55
	levelup_move 53, $56
	levelup_move 59, $05
	db $ff
Learnset_487a:
	levelup_move 8, $07
	levelup_move 16, $0f
	levelup_move 20, $13
	levelup_move 22, $02
	levelup_move 25, $29
	levelup_move 26, $0a
	levelup_move 31, $0b
	levelup_move 36, $26
	levelup_move 40, $54
	levelup_move 45, $50
	levelup_move 49, $51
	levelup_move 52, $52
	levelup_move 57, $53
	levelup_move 61, $55
	levelup_move 64, $56
	db $ff
Learnset_4899:
	levelup_move 6, $25
	levelup_move 13, $50
	levelup_move 16, $7e
	levelup_move 20, $51
	levelup_move 24, $86
	levelup_move 29, $52
	levelup_move 33, $28
	levelup_move 40, $53
	levelup_move 45, $2f
	levelup_move 49, $54
	levelup_move 54, $55
	levelup_move 59, $56
	db $ff
Learnset_48b2:
	levelup_move 4, $13
	levelup_move 8, $50
	levelup_move 14, $0e
	levelup_move 19, $0c
	levelup_move 21, $21
	levelup_move 24, $28
	levelup_move 28, $51
	levelup_move 34, $52
	levelup_move 42, $22
	levelup_move 46, $53
	levelup_move 50, $54
	levelup_move 55, $55
	levelup_move 60, $56
	db $ff
Learnset_48cd:
	levelup_move 4, $0c
	levelup_move 11, $0e
	levelup_move 17, $03
	levelup_move 24, $21
	levelup_move 27, $28
	levelup_move 29, $67
	levelup_move 31, $06
	levelup_move 34, $87
	levelup_move 36, $68
	levelup_move 44, $22
	levelup_move 49, $5a
	levelup_move 53, $69
	levelup_move 58, $6a
	levelup_move 62, $6b
	db $ff
Learnset_48ea:
	levelup_move 5, $2c
	levelup_move 10, $1e
	levelup_move 16, $25
	levelup_move 26, $69
	levelup_move 35, $88
	levelup_move 43, $6a
	levelup_move 45, $67
	levelup_move 50, $6b
	levelup_move 54, $70
	levelup_move 60, $6c
	db $ff
Learnset_48ff:
	levelup_move 3, $08
	levelup_move 9, $1a
	levelup_move 14, $25
	levelup_move 18, $29
	levelup_move 20, $67
	levelup_move 25, $13
	levelup_move 29, $68
	levelup_move 33, $6a
	levelup_move 38, $06
	levelup_move 44, $6b
	levelup_move 49, $69
	levelup_move 53, $6e
	levelup_move 59, $6c
	levelup_move 62, $71
	db $ff
Learnset_491c:
	levelup_move 3, $0d
	levelup_move 9, $1d
	levelup_move 14, $71
	levelup_move 19, $28
	levelup_move 21, $86
	levelup_move 25, $6e
	levelup_move 28, $29
	levelup_move 29, $0a
	levelup_move 32, $69
	levelup_move 36, $5a
	levelup_move 40, $89
	levelup_move 45, $6c
	levelup_move 49, $68
	levelup_move 54, $6a
	levelup_move 59, $6b
	levelup_move 62, $6d
	db $ff
Learnset_493d:
	levelup_move 7, $6e
	levelup_move 16, $1f
	levelup_move 25, $69
	levelup_move 30, $71
	levelup_move 33, $06
	levelup_move 37, $05
	levelup_move 42, $6a
	levelup_move 47, $6b
	levelup_move 53, $6c
	levelup_move 58, $70
	levelup_move 62, $5a
	db $ff
Learnset_4954:
	levelup_move 6, $0c
	levelup_move 9, $67
	levelup_move 14, $68
	levelup_move 21, $28
	levelup_move 24, $08
	levelup_move 28, $69
	levelup_move 33, $29
	levelup_move 37, $6f
	levelup_move 42, $89
	levelup_move 45, $6b
	levelup_move 50, $6a
	levelup_move 55, $70
	levelup_move 60, $6c
	db $ff
Learnset_496f:
	levelup_move 5, $13
	levelup_move 9, $6d
	levelup_move 14, $6f
	levelup_move 16, $71
	levelup_move 21, $69
	levelup_move 26, $25
	levelup_move 33, $6e
	levelup_move 43, $83
	levelup_move 47, $5a
	levelup_move 51, $6a
	levelup_move 56, $6b
	levelup_move 61, $6c
	db $ff
Learnset_4988:
	levelup_move 6, $68
	levelup_move 12, $0c
	levelup_move 17, $03
	levelup_move 22, $69
	levelup_move 25, $5a
	levelup_move 30, $86
	levelup_move 33, $6e
	levelup_move 38, $18
	levelup_move 45, $6b
	levelup_move 49, $6a
	levelup_move 53, $5a
	levelup_move 58, $6c
	levelup_move 62, $70
	db $ff
Learnset_49a3:
	levelup_move 6, $1d
	levelup_move 10, $7e
	levelup_move 17, $81
	levelup_move 20, $7c
	levelup_move 24, $0a
	levelup_move 33, $86
	levelup_move 38, $82
	levelup_move 45, $6a
	levelup_move 51, $69
	levelup_move 56, $6b
	levelup_move 60, $1b
	db $ff
Learnset_49ba:
	levelup_move 8, $70
	levelup_move 14, $68
	levelup_move 23, $08
	levelup_move 28, $41
	levelup_move 34, $85
	levelup_move 39, $6b
	levelup_move 44, $7f
	levelup_move 49, $67
	levelup_move 51, $6e
	levelup_move 55, $69
	levelup_move 61, $6c
	db $ff
Learnset_49d1:
	levelup_move 8, $25
	levelup_move 11, $09
	levelup_move 15, $13
	levelup_move 22, $84
	levelup_move 25, $16
	levelup_move 31, $7d
	levelup_move 35, $57
	levelup_move 45, $79
	levelup_move 48, $77
	levelup_move 54, $78
	levelup_move 57, $5c
	levelup_move 62, $5b
	db $ff
Learnset_49ea:
	levelup_move 7, $13
	levelup_move 14, $57
	levelup_move 18, $09
	levelup_move 20, $23
	levelup_move 24, $58
	levelup_move 25, $27
	levelup_move 28, $0b
	levelup_move 29, $59
	levelup_move 30, $11
	levelup_move 32, $5b
	levelup_move 38, $5c
	levelup_move 44, $78
	levelup_move 49, $5a
	levelup_move 55, $22
	levelup_move 62, $14
	db $ff
Learnset_4a09:
	levelup_move 3, $25
	levelup_move 7, $08
	levelup_move 9, $15
	levelup_move 14, $1d
	levelup_move 16, $57
	levelup_move 24, $7e
	levelup_move 33, $82
	levelup_move 38, $79
	levelup_move 40, $7f
	levelup_move 43, $58
	levelup_move 49, $59
	levelup_move 54, $5c
	levelup_move 59, $5b
	levelup_move 63, $77
	db $ff
Learnset_4a26:
	levelup_move 6, $13
	levelup_move 12, $1f
	levelup_move 15, $25
	levelup_move 25, $7d
	levelup_move 27, $77
	levelup_move 35, $58
	levelup_move 43, $7f
	levelup_move 48, $57
	levelup_move 53, $59
	levelup_move 59, $6d
	levelup_move 62, $5b
	db $ff
Learnset_4a3d:
	levelup_move 14, $03
	levelup_move 18, $25
	levelup_move 20, $57
	levelup_move 25, $30
	levelup_move 28, $58
	levelup_move 33, $0a
	levelup_move 35, $59
	levelup_move 38, $08
	levelup_move 39, $5a
	levelup_move 43, $8c
	levelup_move 49, $5c
	levelup_move 55, $5b
	levelup_move 61, $83
	db $ff
Learnset_4a58:
	levelup_move 4, $08
	levelup_move 11, $09
	levelup_move 16, $25
	levelup_move 19, $49
	levelup_move 22, $57
	levelup_move 26, $4b
	levelup_move 30, $86
	levelup_move 35, $59
	levelup_move 41, $82
	levelup_move 43, $83
	levelup_move 46, $49
	levelup_move 53, $4b
	levelup_move 60, $4f
	db $ff
Learnset_4a73:
	levelup_move 6, $0c
	levelup_move 11, $80
	levelup_move 15, $17
	levelup_move 18, $58
	levelup_move 25, $7c
	levelup_move 26, $28
	levelup_move 30, $5c
	levelup_move 38, $0a
	levelup_move 40, $78
	levelup_move 43, $57
	levelup_move 49, $59
	levelup_move 54, $5c
	levelup_move 59, $5b
	levelup_move 62, $5a
	db $ff
Learnset_4a90:
	levelup_move 9, $03
	levelup_move 12, $0b
	levelup_move 14, $32
	levelup_move 21, $77
	levelup_move 25, $3b
	levelup_move 27, $3e
	levelup_move 31, $33
	levelup_move 34, $29
	levelup_move 36, $05
	levelup_move 39, $3d
	levelup_move 42, $3c
	levelup_move 44, $57
	levelup_move 49, $58
	levelup_move 55, $59
	levelup_move 61, $5b
	db $ff
Learnset_4aaf:
	levelup_move 6, $0b
	levelup_move 17, $03
	levelup_move 20, $08
	levelup_move 24, $17
	levelup_move 26, $57
	levelup_move 30, $23
	levelup_move 33, $0f
	levelup_move 37, $02
	levelup_move 41, $05
	levelup_move 45, $83
	levelup_move 50, $58
	levelup_move 56, $59
	levelup_move 61, $5c
	levelup_move 64, $5b
	db $ff
Learnset_4acc:
	levelup_move 9, $5c
	levelup_move 11, $80
	levelup_move 16, $57
	levelup_move 20, $86
	levelup_move 23, $77
	levelup_move 25, $59
	levelup_move 33, $14
	levelup_move 45, $5a
	levelup_move 49, $58
	levelup_move 56, $5c
	levelup_move 61, $5b
	db $ff
Learnset_4ae3:
	levelup_move 4, $17
	levelup_move 7, $02
	levelup_move 10, $25
	levelup_move 15, $2d
	levelup_move 19, $3e
	levelup_move 24, $18
	levelup_move 27, $2a
	levelup_move 35, $2f
	levelup_move 42, $2e
	levelup_move 47, $30
	levelup_move 51, $31
	levelup_move 56, $35
	levelup_move 62, $39
	db $ff
Learnset_4afe:
	levelup_move 5, $08
	levelup_move 13, $31
	levelup_move 19, $27
	levelup_move 25, $87
	levelup_move 28, $0d
	levelup_move 30, $11
	levelup_move 40, $32
	levelup_move 45, $38
	levelup_move 49, $04
	levelup_move 54, $0a
	levelup_move 60, $26
	db $ff
Learnset_4b15:
	levelup_move 10, $13
	levelup_move 16, $28
	levelup_move 24, $16
	levelup_move 29, $20
	levelup_move 35, $0a
	levelup_move 38, $36
	levelup_move 41, $22
	levelup_move 46, $39
	levelup_move 51, $3e
	levelup_move 56, $3f
	levelup_move 61, $0e
	db $ff
Learnset_4b2c:
	levelup_move 3, $80
	levelup_move 10, $31
	levelup_move 16, $7e
	levelup_move 20, $25
	levelup_move 24, $0f
	levelup_move 29, $3f
	levelup_move 36, $0e
	levelup_move 42, $88
	levelup_move 47, $16
	levelup_move 52, $02
	levelup_move 58, $23
	levelup_move 61, $34
	db $ff
Learnset_4b45:
	levelup_move 3, $1d
	levelup_move 7, $31
	levelup_move 15, $34
	levelup_move 19, $10
	levelup_move 25, $86
	levelup_move 31, $02
	levelup_move 36, $83
	levelup_move 40, $29
	levelup_move 42, $3e
	levelup_move 44, $89
	levelup_move 49, $0e
	levelup_move 53, $3f
	levelup_move 58, $3e
	levelup_move 62, $39
	db $ff
Learnset_4b62:
	levelup_move 4, $13
	levelup_move 10, $19
	levelup_move 16, $18
	levelup_move 20, $22
	levelup_move 25, $3b
	levelup_move 28, $0a
	levelup_move 34, $3c
	levelup_move 40, $24
	levelup_move 43, $05
	levelup_move 48, $31
	levelup_move 52, $30
	levelup_move 56, $32
	levelup_move 63, $3a
	db $ff
Learnset_4b7d:
	levelup_move 6, $0b
	levelup_move 10, $31
	levelup_move 18, $13
	levelup_move 24, $3f
	levelup_move 27, $32
	levelup_move 29, $27
	levelup_move 31, $0a
	levelup_move 33, $3d
	levelup_move 35, $28
	levelup_move 39, $16
	levelup_move 43, $8a
	levelup_move 46, $34
	levelup_move 51, $35
	levelup_move 56, $3a
	levelup_move 61, $3d
	db $ff
Learnset_4b9c:
	levelup_move 10, $08
	levelup_move 20, $04
	levelup_move 24, $0d
	levelup_move 29, $12
	levelup_move 30, $2a
	levelup_move 33, $2f
	levelup_move 39, $35
	levelup_move 43, $0a
	levelup_move 48, $0e
	levelup_move 52, $3c
	levelup_move 59, $4f
	db $ff
Learnset_4bb3:
	levelup_move 9, $47
	levelup_move 12, $34
	levelup_move 17, $0e
	levelup_move 20, $25
	levelup_move 25, $15
	levelup_move 29, $0d
	levelup_move 30, $3a
	levelup_move 34, $81
	levelup_move 38, $3e
	levelup_move 44, $89
	levelup_move 49, $67
	levelup_move 54, $86
	levelup_move 60, $82
	db $ff
Learnset_4bce:
	levelup_move 8, $86
	levelup_move 16, $0f
	levelup_move 22, $25
	levelup_move 27, $41
	levelup_move 34, $42
	levelup_move 38, $43
	levelup_move 42, $88
	levelup_move 43, $45
	levelup_move 48, $40
	levelup_move 53, $0e
	levelup_move 59, $28
	db $ff
Learnset_4be5:
	levelup_move 10, $1e
	levelup_move 15, $40
	levelup_move 20, $28
	levelup_move 25, $07
	levelup_move 30, $86
	levelup_move 35, $11
	levelup_move 40, $22
	levelup_move 45, $8a
	levelup_move 50, $41
	levelup_move 55, $43
	levelup_move 60, $44
	levelup_move 63, $45
	db $ff
Learnset_4bfe:
	levelup_move 3, $0c
	levelup_move 9, $1a
	levelup_move 11, $40
	levelup_move 14, $41
	levelup_move 23, $30
	levelup_move 25, $18
	levelup_move 30, $12
	levelup_move 34, $46
	levelup_move 38, $24
	levelup_move 40, $42
	levelup_move 43, $43
	levelup_move 56, $45
	levelup_move 61, $3d
	db $ff
Learnset_4c19:
	levelup_move 8, $0b
	levelup_move 19, $0f
	levelup_move 21, $23
	levelup_move 24, $0d
	levelup_move 28, $42
	levelup_move 34, $0a
	levelup_move 38, $24
	levelup_move 42, $83
	levelup_move 47, $41
	levelup_move 52, $2d
	levelup_move 58, $43
	levelup_move 61, $8a
	db $ff
Learnset_4c32:
	levelup_move 4, $0c
	levelup_move 7, $08
	levelup_move 10, $50
	levelup_move 15, $0b
	levelup_move 24, $21
	levelup_move 27, $28
	levelup_move 33, $41
	levelup_move 40, $24
	levelup_move 45, $40
	levelup_move 49, $42
	levelup_move 54, $43
	levelup_move 61, $0e
	db $ff
Learnset_4c4b:
	levelup_move 7, $40
	levelup_move 9, $41
	levelup_move 13, $42
	levelup_move 16, $86
	levelup_move 19, $43
	levelup_move 20, $10
	levelup_move 28, $44
	levelup_move 31, $82
	levelup_move 34, $83
	levelup_move 38, $45
	levelup_move 43, $46
	levelup_move 48, $8a
	levelup_move 54, $11
	levelup_move 60, $0a
	db $ff
Learnset_4c68:
	levelup_move 10, $02
	levelup_move 16, $27
	levelup_move 22, $80
	levelup_move 26, $81
	levelup_move 33, $83
	levelup_move 37, $05
	levelup_move 40, $14
	levelup_move 43, $8a
	levelup_move 47, $40
	levelup_move 52, $41
	levelup_move 58, $42
	levelup_move 62, $61
	db $ff
Learnset_4c81:
	levelup_move 8, $11
	levelup_move 14, $0f
	levelup_move 16, $23
	levelup_move 18, $41
	levelup_move 20, $7e
	levelup_move 24, $28
	levelup_move 26, $42
	levelup_move 28, $0d
	levelup_move 30, $02
	levelup_move 31, $05
	levelup_move 33, $06
	levelup_move 38, $43
	levelup_move 43, $44
	levelup_move 47, $40
	levelup_move 53, $46
	levelup_move 60, $39
	db $ff
Learnset_4ca2:
	levelup_move 10, $08
	levelup_move 12, $40
	levelup_move 19, $0d
	levelup_move 25, $3d
	levelup_move 33, $29
	levelup_move 39, $3a
	levelup_move 43, $43
	levelup_move 49, $41
	levelup_move 54, $42
	levelup_move 59, $45
	levelup_move 63, $46
	db $ff
Learnset_4cb9:
	levelup_move 8, $0b
	levelup_move 15, $47
	levelup_move 22, $4b
	levelup_move 29, $24
	levelup_move 31, $12
	levelup_move 33, $8b
	levelup_move 40, $4f
	levelup_move 44, $48
	levelup_move 49, $49
	levelup_move 54, $4a
	levelup_move 58, $4d
	levelup_move 62, $4e
	db $ff
Learnset_4cd2:
	levelup_move 8, $3c
	levelup_move 26, $4d
	levelup_move 30, $24
	levelup_move 36, $4e
	levelup_move 40, $83
	levelup_move 44, $4f
	levelup_move 49, $4c
	levelup_move 53, $3c
	levelup_move 59, $49
	levelup_move 62, $30
	db $ff
Learnset_4ce7:
	levelup_move 4, $25
	levelup_move 9, $49
	levelup_move 15, $7c
	levelup_move 20, $15
	levelup_move 26, $80
	levelup_move 31, $06
	levelup_move 37, $4b
	levelup_move 42, $83
	levelup_move 46, $47
	levelup_move 50, $48
	levelup_move 56, $4a
	levelup_move 60, $4c
	levelup_move 64, $4d
	db $ff
Learnset_4d02:
	levelup_move 7, $48
	levelup_move 14, $49
	levelup_move 19, $4a
	levelup_move 21, $11
	levelup_move 24, $0d
	levelup_move 29, $1d
	levelup_move 30, $4b
	levelup_move 36, $81
	levelup_move 39, $82
	levelup_move 44, $88
	levelup_move 49, $4c
	levelup_move 53, $4d
	levelup_move 58, $4e
	levelup_move 61, $4f
	db $ff
Learnset_4d1f:
	levelup_move 5, $25
	levelup_move 12, $09
	levelup_move 19, $6e
	levelup_move 20, $01
	levelup_move 25, $47
	levelup_move 32, $70
	levelup_move 45, $49
	levelup_move 50, $48
	levelup_move 54, $4a
	levelup_move 59, $4b
	levelup_move 62, $4c
	db $ff
Learnset_4d36:
	levelup_move 6, $47
	levelup_move 13, $25
	levelup_move 18, $73
	levelup_move 20, $0c
	levelup_move 24, $0a
	levelup_move 27, $4d
	levelup_move 30, $11
	levelup_move 33, $4c
	levelup_move 42, $4e
	levelup_move 47, $48
	levelup_move 50, $49
	levelup_move 55, $4a
	levelup_move 61, $4b
	db $ff
Learnset_4d51:
	levelup_move 3, $0c
	levelup_move 9, $0f
	levelup_move 15, $29
	levelup_move 22, $47
	levelup_move 26, $86
	levelup_move 31, $49
	levelup_move 35, $4d
	levelup_move 40, $6e
	levelup_move 43, $4f
	levelup_move 48, $48
	levelup_move 52, $4a
	levelup_move 56, $4b
	levelup_move 61, $4c
	levelup_move 65, $4e
	db $ff
Learnset_4d6e:
	levelup_move 5, $2b
	levelup_move 9, $4c
	levelup_move 14, $3c
	levelup_move 17, $17
	levelup_move 25, $48
	levelup_move 30, $32
	levelup_move 37, $20
	levelup_move 42, $4e
	levelup_move 46, $47
	levelup_move 50, $49
	levelup_move 53, $4a
	levelup_move 58, $4b
	levelup_move 62, $4f
	db $ff
Learnset_4d89:
	levelup_move 4, $0c
	levelup_move 9, $25
	levelup_move 13, $1f
	levelup_move 16, $1b
	levelup_move 19, $29
	levelup_move 21, $7e
	levelup_move 26, $80
	levelup_move 32, $14
	levelup_move 35, $20
	levelup_move 40, $4b
	levelup_move 44, $48
	levelup_move 48, $49
	levelup_move 52, $4a
	levelup_move 56, $4c
	levelup_move 60, $4d
	db $ff
Learnset_4da8:
	levelup_move 4, $13
	levelup_move 15, $57
	levelup_move 17, $25
	levelup_move 24, $0f
	levelup_move 28, $58
	levelup_move 31, $23
	levelup_move 38, $6d
	levelup_move 44, $87
	levelup_move 49, $61
	levelup_move 54, $62
	levelup_move 58, $59
	levelup_move 62, $5b
	db $ff
Learnset_4dc1:
	levelup_move 9, $5d
	levelup_move 17, $25
	levelup_move 26, $0c
	levelup_move 29, $5f
	levelup_move 31, $24
	levelup_move 34, $63
	levelup_move 40, $77
	levelup_move 45, $8c
	levelup_move 50, $0a
	levelup_move 55, $16
	levelup_move 60, $20
	db $ff
Learnset_4dd8:
	levelup_move 5, $60
	levelup_move 8, $29
	levelup_move 11, $5f
	levelup_move 15, $5e
	levelup_move 20, $6d
	levelup_move 26, $66
	levelup_move 33, $65
	levelup_move 41, $64
	levelup_move 45, $87
	levelup_move 49, $5d
	levelup_move 54, $61
	levelup_move 59, $62
	levelup_move 62, $63
	db $ff
Learnset_4df3:
	levelup_move 4, $13
	levelup_move 7, $09
	levelup_move 11, $17
	levelup_move 16, $66
	levelup_move 20, $5e
	levelup_move 24, $1d
	levelup_move 30, $28
	levelup_move 35, $60
	levelup_move 40, $7e
	levelup_move 41, $82
	levelup_move 44, $54
	levelup_move 49, $5d
	levelup_move 55, $5f
	levelup_move 58, $61
	levelup_move 62, $62
	db $ff
Learnset_4e12:
	levelup_move 10, $0b
	levelup_move 16, $17
	levelup_move 21, $23
	levelup_move 24, $1d
	levelup_move 25, $5e
	levelup_move 29, $12
	levelup_move 31, $66
	levelup_move 34, $06
	levelup_move 37, $28
	levelup_move 43, $62
	levelup_move 49, $5d
	levelup_move 56, $5f
	levelup_move 61, $61
	db $ff
Learnset_4e2d:
	levelup_move 8, $25
	levelup_move 18, $5f
	levelup_move 21, $17
	levelup_move 25, $80
	levelup_move 27, $60
	levelup_move 34, $81
	levelup_move 36, $1d
	levelup_move 42, $83
	levelup_move 45, $35
	levelup_move 51, $37
	levelup_move 56, $39
	levelup_move 61, $3a
	db $ff
Learnset_4e46:
	levelup_move 3, $13
	levelup_move 9, $08
	levelup_move 14, $7e
	levelup_move 20, $18
	levelup_move 24, $64
	levelup_move 26, $16
	levelup_move 37, $63
	levelup_move 42, $61
	levelup_move 48, $65
	levelup_move 55, $62
	levelup_move 60, $66
	db $ff
Learnset_4e5d:
	levelup_move 4, $13
	levelup_move 15, $57
	levelup_move 17, $25
	levelup_move 24, $0f
	levelup_move 28, $58
	levelup_move 31, $23
	levelup_move 38, $6d
	levelup_move 44, $87
	levelup_move 50, $5c
	levelup_move 54, $61
	levelup_move 59, $62
	levelup_move 61, $86
	db $ff
Learnset_4e76:
	levelup_move 10, $0b
	levelup_move 16, $17
	levelup_move 21, $23
	levelup_move 24, $1d
	levelup_move 25, $5e
	levelup_move 29, $12
	levelup_move 31, $66
	levelup_move 34, $06
	levelup_move 37, $28
	levelup_move 43, $62
	levelup_move 48, $64
	levelup_move 55, $65
	db $ff
Learnset_4e8f:
	levelup_move 4, $1e
	levelup_move 6, $13
	levelup_move 12, $03
	levelup_move 16, $23
	levelup_move 18, $04
	levelup_move 20, $0f
	levelup_move 25, $28
	levelup_move 33, $05
	levelup_move 40, $75
	levelup_move 42, $72
	levelup_move 46, $73
	levelup_move 51, $74
	levelup_move 56, $75
	levelup_move 61, $76
	levelup_move 63, $7a
	levelup_move 64, $7b
	db $ff
Learnset_4eb0:
	levelup_move 5, $08
	levelup_move 10, $15
	levelup_move 13, $86
	levelup_move 16, $25
	levelup_move 19, $72
	levelup_move 24, $07
	levelup_move 27, $84
	levelup_move 30, $20
	levelup_move 34, $7a
	levelup_move 35, $7b
	levelup_move 40, $73
	levelup_move 46, $74
	levelup_move 51, $75
	levelup_move 57, $76
	levelup_move 62, $16
	db $ff
Learnset_4ecf:
	levelup_move 10, $72
	levelup_move 16, $7c
	levelup_move 25, $73
	levelup_move 31, $0a
	levelup_move 33, $74
	levelup_move 36, $89
	levelup_move 43, $88
	levelup_move 47, $71
	levelup_move 52, $75
	levelup_move 57, $26
	levelup_move 61, $76
	db $ff
Learnset_4ee6:
	levelup_move 10, $1e
	levelup_move 16, $0b
	levelup_move 24, $16
	levelup_move 33, $7a
	levelup_move 35, $7b
	levelup_move 39, $24
	levelup_move 40, $14
	levelup_move 42, $84
	levelup_move 44, $82
	levelup_move 47, $72
	levelup_move 52, $73
	levelup_move 57, $74
	levelup_move 61, $75
	levelup_move 64, $76
	db $ff
Learnset_4f03:
	levelup_move 4, $27
	levelup_move 10, $0b
	levelup_move 18, $72
	levelup_move 20, $6e
	levelup_move 24, $42
	levelup_move 30, $73
	levelup_move 35, $74
	levelup_move 41, $76
	levelup_move 46, $75
	levelup_move 51, $86
	levelup_move 56, $0e
	levelup_move 61, $1e
	db $ff
Learnset_4f1c:
	levelup_move 10, $07
	levelup_move 15, $7e
	levelup_move 21, $81
	levelup_move 26, $28
	levelup_move 34, $1b
	levelup_move 38, $76
	levelup_move 43, $7a
	levelup_move 44, $7b
	levelup_move 50, $72
	levelup_move 54, $73
	levelup_move 59, $74
	levelup_move 62, $75
	db $ff
Learnset_4f35:
	levelup_move 11, $1a
	levelup_move 14, $17
	levelup_move 17, $11
	levelup_move 19, $03
	levelup_move 24, $7a
	levelup_move 34, $12
	levelup_move 38, $7b
	levelup_move 44, $75
	levelup_move 51, $72
	levelup_move 57, $73
	levelup_move 63, $74
	db $ff
Learnset_4f4c:
	levelup_move 7, $08
	levelup_move 16, $20
	levelup_move 20, $27
	levelup_move 24, $6f
	levelup_move 28, $73
	levelup_move 32, $86
	levelup_move 36, $7a
	levelup_move 40, $7b
	levelup_move 46, $72
	levelup_move 51, $74
	levelup_move 56, $75
	levelup_move 61, $76
	db $ff
Learnset_4f65:
	levelup_move 10, $72
	levelup_move 16, $7c
	levelup_move 25, $73
	levelup_move 31, $0a
	levelup_move 33, $74
	levelup_move 36, $89
	levelup_move 43, $88
	levelup_move 48, $75
	levelup_move 53, $1e
	levelup_move 60, $76
	db $ff
Learnset_4f7a:
	levelup_move 9, $50
	levelup_move 15, $51
	levelup_move 21, $52
	levelup_move 28, $53
	levelup_move 34, $54
	levelup_move 40, $55
	levelup_move 45, $56
	levelup_move 48, $01
	levelup_move 53, $0e
	levelup_move 58, $16
	levelup_move 61, $7d
	levelup_move 64, $88
	db $ff
Learnset_4f93:
	levelup_move 4, $13
	levelup_move 8, $50
	levelup_move 14, $0e
	levelup_move 19, $0c
	levelup_move 21, $21
	levelup_move 24, $28
	levelup_move 28, $51
	levelup_move 34, $52
	levelup_move 42, $22
	levelup_move 50, $53
	levelup_move 54, $54
	levelup_move 59, $55
	levelup_move 61, $56
	db $ff
Learnset_4fae:
	levelup_move 8, $07
	levelup_move 16, $0f
	levelup_move 20, $13
	levelup_move 22, $02
	levelup_move 25, $29
	levelup_move 26, $0a
	levelup_move 31, $0b
	levelup_move 36, $26
	levelup_move 40, $54
	levelup_move 43, $50
	levelup_move 49, $51
	levelup_move 54, $52
	levelup_move 58, $53
	levelup_move 62, $55
	db $ff
Learnset_4fcb:
	levelup_move 4, $0c
	levelup_move 11, $10
	levelup_move 16, $53
	levelup_move 24, $0d
	levelup_move 31, $52
	levelup_move 37, $56
	levelup_move 45, $83
	levelup_move 49, $51
	levelup_move 52, $7c
	levelup_move 56, $54
	levelup_move 61, $55
	db $ff
Learnset_4fe2:
	levelup_move 11, $50
	levelup_move 20, $1d
	levelup_move 26, $51
	levelup_move 31, $52
	levelup_move 36, $28
	levelup_move 40, $53
	levelup_move 43, $54
	levelup_move 46, $05
	levelup_move 51, $56
	levelup_move 56, $24
	levelup_move 62, $55
	db $ff
Learnset_4ff9:
	levelup_move 7, $13
	levelup_move 16, $50
	levelup_move 22, $0e
	levelup_move 25, $28
	levelup_move 27, $0a
	levelup_move 29, $29
	levelup_move 34, $52
	levelup_move 43, $54
	levelup_move 47, $51
	levelup_move 52, $53
	levelup_move 57, $56
	levelup_move 62, $55
	db $ff
Learnset_5012:
	levelup_move 6, $1a
	levelup_move 12, $24
	levelup_move 15, $15
	levelup_move 17, $50
	levelup_move 21, $51
	levelup_move 26, $0b
	levelup_move 28, $52
	levelup_move 35, $24
	levelup_move 43, $53
	levelup_move 47, $54
	levelup_move 53, $32
	levelup_move 58, $56
	levelup_move 60, $38
	levelup_move 63, $55
	db $ff
Learnset_502f:
	levelup_move 6, $25
	levelup_move 13, $50
	levelup_move 16, $7e
	levelup_move 20, $51
	levelup_move 24, $86
	levelup_move 29, $52
	levelup_move 33, $28
	levelup_move 40, $53
	levelup_move 45, $2f
	levelup_move 51, $54
	levelup_move 57, $56
	levelup_move 62, $55
	db $ff
Learnset_5048:
	levelup_move 10, $15
	levelup_move 16, $51
	levelup_move 19, $52
	levelup_move 21, $53
	levelup_move 23, $54
	levelup_move 24, $12
	levelup_move 26, $03
	levelup_move 30, $55
	levelup_move 33, $56
	levelup_move 40, $7f
	levelup_move 42, $82
	levelup_move 47, $50
	levelup_move 52, $06
	levelup_move 57, $1a
	levelup_move 60, $24
	db $ff
Learnset_5067:
	levelup_move 3, $0d
	levelup_move 9, $1d
	levelup_move 14, $71
	levelup_move 19, $28
	levelup_move 21, $86
	levelup_move 25, $6e
	levelup_move 28, $29
	levelup_move 29, $0a
	levelup_move 32, $69
	levelup_move 36, $5a
	levelup_move 40, $89
	levelup_move 45, $6c
	levelup_move 50, $61
	levelup_move 55, $68
	levelup_move 60, $6b
	db $ff
Learnset_5086:
	levelup_move 6, $68
	levelup_move 12, $0c
	levelup_move 17, $03
	levelup_move 22, $69
	levelup_move 25, $5a
	levelup_move 30, $86
	levelup_move 33, $6e
	levelup_move 38, $7c
	levelup_move 45, $6b
	levelup_move 51, $2d
	levelup_move 56, $6a
	levelup_move 61, $6c
	db $ff
Learnset_509f:
	levelup_move 3, $08
	levelup_move 9, $1a
	levelup_move 14, $25
	levelup_move 18, $29
	levelup_move 20, $67
	levelup_move 25, $13
	levelup_move 29, $68
	levelup_move 33, $6a
	levelup_move 38, $06
	levelup_move 44, $6b
	levelup_move 49, $70
	levelup_move 55, $69
	levelup_move 59, $6e
	levelup_move 61, $6c
	db $ff
Learnset_50bc:
	levelup_move 55, $7d
	db $ff
Learnset_50bf:
	levelup_move 3, $28
	levelup_move 9, $1d
	levelup_move 14, $86
	levelup_move 19, $0d
	levelup_move 21, $71
	levelup_move 25, $6e
	levelup_move 28, $0a
	levelup_move 29, $29
	levelup_move 32, $69
	levelup_move 36, $5a
	levelup_move 40, $89
	levelup_move 45, $6c
	levelup_move 50, $10
	levelup_move 54, $24
	levelup_move 60, $6b
	db $ff
Learnset_50de:
	levelup_move 6, $0c
	levelup_move 9, $67
	levelup_move 14, $68
	levelup_move 21, $28
	levelup_move 24, $08
	levelup_move 28, $69
	levelup_move 33, $29
	levelup_move 37, $6f
	levelup_move 42, $89
	levelup_move 45, $6b
	levelup_move 49, $84
	levelup_move 53, $6a
	levelup_move 58, $83
	levelup_move 63, $6c
	db $ff
Learnset_50fb:
	levelup_move 7, $13
	levelup_move 16, $50
	levelup_move 22, $0e
	levelup_move 25, $28
	levelup_move 27, $0a
	levelup_move 29, $29
	levelup_move 34, $52
	levelup_move 43, $54
	levelup_move 48, $0f
	levelup_move 53, $6d
	levelup_move 58, $69
	levelup_move 63, $6b
	db $ff
Learnset_5114:
	levelup_move 7, $6e
	levelup_move 16, $1f
	levelup_move 25, $69
	levelup_move 30, $71
	levelup_move 33, $06
	levelup_move 37, $05
	levelup_move 42, $16
	levelup_move 48, $2d
	levelup_move 53, $6a
	levelup_move 56, $6f
	levelup_move 61, $6c
	db $ff
Learnset_512b:
	levelup_move 5, $2c
	levelup_move 10, $1e
	levelup_move 16, $25
	levelup_move 26, $69
	levelup_move 35, $88
	levelup_move 43, $6a
	levelup_move 47, $03
	levelup_move 51, $34
	levelup_move 56, $6d
	levelup_move 59, $6b
	levelup_move 62, $6c
	db $ff
Learnset_5142:
	levelup_move 6, $0b
	levelup_move 17, $03
	levelup_move 20, $08
	levelup_move 24, $17
	levelup_move 26, $57
	levelup_move 30, $23
	levelup_move 33, $0f
	levelup_move 37, $02
	levelup_move 41, $05
	levelup_move 45, $83
	levelup_move 49, $58
	levelup_move 55, $59
	levelup_move 59, $5c
	levelup_move 62, $5b
	db $ff
Learnset_515f:
	levelup_move 9, $5c
	levelup_move 11, $80
	levelup_move 16, $57
	levelup_move 20, $86
	levelup_move 23, $77
	levelup_move 25, $59
	levelup_move 33, $14
	levelup_move 45, $5a
	levelup_move 49, $58
	levelup_move 54, $5b
	levelup_move 57, $78
	levelup_move 61, $79
	db $ff
Learnset_5178:
	levelup_move 3, $25
	levelup_move 7, $08
	levelup_move 9, $15
	levelup_move 14, $1d
	levelup_move 16, $57
	levelup_move 24, $7e
	levelup_move 33, $82
	levelup_move 38, $79
	levelup_move 40, $7f
	levelup_move 45, $58
	levelup_move 49, $59
	levelup_move 53, $5c
	levelup_move 58, $5b
	levelup_move 62, $5a
	db $ff
Learnset_5195:
	levelup_move 8, $25
	levelup_move 11, $09
	levelup_move 15, $13
	levelup_move 22, $84
	levelup_move 25, $16
	levelup_move 31, $7d
	levelup_move 35, $57
	levelup_move 45, $79
	levelup_move 51, $71
	levelup_move 56, $87
	levelup_move 61, $5b
	db $ff
Learnset_51ac:
	levelup_move 9, $5c
	levelup_move 11, $80
	levelup_move 16, $57
	levelup_move 20, $86
	levelup_move 23, $77
	levelup_move 25, $59
	levelup_move 33, $14
	levelup_move 45, $5a
	levelup_move 50, $58
	levelup_move 53, $0a
	levelup_move 58, $0f
	levelup_move 63, $86
	db $ff
Learnset_51c5:
	levelup_move 7, $13
	levelup_move 14, $57
	levelup_move 18, $09
	levelup_move 20, $23
	levelup_move 24, $58
	levelup_move 25, $27
	levelup_move 28, $0b
	levelup_move 29, $59
	levelup_move 30, $11
	levelup_move 32, $5b
	levelup_move 38, $5c
	levelup_move 44, $78
	levelup_move 49, $5a
	levelup_move 55, $79
	levelup_move 61, $70
	db $ff
Learnset_51e4:
	levelup_move 9, $5c
	levelup_move 11, $80
	levelup_move 16, $57
	levelup_move 20, $86
	levelup_move 23, $77
	levelup_move 25, $59
	levelup_move 33, $14
	levelup_move 45, $5a
	levelup_move 49, $6d
	levelup_move 54, $6f
	levelup_move 59, $5b
	levelup_move 62, $70
	db $ff
Learnset_51fd:
	levelup_move 5, $08
	levelup_move 10, $16
	levelup_move 13, $0f
	levelup_move 16, $25
	levelup_move 19, $72
	levelup_move 24, $07
	levelup_move 27, $84
	levelup_move 30, $20
	levelup_move 34, $7a
	levelup_move 35, $7b
	levelup_move 40, $73
	levelup_move 46, $74
	levelup_move 51, $75
	levelup_move 57, $76
	levelup_move 62, $0e
Learnset_521b:
	levelup_move 11, $1a
	levelup_move 14, $17
	levelup_move 17, $11
	levelup_move 19, $03
	levelup_move 24, $7a
	levelup_move 34, $12
	levelup_move 38, $7b
	levelup_move 44, $75
	levelup_move 48, $73
	levelup_move 53, $05
	levelup_move 58, $74
	levelup_move 63, $76
	db $ff
Learnset_5234:
	db $ff
Learnset_5235:
	levelup_move 6, $0b
	levelup_move 10, $31
	levelup_move 18, $13
	levelup_move 24, $3f
	levelup_move 27, $32
	levelup_move 29, $27
	levelup_move 31, $0a
	levelup_move 33, $3d
	levelup_move 35, $28
	levelup_move 39, $16
	levelup_move 43, $8a
	db $ff
Learnset_524c:
	levelup_move 5, $0d
	levelup_move 8, $47
	levelup_move 12, $0c
	levelup_move 19, $48
	levelup_move 24, $0f
	levelup_move 38, $4e
	levelup_move 44, $4b
	levelup_move 45, $8b
	db $ff
Learnset_525d:
	levelup_move 4, $0c
	levelup_move 10, $30
	levelup_move 15, $41
	levelup_move 18, $03
	levelup_move 21, $7d
	levelup_move 24, $20
	levelup_move 28, $1b
	levelup_move 32, $83
	levelup_move 41, $45
	levelup_move 42, $22
	db $ff
Learnset_5272:
	levelup_move 11, $1a
	levelup_move 14, $17
	levelup_move 17, $11
	levelup_move 19, $03
	levelup_move 24, $7a
	levelup_move 34, $12
	levelup_move 38, $7b
	levelup_move 44, $75
	db $ff
Learnset_5283:
	levelup_move 9, $03
	levelup_move 12, $0b
	levelup_move 14, $32
	levelup_move 21, $77
	levelup_move 25, $3b
	levelup_move 27, $3e
	levelup_move 31, $33
	levelup_move 34, $29
	levelup_move 36, $05
	levelup_move 39, $3d
	levelup_move 42, $3c
	db $ff
Learnset_529a:
	levelup_move 9, $03
	levelup_move 12, $0b
	levelup_move 14, $32
	levelup_move 21, $77
	levelup_move 25, $3b
	levelup_move 27, $3e
	levelup_move 31, $33
	levelup_move 34, $29
	levelup_move 36, $05
	levelup_move 39, $3d
	levelup_move 42, $3c
	db $ff
TextFont_GFX:
INCBIN "gfx/misc/textfont_gfx.2bpp"
Func_04a_5691:
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	ld a, [de]
	inc de
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ldh [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceTilemap
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	ld a, [de]
	inc de
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ldh [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceAttrmap
	xor a
	ld [wBattleScriptByte], a
	ret
Tilemap_4a_56ef:
INCBIN "gfx/tilemaps/tilemap_4a_56ef.tilemap"
Attrmap_4a_5745:
INCBIN "gfx/attrmaps/attrmap_4a_5745.bin"
Tilemap_4a_579b:
INCBIN "gfx/tilemaps/tilemap_4a_579b.tilemap"
Attrmap_4a_5905:
INCBIN "gfx/attrmaps/attrmap_4a_5905.bin"
Tilemap_4a_5a6f:
INCBIN "gfx/tilemaps/tilemap_4a_5a6f.tilemap"
Tilemap_4a_5bd9:
INCBIN "gfx/tilemaps/tilemap_4a_5bd9.tilemap"
Attrmap_4a_5c8f:
INCBIN "gfx/attrmaps/attrmap_4a_5c8f.bin"
Tilemap_4a_5d45:
INCBIN "gfx/tilemaps/tilemap_4a_5d45.tilemap"
Attrmap_4a_5dfb:
INCBIN "gfx/attrmaps/attrmap_4a_5dfb.bin"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5eb1:
	ds 18
Tilemap_4a_5ec3:
INCBIN "gfx/tilemaps/tilemap_4a_5ec3.tilemap"
Tilemap_4a_5ec7:
INCBIN "gfx/tilemaps/tilemap_4a_5ec7.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5ecb:
	ds 13
Tilemap_4a_5ed8:
INCBIN "gfx/tilemaps/tilemap_4a_5ed8.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5fc0:
	ds 5
Tilemap_4a_5fc5:
INCBIN "gfx/tilemaps/tilemap_4a_5fc5.tilemap"
Tilemap_4a_6017:
INCBIN "gfx/tilemaps/tilemap_4a_6017.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_6051:
	ds 28
Tilemap_4a_606d:
INCBIN "gfx/tilemaps/tilemap_4a_606d.tilemap"
Attrmap_4a_60b7:
INCBIN "gfx/attrmaps/attrmap_4a_60b7.bin"
Tilemap_4a_6101:
INCBIN "gfx/tilemaps/tilemap_4a_6101.tilemap"
Attrmap_4a_6157:
INCBIN "gfx/attrmaps/attrmap_4a_6157.bin"
Tilemap_4a_61ad:
INCBIN "gfx/tilemaps/tilemap_4a_61ad.tilemap"
Attrmap_4a_6227:
INCBIN "gfx/attrmaps/attrmap_4a_6227.bin"
Tilemap_4a_62a1:
INCBIN "gfx/tilemaps/tilemap_4a_62a1.tilemap"
Tilemap_4a_631b:
INCBIN "gfx/tilemaps/tilemap_4a_631b.tilemap"
Attrmap_4a_6339:
INCBIN "gfx/attrmaps/attrmap_4a_6339.bin"
Tilemap_4a_6357:
INCBIN "gfx/tilemaps/tilemap_4a_6357.tilemap"
Attrmap_4a_6401:
INCBIN "gfx/attrmaps/attrmap_4a_6401.bin"
Tilemap_4a_64ab:
INCBIN "gfx/tilemaps/tilemap_4a_64ab.tilemap"
Attrmap_4a_64d7:
INCBIN "gfx/attrmaps/attrmap_4a_64d7.bin"
Tilemap_4a_6503:
INCBIN "gfx/tilemaps/tilemap_4a_6503.tilemap"
Attrmap_4a_651d:
INCBIN "gfx/attrmaps/attrmap_4a_651d.bin"
Tilemap_4a_6537:
INCBIN "gfx/tilemaps/tilemap_4a_6537.tilemap"
Attrmap_4a_65b1:
INCBIN "gfx/attrmaps/attrmap_4a_65b1.bin"
Tilemap_4a_662b:
INCBIN "gfx/tilemaps/tilemap_4a_662b.tilemap"
Attrmap_4a_664b:
INCBIN "gfx/attrmaps/attrmap_4a_664b.bin"
Tilemap_4a_666b:
INCBIN "gfx/tilemaps/tilemap_4a_666b.tilemap"
Attrmap_4a_66db:
INCBIN "gfx/attrmaps/attrmap_4a_66db.bin"
Tilemap_4a_674b:
INCBIN "gfx/tilemaps/tilemap_4a_674b.tilemap"
Attrmap_4a_676b:
INCBIN "gfx/attrmaps/attrmap_4a_676b.bin"
Tilemap_4a_678b:
INCBIN "gfx/tilemaps/tilemap_4a_678b.tilemap"
Attrmap_4a_67d5:
INCBIN "gfx/attrmaps/attrmap_4a_67d5.bin"
Tilemap_4a_681f:
INCBIN "gfx/tilemaps/tilemap_4a_681f.tilemap"
Attrmap_4a_6861:
INCBIN "gfx/attrmaps/attrmap_4a_6861.bin"
Tilemap_4a_68a3:
INCBIN "gfx/tilemaps/tilemap_4a_68a3.tilemap"
Attrmap_4a_68dd:
INCBIN "gfx/attrmaps/attrmap_4a_68dd.bin"
Tilemap_4a_6917:
INCBIN "gfx/tilemaps/tilemap_4a_6917.tilemap"
Attrmap_4a_69cd:
INCBIN "gfx/attrmaps/attrmap_4a_69cd.bin"
Tilemap_4a_6a83:
INCBIN "gfx/tilemaps/tilemap_4a_6a83.tilemap"
Attrmap_4a_6aa8:
INCBIN "gfx/attrmaps/attrmap_4a_6aa8.bin"
Tilemap_4a_6acd:
INCBIN "gfx/tilemaps/tilemap_4a_6acd.tilemap"
Attrmap_4a_6b97:
INCBIN "gfx/attrmaps/attrmap_4a_6b97.bin"
Tilemap_4a_6c61:
INCBIN "gfx/tilemaps/tilemap_4a_6c61.tilemap"
Attrmap_4a_6dcb:
INCBIN "gfx/attrmaps/attrmap_4a_6dcb.bin"
Tilemap_4a_6f35:
INCBIN "gfx/tilemaps/tilemap_4a_6f35.tilemap"
Attrmap_4a_6fc7:
INCBIN "gfx/attrmaps/attrmap_4a_6fc7.bin"
Tilemap_4a_7059:
INCBIN "gfx/tilemaps/tilemap_4a_7059.tilemap"
Attrmap_4a_70bb:
INCBIN "gfx/attrmaps/attrmap_4a_70bb.bin"
Tilemap_4a_711d:
INCBIN "gfx/tilemaps/tilemap_4a_711d.tilemap"
Attrmap_4a_7197:
INCBIN "gfx/attrmaps/attrmap_4a_7197.bin"
Tilemap_4a_7211:
INCBIN "gfx/tilemaps/tilemap_4a_7211.tilemap"
Attrmap_4a_72b5:
INCBIN "gfx/attrmaps/attrmap_4a_72b5.bin"
Tilemap_4a_7359:
INCBIN "gfx/tilemaps/tilemap_4a_7359.tilemap"
Tilemap_4a_73d3:
INCBIN "gfx/tilemaps/tilemap_4a_73d3.tilemap"
Tilemap_4a_7425:
INCBIN "gfx/tilemaps/tilemap_4a_7425.tilemap"
Tilemap_4a_74c7:
INCBIN "gfx/tilemaps/tilemap_4a_74c7.tilemap"
Tilemap_4a_7541:
INCBIN "gfx/tilemaps/tilemap_4a_7541.tilemap"
Tilemap_4a_7593:
INCBIN "gfx/tilemaps/tilemap_4a_7593.tilemap"
Tilemap_4a_7635:
INCBIN "gfx/tilemaps/tilemap_4a_7635.tilemap"
Tilemap_4a_76af:
INCBIN "gfx/tilemaps/tilemap_4a_76af.tilemap"
Attrmap_4a_76dd:
INCBIN "gfx/attrmaps/attrmap_4a_76dd.bin"
Tilemap_4a_770b:
INCBIN "gfx/tilemaps/tilemap_4a_770b.tilemap"
Attrmap_4a_772b:
INCBIN "gfx/attrmaps/attrmap_4a_772b.bin"
Tilemap_4a_774b:
INCBIN "gfx/tilemaps/tilemap_4a_774b.tilemap"
Attrmap_4a_77b9:
INCBIN "gfx/attrmaps/attrmap_4a_77b9.bin"
Tilemap_4a_7827:
INCBIN "gfx/tilemaps/tilemap_4a_7827.tilemap"
Attrmap_4a_78c5:
INCBIN "gfx/attrmaps/attrmap_4a_78c5.bin"
Tilemap_4a_7963:
INCBIN "gfx/tilemaps/tilemap_4a_7963.tilemap"
Attrmap_4a_79a1:
INCBIN "gfx/attrmaps/attrmap_4a_79a1.bin"
Tilemap_4a_79df:
INCBIN "gfx/tilemaps/tilemap_4a_79df.tilemap"
Attrmap_4a_7a59:
INCBIN "gfx/attrmaps/attrmap_4a_7a59.bin"
Tilemap_4a_7ad3:
INCBIN "gfx/tilemaps/tilemap_4a_7ad3.tilemap"
Tilemap_4a_7af3:
INCBIN "gfx/tilemaps/tilemap_4a_7af3.tilemap"
Attrmap_4a_7bcd:
INCBIN "gfx/attrmaps/attrmap_4a_7bcd.bin"
Tilemap_4a_7ca7:
INCBIN "gfx/tilemaps/tilemap_4a_7ca7.tilemap"
Attrmap_4a_7d5d:
INCBIN "gfx/attrmaps/attrmap_4a_7d5d.bin"
Tilemap_4a_7e13:
INCBIN "gfx/tilemaps/tilemap_4a_7e13.tilemap"
Attrmap_4a_7ec9:
INCBIN "gfx/attrmaps/attrmap_4a_7ec9.bin"
Tilemap_4a_7f7f:
INCBIN "gfx/tilemaps/tilemap_4a_7f7f.tilemap"
Attrmap_4a_7fab:
INCBIN "gfx/attrmaps/attrmap_4a_7fab.bin"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_7fd7:
	dr $12bfd7, $12bfff


