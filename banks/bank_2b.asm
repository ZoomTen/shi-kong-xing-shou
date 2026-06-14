asm_02b_4000:
	ld bc, $d200

asm_02b_4003:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_02b_4017

asm_02b_400b:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, asm_02b_4003
	ret

asm_02b_4017:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr nz, asm_02b_400b
	ld [hl], 0
	ld hl, 2
	add hl, bc
	ld [hl], 1
	jr asm_02b_400b
	ret

Func_02b_402b:
	ld a, 1
	ld [wd0fd], a
	xor a
	ld [wd1fc], a
	ld a, $6d
	ld [wd8fe], a
	ld a, [wd981]
	ld e, a
	ld a, [wd981 + 1]
	ld d, a
	inc de
	ld hl, $9908
	ld bc, $0102
	call Func_113f
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld de, 3
	add hl, de
	ld de, $d1f5
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	dec de
	ld hl, $9941
	ld bc, $0203
	call Func_113f
	call Func_02b_431e
	xor a
	ld [wd9d7], a
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	call Func_114c
	ld de, $ffcb
	ld hl, $9945
	ld bc, $0103
	call Func_113f
	ld de, $d876
	inc de
	ld hl, $984b
	ld bc, $0102
	call Func_113f
	call Func_02b_4243
	ret

Func_02b_4098:
	call Func_02b_5651
	call Func_02b_5ef2

Func_02b_409e:
	ld a, [wd986]
	and a
	jr nz, asm_02b_4113
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_4119

asm_02b_40aa:
	call Func_02b_4296
	ldh a, [hFFCB]
	and a
	jr z, asm_02b_4100
	ld [wd9bd], a
	call Func_02b_5b4f
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4296
	ldh a, [hFFCB]
	ld b, a
	ld a, [wd9bd]
	sub b
	ld [wd9bc], a
	call Func_02b_5b82
	ld a, [wd9bc]
	and a
	ret z

asm_02b_40dc:
	ld a, [wd9bd]
	and a
	jp z, asm_02b_5aa5
	call Func_02b_4248
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	dec a
	ld [wd9bd], a
	jp z, asm_02b_5aa5
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_40dc
	ret

asm_02b_4100:
	jp asm_02b_5aa5
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ret

asm_02b_4113:
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_40aa

asm_02b_4119:
	call Func_02b_4374
	ldh a, [hFFCB]
	and a
	jp z, asm_02b_5aaf
	ld [wd9bd], a
	call Func_02b_5b4f
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4374
	ldh a, [hFFCB]
	ld b, a
	ld a, [wd9bd]
	sub b
	ld [wd9bc], a
	call Func_02b_5b82
	ld a, [wd9bc]
	and a
	ret z

asm_02b_414c:
	ld a, [wd9bd]
	and a
	jp z, asm_02b_5aaf
	call Func_02b_4326
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	dec a
	ld [wd9bd], a
	jp z, asm_02b_5aaf
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_414c
	call Func_02b_402b
	ret
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 0
	ld hl, $14
	add hl, bc
	ld a, [hl]
	cp 1
	jp z, asm_02b_5ae1
	inc hl
	ld a, [hl]
	cp 1
	jp z, asm_02b_5ae1
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ret

Func_02b_419d:
	ld a, [wd986]
	and a
	jr nz, asm_02b_41ee
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_41f4

asm_02b_41a9:
	call Func_02b_4296
	ldh a, [hFFCB]
	ld [wd9bd], a
	call Func_02b_5ca2
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4296
	ld a, [wd9bd]
	ld b, a
	ldh a, [hFFCB]
	sub b
	inc a
	ld [wd9bc], a

asm_02b_41d1:
	ld a, [wd9bd]
	call Func_02b_4248
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	inc a
	ld [wd9bd], a
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_41d1
	ret

asm_02b_41ee:
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_41a9

asm_02b_41f4:
	call Func_02b_4374
	ldh a, [hFFCB]
	ld [wd9bd], a
	call Func_02b_5ca2
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4374
	ld a, [wd9bd]
	ld b, a
	ldh a, [hFFCB]
	sub b
	inc a
	ld [wd9bc], a

asm_02b_421c:
	ld a, [wd9bd]
	call Func_02b_4326
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	inc a
	ld [wd9bd], a
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_421c
	call Func_02b_402b
	ret
	call Func_02b_4a40
	call Func_02b_4a52
	ret

Func_02b_4243:
	call Func_02b_4296
	ldh a, [hFFCB]

Func_02b_4248:
	ld d, 0
	srl a
	rr d
	srl a
	rr d
	srl a
	rr d
	ld e, a
	ld a, d
	swap a
	srl a
	ld d, a
	ld hl, $0d03
	call GetTextBGMapPointer
	push hl
	ld c, 6

asm_02b_4266:
	call WaitVRAM_STAT
	ld a, $a1
	ld [hli], a
	dec c
	jr nz, asm_02b_4266
	pop hl
	ld a, e
	ld b, a
	and a
	jr z, asm_02b_427e

asm_02b_4275:
	call WaitVRAM_STAT
	ld a, $99
	ld [hli], a
	dec e
	jr nz, asm_02b_4275

asm_02b_427e:
	ld a, b
	cp 6
	ret z
	ld a, e
	and a
	jr nz, asm_02b_428c
	ld a, d
	and a
	jr nz, asm_02b_428c
	ld d, 1

asm_02b_428c:
	ld a, $a1
	sub d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

Func_02b_4296:
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	ld [wd999], a
	ld a, [hl]
	ld [wd998], a
	xor a
	ld [wd9d7], a
	farcall Func_025_4101
	ld a, [hFFCB]
	ld [wd99a], a
	ld a, [hFFCC]
	ld [wd99b], a
	call Func_02b_42c4
	ret

Func_02b_42c4:
	ld a, [wd998]
	ld [hFFCB], a
	ld a, [wd999]
	ld [hFFCC], a
	xor a
	ld [hFFCD], a
	ld a, 2
	ldh [hFFC7], a
	farcall asm_025_41b8
	ld a, $30
	ldh [hFFC7], a
	farcall Func_025_414a
	ldh a, [hFFCB]
	push af
	ldh a, [hFFCC]
	push af
	ldh a, [hFFCD]
	push af
	ld a, [wd99a]
	ldh [hFFCB], a
	ld a, [wd99b]
	ldh [hFFCC], a
	xor a
	ldh [hFFCD], a
	ld a, 2
	ldh [hFFC7], a
	farcall asm_025_41b8
	ldh a, [hFFCB]
	ldh [hFFC7], a
	pop af
	ldh [hFFCD], a
	pop af
	ldh [hFFCC], a
	pop af
	ldh [hFFCB], a
	farcall asm_025_41b8
	ld d, 0
	ret

Func_02b_431e:
	call Func_02b_4374
	call DelayFrame
	ldh a, [hFFCB]

Func_02b_4326:
	ld d, 0
	srl a
	rr d
	srl a
	rr d
	srl a
	rr d
	ld e, a
	ld a, d
	swap a
	srl a
	ld d, a
	ld hl, $0609
	call GetTextBGMapPointer
	push hl
	ld c, 6

asm_02b_4344:
	call WaitVRAM_STAT
	ld a, $a2
	ld [hld], a
	dec c
	jr nz, asm_02b_4344
	pop hl
	ld a, e
	ld b, a
	and a
	jr z, asm_02b_435c

asm_02b_4353:
	call WaitVRAM_STAT
	ld a, $aa
	ld [hld], a
	dec e
	jr nz, asm_02b_4353

asm_02b_435c:
	ld a, b
	cp 6
	ret z
	ld a, e
	and a
	jr nz, asm_02b_436a
	ld a, d
	and a
	jr nz, asm_02b_436a
	ld d, 1

asm_02b_436a:
	ld a, $a2
	add d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

Func_02b_4374:
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	ld [wd999], a
	ld a, [hl]
	ld [wd998], a
	xor a
	ld [wd9d7], a
	ld a, [wd983]
	ld [wSelectedOption], a
	farcall asm_025_410d
	ld a, [hFFCB]
	ld [wd99a], a
	ld a, [hFFCC]
	ld [wd99b], a
	call Func_02b_42c4
	ret

