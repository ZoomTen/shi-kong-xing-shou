TitleScreen:
	call ClearBGMap0

	ld a, BGM_TITLE
	call PlaySound

	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdce8], a
	ld [wIntroStepTimer], a
	ld [wIntroScrollMode], a
	ld [wdcfb], a
	ld [wIntroSeqStep], a

	ld hl, vBGMap0
	ld de, TitleScreen_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	ld hl, vBGMap0
	ld de, TitleScreen_Attrs
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, TitleScreen_BGPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, TitleScreen_ObjPalette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld a, BANK(TitleScreenGFX)
	ld [wTempBank], a
	ld hl, TitleScreenGFX
	ld de, $9000
	ld bc, $800
	call FarCopyBytesVRAM

	ld a, BANK(TitleScreenGFX)
	ld [wTempBank], a
	ld hl, TitleScreenGFX tile $80
	ld de, $8800
	ld bc, $800
	call FarCopyBytesVRAM

	ld a, BANK(TitleScreenGFX_Sprites)
	ld [wTempBank], a
	ld hl, TitleScreenGFX_Sprites
	ld de, $8000
	ld bc, $800
	call FarCopyBytesVRAM

	call Intro_ClearScreenState
IF DEF(ENGLISH)
	ld a, $20
	ld [wcd43], a
	ld a, $18
	ld [wcd42], a
ELSE
	ld a, 8
	ld [wcd43], a
	ld a, $10
	ld [wcd42], a
ENDC
	ld a, 1
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	ld a, $40
	ld [wcd56], a
	ld a, $68
	ld [wcd55], a
	ld a, 2
	ld [wcd57], a
	ld a, $82
	ld [wcd58], a
	call TitleScreen_UpdateSprites

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette

.Loop:
	call DelayFrame
	call TitleScreen_UpdateSprites
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .jump_to_game
	call TitleScreen_PaletteCycle
	call TitleScreen_DoSpriteAnimations
	call TitleScreen_DoSpriteAnimations2
	call TitleScreen_DoSpriteAnimations3
	ld a, [wIntroSeqStep]
	cp 1
	jr z, .asm_42fb
	cp 2
	jr z, .asm_4301
	call TitleScreen_HandleStartInput
	jp .Loop

.asm_42fb
	call TitleScreen_AnimateCursorToContinue
	jp .Loop

.asm_4301
	call TitleScreen_HandleMenuInput
	jp .Loop

.jump_to_game
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
	ret

Intro_Delay:
	ld bc, $80
.do_delay
	ld hl, 0
.loop
	inc hl
	ld a, h
	or l
	jr nz, .loop
	dec bc
	cp 0 ; ??
	jr nz, .do_delay
	ret

LoadDebugItems:
	ld hl, wItemBag
	ld [hl], ITEM_04
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_04
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_17
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_27
	inc hl
	ld [hl], 20

; 5000 money
	ld a, HIGH(5000)
	ld [wMoney + 1], a
	ld a, LOW(5000)
	ld [wMoney + 2], a
	ret


TitleScreen_HandleMenuInput:
	ldh a, [hJoypadDown]
	bit 6, a
	jr z, .check_down
	ld a, [wIntroScrollMode]
	and a
	ret z
	ld a, SFX_30
	call PlaySound
	xor a
	ld [wdcfb], a
	ld a, $60
	ld [wcd5d], a
	ret

.check_down
	ldh a, [hJoypadDown]
	bit 7, a
	jr z, .check_confirm
	ld a, [wIntroScrollMode]
	and a
	ret z
	ld a, [wdcfb]
	cp 1
	ret z
	ld a, SFX_30
	call PlaySound
	ld a, 1
	ld [wdcfb], a
	ld a, $70
	ld [wcd5d], a
	ret

.check_confirm
	ldh a, [hJoypadDown]
	bit 0, a
	ret z
	ld a, SFX_34
	call PlaySound
	ld a, 1
	ld [hFade], a
	xor a
	ld [wd9d2], a
	ld a, [wdcfb]
	and a
	jr z, .new_game
	call SRAMTest_Fast
	and a
	ret nz
	ld a, 1
	ld [wd9d2], a
	farcall LoadSaveData
	xor a
	ld [wTargetMode], a
	ret

