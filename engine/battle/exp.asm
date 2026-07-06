; Level-up handling: exp tables, level-up check, level-up stat display, next-level lookups.
CheckLevelUp::
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 1
	add hl, bc
	ld a, [hl]
	cp $63
	ret z
	cp $3d
	jr nc, .high_level
	ld de, ExpTable
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [hMathValue + 2], a
	ld a, [hli]
	ldh [hMathValue + 1], a
	ld a, [hli]
	ldh [hMathValue], a
	jr .compare

.high_level
	ld de, ExpTable_HighLevels
	sub $3d
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [hMathValue + 2], a
	ld a, [hli]
	ldh [hMathValue + 1], a
	ld a, [hli]
	ldh [hMathValue], a
	ld a, [hli]
	ld [wdce8], a

.compare
	ldh a, [hMathValue + 2]
	ld d, a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 6
	add hl, bc
	ld a, [hl]
	cp d
	ret c
	jr z, .compare_mid
	jr nc, .level_up

.compare_mid
	ldh a, [hMathValue + 1]
	ld d, a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 5
	add hl, bc
	ld a, [hl]
	cp d
	ret c
	jr z, .compare_low
	jr nc, .level_up

.compare_low
	ldh a, [hMathValue]
	ld d, a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 4
	add hl, bc
	ld a, [hl]
	cp d
	ret z
	ret c

.level_up
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 1
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld [wd9e8], a
	call ShowLevelUp
	ret

MACRO exp_entry ; exp (3-byte BE), level
	dt \1
	db \2
ENDM

; 4-byte records: 24-bit cumulative EXP + level byte.
; Indexed by level; ExpTable_HighLevels is the entry for level >= $3d.
ExpTable::
	exp_entry 0, 0
	exp_entry 8, 1
	exp_entry 27, 2
	exp_entry 64, 3
	exp_entry 123, 4
	exp_entry 216, 5
	exp_entry 343, 6
	exp_entry 512, 7
	exp_entry 729, 8
	exp_entry 1000, 9
	exp_entry 1331, 10
	exp_entry 1728, 11
	exp_entry 2197, 12
	exp_entry 2744, 13
	exp_entry 2863, 14
	exp_entry 4096, 15
	exp_entry 4913, 16
	exp_entry 5832, 17
	exp_entry 6859, 18
	exp_entry 8000, 19
	exp_entry 9261, 20
	exp_entry 10648, 21
	exp_entry 12167, 22
	exp_entry 13824, 23
	exp_entry 15625, 24
	exp_entry 17576, 25
	exp_entry 19683, 26
	exp_entry 21952, 27
	exp_entry 24389, 28
	exp_entry 27000, 29
	exp_entry 29791, 30
	exp_entry 32768, 31
	exp_entry 35937, 32
	exp_entry 39304, 33
	exp_entry 42875, 34
	exp_entry 46656, 35
	exp_entry 50653, 36
	exp_entry 54872, 37
	exp_entry 59319, 38
	exp_entry 64000, 39
	exp_entry 68921, 40
	exp_entry 74088, 41
	exp_entry 79507, 42
	exp_entry 85184, 43
	exp_entry 91125, 44
	exp_entry 97336, 45
	exp_entry 103823, 46
	exp_entry 110592, 47
	exp_entry 117649, 48
	exp_entry 125000, 49
	exp_entry 132651, 50
	exp_entry 140608, 51
	exp_entry 148877, 52
	exp_entry 157464, 53
	exp_entry 166375, 54
	exp_entry 175616, 55
	exp_entry 185193, 56
	exp_entry 195112, 57
	exp_entry 205379, 58
	exp_entry 216000, 59
	exp_entry 226981, 60

ExpTable_HighLevels::
	exp_entry 238328, 61
	exp_entry 250047, 62
	exp_entry 262144, 63
	exp_entry 274625, 64
	exp_entry 287496, 65
	exp_entry 300763, 66
	exp_entry 314432, 67
	exp_entry 328509, 68
	exp_entry 343000, 69
	exp_entry 357911, 70
	exp_entry 373248, 71
	exp_entry 389017, 72
	exp_entry 405224, 73
	exp_entry 421875, 74
	exp_entry 438976, 75
	exp_entry 456533, 76
	exp_entry 474552, 77
	exp_entry 493039, 78
	exp_entry 512000, 79
	exp_entry 531441, 80
	exp_entry 420296, 81
	exp_entry 571787, 82
	exp_entry 592704, 83
	exp_entry 614125, 84
	exp_entry 636056, 85
	exp_entry 658503, 86
	exp_entry 681472, 87
	exp_entry 704969, 88
	exp_entry 729000, 89
	exp_entry 753571, 90
	exp_entry 778688, 91
	exp_entry 804357, 92
	exp_entry 830584, 93
	exp_entry 857375, 94
	exp_entry 884736, 95
	exp_entry 912673, 96
	exp_entry 941192, 97
	exp_entry 970299, 98
	exp_entry 970299, 98

ShowLevelUp::
	call ClearBGMap0
	call DrawLevelUpStats
	ld a, BGM_LEVEL_UP_JINGLE
	call PlaySound
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, 1
	ld [wBattleTurn], a
	ld a, $2d
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	farcall LearnLevelUpMove
	ret

DrawLevelUpStats::
	ld hl, GFX_02b_54c7
	ld de, $8680
	ld bc, $80
	call CopyBytesVRAM
	call DelayFrame
	ld hl, StatNames_Text
	ld a, $d
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ld de, LevelUpStatsTilemap
	ld hl, $9808
	ld bc, $0c0c
	ld a, $c
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, LevelUpStatsAttrmap
	ld hl, $9808
	ld bc, $0c0c
	ld a, $c
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld a, $77
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	push bc
	ld a, 1
	ld [wd9d7], a
	call ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	dec de
	ld hl, $9830
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call PrintNumber
	pop bc
	push bc
	ld a, 2
	ld [wd9d7], a
	call ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	dec de
	ld hl, $9870
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call PrintNumber
	pop bc
	push bc
	ld a, 3
	ld [wd9d7], a
	call ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	dec de
	ld hl, $98b0
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call PrintNumber
	pop bc
	push bc
	ld a, 4
	ld [wd9d7], a
	call ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	dec de
	ld hl, $98f0
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call PrintNumber
	pop bc
	push bc
	ld a, 5
	ld [wd9d7], a
	call ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	dec de
	ld hl, $9930
	ld bc, $0203
	ld a, 0
	ld [wd0fd], a
	call PrintNumber
	pop bc
	ret

LevelUpStatsTilemap:: INCBIN "gfx/levelupstats.tilemap"
LevelUpStatsAttrmap:: INCBIN "gfx/levelupstats.gbcattr"

INCLUDE "text/stat_names.asm"

GetMonNextLevel::
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 1
	add hl, bc
	ld a, [hl]
	inc a
	ld [wd9e8], a
	ret

GetExpTableValue::
	ld a, [wd9e8]
	and a
	jr z, .next_level
	cp $63
	jr c, .lookup
	ld a, $63
	jr .lookup

.next_level
	inc a

.lookup
	cp $3d
	jr nc, .high_level
	ld de, ExpTable
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [hMathValue + 2], a
	ld a, [hli]
	ldh [hMathValue + 1], a
	ld a, [hli]
	ldh [hMathValue], a
	jr .done

.high_level
	ld de, ExpTable
	sub $3d
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [hMathValue + 2], a
	ld a, [hli]
	ldh [hMathValue + 1], a
	ld a, [hli]
	ldh [hMathValue], a

.done
	ret
