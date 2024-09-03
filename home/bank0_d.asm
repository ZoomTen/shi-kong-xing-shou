IncFillBoxVRAM::
; Fill box b*c with value e starting at hl
; Increment e after every write
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

; Write byte
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
; @bug: if jump is taken, causes stack issue
	jr nz, .copy

	inc l
	inc e
	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc

	pop bc
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, IncFillBoxVRAM

	ld a, 0
	ldh [rVBK], a
	ret

LoadMapGFX2::
	ld a, [_BANKNUM]
	push af
	ldh a, [hMapAttrBank]
	rst Bankswitch
	call Func_259b
	ld a, [wMapTileset1Pointer]
	ld l, a
	ld a, [wMapTileset1Pointer + 1]
	ld h, a
	or l
	jr nz, .not_zero

	call LoadTilesetHeader
	pop af
	rst Bankswitch
	ret

.not_zero
	ld de, $9000
	ld bc, $800
	call CopyBytesVRAM
	ld a, [wMapTileset2Pointer]
	ld l, a
	ld a, [wMapTileset2Pointer + 1]
	ld h, a
	ld de, $8800
	ld bc, $300
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

LoadMapGFX::
	ld a, [_BANKNUM]
	push af
	ldh a, [hMapAttrBank]
	rst Bankswitch
	call Func_25a2
	ld a, [wMapTileset1Pointer]
	ld l, a
	ld a, [wMapTileset1Pointer + 1]
	ld h, a
	or l
	jr nz, .not_zero

	call LoadTilesetHeader
	pop af
	rst Bankswitch
	ret

.not_zero
	ld de, $9000
	ld bc, $800
	call CopyBytesVRAM
	call DelayFrame
	ld a, [wMapTileset2Pointer]
	ld l, a
	ld a, [wMapTileset2Pointer + 1]
	ld h, a
	ld de, $8800
	ld bc, $300
	call CopyBytesVRAM
	call DelayFrame
	pop af
	rst Bankswitch
	ret

Func_0fac::
	ld de, wdd00
.asm_0faf
	ld a, [wd08e]
	inc a
	and $07
	ld [wd08e], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret nz
	jr .asm_0faf

Func_0fc4::
	ld de, wdd00
.asm_0fc7
	ld a, [wd08e]
	dec a
	and $07
	ld [wd08e], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret nz
	jr .asm_0fc7

Func_0fdc::
	ld a, [wd08e]
	ld hl, wPartyMons
	ld de, $16
	and a
	jr z, .asm_0fec

.asm_0fe8
	add hl, de
	dec a
	jr nz, .asm_0fe8

.asm_0fec
	push hl
	pop bc
	ret

Func_0fef::
	ld a, 0
	ldh [rVBK], a

.asm_0ff3
	push hl
	di

.waitLCD
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD

	ld [hl], 0
	ei
; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld e, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or e
	ld l, a
	dec b
	jr nz, .waitLCD

; Move to next row
	pop hl
	ld de, BG_MAP_WIDTH
	add hl, de
; Still in BG map 0? ($9800 - $9c00)
	ld a, h
	cp HIGH(vBGMap1)
	jr c, .next_row
; If not, fix it
	ld h, HIGH(vBGMap0)

.next_row
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, .asm_0ff3

	ld a, 0
	ldh [rVBK], a
	ret

Func_1022::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ld a, 1
	ldh [rVBK], a

.asm_102b
	push hl
	di

.waitLCD
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD

	ld [hl], 0
	ei
; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld e, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or e
	ld l, a
	dec b
	jr nz, .waitLCD

; Move to next row
	pop hl
	ld de, BG_MAP_WIDTH
	add hl, de
; Still in BG map 0? ($9800 - $9c00)
	ld a, h
	cp HIGH(vBGMap1)
	jr c, .next_row
; If not, fix it
	ld h, HIGH(vBGMap0)

.next_row
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, .asm_102b

	ld a, 0
	ldh [rVBK], a
	ret

ByteFill::
; Fill bc bytes with the value of a, starting at hl
	ld d, a
.loop
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

ByteFillVRAM::
; Fill bc bytes with the value of a, starting at hl
; Wait until VRAM is write-able first
	ld d, a
.loop
	call WaitVRAM_STAT2
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Func_106f::
	jp Finish_LCD

Func_1072::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	jp Finish_LCD

Func_107f::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, $80
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $9a
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_109a::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, $20
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $7f
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_10b5::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, $60
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $d0
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_10d0::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $b5
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_10eb::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, [wd98f]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $07
	inc hl
	ld [hl], $11
	jp Finish_LCD

