Overworld_ProcessJoypadInput:
	ldh a, [hFF9E]
	cp $80
	ret nc
	and a
	jp z, .asm_5785
	cp $01
	jp z, .asm_57ba
	cp $02
	jp z, .asm_57ec
	cp $03
	jp z, .asm_581e
	ret
.asm_5785
	ld a, [wPlayerObject]
	cp $50
	jr nc, .asm_5796
.asm_578c
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_5796
	ld hl, hFFA9
	ldh a, [hFFAB]
	cp [hl]
	jr nz, .asm_57ad
	ld a, [wPlayerObject]
	cp $90
	jr c, .asm_578c
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_57ad
	call ScrollMapDown
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_5879
	ret
.asm_57ba
	ld a, [wPlayerObject]
	cp $60
	jr c, .asm_57cb
.asm_57c1
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_57cb
	ldh a, [hFFAB]
	and a
	jr nz, .asm_57df
	ld a, [wPlayerObject]
	cp $20
	jr nc, .asm_57c1
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_57df
	call ScrollMapUp
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_5853
	ret
.asm_57ec
	ld a, [wPlayerScreenX]
	cp $58
	jr c, .asm_57fd
.asm_57f3
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_57fd
	ldh a, [hFFAA]
	and a
	jr nz, .asm_5811
	ld a, [wPlayerScreenX]
	cp $18
	jr nc, .asm_57f3
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_5811
	call ScrollMapLeft
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_58aa
	ret
.asm_581e
	ld a, [wPlayerScreenX]
	cp $48
	jr nc, .asm_582f
.asm_5825
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_582f
	ld hl, hFFA8
	ldh a, [hFFAA]
	cp [hl]
	jr nz, .asm_5846
	ld a, [wPlayerScreenX]
	cp $90
	jr c, .asm_5825
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_5846
	call ScrollMapRight
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_58d0
	ret
.asm_5853
	ld hl, wTilemap
	ld de, wd128
	call CopyTilemapRowToBuffer
	ld c, $28
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call BuildBGMapRowPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_5879
	hlcoord 0, 16
	ld de, wd128
	call CopyTilemapRowToBuffer
	ld c, $28
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $0200
	add hl, bc
	ld a, h
	and $03
	or $98
	ld e, l
	ld d, a
	call BuildBGMapRowPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_58aa
	ld hl, wTilemap
	ld de, wd128
	call CopyTilemapColumnToBuffer
	ld c, $24
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call BuildBGMapColumnPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_58d0
	hlcoord 18, 0
	ld de, wd128
	call CopyTilemapColumnToBuffer
	ld c, $24
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld e, a
	and $E0
	ld b, a
	ld a, e
	add $12
	and $1F
	or b
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call BuildBGMapColumnPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret

BuildEdgeAttrBuffer:
	ld hl, wd128
	ld de, wd100

LookupTileAttrs:
	ld a, [hli]
	push hl
	ld hl, wMapTileAttrs
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, LookupTileAttrs
	ret


CopyTilemapRowToBuffer:
	ld c, $28

.loop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

CopyTilemapColumnToBuffer:
	ld c, $12

.loop:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $13
	add l
	ld l, a
	jr nc, .nextRow
	inc h

.nextRow:
	dec c
	jr nz, .loop
	ret

BuildBGMapColumnPointers:
	ld hl, wBGMapBufferPointers
	ld c, $12

.loop:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, .nextSlot
	inc d
	ld a, d
	and 3
	or $98
	ld d, a

.nextSlot:
	dec c
	jr nz, .loop
	ld a, $12
	ldh [hFFA5], a
	ret

BuildBGMapRowPointers:
	ld hl, wBGMapBufferPointers
	push de
	call StoreBGMapRowPointers
	pop de
	ld a, $20
	add e
	ld e, a

StoreBGMapRowPointers:
	ld c, $a

.storeRow:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	inc a
	and $1f
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
	dec c
	jr nz, .storeRow
	ld a, $14
	ldh [hFFA5], a
	ret

ScrollMapDown:
	ld hl, hFFAB
	inc [hl]
	ld a, [wd0ba]
	add $40
	ld [wd0ba], a
	jr nc, .noCarry
	ld a, [wd0bb]
	inc a
	and 3
	or $98
	ld [wd0bb], a

.noCarry:
	ld hl, hFFA0
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret nz
	call MoveMapAttrPtrDown
	ret

MoveMapAttrPtrDown:
	ld hl, wMapAttributes
	ld a, [hMapWidth]
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

ScrollMapUp:
	ld hl, hFFAB
	dec [hl]
	ld a, [wd0ba]
	sub $40
	ld [wd0ba], a
	jr nc, .noWrap
	ld a, [wd0bb]
	dec a
	and 3
	or $98
	ld [wd0bb], a

.noWrap:
	ld hl, hFFA0
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret z
	call MoveMapAttrPtrUp
	ret

MoveMapAttrPtrUp:
	ld hl, wMapAttributes
	ld a, [hMapWidth]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

ScrollMapLeft:
	ld hl, hFFAA
	dec [hl]
	ld a, [wd0ba]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub 2
	and $1f
	or d
	ld [wd0ba], a
	ld hl, hFF9F
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret z
	call MoveMapAttrPtrLeft
	ret

MoveMapAttrPtrLeft:
	ld hl, wMapAttributes
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

ScrollMapRight:
	ld hl, hFFAA
	inc [hl]
	ld a, [wd0ba]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add 2
	and $1f
	or d
	ld [wd0ba], a
	ld hl, hFF9F
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret nz
	call MoveMapAttrPtrRight
	ret

MoveMapAttrPtrRight:
	ld hl, wMapAttributes
	ld a, [hl]
	add 1
	ld [hli], a
	ret nc
	inc [hl]
	ret

CopyMapBufferToTilemap:
	ld hl, wc740

CopyMapWindowToTilemap:
	ld de, wTilemap
	ld b, $12

.nextRow:
	ld c, $14

.copyTile:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyTile
	ld a, l
	add 4
	ld l, a
	ld a, h
	adc 0
	ld h, a
	dec b
	jr nz, .nextRow
	ret

CopyBlockToVRAMAttr:
	ld a, 1
	ldh [rVBK], a
	jp CopyBlockToVRAM

CopyBlockToVRAMTiles:
	ld a, 0
	ldh [rVBK], a

CopyBlockToVRAM:
	push hl

.rowLoop:
	ld a, [de]
	push bc
	ld c, a

.waitVRAM:
	ldh a, [rSTAT]
	and 3
	jr nz, .waitVRAM
	ld a, c
	ld [hl], a
	inc l
	xor a
	adc 0
	ld c, a
	ld a, l
	and $f
	jr nz, .nextByte
	ld a, l
	bit 4, a
	jr nz, .nextByte
	sub $20
	ld l, a

.nextByte:
	inc de
	pop bc
	dec b
	jr nz, .rowLoop
	pop hl
	push bc
	ld bc, $20
	add hl, bc
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, CopyBlockToVRAM
	ld a, 0
	ldh [rVBK], a
	ret

ClearObjectData:
	ld hl, wPlayerScreenY
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret
