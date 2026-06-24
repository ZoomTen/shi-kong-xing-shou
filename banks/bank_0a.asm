OpenDialogTextbox::
	hlcoord 0, 0
	ld a, [wTextboxPos]
	and a
	jr nz, .backup_tilemap
	hlcoord 0, 10
.backup_tilemap
	ld a, l
	ld [wTextboxPointer], a
	ld a, h
	ld [wTextboxPointer + 1], a
	ld de, wScreenRowBuffer
	ld c, 8 * SCREEN_WIDTH
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
; Load textbox border tiles
	call DelayFrame
	ld hl, TextboxBorderGFX
	ld de, $8a00
	ld bc, $70
	call CopyBytesVRAM
	call DelayFrame
	farcall LoadEmotesAndPromptGFX
; Inefficient
	ld hl, wd1a0
	call .clear_8
	ld hl, wd1a8
	call .clear_8
	call LoadTextFaceGFX
	call DelayFrame
	call LoadTextFaceExtraSprites
	call DelayFrame
	ld hl, DialogTextboxTilemap
	ld a, l
	ld [wAnimFramePtr], a
	ld a, h
	ld [wAnimFramePtr + 1], a
	ret
.clear_8
	ld c, 8
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret

OpenPlaceNameTextbox::
	ld a, $01
	ld [wTextboxPos], a
	ld hl, wTilemap
	ld a, [wVisibleObjects]
	cp 96
	jr nc, .asm_4079
	xor a
	ld [wTextboxPos], a
	hlcoord 0, 10
.asm_4079
	ld a, l
	ld [wTextboxPointer], a
	ld a, h
	ld [wTextboxPointer + 1], a
	ld de, wScreenRowBuffer
	ld c, $A0
.asm_4086
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_4086
	ld hl, TextboxBorderGFX
	ld de, $8A00
	ld bc, $0070
	call CopyBytesVRAM
	call DelayFrame
	ld hl, PlaceNameTextboxGFX
	ld de, $8E00
	ld bc, Start
	call CopyBytesVRAM
	ld hl, PlaceNameTextboxTilemap
	ld a, l
	ld [wAnimFramePtr], a
	ld a, h
	ld [wAnimFramePtr + 1], a
	ret

AnimateTextboxOpen::
	ld a, $00
	ld [wAnimFrameCounter], a
.asm_40b8
	call CopyTextboxSlice
	call BuildTextboxAttrmap
	call DrawTextboxBorderColumnOpen
	ld a, [wTextboxPos]
	and a
	jr z, .asm_40cc
	ld hl, $0000
	jr .asm_40cf
.asm_40cc
	ld hl, $000A
.asm_40cf
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ld a, [wAnimFrameCounter]
	inc a
	ld [wAnimFrameCounter], a
	cp $02
	jr c, .asm_40b8
	ld de, wExtraSprites
	ld a, $18
	ld [de], a
	inc de
	ld a, $10
	ld [de], a
	inc de
	ld a, $02
	ld [de], a
	ld a, [wTextboxPos]
	and a
	ret nz
	ld a, $68
	ld [wExtraSprites], a
	ret

AnimateTextboxClose: ; unreferenced
	ld a, $13
	ld [wAnimFrameCounter], a
.asm_40fe
	ld a, [wAnimFrameCounter]
	cp $01
	jr z, .asm_4110
	call RestoreTextboxRow
	call BuildTextboxAttrmap
	call DrawTextboxBorderColumnClose
	jr .asm_4126
.asm_4110
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wScreenRowBuffer
	ld c, $A0
.asm_411d
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_411d
	call BuildTextboxAttrmap
.asm_4126
	ld a, [wTextboxPos]
	and a
	jr z, .asm_4131
	ld hl, $0000
	jr .asm_4134
.asm_4131
	ld hl, $000A
.asm_4134
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ld a, [wAnimFrameCounter]
	dec a
	ld [wAnimFrameCounter], a
	and a
	jr nz, .asm_40fe
	ret

DrawTextboxInstant: ; unreferenced
	call CopyTextboxTilemap
	call BuildTextboxAttrmap
	ld a, [wTextboxPos]
	and a
	jr z, .asm_4156
	ld hl, $0000
	jr .asm_4159
.asm_4156
	ld hl, $000A
.asm_4159
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ld de, wExtraSprites
	ld a, $18
	ld [de], a
	inc de
	ld a, $10
	ld [de], a
	inc de
	ld a, $02
	ld [de], a
	ld a, [wTextboxPos]
	and a
	ret nz
	ld a, $68
	ld [wExtraSprites], a
	ret

CloseTextbox::
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wScreenRowBuffer
	ld c, $A0