Func_1107::
	ld a, [wd9ab]
	ldh [rSCX], a
	ld a, [wd9ac]
	ldh [rSCY], a
	di
	ld a, [wd990]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $23
	inc hl
	ld [hl], $11
	jp Finish_LCD

Func_1123::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, [wd98c]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $eb
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_113f::
	homecall Func_025_5df5
	ret

Func_114c::
	homecall Func_025_4110
	ret

Func_1159::
	push bc
	ld a, [wd991]
	ld b, a
	sla a
	sla a
	add b
	inc a
	ld b, a
	ldh a, [hFF9D]
	add b
	ld b, a
	ldh a, [rLY]
	add b
	ld b, a
	ld a, [wGameTimeMinutes]
	add b
	ld b, a
	ld a, [wd991]
	add b
	ld [wd991], a
	pop bc
	ret

Func_117b::
	push hl
	push de
	push bc
	push af
	ld a, [wd9af]
	ld b, a
	ld a, [wd986]
	and a
	jr nz, .asm_1197
	ld a, [wd9b2]
	and a
	jr nz, .asm_119d

.asm_118f
	ld de, wd93c
	ld a, [wd987]
	jr .asm_11a3

.asm_1197
	ld a, [wd9b2]
	and a
	jr nz, .asm_118f

.asm_119d
	ld de, wd900
	ld a, [wd983]

.asm_11a3
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	pop af
	ld [hl], a
	pop bc
	pop de
	pop hl
	ret

Func_11b3::
	push hl
	push de
	push bc
	ld a, [wd9af]
	ld b, a
	ld a, [wd986]
	and a
	jr nz, .asm_11ce
	ld a, [wd9b2]
	and a
	jr nz, .asm_11d4

.asm_11c6
	ld de, wd93c
	ld a, [wd987]
	jr .asm_11da

.asm_11ce
	ld a, [wd9b2]
	and a
	jr nz, .asm_11c6

.asm_11d4
	ld de, wd900
	ld a, [wd983]

.asm_11da
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

Func_11e9::
	push hl
	push de
	push bc
	push af
	ld a, [wd9af]
	ld b, a
	ld a, [wd986]
	and a
	jr nz, .asm_1205

	ld a, [wd9b2]
	and a
	jr nz, .asm_120b

.asm_11fd
	ld de, wd93c
	ld a, [wd987]
	jr .asm_1211

.asm_1205
	ld a, [wd9b2]
	and a
	jr nz, .asm_11fd

.asm_120b
	ld de, wd900
	ld a, [wd983]

.asm_1211
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld b, a
	pop af
	add b
	ld [hl], a
	ld a, [wd9af]
	cp 4
	jr nc, .asm_1236

	ld a, [hl]
	cp $0e
	jr nc, .asm_1234
	cp $07
	jr nc, .asm_1236

	ld [hl], $07
	jr .asm_1236

.asm_1234
	ld [hl], $0d

.asm_1236
	pop bc
	pop de
	pop hl
	ret

Func_123a::
	push bc
	ldh a, [hFFCD]
	and a
	jr nz, .asm_1259
	jr z, .asm_124c

; inaccessible
	push af
	ldh a, [hFFCB]
	ldh [hFFCD], a
	pop af
	ldh [hFFCB], a
	pop bc
	ret

.asm_124c
	ldh a, [hFFCC]
	and a
	jr z, .asm_1259

	ld b, a
	ldh a, [hFFCB]
	ldh [hFFCC], a
	ld a, b
	ldh [hFFCB], a

.asm_1259
	pop bc
	ret

Func_125b::
	push hl
	push de
	push bc
	ld a, [wd9af]
	ld c, a
	ld b, 0
	ld a, [wd986]
	and a
	jr nz, .asm_127a

	ld a, [wd9b2]
	and a
	jr nz, .asm_1280

.asm_1270
	ld a, [wd984]
	ld l, a
	ld a, [wd984 + 1]
	ld h, a
	jr .asm_1288

.asm_127a
	ld a, [wd9b2]
	and a
	jr nz, .asm_1270

.asm_1280
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a

.asm_1288
	add hl, bc
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

Func_128e::
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a

Func_1296::
	ld hl, 2
	add hl, bc
	ld a, [hli]
	ld [wd998], a
	ld a, [hli]
	ld [wd999], a
	xor a
	ld [wd9d7], a
	homecall Func_025_4110
	ldh a, [hFFCB]
	ld [wd99a], a
	ldh a, [hFFCC]
	ld [wd99b], a
	ret

