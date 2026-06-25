_UpdatePlayerMapCoords::
	ld a, [wPlayerObject]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	ld [wd3f9], a
	call GetSouthFacingTile
	call GetNorthFacingTile
	call GetWestFacingTile
	call GetEastFacingTile
	ret

CopyBGMapAttributes:
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz
	ld a, $98
	ld [wBGMapAddr + 1], a
	ld a, 0
	ld [wBGMapAddr], a
	ld hl, wTilemap
	ld de, wMapTileAttrs
	ld a, 1
	ldh [rVBK], a
	ld b, $12
.row
	ld c, $14
.col
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, de
	push de
	ld a, [wBGMapAddr + 1]
	ld d, a
	ld a, [wBGMapAddr]
	ld e, a
	ld a, [hli]
	ld [de], a
	pop de
	ld hl, wBGMapAddr
	inc [hl]
	pop hl
	dec c
	jr nz, .col
	ld a, [wBGMapAddr]
	add $c
	ld [wBGMapAddr], a
	ld a, [wBGMapAddr + 1]
	adc 0
	ld [wBGMapAddr + 1], a
	dec b
	jr nz, .row
	xor a
	ldh [rVBK], a
	ret

CopyVisibleTilemapWindow:
	ld hl, wc740
	ldh a, [hFFA0]
	and a
	jr z, .check_col_offset
	ld bc, $30
	add hl, bc
.check_col_offset
	ldh a, [hFF9F]
	and a
	jr z, .copy_win
	inc hl
	inc hl
.copy_win
	call CopyMapWindowToTilemap
	ret

CopyTextboxAttrs:: ; unreferenced?
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wd100
	ld c, $a0
	call LookupTileAttrs
	ret