.new_game
	ld a, 1
	ld [wdcb3], a
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, 0
	ld [hMapPredef], a
	jp JumpToModeAndSetMapPredefs
	ret

TitleScreen_AnimateCursorToContinue:
	ld a, [wcd5d]
	dec a
	dec a
	ld [wcd5d], a
	ld a, [wcd59]
	dec a
	dec a
	ld [wcd59], a
	cp $60
	jr z, .reached_target
	ret

.reached_target
	ld a, [wdcfb]
	and a
	jr z, .set_state
	ld a, $70
	ld [wcd5d], a

.set_state
	ld a, 2
	ld [wIntroSeqStep], a
	ret

CheatCode_InputList:
	db D_UP, A_BUTTON, A_BUTTON, D_UP, B_BUTTON, B_BUTTON, SELECT, SELECT          ; 1
	db D_DOWN, D_DOWN, D_LEFT, D_RIGHT, SELECT, A_BUTTON, SELECT, B_BUTTON         ; 2
	db D_LEFT, D_LEFT, D_RIGHT, D_RIGHT, D_UP, D_UP, D_DOWN, D_DOWN                ; 3
	db D_RIGHT, B_BUTTON, B_BUTTON, B_BUTTON, D_LEFT, A_BUTTON, A_BUTTON, A_BUTTON ; 4
	db D_LEFT, D_LEFT, D_RIGHT, D_RIGHT, D_UP, D_UP, D_DOWN, D_DOWN                ; 5

TitleScreen_CheckCheatCodes:
	ldh a, [hJoypadPressed]
	and a
	ret z

	ld a, [wdcb2]
	ld c, a
.asm_442c:
; Find base address (c*8 + de)
	ld de, CheatCode_InputList
	ld l, c
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
; Add counter
	ld a, [wdcb1]
	ld e, a
	ld d, 0
	add hl, de
	ldh a, [hJoypadDown]
	cp [hl]
	jr nz, .asm_446f

	ld a, [wdcb1]
	inc a
	ld [wdcb1], a
	ld a, c
	ld [wdcb2], a
; Limit combo to 8 inputs
	ld a, [wdcb1]
	cp 8
	ret c

	ld a, c
	inc a
	ld [wdcb0], a
	ld a, SFX_23
	call PlaySound
	xor a
	ld [wdcb1], a
	ld [wdcb2], a
	ld a, 1
	ld [wcd51], a
	ld [wIntroSeqStep], a
	jr TitleScreen_LoadNewGameMenu
	ret

.asm_446f
	ld a, [wdcb1]
	and a
	jr nz, .asm_447a
; Limit search to 5 cheat codes (broken)
	inc c
	cp 5
	jr c, .asm_442c

.asm_447a
	xor a
	ld [wdcb1], a
	ld [wdcb2], a
	ret

TitleScreen_HandleStartInput:
	ldh a, [hJoypadPressed]
	bit PADB_START, a
	jr z, TitleScreen_CheckCheatCodes
	ld a, SFX_23
	call PlaySound
	call TitleScreen_LoadSaveFile
	ld a, 1
	ld [wIntroSeqStep], a
	ret

TitleScreen_LoadSaveFile:
	call SRAMTest_Fast
	and a
	jr z, TitleScreen_LoadContinueMenu

TitleScreen_LoadNewGameMenu:
	ld a, $40
	ld [wcd5a], a
	ld a, $a0
	ld [wcd59], a
	ld a, 3
	ld [wcd5b], a
	ld a, $83
	ld [wcd5c], a
	ld a, $38
	ld [wcd5e], a
	ld a, $a0
	ld [wcd5d], a
	ld a, 5
	ld [wcd5f], a
	ld a, $85
	ld [wcd60], a
	xor a
	ld [wIntroScrollMode], a
	ld [wdcfb], a
	ld a, $40
	ld [wcd56], a
	ld a, $b0
	ld [wcd55], a
	ld a, 0
	ld [wcd57], a
	ld a, $80
	ld [wcd58], a
	ret