Func_12bd::
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld a, [hli]
	ld [wd998], a
	ld a, [hli]
	ld [wd999], a
	xor a
	ld [wd9d7], a
	farcall Func_025_4101
	ldh a, [hFFCB]
	ld [wd99a], a
	ldh a, [hFFCC]
	ld [wd99b], a
	ret

Func_12e6::
	ld bc, wdb20
	ld a, [wdc9e]
	ld l, a
	ld a, [wd08e]
	add l
	and a
	ret z

.asm_12f3
	ld hl, $13
	add hl, bc
	push hl
	pop bc
	dec a
	jr nz, .asm_12f3
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

Func_132b::
	call Func_05ff
	ret

Func_132f::
	push hl
	push de
	ld hl, wPartyMons
.asm_1334
	ld a, [hl]
	and a
	jr z, .asm_1346

	ld de, $16
	add hl, de
	ld a, l
	cp $80
	jr c, .asm_1334

	ld a, 1
	pop de
	pop hl
	ret

.asm_1346
	xor a
	push hl
	pop bc
	pop de
	pop hl
	ret

Func_134c::
	ld a, [_BANKNUM]
	push af
	ld a, [wd0f1]
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_135a::
	ld a, [_BANKNUM]
	push af
	ld a, $0c
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_1367::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ld a, 1
	ldh [rVBK], a
	jp Func_1377

Func_1373::
	ld a, 0
	ldh [rVBK], a

Func_1377::
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
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, Func_1377

	ld a, 0
	ldh [rVBK], a
	ret

Func_13b7::
	ld a, [_BANKNUM]
	push af
	ld a, $23
	rst Bankswitch
	ld a, [wd088]
	ld l, a
	ld a, [wd088 + 1]
	ld h, a
	ld a, [hli]
	ld [wd989], a
	ld a, l
	ld [wd088], a
	ld a, h
	ld [wd088 + 1], a
	pop af
	rst Bankswitch
	ret

Func_13d5::
	ld a, [_BANKNUM]
	push af
	ldh a, [hScriptBank]
	rst Bankswitch
	ld a, [wObjectEventPointer]
	ld l, a
	ld a, [wObjectEventPointer + 1]
	ld h, a
	ld de, wda00
.asm_13e7
	ld a, [hl]
	cp $88
	jr z, .asm_13fa

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
	jr .asm_13e7

.asm_13fa
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
	db SFX_00, BGM_59, BGM_65, BGM_65, BGM_59, BGM_59, BGM_59, BGM_59
	db BGM_59, BGM_65, BGM_65, BGM_65, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_5e, BGM_71, BGM_72, BGM_67, BGM_67, BGM_67
	db BGM_67, BGM_67, BGM_67, BGM_72, BGM_6e, BGM_6f, BGM_6f, BGM_6f
	db BGM_6f, BGM_6f, BGM_69, BGM_66, BGM_66, BGM_66, BGM_66, BGM_66
	db BGM_5b, BGM_5a, BGM_65, BGM_66, BGM_64, BGM_60, BGM_60, BGM_60
	db BGM_60, BGM_60, BGM_60, BGM_60, BGM_71, BGM_72

.group_1
	db SFX_00, BGM_5b, BGM_65, BGM_65, BGM_5b, BGM_5b, BGM_5b, BGM_5b
	db BGM_59, BGM_65, BGM_65, BGM_65, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_5e, BGM_71, BGM_72, BGM_67, BGM_67, BGM_67
	db BGM_67, BGM_67, BGM_67, BGM_72, BGM_6e, BGM_6f, BGM_6f, BGM_6f
	db BGM_6f, BGM_6f, BGM_69, BGM_66, BGM_66, BGM_66, BGM_66, BGM_66
	db BGM_63, BGM_5a, BGM_65, BGM_66, BGM_64, BGM_60, BGM_60, BGM_60
	db BGM_60, BGM_60, BGM_60, BGM_60, BGM_71, BGM_72

.group_2
	db SFX_00, BGM_5e, BGM_59, BGM_66, BGM_66, BGM_66, BGM_61, BGM_61
	db BGM_60, BGM_69, BGM_69, BGM_69, BGM_69, BGM_69, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_59, BGM_59, BGM_59, BGM_59, BGM_59, BGM_61
	db BGM_6d, BGM_72, BGM_71, BGM_5e, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_5e, BGM_72, BGM_71, BGM_5b