BattleJumptable:
	ld de, .Jumptable
	ldh a, [hBattleJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw HandleBattleIntro
	dw HandleBattleIntro
	dw HandleBattleMenu
	dw HandleBattleMoves
	dw HandleBattleTurns
	dw HandleBattleEnd


HandleBattleEnd:
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Func_02b_43d5
	dw Func_02b_4c92

Func_02b_43d5:
	ld de, $55f6
	farcall unk_02e_4000
	call Func_02b_4b5b
	call Func_02b_4b7a
	ld a, [wd9b2]
	and a
	jr z, Func_02b_43f0
	ld a, [wd9dc]
	and a
	jr z, Func_02b_4409

Func_02b_43f0:
	call Func_02b_4bb7
	and a
	jr z, Func_02b_4409
	ld de, Func_02b_55c5
	farcall unk_02e_4000
	ld a, 2
	ld [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_4409:
	ld a, [wd9b2]
	and a
	jr nz, Func_02b_4454
	ld a, BGM_MONSTER_FAINTED
	call PlaySound
	ld a, [wdaa3]
	set 3, a
	ld [wdaa3], a
	call asm_02b_4000
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld a, $57
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ret

Func_02b_4436:
	ld a, 1
	ldh [$bf], a
	xor a
	ldh [$d3], a
	ld a, 3
	ld [wTargetMode], a
	ld a, $57
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ret

Func_02b_4454:
	ld a, [wdaa3]
	res 3, a
	ld [wdaa3], a
	ld a, BGM_MONSTER_FAINTED
	call PlaySound
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld a, $29
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd9f5]
	and a
	jp nz, Func_02b_4519
	call Func_02b_453a
	ld a, $2b
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ld a, BGM_EXP_JINGLE
	call PlaySound
	ld a, [wd9cc]
	ld [wd9cf], a
	ld a, [wd9cd]
	ld [wd9ce], a
	ld a, $2c
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	call Func_02b_4569
	xor a
	ld [wSelectedOption], a
	ld bc, $d200

Func_02b_44c3:
	ld hl, 1
	add hl, bc
	ld a, [hl]
	cp $64
	jr nc, Func_02b_4504
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 6, a
	jr z, Func_02b_4504
	and $41
	ld [hl], a
	ld de, $d1a0
	ld a, $b
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [wSelectedOption]
	ld [hl], a
	ld a, [wSelectedOption]
	push af
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	ld a, [bc]
	ld [wd9e5], a
	push bc
	call Func_02b_457e
	call Func_02b_45bd
	pop bc
	pop af
	ld [wSelectedOption], a

Func_02b_4504:
	call DelayFrame
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
	ld a, l
	cp $80
	jr c, Func_02b_44c3

Func_02b_4519:
	ld a, [wdb1c]
	and a
	ret z
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 7
	add hl, bc
	ld b, $c
	ld de, $dcbc

Func_02b_452f:
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, Func_02b_452f
	xor a
	ld [wdb1c], a
	ret

Func_02b_453a:
	ld a, [wd9cb]
	cp $27
	jr z, Func_02b_454d
	jr nc, Func_02b_455e
	ld [wd9ce], a
	ld a, [wd9ca]
	ld [wd9cf], a
	ret

Func_02b_454d:
	ld a, [wd9ca]
	cp $f
	jr nc, Func_02b_455e
	ld [wd9cf], a
	ld a, [wd9cb]
	ld [wd9ce], a
	ret

Func_02b_455e:
	ld a, $27
	ld [wd9ce], a
	ld a, $f
	ld [wd9cf], a
	ret

Func_02b_4569:
	ld hl, $d0d9
	ld a, [wd9cc]
	add [hl]
	ld [hld], a
	ld a, [wd9cd]
	adc [hl]
	ld [hld], a
	ld a, 0
	adc [hl]
	ld [hld], a
	call Func_02b_4599
	ret

Func_02b_457e:
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 4
	add hl, bc
	ld a, [wd9ca]
	add [hl]
	ld [hli], a
	ld a, [wd9cb]
	adc [hl]
	ld [hli], a
	ld a, 0
	adc [hl]
	ld [hli], a
	ret

Func_02b_4599:
	ld hl, $d0d7
	ld a, [hli]
	cp 1
	ret c
	jr z, Func_02b_45ae

Func_02b_45a2:
	ld hl, $d0d7
	ld [hl], 1
	inc hl
	ld [hl], $86
	inc hl
	ld [hl], $9f
	ret

Func_02b_45ae:
	ld a, [hli]
	cp $86
	ret c
	jr z, Func_02b_45b6
	jr Func_02b_45a2

Func_02b_45b6:
	ld a, [hli]
	cp $9f
	ret c
	ret z
	jr Func_02b_45a2

Func_02b_45bd:
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 1
	add hl, bc
	ld a, [hl]
	cp $63
	ret z
	cp $3d
	jr nc, Func_02b_45e5
	ld de, ExpTable
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [$cd], a
	ld a, [hli]
	ldh [$cc], a
	ld a, [hli]
	ldh [$cb], a
	jr Func_02b_45fd

Func_02b_45e5:
	ld de, ExpTable_HighLevels
	sub $3d
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [$cd], a
	ld a, [hli]
	ldh [$cc], a
	ld a, [hli]
	ldh [$cb], a
	ld a, [hli]
	ld [wdce8], a

Func_02b_45fd:
	ldh a, [$cd]
	ld d, a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 6
	add hl, bc
	ld a, [hl]
	cp d
	ret c
	jr z, Func_02b_4613
	jr nc, Func_02b_463c

Func_02b_4613:
	ldh a, [$cc]
	ld d, a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 5
	add hl, bc
	ld a, [hl]
	cp d
	ret c
	jr z, Func_02b_4629
	jr nc, Func_02b_463c

Func_02b_4629:
	ldh a, [$cb]
	ld d, a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 4
	add hl, bc
	ld a, [hl]
	cp d
	ret z
	ret c

Func_02b_463c:
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 1
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld [wd9e8], a
	call Func_02b_47e1
	ret

MACRO exp_entry ; exp (3-byte BE), level
	dt \1
	db \2
ENDM

; 4-byte records: 24-bit cumulative EXP + level byte.
; Indexed by level; ExpTable_HighLevels is the entry for level >= $3d.
ExpTable:
	exp_entry $000000, $00
	exp_entry $000008, $01
	exp_entry $00001b, $02
	exp_entry $000040, $03
	exp_entry $00007b, $04
	exp_entry $0000d8, $05
	exp_entry $000157, $06
	exp_entry $000200, $07
	exp_entry $0002d9, $08
	exp_entry $0003e8, $09
	exp_entry $000533, $0a
	exp_entry $0006c0, $0b
	exp_entry $000895, $0c
	exp_entry $000ab8, $0d
	exp_entry $000b2f, $0e
	exp_entry $001000, $0f
	exp_entry $001331, $10
	exp_entry $0016c8, $11
	exp_entry $001acb, $12
	exp_entry $001f40, $13
	exp_entry $00242d, $14
	exp_entry $002998, $15
	exp_entry $002f87, $16
	exp_entry $003600, $17
	exp_entry $003d09, $18
	exp_entry $0044a8, $19
	exp_entry $004ce3, $1a
	exp_entry $0055c0, $1b
	exp_entry $005f45, $1c
	exp_entry $006978, $1d
	exp_entry $00745f, $1e
	exp_entry $008000, $1f
	exp_entry $008c61, $20
	exp_entry $009988, $21
	exp_entry $00a77b, $22
	exp_entry $00b640, $23
	exp_entry $00c5dd, $24
	exp_entry $00d658, $25
	exp_entry $00e7b7, $26
	exp_entry $00fa00, $27
	exp_entry $010d39, $28
	exp_entry $012168, $29
	exp_entry $013693, $2a
	exp_entry $014cc0, $2b
	exp_entry $0163f5, $2c
	exp_entry $017c38, $2d
	exp_entry $01958f, $2e
	exp_entry $01b000, $2f
	exp_entry $01cb91, $30
	exp_entry $01e848, $31
	exp_entry $02062b, $32
	exp_entry $022540, $33
	exp_entry $02458d, $34
	exp_entry $026718, $35
	exp_entry $0289e7, $36
	exp_entry $02ae00, $37
	exp_entry $02d369, $38
	exp_entry $02fa28, $39
	exp_entry $032243, $3a
	exp_entry $034bc0, $3b
	exp_entry $0376a5, $3c

ExpTable_HighLevels:
	exp_entry $03a2f8, $3d
	exp_entry $03d0bf, $3e
	exp_entry $040000, $3f
	exp_entry $0430c1, $40
	exp_entry $046308, $41
	exp_entry $0496db, $42
	exp_entry $04cc40, $43
	exp_entry $05033d, $44
	exp_entry $053bd8, $45
	exp_entry $057617, $46
	exp_entry $05b200, $47
	exp_entry $05ef99, $48
	exp_entry $062ee8, $49
	exp_entry $066ff3, $4a
	exp_entry $06b2c0, $4b
	exp_entry $06f755, $4c
	exp_entry $073db8, $4d
	exp_entry $0785ef, $4e
	exp_entry $07d000, $4f
	exp_entry $081bf1, $50
	exp_entry $0669c8, $51
	exp_entry $08b98b, $52
	exp_entry $090b40, $53
	exp_entry $095eed, $54
	exp_entry $09b498, $55
	exp_entry $0a0c47, $56
	exp_entry $0a6600, $57
	exp_entry $0ac1c9, $58
	exp_entry $0b1fa8, $59
	exp_entry $0b7fa3, $5a
	exp_entry $0be1c0, $5b
	exp_entry $0c4605, $5c
	exp_entry $0cac78, $5d
	exp_entry $0d151f, $5e
	exp_entry $0d8000, $5f
	exp_entry $0ded21, $60
	exp_entry $0e5c88, $61
	exp_entry $0ece3b, $62
	exp_entry $0ece3b, $62

Func_02b_47e1:
	call ClearBGMap0
	call Func_02b_4807
	ld a, BGM_LEVEL_UP_JINGLE
	call PlaySound
	xor a
	ld [wd9b5], a
	ld a, 1
	ld [wd986], a
	ld a, $2d
	ld [wd3ff], a
	farcall Func_02d_4000
	farcall Func_04a_4098
	ret

Func_02b_4807:
	ld hl, GFX_02b_54c7
	ld de, $8680
	ld bc, $80
	call CopyBytesVRAM
	call DelayFrame
	ld hl, StatNames_Text
	ld a, $d
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ld de, BGMap_02b_4910
	ld hl, $9808
	ld bc, $0c0c
	ld a, $c
	ldh [$92], a
	ldh [$93], a
	call PlaceTilemap
	ld de, AttrMap_02b_49a0
	ld hl, $9808
	ld bc, $0c0c
	ld a, $c
	ldh [$92], a
	ldh [$93], a
	call PlaceAttrmap
	ld a, $77
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	push bc
	ld a, 1
	ld [wd9d7], a
	call Func_114c
	ldh a, [$cc]
	ld de, $d1f5
	ld [de], a
	inc de
	ldh a, [$cb]
	ld [de], a
	dec de
	ld hl, $9830
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call Func_113f
	pop bc
	push bc
	ld a, 2
	ld [wd9d7], a
	call Func_114c
	ldh a, [$cc]
	ld de, $d1f5
	ld [de], a
	inc de
	ldh a, [$cb]
	ld [de], a
	dec de
	ld hl, $9870
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call Func_113f
	pop bc
	push bc
	ld a, 3
	ld [wd9d7], a
	call Func_114c
	ldh a, [$cc]
	ld de, $d1f5
	ld [de], a
	inc de
	ldh a, [$cb]
	ld [de], a
	dec de
	ld hl, $98b0
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call Func_113f
	pop bc
	push bc
	ld a, 4
	ld [wd9d7], a
	call Func_114c
	ldh a, [$cc]
	ld de, $d1f5
	ld [de], a
	inc de
	ldh a, [$cb]
	ld [de], a
	dec de
	ld hl, $98f0
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call Func_113f
	pop bc
	push bc
	ld a, 5
	ld [wd9d7], a
	call Func_114c
	ldh a, [$cc]
	ld de, $d1f5
	ld [de], a
	inc de
	ldh a, [$cb]
	ld [de], a
	dec de
	ld hl, $9930
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call Func_113f
	pop bc
	ret

BGMap_02b_4910: INCBIN "gfx/image_2b_4910.tilemap"
AttrMap_02b_49a0: INCBIN "gfx/image_2b_49a0.gbcattr"

; 攻擊 防禦 速度 法力 魔防 (Attack Defense Speed Magic Magic-Defense)
StatNames_Text:
	db $f0, $24, $07, $0a, $0b
	db $f1, $70, $71
	db $f0, $bb, $19
	db $f1, $72
	db $f0, $0a
	db $ed

Func_02b_4a40:
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 1
	add hl, bc
	ld a, [hl]
	inc a
	ld [wd9e8], a
	ret

Func_02b_4a52:
	ld a, [wd9e8]
	and a
	jr z, Func_02b_4a60
	cp $63
	jr c, Func_02b_4a61
	ld a, $63
	jr Func_02b_4a61

Func_02b_4a60:
	inc a

Func_02b_4a61:
	cp $3d
	jr nc, Func_02b_4a79
	ld de, ExpTable
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [$cd], a
	ld a, [hli]
	ldh [$cc], a
	ld a, [hli]
	ldh [$cb], a
	jr Func_02b_4a8d

Func_02b_4a79:
	ld de, ExpTable
	sub $3d
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [$cd], a
	ld a, [hli]
	ldh [$cc], a
	ld a, [hli]
	ldh [$cb], a

Func_02b_4a8d:
	ret

Func_02b_4a8e:
	xor a
	ldh [$cd], a
	ldh [$cc], a
	ld a, d
	ldh [$cb], a
	ldh [$c7], a
	jp Func_02b_4b41

; TODO: confirm. No direct ref; header ($11,$45,$54) then mixed byte data.
unk_02b_4a9b:
	db $11
	db $0
	db $0
	db $0
	db $45
	db $0
	db $0
	db $0
	db $54
	db $0
	db $0
	db $0
	db $34
	db $a
	db $0
	db $1e
	db $34
	db $14
	db $0
	db $46
	db $65
	db $8f
	db $64
	db $8c
	db $0
	db $3
	db $4
	db $8
	db $5
	db $9
	db $a
	db $9
	db $2
	db $1
	db $4
	db $8
	db $a
	db $3
	db $4
	db $1
	db $1
	db $4
	db $1
	db $6
	db $7
	db $9
	db $2
	db $8
	db $8
	db $4
	db $1
	db $3
	db $5
	db $6
	db $3
	db $1
	db $9
	db $3
	db $1
	db $2
	db $8
	db $a
	db $3
	db $4
	db $2
	db $1
	db $9
	db $8
	db $3
	db $6
	db $1
	db $9
	db $4
	db $2
	db $1
	db $1
	db $5
	db $8
	db $3
	db $9
	db $6
	db $5
	db $2
	db $6
	db $1
	db $7
	db $3
	db $4
	db $9
	db $8
	db $1
	db $9
	db $6
	db $2
	db $2
	db $3
	db $1
	db $8
	db $3
	db $9
	db $2
	db $a
	db $3
	db $2
	db $5
	db $8
	db $1
	db $a
	db $2
	db $9
	db $3
	db $9
	db $6
	db $2
	db $3
	db $7
	db $2
	db $2
	db $1
	db $3
	db $5
	db $1
	db $1
	db $6
	db $3
	db $4
	db $2
	db $9
	db $6
	db $9
	db $1
	db $3
	db $8
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $2
	db $0
	db $2
	db $1
	db $1
	db $1
	db $0
	db $1
	db $2
	db $1
	db $5
	db $0
	db $2
	db $5
	db $1
	db $4
	db $2
	db $1
	db $0
	db $3
	db $3
	db $3
	db $2
	db $5
	db $4

Func_02b_4b41:
	push hl
	push bc
	push de
	farcall Func_025_414a
	pop de
	pop bc
	pop hl
	ret

Func_02b_4b4e:
	push hl
	push de
	push bc
	farcall asm_025_41b8
	pop bc
	pop de
	pop hl
	ret

Func_02b_4b5b:
	ld a, [wd986]
	and a
	jr nz, Func_02b_4b69
	ld a, [wd9b5]
	and a
	jr nz, Func_02b_4b6f
	jr Func_02b_4b74

Func_02b_4b69:
	ld a, [wd9b5]
	and a
	jr nz, Func_02b_4b74

Func_02b_4b6f:
	xor a
	ld [wd9b2], a
	ret

Func_02b_4b74:
	ld a, 1
	ld [wd9b2], a
	ret

Func_02b_4b7a:
	ld a, [wd9b2]
	and a
	ret z
	ld de, $db00
	ld a, [wd987]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, [wd9ca]
	ld l, a
	ld a, [wd9cb]
	ld h, a
	add hl, de
	ld a, l
	ld [wd9ca], a
	ld a, h
	ld [wd9cb], a
	pop hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wd9cc]
	ld l, a
	ld a, [wd9cd]
	ld h, a
	add hl, de
	ld a, l
	ld [wd9cc], a
	ld a, h
	ld [wd9cd], a
	ret