TitleScreen_LoadContinueMenu:
	ld a, $40
	ld [wcd5a], a
	ld a, $a0
	ld [wcd59], a
	ld a, 4
	ld [wcd5b], a
	ld a, $84
	ld [wcd5c], a
	ld a, $38
	ld [wcd5e], a
	ld a, $a0
	ld [wcd5d], a
	ld a, 5
	ld [wcd5f], a
	ld a, $85
	ld [wcd60], a
	ld a, 1
	ld [wIntroScrollMode], a
	ld [wdcfb], a
	ld a, $40
	ld [wcd56], a
	ld a, $b0
	ld [wcd55], a
	ld a, 0
	ld [wcd57], a
	ld a, $80
	ld [wcd58], a
	ret

TitleScreen_PaletteCycle:
	ld a, [wIntroStepTimer]
	inc a
	ld [wIntroStepTimer], a
	cp 7
	ret nz
	xor a
	ld [wIntroStepTimer], a
	ld a, [wdce8]
	ld de, .Palettes
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld b, 8
	ld c, $90
	call LoadPalettes_BCPD
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp 3
	ret c
	xor a
	ld [wdce8], a
	ret

.Palettes:
; frame 0
	RGB 31, 31, 31
	RGB 23, 23, 31
	RGB 13, 08, 30
	RGB 00, 00, 05

; frame 1
	RGB 13, 08, 30
	RGB 31, 31, 31
	RGB 23, 23, 31
	RGB 00, 00, 05

; frame 2
	RGB 23, 23, 31
	RGB 13, 08, 30
	RGB 31, 31, 31
	RGB 00, 00, 05

TitleScreen_DoSpriteAnimations3:
	ld a, [wcd60]
	and a
	ret z
	and $80
	jr nz, .restart_animation
	ldh a, [hFadeFrameCounter]
	and 1
	ret nz
	jr .animate

.restart_animation
	ld a, [wcd60]
	and $7f
	ld [wcd60], a
	xor a
	ld [wcd67], a
.animate
	ld a, [wcd60]
	ld de, TitleScreen_SpriteAnimations
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd67]
	ld e, a
	ld d, 0
	add hl, de
; end if reaching the end byte
	ld a, [hl]
	cp -1
	jr nz, .finished
	xor a
	ld [wcd67], a
	ret

.finished
	ld [wcd5f], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	ret

TitleScreen_DoSpriteAnimations2:
	ld a, [wcd5c]
	and a
	ret z
	and $80
	jr nz, .restart_animation
	ldh a, [hFadeFrameCounter]
	and 1
	ret nz
	jr .animate

.restart_animation
	ld a, [wcd5c]
	and $7f
	ld [wcd5c], a
	xor a
	ld [wcd66], a
.animate
	ld a, [wcd5c]
	ld de, TitleScreen_SpriteAnimations
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd66]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	cp -1
	jr nz, .finished
	xor a
	ld [wcd66], a
	ret

.finished
	ld [wcd5b], a
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	ret

TitleScreen_DoSpriteAnimations:
	ld a, [wcd58]
	and a
	ret z
	and $80
	jr nz, .restart_animation
	ldh a, [hFadeFrameCounter]
	and 1
	ret nz
	jr .animate

.restart_animation
	ld a, [wcd58]
	and $7f
	ld [wcd58], a
	xor a
	ld [wcd65], a
.animate
	ld a, [wcd58]
	ld de, TitleScreen_SpriteAnimations
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd65]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	cp -1
	jr nz, .finished
	xor a
	ld [wcd65], a
	ret

.finished
	ld [wcd57], a
	ld a, [wcd65]
	inc a
	ld [wcd65], a
	ret

TitleScreen_SpriteAnimations:
	dw .Nothing
	dw .TitleScreen
	dw .PressStartText
	dw .NewGameText
	dw .NewGameContinueText
	dw .Cursor

.Nothing:
	db -1

.TitleScreen:
	db $1
	db $1
	db $1
	db $1
	db -1

.PressStartText:
	db $2
	db $2
	db $2
	db $2
	db $0
	db $0
	db $0
	db $0
	db -1

.NewGameText:
	db $3
	db $3
	db $3
	db -1

.NewGameContinueText:
	db $4
	db $4
	db $4
	db -1

