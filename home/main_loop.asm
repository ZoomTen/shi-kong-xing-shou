_Start::
; Save console type (DMG or CGB)
	ldh [hConsoleType], a

; Set stack
	ld sp, wdfff

; Scroll
	xor a
	ldh [rSCX], a
	ldh [rSCY], a
; LCD
	di
	ld a, LCDCF_OFF
	ldh [rLCDC], a
; Palettes
	ld a, %11100100
	ldh [rBGP], a
	ld a, %00011100
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a
; STAT
	ld a, $40
	ldh [rSTAT], a
	ld a, 143
	ldh [rLYC], a
; Interrupts
	ld a, 0
	ldh [rIF], a
	ld a, IEF_VBLANK + IEF_LCDC
	ldh [rIE], a
	jp .continue

; Alternate header?
	INCBIN "data/vf_header.bin"

.continue
	call ClearMemory
	call WriteOAMDMACodeToHRAM

	ld hl, LCDSplit_Idle
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e1], a
	ei
	ld a, 2
	ld [wCurrentSoundBank], a
	call InitSound

; Check SRAM
	call SRAMTest

StartGame::
	ld a, $03
	ldh [hMapNumber], a
	ld a, 0
	ldh [hWarpNumber], a
	ld [wd0ff], a
	ld [wd0df], a
	ld [wd0ef], a
	ld a, 0
	ld [hMapPredef], a
	call LoadMapAndScriptPredef
	ld a, GAMEMODE_INTRO_VAST_FAME
	ld [wTargetMode], a

JumpToGameMode::
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	ld de, GameModes
	ld a, [wTargetMode]
	ld l, a
	ld h, 0
	add hl, hl
	add l
	ld l, a
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

JumpToModeAndSetMapPredefs::
	call LoadMapAndScriptPredef
	jr JumpToGameMode

; Seems to load on each map entry
GameModes:: INCLUDE "data/game_modes.asm"
