LetterCutscene::
; letter from Sang Ni-Lin
	ld a, BGM_TOWN2
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
	ld de, LetterCutscene_InitialTilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, LetterCutscene_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, LetterCutscene_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, LetterCutscene_GFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	call .ClearVisibleObjects
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
	and a
	jr z, .State0
	cp $01
	jr z, .State1
	cp $02
	jr z, .State2
	jp .MainLoop
.Exit
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.State0
	call .AdvanceIntro
	jp .MainLoop
.State1
	call .LoadNextPage
	jp .MainLoop
.State2
	call .AdvancePage
	jp .MainLoop

.AdvanceIntro
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $C0
	ret nz
	xor a
	ld [wdcf3], a
	ld a, $01
	ld [wdcf5], a
	ret

.AdvancePage
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $20
	ret nz
	xor a
	ld [wdcf4], a
	ld [wdcf5], a
	call .LoadPalette
	ret

.LoadNextPage
	call .LoadBlackPalette
	ld a, [wdcfb]
	ld de, .TilemapPointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcfb]
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
	ld a, [wdcfb]
	inc a
	ld [wdcfb], a
	cp $05
	jr z, .FadeOut
	ld a, $02
	ld [wdcf5], a
	ret
.FadeOut
	ld c, $0C
	call .DelayCFrames
	ld a, $01
	ld [hFade], a
	ret

; .TilemapPointers is indexed 0-4; its entry 4 overlaps .GfxPointers entry 0
.TilemapPointers
	dw LetterCutscene_Tilemap0
	dw LetterCutscene_Tilemap1
	dw LetterCutscene_Tilemap2
	dw LetterCutscene_Tilemap3
.GfxPointers
	dw LetterCutscene_GFX + $600
	dw LetterCutscene_GFX + $DD0
	dw LetterCutscene_GFX + $1520
	dw LetterCutscene_GFX + $1B40

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

.LoadPalette
	ld hl, LetterCutscene_Palette
	call CopyBackgroundPalettes
	ld hl, LetterCutscene_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

.LoadBlackPalette
	ld hl, LetterCutscene_BlackPalette
	call CopyBackgroundPalettes
	ld hl, LetterCutscene_BlackPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

.DelayCFrames
	call DelayFrame
	dec c
	jr nz, .DelayCFrames
	ret