Func_02b_4bb7:
	ld a, [wd9b2]
	and a
	jp nz, Func_02b_4c48
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 0
	ld a, [wdb1c]
	and a
	jr z, Func_02b_4be4
	ld hl, 7
	add hl, bc
	ld b, $c
	ld de, $dcbc

Func_02b_4bde:
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, Func_02b_4bde

Func_02b_4be4:
	xor a
	ld [wd983], a
	ld [wdb18], a
	ld bc, $d200

Func_02b_4bee:
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	ld a, [bc]
	and a
	jr z, Func_02b_4c35
	ld hl, 2
	add hl, bc
	ld a, [hl]
	inc hl
	or [hl]
	jr z, Func_02b_4c35
	ld a, [bc]
	ld [wd9e5], a
	ld hl, $13
	add hl, bc
	ld a, [hl]
	res 4, a
	res 5, a
	ld [hl], a
	xor a
	ld [wd997], a
	ld [wd9b3], a
	ld [wd9b8], a
	ld [wd9b4], a
	ld [wd9bb], a
	ld [wd9ba], a
	ld [wd9ea], a
	ld hl, $d978
	ld c, 4
	xor a

Func_02b_4c2d:
	ld [hli], a
	dec c
	jr nz, Func_02b_4c2d
	call Func_02b_6a41
	ret

Func_02b_4c35:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, [wd983]
	inc a
	ld [wd983], a
	cp 6
	jr c, Func_02b_4bee
	xor a
	ret

Func_02b_4c48:
	ld a, [wd987]
	inc a
	ld [wd987], a
	ld hl, $d876
	ld bc, $16

Func_02b_4c55:
	add hl, bc
	dec a
	jr nz, Func_02b_4c55
	ld a, l
	ld [wd984], a
	ld a, h
	ld [wd985], a
	ld a, [hl]
	and a
	ret z
	ld [wEnemyMonSpecies], a
	ld hl, $13
	add hl, bc
	ld a, [hl]
	and a
	ld [hl], a
	xor a
	ld [wd996], a
	ld [wd9b9], a
	ld [wd9b4], a
	ld [wd9b3], a
	ld [wd9bb], a
	ld [wd9ba], a
	ld [wd9ea], a
	ld hl, $d97c
	ld c, 4
	xor a

Func_02b_4c8a:
	ld [hli], a
	dec c
	jr nz, Func_02b_4c8a
	call Func_02b_6a41
	ret

Func_02b_4c92:
	call Func_02b_4519
	call DelayFrame
	ld a, $80
	ldh [$40], a
	ld hl, $2b38
	call CopyBackgroundPalettes
	ld hl, $2b38
	call CopyObjectPalettes
	ld hl, $c000
	ld bc, $28
	ld de, 4

Func_02b_4cb1:
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, Func_02b_4cb1
	call DelayFrame
	ld a, [wd9ec]
	ldh [$ae], a
	ld a, [wd9ed]
	ldh [$af], a
	ld a, [wd9ee]
	ldh [$b0], a
	ld a, [wd9ef]
	ldh [$b1], a
	xor a
	ldh [$bf], a
	ld [wd0d4], a
	ld [wd08a], a
	ldh [$d3], a
	call ClearBGMap0
	call DelayFrame
	call LoadMapGFX
	ld de, $c920
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1412
	ld a, $14
	ldh [$92], a
	ld a, $12
	ldh [$93], a
	call PlaceTilemap
	farcall Func_025_57a0
	call DelayFrame
	call Func_02b_7506
	call Func_02b_4d81
	ld a, 1
	ld [hFFAC], a
	ld [wdcd0], a
	xor a
	ld [wPlayerAnimFrame], a
	call Func_05f2
	call DelayFrame
	call Func_02b_4d55
	call asm_02b_4000
	ld a, $c7
	ldh [$40], a
	ld a, $1c
	ld [wdce7], a
	ldh [$48], a
	ldh [$49], a
	ld hl, $cb30
	ld de, $cab0
	ld bc, $80
	call CopyBytes3
	call DelayFrame
	ld hl, $cab0
	call CopyBackgroundPalettes
	ld hl, $caf0
	call CopyObjectPalettes
	call DelayFrame
	call PlayMapMusic
	call Func_19b6
	ret

Func_02b_4d55:
	ld bc, $cd20

Func_02b_4d58:
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, Func_02b_4d75
	ld hl, $d
	add hl, bc
	ld [hl], 1
	ld hl, 5
	add hl, bc
	ld [hl], 0
	xor a
	ld [wScriptByte], a
	push bc
	call Func_06f8
	pop bc

Func_02b_4d75:
	ld hl, $20
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jr c, Func_02b_4d58
	ret

Func_02b_4d81:
	ld hl, $d1a0
	ld c, $40
	xor a

Func_02b_4d87:
	ld [hli], a
	dec c
	jr nz, Func_02b_4d87
	ret

HandleBattleTurns:
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Func_02b_4e27
	dw Func_02b_4ec2
	dw Func_02b_51ac
	dw Func_02b_525a
	dw Func_02b_5547
	dw Func_02b_55d4
	dw Func_02b_5559
	dw Func_02b_523d
	dw Func_02b_4dc9
	dw Func_02b_4daf

Func_02b_4daf:
	call DelayFrame
	call BattleMenu_Jump_4
	call DelayFrame
	call BattleMenu_Jump_1
	call DelayFrame
	call BattleMenu_Jump_2
	call DelayFrame
	xor a
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_4dc9:
	call DelayFrame
	call BattleMenu_Jump_4
	call DelayFrame
	call BattleMenu_Jump_1
	call DelayFrame
	call BattleMenu_Jump_2
	call DelayFrame
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, [wd9ea]
	cp 1
	jr nz, Func_02b_4e02
	xor a
	ld [wd9b5], a
	ld a, $31
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [wd986], a
	ld a, 1
	ld [wd98a], a
	ret

Func_02b_4e02:
	ld a, [wdcaf]
	and a
	ret z
	xor a
	ld [wdcaf], a
	ld a, 1
	ld [wd986], a
	ld a, 1
	ld [wd98a], a
	ld a, 3
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wd9b5], a
	ld [wd98b], a
	ret

Func_02b_4e27:
	call Func_02b_7525
	ld hl, $9980
	ld bc, $0906
	ld a, 9
	ldh [$92], a
	ld a, 6
	ldh [$93], a
	call ClearBGMapBox
	ld hl, $9909
	ld bc, $0b0a
	ld a, $b
	ldh [$92], a
	ld a, $a
	ldh [$93], a
	call ClearBGMapBox
	ld bc, $0480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld de, $6e7a
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [$92], a
	ldh [$93], a
	call PlaceTilemap
	ld de, $6e9e
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [$92], a
	ldh [$93], a
	call PlaceAttrmap
	ld de, $6f0a
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [$92], a
	ld a, 4
	ldh [$93], a
	call PlaceTilemap
	ld de, $6f32
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [$92], a
	ld a, 4
	ldh [$93], a
	call PlaceAttrmap
	call Func_02b_402b
	ld de, $6dde
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [$92], a
	ld a, 6
	ldh [$93], a
	call PlaceTilemap
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_4ec2:
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [wd98a], a
	ld a, [wd9e3]
	cp $1f
	jr z, Func_02b_4ee4
	cp $20
	jr z, Func_02b_4ee4
	ld a, [wd9e2]
	cp $1f
	jr z, Func_02b_4eeb
	cp $20
	jr z, Func_02b_4eeb
	jr Func_02b_4ef1

Func_02b_4ee4:
	ld a, 1
	ld [wd986], a
	jr Func_02b_4f2b

Func_02b_4eeb:
	xor a
	ld [wd986], a
	jr Func_02b_4f2b

Func_02b_4ef1:
	ld a, [wd983]
	ld [wSelectedOption], a
	ld a, 3
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [$cb]
	ld [wd0c1], a
	ld a, 3
	ld [wd9d7], a
	farcall Func_025_4101
	ld a, 1
	ld [wd986], a
	ld a, [wd9ea]
	cp 2
	jr z, Func_02b_4f2b
	ldh a, [$cb]
	ld b, a
	ld a, [wd0c1]
	cp b
	jr nc, Func_02b_4f2b
	xor a
	ld [wd986], a

Func_02b_4f2b:
	call Func_02b_4f7b
	ld a, [wBattleIntroJumptableIndex]
	cp 2
	ret nz
	call Func_02b_4f38
	ret

Func_02b_4f38:
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd986]
	and a
	jr nz, Func_02b_4f4a
	ld a, [wd9b4]
	and a
	ret z
	jr Func_02b_4f4f

Func_02b_4f4a:
	ld a, [wd9b3]
	and a
	ret z

Func_02b_4f4f:
	xor a
	ld [wd9b5], a
	ld a, $3f
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ld a, [wd986]
	and a
	jr nz, Func_02b_4f69
	xor a
	ld [wd9b4], a
	jr Func_02b_4f6d

Func_02b_4f69:
	xor a
	ld [wd9b3], a

Func_02b_4f6d:
	xor a
	ld [wd9b2], a
	ld a, 5
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

Func_02b_4f7b:
	ld a, [wd986]
	and a
	jr nz, Func_02b_4f8b
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr Func_02b_4f9d

Func_02b_4f8b:
	ld a, [wd9f6]
	and a
	ret nz
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a

Func_02b_4f9d:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 1, a
	jp nz, Func_02b_5074
	bit 4, a
	jp nz, Func_02b_5113
	bit 5, a
	jp nz, Func_02b_514b
	bit 7, a
	jp nz, Func_02b_517d
	ret

Func_02b_4fb7:
	ld a, [wd986]
	and a
	jr nz, Func_02b_4fc7
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr Func_02b_4fd9

Func_02b_4fc7:
	ld a, [wd9f6]
	and a
	ret nz
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a

Func_02b_4fd9:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 0, a
	jp nz, Func_02b_50a9
	ret

Func_02b_4fe4:
	ld a, [wd986]
	and a
	jr nz, Func_02b_4ff4
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr Func_02b_5006

Func_02b_4ff4:
	ld a, [wd9f6]
	and a
	ret nz
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a

Func_02b_5006:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 1, a
	jp nz, Func_02b_5074
	bit 2, a
	jp nz, Func_02b_502a
	bit 3, a
	jp nz, Func_02b_503f
	bit 4, a
	jp nz, Func_02b_5113
	bit 5, a
	jp nz, Func_02b_514b
	bit 7, a
	jp nz, Func_02b_517d
	ret

Func_02b_502a:
	xor a
	ld [wd9b5], a
	xor a
	ld [wd9d7], a
	farcall Func_025_40d9
	ld a, $19
	ld [wd3ff], a
	jr Func_02b_5044

Func_02b_503f:
	ld a, $18
	ld [wd3ff], a

