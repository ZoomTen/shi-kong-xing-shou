LoadMapAndScriptPredef::
	ld de, .Predefs
	ld a, [hMapPredef]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Predefs
	dw MapPredef_BallotsHouseIntro ; $00
	dw Debug_NewGameFull ; $01
	dw Debug_NewGameFull ; $02
	dw Debug_NewGameMinimal ; $03
	dw MapPredef_AfterMeteorShower ; $04
	dw MapPredef_05 ; $05
	dw Debug_NewGameFull ; $06
	dw Debug_NewGameFull ; $07
	dw Debug_NewGameFull ; $08
	dw Debug_NewGameFull ; $09
	dw Debug_NewGameFull ; $0a
	dw Debug_NewGameFull ; $0b
	dw Debug_NewGameFull ; $0c
	dw Debug_NewGameFull ; $0d
	dw Debug_NewGameFull ; $0e
	dw Debug_NewGameFull ; $0f
	dw Debug_NewGameFull ; $10
	dw Debug_NewGameFull ; $11
	dw Debug_NewGameFull ; $12
	dw Debug_NewGameFull ; $13
	dw Debug_NewGameFull ; $14

MapPredef_BallotsHouseIntro::
	ld hl, wdd00
	ld [hl], $01
	ld a, MAP_BALLOTS_HOUSE_1
	ldh [hMapNumber], a
	ld a, 1
	ldh [hWarpNumber], a
	ld a, 1
	ldh [hFFD6], a

	ld a, BANK(BallotsHouse_StartScript)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(BallotsHouse_StartScript)
	inc hl
	ld [hl], HIGH(BallotsHouse_StartScript)
	call InitStartingInventory
	ret

InitStartingInventory::
	ld a, [wdcb0]
	and a
	jr z, StartingInventory_Combo0

	cp 1
	jp z, StartingInventory_Combo1
	cp 2
	jp z, StartingInventory_Combo2
	cp 3
	jp z, StartingInventory_Combo3
	cp 4
	jp z, StartingInventory_Combo4
	cp 5
	jp z, StartingInventory_Combo5

StartingInventory_Combo0::
; 1000 money
	ld a, $03
	ld [wMoney + 1], a
	ld a, $e8
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	ret

StartingInventory_Combo1::
; 99999 money
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $9f
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	ret

StartingInventory_Combo2::
; 99999 money
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $9f
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $27
	inc hl
	ld [hl], 99
	ret

StartingInventory_Combo3::
; @bug: SRAM is not enabled
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp StartingInventory_Combo0

StartingInventory_Combo4::
; 99999 money
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $9f
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $27
	inc hl
	ld [hl], 99
	ret

StartingInventory_Combo5::
; @bug: SRAM is not enabled
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp StartingInventory_Combo0

MapPredef_AfterMeteorShower::
	ld a, GROUP_BALLOTS_HOUSE_2
	ldh [hMapGroup], a
	ld a, MAP_BALLOTS_HOUSE_2
	ldh [hMapNumber], a
	ld a, 1
	ldh [hWarpNumber], a
	ld a, 1
	ldh [hFFD6], a

	ld a, BANK(Script_00e_4005)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(Script_00e_4005)
	inc hl
	ld [hl], HIGH(Script_00e_4005)
	ret

MapPredef_05::
	ld a, 4
	ldh [hMapGroup], a
	ld a, $43
	ldh [hMapNumber], a
	ld a, 1
	ldh [hWarpNumber], a
	ld a, 1
	ldh [hFFD6], a

	ld a, BANK(Script_055_53ef)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(Script_055_53ef)
	inc hl
	ld [hl], HIGH(Script_055_53ef)
	ret

Debug_NewGameFull::
; Debug code
	ld bc, 7 * $16
	call Debug_GivePartyMon
	ld bc, 7
	call Debug_InitMonFlags

