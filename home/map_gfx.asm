IncFillBoxVRAM::
; Fill box b*c with value e starting at hl
; Increment e after every write
	push hl

.copy:
	ld a, e
	push bc
	ld c, a
	di

.waitLCD1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD1

; Write byte
	ld a, c
	ld [hl], a

.waitLCD2
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD2

	ei
; Verify that byte was written
	ld a, [hl]
	cp c
; @bug: if jump is taken, causes stack issue
	jr nz, .copy

	inc l
	inc e
	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc

	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, IncFillBoxVRAM

	ld a, 0
	ldh [rVBK], a
	ret

LoadMapGFX2::
	ld a, [_BANKNUM]
	push af
	ldh a, [hMapAttrBank]
	rst Bankswitch
	call LoadMapPalettes2
	ld a, [wMapTileset1Pointer]
	ld l, a
	ld a, [wMapTileset1Pointer + 1]
	ld h, a
	or l
	jr nz, .not_zero

	call LoadTilesetHeader
	pop af
	rst Bankswitch
	ret

.not_zero
	ld de, $9000
	ld bc, $800
	call CopyBytesVRAM
	ld a, [wMapTileset2Pointer]
	ld l, a
	ld a, [wMapTileset2Pointer + 1]
	ld h, a
	ld de, $8800
	ld bc, $300
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

LoadMapGFX::
	ld a, [_BANKNUM]
	push af
	ldh a, [hMapAttrBank]
	rst Bankswitch
	call LoadMapPalettes1
	ld a, [wMapTileset1Pointer]
	ld l, a
	ld a, [wMapTileset1Pointer + 1]
	ld h, a
	or l
	jr nz, .not_zero

	call LoadTilesetHeader
	pop af
	rst Bankswitch
	ret

.not_zero
	ld de, $9000
	ld bc, $800
	call CopyBytesVRAM
	call DelayFrame
	ld a, [wMapTileset2Pointer]
	ld l, a
	ld a, [wMapTileset2Pointer + 1]
	ld h, a
	ld de, $8800
	ld bc, $300
	call CopyBytesVRAM
	call DelayFrame
	pop af
	rst Bankswitch
	ret