Func_02b_5044:
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	xor a
	ldh [$cd], a
	ld a, $a
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cc]
	and a
	jr nz, Func_02b_5069
	ldh a, [$cb]
	and a
	jr nz, Func_02b_5069
	ld a, 1

Func_02b_5069:
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	call Func_02b_409e
	ret

Func_02b_5074:
	call AdvanceRNG
	ld a, [wd991]
	and 3
	jr nz, Func_02b_5089
	ld a, $1e
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_5089:
	ld a, [hl]
	res 1, a
	ld [hl], a
	xor a
	ld [wd9b5], a
	ld a, $1e
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wd9b2], a
	ld a, 5
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

Func_02b_50a9:
	xor a
	ld [wd9b2], a
	ld [wd9b5], a
	ld a, 2
	ld [wd9af], a
	call Func_125b
	ldh [$cb], a
	ld a, 3
	ld [wd9af], a
	call Func_125b
	ldh [$cc], a
	xor a
	ldh [$cd], a
	ld a, $f
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cb]
	and a
	jr nz, Func_02b_50d8
	ld a, 1

Func_02b_50d8:
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ld de, $d9ba
	ld a, [wd986]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, Func_02b_50fe
	ld a, 2
	ldh [$c7], a
	ldh [$cb], a
	farcall Func_025_414a
	ldh a, [$cb]
	ld [wd9b0], a

Func_02b_50fe:
	call Func_02b_409e
	ld a, $1a
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ret

Func_02b_5113:
	call AdvanceRNG
	ld a, [wd991]
	and 3
	jr z, Func_02b_512c
	xor a
	ld [wd9b5], a
	ld a, $25
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_512c:
	ld a, [hl]
	res 4, a
	ld [hl], a
	ld a, $26
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wd9b2], a
	ld [wd9b5], a
	ld a, 5
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

Func_02b_514b:
	call AdvanceRNG
	ld a, [wd991]
	and 3
	jr z, Func_02b_516c
	call AdvanceRNG
	ld a, [wd991]
	and 1
	push af
	ld de, $d996
	ld a, [wd986]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop af
	ld [hl], a
	ret

Func_02b_516c:
	ld a, [hl]
	res 5, a
	ld [hl], a
	ld de, $d996
	ld a, [wd986]
	ld l, a
	ld h, 0
	add hl, de
	ld [hl], 0
	ret

Func_02b_517d:
	ld a, [wd986]
	and a
	jr z, Func_02b_518d
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr Func_02b_5195

Func_02b_518d:
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a

Func_02b_5195:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	res 7, a
	ld [hl], a
	ld a, $24
	ld [wd3ff], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wd9b5], a
	ret

Func_02b_51ac:
	call Func_02b_5270
	ld de, $d9f5
	ld a, [wd986]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, Func_02b_51eb
	cp 1
	jr z, Func_02b_51d9
	ld a, $4f
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	ld a, 5
	ldh [$d3], a
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_51d9:
	ld a, $50
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_5578
	ret

Func_02b_51eb:
	ld de, $d996
	ld a, [wd986]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, Func_02b_520c
	ld a, $23
	ld [wd3ff], a
	ld de, $d9e2
	ld a, [wd986]
	ld l, a
	ld h, 0
	add hl, de
	ld [hl], $8d
	jr Func_02b_522d

Func_02b_520c:
	ld a, [wd9ea]
	cp 2
	jr nz, Func_02b_5220
	ld a, [wd986]
	and a
	jr z, Func_02b_5220
	ld a, $30
	ld [wd3ff], a
	jr Func_02b_522d

Func_02b_5220:
	call AdvanceRNG
	ld a, [wd991]
	and 3
	add $a
	ld [wd3ff], a

Func_02b_522d:
	xor a
	ld [wd9b5], a
	farcall Func_02d_4000
	ld a, 3
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_523d:
	farcall Func_02d_4000
	call DelayFrame
	ld a, [wd088]
	ld e, a
	ld a, [wd089]
	ld d, a
	farcall unk_02e_4000
	ld a, 4
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_525a:
	xor a
	ld [wd989], a
	farcall Func_02e_400a
	ld a, [hBattleJumptableIndex]
	cp 5
	ret z
	ld a, 4
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_5270:
	ld a, [wd986]
	and a
	ret nz
	ld a, [wd9b9]
	and a
	jr nz, Func_02b_5289
	ld a, 5
	ld [wd9af], a
	xor a
	ld [wd9b2], a
	call GetStatTile
	and a
	ret nz

Func_02b_5289:
	ld de, BattleAI_ActionIndex
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld l, [hl]
	ld h, 0
	add hl, de
	ld l, [hl]
	ld h, 0
	ld de, .Jumptable
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
	ret

.Jumptable:
	dw Func_02b_52bb
	dw Func_02b_52bb
	dw Func_02b_52d3
	dw Func_02b_5327
	dw Func_02b_5362
	dw Func_02b_5372
	dw Func_02b_53b9
	dw Func_02b_53d3
	dw Func_02b_53e8
	dw Func_02b_53f5
	dw Func_02b_540f

Func_02b_52bb:
	call AdvanceRNG
	ld a, [wd991]
	cp $cc
	jp nc, Func_02b_5327
	call AdvanceRNG
	ld a, [wd991]
	and 1
	inc a
	ld [wd9f5], a
	ret

Func_02b_52d3:
	call Func_12bd
	ld a, [wd99a]
	ldh [$cb], a
	ld a, [wd99b]
	ldh [$cc], a
	ld a, 2
	ldh [$c7], a
	farcall Func_025_414a
	ld a, $a
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cc]
	ld b, a
	ld a, [wd999]
	cp b
	jr z, Func_02b_5300
	jp nc, Func_02b_530e

Func_02b_5300:
	ldh a, [$cb]
	ld b, a
	ld a, [wd998]
	cp b
	jp nc, Func_02b_530e
	ld a, 3
	jr Func_02b_532f

Func_02b_530e:
	call AdvanceRNG
	ld a, [wd991]
	and 3
	cp 3
	jp z, Func_02b_530e
	jr Func_02b_532f

Func_02b_531d:
	call AdvanceRNG
	ld a, [wd991]
	and 1
	jr Func_02b_532f

Func_02b_5327:
	call AdvanceRNG
	ld a, [wd991]
	and 3

Func_02b_532f:
	ld e, a
	add a
	add e
	ld e, a
	ld d, 0
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld bc, 7
	add hl, bc
	add hl, de
	ld a, [hli]
	and a
	jr z, Func_02b_5327
	ld [wd9e2], a
	cp $7b
	jr nz, Func_02b_5353
	ld a, [wd9b9]
	and a
	jr z, Func_02b_5327

Func_02b_5353:
	cp $7a
	jr z, Func_02b_5357

Func_02b_5357:
	ld a, [wd9b9]
	and a
	ret z
	ld a, $7b
	ld [wd9e2], a
	ret

Func_02b_5362:
	call AdvanceRNG
	ld a, [wd991]
	and 1
	jp z, Func_02b_530e
	ld a, 3
	jp Func_02b_532f

Func_02b_5372:
	call Func_12bd
	ld a, [wd99a]
	ldh [$cb], a
	ld a, [wd99b]
	ldh [$cc], a
	ld a, 5
	ldh [$c7], a
	farcall Func_025_414a

Func_02b_5389:
	ld a, $a
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cc]
	ld b, a
	ld a, [wd999]
	cp b
	jr z, Func_02b_539f
	jp nc, Func_02b_530e

Func_02b_539f:
	ldh a, [$cb]
	ld b, a
	ld a, [wd998]
	cp b
	jp nc, Func_02b_530e
	call AdvanceRNG
	ld a, [hFFCB]
	cp $80
	jp nc, Func_02b_530e
	ld a, 3
	jp Func_02b_532f

Func_02b_53b9:
	call Func_12bd
	ld a, [wd99a]
	ldh [$cb], a
	ld a, [wd99b]
	ldh [$cc], a
	ld a, 3
	ldh [$c7], a
	farcall Func_025_414a
	jp Func_02b_5389

Func_02b_53d3:
	call AdvanceRNG
	cp $cc
	jp nc, Func_02b_531d
	call AdvanceRNG
	ld a, [wd991]
	and 1
	add 2
	jp Func_02b_532f

Func_02b_53e8:
	call AdvanceRNG
	cp $80
	jp nc, Func_02b_530e
	ld a, 3
	jp Func_02b_532f

Func_02b_53f5:
	call Func_12bd
	ld a, [wd99a]
	ldh [$cb], a
	ld a, [wd99b]
	ldh [$cc], a
	ld a, 3
	ldh [$c7], a
	farcall Func_025_414a
	jp Func_02b_5389

Func_02b_540f:
	ld a, [wd9f7]
	and a
	jr nz, Func_02b_5419
	xor a
	jp Func_02b_532f

Func_02b_5419:
	call AdvanceRNG
	ld a, [wd991]
	and 1
	inc a
	ld [wd9f5], a
	ret

; TODO: confirm. Monster state byte -> Func_02b_5289 jumptable index.
BattleAI_ActionIndex:
	db $0
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3

GFX_02b_54c7:
	INCBIN "gfx/battle/image_2b_54c7.2bpp"

Func_02b_5547:
	ld hl, GFX_02b_54c7
	ld de, $8680
	ld bc, $80
	call CopyBytesVRAM
	farcall Func_030_4000

Func_02b_5559:
	ld a, [wd98b]
	and a
	jr nz, Func_02b_55c5

Func_02b_555f:
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_5e0f
	ldh a, [$d3]
	cp 5
	ret z
	call Func_02b_5cce
	ldh a, [$d3]
	cp 5
	ret z

Func_02b_5578:
	ld a, [wd98a]
	cp 2
	jr z, Func_02b_55a9
	inc a
	ld [wd98a], a
	call Func_02b_4fb7
	ld a, [hBattleJumptableIndex]
	cp 5
	ret z
	ld hl, $d986
	ld a, 1
	sub [hl]
	ld [hl], a
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wd98e], a
	call Func_02b_4fe4
	ld a, [wBattleIntroJumptableIndex]
	cp 2
	ret nz
	call Func_02b_4f38
	ret

Func_02b_55a9:
	call Func_02b_4fb7
	ld a, [hBattleJumptableIndex]
	cp 5
	ret z
	xor a
	ld [wd98a], a
	ld [wd98e], a
	ld [wd9ea], a
	ld [wBattleIntroJumptableIndex], a
	ld a, 2
	ld [hBattleJumptableIndex], a
	ret

Func_02b_55c5:
	ld a, 5
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_55cb:
	ld c, 32
.delay
	call DelayFrame
	dec c
	jr nz, .delay
	ret

Func_02b_55d4:
	ld a, [wd98b]
	cp 1
	jp z, Func_02b_5628
	cp 2
	jp z, Func_02b_5a30
	cp 3
	jp z, Func_02b_5a37
	cp 4
	jp z, Func_02b_5bfb
	cp 5
	jp z, Func_02b_5611
	cp 6
	jr z, Func_02b_55f7
	jp Func_02b_55a9


Func_02b_55f7:
	ld a, 2
	ld [wd9f6], a
	ld a, [wd993]
	and a
	jr nz, Func_02b_5607
	ld a, 1
	ld [wd9f6], a

Func_02b_5607:
	ld a, 4
	ldh [$d3], a
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	ret

Func_02b_5611:
	farcall Func_02d_4000
	call Func_02b_55cb
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [wd9b5], a
	ld a, 5
	ldh [$d3], a
	ret

Func_02b_5628:
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $5809
	farcall unk_02e_4000
	call DelayFrame
	ld a, 1
	ld [wd9b5], a
	ld a, $1b
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	jp Func_02b_55a9


Func_02b_5651:
	ld a, [wd9c7]
	and a
	jr nz, Func_02b_565f
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ret

Func_02b_565f:
	call Func_02b_591e
	ld hl, $d9c5
	ld a, [wd9c3]
	cp [hl]
	jr c, Func_02b_5677
	dec hl
	ld a, [wd9c2]
	cp [hl]
	jr c, Func_02b_5677
	call Func_02b_5884
	jr Func_02b_56e9

