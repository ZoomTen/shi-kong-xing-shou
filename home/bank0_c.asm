WaitVRAM_STAT::
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT

Func_06c6::
	ld a, [_BANKNUM]
	push af
	call Func_19ca
	pop af
	rst Bankswitch
	ret

Func_06d0::
	ld a, BANK(Func_00b_417b)
	rst Bankswitch
	call Func_00b_417b
	ld a, $05
	rst Bankswitch
	ret

GetScriptByte::
; Get byte from [hScriptBank]:[wScriptPos] and store it in [wScriptByte]
	ld a, [_BANKNUM]
	push af

; Get bank and address
	ldh a, [hScriptBank]
	rst Bankswitch
	ld a, [wScriptPos]
	ld l, a
	ld a, [wScriptPos + 1]
	ld h, a

; Get byte
	ld a, [hli]
	ld [wScriptByte], a
; Store new address
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a

	pop af
	rst Bankswitch
	ret

Func_06f8::
	ld a, [_BANKNUM]
	push af

	ld hl, 3
	ld de, wd9fa
	add hl, bc
REPT 4
	ld a, [hli]
	ld [de], a
	inc de
ENDR

	ld a, 1
	sub [hl]
	ld [hl], a
	ld [wd9fe], a
	ld hl, $0d
	add hl, bc
	ld [hl], $0a
	push bc
	call Func_22f6

	pop bc
	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld c, 4
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .copy

	pop af
	rst Bankswitch
	ret

Func_0733::
	homecall Func_00c_6ed7
	ret

Func_0740::
	homecall Func_00c_4056
	ret

Func_074d::
	homecall Func_00d_4019
	ret

RequestLoadCharacter_PaperScroll::
	ld [wCurrentCharacterByte], a
	call DelayFrame
	ld a, [_BANKNUM]
	push af

; Tiles start at $8a80 with tile ID $a8
	ld a, [wCharacterTilePos]
	add $a8
	ld c, a
	ld [wcbf3], a
; [wCharacterTileDest] = $8xx0
; xx = 'a'
	swap a
	ld b, a
	and $0f
	or $80
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a

; Get character tile source
	ld a, [wdcd1]
	ld e, a
	ld a, [wdcd1 + 1]
	ld d, a
; hl = a * (4*8) (4 tiles, 8 bytes)
	ld a, [wCurrentCharacterByte]
	ld l, a
	ld h, 0
REPT 5
	add hl, hl
ENDR
	add hl, de
	ld a, l
	ld [wCharacterTileSrc], a
	ld a, h
	ld [wCharacterTileSrc + 1], a
	ld a, 4
	ld [wCharacterTileCount], a
	ld a, 1
	ld [wCharacterTileTransferStatus], a
	call DelayFrame

	ld a, [wCharacterTilePos]
	add 4
	ld [wCharacterTilePos], a

	pop af
	rst Bankswitch
	ret

GetTextBGMapPointer::
; Calculate BGMap address from coords depending on SCXY
	push bc
	push de
	ld bc, vBGMap0
	ld e, h
	ld a, l
; a * 8 (1 tile = 8 pixels)
	add a
	add a
	add a
	ld l, a
	ldh a, [hSCY]
	add l
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl

	ld a, e
	add a
	add a
	add a
	ld e, a
	ldh a, [hSCX]
	add e
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	add hl, de
	add hl, bc

; store pointer
	ld a, l
	ld [wTextBGMapPointer], a
	ld a, h
	ld [wTextBGMapPointer + 1], a
	pop de
	pop bc
	ret

Func_07e2::
	push hl
	ld de, wd100
	lb bc, 20, 8
	ld a, b
	ldh [hFF92], a
	ld a, c
	ldh [hFF93], a
	call PlaceAttrmap

; Copy wTilemap textbox into VRAM
	pop hl
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	lb bc, 20, 8
	ld a, b
	ld [hFF92], a
	ld a, c
	ld [hFF93], a
	call PlaceTilemap
	ret

Func_080a::
	homecall Func_005_4000
	ret

Func_0817::
	ld a, [_BANKNUM]
	push af
	ld a, BANK(Func_005_4000)
	rst Bankswitch
	call Func_005_4000
	call ParseCurrentMapEvents
	pop af
	rst Bankswitch
	ret

Func_0827::
	; on getting item
	homecall Func_01e_41e8
	ret

Func_0834::
	homecall Func_01e_4083
	ret

Func_0841::
	homecall Func_01e_4194
	ret

Func_084e::
	homecall Func_01e_4125
	ret

Func_085b::
	homecall Func_01e_4000
	ret

LoadTextFaceGFX::
; Load face pic bank
	ld a, [_BANKNUM]
	push af
	ld a, [wTextFaceID]
	cp 58
	jr c, .other_bank

; [wTextFaceID] >= 58
	ld a, BANK(_LoadTextFaceGFX2)
	rst Bankswitch
	call _LoadTextFaceGFX2
	pop af
	rst Bankswitch
	ret

.other_bank
	ld a, BANK(_LoadTextFaceGFX)
	rst Bankswitch
	call _LoadTextFaceGFX
	pop af
	rst Bankswitch
	ret

LoadTextFaceExtraSprites::
	ld a, [_BANKNUM]
	push af
	ld a, [wTextFaceID]
	cp 58
	jr c, .other_bank

; [wTextFaceID] >= 58
	ld a, BANK(_LoadTextFaceExtraSprites2)
	rst Bankswitch
	call _LoadTextFaceExtraSprites2
	pop af
	rst Bankswitch
	ret

.other_bank
	ld a, BANK(_LoadTextFaceExtraSprites)
	rst Bankswitch
	call _LoadTextFaceExtraSprites
	pop af
	rst Bankswitch
	ret

