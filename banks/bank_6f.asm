Func_06f_4000::
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
	ld de, Cutscene06f_TilemapPtrs
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
	ld de, Cutscene06f_AttrmapPtrs
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
	ld de, Cutscene06f_BGPalPtrs
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
	ld de, Cutscene06f_BGGfxPtrs
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
	ld de, Cutscene06f_BGGfx2Ptrs
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
	ld de, Cutscene06f_ObjPalPtrs
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
	ld de, Cutscene06f_ObjGfxPtrs
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
Cutscene06f_TilemapPtrs:
	dr $1bc134, $1bc13a
Cutscene06f_AttrmapPtrs:
	dr $1bc13a, $1bc140
Cutscene06f_BGPalPtrs:
	dr $1bc140, $1bc146
Cutscene06f_BGGfxPtrs:
	dr $1bc146, $1bc14c
Cutscene06f_BGGfx2Ptrs:
	dr $1bc14c, $1bc152
Cutscene06f_ObjPalPtrs:
	dr $1bc152, $1bc158
Cutscene06f_ObjGfxPtrs:
	dr $1bc158, $1bc15e
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
	ld [wd1fb], a
	ld hl, Cutscene06f_ObjectListPtrs
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
	ld a, [wd1fb]
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
	ld [wd1fb], a
	ret
Cutscene06f_ObjectListPtrs:
	dr $1bc1e0, $1bc1e8
Cutscene06f_ObjectList0:
	dr $1bc1e8, $1bc271
Cutscene06f_ObjectList1:
	dr $1bc271, $1bc2fe
Cutscene06f_ObjectList2:
	dr $1bc2fe, $1bc38b
Cutscene06f_Attrmap0:
	dr $1bc38b, $1bc4f3
Cutscene06f_Tilemap0:
	dr $1bc4f3, $1bc65b
Cutscene06f_BGPal0:
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
Cutscene06f_BGGfx0:
	dr $1bc6a3, $1bce93
Cutscene06f_ObjPal_S0:
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
Cutscene06f_ObjPal_S1:
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
Cutscene06f_ObjPal_S2:
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
Cutscene06f_ObjGfx0:
	dr $1bceab, $1bd2eb
Cutscene06f_Attrmap1:
	dr $1bd2eb, $1bd453
Cutscene06f_Tilemap1:
	dr $1bd453, $1bd5bb
Cutscene06f_BGPal1:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 14, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
Cutscene06f_BGGfx1:
	dr $1bd5cb, $1bdd0b
Cutscene06f_Attrmap2:
	dr $1bdd0b, $1bde73
Cutscene06f_Tilemap2:
	dr $1bde73, $1bdfdb
Cutscene06f_BGPal2:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 20, 17, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
Cutscene06f_BGGfx2:
	dr $1bdfeb, $1be7eb
Cutscene06f_BGGfx2_8800:
	dr $1be7eb, $1be7fb
Cutscene06f_ObjGfx1:
	dr $1be7fb, $1bec5b
Cutscene06f_ObjGfx2:
	dr $1bec5b, $1bf0a0