Func_02b_5677:
	call Func_02b_5912
	ldh [$c7], a
	ld a, [wd9c4]
	ldh [$cb], a
	ld a, [wd9c5]
	ldh [$cc], a
	xor a
	ldh [$cd], a
	farcall Func_025_414a
	ld a, $64
	ldh [$c7], a
	farcall asm_025_41b8
	call Func_02b_58df
	ldh [$c7], a
	farcall Func_025_414a
	ld a, $64
	ld [hFFC7], a
	farcall asm_025_41b8
	ld a, [wd9c7]
	ldh [$c7], a
	farcall Func_025_414a
	ld a, $a
	ld [hFFC7], a
	farcall asm_025_41b8
	ldh a, [$cb]
	push af
	ldh a, [$cc]
	push af
	call Func_02b_57bf
	ldh [$c7], a
	pop af
	ldh [$cc], a
	pop af
	ldh [$cb], a
	xor a
	ldh [$cd], a
	farcall Func_025_414a
	ld a, $64
	ldh [$c7], a
	farcall asm_025_41b8

Func_02b_56e9:
	ldh a, [$cc]
	ld [wd9b1], a
	and a
	jr z, Func_02b_5700
	ld a, $ff
	ldh [$cb], a
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	call Func_02b_5712
	ret

Func_02b_5700:
	ldh a, [$cb]
	ld [wd9b0], a
	and a
	jr nz, Func_02b_570e
	ld a, 1
	ld [wd9b0], a
	ret

Func_02b_570e:
	call Func_02b_5712
	ret

Func_02b_5712:
	ld a, [wd988]
	cp 4
	ret z
	call AdvanceRNG
	xor a
	ld [wd9b2], a
	ld a, 9
	ld [wd9af], a
	call GetStatTile
	cp $a
	jr z, Func_02b_5733
	ld a, [wd991]
	cp $26
	jr c, Func_02b_5739
	ret

Func_02b_5733:
	ld a, [wd991]
	cp $c
	ret nc

Func_02b_5739:
	ld a, $27
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ld a, [wd9b0]
	ldh [$cb], a
	ld a, [wd9b1]
	ldh [$cc], a
	xor a
	ldh [$cd], a
	ld a, $f
	ld [hFFC7], a
	farcall Func_025_414a
	ld a, $a
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cb]
	ld [wd9b0], a
	ldh a, [$cc]
	ld [wd9b1], a
	ld a, $14
	ld [wd3ff], a
	ret

Func_02b_577c:
	ld a, [wd3ff]
	and a
	ret nz
	ld a, [wd9c7]
	and a
	jr z, Func_02b_579b
	cp $14
	jr z, Func_02b_57a1
	cp $f
	jr z, Func_02b_57a7
	cp 5
	jr z, Func_02b_57ad
	cp 2
	jr z, Func_02b_57b3
	cp $a
	jr z, Func_02b_57b9

Func_02b_579b:
	ld a, $13
	ld [wd3ff], a
	ret

Func_02b_57a1:
	ld a, $14
	ld [wd3ff], a
	ret

Func_02b_57a7:
	ld a, $15
	ld [wd3ff], a
	ret

Func_02b_57ad:
	ld a, $16
	ld [wd3ff], a
	ret

Func_02b_57b3:
	ld a, $17
	ld [wd3ff], a
	ret

Func_02b_57b9:
	ld a, $35
	ld [wd3ff], a
	ret

Func_02b_57bf:
	ld a, [wd9c2]
	ld c, a
	ld a, [wd9c3]
	ld b, a
	ld a, [wd9c4]
	sub c
	ld l, a
	ldh [$cb], a
	ld a, [wd9c5]
	sbc b
	ld h, a
	ldh [$cc], a
	xor a
	ldh [$cd], a
	ld de, StatValueToGrade - 1
	xor a
	ld [wd9b2], a
	ld a, 1
	ld [wd9af], a
	call Func_125b
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cc]
	and a
	jr nz, Func_02b_5808
	ldh a, [$cb]
	cp $14
	jr nc, Func_02b_5808
	ld de, StatDeltaToValue
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ret

Func_02b_5808:
	ld a, 5
	ret

; TODO: confirm. Indexed by stat delta (< $14); descending values.
StatDeltaToValue:
	db $5a
	db $55
	db $50
	db $4b
	db $3c
	db $37
	db $32
	db $2d
	db $28
	db $23
	db $1e
	db $19
	db $14
	db $f
	db $f
	db $f
	db $f
	db $f
	db $f
	db $f
	db $0

; TODO: confirm. 1-based index -> grade tier (groups of 5, $2..$15).
StatValueToGrade:
	db $2
	db $2
	db $2
	db $2
	db $2
	db $3
	db $3
	db $3
	db $3
	db $3
	db $4
	db $4
	db $4
	db $4
	db $4
	db $5
	db $5
	db $5
	db $5
	db $5
	db $6
	db $6
	db $6
	db $6
	db $6
	db $7
	db $7
	db $7
	db $7
	db $7
	db $8
	db $8
	db $8
	db $8
	db $8
	db $9
	db $9
	db $9
	db $9
	db $9
	db $a
	db $a
	db $a
	db $a
	db $a
	db $b
	db $b
	db $b
	db $b
	db $b
	db $c
	db $c
	db $c
	db $c
	db $c
	db $d
	db $d
	db $d
	db $d
	db $d
	db $e
	db $e
	db $e
	db $e
	db $e
	db $f
	db $f
	db $f
	db $f
	db $f
	db $10
	db $10
	db $10
	db $10
	db $10
	db $11
	db $11
	db $11
	db $11
	db $11
	db $12
	db $12
	db $12
	db $12
	db $12
	db $13
	db $13
	db $13
	db $13
	db $13
	db $14
	db $14
	db $14
	db $14
	db $14
	db $15
	db $15
	db $15
	db $15
	db $15

Func_02b_5884:
	call Func_02b_5912
	ldh [$c7], a
	ld a, [wd9c2]
	ldh [$cb], a
	ld a, [wd9c3]
	ldh [$cc], a
	xor a
	ldh [$cd], a
	farcall Func_025_414a
	ld a, $64
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cb]
	ld c, a
	ldh a, [$cc]
	ld b, a
	ld a, [wd9c2]
	ld l, a
	ld a, [wd9c3]
	ld h, a
	add hl, bc
	ld a, [wd9c4]
	ld c, a
	ld a, [wd9c5]
	ld b, a
	ld a, l
	sub c
	ldh [$cb], a
	ld a, h
	sbc b
	ldh [$cc], a
	xor a
	ldh [$cd], a
	ld a, [wd9c7]
	ldh [$c7], a
	farcall Func_025_414a
	ld a, $a
	ld [hFFC7], a
	farcall asm_025_41b8
	ret

Func_02b_58df:
	ld a, 1
	ld [wd9b2], a
	ld [wd9af], a
	call Func_125b
	ld c, a
	xor a
	ld [wd9b2], a
	ld a, 1
	ld [wd9af], a
	call Func_125b
	cp c
	jr c, Func_02b_5900
	sub c
	ld de, $7623
	jr Func_02b_5906

Func_02b_5900:
	ld b, a
	ld a, c
	sub b
	ld de, $7638

Func_02b_5906:
	cp $14
	jr c, Func_02b_590c
	ld a, $14

Func_02b_590c:
	ld l, a
	ld h, 0
	add hl, de
	
	ld a, [hl]
	
	ret

Func_02b_5912:
	ld de, $7594
	ld a, [wd988]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ret

Func_02b_591e:
	xor a
	ld [wd9b2], a
	ld a, 1
	ld [wd9d7], a
	farcall Func_025_40d9
	xor a
	ld [wd9af], a
	ld [wd9b2], a
	ldh [$cd], a
	call GetStatTile
	ldh [$c7], a
	call Func_02b_59df
	call Func_02b_5998
	farcall Func_025_414a
	ld a, $a
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cb]
	ld [wd9c2], a
	ldh a, [$cc]
	ld [wd9c3], a
	ld a, 2
	ld [wd9b2], a
	ld a, 2
	ld a, 5
	ld [wd9d7], a
	farcall Func_025_40d9
	ld a, 1
	ld [wd9af], a
	ld [wd9b2], a
	xor a
	ldh [$cd], a
	call GetStatTile
	ldh [$c7], a
	farcall Func_025_414a
	ld a, $a
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cb]
	ld [wd9c4], a
	ldh a, [$cc]
	ld [wd9c5], a
	ret

Func_02b_5998:
	ld a, [wd986]
	and a
	jr z, Func_02b_59a8
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr Func_02b_59b0

Func_02b_59a8:
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

Func_02b_59b0:
	ld bc, $14
	add hl, bc
	ld a, [hl]
	cp $a
	jr c, Func_02b_59bf
	cp $10
	jr nc, Func_02b_59bf
	jr Func_02b_59c7

Func_02b_59bf:
	inc hl
	ld a, [hl]
	cp $a
	ret c
	cp $10
	ret nc

Func_02b_59c7:
	ld [wd9e9], a
	ld de, StatTypeRemap
	sub $a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [wd8ff]
	cp [hl]
	ret nz
	ldh a, [$c7]
	sub 5
	ldh [$c7], a
	ret

Func_02b_59df:
	ld a, [wd986]
	and a
	jr nz, Func_02b_59ef
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr Func_02b_59f7

Func_02b_59ef:
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

Func_02b_59f7:
	ld bc, $14
	add hl, bc
	ld a, [hl]
	cp 3
	jr c, Func_02b_5a06
	cp $a
	jr nc, Func_02b_5a06
	jr Func_02b_5a0d

Func_02b_5a06:
	inc hl
	cp 3
	ret c
	cp $a
	ret nc

Func_02b_5a0d:
	ld [wd9e9], a
	cp 9
	jr z, Func_02b_5a22
	ld de, StatTypeRemap
	sub 3
	ld l, a
	ld h, 0
	add hl, de
	ld a, [wd8ff]
	cp [hl]
	ret nz

Func_02b_5a22:
	ldh a, [$c7]
	add 3
	ldh [$c7], a
	ret

; TODO: confirm. 7-entry index remap.
StatTypeRemap:
	db $3
	db $2
	db $5
	db $1
	db $4
	db $6
	db $0

Func_02b_5a30:
	xor a
	ld [wd98b], a
	call Func_02b_5651

Func_02b_5a37:
	call Func_02b_5ef2
	xor a
	ld [wd98b], a
	ld a, [wd986]
	and a
	jp nz, Func_02b_5aed
	ld a, [wd9b5]
	and a
	jp nz, Func_02b_5af4

Func_02b_5a4c:
	call Func_02b_4296
	ldh a, [$cb]
	and a
	jr z, asm_02b_5aa5
	ld [wd98c], a
	call Func_02b_5b4f
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4296
	ldh a, [$cb]
	ld b, a
	ld a, [wd98c]
	sub b
	ld [wd98e], a
	call Func_02b_5b82
	ld a, [wd98e]
	and a
	jp z, Func_02b_5b4b

Func_02b_5a80:
	ld a, [wd98c]
	call Func_02b_4248
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	dec a
	ld [wd98c], a
	and a
	jr z, asm_02b_5aa5
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, Func_02b_5a80
	call Func_02b_402b
	jp Func_02b_5b4b

asm_02b_5aa5:
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr Func_02b_5ab7

asm_02b_5aaf:
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

Func_02b_5ab7:
	push hl
	pop bc
	ld hl, 2
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 0
	ld hl, $14
	add hl, bc
	ld a, [hl]
	cp 1
	jr z, asm_02b_5ae1
	inc hl
	ld a, [hl]
	cp 1
	jr z, asm_02b_5ae1
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ld a, 5
	ldh [$d3], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ret

asm_02b_5ae1:
	ld [wd9e9], a
	ld [hl], 0
	call Func_02b_5bc9
	ret
	jp Func_02b_555f

Func_02b_5aed:
	ld a, [wd9b5]
	and a
	jp nz, Func_02b_5a4c

