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
	ld [wd08e], a
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
	dr $ac3c2, $aca40

Func_02b_4a40:
    dr $aca40, $aca52

Func_02b_4a52:
    dr $aca52, $acd8c

HandleBattleTurns:
	dr $acd8c, $ad547

Func_02b_5547:
	dr $ad547, $ad5cb

Func_02b_55cb:
	ld c, 32
.delay
	call DelayFrame
	dec c
	jr nz, .delay
	ret

Func_02b_55d4:
	dr $ad5d4, $ad651

Func_02b_5651:
	dr $ad651, $adaa5

asm_02b_5aa5:
	dr $adaa5, $adaaf

asm_02b_5aaf:
	dr $adaaf, $adae1

asm_02b_5ae1:
	dr $adae1, $adb4f

Func_02b_5b4f:
	dr $adb4f, $adb82

Func_02b_5b82:
	dr $adb82, $adca2

Func_02b_5ca2:
	dr $adca2, $adef2

Func_02b_5ef2:
	dr $adef2, $ae17c

HandleBattleMoves:
	dr $ae17c, $ae417

HandleBattleMenu:
	dr $ae417, $ae847

HandleBattleIntro:
	dr $ae847, $af650

SECTION "banknum2b", ROMX[$7fff], BANK[$2b]
	db $2b
