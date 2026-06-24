LoadSaveData:
	ld a, SRAM_ENABLE
	ld [rRAMG], a
	xor a
	ld [rRAMB], a
	ld hl, sMapOffsetX
	ld de, hMapOffsetX
	ld bc, $0026
	call CopyBytes3
	ld hl, sMapLayoutPointer
	ld de, wMapLayoutPointer
	ld bc, $004C
	call CopyBytes3
	ld hl, sTilemap
	ld de, wTilemap
	ld bc, $0190
	call CopyBytes3
	ld hl, sPartyMons
	ld de, wPartyMons
	ld bc, $0200
	call CopyBytes3
	ld hl, sa860
	ld de, wd7cb
	ld bc, $0098
	call CopyBytes3
	ld hl, sa4a6
	ld de, wMonBoxCount
	ld bc, $0010
	call CopyBytes3
	ld hl, sEventFlags
	ld de, wEventFlags
	ld bc, $0040
	call CopyBytes3
	ld hl, sa6db
	ld de, wMonBox
	ld bc, $017C
	call CopyBytes3
	ld hl, sa858
	ld de, wd871
	ld bc, $0005
	call CopyBytes3
	ld de, wPlayerScreenX
	ld hl, sPlayerScreenX
	ld a, [hli]
	ld [de], a
	dec de
	ld a, [hli]
	ld [de], a
	ld de, wddb0
	ld hl, sa430
	ld bc, $0050
	call CopyBytes3
	ld de, wde00
	ld hl, sa500
	ld bc, $00B0
	call CopyBytes3
	ld de, wdd00
	ld hl, sa600
	ld bc, $0040
	call CopyBytes3
	ld de, wdcbb
	ld hl, sa650
	ld bc, $0001
	call CopyBytes3
	ld de, wdcea
	ld hl, sa651
	ld bc, $0001
	call CopyBytes3
	ld de, wd9dd
	ld hl, sa652
	ld bc, $0001
	call CopyBytes3
	xor a
	ld [rRAMG], a
	ld [rRAMB], a
	ldh [hFFD6], a
	ret