; wow...
	ld a, $ff
	ld [wEventFlags], a
	ld a, $ff
	ld [wEventFlags + 1], a
	ld a, $ff
	ld [wEventFlags + 2], a
	ld a, $f7
	ld [wEventFlags + 3], a
	ld a, $ff
	ld [wEventFlags + 4], a
	ld a, $ff
	ld [wEventFlags + 5], a
	ld a, $77
	ld [wEventFlags + 6], a
	ld a, $ff
	ld [wEventFlags + 7], a
	ld a, $ff
	ld [wEventFlags + 8], a
	ld a, $1f
	ld [wEventFlags + 9], a
	ld a, $fc
	ld [wEventFlags + $a], a
	ld a, $ff
	ld [wEventFlags + $b], a
	ld a, $fe
	ld [wEventFlags + $c], a
	ld a, $ff
	ld [wEventFlags + $d], a
	ld a, $3f
	ld [wEventFlags + $e], a
	ld a, $ff
	ld [wEventFlags + $f], a
	ld a, $ff
	ld [wEventFlags + $10], a
	ld a, $ff
	ld [wEventFlags + $11], a
	ld a, $ff
	ld [wEventFlags + $12], a
	ld a, $ff
	ld [wEventFlags + $13], a
	ld a, $f7
	ld [wEventFlags + $14], a
	ld a, $03
	ld [wEventFlags + $15], a
	ld a, $00
	ld [wEventFlags + $16], a
	ld a, $00
	ld [wEventFlags + $17], a
	ld a, $00
	ld [wEventFlags + $18], a

	ld a, $1a
	ld [hMapPredef], a
	ld a, $0c
	ldh [hMapNumber], a
	ld a, 3
	ldh [hWarpNumber], a
	ld a, 6
	ldh [hMapGroup], a

	ld a, $01
	ld [wdcbb], a

; Money = 99990
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $96
	ld [wMoney + 2], a

	ld bc, $18
	call Debug_InitDex
	call Debug_InitParty
	call Debug_GiveItems

; 2nd mon
	ld bc, wPartyMons
	ld hl, 1 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_138
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $05 ; $0005 (5)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $85
	inc hl ; MON_MOVE1PP
	ld [hl], 12
	inc hl ; MON_MOVE1MAXPP
	ld [hl], 12

; 3rd mon
	ld bc, wPartyMons
	ld hl, 2 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_114
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl ; MON_MOVE1PP
	ld [hl], 12
	inc hl ; MON_MOVE1MAXPP
	ld [hl], 12

; 4th mon
	ld bc, wPartyMons
	ld hl, 3 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_005
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], 12
	inc hl
	ld [hl], 12

; 5th mon
	ld bc, wPartyMons
	ld hl, 4 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_120
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], 12
	inc hl
	ld [hl], 12

; 6th mon
	ld bc, wPartyMons
	ld hl, 5 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_049
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], 12
	inc hl
	ld [hl], 12
	ret

BlankPartyMon::
	ds $16, 0

Debug_NewGameMinimal::
; Debug code
	ld bc, 1 * $16
	call Debug_GivePartyMon
	ld bc, 1
	call Debug_InitMonFlags

; wow...
	ld a, 0
	ld [wEventFlags], a
	ld a, 0
	ld [wEventFlags + 1], a
	ld a, 0
	ld [wEventFlags + 2], a
	ld a, 0
	ld [wEventFlags + 3], a
	ld a, 0
	ld [wEventFlags + 4], a
	ld a, 0
	ld [wEventFlags + 5], a
	ld a, 0
	ld [wEventFlags + 6], a
	ld a, 0
	ld [wEventFlags + 7], a
	ld a, 0
	ld [wEventFlags + 8], a
	ld a, 0
	ld [wEventFlags + 9], a
	ld a, 0
	ld [wEventFlags + $a], a
	ld a, 0
	ld [wEventFlags + $b], a
	ld a, 0
	ld [wEventFlags + $c], a
	ld a, 0
	ld [wEventFlags + $d], a
	ld a, 0
	ld [wEventFlags + $e], a
	ld a, 0
	ld [wEventFlags + $f], a
	ld a, 0
	ld [wEventFlags + $10], a
	ld a, 0
	ld [wEventFlags + $11], a
	ld a, 0
	ld [wEventFlags + $12], a
	ld a, 0
	ld [wEventFlags + $13], a
	ld a, 0
	ld [wEventFlags + $14], a
	ld a, 0
	ld [wEventFlags + $15], a
	ld a, 0
	ld [wEventFlags + $16], a
	ld a, 0
	ld [wEventFlags + $17], a
	ld a, 0
	ld [wEventFlags + $18], a

	ld a, 0
	ld [hMapPredef], a
	ld a, $01
	ldh [hMapNumber], a
	ld a, 0
	ldh [hWarpNumber], a
	ld a, 0
	ldh [hMapGroup], a
	ld a, 1
	ld [wdcbb], a

	ld bc, 1
	call Debug_InitDex
	call Debug_InitParty
	call Debug_GiveItems

; 5000 money
	ld a, $13
	ld [wMoney + 1], a
	ld a, $88
	ld [wMoney + 2], a
	ret

RunMapLoadHook::
	ld a, [wd0ef]
	and a
	jr z, .asm_19c3

	farcall Func_00b_5273
	ret

.asm_19c3
	farcall LoadEmotesAndPromptGFX
	ret
