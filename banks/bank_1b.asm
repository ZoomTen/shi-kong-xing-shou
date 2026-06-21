GaleCutscene::
; narrating Gale Corp's handover ceremony
	ld a, $67
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
	ld de, GaleCutscene_Tilemap0
	ld bc, $1412
	ld a, $0A
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, GaleCutscene_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, GaleCutscene_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, GaleCutscene_GFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	call .ClearVisibleObjects
	call .HideSprites
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.MainLoop
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .Exit
	ld a, [wdcf5]
	cp $00
	jr z, .State0
	cp $01
	jr z, .State1
	cp $02
	jr z, .State2
	cp $03
	jr z, .State3
	jp .MainLoop
.Exit
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.State0
	ld c, $40
	call .DelayCFrames
	ld a, $01
	ld [wdcf5], a
	jp .MainLoop
.State1
	call .LoadNextScene
	jp .MainLoop
.State2
	ld c, $0C
	call .DelayCFrames
	ld a, $01
	ld [hFade], a
	jp .MainLoop
.State3
	ld c, $12
	call .DelayCFrames
	call .LoadPalette
	xor a
	ld [wdcf5], a
	jp .MainLoop

; unreferenced
.ScrollDown
	ld a, [hSCY]
	inc a
	ldh [hSCY], a
	cp $A0
	ret nz
	ld a, $01
	ld [wdcf5], a
	ret

.LoadNextScene
	call .LoadBlackPalette
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $04
	jr z, .ResetScene
	ld de, .GfxPointers
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
	ld de, .TilemapPointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9880
	ld bc, $140A
	ld a, $0A
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, $03
	ld [wdcf5], a
	ret
.ResetScene
	ld a, $02
	ld [wdcf5], a
	xor a
	ld [wdcf3], a
	ret

.GfxPointers
	dw GaleCutscene_GFX
	dw GaleCutscene_GFX + $3F0
	dw GaleCutscene_GFX + $720
	dw GaleCutscene_GFX + $CE0
.TilemapPointers
	dw GaleCutscene_Tilemap0
	dw GaleCutscene_Tilemap1
	dw GaleCutscene_Tilemap2
	dw GaleCutscene_Tilemap3

.LoadPalette
	ld hl, GaleCutscene_Palette
	call CopyBackgroundPalettes
	ld hl, GaleCutscene_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

.LoadBlackPalette
	ld hl, GaleCutscene_BlackPalette
	call CopyBackgroundPalettes
	ld hl, GaleCutscene_BlackPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

.ClearVisibleObjects
	ld hl, wVisibleObjects
	ld bc, Start
.ClearVisibleObjectsLoop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .ClearVisibleObjectsLoop
	ret

.HideSprites
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.HideSpritesLoop
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .HideSpritesLoop
	ret

.DelayCFrames
	call DelayFrame
	dec c
	jr nz, .DelayCFrames
	ret

GaleCutscene_Attrmap:
	ds $168 ; all palette 0
	ds $118 ; padding

GaleCutscene_Tilemap0:
INCBIN "gfx/tilemaps/galecutscene_tilemap0.tilemap"
GaleCutscene_Tilemap1:
INCBIN "gfx/tilemaps/galecutscene_tilemap1.tilemap"
GaleCutscene_Tilemap2:
INCBIN "gfx/tilemaps/galecutscene_tilemap2.tilemap"
GaleCutscene_Tilemap3:
INCBIN "gfx/tilemaps/galecutscene_tilemap3.tilemap"

GaleCutscene_BlackPalette:
	ds $40 ; all RGB 0, 0, 0 (fade to black)

GaleCutscene_Palette:
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
	ds 8 ; padding

GaleCutscene_GFX:
INCBIN "gfx/misc/galecutscene_gfx.2bpp"
