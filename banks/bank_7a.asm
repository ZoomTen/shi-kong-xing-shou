Func_07a_4000:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_4006
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_4006
	ret

Func_07a_400e:
	ld hl, wVirtualOAM
	ld bc, $0028
	ld de, $0004
.asm_4017
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4017
	ret

Func_07a_401f::
	call Func_07a_4000
	ld a, $6e
	call PlaySound
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wIntroStepTimer], a
	ld [wIntroScrollMode], a
	ld [wdcfb], a
	ld [wdce8], a
	ld [wIntroSeqStep], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld hl, $9800
	ld de, BGMap_07a_492f
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AttrMap_07a_47c7
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Palette_07a_4a97
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, Palette_07a_530f
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_07a_4aaf
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, $8800
	ld bc, $0060
	call CopyBytesVRAM
	ld hl, GFX_07a_5317
	ld de, $8000
	ld bc, $01e0
	call CopyBytesVRAM
	call Func_07a_400e
	ld a, $50
	ld [wcd55], a
	ld a, $28
	ld [wcd56], a
	ld a, $01
	ld [wcd57], a
	ld a, $81
	ld [wcd58], a
	ld a, $38
	ld [wcd59], a
	ld a, $48
	ld [wcd5a], a
	ld a, $01
	ld [wcd5b], a
	ld a, $81
	ld [wcd5c], a
	ld a, $48
	ld [wcd5d], a
	ld a, $78
	ld [wcd5e], a
	ld a, $01
	ld [wcd5f], a
	ld a, $81
	ld [wcd60], a
	call Func_07a_4525
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_40f9
	call DelayFrame
	call Func_07a_4525
	call Func_07a_43de
	call Func_07a_442d
	call Func_07a_44d6
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_4115
	jp .asm_40f9
.asm_4115
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	call Func_07a_400e
	ld hl, $9800
	ld de, BGMap_07a_565f
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AttrMap_07a_54f7
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Palette_07a_57c7
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_07a_57df
	ld de, $9000
	ld bc, $0710
	call CopyBytesVRAM
	xor a
	ldh [hFade], a
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4173
	call Func_07a_43d0
	ldh a, [hFade]
	cp $02
	jr z, .asm_417f
	jp .asm_4173
.asm_417f
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode

Func_07a_4188::
	call Func_07a_4000
	call Func_07a_400e
	ld a, $6e
	call PlaySound
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wIntroStepTimer], a
	ld [wIntroScrollMode], a
	ld [wdcfb], a
	ld [wdce8], a
	ld [wIntroSeqStep], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld [wcd57], a
	ld [wcd58], a
	ld [wcd5b], a
	ld [wcd5c], a
	ld [wcd5f], a
	ld [wcd60], a
	ld hl, $9800
	ld de, Intro1_Layout
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, Intro1_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Intro1_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, Intro1_GFX
	ld de, $9000
	ld bc, $0460
	call CopyBytesVRAM
	ld hl, Intro1_OBPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, Intro1_OBGFX
	ld de, $8000
	ld bc, $08e0
	call CopyBytesVRAM
	ld a, $60
	ld [wcd55], a
	ld a, $38
	ld [wcd56], a
	ld a, $09
	ld [wcd57], a
	ld a, $89
	ld [wcd58], a
	call Func_07a_4525
	xor a
	ldh [hFade], a
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4246
	call DelayFrame
	call Func_07a_4525
	ldh a, [hFade]
	cp $01
	jr z, .asm_4255
	call Func_07a_43de
.asm_4255
	call Func_07a_43bc
	call .asm_42ec
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	cp $02
	jr z, .asm_4269
	jp .asm_4246
.asm_4269
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	call Func_07a_400e
	xor a
	ld [wcd57], a
	ld [wcd58], a
	ld hl, $9800
	ld de, Intro2_Layout
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, Intro2_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Intro2_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, Intro2_GFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, $8800
	ld bc, $0030
	call CopyBytesVRAM
	xor a
	ldh [hFade], a
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_42d7
	call Func_07a_43d0
	ldh a, [hFade]
	cp $02
	jr z, .asm_42e3
	jp .asm_42d7
.asm_42e3
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_42ec
	ldh a, [hFadeFrameCounter]
	and $0f
	cp $08
	ret nz
	cp $18
	jr nc, .asm_4328
	sla a
	ld c, a
	ld b, $00
	push bc
	ld hl, AnimTiles_07a_432c
	add hl, bc
	ld de, $9010
	ld bc, $0010
	call CopyBytesVRAM
	pop bc
	push bc
	ld hl, AnimTiles_07a_432c + $30
	add hl, bc
	ld de, $9050
	ld bc, $0010
	call CopyBytesVRAM
	pop bc
	ld hl, AnimTiles_07a_432c + $60
	add hl, bc
	ld de, $90d0
	ld bc, $0010
	call CopyBytesVRAM
	ret
.asm_4328
	xor a
	ldh [hFadeFrameCounter], a
	ret
; TODO: indexed mid-block (+offset at runtime); consider per-entry sub-labels
AnimTiles_07a_432c:
	dr $1e832c, $1e83bc
Func_07a_43bc:
	ldh a, [hFade]
	and a
	ret z
	ld a, [wcd55]
	sub $02
	ld [wcd55], a
	cp $a0
	ret nz
	ld a, $02
	ldh [hFade], a
	ret
Func_07a_43d0:
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	cp $00
	ret nz
	ldh a, [hFade]
	inc a
	ldh [hFade], a
	ret
