GetBoxMonPtr::
	ld bc, wMonBox
	ld a, [wMonBoxIndex]
	ld l, a
	ld a, [wSelectedOption]
	add l
	and a
	ret z

.advancePtr
	ld hl, $13
	add hl, bc
	push hl
	pop bc
	dec a
	jr nz, .advancePtr
	ret

SRAMTest_Fast::
; Check for pattern at start of SRAM
; 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f
; 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

; Enable SRAM
	ld a, SRAM_ENABLE
	ld [rRAMG], a

; Select bank
	xor a ; bank 0
	ld [rRAMB], a

; Check for increasing value pattern
	ld hl, _SRAM
	ld c, 0
.check_pattern1
	ld a, [hli]
	cp c
	jr nz, .no_pattern
	inc c
	ld a, c
	cp $10 + 1
	jr c, .check_pattern1

	ld c, $0f
.check_pattern2
	ld a, [hli]
	and a
	jr nz, .no_pattern
	dec c
	jr nz, .check_pattern2

; pattern found
	xor a
	ld [rRAMG], a
	xor a
	ret

.no_pattern
	xor a
	ld [rRAMG], a
	ld a, 1
	ret

LoadMap2::
	call LoadMap
	ret

GetFirstEmptyPartySlot::
	push hl
	push de
	ld hl, wPartyMons
.nextSlot
	ld a, [hl]
	and a
	jr z, .foundEmpty

	ld de, $16
	add hl, de
	ld a, l
	cp $80
	jr c, .nextSlot

	ld a, 1
	pop de
	pop hl
	ret

.foundEmpty
	xor a
	push hl
	pop bc
	pop de
	pop hl
	ret

CopyBytesVRAM_BankD0F1::
	ld a, [_BANKNUM]
	push af
	ld a, [wd0f1]
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

CopyBytesVRAM_Bank0C:: ; option and battle stuff?
	ld a, [_BANKNUM]
	push af
	ld a, BANK("bank0c Misc GFX")
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

CopyBGMapAttrs::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ld a, 1
	ldh [rVBK], a
	jp CopyBGMapData

CopyBGMapTiles::
	ld a, 0
	ldh [rVBK], a

CopyBGMapData::
	push hl

.copy
	ld a, [de]
	push bc
	ld c, a
	di

.waitLCD1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD1

; write byte
	ld a, c
	ld [hl], a

.waitLCD2
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD2

	ei
; Verify that byte was written
	ld a, [hl]
	cp c
	jr nz, .copy

; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld b, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or b
	ld l, a
	inc de

	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc
	ld a, h
	cp HIGH($9f00)
	jr c, .next_row
	ld h, HIGH(vBGMap1)

.next_row
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, CopyBGMapData

	ld a, 0
	ldh [rVBK], a
	ret

AdvanceBattleScriptMode::
	ld a, [_BANKNUM]
	push af
	ld a, BANK(MoveAnimScript_Pointers)
	rst Bankswitch
	ld a, [wBattleScriptPos]
	ld l, a
	ld a, [wBattleScriptPos + 1]
	ld h, a
	ld a, [hli]
	ld [wBattleState], a
	ld a, l
	ld [wBattleScriptPos], a
	ld a, h
	ld [wBattleScriptPos + 1], a
	pop af
	rst Bankswitch
	ret

ReloadMapObjects::
	ld a, [_BANKNUM]
	push af
	ldh a, [hScriptBank]
	rst Bankswitch
	ld a, [wObjectEventPointer]
	ld l, a
	ld a, [wObjectEventPointer + 1]
	ld h, a
	ld de, wda00
.nextObject
	ld a, [hl]
	cp $88
	jr z, .done

	ld a, $ff
	ld [de], a
	inc de
	ld c, 11
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	jr .nextObject

.done
	ld [de], a
	pop af
	rst Bankswitch
	ret

PlayMapMusic::
	ld de, .map_music
	ldh a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ldh a, [hCurSound]
	cp [hl]
	ret z

	ld a, [hl]
	and a
	ret z

	call PlaySound
	ret

.map_music
	dw .group_0
	dw .group_1
	dw .group_2
	dw .group_3
	dw .group_4
	dw .group_5
	dw .group_6
	dw .group_7

