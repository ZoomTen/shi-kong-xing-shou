PrintMenuText::
	call DelayFrame
	push hl

Menu_CheckCharacter::
; Text routine used for menus, battles and other things
	pop hl
	ld a, [hli]
	push hl
	cp $f0
	jp nc, Menu_GetCharacterSetBase
	cp $e0
	jp nc, Menu_CheckCharacter_Commands
	jp Menu_CheckCharacter_Continue
	ret ; ?

MenuText_Done::
	ld a, [wd9d6]
	and a
	jr z, .asm_0b94

	xor a
	ld [wd9d6], a
	pop hl
	ld a, [wdcd3]
	ld l, a
	ld a, [wdcd3 + 1]
	ld h, a
	ldh a, [hFFD4]
	rst Bankswitch
	push hl
	jp Menu_CheckCharacter

.asm_0b94
	pop hl
	ret

Menu_CheckCharacter_Commands::
	ld de, .commands
	sub $e0
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.commands
	dw MenuText_Skip ; $e0
	dw MenuText_e1     ; $e1
	dw MenuText_e2     ; $e2
	dw MenuText_Skip ; $e3
	dw MenuText_Done ; $e4
	dw MenuText_e5     ; $e5
	dw MenuText_e6     ; $e6
	dw MenuText_e7     ; $e7
	dw MenuText_e8     ; $e8
	dw MenuText_e9     ; $e9
	dw MenuText_Skip ; $ea
	dw MenuText_Skip ; $eb
	dw MenuText_ec     ; $ec
	dw MenuText_Done ; $ed
	dw MenuText_Skip ; $ee
	dw MenuText_Skip ; $ef

MenuText_Skip::
	jp Menu_CheckCharacter

MenuText_e1::
	ld a, [wd9d0]
	ld l, a
	ld a, [wd9d0 + 1]
	ld h, a
	ld de, wd9ce
	ld bc, $0204
	ld a, $77
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call Func_113f
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e2::
	pop hl
	call WaitTextboxInput
	ret

MenuText_ClearBox::
	ld bc, $480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame

MenuText_ec::
	call WaitTextboxInput
	ld bc, $480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame
	xor a
	ld [wCharacterTilePos], a
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e6::
	ld a, [wd986]
	and a
	jr nz, .asm_0c22
	ld a, [wd9e2]
	jr .asm_0c25

.asm_0c22
	ld a, [wd9e3]

.asm_0c25
	ld [wd9d8], a
	farcall Func_026_4000
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e5::
	ld a, [wd9e9]
	ld d, a
	farcall Func_01e_4266
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e8::
	ld a, [wd9f3]
	ld d, a
	farcall Func_01e_4275
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e9::
	ld hl, wd86a
	ld a, $b6
	ld [wMenuTextX], a
	ld a, $c2
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e7::
	pop hl
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld a, [_BANKNUM]
	ld [hFFD4], a
	ld a, $26
	rst Bankswitch
	ld a, 1
	ld [wd9d6], a
	ld a, [wd9d4]
	ld l, a
	ld a, [wd9d4 + 1]
	ld h, a
	push hl
	jp Menu_CheckCharacter

Menu_GetCharacterSetBase::
	call GetCharacterSetBase
	jp Menu_CheckCharacter

Menu_CheckCharacter_Continue::
	ld [wCurrentCharacterByte], a
	ld a, [wCharacterTilePos]
	ld c, a
	ld a, [wMenuTextX]
	add c
	ld c, a
	ld [wcbf3], a
	swap a
	ld b, a
	and $0f
	cp $08
	jr nc, .asm_0caf
	or $90
	jr .asm_0cb1

.asm_0caf
	or $80

.asm_0cb1
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a
	ld a, [wdcd1]
	ld e, a
	ld a, [wdcd1 + 1]
	ld d, a
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
	ld a, [wMenuTextEndX]
	ld c, a
	ld a, [wCharacterTilePos]
	add 4
	ld [wCharacterTilePos], a
	cp c
	jp c, Menu_CheckCharacter
	xor a
	ld [wCharacterTilePos], a
	jp Menu_CheckCharacter
