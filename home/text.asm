_PrintText::
	ldh a, [hTextSource]
	cp TEXTSRC_SCRIPT
	jr z, .script
	cp TEXTSRC_SIGNPOST
	jr z, .signpost
	cp TEXTSRC_ITEM_OBTAINED
	jr z, .item1
	cp TEXTSRC_SCRIPT_MSG
	jr z, .msg
	cp TEXTSRC_ITEM_FOUND
	jr z, .item2
	ret
.script
	ldh a, [hScriptBank]
	jr .select_bank
.signpost
	ldh a, [hTextSourceBank2]
	jr .select_bank
.item1
	ldh a, [hTextSourceBank3]
	jr .select_bank
.msg
	ldh a, [hTextSourceBank4]
	jr .select_bank
.item2
	ld a, [wFoundItemTextBank]
	jr .select_bank
.select_bank
	rst Bankswitch
	push hl

CheckCharacter::
	pop hl
	ld a, [hli]
	push hl
	cp $f0
	jp nc, .SwitchCharacterSet
	cp $e0
	jp nc, CheckCharacter_Commands
	jp CheckCharacter_Continue

.SwitchCharacterSet:
	call GetCharacterSetBase
	jp CheckCharacter

; Determine which bank and address to get the character set from
; $f0 = 40:4000, $f1 = $40:6000, $f2 = $41:4000, etc.
GetCharacterSetBase::
	and $0f
	push af
	srl a
	add BANK(GFX_040_4000)
	ld [hTargetBank], a
	pop af
	bit 0, a
	jr nz, .upper_charset
; lower charset
	ld a, HIGH(GFX_040_4000)
	jr .store
.upper_charset
	ld a, HIGH(GFX_040_6000)
.store
	ld [wCharacterTileSource + 1], a
	xor a
	ld [wCharacterTileSource], a
	ret

CheckCharacter_Continue::
	ld [wCurrentCharacterByte], a
	call RequestLoadCharacter_wTilemap

.check_delay
	ldh a, [hJoypadDown]
	bit A_BUTTON_F, a
	jr z, .delay_text

; short delay
	ld a, 1
	ld [wTextDelayFrames], a

.delay_text
	call DelayFrame
	ld a, [wTextDelayFrames]
	dec a
	ld [wTextDelayFrames], a
	jr nz, .check_delay

	call .Func_1a5f
	ld a, 1
	ld [wCharacterBGMapTransferStatus], a
	call DelayFrame

	ld hl, wCharacterTilemapPos
	inc [hl]
	ld a, 3
	ld [wTextDelayFrames], a
	jp CheckCharacter

.Func_1a5f:
	lb hl, 5, 13
	ld a, [wTextboxPos]
	and a
	jr z, .asm_1a6b

; top half of screen
	lb hl, 5, 3

.asm_1a6b:
	ld a, [wTextLine]
	add a
	add l
	ld l, a
	ld a, [wCharacterTilemapPos]
	add a
	add h
	ld h, a
	call GetTextBGMapPointer
	ld e, l
	ld d, h
	ld hl, wBGMapBufferPointers
	push de
	call .StoreBGMapPointer
; round two
	pop de
	ld a, e
	inc a
	and BG_MAP_WIDTH - 1
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
; fallthrough

.StoreBGMapPointer:
; Store two pointers into wBGMapBufferPointers at a time
; pointer to tile 1 or 3
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
; Next row in BG map
	ld a, 1 * BG_MAP_WIDTH
	add e
	ld e, a
	jr nc, .tile2_4

; $9800 - $9bff
	inc d
	ld a, d
	and 3
	or $98
	ld d, a

.tile2_4
; pointer to tile 2 or 4
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

RequestLoadCharacter_wTilemap::
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

; Move from start of textbox to the start of text entry in wTilemap
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	decoord 5, 3, NULL
	add hl, de

; Initial starting position for tile 1
	ld a, [wCharacterTilemapPos]
	add a ; 2 tiles wide
	ld e, a

; Line to print text on (line 0 or line 1)
	ld a, [wTextLine]
	and a
	jr z, .load_character

; second line
	ld a, 2 * SCREEN_WIDTH
	add e
	ld e, a

.load_character
	ld d, 0
	add hl, de
	decoord 0, 1, NULL
	push hl
; Tile 1
	ld [hl], c
; Tile 2
	inc c
	add hl, de
	ld [hl], c
; Tile 3
	inc c
	pop hl
	inc hl
	ld [hl], c
; Tile 4
	inc c
	add hl, de
	ld [hl], c

; Get character tile source
	ld a, [wCharacterTileSource]
	ld e, a
	ld a, [wCharacterTileSource + 1]
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
	; 7 characters max per line
	cp 8 * 7
	ret c

	xor a
	ld [wCharacterTilePos], a
	ret