.group_0
	db SFX_00, BGM_TOWN1, BGM_ACADEMY, BGM_ACADEMY, BGM_TOWN1, BGM_TOWN1, BGM_TOWN1, BGM_TOWN1
	db BGM_TOWN1, BGM_ACADEMY, BGM_ACADEMY, BGM_ACADEMY, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3
	db BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_SHOP, BGM_HEALING_CENTER, BGM_TOWN2, BGM_TOWN2, BGM_TOWN2
	db BGM_TOWN2, BGM_TOWN2, BGM_TOWN2, BGM_HEALING_CENTER, BGM_JUNKYARD, BGM_TITLE, BGM_TITLE, BGM_TITLE
	db BGM_TITLE, BGM_TITLE, BGM_METEOR, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE
	db BGM_TROUBLE, BGM_BATTLE1, BGM_ACADEMY, BGM_UNSETTLING_PLACE, BGM_STARGAZING, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4
	db BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_SHOP, BGM_HEALING_CENTER

.group_1
	db SFX_00, BGM_TROUBLE, BGM_ACADEMY, BGM_ACADEMY, BGM_TROUBLE, BGM_TROUBLE, BGM_TROUBLE, BGM_TROUBLE
	db BGM_TOWN1, BGM_ACADEMY, BGM_ACADEMY, BGM_ACADEMY, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3
	db BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_SHOP, BGM_HEALING_CENTER, BGM_TOWN2, BGM_TOWN2, BGM_TOWN2
	db BGM_TOWN2, BGM_TOWN2, BGM_TOWN2, BGM_HEALING_CENTER, BGM_JUNKYARD, BGM_TITLE, BGM_TITLE, BGM_TITLE
	db BGM_TITLE, BGM_TITLE, BGM_METEOR, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE
	db BGM_ROUTES1, BGM_BATTLE1, BGM_ACADEMY, BGM_UNSETTLING_PLACE, BGM_STARGAZING, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4
	db BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_SHOP, BGM_HEALING_CENTER

.group_2
	db SFX_00, BGM_TOWN3, BGM_TOWN1, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_BATTLE3, BGM_BATTLE3
	db BGM_TOWN4, BGM_METEOR, BGM_METEOR, BGM_METEOR, BGM_METEOR, BGM_METEOR, BGM_TOWN3, BGM_TOWN3
	db BGM_TOWN3, BGM_TOWN3, BGM_TOWN1, BGM_TOWN1, BGM_TOWN1, BGM_TOWN1, BGM_TOWN1, BGM_BATTLE3
	db BGM_INTRO, BGM_HEALING_CENTER, BGM_SHOP, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3
	db BGM_TOWN3, BGM_HEALING_CENTER, BGM_SHOP, BGM_TROUBLE

.group_3
	db SFX_00, BGM_FOREST, BGM_FOREST, BGM_FOREST, BGM_BATTLE2, BGM_BATTLE2, BGM_BATTLE2, BGM_TOWN2
	db BGM_TOWN2, BGM_TOWN1, BGM_TOWN3, BGM_RACING, BGM_RACING, BGM_RACING, BGM_RACING, BGM_HEALING_CENTER
	db BGM_AIRPORT, BGM_AIRPORT, BGM_TROUBLE, BGM_TROUBLE, BGM_TROUBLE, BGM_TOWN4, BGM_BATTLE3, BGM_TOWN2
	db BGM_TOWN2, BGM_TOWN2, BGM_TOWN2, BGM_TOWN2, BGM_TOWN2, BGM_HEALING_CENTER, BGM_SHOP, BGM_FOREST
	db BGM_BATTLE2, BGM_TROUBLE, BGM_TROUBLE, BGM_TROUBLE

