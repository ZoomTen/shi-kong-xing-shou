AnimatePaperScroll::
	homecall _AnimatePaperScroll
	ret

RequestLoadCharacter_PaperScroll::
	ld [wCurrentCharacterByte], a
	call DelayFrame
	ld a, [_BANKNUM]
	push af

; Tiles start at $8a80 with tile ID $a8
	ld a, [wCharacterTilePos]
	add $a8
	ld c, a
	ld [wcbf3], a
; [wCharacterTileDest] = $8xx0
; xx = 'a'
	swap a
	ld b, a
	and $0f
	or $80
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a

; Get character tile source
	ld a, [wCharacterTileSource]
	ld e, a
	ld a, [wCharacterTileSource + 1]
	ld d, a
; hl = a * (4*8) (4 tiles, 8 bytes)
	ld a, [wCurrentCharacterByte]
	ld l, a
	ld h, 0
REPT 5
	add hl, hl
ENDR
	add hl, de
	ld a, l
	ld [wCharacterTileSrc], a
	ld a, h
	ld [wCharacterTileSrc + 1], a
	ld a, 4
	ld [wCharacterTileCount], a
	ld a, 1
	ld [wCharacterTileTransferStatus], a
	call DelayFrame

	ld a, [wCharacterTilePos]
	add 4
	ld [wCharacterTilePos], a

	pop af
	rst Bankswitch
	ret

GetTextBGMapPointer::
; Calculate BGMap address from coords depending on SCXY
	push bc
	push de
	ld bc, vBGMap0
	ld e, h
	ld a, l
; a * 8 (1 tile = 8 pixels)
	add a
	add a
	add a
	ld l, a
	ldh a, [hSCY]
	add l
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl

	ld a, e
	add a
	add a
	add a
	ld e, a
	ldh a, [hSCX]
	add e
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	add hl, de
	add hl, bc

; store pointer
	ld a, l
	ld [wTextBGMapPointer], a
	ld a, h
	ld [wTextBGMapPointer + 1], a
	pop de
	pop bc
	ret

CopyTextboxToVRAM::
	push hl
	ld de, wd100
	lb bc, 20, 8
	ld a, b
	ldh [hVRAMCopyWidth], a
	ld a, c
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap

; Copy wTilemap textbox into VRAM
	pop hl
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	lb bc, 20, 8
	ld a, b
	ld [hVRAMCopyWidth], a
	ld a, c
	ld [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

