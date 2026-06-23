ClearBGMapBox::
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
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, .asm_0ff3

	ld a, 0
	ldh [rVBK], a
	ret

ClearBGMapBox_VRAM1::
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
	ldh a, [hVRAMCopyWidth]
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

