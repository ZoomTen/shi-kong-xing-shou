StartBattle:
; battles only enabled after a certain scene?
	ldh a, [hMapPredef]
	cp MAPPREDEF_04
	ret c
; don't do battle while a scene transition is happening
	ldh a, [hFade]
	and a
	ret nz
	ld a, [wd0d3]
	and a
	ret z
	call .asm_4f7a
	and a
	ret z
	ld a, BGM_BATTLE_TRANSITION
	call PlaySound
	xor a
	ld [wd9dc], a
	ld [wd9bf], a
	ld a, $01
	ldh [hBattleJumptableIndex], a
	call InitBattleParticipants
	xor a
	ld [wBattleIntroJumptableIndex], a
	ldh [hFF9E], a
	ldh [hSimulatedJoypadState], a
	ld [wcd0a], a
	ret
.asm_4f7a
	ld a, [wd9eb]
	and a
	jr z, .asm_4f86
	dec a
	ld [wd9eb], a
	jr .asm_4fc9
.asm_4f86
	ld a, [wBattleCounter]
	inc a
	ld [wBattleCounter], a
	and $03
	call z, .asm_501d
	ld a, [wd0d3]
	cp $02
	jr z, .asm_4faa
	ld de, .table2
	ld a, [wBattleCounter]
	cp $19
	jr nc, .asm_4fbb
	ld l, a
	ld h, $00
	add hl, de
	ld b, [hl]
	jr .asm_4fbd
.asm_4faa
	ld de, .table1
	ld a, [wBattleCounter]
	cp $22
	jr nc, .asm_4fbb
	ld l, a
	ld h, $00
	add hl, de
	ld b, [hl]
	jr .asm_4fbd
.asm_4fbb
	ld b, $80
.asm_4fbd
	call AdvanceRNG
	ld a, [wd991]
	cp b
	jr nc, .asm_4fc9
	ld a, $01
	ret
.asm_4fc9
	xor a
	ret
.table1
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $0c, $0c, $0c
	db $0c, $0c, $18, $18, $18, $24, $24, $30, $30, $3c, $3c, $3c, $49, $49, $55, $55
	db $55, $61, $61, $61, $6d, $6d, $6d, $80, $80, $80, $80
.table2
	db $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $0c, $0c, $0c, $18, $18, $18
	db $24, $24, $24, $30, $30, $3c, $3c, $3c, $49, $49, $55, $55, $55, $61, $61, $61
	db $6d, $6d, $6d, $80, $80, $80, $80
.asm_501d
	push de
	ld d, $00
	ld bc, wPartyMons
.asm_5023
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5068
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, .asm_5068
	bit 0, a
	jr z, .asm_5068
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_5055
	dec hl
	ld a, [hl]
	sub $01
	ld [hli], a
	ld a, [hl]
	sbc $00
	ld [hl], a
	ld d, $01
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_5055
	jr .asm_5068
.asm_5055
	ld a, BGM_MONSTER_FAINTED
	call PlaySound
	ld hl, $0002
	add hl, bc
	ld [hl], $01
	ld hl, $0013
	add hl, bc
	ld [hl], $00
	jr .asm_5082
.asm_5068
	ld hl, $0016
	add hl, bc
	ld c, l
	ld b, h
	ld a, c
	cp $80
	jr c, .asm_5023
	ld a, d
	and a
	jr z, .asm_5082
	farcall Func_00b_4dc5
	ld a, SFX_17
	call PlaySound
.asm_5082
	pop de
	ret

CheckPartyAllFainted: ; unreferenced?
	ld bc, wPartyMons
.loop
	ld a, [bc]
	and a
	jr z, .nextMon
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	jr nz, .notFainted
.nextMon
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, l
	cp $80
	jr c, .loop
	ld a, $01
	ret
.notFainted
	xor a
	ret

InitBattleParticipants:
	farcall Func_02d_5086
	xor a
	ld [wd987], a
	ld hl, wd876
	ld a, l
	ld [wd984], a
	ld a, h
	ld [wd985], a
	ld a, [hl]
	ld [wEnemyMonSpecies], a

	ld bc, wPartyMons
	ld e, 0
.loop:
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .foundSlot

	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc e
	ld a, l
	cp $80
	ret nc

	ld c, l
	ld b, h
	jr .loop

.foundSlot:
	ld a, e
	ld [wd983], a
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	ret