CheckCharacter_Commands::
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
	dw Text_Init ; $e0
	dw Text_e1 ; $e1 sign?
	dw Text_End  ; $e2
	dw Text_ItemName ; $e3
	dw Text_e4 ; $e4
	dw PrintTwoOptionMenu     ; $e5
	dw InterpretTwoOptionMenu ; $e6
	dw Text_e7      ; $e7
	dw Text_e8      ; $e8
	dw Text_Init      ; $e9
	dw Text_ItemName2 ; $ea
	dw Text_eb      ; $eb
	dw Text_Paragraph ; $ec
	dw Text_NextLine  ; $ed
	dw Text_Cont      ; $ee
	dw Text_ef      ; $ef

Text_Init::
; Save name and face of person
	pop hl
	ld a, [hli]
	ld [wTextNameID], a
	ld a, [hli]
	ld [wTextFaceID], a

	push hl
	ld a, [_BANKNUM]
	push af
	ld a, BANK(OpenDialogTextbox)
	rst Bankswitch
	call OpenDialogTextbox ; load face picture
	call DelayFrame
	call LoadTextName
	call AnimateTextboxOpen
	call BuildVirtualOAM
	call DelayFrame
	pop af
	rst Bankswitch

	xor a
	ld [wCharacterTilePos], a
	ld a, 1
	ld [wTextDelayFrames], a
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	hlcoord 5, 3, NULL
	add hl, de
	ld a, l
	ld [wd0d1], a
	ld a, h
	ld [wd0d1 + 1], a

	xor a
	ld [wCharacterTilemapPos], a
	ld [wTextLine], a
	ld [wCharacterTilePos], a
	jp CheckCharacter

LoadTextName::
; Clear old name buffer
	ld bc, $10 tiles
	ld hl, $8e00
	xor a
	call ByteFillVRAM
	call DelayFrame

; Load name
	ld a, BANK(NamePointers)
	rst Bankswitch
	xor a
	ld [wCharacterTilePos], a
	ld de, NamePointers
	ld a, [wTextNameID]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

RequestLoadCharacter_Name::
; Used for names on textboxes
	ld a, BANK(NamePointers)
	rst Bankswitch
	ld a, [hli]
	push hl
	cp $f0
	jr nc, .switch_characterset
	cp TX_LINE
	jr z, .end_of_name

	ld [wCurrentCharacterByte], a
	ld a, [wCharacterTilePos]
	add $e0
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
	ld a, [wCharacterTileSource]
	ld e, a
	ld a, [wCharacterTileSource + 1]
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
	pop hl
	jp RequestLoadCharacter_Name

.switch_characterset
	call GetCharacterSetBase
	pop hl
	jp RequestLoadCharacter_Name

.end_of_name
	pop hl
	ld a, BANK(NamePointers)
	rst Bankswitch
	ret

Text_e1::
; Save current bank
	ld a, [_BANKNUM]
	push af
; Switch
	ld a, BANK(OpenPlaceNameTextbox)
	rst Bankswitch
	call OpenPlaceNameTextbox ; load place name
	call DelayFrame
	call AnimateTextboxOpen
; Switch
	ld a, BANK(_BuildVirtualOAMNoExtra)
	rst Bankswitch
	call _BuildVirtualOAMNoExtra
; Restore old bank
	pop af
	rst Bankswitch

	xor a
	ld [wCharacterTilePos], a
	ld a, 1
	ld [wTextDelayFrames], a

	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	hlcoord 1, 3, NULL
	add hl, de
	ld a, l
	ld [wd0d1], a
	ld a, h
	ld [wd0d1 + 1], a

	xor a
	ld [wCharacterTilemapPos], a
	ld [wTextLine], a
	ld [wCharacterTilePos], a
	jp CheckCharacter

Text_End::
	call WaitTextboxInput

Text_EndCont::
	ld a, [_BANKNUM]
	push af
	ld a, BANK(CloseTextbox)
	rst Bankswitch
	call ClearExtraSprites
	call BuildVirtualOAM
	call CloseTextbox
	call DelayFrame
	pop af
	rst Bankswitch

	xor a
	ldh [hTextSource], a
	pop hl
	ret

ClearExtraSprites::
	ld hl, wExtraSprites
	ld c, $20
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret

Text_ItemName::
	call ParseMapEventsAtPlayer
	pop hl
; bank 1e set by SetMapLayoutPatchForItem
; got item name
	call LoadItemNameByMapType
	ld a, [wTextStart]
	ld l, a
	ld a, [wTextStart + 1]
	ld h, a
	push hl
	jp CheckCharacter

Text_e4::
	pop hl
	ld a, [wSavedTextPos]
	ld l, a
	ld a, [wSavedTextPos + 1]
	ld h, a
	push hl
	jp CheckCharacter