.Cursor:
	db $5
	db $5
	db $5
	db -1

TitleScreen_UpdateSprites:
	ld hl, wVirtualOAM
	ld bc, 40
	ld de, 4

.init_sprites
	ld a, 160
	ld [hl], a
	add hl, de
	dec c
	jr nz, .init_sprites
	xor a
	ld [wVirtualOAMPtr], a
	call .UpdateTitleSprites
	call .UpdatePressStartSprites
	call .UpdateMenuSprites
	call .UpdateCursorSprites
	ret

.UpdateTitleSprites:
	ld hl, TitleScreen_Sprites
; get y offset -> c
	ld de, wcd42
	ld a, [de]
	ld c, a
; get x offset -> b
	inc de
	ld a, [de]
	ld b, a
; get sprite number
	inc de
	ld a, [de]
	and a
; return if sprite 0 is selected
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr] ; where to put the sprite
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_1
	ld a, [hli]
	cp -1
	jr z, .finished_copying_1
; apply Y and X offsets
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
	jr .copy_sprite_1
.finished_copying_1
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

.UpdateCursorSprites:
; See .UpdateTitleSprites
	ld hl, TitleScreen_Sprites
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
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_2
	ld a, [hli]
	cp -1
	jr z, .finished_copying_2
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
	jr .copy_sprite_2
.finished_copying_2
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

.UpdateMenuSprites:
	ld hl, TitleScreen_Sprites
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
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_3
	ld a, [hli]
	cp -1
	jr z, .finished_copying_3
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
	jr .copy_sprite_3
.finished_copying_3
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

.UpdatePressStartSprites:
	ld hl, TitleScreen_Sprites
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
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_4
	ld a, [hli]
	cp -1
	jr z, .finished_copying_4
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
	jr .copy_sprite_4
.finished_copying_4
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

TitleScreen_Sprites:
	dw .Nothing
	dw .TitleScreen
	dw .PushStartText
	dw .NewGameText
	dw .NewGameContinueText
	dw .Cursor

.Nothing:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $00, 0
	dsprite  0,  0,  2,  0, $00, 0
	dsprite  0,  0,  3,  0, $00, 0
	dsprite  0,  0,  4,  0, $00, 0
	dsprite  0,  0,  5,  0, $00, 0
	db -1 ; end

IF DEF(ENGLISH)
.TitleScreen:
	dsprite  5,  0,  0,  0, $00, 0
	dsprite  7,  0,  0,  0, $02, 0
	dsprite  4,  0,  1,  0, $04, 0
	dsprite  6,  0,  1,  0, $06, 0
	dsprite  3,  0,  2,  0, $08, 0
	dsprite  5,  0,  2,  0, $0a, 0
	dsprite  7,  0,  2,  0, $0c, 0
	dsprite  3,  0,  3,  0, $0e, 0
	dsprite  5,  0,  3,  0, $10, 0
	dsprite  7,  0,  3,  0, $12, 0
	dsprite  3,  0,  4,  0, $14, 0
	dsprite  3,  0,  5,  0, $16, 0
	dsprite  3,  0,  5,  0, $18, 0
	dsprite  5,  0,  5,  0, $1a, 0
	dsprite  6,  4,  6,  0, $1c, 1
	dsprite  3,  0,  7,  0, $1e, 0
	dsprite  3,  0,  8,  0, $20, 0
	dsprite  -1,  0,  9,  0, $22, 0
	dsprite  0,  0,  8,  0, $24, 0
	dsprite  31,  7,  0,  0, $00, 0 ; early $FF
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	db -1 ; end

.PushStartText:
	dsprite  0,  0,  0,  0, $28, 2
	dsprite  0,  0,  1,  0, $2a, 2
	dsprite  0,  0,  2,  0, $2c, 2
	dsprite  0,  0,  3,  0, $2e, 2
	dsprite  0,  0,  4,  0, $30, 2
	dsprite  0,  0,  5,  0, $32, 2
	db -1 ; end

.NewGameText:
	dsprite  0,  0,  0,  0, $40, 2
	dsprite  0,  0,  1,  0, $42, 2
	dsprite  0,  0,  2,  0, $44, 2
	dsprite  0,  0,  3,  0, $46, 2
	dsprite  0,  0,  4,  0, $48, 2
	dsprite  0,  0,  5,  0, $4a, 2
	db -1 ; end