.group_4
	db SFX_00, BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_TROUBLE, BGM_TROUBLE
	db BGM_TROUBLE, BGM_TROUBLE, BGM_TROUBLE, BGM_JUNKYARD, BGM_TOWN1, BGM_TOWN1, BGM_ROUTES1, BGM_STARGAZING
	db BGM_ROUTES1, BGM_TOWN1, BGM_TOWN1, BGM_TOWN1, BGM_TOWN3, BGM_TOWN4, BGM_TROUBLE, BGM_SHIP
	db BGM_SHIP, BGM_SHIP, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_ROUTES1, BGM_TOWN3
	db BGM_ROUTES1, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_JUNKYARD, BGM_TOWN3, BGM_TOWN3
	db BGM_INTRO, BGM_INTRO, BGM_BATTLE4, BGM_TOWN2, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD
	db BGM_JUNKYARD, BGM_HEALING_CENTER, BGM_SHOP, BGM_JUNKYARD, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3
	db BGM_SHOP, BGM_HEALING_CENTER, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD
	db BGM_HEALING_CENTER, BGM_SHOP, BGM_ACADEMY, BGM_ACADEMY, BGM_TOWN1, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD
	db BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_HEALING_CENTER, BGM_SHOP, BGM_JUNKYARD, BGM_BATTLE1, BGM_ROUTES1
	db BGM_SHIP, BGM_SHIP, BGM_SHIP, BGM_METEOR, BGM_METEOR, BGM_INTRO, BGM_TOWN3, BGM_TOWN3
	db BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3, BGM_HEALING_CENTER, BGM_SHOP, BGM_BATTLE4, BGM_TOWN2
	db BGM_BATTLE1, BGM_BATTLE1, BGM_BATTLE1, BGM_BATTLE1, BGM_AIRPORT, BGM_AIRPORT

.group_5
	db SFX_00, BGM_BATTLE1, BGM_BATTLE1, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_SHIP
	db BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_STARGAZING, BGM_SHIP
	db BGM_SHIP, BGM_SHIP, BGM_SHIP, BGM_SHIP, BGM_SHIP, BGM_SHIP, BGM_ROUTES1, BGM_ROUTES1
	db BGM_ROUTES1, BGM_UNSETTLING_PLACE, BGM_UNSETTLING_PLACE, BGM_SHIP, BGM_TROUBLE, BGM_SHIP, BGM_SHIP, BGM_SHIP
	db BGM_SHIP, BGM_HEALING_CENTER, BGM_SHOP, BGM_ACADEMY, BGM_ACADEMY, BGM_ACADEMY, BGM_ACADEMY, BGM_SHIP

.group_6
	db SFX_00, BGM_RACING, BGM_RACING, BGM_BATTLE3, BGM_BATTLE3, BGM_BATTLE3, BGM_BATTLE3, BGM_BATTLE3
	db BGM_TROUBLE, BGM_STARGAZING, BGM_TOWN4, BGM_BATTLE1, BGM_JUNKYARD, BGM_ROUTES1, BGM_TROUBLE, BGM_TOWN4
	db BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4, BGM_TOWN4
	db BGM_AIRPORT, BGM_AIRPORT, BGM_AIRPORT, BGM_AIRPORT, BGM_HEALING_CENTER, BGM_SHOP, BGM_ROUTES1, BGM_ROUTES1
	db BGM_BATTLE4, BGM_BATTLE2, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD, BGM_JUNKYARD
	db BGM_SHOP, BGM_HEALING_CENTER, BGM_BATTLE2, BGM_BATTLE3, BGM_METEOR

.group_7
	db SFX_00, BGM_BATTLE2, BGM_TOWN1, BGM_JUNKYARD, BGM_SHIP, BGM_INTRO, BGM_ROUTES1, BGM_TOWN2
	db BGM_TOWN1, BGM_TOWN4, BGM_TOWN3, BGM_TOWN3, BGM_TOWN3

FillBoxVRAM::
	push hl

.copy:
	ld a, e
	push bc
	ld c, a
	di

.waitLCD1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD1

; write byte
	ld a, c
	ld [hl], a

.waitLCD2
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD2

	ei
; Verify that byte was written
	ld a, [hl]
	cp c
	jr nz, .copy

; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld b, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or b
	ld l, a

	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc
; Still in BG map 0? ($9800 - $9c00)
	ld a, h
	cp HIGH(vBGMap1)
	jr c, .next_row
; If not, fix it
	ld h, HIGH(vBGMap0)

.next_row
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, FillBoxVRAM

	ld a, 0
	ldh [rVBK], a
	ret

