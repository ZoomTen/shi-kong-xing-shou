PrintMenuText::
IF DEF(ENGLISH)
; Save/restore the ROM bank around the whole menu string. A tfarjump inside it
; switches banks; without this, control returns to the caller (e.g. the bank-25
; menu script processor) with the wrong bank loaded -> corrupted command stream.
	ld a, [_BANKNUM]
	push af
	call .run
	pop af
	rst Bankswitch
	ret
.run
ENDC
	call DelayFrame
	push hl

Menu_CheckCharacter::
; Text routine used for menus, battles and other things
	pop hl
	ld a, [hli]
	push hl
IF DEF(ENGLISH)
	cp TX_FAR
	jp z, MenuText_FarJump
ENDC
	cp $f0
	jp nc, Menu_GetCharacterSetBase
	cp $e0
	jp nc, Menu_CheckCharacter_Commands
	jp Menu_CheckCharacter_Continue
	ret ; ?

MenuText_Done::
	ld a, [wd9d6]
	and a
	jr z, .done

	xor a
	ld [wd9d6], a
	pop hl
	ld a, [wSavedTextPos]
	ld l, a
	ld a, [wSavedTextPos + 1]
	ld h, a
	ldh a, [hFFD4]
	rst Bankswitch
	push hl
	jp Menu_CheckCharacter

.done
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
	ld a, [wd9d1]
	ld h, a
	ld de, wd9ce
	ld bc, $0204
	ld a, $77
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call PrintNumber
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
IF DEF(ENGLISH)
; English menu text uses `para` (from make_english's \n boxes) purely as a line
; break, so skip the wait-for-input prompt and the box clear -- the lines just
; flow. Chinese menus keep the original wait+clear behaviour.
	ldh a, [hEnglishMode]
	and a
	jr nz, .english
ENDC
	call WaitTextboxInput
	ld bc, $480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame
IF DEF(ENGLISH)
.english
; para is a line break here: round the tile cursor up to the next visual row
; ($24 tile ids = one 18-col row) rather than back to 0, which overwrites line 1.
	ld a, [wCharacterTilePos]
	ld b, a
ENDC
	xor a
IF DEF(ENGLISH)
.nextRow
	cp b
	jr nc, .gotRow
	add $24
	jr .nextRow
.gotRow
ENDC
	ld [wCharacterTilePos], a
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e6::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemyTurn
	ld a, [wd9e2]
	jr .gotValue

.enemyTurn
	ld a, [wd9e3]

.gotValue
	ld [wd9d8], a
	farcall Func_026_4000
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e5::
	ld a, [wd9e9]
	ld d, a
	farcall PrintEquipmentName
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e8::
	ld a, [wCurItemID]
	ld d, a
	farcall PrintItemName
	pop hl
	push hl
	jp Menu_CheckCharacter

MenuText_e9::
	ld hl, wMenuTextBuffer
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
	ld [wSavedTextPos], a
	ld a, h
	ld [wSavedTextPos + 1], a
	ld a, [_BANKNUM]
	ld [hFFD4], a
	ld a, BANK(MonNamePointers)
	rst Bankswitch
	ld a, 1
	ld [wd9d6], a
	ld a, [wd9d4]
	ld l, a
	ld a, [wd9d5]
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
	jr nc, .useBase80
	or $90
	jr .storeTileDestHigh

.useBase80
	or $80

.storeTileDestHigh
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a
IF DEF(ENGLISH)
	ldh a, [hEnglishMode]
	and a
	jr nz, .english
ENDC
	ld a, [wCharacterTileSource]
	ld e, a
	ld a, [wCharacterTileSource + 1]
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
IF DEF(ENGLISH)

.english
; 1-tile English glyph from Charset_English (char*8), one tile, placed on the
; top tiles of the 2x2 cells (advance 2 -> top-left, then top-right); the cells'
; lower tiles stay whatever the menu drew. Kept in the menu interpreter so the
; bank menu functions stay byte-identical to `progress`.
	ld a, BANK(Charset_English)
	ld [hTargetBank], a
	ld a, [wCurrentCharacterByte]
	ld l, a
	ld h, 0
	ld de, Charset_English
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, l
	ld [wCharacterTileSrc], a
	ld a, h
	ld [wCharacterTileSrc + 1], a
	ld a, 1
	ld [wCharacterTileCount], a
	ld a, 1
	ld [wCharacterTileTransferStatus], a
	call DelayFrame
; No per-char lower-tile clear: the bank caller clears the whole region up front
; (the desc draw clears $8800; the name draw clears $8d00), so the cells the
; English writes into are already blank.
	ld a, [wMenuTextEndX]
	ld c, a
	ld a, [wCharacterTilePos]
	add 2
	ld [wCharacterTilePos], a
	cp c
	jp c, Menu_CheckCharacter
	xor a
	ld [wCharacterTilePos], a
	jp Menu_CheckCharacter
ENDC
