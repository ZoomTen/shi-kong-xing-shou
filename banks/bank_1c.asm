Func_01c_4000::
	ld a, [hFFD6]
	and a
	ret nz
	ld de, TileAnimGroupPointers
	ldh a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ldh a, [hMapNumber]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, $00
	ldh a, [hFFC2]
	ld c, a
	add a
	add a
	add a
	sub c
	ld e, a
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4030
	xor a
	ldh [hFFC2], a
	ret
.asm_4030
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld d, [hl]
	push hl
	ld hl, wTileAnimFrameCounters
	ldh a, [hFFC2]
	add l
	ld l, a
	inc [hl]
	ld a, [hl]
	cp d
	jr nz, .asm_4043
	xor a
.asm_4043
	ld [hl], a
	pop hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	push hl
	ld hl, wTileAnimFrameCounters
	ldh a, [hFFC2]
	add l
	ld l, a
	ld a, [hl]
	pop hl
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyBytesVRAM
	pop hl
	inc hl
	ldh a, [hFFC2]
	inc a
	ldh [hFFC2], a
	ret
TileAnimGroupPointers:
	dw TileAnimMaps_Group0
	dw TileAnimMaps_Group0
	dw TileAnimMaps_Group2
	dw TileAnimMaps_Group3
	dw TileAnimMaps_Group4
	dw TileAnimMaps_Group5
	dw TileAnimMaps_Group6
	dw TileAnimMaps_Group7
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
TileAnimMaps_Group0:
	dr $7007d, $700e9
; TODO: high-entropy - likely graphics, extract to PNG
TileAnimData_Group0:
	dr $700e9, $70781
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
TileAnimMaps_Group2:
	dr $70781, $707c9
; TODO: high-entropy - likely graphics, extract to PNG
TileAnimData_Group2:
	dr $707c9, $70f53
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
TileAnimMaps_Group3:
	dr $70f53, $70f9b
; TODO: high-entropy - likely graphics, extract to PNG
TileAnimData_Group3:
	dr $70f9b, $712a2
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
TileAnimMaps_Group4:
	dr $712a2, $7136e
; TODO: high-entropy - likely graphics, extract to PNG
TileAnimData_Group4:
	dr $7136e, $71ceb
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
TileAnimMaps_Group5:
	dr $71ceb, $71d3b
; TODO: high-entropy - likely graphics, extract to PNG
TileAnimData_Group5:
	dr $71d3b, $71fde
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
TileAnimMaps_Group6:
	dr $71fde, $72038
; TODO: high-entropy - likely graphics, extract to PNG
TileAnimData_Group6:
	dr $72038, $72248
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
TileAnimMaps_Group7:
	dr $72248, $72260


