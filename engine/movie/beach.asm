BeachCutscene::
	ld a, BGM_TOWN1
	call PlaySound
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdcf5], a
	ld hl, $9800
	ld de, BeachCutsceneTilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, BeachCutsceneAttrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, BeachCutsceneBackgroundPalettes
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, BeachCutsceneGFX2
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, BeachCutsceneObjectPalettes
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, BeachCutsceneGFX1
	ld de, $8000
	ld bc, $0340
	call CopyBytesVRAM
	call .asm_40e7
	call .asm_40cf
	ld a, $28
	ld [wcd42], a
	ld a, $28
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	call .asm_40f5
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_409b
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_40b2
	call .asm_40f5
	call .asm_40bb
	jp .asm_409b
.asm_40b2
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_40bb
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	ld a, $01
	ld [hFade], a
	ret
.asm_40cf
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_40d8
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_40d8
	ret
.asm_40e0
	call DelayFrame
	dec c
	jr nz, .asm_40e0
	ret
.asm_40e7
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_40ed
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_40ed
	ret
.asm_40f5
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4103
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4103
	xor a
	ld [wVirtualOAMPtr], a
	call .asm_4112
	ret
.asm_4112
	ld hl, BeachCutsceneSpriteFrames
	ld de, wcd42
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_4131
	ld a, [hli]
	cp $FF
	jr z, .asm_4145
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_4131
.asm_4145
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
BeachCutsceneSpriteFrames:
	dw BeachCutsceneSpriteFrames_4152
	dw BeachCutsceneSpriteFrames_416b
	dw BeachCutsceneSpriteFrames_41d4
	dw BeachCutsceneSpriteFrames_4211
BeachCutsceneSpriteFrames_4152:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
BeachCutsceneSpriteFrames_416b:
	db $08, $38, $00, $00, $18, $28, $02, $00, $18, $30, $04, $00, $18, $38, $06, $00
	db $18, $40, $08, $00, $18, $48, $0a, $00, $18, $50, $0c, $00, $28, $28, $0e, $00
	db $28, $30, $10, $00, $28, $38, $12, $00, $28, $40, $14, $00, $28, $48, $16, $00
	db $38, $18, $18, $00, $38, $20, $1a, $00, $38, $28, $1c, $00, $38, $30, $1e, $00
	db $38, $38, $20, $00, $38, $40, $22, $00, $40, $10, $24, $00, $48, $18, $26, $00
	db $48, $20, $28, $00, $48, $38, $2a, $00, $48, $40, $2c, $00, $48, $48, $2e, $00
	db $50, $50, $30, $00, $50, $58, $32, $00, $ff
BeachCutsceneSpriteFrames_41d4:
	db $20, $10, $00, $00, $20, $18, $02, $00, $20, $20, $04, $00, $20, $28, $06, $00
	db $20, $30, $08, $00, $28, $38, $0a, $00, $28, $40, $0c, $00, $30, $10, $0e, $00
	db $30, $18, $10, $00, $30, $20, $12, $00, $30, $28, $14, $00, $30, $30, $16, $00
	db $38, $38, $18, $00, $38, $40, $1a, $00, $40, $28, $1c, $00, $ff
BeachCutsceneSpriteFrames_4211:
	db $00, $00, $00, $00, $00, $08, $02, $00, $00, $10, $04, $00, $00, $18, $06, $00
	db $00, $20, $08, $00, $00, $28, $0a, $00, $08, $30, $0c, $00, $10, $00, $0e, $00
	db $10, $08, $10, $00, $10, $10, $12, $00, $10, $18, $14, $00, $10, $20, $16, $00
	db $10, $28, $18, $00, $18, $30, $1a, $00, $20, $08, $1c, $00, $20, $10, $1e, $00
	db $20, $18, $20, $00, $20, $20, $22, $00, $20, $28, $24, $00, $ff
BeachCutsceneObjectPalettes:
	RGB 21, 21, 21
	RGB 31, 17, 0
	RGB 31, 26, 21
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
BeachCutsceneBackgroundPalettes:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 29, 24, 10
	RGB 21, 12, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 30, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
BeachCutsceneAttrmap:
INCBIN "gfx/attrmaps/beachcutsceneattrmap.bin"
BeachCutsceneTilemap:
INCBIN "gfx/tilemaps/beachcutscenetilemap.tilemap"
BeachCutsceneGFX1:
INCBIN "gfx/misc/beachcutscenegfx1.2bpp"
BeachCutsceneGFX2:
INCBIN "gfx/misc/beachcutscenegfx2.2bpp"