.group_3
	db SFX_00, BGM_5d, BGM_5d, BGM_5d, BGM_5f, BGM_5f, BGM_5f, BGM_67
	db BGM_67, BGM_59, BGM_5e, BGM_68, BGM_68, BGM_68, BGM_68, BGM_72
	db BGM_70, BGM_70, BGM_5b, BGM_5b, BGM_5b, BGM_60, BGM_61, BGM_67
	db BGM_67, BGM_67, BGM_67, BGM_67, BGM_67, BGM_72, BGM_71, BGM_5d
	db BGM_5f, BGM_5b, BGM_5b, BGM_5b

.group_4
	db SFX_00, BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_5b, BGM_5b
	db BGM_5b, BGM_5b, BGM_5b, BGM_6e, BGM_59, BGM_59, BGM_63, BGM_64
	db BGM_63, BGM_59, BGM_59, BGM_59, BGM_5e, BGM_60, BGM_5b, BGM_5c
	db BGM_5c, BGM_5c, BGM_60, BGM_60, BGM_60, BGM_60, BGM_63, BGM_5e
	db BGM_63, BGM_66, BGM_66, BGM_66, BGM_66, BGM_6e, BGM_5e, BGM_5e
	db BGM_6d, BGM_6d, BGM_62, BGM_67, BGM_6e, BGM_6e, BGM_6e, BGM_6e
	db BGM_6e, BGM_72, BGM_71, BGM_6e, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_71, BGM_72, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e
	db BGM_72, BGM_71, BGM_65, BGM_65, BGM_59, BGM_6e, BGM_6e, BGM_6e
	db BGM_6e, BGM_6e, BGM_6e, BGM_72, BGM_71, BGM_6e, BGM_5a, BGM_63
	db BGM_5c, BGM_5c, BGM_5c, BGM_69, BGM_69, BGM_6d, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_5e, BGM_5e, BGM_72, BGM_71, BGM_62, BGM_67
	db BGM_5a, BGM_5a, BGM_5a, BGM_5a, BGM_70, BGM_70

.group_5
	db SFX_00, BGM_5a, BGM_5a, BGM_66, BGM_66, BGM_66, BGM_66, BGM_5c
	db BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_5c
	db BGM_5c, BGM_5c, BGM_5c, BGM_5c, BGM_5c, BGM_5c, BGM_63, BGM_63
	db BGM_63, BGM_66, BGM_66, BGM_5c, BGM_5b, BGM_5c, BGM_5c, BGM_5c
	db BGM_5c, BGM_72, BGM_71, BGM_65, BGM_65, BGM_65, BGM_65, BGM_5c

.group_6
	db SFX_00, BGM_68, BGM_68, BGM_61, BGM_61, BGM_61, BGM_61, BGM_61
	db BGM_5b, BGM_64, BGM_60, BGM_5a, BGM_6e, BGM_63, BGM_5b, BGM_60
	db BGM_60, BGM_60, BGM_60, BGM_60, BGM_60, BGM_60, BGM_60, BGM_60
	db BGM_70, BGM_70, BGM_70, BGM_70, BGM_72, BGM_71, BGM_63, BGM_63
	db BGM_62, BGM_5f, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e
	db BGM_71, BGM_72, BGM_5f, BGM_61, BGM_69

.group_7
	db SFX_00, BGM_5f, BGM_59, BGM_6e, BGM_5c, BGM_6d, BGM_63, BGM_67
	db BGM_59, BGM_60, BGM_5e, BGM_5e, BGM_5e

Func_15a8::
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
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, Func_15a8

	ld a, 0
	ldh [rVBK], a
	ret

LoadMapAndScriptPredef::
	ld de, .Predefs
	ld a, [hFFBA]
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
	dw Func_1730 ; $01
	dw Func_1730 ; $02
	dw Func_1900 ; $03
	dw MapPredef_AfterMeteorShower ; $04
	dw Func_1712 ; $05
	dw Func_1730 ; $06
	dw Func_1730 ; $07
	dw Func_1730 ; $08
	dw Func_1730 ; $09
	dw Func_1730 ; $0a
	dw Func_1730 ; $0b
	dw Func_1730 ; $0c
	dw Func_1730 ; $0d
	dw Func_1730 ; $0e
	dw Func_1730 ; $0f
	dw Func_1730 ; $10
	dw Func_1730 ; $11
	dw Func_1730 ; $12
	dw Func_1730 ; $13
	dw Func_1730 ; $14

