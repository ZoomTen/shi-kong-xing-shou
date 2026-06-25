DrainPartyHPOnField:
	ld a, [wdcfa]
	and a
	ret nz
	ld hl, $0005
	add hl, de
	ld a, [hl]
	cp $01
	jr z, .startDrain
	cp $02
	jr z, .startDrain
	ret
.startDrain
	ld a, $40
	ld [wdcfa], a
	call .drainParty
	ret
.drainParty
	ld bc, wPartyMon1
.monLoop
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nextMon
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr z, .checkHpLow
	jr nz, .subtractHp
	jr .setMinHp
.checkHpLow
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $06
	jr nc, .subtractHp
.setMinHp
	ld hl, $0003
	add hl, bc
	ld [hl], $00
	ld hl, $0002
	add hl, bc
	ld [hl], $01
	jr .nextMon
.subtractHp
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	sub $05
	ld [hl], a
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	sbc a, $00
	ld [hl], a
.nextMon
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, .monLoop
	ret
CheckFollowerMapTrigger:
	ldh a, [hMapGroup]
	cp $01
	ret nz
	ldh a, [hMapNumber]
	cp $1e
	jr z, .onTriggerMap
	cp $1f
	jr z, .onTriggerMap
	cp $20
	jr z, .onTriggerMap
	cp $21
	jr z, .onTriggerMap
	ret
.onTriggerMap
	ldh a, [hFF9E]
	cp $ff
	ret z
	ld a, $01
	ldh [hFFAC], a
	xor a
	ld [wcd0a], a
	ldh a, [hFF9E]
	ld hl, wPlayerFacing
	cp [hl]
	jr z, .facingMatches
	ld [hl], a
	ld a, $ff
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ld [wPlayerAnimFrame], a
	ld a, $01
	ld [wd3f4], a
	ld a, $01
	ld [wdcd0], a
	ret
.facingMatches
	jp PositionFollowerInFront
	ret

CheckMapPositionTrigger:
	ldh a, [hMapGroup]
	cp $01
	ret nz
	ldh a, [hMapNumber]
	cp $1e
	jr z, .map1e
	cp $1f
	jr z, .map1f
	cp $20
	jr z, .map20
	cp $21
	jp z, .map21
	ret
.map1e
	call GetPlayerMapTileX
	cp $02
	jr z, .map1eColLeft
	cp $09
	ret nz
	call GetPlayerMapTileY
	cp $06
	jr z, .map1eColXTriggerB
	cp $04
	jr z, .map1eColXTriggerA
	ret
.map1eColXTriggerA
	ld de, wcd60
	call DrainPartyHPOnField
	jp .triggerDone
.map1eColXTriggerB
	ld de, wNPCObjects
	call DrainPartyHPOnField
	jp .triggerDone
.map1eColLeft
	call GetPlayerMapTileY
	cp $03
	jr z, .map1eColLeftTriggerB
	cp $05
	jr z, .map1eColLeftTriggerA
	ret
.map1eColLeftTriggerA
	ld de, wcda0
	call DrainPartyHPOnField
	jp .triggerDone
.map1eColLeftTriggerB
	ld de, wcd80
	call DrainPartyHPOnField
	jp .triggerDone
.map1f
	call GetPlayerMapTileX
	cp $02
	jr z, .map1fColLeft
	cp $09
	ret nz
	call GetPlayerMapTileY
	cp $06
	ret nz
	ld de, wNPCObjects
	call DrainPartyHPOnField
	jp .triggerDone
.map1fColLeft
	call GetPlayerMapTileY
	cp $03
	ret nz
	ld de, wcd60
	call DrainPartyHPOnField
	jp .triggerDone
.map20
	call GetPlayerMapTileX
	cp $02
	jr z, .map20ColLeft
	cp $06
	ret nz
	call GetPlayerMapTileY
	cp $05
	jr z, .map20TriggerA
	cp $03
	jr z, .map20TriggerB
	ret
.map20TriggerA
	ld de, wNPCObjects
	call DrainPartyHPOnField
	jp .triggerDone
.map20TriggerB
	ld de, wcd60
	call DrainPartyHPOnField
	jp .triggerDone
.map20ColLeft
	call GetPlayerMapTileY
	cp $04
	jr z, .map20ColLeftTriggerA
	cp $06
	jr z, .map20ColLeftTriggerB
	ret
.map20ColLeftTriggerA
	ld de, wcd80
	call DrainPartyHPOnField
	jp .triggerDone
.map20ColLeftTriggerB
	ld de, wcda0
	call DrainPartyHPOnField
	jp .triggerDone
.map21
	call GetPlayerMapTileX
	cp $07
	ret nz
	call GetPlayerMapTileY
	cp $06
	ret nz
	ld de, wNPCObjects
	call DrainPartyHPOnField
.triggerDone
	ret
