MeteorCutscene_ApplyTextPals:
	ld hl, MeteorCutscene_TextPalette
	call CopyBackgroundPalettes
	ld hl, MeteorCutscene_TextPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	ret

MeteorCutscene_ApplyBlackPal:
	ld hl, MeteorCutscene_BlackPalette
	call CopyBackgroundPalettes
	ld hl, MeteorCutscene_BlackPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	ret

Func_008_55f7:
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ret

MeteorCutscene_ClearSpriteBuffer:
	ld hl, wVisibleObjects
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

MeteorCutscene::
	ld a, BGM_METEOR
	call PlaySound

	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf5], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_Text1_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_TextAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_TextPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_TextGFX_1
	ld de, vTiles2
IF DEF(ENGLISH)
	ld bc, $700 ; whole cutscene font
ELSE
	ld bc, $520
ENDC
	call CopyBytesVRAM

	call MeteorCutscene_ClearSpriteBuffer
	call MeteorCutscene_HideAllSprites
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette

.SceneLoop:
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .done

	ld a, [wdcf5]
	and a
	jr z, .Text2_WaitBlack
	cp 1
	jr z, .FadeToMeteors
	cp 2
	jr z, .DoMeteorAnimation
	cp 3
	jr z, .FadeFromMeteors ; to text 4
	cp 4
	jr z, .Text4_WaitBlack ; texts 4 - 9
	cp 5
	jr z, .Text2_Load ; texts 2 and 3
	cp 6
	jr z, .Text2_WaitShow ; texts 2 and 3
	cp 7
	jr z, .Text4_Load ; texts 4 - 9
	cp 8
	jr z, .Text4_WaitShow ; texts 4 - 9
	jp .SceneLoop

.done
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, 4
	ld [hMapPredef], a
	jp JumpToModeAndSetMapPredefs

.Text2_WaitBlack:
	call MeteorCutscene_WaitAndBlackOut
	jp .SceneLoop

.FadeToMeteors:
	call MeteorCutscene_DoFadeToMeteors
	jp .SceneLoop

.DoMeteorAnimation:
	call MeteorCutscene_AnimateStormBG
	call MeteorCutscene_InitMeteor
	call MeteorCutscene_PlaceMeteor
	call MeteorCutscene_AnimateMeteor
	call MeteorCutscene_MoveMeteor
	jp .SceneLoop

.FadeFromMeteors:
	call MeteorCutscene_DoFadeFromMeteors
	jp .SceneLoop

.Text4_WaitBlack:
	call MeteorCutscene_WaitAndBlackOut2
	jp .SceneLoop

.Text2_Load:
	call MeteorCutscene_LoadTexts
	jp .SceneLoop

.Text2_WaitShow:
	call MeteorCutscene_WaitAndShowText
	jp .SceneLoop

.Text4_Load:
	call MeteorCutscene_LoadTexts2
	jp .SceneLoop

.Text4_WaitShow:
	call MeteorCutscene_WaitAndShowText2
	jp .SceneLoop

MeteorCutscene_DoFadeToMeteors:
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf6], a
	ld [wdce8], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_StormTilemap_1
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_StormAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_MeteorPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_OBJPalette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_StormGFX
	ld de, vTiles2
	ld bc, $760
	call CopyBytesVRAM

	ld hl, MeteorCutscene_MeteorGFX
	ld de, vTiles0
	ld bc, $80
	call CopyBytesVRAM
	call MeteorCutscene_ClearSpriteBuffer
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
	ld a, 2
	ld [wdcf5], a
	ret

MeteorCutscene_PlaceMeteor:
	ld a, [wdcf6]
	and a
	jr z, .shoot
	dec a
	ld [wdcf6], a
	ret

.shoot
	ld bc, wdd50
.loop
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .play_sfx
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .loop
	ret