Func_02b_5af4:
	call Func_02b_4374
	ldh a, [$cb]
	and a
	jr z, asm_02b_5aaf
	ld [wd98c], a
	call Func_02b_5b4f
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4374
	ldh a, [$cb]
	ld b, a
	ld a, [wd98c]
	sub b
	ld [wd98e], a
	call Func_02b_5b82
	ld a, [wd98e]
	and a
	jp z, Func_02b_5b4b

Func_02b_5b28:
	ld a, [wd98c]
	call Func_02b_4326
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	dec a
	ld [wd98c], a
	and a
	jp z, asm_02b_5aaf
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, Func_02b_5b28
	call Func_02b_402b

Func_02b_5b4b:
	call Func_02b_555f
	ret

Func_02b_5b4f:
	ld a, [wd9b0]
	ld c, a
	ld a, [wd9b1]
	ld b, a
	ld a, [wd999]
	cp b
	jr z, Func_02b_5b61
	jr nc, Func_02b_5b77
	jr Func_02b_5b67

Func_02b_5b61:
	ld a, [wd998]
	cp c
	jr nc, Func_02b_5b77

Func_02b_5b67:
	ld a, [wd998]
	ld [wd9b0], a
	ld a, [wd999]
	ld [wd9b1], a
	ld de, 0
	ret

Func_02b_5b77:
	ld a, [wd998]
	sub c
	ld e, a
	ld a, [wd999]
	sbc b
	ld d, a
	ret

Func_02b_5b82:
	ld a, [wd9c7]
	and a
	jr z, Func_02b_5ba5
	ld a, [wd98e]
	cp $28
	jr nc, Func_02b_5bc3
	cp $1e
	jr nc, Func_02b_5bbd
	cp $14
	jr nc, Func_02b_5bb7
	cp $a
	jr nc, Func_02b_5bb1
	cp 5
	jr nc, Func_02b_5bab
	ld a, $17
	ld [wd3ff], a
	ret

Func_02b_5ba5:
	ld a, $13
	ld [wd3ff], a
	ret

Func_02b_5bab:
	ld a, $16
	ld [wd3ff], a
	ret

Func_02b_5bb1:
	ld a, $35
	ld [wd3ff], a
	ret

Func_02b_5bb7:
	ld a, $34
	ld [wd3ff], a
	ret

Func_02b_5bbd:
	ld a, $15
	ld [wd3ff], a
	ret

Func_02b_5bc3:
	ld a, $14
	ld [wd3ff], a
	ret

Func_02b_5bc9:
	ld a, $2e
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	ld a, [wd99a]
	ld [wd9b0], a
	ld a, [wd99b]
	ld [wd9b1], a
	call Func_02b_5eb7
	ld a, 1
	ld [wd9b5], a
	call Func_02b_419d
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $2f
	ld [wd3ff], a
	ret

Func_02b_5bfb:
	xor a
	ld [wd98b], a
	ld a, [wd986]
	and a
	jr nz, Func_02b_5c52
	ld a, [wd9b5]
	and a
	jr nz, Func_02b_5c58

Func_02b_5c0b:
	call Func_02b_4296
	ldh a, [$cb]
	ld [wd98c], a
	call Func_02b_5ca2
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4296
	ld a, [wd98c]
	ld b, a
	ldh a, [$cb]
	sub b
	inc a
	ld [wd98e], a

Func_02b_5c33:
	ld a, [wd98c]
	call Func_02b_4248
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, Func_02b_5c33
	jp Func_02b_5b4b

Func_02b_5c52:
	ld a, [wd9b5]
	and a
	jr nz, Func_02b_5c0b

Func_02b_5c58:
	call Func_02b_4374
	ldh a, [$cb]
	ld [wd98c], a
	call Func_02b_5ca2
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4374
	ld a, [wd98c]
	ld b, a
	ldh a, [$cb]
	sub b
	inc a
	ld [wd98e], a

Func_02b_5c80:
	ld a, [wd98c]
	call Func_02b_4326
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, Func_02b_5c80
	call Func_02b_402b
	jp Func_02b_5b4b

Func_02b_5ca2:
	ld a, [wd9b0]
	ld c, a
	ld a, [wd9b1]
	ld b, a
	ld a, [wd998]
	ld l, a
	ld a, [wd999]
	ld h, a
	add hl, bc
	ld e, l
	ld d, h
	ld a, [wd99b]
	cp d
	jr c, Func_02b_5cc5
	jr z, Func_02b_5cbf
	jr nc, Func_02b_5ccd

Func_02b_5cbf:
	ld a, [wd99a]
	cp e
	jr nc, Func_02b_5ccd

Func_02b_5cc5:
	ld a, [wd99a]
	ld e, a
	ld a, [wd99b]
	ld d, a

Func_02b_5ccd:
	ret

Func_02b_5cce:
	ld a, [wd986]
	and a
	jr z, Func_02b_5ce7
	call Func_02b_4374
	ld a, [wd981]
	ld l, a
	ld [wd3f0], a
	ld a, [wd982]
	ld h, a
	ld [wd3f1], a
	jr Func_02b_5cf8

Func_02b_5ce7:
	call Func_02b_4296
	ld a, [wd984]
	ld l, a
	ld [wd3f0], a
	ld a, [wd985]
	ld h, a
	ld [wd3f1], a

Func_02b_5cf8:
	xor a
	ld [wd9b5], a
	ld bc, $14
	add hl, bc
	ld a, [hl]
	cp 2
	call z, Func_02b_5d28
	cp $12
	call z, Func_02b_5d98
	cp $13
	call z, Func_02b_5d98
	cp $14
	call z, Func_02b_5d98
	inc hl
	ld a, [hl]
	cp 2
	jr z, Func_02b_5d28
	cp $12
	jr z, Func_02b_5d98
	cp $13
	jr z, Func_02b_5d98
	cp $14
	jr z, Func_02b_5d98
	ret

Func_02b_5d28:
	push af
	push hl
	ld [wd9e9], a
	ld a, $2e
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_5d7e
	ld a, [wd99a]
	ldh [$cb], a
	ld a, [wd99b]
	ldh [$cc], a
	xor a
	ldh [$cd], a
	ld a, 5
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cb]
	ld [wd9b0], a
	ldh a, [$cc]
	ld [wd9b1], a
	xor a
	ld [wd9b5], a
	call Func_02b_419d
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $40
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	pop hl
	pop af
	ret

Func_02b_5d7e:
	ld a, [wd986]
	and a
	jr nz, Func_02b_5d8e
	ld a, [wd9b5]
	and a
	jr nz, Func_02b_5d94

Func_02b_5d8a:
	call Func_12bd
	ret

Func_02b_5d8e:
	ld a, [wd9b5]
	and a
	jr nz, Func_02b_5d8a

Func_02b_5d94:
	call Func_12bd
	ret

Func_02b_5d98:
	push af
	push hl
	ld [wd9e9], a
	farcall unk_025_4000
	ldh a, [$cb]
	cp $10
	jr nc, Func_02b_5e0c
	ld a, [wd9e9]
	cp $12
	jr z, Func_02b_5db8
	cp $13
	jr z, Func_02b_5dc3
	cp $14
	jr z, Func_02b_5dce

Func_02b_5db8:
	ld a, $14
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	jr Func_02b_5ddd

Func_02b_5dc3:
	ld a, $3c
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	jr Func_02b_5ddd

Func_02b_5dce:
	ld a, [wd99a]
	ld [wd9b0], a
	ld a, [wd99b]
	ld [wd9b1], a
	call Func_02b_5eb7

Func_02b_5ddd:
	ld a, $2e
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	xor a
	ld [wd9b5], a
	call Func_02b_419d
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $40
	ld [wd3ff], a
	pop hl
	ld [hl], 0
	pop af
	farcall Func_02d_4000
	call Func_02b_55cb
	ret

Func_02b_5e0c:
	pop hl
	pop af
	ret

Func_02b_5e0f:
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	call GetStatTile
	cp $63
	jp z, Func_02b_5fc1
	cp $70
	jp z, Func_02b_5ff2
	cp $7d
	jp z, Func_02b_60f7
	cp $88
	jp z, Func_02b_6159
	ret

Func_02b_5e31:
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp 5
	ret nz
	jp Func_02b_5e73

Func_02b_5e48:
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp 2
	ret nz
	jp Func_02b_5e73

Func_02b_5e5f:
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp 1
	ret nz

Func_02b_5e73:
	ld a, [wd9b1]
	and a
	jr nz, Func_02b_5ea6
	ld a, [wd9b0]
	cp $64
	jr z, Func_02b_5e82
	jr nc, Func_02b_5ea6

Func_02b_5e82:
	call Func_02b_5eb7
	ld a, 1
	ld [wd9b5], a
	call Func_02b_419d
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $40
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ret

Func_02b_5ea6:
	ld a, [wd9b0]
	sub $64
	ld [wd9b0], a
	ld a, [wd9b1]
	sbc 0
	ld [wd9b1], a
	ret

Func_02b_5eb7:
	ld a, [wd9b1]
	and a
	jr nz, Func_02b_5ec7
	ld a, [wd9b0]
	ldh [$cb], a
	xor a
	ldh [$cc], a
	jr Func_02b_5ece

Func_02b_5ec7:
	ldh [$cb], a
	ld a, [wd9b0]
	ldh [$cc], a

Func_02b_5ece:
	xor a
	ldh [$cd], a
	ld a, 2
	ldh [$c7], a
	farcall asm_025_41b8
	ldh a, [$cc]
	and a
	jr nz, Func_02b_5ee9
	ld [wd9b1], a
	ldh a, [$cb]
	ld [wd9b0], a
	ret

Func_02b_5ee9:
	ld [wd9b0], a
	ldh a, [$cb]
	ld [wd9b1], a
	ret

Func_02b_5ef2:
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	call GetStatTile
	cp $e
	jp z, Func_02b_5f46
	cp $3e
	jp z, Func_02b_5f46
	cp $70
	jp z, Func_02b_5ff2
	cp $77
	jp z, Func_02b_6040
	cp $7a
	jp z, Func_02b_608b
	cp $87
	jp z, Func_02b_612c
	cp $8a
	jp z, Func_02b_5e5f
	cp $8b
	jp z, Func_02b_5e48
	cp $8c
	jp z, Func_02b_5e31
	ret

Func_02b_5f2d:
	ld a, 1
	ld [wd9b2], a
	xor a
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, 1
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ret

Func_02b_5f46:
	ld a, [wd9b0]
	ld c, a
	ld a, [wd9b1]
	ld b, a
	ld a, 1
	ld [wd9b2], a
	ld a, 6
	ld [wd9af], a
	call GetStatTile
	ld l, a
	ld a, 7
	ld [wd9af], a
	call GetStatTile
	ld h, a
	add hl, bc
	ld a, 6
	ld [wd9af], a
	ld a, l
	call SetStatTile
	ld a, 7
	ld [wd9af], a
	ld a, h
	call SetStatTile
	ret

Func_02b_5f79:
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd9b1]
	and a
	jr nz, Func_02b_5f96
	ldh [$cc], a
	ld a, [wd9b0]
	ldh [$cb], a
	jr Func_02b_5f9d

Func_02b_5f96:
	ldh [$cb], a
	ld a, [wd9b0]
	ldh [$cc], a

Func_02b_5f9d:
	xor a
	ldh [$cd], a
	ld a, 2
	ldh [$c7], a
	farcall Func_025_414a
	ldh a, [$cc]
	and a
	jr nz, Func_02b_5fb8
	ld [wd9b1], a
	ldh a, [$cb]
	ld [wd9b0], a
	ret

Func_02b_5fb8:
	ld [wd9b0], a
	ldh a, [$cb]
	ld [wd9b1], a
	ret

Func_02b_5fc1:
	ld a, $5b
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	ld a, $a
	ld [wd9c7], a
	ld a, $63
	ld [wd988], a
	ld a, 1
	ld [wd9b5], a
	xor a
	ld [wd98b], a
	call Func_02b_4098
	ldh a, [$d3]
	cp 5
	ret z
	xor a
	ld [wd9b5], a
	call Func_02b_419d
	ret

