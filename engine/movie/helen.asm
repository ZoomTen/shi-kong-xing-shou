HelenCutscene::
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
	ld de, Tilemap_5c
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, Attrmap_5c
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, BGPals_5c
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_5c
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	call Func_05c_5705
	call Func_05c_5740
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_5653
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_5671
	ld a, [wdcf5]
	and a
	jr z, .asm_567a
	cp $01
	jr z, .asm_5680
	cp $02
	jr z, .asm_5686
	jp .asm_5653
.asm_5671
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_567a
	call .asm_568c
	jp .asm_5653
.asm_5680
	call .asm_56b5
	jp .asm_5653
.asm_5686
	call .asm_56a0
	jp .asm_5653
.asm_568c
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $A0
	ret nz
	xor a
	ld [wdcf3], a
	ld a, $01
	ld [wdcf5], a
	ret
.asm_56a0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $20
	ret nz
	xor a
	ld [wdcf4], a
	ld [wdcf5], a
	call Func_05c_5713
	ret
.asm_56b5
	call Func_05c_5726
	ld a, [wdcfb]
	ld de, StripTilemapPointers_5c
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $98E0
	ld bc, $1402
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcfb]
	inc a
	ld [wdcfb], a
	cp $08
	jr z, .asm_56ea
	ld a, $02
	ld [wdcf5], a
	ret
.asm_56ea
	ld c, $0C
	call Func_05c_5739
	ld a, $01
	ld [hFade], a
	ret
StripTilemapPointers_5c:
INCBIN "gfx/tilemaps/striptilemappointers_5c.tilemap"
Func_05c_5705:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_570b
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_570b
	ret

Func_05c_5713:
	ld hl, BGPals_5c
	call CopyBackgroundPalettes
	ld hl, BGPals_5c
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

Func_05c_5726:
	ld hl, BGPalsBlack_5c
	call CopyBackgroundPalettes
	ld hl, BGPalsBlack_5c
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

Func_05c_5739:
	call DelayFrame
	dec c
	jr nz, Func_05c_5739
	ret

Func_05c_5740:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_5749
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_5749
	ret
BGPalsBlack_5c:
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
BGPals_5c:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 0, 23
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
	ds 8
Attrmap_5c:
INCBIN "gfx/attrmaps/attrmap_5c.bin"
Tilemap_5c:
INCBIN "gfx/tilemaps/tilemap_5c.tilemap"
StripTilemaps_5c:
INCBIN "gfx/tilemaps/striptilemaps_5c.tilemap"
GFX_5c:
INCBIN "gfx/misc/gfx_5c.bin"