PrintTwoOptionMenu::
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [wTextStart], a
	ld a, h
	ld [wTextStart + 1], a
	push hl
	jp CheckCharacter

INCLUDE "text/menu_options.asm"

InterpretTwoOptionMenu::
	call .Main
	jp Text_EndCont

.Main:
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	call InitTextboxCursor
	ld hl, wcde0
	inc hl
	ld [hl], $40
	xor a
	ldh [hVBlank], a
	ldh [hJoypadPressed], a

.input_loop:
; Flash gameboy icon
	call AnimateTextboxCursor
	call UpdateTextboxCursorOAM

; Check left
	call DelayFrame
	ldh a, [hJoypadPressed]
	bit D_LEFT_F, a
	jr z, .check_right

; Pressed left
	ld hl, wcde0
	inc hl
	ld [hl], $40
	jr .check_A

.check_right
	ldh a, [hJoypadPressed]
	bit D_RIGHT_F, a
	jr z, .check_A

; Pressed right
	ld hl, wcde0
	inc hl
	ld [hl], $70
	jr .check_A ; inefficient

.check_A
	ldh a, [hJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .loop

; Pressed A
	ld hl, wcde0
	inc hl
	ld a, [hl]
	cp $40
	jr z, .choose_option

	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	jr .choose_option

; ???
.loop
	jr .input_loop

.choose_option
	call ResetTextboxCursorTimer
	call UpdateTextboxCursorOAM
	ret

Text_e7::
	pop hl
	ld a, l
	ld [wSavedTextPos], a
	ld a, h
	ld [wSavedTextPos + 1], a
	ld hl, Std_BuySellCancel_String
	ld a, l
	ld [wTextStart], a
	ld a, h
	ld [wTextStart + 1], a
	push hl
	jp CheckCharacter

INCLUDE "text/buy_sell_cancel.asm"

Text_e8::
; Buy sell cancel menu
	call _Text_e8
	jp Text_EndCont

_Text_e8::
; Buy sell cancel menu for real

; Init position
	ld a, [wEventFlags + 4]
	res 0, a
	res 1, a
	ld [wEventFlags + 4], a
	call InitTextboxCursor
	ld hl, wcde0
	inc hl
	ld [hl], $30
	xor a
	ldh [hVBlank], a
	ldh [hJoypadPressed], a

.CheckJoypad:
	call AnimateTextboxCursor
	call UpdateTextboxCursorOAM
	call DelayFrame
; check left
	ldh a, [hJoypadPressed]
	bit D_LEFT_F, a
	jr z, .check_right

; skip if already on option 0
	ld a, [wEventFlags + 4]
	and %11
	jr z, .check_a
; check if on option 1 or 2
	bit 1, a
	jr z, .left_option1

; on option 2
	ld a, [wEventFlags + 4] ; waste
	set 0, a
	res 1, a
	ld [wEventFlags + 4], a
	jr .asm_1dd4

.left_option1
	ld a, [wEventFlags + 4] ; waste
	res 0, a
	ld [wEventFlags + 4], a
	jr .asm_1dd4

.check_right
	ldh a, [hJoypadPressed]
	bit D_RIGHT_F, a
	jr z, .check_a

; skip if already on option 2
	ld a, [wEventFlags + 4]
	bit 1, a
	jr nz, .check_a
; check if on option 0 or 1
	bit 0, a
	jr nz, .right_option1

; option 0
	set 0, a
	ld [wEventFlags + 4], a
	jr .asm_1dd4

.right_option1
	set 1, a
	res 0, a
	ld [wEventFlags + 4], a

.asm_1dd4:
	ld a, [wEventFlags + 4]
	and %11
; a = a * $20
REPT 5
	add a
ENDR
	add $30
	ld hl, wcde0
	inc hl
	ld [hl], a

.check_a
	ldh a, [hJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .loop

; pressed a
	ld hl, wcde0
	inc hl
	ld a, [hl]
	cp $40
	jr z, .exit

	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	jr .exit

.loop
	jr .CheckJoypad ; waste

.exit
	call ResetTextboxCursorTimer
	call UpdateTextboxCursorOAM
	ret

Text_e9_Stub::
	jp CheckCharacter

Text_ItemName2::
	pop hl
	call LoadShopItemName
	ld a, [wTextStart]
	ld l, a
	ld a, [wTextStart + 1]
	ld h, a
	push hl
	jp CheckCharacter

Text_eb::
	pop hl
	call LoadItemNameByIndex
	ld a, [wTextStart]
	ld l, a
	ld a, [wTextStart + 1]
	ld h, a
	push hl
	jp CheckCharacter

Text_Paragraph::
	call WaitTextboxInput
	call ClearTextboxTilemap
	call UpdateTextBGMap
	xor a
	ld [wCharacterTilemapPos], a
	ld [wTextLine], a
	ld [wCharacterTilePos], a
	jp CheckCharacter

ClearTextboxTilemap::
; Clear tilemap textbox
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	lb bc, 4, 14
	ld de, 6
.clear
	ld a, $a0
	ld [hli], a
	dec c
	jr nz, .clear
	add hl, de
	ld c, 14
	dec b
	jr nz, .clear
	ret

Text_NextLine::
	xor a
	ld [wCharacterTilemapPos], a

	ld a, [wTextLine]
	and a
	jp nz, Text_ScrollLine

	ld a, 1
	ld [wTextLine], a
	jp CheckCharacter

Text_ScrollLine::
	xor a
	ld [wCharacterTilemapPos], a
	call ScrollTextboxUp
	call UpdateTextBGMap
	jp CheckCharacter

UpdateTextBGMap::
	ld hl, $050d
	ld a, [wTextboxPos]
	and a
	jr z, .asm_1e87

	ld hl, $0503
.asm_1e87
	call GetTextBGMapPointer
	ld e, l
	ld d, h
	ld hl, wBGMapBufferPointers
	ld bc, $020e
	call StoreBGMapPointers
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	call CopyTextRowToBuffer
	ld a, $1c
	ld [hFFA5], a
	ld a, $01
	ld [wcbf6], a
	call DelayFrame
	ld hl, $050f
	ld a, [wTextboxPos]
	and a
	jr z, .asm_1eb9

	ld hl, $0505
.asm_1eb9
	call GetTextBGMapPointer
	ld e, l
	ld d, h
	ld hl, wBGMapBufferPointers
	ld bc, $020e
	call StoreBGMapPointers
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	ld de, $0028
	add hl, de
	call CopyTextRowToBuffer
	ld a, $1c
	ld [hFFA5], a
	ld a, $01
	ld [wcbf6], a
	call DelayFrame
	ret

CopyTextRowToBuffer::
	ld de, wd128
	lb bc, 2, 14
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ld a, l
	add 6
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld c, 14
	dec b
	jr nz, .copy
	ret

StoreBGMapPointers::
	push bc
	push de
.asm_1f00:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	and $1f
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
	dec c
	jr nz, .asm_1f00

	pop de
	ld a, $20
	add e
	ld e, a
	jr nc, .asm_1f1f

	inc d
	ld a, d
	and $03
	or $98
	ld d, a
.asm_1f1f
	pop bc
	dec b
	jr nz, StoreBGMapPointers
	ret

ScrollTextboxUp::
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	push hl
	ld de, $28
	add hl, de
	pop de
	push hl
	lb bc, 2, 14
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ld a, e
	add 6
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, l
	add 6
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld c, 14
	dec b
	jr nz, .copy

	pop de
	lb bc, 2, 14
.clear
	ld a, $a0
	ld [de], a
	inc de
	dec c
	jr nz, .clear
	ld a, e
	add 6
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld c, 14
	dec b
	jr nz, .clear
	ret

Text_Cont::
	call WaitTextboxInput
	jp Text_NextLine

InitTextboxCursor::
	ld hl, wcde0
	ld [hl], $3f
	ld a, [hBattleJumptableIndex]
	and a
	jr nz, .asm_1f81

	ld a, [wTextboxPos]
	and a
	jr nz, .asm_1f83

.asm_1f81
	ld [hl], $8f

.asm_1f83
	inc hl
	ld [hl], $98
	inc hl
	ld [hl], $03
	ret

UpdateTextboxCursorOAM::
	homecall _UpdateTextboxCursorOAM
	ret

AnimateTextboxCursor::
; Timer between flash
	ld bc, wcde0
	ld hl, 3
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp 10
	ret c

	ld [hl], 0
	dec hl
	ld a, [hl]
	cp 3
	jr z, .asm_1fae

	ld [hl], 3
	ret

.asm_1fae
	ld [hl], 4
	ret

ResetTextboxCursorTimer::
; Inefficient
	ld hl, wcde0
	inc hl
	inc hl
	ld [hl], 0
	ret

; Flashing gameboy icon on textbox stuff
WaitTextboxInput::
	call InitTextboxCursor
	xor a
	ldh [hVBlank], a
	ldh [hJoypadPressed], a
	call UpdateTextboxCursorOAM
.joypad_loop
	ldh a, [hJoypadDown]
	and D_PAD | BUTTONS
	jr nz, .pressed

	ldh a, [hVBlank]
	and a
	jr z, .joypad_loop

	xor a
	ldh [hVBlank], a
	call AnimateTextboxCursor
	call UpdateTextboxCursorOAM
	jr .joypad_loop

.pressed
	ld a, SFX_17
	call PlaySound
	xor a
	ldh [hVBlank], a
	call ResetTextboxCursorTimer
	call UpdateTextboxCursorOAM
	ret

Text_ef::
	xor a
	ldh [hTextSource], a
	pop hl
	ret
