Func_00c_4000:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_4013
	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, .asm_4013
	ld a, $08
	jr .asm_4016
.asm_4013
	ld a, [wSelectedOption]
.asm_4016
	ld de, Pointers_00c_63dc
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0100
	ld de, vTiles0
	call Func_135a
	ret
Func_00c_402b:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_403e
	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, .asm_403e
	ld a, $08
	jr .asm_4041
.asm_403e
	ld a, [wSelectedOption]
.asm_4041
	ld de, Pointers_00c_5f4a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0080
	ld de, $8f60
	call Func_135a
	ret

Func_00c_4056::
	ld de, .SignpostGroups

; map group
	ld a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a

; signpost number
	ld a, [wd1e3]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de

; store to text buffer
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ret

.SignpostGroups:
	dw Group00_Signposts
	dw Group00_Signposts
	dw Group02_Signposts
	dw Group03_Signposts
	dw Group04_Signposts
	dw Group05_Signposts
	dw Group06_Signposts
	dw Group00_Signposts

Group00_Signposts:
	dw text_0c_40a7
	dw text_0c_40a7
	dw text_0c_40af
	dw text_0c_40b8
	dw text_0c_40c0
	dw text_0c_40c7
	dw text_0c_40d1
	dw text_0c_40db
	dw text_0c_40e6
	dw text_0c_40ed
	dw text_0c_40f5
	dw text_0c_4103
	dw text_0c_410d
	dw text_0c_4116
	dw text_0c_4120
	dw text_0c_412a
	dw text_0c_4133

INCLUDE "data/text/signposts_1.asm"

Group02_Signposts:
	dw text_0c_4152
	dw text_0c_4152
	dw text_0c_415a
	dw text_0c_4162
	dw text_0c_416d
	dw text_0c_4176
	dw text_0c_417f
	dw text_0c_4189
	dw text_0c_4194
	dw text_0c_41af
	dw text_0c_41b6

INCLUDE "data/text/signposts_2.asm"

Group03_Signposts:
	dw text_0c_41cb
	dw text_0c_41cb
	dw text_0c_41d3
	dw text_0c_41da
	dw text_0c_41e5
	dw text_0c_41ee
	dw text_0c_41f7

INCLUDE "data/text/signposts_3.asm"

Group04_Signposts:
	dw text_0c_4216
	dw text_0c_4216
	dw text_0c_421e
	dw text_0c_4229
	dw text_0c_4233
	dw text_0c_423d
	dw text_0c_4250
	dw text_0c_4258
	dw text_0c_4260
	dw text_0c_426a
	dw text_0c_4272
	dw text_0c_4283

INCLUDE "data/text/signposts_4.asm"

Group05_Signposts:
	dw text_0c_42a5
	dw text_0c_42a5
	dw text_0c_42ad
	dw text_0c_42b5
	dw text_0c_42bd
	dw text_0c_42c7
	dw text_0c_42d3
	dw text_0c_42db

INCLUDE "data/text/signposts_5.asm"

Group06_Signposts:
	dw text_0c_42f9
	dw text_0c_42f9
	dw text_0c_4303
	dw text_0c_430e
	dw text_0c_431a
	dw text_0c_4322

INCLUDE "data/text/signposts_6.asm"

BattleUIGFX::
INCBIN "gfx/misc/battleuigfx.2bpp"
Pointers_00c_5f4a:
	dr $31f4a, $323dc
Pointers_00c_63dc:
	dr $323dc, $32cee

_SRAMTest::
; Write pattern of decreasing bytes into SRAM and verify that they were written correctly
; If check succeeds, exit silently; otherwise display error screen
	ld hl, _SRAM
	ld bc, $2000
.write_pattern
	ld a, c
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .write_pattern

	ld hl, _SRAM
	ld bc, $2000
.check_pattern
	ld a, [hli]
	cp c
	jr nz, .failed_check
	dec bc
	ld a, c
	or b
	jr nz, .check_pattern
	ret

.failed_check:
	xor a ; SRAM_DISABLE
	ld [rRAMG], a

	ei
	call ClearBGMap0

; Load tiles into vTiles2
	ld de, vTiles2
	ld hl, SRAMErrorGFX
	ld bc, 14 tiles
	call CopyBytesVRAM

; Place tilemap
	hlbgcoord 3, 9
	ld de, SRAMErrorTilemap
	lb bc, 14, 1
	ld a, 14
	ld [hVRAMCopyWidth], a
	ld a, 1
	ld [hVRAMCopyHeight], a
	call PlaceTilemap_Bank0

; CGB only
; Place attrmap
	hlbgcoord 3, 9
	ld de, SRAMErrorAttrmap
	lb bc, 14, 1
	ld a, 14
	ld [hVRAMCopyWidth], a
	ld a, 1
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap

; CGB only
	ld hl, SRAMErrorPalette
	ld c, BCPSF_AUTOINC
	ld b, 1 palettes
	call LoadPalettes_BCPD

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld a, $a0
	ldh [rWY], a

; After displaying message, wait for any input before exiting
.wait_input
	call DelayFrame
	ldh a, [hJoypadPressed]
	and a
	jr z, .wait_input

	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

SRAMErrorGFX:
	INCBIN "gfx/sram_error.2bpp"

SRAMErrorAttrmap:
	ds 14, $00

SRAMErrorTilemap:
	;  "T"  "E"  "S"  "T"  " "               "SRAM ERROR"
	db $01, $02, $03, $04, $00, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d

SRAMErrorPalette:
REPT 8
	RGB 31, 31, 31
	RGB 31, 23, 14
	RGB 24, 13, 0
	RGB 0, 0, 0
ENDR

Func_00c_6ea5:
	push bc
	push hl
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .asm_6eb2
.asm_6ead
	rrc l
	dec a
	jr nz, .asm_6ead
.asm_6eb2
	bit 0, l
	jr z, .asm_6eba
	ld a, $01
	jr .asm_6ebb
.asm_6eba
	xor a
.asm_6ebb
	pop hl
	pop bc
	ret

Func_00c_6ebe:
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .asm_6ec9
.asm_6ec4
	rrc l
	dec a
	jr nz, .asm_6ec4
.asm_6ec9
	set 0, l
	ld a, b
	and a
	jr z, .asm_6ed4
.asm_6ecf
	rlc l
	dec a
	jr nz, .asm_6ecf
.asm_6ed4
	ld a, l
	ld [de], a
	ret

Func_00c_6ed7::
	ld de, Pointers_00c_6f22
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wdcb4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [wPlayerFacing]
	cp d
	jr nz, .asm_6f1d
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call Func_00c_6ea5
	and a
	jr nz, .asm_6f1c
	pop hl
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call Func_00c_6ebe
	pop hl
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld [wdcb6], a
	ld a, [hli]
	ld [wdcb7], a
	ret
.asm_6f1c
	pop hl
.asm_6f1d
	xor a
	ld [wdcb4], a
	ret

Pointers_00c_6f22:
	dr $32f22, $33230