Func_02b_5ff2:
	ld a, 1
	ld [wd9b2], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr z, Func_02b_6006
	call SetStatTile
	ret

Func_02b_6006:
	call SetStatTile
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd986]
	and a
	jr nz, Func_02b_602c
	ld a, [wd9c9]
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	xor a
	ld [wd9c9], a
	ret

Func_02b_602c:
	ld a, [wd9c8]
	ld [wEnemyMonSpecies], a
	call LoadEnemyMonPic
	farcall Func_026_4d47
	xor a
	ld [wd9c8], a
	ret

Func_02b_6040:
	ld a, $77
	ld [wd988], a
	xor a
	ld [wd989], a
	ld [wd98b], a
	ld de, $57ae
	farcall unk_02e_4000
	call DelayFrame
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile

Func_02b_6066:
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $13
	ld [wd3ff], a
	ld a, 1
	ld [hFFC6], a
	xor a
	ld [wd989], a
	ld [wd9ad], a
	ld [wd9ae], a
	ld [wd98b], a
	ld [wd98c], a
	ld [wd98e], a
	ret

Func_02b_608b:
	ld a, 1
	ld [wd9b2], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr z, Func_02b_60a1
	call SetStatTile
	jp Func_02b_60e4

Func_02b_60a1:
	call SetStatTile
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd986]
	and a
	jr nz, Func_02b_60cd
	xor a
	ld [wd9b8], a
	ld a, [wd9c9]
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	xor a
	ld [wd9c9], a
	jp Func_02b_60e4

Func_02b_60cd:
	xor a
	ld [wd9b9], a
	ld a, [wd9c8]
	ld [wEnemyMonSpecies], a
	call LoadEnemyMonPic
	farcall Func_026_4d47
	xor a
	ld [wd9c8], a

Func_02b_60e4:
	ld a, [wd8ff]
	cp 3
	jp z, Func_02b_6066
	cp 0
	jp z, Func_02b_6066
	cp 4
	jp z, Func_02b_6066
	ret

Func_02b_60f7:
	ld a, 1
	ld [wd9b2], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr nz, Func_02b_6115
	xor a
	call SetStatTile
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

Func_02b_6115:
	call SetStatTile
	ld a, [wd986]
	and a
	jr nz, Func_02b_6125
	ld a, [wd9e2]
	ld [wd9e3], a
	ret

Func_02b_6125:
	ld a, [wd9e3]
	ld [wd9e2], a
	ret

Func_02b_612c:
	ld a, 1
	ld [wd9b2], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp $a
	ret z
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $22
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	ret

Func_02b_6159:
	ld a, 1
	ld [wd9b2], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr nz, Func_02b_6178
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, 5
	ld [wd9af], a
	xor a

Func_02b_6178:
	call SetStatTile
	ret

HandleBattleMoves:
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw BattleMoves_Init
	dw BattleMoves_Loop

BattleMoves_Init:
	ld a, $d
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	ld bc, $0d06
	ld hl, $9987
	call ClearBGMapBox
	ld bc, $0400
	ld hl, $8ab0
	xor a
	call ByteFillVRAM
	call DelayFrame
	call BattleMoves_LoadList
	ld de, $6fe4
	ld hl, $9909
	ld bc, $0b0a
	ld a, $b
	ldh [hVRAMCopyWidth], a
	ld a, $a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, $7052
	ld hl, $9909
	ld bc, $0b0a
	ld a, $b
	ldh [hVRAMCopyWidth], a
	ld a, $a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld bc, 7
	add hl, bc
	ld a, [wdb18]
	and a
	jr z, .got_move
	ld de, 3

.skip_move:
	add hl, de
	dec a
	jr nz, .skip_move

.got_move:
	ld d, [hl]
	call DelayFrame
	ld hl, Func_01e_42f1
	ld b, $1e
	rst FarCall
	ld de, $70c0
	ld hl, $9980
	ld bc, $0906
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld a, 1
	ld [wd1fc], a
	ld a, $77
	ld [wd8fe], a
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld bc, 8
	add hl, bc
	ld a, [wdb18]
	and a
	jr z, .got_pp
	ld de, 3

.skip_pp:
	add hl, de
	dec a
	jr nz, .skip_pp

.got_pp:
	ld e, l
	ld d, h
	ld a, [de]
	ld [wd97c + 4], a
	push de
	ld hl, $99a1
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call Func_113f
	pop de
	inc de
	ld hl, $99a4
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call Func_113f
	ld hl, wcde0
	ld [hl], $58
	ld a, [wdb18]
	swap a
	add [hl]
	ld [hl], a
	inc hl
	ld [hl], $58
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], 0
	ld a, [wdb18]
	ld [wSelectedOption], a
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMoves_LoadList:
	xor a
	ld [wd0c0], a
	ld a, $fd
	ld [wMenuTextEndX], a
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 7
	add hl, bc

.loop:
	ld a, [hli]
	and a
	jr z, .done
	ld [wd9d8], a
	ld a, [hli]
	ld [wd0c3], a
	ld a, [hli]
	ld [wPlayerMap2Y], a
	ld a, [wd0c0]
	add a
	add a
	add a
	add a
	add $ab
	ld [wMenuTextX], a
	xor a
	ld [wCharacterTilePos], a
	push hl
	ld hl, Func_026_4000
	ld b, $26
	rst FarCall
	pop hl
	ld a, [wd0c0]
	inc a
	ld [wd0c0], a
	cp 4
	jr nz, .loop

.done:
	ret

BattleMoves_Loop:
	call Func_02b_7536
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .done
	call BattleMenu_AnimCursor
	call BattleMoves_HandleInput
	jr BattleMoves_Loop

.done:
	xor a
	ldh [hFFC6], a
	ret

BattleMoves_HandleInput:
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .not_down
	ld a, [wSelectedOption]
	cp 3
	ret z
	inc a
	ld [wSelectedOption], a
	call BattleMoves_GetMoveID
	and a
	jr nz, .move_cursor
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret

.not_down:
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .not_up
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
	jr .move_cursor

.move_cursor:
	ld a, [wSelectedOption]
	swap a
	add $58
	ld [wcde0], a
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld bc, 7
	add hl, bc
	ld a, [wSelectedOption]
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	add hl, bc
	push hl
	ld d, [hl]
	ld hl, Func_01e_42f1
	ld b, $1e
	rst FarCall
	ld a, 1
	ld [wd1fc], a
	ld [wd0fd], a
	ld a, $77
	ld [wd8fe], a
	pop de
	inc de
	ld a, [de]
	ld [wd97c + 4], a
	push de
	ld hl, $99a1
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call Func_113f
	pop de
	inc de
	ld a, 1
	ld [wd0fd], a
	ld hl, $99a4
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call Func_113f
	ret

.not_up:
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .b_pressed
	ld a, [wd97c + 4]
	and a
	ret z
	call BattleMoves_GetCursorState
	and a
	ret nz
	ld a, [wd9e3]
	cp $7b
	jr nz, .check_pp
	ld a, [wd9b8]
	and a
	ret z

.check_pp:
	cp $7a
	jr nz, .select_move
	ld a, [wd9b8]
	and a
	ret nz

.select_move:
	ld a, [wSelectedOption]
	ld [wdb18], a
	ld a, 1
	ld [hFFC6], a
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld bc, 7
	add hl, bc
	ld a, [wSelectedOption]
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	add hl, bc
	inc hl
	dec [hl]
	ret

.b_pressed:
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld hl, $9980
	ld bc, $0906
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld hl, $9909
	ld bc, $0b0a
	ld a, $b
	ldh [hVRAMCopyWidth], a
	ld a, $a
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld a, 2
	ldh [hBattleJumptableIndex], a
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld [hFFC6], a
	ret

BattleMoves_GetCursorState:
	ld de, wd978
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ret

BattleMoves_GetMoveID:
	ld bc, 7
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	add hl, bc
	ld a, [wSelectedOption]
	and a
	jr z, .got_byte

.loop:
	ld bc, 3
	add hl, bc
	dec a
	jr nz, .loop

.got_byte:
	ld a, [hl]
	ret

HandleBattleMenu:
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw BattleMenu_Jump_1
	dw BattleMenu_Jump_2
	dw BattleMenu_Jump_3
	dw BattleMenu_Jump_4
	dw BattleMenu_Jump_5

BattleMenu_Jump_1:
	xor a
	ld [wd9f6], a
	ld [wd9f5], a
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	call DelayFrame
	call LoadEnemyMonPic
	farcall Func_026_4d47
	ld de, $6e56
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, $6ee6
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	call DelayFrame
	ld a, $55
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	ld a, [wd9e5]
	ld [wd9d8], a
	farcall asm_026_4616
	ld a, $61
	ld [wMenuTextX], a
	ld a, [wEnemyMonSpecies]
	ld [wd9d8], a
	farcall asm_026_4616
	ld hl, $70f6
	ld de, $96d0
	ld bc, $0130
	call CopyBytesVRAM
	call DelayFrame
	ld hl, $7226
	ld de, $8800
	ld bc, $02b0
	call CopyBytesVRAM
	ld hl, $74e6
	ld de, $8700
	ld bc, $20
	call CopyBytesVRAM
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMenu_Jump_2:
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld bc, $13
	add hl, bc
	ld a, [hl]
	set 6, a
	ld [hl], a
	ld de, $6e9e
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld a, [wd9f8]
	and a
	jr nz, .alt
	ld a, 1
	ld [wd988], a
	ld [wd9f8], a
	ld [wd9ea], a
	ld de, $55cc
	farcall unk_02e_4000
	xor a
	ld [wd9ea], a
	ret

.alt:
	ld de, $6e7a
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld de, $6f0a
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call DelayFrame
	ld de, $6f32
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld de, $6f5a
	ld hl, $982a
	ld bc, $0a03
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 3
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, $6f78
	ld hl, $982a
	ld bc, $0a03
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 3
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	call Func_02b_402b
	call BattleMenu_PrintHelpBar
	ld de, $6f96
	ld hl, $9987
	ld bc, $0d06
	ld a, $d
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	xor a
	ld [hFFC6], a
	ld hl, wcde0
	ld [hl], $78
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], 0
	xor a
	ld [wSelectedOption], a
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMenu_PrintHelpBar:
	call DelayFrame
	ld hl, .Text
	ld a, $ab
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

; 攻擊 道具 交換 逃跑 (Attack Item Switch Flee)
.Text:
	db $f0, $24, $07
	db $f1, $2c, $2d, $2e, $2f, $30, $31
	db $ed

BattleMenu_Jump_3:
	call Func_02b_7536
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .done
	call BattleMenu_AnimCursor
	call BattleMenu_HandleInput
	jr BattleMenu_Jump_3

.done:
	xor a
	ldh [hFFC6], a
	ret

BattleMenu_HandleInput:
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .not_right
	ld a, [wSelectedOption]
	bit 0, a
	ret nz
	set 0, a
	ld [wSelectedOption], a
	jr .move_cursor

.not_right:
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .not_left
	ld a, [wSelectedOption]
	bit 0, a
	ret z
	res 0, a
	ld [wSelectedOption], a
	jr .move_cursor

.not_left:
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .not_up
	ld a, [wSelectedOption]
	bit 1, a
	ret z
	res 1, a
	ld [wSelectedOption], a
	jr .move_cursor

.not_up:
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .a_button
	ld a, [wSelectedOption]
	bit 1, a
	ret nz
	set 1, a
	ld [wSelectedOption], a

.move_cursor:
	ld de, .CursorCoords
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld de, wcde0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

.a_button:
	ldh a, [hJoypadPressed]
	bit 0, a
	ret z
	ld a, [wSelectedOption]
	and a
	jr z, .selected_0
	cp 1
	jr z, .selected_1
	cp 2
	jp z, .selected_2
	cp 3
	jp z, .selected_3
	ret

.selected_0:
	ld a, [wd9b8]
	and a
	jr nz, .attack
	ld a, 1
	ld [wd986], a
	ld a, 5
	ld [wd9af], a
	xor a
	ld [wd9b2], a
	call GetStatTile
	and a
	jr z, .attack
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	call Func_02b_7506
	ret