.asm_4185
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_4185
	call BuildTextboxAttrmap
	ld a, [wTextboxPos]
	and a
	jr z, .asm_4199
	ld hl, $0000
	jr .asm_419c
.asm_4199
	ld hl, $000A
.asm_419c
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ret

CopyTextboxTilemap:
	ld de, DialogTextboxTilemap
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld c, $A0
.asm_41b0
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_41b0
	ret

RestoreTextboxRow:
	ld de, wScreenRowBuffer
	ld a, [wAnimFrameCounter]
	ld l, a
	ld h, $00
	push hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	pop hl
	add hl, bc
	ld c, $08
	call CopyTextboxBlockRow
	ret

.asm_41d4
	push hl
	ld de, wd100
	ld a, $14
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, $08
	ld c, a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	pop hl
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	ld a, $14
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, $08
	ld c, a
	ld [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

CopyTextboxSlice:
	ld a, [wAnimFramePtr]
	ld e, a
	ld a, [wAnimFramePtr + 1]
	ld d, a
	ld a, [wAnimFrameCounter]
	add a
	ld b, a
	add a
	add a
	add b
	ld l, a
	ld h, $00
	push hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	pop hl
	add hl, bc
	ld c, 8
CopyTextboxBlock:
	ld b, 10
CopyTextboxBlockRow:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, CopyTextboxBlockRow
	push bc
	ld bc, 10
	add hl, bc
	ld a, e
	add 10
	ld e, a
	ld a, d
	adc 0
	ld d, a
	pop bc
	dec c
	jr nz, CopyTextboxBlock
	ret

BuildTextboxAttrmap:
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wd100
	ld c, $A0
.asm_4248
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
	jr nz, .asm_4248
	ret

DrawTextboxBorderColumnClose:
	ld a, [wAnimFrameCounter]
	dec a
	ld l, a
	ld h, $00
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	add hl, bc
	ld de, TextboxBorderColumn
	ld c, 8
.draw1
	push bc
	ld bc, SCREEN_WIDTH
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .draw1
	ld a, [wAnimFrameCounter]
	dec a
	ld l, a
	ld h, 0
	ld bc, wd100
	add hl, bc
	ld c, 8
.draw2
	push bc
	ld bc, SCREEN_WIDTH
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .draw2
	ret

DrawTextboxBorderColumnOpen:
	ld a, [wAnimFrameCounter]
	and a
	ret nz
	inc a
	add a
	ld b, a
	add a
	add a
	add b
	ld l, a
	ld h, 0
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	add hl, bc
	ld de, TextboxBorderColumn
	ld c, 8
.draw1
	push bc
	ld bc, SCREEN_WIDTH
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .draw1
	ld a, [wAnimFrameCounter]
	inc a
	add a
	ld b, a
	add a
	add a
	add b
	ld l, a
	ld h, 0
	ld bc, wd100
	add hl, bc
	ld c, 8
.draw2
	push bc
	ld bc, SCREEN_WIDTH
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .draw2
	ret

TextboxBorderColumn: db $a3, $a4, $a4, $a4, $a4, $a4, $a4, $a6
DialogTextboxTilemap: INCBIN "gfx/tilemaps/tilemap_00a_42e3.tilemap"
PlaceNameTextboxTilemap: INCBIN "gfx/tilemaps/tilemap_00a_4383.tilemap"
PlaceNameTextboxGFX: INCBIN "gfx/textbox/place_name.2bpp"
TextboxBorderGFX: INCBIN "gfx/textbox/border.2bpp"

SetupEnemyNameWindow::
	ld bc, $c0
	ld hl, $9610
	xor a
	call ByteFillVRAM
	ld a, $61
	ld [wMenuTextX], a
	ld a, $6d
	ld [wMenuTextEndX], a
	ld a, [wEnemyMonSpecies]
	ld [wd9d8], a
	farcall asm_026_4616
	ret

CopyNameByIndex:
	ld bc, wMenuTextBuffer
	ld de, NamePointers
	ld a, [wPlayerChar]
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

CopyNameString:
	ld a, [hli]
	ld [bc], a
	inc bc
	cp $ed
	jr nz, CopyNameString
	ret

CopySelectedOptionName:
	ld a, [wSelectedOption]
	cp 3
	jr nz, .asm_45e1
	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_45e1
	ld a, $2b
	jr .asm_45e4
.asm_45e1:
	ld a, [wSelectedOption]
.asm_45e4:
	ld bc, wMenuTextBuffer
	ld de, NamePointers
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_45f3
	ld a, [hli]
	ld [bc], a
	inc bc
	cp TX_LINE
	jr nz, .asm_45f3
	ret

NamePointers:: INCLUDE "data/name_pointers.asm"

INCLUDE "data/text/names.asm"