Func_08a2::
	ld bc, wcd40
.asm_08a5
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr nz, Func_0915
	inc de

Func_08ae::
	ld a, [de]
	ld hl, 4
	add hl, bc
	ld [hl], a
	inc de
	ld a, [de]
	ld [wd0c3], a
	ld hl, hFFAA
	sub [hl]
REPT 4
	add a
ENDR
	add $08
	ld hl, 1
	add hl, bc
	ld [hld], a
	inc de
	ld a, [de]
	ld [wd0c2], a
	push hl
	ld hl, hFFAB
	sub [hl]
REPT 4
	add a
ENDR
	add $10
	pop hl
	ld [hl], a
	inc hl
	inc hl
	ld [hl], 1
	ld hl, 6
	add hl, bc
	ld a, c
	swap a
	and $0f
	add a
	add a
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld hl, 8
	add hl, bc
REPT 5
	inc de
ENDR
	ld a, [de]
	ld [hli], a
	inc hl
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld hl, $12
	add hl, bc
	ld a, [wd0c2]
	ld [hli], a
	ld a, [wd0c3]
	ld [hl], a
	call LoadSpritePalette
	ret

Func_0915::
	ld hl, $20
	add hl, bc
	ld a, l
	cp $e0
	jr z, .asm_0922

	push hl
	pop bc
	jr Func_08a2.asm_08a5

.asm_0922
	ld c, 0
	ret

Func_0925::
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, $cd
	jp Func_08ae

FadeOutPalette::
	ld a, 0
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	jr nz, .exit

; CGB only from here
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld hl, unk_2b38
	ld a, 0
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr FadeOutPalette

.exit
; Warning:: LCD disabled outside of VBlank here
	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

Func_096a::
; Switch intro scene?
.loop
	ld a, 0
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	jr nz, .exit

	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld hl, unk_2b38
	ld a, 0
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr Func_096a

.exit
	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

Func_09a6::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld hl, unk_2ab8
	ld a, 1
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr Func_09a6

.exit
	ret

ClearBGMap0::
; Clear both banks of the BG map from address $9800 - $9c00
; Wastes cycles on DMG because banked VRAM doesn't exist there.
	call DelayFrame
	di
; Load VRAM bank 1
	ld a, 1
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
.clear_bank1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .clear_bank1
; clear byte
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_bank1

	ei
	call DelayFrame
	di
; Load VRAM bank 0
	xor a
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
.clear_bank0
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .clear_bank0
; clear byte
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_bank0

	ei
	ret

Func_0a0a::
	ld a, [_BANKNUM]
	push af

	ldh a, [hMapAttrBank]
	rst Bankswitch
	ld a, [wMapPalettesPointer]
	ld l, a
	ld a, [wMapPalettesPointer + 1]
	ld h, a
	ld de, wcab0
	ld c, $40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1
	pop af
	rst Bankswitch

	ld de, wcab0
	ld hl, $30
	add hl, de
	push hl
	pop de
	ld hl, .unk_0a3e
	ld bc, 8
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy2
	ret

.unk_0a3e
	dw $7fff
	dw $7e57
	dw $792c
	dw $0000

Func_0a46::
	ld hl, unk_2c24
	ld de, wcaf0
	ld c, $40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1

	ld de, unk_0a8b
	ld a, [wd9dd]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, wcaf0
	ld bc, 8
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy2

	ld de, wcaf0
	ld hl, $10
	add hl, de
	push hl
	pop de
	pop hl
	ld bc, 8
	add hl, bc
	ld bc, 8
.copy3
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy3
	ret

unk_0a8b::
	dw .unk_0a9b
	dw .unk_0aab
	dw .unk_0abb
	dw .unk_0acb
	dw .unk_0adb
	dw .unk_0aeb
	dw .unk_0afb
	dw .unk_0b0b

.unk_0a9b
	dw $56b5
	dw $0000
	dw $001d
	dw $67bf
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.unk_0aab
	dw $56b5
	dw $0000
	dw $65ad
	dw $7bde
	dw $56b5
	dw $0000
	dw $0220
	dw $7fff

.unk_0abb
	dw $56b5
	dw $0000
	dw $0220
	dw $7fff
	dw $56b5
	dw $0000
	dw $2978
	dw $73df

.unk_0acb
	dw $56b5
	dw $0000
	dw $01fc
	dw $73df
	dw $56b5
	dw $0000
	dw $001e
	dw $77df

.unk_0adb
	dw $56b5
	dw $0000
	dw $7e80
	dw $77df
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.unk_0aeb
	dw $56b5
	dw $0000
	dw $4419
	dw $77df
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.unk_0afb
	dw $56b5
	dw $0000
	dw $65ad
	dw $7bde
	dw $56b5
	dw $0000
	dw $2978
	dw $73df

.unk_0b0b
	dw $56b5
	dw $0000
	dw $02fe
	dw $77df
	dw $56b5
	dw $0000
	dw $6a1e
	dw $73df

Func_0b1b::
	ld de, wcaf0
	ld hl, $18
	add hl, de
	push hl
	pop de
	ld hl, unk_2c3c
	ld c, 40
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ret

CopyBytes3::
; Copy bc bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Func_0b39::
	homecall Func_024_40fd
	ret

Func_0b46::
	ld a, [_BANKNUM]
	push af

	ld a, [wd9f1]
	rst Bankswitch
	ld a, [wd088]
	ld l, a
	ld a, [wd088 + 1]
	ld h, a
	ld a, [hli]
	ld [wd08a], a
	ld a, l
	ld [wd088], a
	ld a, h
	ld [wd088 + 1], a
	pop af
	rst Bankswitch
	ret
