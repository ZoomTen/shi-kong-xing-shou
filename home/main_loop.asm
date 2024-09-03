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

	ld hl, Func_106f
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e0 + 1], a
	ei
	ld a, 2
	ld [wd091], a
	call Func_262d

; Check SRAM
	call SRAMTest

	ld a, $03
	ldh [hMapNumber], a
	ld a, 0
	ldh [hWarpNumber], a
	ld [wd0ff], a
	ld [wd0df], a
	ld [wd0ef], a
	ld a, 0
	ld [hFFBA], a
	call LoadMapAndScriptPredef
	ld a, $12
	ld [wTargetMode], a

JumpToGameMode::
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
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

GameModes::
; Seems to load on each map entry
	dba Overworld       ; $00
	dba MeteorCutscene  ; $01
	dba NewGameContinueMenu   ; $02
	dba GameOver   ; $03
	dba GaleCutscene   ; $04
	dba RhythmMinigame   ; $05
	dba AirportCutscene1   ; $06
	dba AirportCutscene2   ; $07
	dba LetterCutscene   ; $08
	dba MeteorCutscene2   ; $09
	dba Func_05c_55e7   ; $0a
	dba UnderwaterPictureCutscene   ; $0b
	dba RacingMinigame   ; $0c
	dba CrystalCutscene   ; $0d
	dba MiceMinigame   ; $0e
	dba AirportCutscene3   ; $0f
	dba WorldMap   ; $10
	dba AirportCutscene4   ; $11
	dba Intro_VastFame  ; $12
	dba BeachCutscene   ; $13
	dba FloatingIslandCutscene1   ; $14
	dba FloatingIslandCutscene2   ; $15
	dba WorldMap2   ; $16
	dba NewGameContinueMenu   ; $17
	dba NewGameContinueMenu   ; $18
	dba Debug_SoundTest ; $19
	dba Func_03c_4c74   ; $1a
	dba Func_07a_401f   ; $1b
	dba Func_07a_4188   ; $1c
	dba Func_06f_4000   ; $1d
	dba Func_070_4000   ; $1e
	dba Credits   ; $1f
	dba TheEnd   ; $20


