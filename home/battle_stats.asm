PrintNumber::
	homecall _PrintNumber
	ret

ComputeStatValue::
	homecall _ComputeStatValue
	ret

AdvanceRNG::
	push bc
	ld a, [wd991]
	ld b, a
	sla a
	sla a
	add b
	inc a
	ld b, a
	ldh a, [hFadeFrameCounter]
	add b
	ld b, a
	ldh a, [rLY]
	add b
	ld b, a
	ld a, [wGameTimeMinutes]
	add b
	ld b, a
	ld a, [wd991]
	add b
	ld [wd991], a
	pop bc
	ret

SetStatTile::
	push hl
	push de
	push bc
	push af
	ld a, [wd9af]
	ld b, a
	ld a, [wBattleTurn]
	and a
	jr nz, .enemyTurn
	ld a, [wSideSelect]
	and a
	jr nz, .attacker

.defender
	ld de, wd93c
	ld a, [wd987]
	jr .gotBase

.enemyTurn
	ld a, [wSideSelect]
	and a
	jr nz, .defender

.attacker
	ld de, wd900
	ld a, [wd983]

.gotBase
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	pop af
	ld [hl], a
	pop bc
	pop de
	pop hl
	ret

GetStatTile::
	push hl
	push de
	push bc
	ld a, [wd9af]
	ld b, a
	ld a, [wBattleTurn]
	and a
	jr nz, .enemyTurn
	ld a, [wSideSelect]
	and a
	jr nz, .attacker

.defender
	ld de, wd93c
	ld a, [wd987]
	jr .gotBase

.enemyTurn
	ld a, [wSideSelect]
	and a
	jr nz, .defender

.attacker
	ld de, wd900
	ld a, [wd983]

.gotBase
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

AddStatTile::
	push hl
	push de
	push bc
	push af
	ld a, [wd9af]
	ld b, a
	ld a, [wBattleTurn]
	and a
	jr nz, .enemyTurn

	ld a, [wSideSelect]
	and a
	jr nz, .attacker

.defender
	ld de, wd93c
	ld a, [wd987]
	jr .gotBase

.enemyTurn
	ld a, [wSideSelect]
	and a
	jr nz, .defender

.attacker
	ld de, wd900
	ld a, [wd983]

.gotBase
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld b, a
	pop af
	add b
	ld [hl], a
	ld a, [wd9af]
	cp 4
	jr nc, .done

	ld a, [hl]
	cp $0e
	jr nc, .clampHigh
	cp $07
	jr nc, .done

	ld [hl], $07
	jr .done

.clampHigh
	ld [hl], $0d

.done
	pop bc
	pop de
	pop hl
	ret

SwapMathValueBytes::
	push bc
	ldh a, [hMathValue + 2]
	and a
	jr nz, .done
	jr z, .byte2Zero

; inaccessible
	push af
	ldh a, [hMathValue]
	ldh [hMathValue + 2], a
	pop af
	ldh [hMathValue], a
	pop bc
	ret

.byte2Zero
	ldh a, [hMathValue + 1]
	and a
	jr z, .done

	ld b, a
	ldh a, [hMathValue]
	ldh [hMathValue + 1], a
	ld a, b
	ldh [hMathValue], a

.done
	pop bc
	ret

GetStatByte::
	push hl
	push de
	push bc
	ld a, [wd9af]
	ld c, a
	ld b, 0
	ld a, [wBattleTurn]
	and a
	jr nz, .enemyTurn

	ld a, [wSideSelect]
	and a
	jr nz, .attacker

.defender
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr .gotPointer

.enemyTurn
	ld a, [wSideSelect]
	and a
	jr nz, .defender

.attacker
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

.gotPointer
	add hl, bc
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

ComputeActiveMonStat::
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a

ComputeStatAtBC::
	ld hl, 2
	add hl, bc
	ld a, [hli]
	ld [wd998], a
	ld a, [hli]
	ld [wd999], a
	xor a
	ld [wd9d7], a
	homecall _ComputeStatValue
	ldh a, [hMathValue]
	ld [wd99a], a
	ldh a, [hMathValue + 1]
	ld [wd99b], a
	ret

ComputeEnemyMonStat::
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 2
	add hl, bc
	ld a, [hli]
	ld [wd998], a
	ld a, [hli]
	ld [wd999], a
	xor a
	ld [wd9d7], a
	farcall Func_025_4101
	ldh a, [hMathValue]
	ld [wd99a], a
	ldh a, [hMathValue + 1]
	ld [wd99b], a
	ret

