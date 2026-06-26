WriteSaveData:
	ld a, SRAM_ENABLE
	ld [rRAMG], a
	xor a
	ld [rRAMB], a
	ld a, [wdcb3]
	and a
	jr z, .asm_4987
	xor a
	ld [wdcb3], a
	ld hl, _SRAM
	ld bc, $2000
.asm_4980
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_4980
.asm_4987
	ld hl, _SRAM
	ld c, $00
	xor a
.asm_498d
	ld [hli], a
	inc c
	ld a, c
	cp $11
	jr c, .asm_498d
	ld de, sEquipmentBag
	ld hl, wEquipmentBag
	ld bc, $0050
	call CopyBytes3
	ld de, sa500
	ld hl, wde00
	ld bc, $00B0
	call CopyBytes3
	ld de, sa600
	ld hl, wdd00
	ld bc, $0040
	call CopyBytes3
	ld de, sa650
	ld hl, wdcbb
	ld bc, $0001
	call CopyBytes3
	ld de, sa651
	ld hl, wdcea
	ld bc, $0001
	call CopyBytes3
	ld de, sa652
	ld hl, wPlayerChar
	ld bc, $0001
	call CopyBytes3
	ld de, sMapOffsetX
	ld hl, hMapOffsetX
	ld bc, $0026
	call CopyBytes3
	ld de, sMapLayoutPointer
	ld hl, wMapLayoutPointer
	ld bc, $004C
	call CopyBytes3
	ld de, sPlayerScreenX
	ld hl, wPlayerScreenX
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	ld de, sTilemap
	ld hl, wTilemap
	ld bc, $0190
	call CopyBytes3
	ld de, sPartyMons
	ld hl, wPartyMons
	ld bc, $0200
	call CopyBytes3
	ld de, sa860
	ld hl, wd7cb
	ld bc, $0098
	call CopyBytes3
	ld de, sa4a6
	ld hl, wMonBoxCount
	ld bc, $0010
	call CopyBytes3
	ld de, sEventFlags
	ld hl, wEventFlags
	ld bc, $0040
	call CopyBytes3
	ld de, sa6db
	ld hl, wMonBox
	ld bc, $017C
	call CopyBytes3
	ld de, sa858
	ld hl, wd871
	ld bc, $0005
	call CopyBytes3
	ld a, [sMapOffsetX + $14]
	srl a
	ld [sMapOffsetX], a
	jr nc, .asm_4a69
	ld hl, sMapOffsetX + $14
	dec [hl]
	ld a, [sPlayerScreenX]
	add $10
	ld [sPlayerScreenX], a
.asm_4a69
	ld a, [sMapOffsetX + $15]
	srl a
	ld [sMapOffsetX + 1], a
	jr nc, .asm_4a7f
	ld hl, sMapOffsetX + $15
	dec [hl]
	ld a, [sPlayerScreenX + 1]
	add $10
	ld [sPlayerScreenX + 1], a
.asm_4a7f
	xor a
	ld [rRAMG], a
	ld [rRAMB], a
	ret