.attack:
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 4, a
	jr nz, .attack_alt
	ld a, 3
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	call Func_02b_7506
	ret

.attack_alt:
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	call Func_02b_7506
	ret

.selected_1:
	ld a, 2
	ld [wd087], a
	ld a, 9
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, 1
	ldh [hFFC6], a
	xor a
	ld [wSelectedOption], a
	ld [wSelectedPage], a
	ld [wd1f4], a
	ld hl, wd088
	ld [hl], $4c
	inc hl
	ld [hl], $42
	call Func_02b_7506
	ret

.selected_2:
	ld a, 1
	ld [wd087], a
	ld a, 2
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, 1
	ldh [hFFC6], a
	xor a
	ld [wSelectedOption], a
	ld [wSelectedPage], a
	ld [wd1f4], a
	ret

.selected_3:
	ld a, [hFFD6]
	and a
	jr nz, .run_forced
	ld de, .RunChances
	ld a, [wd0e4 + 7]
	inc a
	ld [wd0e4 + 7], a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .run_set
	xor a
	ld [wd0e4 + 7], a
	jr .selected_3

.run_set:
	ld [wd9f6], a
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	ret

.run_forced:
	ld a, 1
	ld [wd9f6], a
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	ret

.RunChances:
	db $2, $2, $1, $1, $2, $2, $1, $2, $2, $2
	db $2, $1, $2, $2, $1, $2, $2, $2, $1, $2
	db $2, $1, $2, $1, $2, $1, $2, $2, $2, $2
	db $2, $2, $1, $1, $2, $2, $2, $1, $2, $2
	db $1, $2, $2, $1, $2, $2, $2, $1, $2, $2
	db -1

.CursorCoords:
	dw $4678
	dw $4688
	dw $7678
	dw $7688

BattleMenu_AnimCursor:
	ldh a, [hFadeFrameCounter]
	and 7
	ret nz
	ld bc, wcde0
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .grow
	ld a, [bc]
	dec a
	ld [bc], a
	jr .store

.grow:
	ld a, [bc]
	inc a
	ld [bc], a

.store:
	ld a, 1
	sub [hl]
	ld [hl], a
	ret

BattleMenu_Jump_4:
	ld hl, $2b38
	call CopyBackgroundPalettes
	ld hl, $2b38
	call CopyObjectPalettes
	ldh a, [hSCX]
	ld [wd0bc], a
	ldh a, [hSCXHigh]
	ld [wd0bc + 1], a
	ldh a, [hSCY]
	ld [wd0bc + 2], a
	ldh a, [hSCYHigh]
	ld [wd0bc + 3], a
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wd08a], a
	ld [hFFC6], a
	call ClearBGMap0
	ld hl, $6d66
	ld de, wca88 + $28
	ld bc, $30
	call CopyBytes3
	ld hl, $74d6
	ld de, wcaf0
	ld bc, $30
	call CopyBytes3
	ld hl, $6cd6
	ld de, $96d0
	ld bc, $90
	call CopyBytesVRAM
	call DelayFrame
	ld hl, $6c06
	ld de, $9000
	ld bc, $d0
	call CopyBytesVRAM
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld hl, wca88 + $28
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	ld a, [wdcad + 2]
	and a
	ret z
	ld a, 4
	ld [hBattleJumptableIndex], a
	ld a, 8
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMenu_Jump_5:
	ld a, 3
	ld [wBattleIntroJumptableIndex], a
	ret


HandleBattleIntro:
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw BattleIntro_Jump_1
	dw BattleIntro_Jump_2
	dw BattleIntro_Jump_3
	dw BattleIntro_Jump_4
	dw BattleIntro_Jump_5
	dw BattleIntro_Jump_6

BattleIntro_Jump_1:
	farcall Func_00b_4dc5
	call DelayFrame
	farcall Func_00b_4dc5
	call DelayFrame
	farcall Func_00b_4dc5
	call DelayFrame
	call AdvanceRNG
	ld a, [wd991]
	and 7
	ld [wdcd9], a
	xor a
	ld [wdcda], a
	farcall StartBattleTransition
	call DelayFrame
	ld a, $e1
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, $80
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	ld de, wcb30
	ld bc, $80
	call CopyBytes3
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4

asm_02b_68c3:
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, asm_02b_68c3
	ldh a, [hSCX]
	ld [wd9ec], a
	ldh a, [hSCXHigh]
	ld [wd9ed], a
	ldh a, [hSCY]
	ld [wd9ee], a
	ldh a, [hSCYHigh]
	ld [wd9ef], a
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wd9f8], a
	ld [wd08a], a
	ld [wd9cc], a
	ld [wd9cc + 1], a
	ld [wd9ca], a
	ld [wd9cb], a
	ld [wd9f6], a
	ld [wd9f5], a
	ld [wd9ea], a
	ld [wdb18], a
	ld [wd996], a
	ld [wd997], a
	ld [wd9b4], a
	ld [wd9b3], a
	ld [wd9b8], a
	ld [wd9b9], a
	call ClearBGMap0
	ld hl, wd978
	ld c, 8
	xor a

asm_02b_6922:
	ld [hli], a
	dec c
	jr nz, asm_02b_6922
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld bc, wPartyMons

asm_02b_692e:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, asm_02b_693a
	and 1
	ld [hl], a

asm_02b_693a:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, asm_02b_692e
	call DelayFrame
	ret

BattleIntro_Jump_2:
	call DelayFrame
	call PlayBattleMusic
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld a, [hl]
	ld [wd9e5], a
	farcall unk_02c_4000
	call DelayFrame
	farcall asm_00a_4593
	call Func_02b_6ad1
	call DelayFrame
	ld hl, unk_02b_6cd6
	ld de, $96d0
	ld bc, $90
	call CopyBytesVRAM
	ld hl, unk_02b_6c06
	ld de, $9000
	ld bc, $d0
	call CopyBytesVRAM
	call DelayFrame
	ld hl, unk_02b_6d66
	ld de, $cab0
	ld bc, $30
	call CopyBytes3
	ld hl, unk_02b_74d6
	ld de, $caf0
	ld bc, $30
	call CopyBytes3
	call DelayFrame
	ld de, unk_02b_6e56
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, unk_02b_6ee6
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld de, unk_02b_6e7a
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, unk_02b_6e9e
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	call DelayFrame
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	call Func_02b_6a41
	ret

PlayBattleMusic:
	ld de, BattleMusic
	ld a, [wBattleMusic]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	call PlaySound
	ret

PlayMusic_74:
	ld a, BGM_74
	call PlaySound
	ret

PlayMeteorMusic:
	ld a, BGM_METEOR
	call PlaySound
	ret

BattleMusic:
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1

Func_02b_6a33:
	ld hl, wd93c
	ld c, 6
	jr asm_02b_6a46

Func_02b_6a3a:
	ld hl, wd900
	ld c, 6
	jr asm_02b_6a46

Func_02b_6a41:
	ld hl, wd900
	ld c, $c

asm_02b_6a46:
	ld a, $a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, asm_02b_6a46
	ret

BattleIntro_Jump_3:
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld a, $40
	ldh [hSCX], a
	ld a, $c0
	ld [wWX], a
	xor a
	ld [wWY], a
	ld hl, $1072
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e1], a
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	ld a, 3
	ld [wBattleIntroJumptableIndex], a
	ret

BattleIntro_Jump_4:
	ldh a, [hSCX]
	sub 2
	ldh [hSCX], a
	ld a, [wWX]
	add 2
	ld [wWX], a
	and a
	jr z, asm_02b_6a9f
	ret

asm_02b_6a9f:
	ld a, 4
	ld [wBattleIntroJumptableIndex], a
	ld de, unk_02b_6d96
	ld hl, $98e1
	ld bc, $0904
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call Func_02b_6ae6
	ret
	ld de, unk_02b_6dde
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

Func_02b_6ad1:
	ld hl, wd86a
	ld a, $55
	ld [wMenuTextX], a
	ld a, $61
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_02b_6ae6:
	xor a
	ld [wd0c1], a
	ld de, $9942
	ld bc, wPartyMons

asm_02b_6af0:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, asm_02b_6b20
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, asm_02b_6b08
	call WaitVRAM_STAT
	ld a, $6d
	ld [de], a
	jr asm_02b_6b0e

asm_02b_6b08:
	call WaitVRAM_STAT
	ld a, $6e
	ld [de], a

asm_02b_6b0e:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 6
	jr c, asm_02b_6af0

asm_02b_6b20:
	xor a
	ld [wd0c1], a
	ld a, [wd9dc]
	and a
	ret z
	ld de, $988b
	ld bc, wd876

asm_02b_6b2f:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, asm_02b_6b46
	call WaitVRAM_STAT
	ld a, $6d
	ld [de], a
	jr asm_02b_6b4c

asm_02b_6b46:
	call WaitVRAM_STAT
	ld a, $6e
	ld [de], a

asm_02b_6b4c:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 6
	jr c, asm_02b_6b2f
	ret

BattleIntro_Jump_5:
	ld a, 1
	ld [wd986], a
	ld a, 1
	ld [wd9b5], a
	call AdvanceRNG
	ld a, [wd991]
	and 1
	add $55
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	xor a
	ld [wd9b5], a
	call AdvanceRNG
	ld a, [wd991]
	and 1
	add 2
	ld [wd3ff], a
	farcall Func_02d_4000
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	ld bc, $0904
	ld hl, $9829
	call ClearBGMapBox
	ld bc, $0904
	ld hl, $98e1
	call ClearBGMapBox
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	ld bc, $1406
	ld hl, $9980
	call ClearBGMapBox
	ld a, 5
	ld [wBattleIntroJumptableIndex], a
	ret

BattleIntro_Jump_6:
	ld a, [wWX]
	sub 4
	ld [wWX], a
	cp $c0
	ret nc
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	xor a
	ldh [hSCX], a
	ld [wWX], a
	ld a, 2
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	di
	ld a, $8f
	ldh [rLYC], a
	ei
	ld hl, $106f
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e1], a
	ret

unk_02b_6c06:
	dr $aec06, $aecd6

unk_02b_6cd6::
	dr $aecd6, $aed66

unk_02b_6d66::
	dr $aed66, $aed96

unk_02b_6d96::
	dr $aed96, $aedde

unk_02b_6dde::
	dr $aedde, $aee56

unk_02b_6e56::
	dr $aee56, $aee7a

unk_02b_6e7a::
	dr $aee7a, $aee9e

unk_02b_6e9e::
	dr $aee9e, $aeee6

unk_02b_6ee6::
	dr $aeee6, $af4d6

unk_02b_74d6::
	dr $af4d6, $af506

; Source entry consumed by BuildOAMList: y, x, tile, attr.
; The third source byte is skipped by the reader, so it is reserved.
MACRO oam_build_entry
	db \1 ; y, + base y in c
	db \2 ; x, + base x in b
	db 0  ; (skipped by reader)
	db \3 ; tile
	db \4 ; attr
ENDM


Func_02b_7506:
	ld hl, wcde0
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld hl, wcde3 + $d
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ret


Func_02b_7525:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret


Func_02b_7536:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ld [wd1fb], a
	call BuildOAMList
	ret


; Builds OAM entries from the list selected by wcde2.
; wcde0/wcde1 = base y/x offset, wd1fb = write cursor into wVirtualOAM.
BuildOAMList:
	ld hl, OAMList_Pointers
	ld de, wcde0
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.loop
	ld a, [hli]
	cp -1
	jr z, .done
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
	jr .loop
.done
	ld a, e
	ld [wd1fb], a
	ret


OAMList_Pointers:
	dw OAMList_758e
	dw OAMList_758e
	dw OAMList_758e

OAMList_758e:
	; y, x, tile, attr
	oam_build_entry $00, $00, $70, $01
	db -1


unk_02b_7594:
	dr $af594, $af619

; Paired ramp, ascending to $c8.
unk_02b_7619:
	dr $af619, $af638

; Paired ramp, descending to $00.
unk_02b_7638:
	dr $af638, $af650

