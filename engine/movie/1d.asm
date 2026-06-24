Cutscene1d::
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
.asm_4017
	ld de, Cutscene1d_TilemapPtrs
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld de, Cutscene1d_AttrmapPtrs
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld de, Cutscene1d_BGPalPtrs
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld de, Cutscene1d_BGGfxPtrs
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, Cutscene1d_BGGfx2Ptrs
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8800
	ld bc, $0100
	call CopyBytesVRAM
	ld de, Cutscene1d_ObjPalPtrs
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld de, Cutscene1d_ObjGfxPtrs
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8000
	ld bc, $0460
	call CopyBytesVRAM
	call Func_6f_4191
	call Func_6f_4179
	ld a, $28
	ld [wcd42], a
	ld a, $28
	ld [wcd43], a
	ld a, [wdcf3]
	inc a
	ld [wcd44], a
	call Func_6f_419f
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_40f3
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_4107
	call Func_6f_415e
	jp .asm_40f3
.asm_4107
	ld a, [wdcf3]
	cp $03
	jp nc, .asm_411e
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	xor a
	ldh [hFade], a
	jp .asm_4017
.asm_411e
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, $01
	ld [hMapNumber], a
	xor a
	ld [hWarpNumber], a
	ld a, $07
	ldh [hMapGroup], a
	jp JumpToGameMode
Cutscene1d_TilemapPtrs:
INCBIN "gfx/tilemaps/cutscene06f_tilemapptrs.tilemap"
Cutscene1d_AttrmapPtrs:
INCBIN "gfx/attrmaps/cutscene06f_attrmapptrs.bin"
Cutscene1d_BGPalPtrs:
	dw Cutscene1d_BGPal0, Cutscene1d_BGPal1, Cutscene1d_BGPal2
Cutscene1d_BGGfxPtrs:
	dw Cutscene1d_BGGfx0
	dw Cutscene1d_BGGfx1
	dw Cutscene1d_BGGfx2
Cutscene1d_BGGfx2Ptrs:
	dw Cutscene1d_BGGfx0
	dw Cutscene1d_BGGfx1
	dw Cutscene1d_BGGfx2_8800
Cutscene1d_ObjPalPtrs:
	dw Cutscene1d_ObjPal_S0, Cutscene1d_ObjPal_S1, Cutscene1d_ObjPal_S2
Cutscene1d_ObjGfxPtrs:
	dw Cutscene1d_ObjGfx0
	dw Cutscene1d_ObjGfx1
	dw Cutscene1d_ObjGfx2
Func_06f_415e_helpers:
Func_6f_415e:
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $60
	ret nz
	xor a
	ld [wdcf4], a
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	ld a, $01
	ld [hFade], a
	ret
Func_6f_4179:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4182
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4182
	ret
.asm_418a
	call DelayFrame
	dec c
	jr nz, .asm_418a
	ret
Func_6f_4191:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_4197
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_4197
	ret
Func_6f_419f:
	ldh a, [hConsoleType]
	cp $11
	ret nz
	xor a
	ld [wVirtualOAMPtr], a
	ld hl, Cutscene1d_ObjectListPtrs
	ld de, wcd42
	ld a, [de]
	inc de
	ld c, a
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
.asm_41c7
	ld a, [hli]
	cp $FF
	jr z, .asm_41db
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
	jr .asm_41c7
.asm_41db
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
Cutscene1d_ObjectListPtrs:
	dw Cutscene1d_ObjectList0
	dw Cutscene1d_ObjectList0
	dw Cutscene1d_ObjectList1
	dw Cutscene1d_ObjectList2
Cutscene1d_ObjectList0:
	db $08, $18, $00, $00, $08, $20, $02, $00, $08, $28, $04, $00, $08, $30, $06, $00
	db $08, $38, $08, $00, $08, $40, $0a, $00, $18, $20, $0c, $00, $18, $28, $0e, $00
	db $18, $30, $10, $00, $18, $38, $12, $00, $20, $18, $14, $00, $20, $40, $16, $00
	db $28, $20, $18, $00, $28, $28, $1a, $00, $28, $30, $1c, $00, $28, $38, $1e, $00
	db $30, $18, $20, $00, $30, $40, $22, $00, $38, $20, $24, $00, $38, $28, $26, $00
	db $38, $30, $28, $00, $38, $38, $2a, $00, $40, $10, $2c, $00, $40, $18, $2e, $00
	db $40, $40, $30, $00, $40, $48, $32, $00, $40, $50, $34, $00, $48, $08, $36, $00
	db $48, $38, $38, $00, $50, $10, $3a, $00, $50, $18, $3c, $00, $50, $40, $3e, $00
	db $50, $48, $40, $00, $50, $50, $42, $00, $ff