Func_07a_43de:
	ld a, [wcd58]
	and a
	ret z
	and $80
	jr nz, .asm_43ee
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	jr .asm_43fa
.asm_43ee
	ld a, [wcd58]
	and $7f
	ld [wcd58], a
	xor a
	ld [wcd65], a
.asm_43fa
	ld a, [wcd58]
	ld de, AnimSeqPointers_07a_446f
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd65]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $99
	jr z, .asm_441d
	cp $ff
	jr nz, .asm_4422
	xor a
	ld [wcd65], a
	ret
.asm_441d
	ld a, $01
	ldh [hFade], a
	ret
.asm_4422
	ld [wcd57], a
	ld a, [wcd65]
	inc a
	ld [wcd65], a
	ret
Func_07a_442d:
	ld a, [wcd5c]
	and a
	ret z
	and $80
	jr nz, .asm_443d
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4445
.asm_443d
	ld a, [wcd5c]
	and $7f
	ld [wcd5c], a
.asm_4445
	ld a, [wcd5c]
	ld de, AnimSeqPointers_07a_446f
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd66]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .asm_4464
	xor a
	ld [wcd66], a
	ret
.asm_4464
	ld [wcd5b], a
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	ret
AnimSeqPointers_07a_446f:
	dr $1e846f, $1e8489
AnimSeqData_07a_4489:
	dr $1e8489, $1e84d6
Func_07a_44d6:
	ld a, [wcd60]
	and a
	ret z
	and $80
	jr nz, .asm_44e6
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_44f2
.asm_44e6
	ld a, [wcd60]
	and $7f
	ld [wcd60], a
	xor a
	ld [wcd67], a
.asm_44f2
	ld a, [wcd60]
	ld de, AnimSeqPointers_07a_446f
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd67]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4515
	cp $ff
	jr nz, .asm_451a
	xor a
	ld [wcd67], a
	ret
.asm_4515
	ld a, $01
	ldh [hFade], a
	ret
.asm_451a
	ld [wcd5f], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	ret
Func_07a_4525:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_452e
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_452e
	xor a
	ld [wd1fb], a
	call .asm_45b3
	call .asm_457b
	call .asm_4543
	ret
.asm_4543
	ld hl, SpriteLayoutPointers_07a_4629
	ld de, wcd5d
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
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_4562
	ld a, [hli]
	cp $ff
	jr z, .asm_4576
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
	jr .asm_4562
.asm_4576
	ld a, e
	ld [wd1fb], a
	ret
.asm_457b
	ld hl, SpriteLayoutPointers_07a_4629
	ld de, wcd59
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
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_459a
	ld a, [hli]
	cp $ff
	jr z, .asm_45ae
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
	jr .asm_459a
.asm_45ae
	ld a, e
	ld [wd1fb], a
	ret
.asm_45b3
	ld a, [wcd57]
	and a
	ret z
	ld hl, SpriteLayoutPointers_07a_4629
	ld de, wcd55
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
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_45d7
	ld a, [hli]
	cp $ff
	jr z, .asm_45eb
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
	jr .asm_45d7
.asm_45eb
	ld a, e
	ld [wd1fb], a
	ret
Func_07a_45f0:
	ld hl, SpriteLayoutPointers_07a_4629
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
	sla a
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
	ld d, $c0
.asm_4610
	ld a, [hli]
	cp $ff
	jr z, .asm_4624
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
	jr .asm_4610
.asm_4624
	ld a, e
	ld [wd1fb], a
	ret
SpriteLayoutPointers_07a_4629:
	dr $1e8629, $1e8643
SpriteLayoutData_07a_4643:
	dr $1e8643, $1e87c7
AttrMap_07a_47c7:
INCBIN "gfx/attrmaps/attrmap_07a_47c7.bin"
BGMap_07a_492f:
INCBIN "gfx/bgmaps/bgmap_07a_492f.bin"
Palette_07a_4a97:
	dr $1e8a97, $1e8aaf
GFX_07a_4aaf:
INCBIN "gfx/misc/gfx_07a_4aaf.2bpp"
Palette_07a_530f:
	dr $1e930f, $1e9317
GFX_07a_5317:
INCBIN "gfx/misc/gfx_07a_5317.2bpp"
AttrMap_07a_54f7:
INCBIN "gfx/attrmaps/attrmap_07a_54f7.bin"
BGMap_07a_565f:
INCBIN "gfx/bgmaps/bgmap_07a_565f.bin"
Palette_07a_57c7:
	dr $1e97c7, $1e97df
GFX_07a_57df:
INCBIN "gfx/misc/gfx_07a_57df.2bpp"
Intro1_Attrmap:
INCBIN "gfx/attrmaps/intro1_attrmap.bin"
Intro1_Layout:
	dr $1ea057, $1ea1bf
Intro1_Palette:
	dr $1ea1bf, $1ea1cf
Intro1_GFX:
INCBIN "gfx/misc/intro1_gfx.2bpp"
Intro1_OBPalette:
	dr $1ea62f, $1ea63f
Intro1_OBGFX:
INCBIN "gfx/misc/intro1_obgfx.2bpp"
Intro2_Attrmap:
INCBIN "gfx/attrmaps/intro2_attrmap.bin"
Intro2_Layout:
	dr $1eb087, $1eb1ef
Intro2_Palette:
	dr $1eb1ef, $1eb207
Intro2_GFX:
INCBIN "gfx/misc/intro2_gfx.bin"