MapPredef_BallotsHouseIntro::
	ld hl, wdd00
	ld [hl], $01
	ld a, MAP_BALLOTS_HOUSE_1
	ldh [hMapNumber], a
	ld a, 1
	ldh [hWarpNumber], a
	ld a, 1
	ldh [hFFD6], a

	ld a, BANK(Script_008_4000)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(Script_008_4000)
	inc hl
	ld [hl], HIGH(Script_008_4000)
	call Func_1642
	ret

Func_1642::
	ld a, [wdcb0]
	and a
	jr z, Func_1661

	cp 1
	jp z, Func_1674
	cp 2
	jp z, Func_168c
	cp 3
	jp z, Func_16b6
	cp 4
	jp z, Func_16c0
	cp 5
	jp z, Func_16ea

Func_1661::
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

Func_1674::
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

Func_168c::
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

Func_16b6::
; @bug: SRAM is not enabled
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp Func_1661

Func_16c0::
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

Func_16ea::
; @bug: SRAM is not enabled
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp Func_1661

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

Func_1712::
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

Func_1730::
; Debug code
	ld bc, 7 * $16
	call Func_2e13
	ld bc, 7
	call Func_2e04

; wow...
	ld a, $ff
	ld [wdaa0], a
	ld a, $ff
	ld [wdaa1], a
	ld a, $ff
	ld [wdaa2], a
	ld a, $f7
	ld [wdaa3], a
	ld a, $ff
	ld [wdaa4], a
	ld a, $ff
	ld [wdaa5], a
	ld a, $77
	ld [wdaa6], a
	ld a, $ff
	ld [wdaa7], a
	ld a, $ff
	ld [wdaa8], a
	ld a, $1f
	ld [wdaa9], a
	ld a, $fc
	ld [wdaaa], a
	ld a, $ff
	ld [wdaab], a
	ld a, $fe
	ld [wdaac], a
	ld a, $ff
	ld [wdaad], a
	ld a, $3f
	ld [wdaae], a
	ld a, $ff
	ld [wdaaf], a
	ld a, $ff
	ld [wdab0], a
	ld a, $ff
	ld [wdab1], a
	ld a, $ff
	ld [wdab2], a
	ld a, $ff
	ld [wdab3], a
	ld a, $f7
	ld [wdab4], a
	ld a, $03
	ld [wdab5], a
	ld a, $00
	ld [wdab6], a
	ld a, $00
	ld [wdab7], a
	ld a, $00
	ld [wdab8], a

	ld a, $1a
	ld [hFFBA], a
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
	call Func_2ca4
	call Func_2d08
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

unk_18ea::
	ds $16, 0

Func_1900::
; Debug code
	ld bc, 1 * $16
	call Func_2e13
	ld bc, 1
	call Func_2e04

; wow...
	ld a, 0
	ld [wdaa0], a
	ld a, 0
	ld [wdaa1], a
	ld a, 0
	ld [wdaa2], a
	ld a, 0
	ld [wdaa3], a
	ld a, 0
	ld [wdaa4], a
	ld a, 0
	ld [wdaa5], a
	ld a, 0
	ld [wdaa6], a
	ld a, 0
	ld [wdaa7], a
	ld a, 0
	ld [wdaa8], a
	ld a, 0
	ld [wdaa9], a
	ld a, 0
	ld [wdaaa], a
	ld a, 0
	ld [wdaab], a
	ld a, 0
	ld [wdaac], a
	ld a, 0
	ld [wdaad], a
	ld a, 0
	ld [wdaae], a
	ld a, 0
	ld [wdaaf], a
	ld a, 0
	ld [wdab0], a
	ld a, 0
	ld [wdab1], a
	ld a, 0
	ld [wdab2], a
	ld a, 0
	ld [wdab3], a
	ld a, 0
	ld [wdab4], a
	ld a, 0
	ld [wdab5], a
	ld a, 0
	ld [wdab6], a
	ld a, 0
	ld [wdab7], a
	ld a, 0
	ld [wdab8], a

	ld a, 0
	ld [hFFBA], a
	ld a, $01
	ldh [hMapNumber], a
	ld a, 0
	ldh [hWarpNumber], a
	ld a, 0
	ldh [hMapGroup], a
	ld a, 1
	ld [wdcbb], a

	ld bc, 1
	call Func_2ca4
	call Func_2d08
	call Debug_GiveItems

; 5000 money
	ld a, $13
	ld [wMoney + 1], a
	ld a, $88
	ld [wMoney + 2], a
	ret

Func_19b6::
	ld a, [wd0ef]
	and a
	jr z, .asm_19c3

	farcall Func_00b_5273
	ret

.asm_19c3
	farcall Func_00d_4000
	ret
