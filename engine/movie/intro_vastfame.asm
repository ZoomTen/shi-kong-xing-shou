Intro_VastFame::
; Vast Fame logo screen
	call ClearBGMap0

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
	ld [wdcf6], a
	ld [wdcfc], a
	ld [wIntroSeqStep], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld [wcd40], a
	ld [wcd41], a

	ld hl, vBGMap0
	ld de, VastFame_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	ld hl, vBGMap0
	ld de, VastFame_Attrs
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, VastFame_Palette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, VastFameGFX
	ld de, vTiles2
	ld bc, $3e0
	call CopyBytesVRAM

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette

	call Intro_Delay

	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette

; begin intro
	call ClearBGMap0

	ld a, BGM_INTRO
	call PlaySound

	ld hl, vBGMap0
	ld de, Intro_Begin_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	ld hl, vBGMap0
	ld de, Intro_Begin_Attrs
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, Intro_Begin_BGPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, Intro_Begin_ObjPalette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld hl, Intro_Begin_GFX
	ld de, vTiles2
	ld bc, $170
	call CopyBytesVRAM

	ld hl, Intro_Stars_GFX
	ld de, vTiles0
	ld bc, $400
	call CopyBytesVRAM

	call Intro_ClearOAMBuffer

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette

Intro_StartingScreen:
	call DelayFrame
	call Intro_ClearSprites

; increase screen counter
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a

; screen skip
	ldh a, [hFade]
	and a
	jr nz, Intro_CharacterCastScreen

	call Intro_CheckButtonSkip
	call Intro_InitStars
	call Intro_MoveStars
	jp Intro_StartingScreen

Intro_CharacterCastScreen:
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a

	call FadeOutPalette
	call ClearBGMap0
	call Intro_ClearScreenState
	call Intro_ClearStarObjects

	ld a, BGM_INTRO
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

.NewScreen:
	call Intro_SetupNewScreen
	call Intro_ClearOAMBuffer

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette

.Loop:
	call DelayFrame
	call Intro_LoadNewTextSprites

	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a

	ldh a, [hFade]
	and a
	jr nz, .SkipToTitle

	call Intro_CheckButtonSkip

; Intro state manager
	ld a, [wIntroSeqStep]
	cp 1
	jr z, .character_slide_up
	cp 2
	jr z, .goto_next_screen
	cp 3
	jr z, .begin_screen
	cp 4
	jr z, .slide_text_up

; slide character right (BG layer)
	call Intro_ScrollBG
	jp .Loop

.SkipToTitle
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeInScene
	jp TitleScreen

.character_slide_up
; Window layer
	call Intro_ScrollWindow
	jp .Loop

.slide_text_up
; Sprite layer
	call Intro_ScrollTextSpritesUp
	jp .Loop

.goto_next_screen
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp 8
	jr c, .asm_41be
	xor a
	ld [wdce8], a
	ld a, 1
	ld [hFade], a
	ld c, $40
	call Intro_DelayCFrames
	jp .Loop

.asm_41be
	ld c, $40
	call Intro_DelayCFrames
	ld a, 0
	ld [wIntroSeqStep], a
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeInScene
	call ClearBGMap0
	call Intro_ClearOAMBuffer

	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wIntroStepTimer], a
	ld [wIntroScrollMode], a
	ld [wdcfb], a
	ld [wIntroSeqStep], a
	jp .NewScreen

.begin_screen
	call Intro_SetupNewScreen
	ld a, 1
	ld [wIntroSeqStep], a
	jp .Loop