.play_sfx
	ld a, SFX_2c
	call PlaySound

	ld de, unk_008_57e2
	ld a, [wdce8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
REPT 3
	ld a, [hli]
	ld [bc], a
	inc bc
ENDR
	ld a, 1
	ld [bc], a
	ld a, [hli]
	ld [wdcf6], a
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp 7
	ret c
	xor a
	ld [wdce8], a
	ret

; TODO: unk_ - lookup table indexed by wdce8
unk_008_57e2:
	dw $30f0, $1004
	dw $5000, $1004
	dw $70f0, $1004
	dw $9000, $1004
	dw $40f0, $1004
	dw $6000, $1004
	dw $80f0, $1004

MeteorCutscene_AnimateMeteor:
	ld bc, wdd50
.asm_5801
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5815
.asm_5809
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .asm_5801
	ret

.asm_5815
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5820
	dec [hl]
	jr .asm_5809

.asm_5820
	ld [hl], 4
	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld d, a
	ld a, 3
	sub d
	ld [hl], a
	jr .asm_5809

MeteorCutscene_MoveMeteor:
	ld bc, wdd50
.asm_5831
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5845
.asm_5839
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4f
	jr c, .asm_5831
	ret

.asm_5845
	ld hl, 1
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, 0
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	cp $a0
	jr nz, .asm_5839
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	jr .asm_5839

MeteorCutscene_InitMeteor:
; clears the OAM each time
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ld [wVirtualOAMPtr], a
	call MeteorCutscene_InitMeteor2
	ret

MeteorCutscene_HideAllSprites:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

MeteorCutscene_InitMeteor2:
	ld bc, wdd50
.asm_5890
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_58a4
.asm_5898
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4f
	jr c, .asm_5890
	ret

.asm_58a4
	ld hl, 0
	add hl, bc
	ld a, [hl]
	ld [wdcf7], a
	ld hl, 1
	add hl, bc
	ld a, [hl]
	ld [wdcf8], a
	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld de, .Frames
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $c0
.asm_58ca
	ld a, [hli]
	cp -1
	jr z, .asm_58ea
	push bc
	ld b, a
	ld a, [wdcf7]
	add b
	pop bc
	ld [de], a
	inc de
	ld a, [hli]
	push bc
	ld b, a
	ld a, [wdcf8]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop bc
	jr .asm_58ca

.asm_58ea
	ld a, e
	ld [wVirtualOAMPtr], a
	jp .asm_5898

.Frames:
	dw .Frame1
	dw .Frame1
	dw .Frame2

.Frame1:
	db 0
	db 0
	db 0
	db 0
	db 0
	db 8
	db 2
	db 0
	db -1

.Frame2:
	db 0
	db 0
	db 4
	db 0
	db 0
	db 8
	db 6
	db 0
	db -1

MeteorCutscene_AnimateStormBG:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $40
	ret nz
	xor a
	ld [wdcf3], a
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	hlbgcoord 0, 0
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 3
	ret c
	ld a, 3
	ld [wdcf5], a
	ret

.Tilemaps:
	dw MeteorCutscene_StormTilemap_2
	dw MeteorCutscene_StormTilemap_3
	dw MeteorCutscene_StormTilemap_3

MeteorCutscene_DoFadeFromMeteors:
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_Text4_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_TextAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_TextPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_TextGFX_2
	ld de, vTiles2
IF DEF(ENGLISH)
	ld bc, $700 ; whole cutscene font
ELSE
	ld bc, $800
ENDC
	call CopyBytesVRAM

	ld hl, MeteorCutscene_TextGFX_3
	ld de, vTiles1
	ld bc, $210
	call CopyBytesVRAM

	call MeteorCutscene_ClearSpriteBuffer
	call MeteorCutscene_HideAllSprites
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
	ld a, 4
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndBlackOut:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyBlackPal
	ld a, 5
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndShowText:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $20
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyTextPals
	ld a, 0
	ld [wdcf5], a
	ret

MeteorCutscene_LoadTexts:
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
IF DEF(ENGLISH)
	hlbgcoord 0, 6
	lb bc, $14, 7
	ld a, 7
ELSE
	hlbgcoord 0, 8
	lb bc, $14, 2
	ld a, 2
ENDC
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 3
	jr nc, .asm_5a2f
	ld a, 6
	ld [wdcf5], a
	ret

.asm_5a2f
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld a, 1
	ld [wdcf5], a
	ret

.Tilemaps:	; texts 2 and 3
	dw MeteorCutscene_Text2_Tilemap
	dw MeteorCutscene_Text3_Tilemap
	dw MeteorCutscene_Text3_Tilemap

MeteorCutscene_WaitAndBlackOut2:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyBlackPal
	ld a, 7
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndShowText2:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $20
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyTextPals
	ld a, 4
	ld [wdcf5], a
	ret

MeteorCutscene_LoadTexts2:
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
IF DEF(ENGLISH)
	hlbgcoord 0, 6
	lb bc, $14, 7
	ld a, 7
ELSE
	hlbgcoord 0, 8
	lb bc, $14, 2
	ld a, 2
ENDC
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 6
	jr nc, .asm_5aa2
	ld a, 8
	ld [wdcf5], a
	ret

.asm_5aa2
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf5], a
	ld a, 1
	ld [hFade], a
	ret

.Tilemaps:	; texts 5 to 10
	dw MeteorCutscene_Text5_Tilemap
	dw MeteorCutscene_Text6_Tilemap
	dw MeteorCutscene_Text7_Tilemap
	dw MeteorCutscene_Text8_Tilemap
	dw MeteorCutscene_Text9_Tilemap
	dw MeteorCutscene_Text9_Tilemap