Cutscene1d_ObjectList1:
	db $08, $18, $00, $00, $08, $20, $02, $00, $08, $28, $04, $00, $08, $30, $06, $00
	db $08, $38, $08, $00, $10, $48, $0a, $00, $10, $50, $0c, $00, $18, $00, $0e, $00
	db $18, $10, $10, $00, $18, $18, $12, $00, $18, $38, $14, $00, $18, $40, $16, $00
	db $18, $58, $18, $00, $20, $48, $1a, $00, $20, $50, $1c, $00, $28, $08, $1e, $00
	db $28, $10, $20, $00, $28, $38, $22, $00, $28, $40, $24, $00, $28, $58, $26, $00
	db $30, $48, $28, $00, $30, $50, $2a, $00, $38, $08, $2c, $00, $38, $58, $2e, $00
	db $40, $48, $30, $00, $40, $50, $32, $00, $48, $00, $34, $00, $48, $08, $36, $00
	db $48, $10, $38, $00, $48, $18, $3a, $00, $48, $20, $3c, $00, $48, $58, $3e, $00
	db $50, $40, $40, $00, $50, $48, $42, $00, $50, $50, $44, $00, $ff
Cutscene1d_ObjectList2:
	db $08, $18, $00, $00, $08, $20, $02, $00, $08, $28, $04, $00, $08, $30, $06, $00
	db $08, $38, $08, $00, $10, $48, $0a, $00, $10, $50, $0c, $00, $18, $00, $0e, $00
	db $18, $10, $10, $00, $18, $18, $12, $00, $18, $38, $14, $00, $18, $40, $16, $00
	db $18, $58, $18, $00, $20, $48, $1a, $00, $20, $50, $1c, $00, $28, $08, $1e, $00
	db $28, $10, $20, $00, $28, $38, $22, $00, $28, $40, $24, $00, $28, $58, $26, $00
	db $30, $48, $28, $00, $30, $50, $2a, $00, $38, $08, $2c, $00, $38, $58, $2e, $00
	db $40, $48, $30, $00, $40, $50, $32, $00, $48, $00, $34, $00, $48, $08, $36, $00
	db $48, $10, $38, $00, $48, $18, $3a, $00, $48, $20, $3c, $00, $48, $58, $3e, $00
	db $50, $40, $40, $00, $50, $48, $42, $00, $50, $50, $44, $00, $ff
Cutscene1d_Attrmap0:
INCBIN "gfx/attrmaps/cutscene06f_attrmap0.bin"
Cutscene1d_Tilemap0:
INCBIN "gfx/tilemaps/cutscene06f_tilemap0.tilemap"
Cutscene1d_BGPal0:
	RGB 31, 31, 31
	RGB 8, 21, 31
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
	RGB 0, 0, 0
Cutscene1d_BGGfx0:
INCBIN "gfx/misc/cutscene06f_bggfx0.2bpp"
Cutscene1d_ObjPal_S0:
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
Cutscene1d_ObjPal_S1:
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
Cutscene1d_ObjPal_S2:
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
Cutscene1d_ObjGfx0:
INCBIN "gfx/misc/cutscene06f_objgfx0.2bpp"
Cutscene1d_Attrmap1:
INCBIN "gfx/attrmaps/cutscene06f_attrmap1.bin"
Cutscene1d_Tilemap1:
INCBIN "gfx/tilemaps/cutscene06f_tilemap1.tilemap"
Cutscene1d_BGPal1:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 14, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
Cutscene1d_BGGfx1:
INCBIN "gfx/misc/cutscene06f_bggfx1.2bpp"
Cutscene1d_Attrmap2:
INCBIN "gfx/attrmaps/cutscene06f_attrmap2.bin"
Cutscene1d_Tilemap2:
INCBIN "gfx/tilemaps/cutscene06f_tilemap2.tilemap"
Cutscene1d_BGPal2:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 20, 17, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
Cutscene1d_BGGfx2:
INCBIN "gfx/misc/cutscene06f_bggfx2.2bpp"
Cutscene1d_BGGfx2_8800:
INCBIN "gfx/misc/cutscene06f_bggfx2_8800.2bpp"
Cutscene1d_ObjGfx1:
INCBIN "gfx/misc/cutscene06f_objgfx1.2bpp"
Cutscene1d_ObjGfx2:
INCBIN "gfx/misc/cutscene06f_objgfx2.bin"