.NewGameContinueText:
	dsprite  0,  0,  0,  0, $40, 2
	dsprite  0,  0,  1,  0, $42, 2
	dsprite  0,  0,  2,  0, $44, 2
	dsprite  0,  0,  3,  0, $46, 2
	dsprite  0,  0,  4,  0, $48, 2
	dsprite  0,  0,  5,  0, $4a, 2
	dsprite  2,  0,  0,  0, $4c, 2
	dsprite  2,  0,  1,  0, $4e, 2
	dsprite  2,  0,  2,  0, $50, 2
	dsprite  2,  0,  3,  0, $52, 2
	dsprite  2,  0,  4,  0, $54, 2
	dsprite  2,  0,  5,  0, $56, 2
	db -1 ; end

.Cursor:
	dsprite  0,  0,  0,  0, $58, 2
	db -1 ; end
ELSE
.TitleScreen:
	dsprite  0,  0, 10,  0, $00, 0
	dsprite  1,  0,  7,  0, $02, 0
	dsprite  1,  0,  8,  0, $04, 0
	dsprite  1,  0,  9,  0, $06, 0
	dsprite  1,  0, 11,  0, $08, 0
	dsprite  1,  0, 12,  0, $0a, 0
	dsprite  2,  0, 10,  0, $0c, 0
	dsprite  3,  0,  5,  0, $0e, 0
	dsprite  3,  0,  6,  0, $10, 0
	dsprite  3,  0,  7,  0, $12, 0
	dsprite  3,  0,  8,  0, $14, 0
	dsprite  3,  0,  9,  0, $16, 0
	dsprite  4,  0, 11,  0, $18, 0
	dsprite  4,  0, 12,  0, $1a, 0
	dsprite  4,  0, 15,  0, $1c, 0
	dsprite  4,  0, 16,  0, $1e, 0
	dsprite  5,  0,  3,  0, $20, 0
	dsprite  5,  0,  4,  0, $22, 0
	dsprite  6,  0,  5,  0, $24, 0
	dsprite  6,  0,  6,  0, $26, 1
	dsprite  7,  0,  3,  0, $28, 0
	dsprite  7,  0,  4,  0, $2a, 0
	dsprite  8,  0,  5,  0, $2c, 0
	dsprite  8,  0,  6,  0, $2e, 0
	db -1 ; end

.PushStartText:
	dsprite  0,  0,  0,  0, $30, 2
	dsprite  0,  0,  1,  0, $32, 2
	dsprite  0,  0,  2,  0, $34, 2
	dsprite  0,  0,  3,  0, $36, 2
	dsprite  0,  0,  4,  0, $38, 2
	dsprite  0,  0,  5,  0, $3a, 2
	db -1 ; end

.NewGameText:
	dsprite  0,  0,  0,  0, $3c, 2
	dsprite  0,  0,  1,  0, $3e, 2
	dsprite  0,  0,  2,  0, $40, 2
	dsprite  0,  0,  3,  0, $42, 2
	dsprite  0,  0,  4,  0, $44, 2
	dsprite  0,  0,  5,  0, $46, 2
	db -1 ; end

.NewGameContinueText:
	dsprite  0,  0,  0,  0, $48, 2
	dsprite  0,  0,  1,  0, $4a, 2
	dsprite  0,  0,  2,  0, $4c, 2
	dsprite  0,  0,  3,  0, $4e, 2
	dsprite  0,  0,  4,  0, $50, 2
	dsprite  0,  0,  5,  0, $52, 2
	dsprite  2,  0,  0,  0, $54, 2
	dsprite  2,  0,  1,  0, $56, 2
	dsprite  2,  0,  2,  0, $58, 2
	dsprite  2,  0,  3,  0, $5a, 2
	dsprite  2,  0,  4,  0, $5c, 2
	dsprite  2,  0,  5,  0, $5e, 2
	db -1 ; end

.Cursor:
	dsprite  0,  0,  0,  0, $60, 2
	db -1 ; end
ENDC
