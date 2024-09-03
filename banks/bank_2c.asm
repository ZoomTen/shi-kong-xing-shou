unk_02c_4000:
	dr $b0000, $b12b8

BattleTransition_InsertWhiteTile:
	ld hl, .WhiteTile
	ld de, $8a00
	ld bc, $10
	call CopyBytesVRAM
	ret

.WhiteTile:
	db $0, $0, $0, $0
	db $0, $0, $0, $0
	db $0, $0, $0, $0
	db $0, $0, $0, $0

.BlackTile:
	db $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff

StartBattleTransition:
	call BattleTransition_InsertWhiteTile
.run
; Fetch transition type
	ld hl, BattleTransitionTypes
	ld a, [wdcd9]
	add a
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wdcda]
	cp -1
	ret z
; Get current frame
	add a
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr nz, .animate
	ld a, -1
	ld [wdcda], a
	ret
.animate
	call AnimateBattleTransition
	ld a, [wdcda]
	inc a
	ld [wdcda], a
	call DelayFrame
	call DelayFrame
	jp .run
	ret

AnimateBattleTransition:
	ld a, [wd0ba]
	and $1f
	ld [wdcdd], a
	ld a, [wd0ba + 1]
	ld b, a
	ld a, [wd0ba]
	srl b
	rr a
	srl b
	rr a
	srl b
	rr a
	srl b
	rr a
	srl b
	rr a
	and $1f
	ld [wdcde], a
.run
	ld a, [hli]
	ld b, a
	cp -1
	ret z
	ld a, [hli]
	ld c, a
	call .OffsetToMapLocation
	di
.wait_vblank
	ldh a, [rSTAT]
	and 2
	jr nz, .wait_vblank
	ld a, $a0
	ld [de], a
	ei
	ldh a, [hConsoleType]
	cp $11
	jr nz, .run
	di
.gbc_wait_vblank
	ldh a, [rSTAT]
	and 2
	jr nz, .gbc_wait_vblank
	ld a, 1
	ldh [rVBK], a
	xor a
	ld [de], a
	ld a, a
	ldh [rVBK], a
	ei
	jr .run

.OffsetToMapLocation:
	ld d, $98
	ld a, c
	ld a, [wdcde]
	add c
	and $1f
	ld e, a
	xor a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	add $98
	ld d, a
	ld a, [wdcdd]
	add b
	and $1f
	or e
	ld e, a
	ret

Func_2c_53a6:
	ld a, c
	sub $10
	and $1f
	ld e, a
	xor a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	add $9c
	ld d, a
	ld a, b
	and $1f
	or e
	ld e, a
	ret

Func_2c_53ca:
	ret

Func_2c_53cb:
	push hl
	push bc
	inc c
	sla b
	sla b
	sla b
	sla c
	sla c
	sla c
	ld hl, $c920
	ld e, $18

Func_2c_53df:
	ld a, [hli]
	or a
	jr z, Func_2c_5413
	inc hl
	inc hl
	ld a, [hli]
	and $f8
	cp b
	jr nz, Func_2c_5405
	ld a, [hl]
	and $f8
	cp c
	jr nz, Func_2c_5405
	ld a, l
	and $e0
	ld l, a
	xor a
	ld [hl], a
	ld a, $20
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec e
	jr nz, Func_2c_53df
	pop bc
	pop hl
	ret

Func_2c_5405:
	ld a, $1c
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec e
	jr nz, Func_2c_53df
	pop bc
	pop hl
	ret

Func_2c_5413:
	ld a, $1f
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec e
	jr nz, Func_2c_53df
	pop bc
	pop hl
	ret

BattleTransitionTypes:
	dw BattleTransition_CircleInward
	dw BattleTransition_DiamondInward
	dw BattleTransition_CrossInward
	dw BattleTransition_Dissolve
	dw BattleTransition_HorizontalStripes
	dw BattleTransition_DiamondOutward
	dw BattleTransition_VerticalLines
	dw BattleTransition_DiagonalCheckerboard

BattleTransition_CircleInward:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
	dw .frame9
	dw .frame10
	dw .frame11
	dw .frame12
	dw .frame13
	dw .frame14
	dw .frame15
	dw .frame16
	dw .frame17
	dw .frame18
	dw .frame19
	dw .frame20
	dw .frame21
	dw .frame22
	dw .frame23
	dw .frame24
	dw .frame25
	dw .frame26
	dw .frame27
	dw .frame28
	dw .frame29
	dw .frame30
	dw .frame31
	dw .frame32
	dw $0

.frame0:
	dw $0, $13, $1100, $1113
	db -1

.frame1:
	db -1

.frame2:
	dw $100, $113, $1000, $1013
	db -1

.frame3:
	dw $1, $12, $1101, $1112
	db -1

.frame4:
	dw $2, $11, $101, $112
	dw $200, $213, $f00, $f13
	dw $1001, $1012, $1102, $1111
	db -1

.frame5:
	dw $300, $313, $e00, $e13
	db -1

.frame6:
	dw $3, $10, $102, $111
	dw $201, $212, $400, $413
	dw $d00, $d13, $f01, $f12
	dw $1002, $1011, $1103, $1110
	db -1

.frame7:
	dw $4, $f, $301, $312
	dw $500, $513, $c00, $c13
	dw $e01, $e12, $1104, $110f
	db -1

.frame8:
	dw $103, $110, $202, $211
	dw $600, $613, $700, $713
	dw $a00, $a13, $b00, $b13
	dw $f02, $f11, $1003, $1010
	db -1

.frame9:
	dw $5, $e, $104, $10f
	dw $302, $311, $401, $412
	dw $800, $813, $900, $913
	dw $d01, $d12, $e02, $e11
	dw $1004, $100f, $1105, $110e
	db -1

.frame10:
	dw $6, $d, $203, $210
	dw $501, $512, $c01, $c12
	dw $f03, $f10, $1106, $110d
	db -1

.frame11:
	dw $7, $8, $9, $a
	dw $b, $c, $105, $10e
	dw $402, $411, $601, $612
	dw $701, $712, $801, $812
	dw $901, $912, $a01, $a12
	dw $b01, $b12, $d02, $d11
	dw $1005, $100e, $1107, $1108
	dw $1109, $110a, $110b, $110c
	dw $1209, $120a, $120b, $120c
	db -1

.frame12:
	dw $106, $10d, $204, $20f
	dw $303, $310, $502, $511
	dw $c02, $c11, $e03, $e10
	dw $f04, $f0f, $1006, $100d
	db -1

.frame13:
	dw $107, $10c, $205, $20e
	dw $403, $410, $602, $611
	dw $b02, $b11, $d03, $d10
	dw $f05, $f0e, $1007, $100c
	db -1

.frame14:
	dw $108, $109, $10a, $10b
	dw $304, $30f, $702, $711
	dw $802, $811, $902, $911
	dw $a02, $a11, $e04, $e0f
	dw $1008, $1009, $100a, $100b
	db -1

.frame15:
	dw $206, $20d, $305, $30e
	dw $404, $40f, $503, $510
	dw $c03, $c10, $d04, $d0f
	dw $e05, $e0e, $f06, $f0d
	db -1

.frame16:
	dw $207, $208, $20b, $20c
	dw $603, $610, $703, $710
	dw $a03, $a10, $b03, $b10
	dw $f07, $f08, $f0b, $f0c
	db -1

.frame17:
	dw $209, $20a, $306, $30d
	dw $504, $50f, $803, $810
	dw $903, $910, $c04, $c0f
	dw $e06, $e0d, $f09, $f0a
	db -1

.frame18:
	dw $307, $30c, $405, $40e
	dw $604, $60f, $b04, $b0f
	dw $d05, $d0e, $e07, $e0c
	db -1

.frame19:
	dw $308, $309, $30a, $30b
	dw $406, $40d, $505, $50e
	dw $704, $70f, $804, $80f
	dw $904, $90f, $a04, $a0f
	dw $c05, $c0e, $d06, $d0d
	dw $e08, $e09, $e0a, $e0b
	db -1

.frame20:
	db -1

.frame21:
	dw $407, $40c, $506, $50d
	dw $605, $60e, $b05, $b0e
	dw $c06, $c0d, $d07, $d0c
	db -1

.frame22:
	dw $408, $409, $40a, $40b
	dw $705, $70e, $805, $80e
	dw $905, $90e, $a05, $a0e
	dw $d08, $d09, $d0a, $d0b
	db -1

.frame23:
	dw $507, $50c, $606, $60d
	dw $b06, $b0d, $c07, $c0c
	db -1

.frame24:
	dw $508, $50b, $706, $70d
	dw $a06, $a0d, $c08, $c0b
	db -1

.frame25:
	dw $509, $50a, $607, $60c
	dw $806, $80d, $906, $90d
	dw $b07, $b0c, $c09, $c0a
	db -1

.frame26:
	db -1

.frame27:
	dw $608, $609, $60a, $60b
	dw $707, $70c, $807, $80c
	dw $907, $90c, $a07, $a0c
	dw $b08, $b09, $b0a, $b0b
	db -1

.frame28:
	db -1

.frame29:
	dw $708, $70b, $a08, $a0b
	db -1

.frame30:
	dw $709, $70a, $808, $80b
	dw $908, $90b, $a09, $a0a
	db -1

.frame31:
	db -1

.frame32:
	dw $809, $80a, $909, $90a
	db -1

BattleTransition_DiamondInward:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
	dw .frame9
	dw .frame10
	dw .frame11
	dw .frame12
	dw .frame13
	dw .frame14
	dw .frame15
	dw .frame16
	dw .frame17
	dw .frame18
	dw .frame19
	dw .frame20
	dw .frame21
	dw .frame22
	dw .frame23
	dw .frame24
	dw .frame25
	dw .frame26
	dw .frame27
	dw .frame28
	dw .frame29
	dw .frame30
	dw .frame31
	dw .frame32
	dw $0

.frame0:
	dw $0, $13, $1100, $1113
	db -1

.frame1:
	db -1

.frame2:
	dw $1, $12, $100, $113
	dw $1000, $1013, $1101, $1112
	db -1

.frame3:
	dw $101, $112, $1001, $1012
	db -1

.frame4:
	db -1

.frame5:
	dw $2, $11, $102, $111
	dw $200, $201, $212, $213
	dw $f00, $f01, $f12, $f13
	dw $1002, $1011, $1102, $1111
	db -1

.frame6:
	db -1

.frame7:
	dw $3, $10, $202, $211
	dw $300, $313, $e00, $e13
	dw $f02, $f11, $1103, $1110
	db -1

.frame8:
	dw $103, $110, $301, $312
	dw $e01, $e12, $1003, $1010
	db -1

.frame9:
	dw $203, $210, $302, $311
	dw $e02, $e11, $f03, $f10
	db -1

.frame10:
	dw $4, $f, $104, $10f
	dw $400, $401, $412, $413
	dw $d00, $d01, $d12, $d13
	dw $1004, $100f, $1104, $110f
	db -1

.frame11:
	dw $204, $20f, $303, $310
	dw $402, $411, $d02, $d11
	dw $e03, $e10, $f04, $f0f
	db -1

.frame12:
	db -1

.frame13:
	dw $5, $e, $105, $10e
	dw $304, $30f, $403, $410
	dw $500, $501, $512, $513
	dw $c00, $c01, $c12, $c13
	dw $d03, $d10, $e04, $e0f
	dw $1005, $100e, $1105, $110e
	db -1

.frame14:
	dw $205, $20e, $404, $40f
	dw $502, $511, $c02, $c11
	dw $d04, $d0f, $f05, $f0e
	db -1

.frame15:
	dw $6, $d, $305, $30e
	dw $503, $510, $600, $613
	dw $b00, $b13, $c03, $c10
	dw $e05, $e0e, $1106, $110d
	db -1

.frame16:
	dw $106, $10d, $206, $20d
	dw $601, $602, $611, $612
	dw $b01, $b02, $b11, $b12
	dw $f06, $f0d, $1006, $100d
	db -1

.frame17:
	dw $306, $30d, $405, $40e
	dw $504, $50f, $603, $610
	dw $b03, $b10, $c04, $c0f
	dw $d05, $d0e, $e06, $e0d
	db -1

.frame18:
	dw $7, $c, $107, $10c
	dw $505, $50e, $700, $701
	dw $712, $713, $a00, $a01
	dw $a12, $a13, $c05, $c0e
	dw $1007, $100c, $1107, $110c
	db -1

.frame19:
	dw $207, $20c, $406, $40d
	dw $604, $60f, $702, $711
	dw $a02, $a11, $b04, $b0f
	dw $d06, $d0d, $f07, $f0c
	db -1

.frame20:
	dw $307, $30c, $506, $50d
	dw $605, $60e, $703, $710
	dw $a03, $a10, $b05, $b0e
	dw $c06, $c0d, $e07, $e0c
	db -1

.frame21:
	dw $8, $b, $108, $10b
	dw $208, $20b, $407, $40c
	dw $704, $70f, $800, $801
	dw $802, $811, $812, $813
	dw $900, $901, $902, $911
	dw $912, $913, $a04, $a0f
	dw $d07, $d0c, $f08, $f0b
	dw $1008, $100b, $1108, $110b
	db -1

.frame22:
	dw $308, $30b, $606, $60d
	dw $803, $810, $903, $910
	dw $b06, $b0d, $e08, $e0b
	db -1

.frame23:
	dw $9, $a, $408, $40b
	dw $507, $50c, $705, $70e
	dw $804, $80f, $904, $90f
	dw $a05, $a0e, $c07, $c0c
	dw $d08, $d0b, $1109, $110a
	db -1

.frame24:
	dw $109, $10a, $209, $20a
	dw $607, $60c, $706, $70d
	dw $a06, $a0d, $b07, $b0c
	dw $f09, $f0a, $1009, $100a
	db -1

.frame25:
	dw $309, $30a, $508, $50b
	dw $805, $80e, $905, $90e
	dw $c08, $c0b, $e09, $e0a
	db -1

.frame26:
	dw $409, $40a, $608, $60b
	dw $707, $70c, $806, $80d
	dw $906, $90d, $a07, $a0c
	dw $b08, $b0b, $d09, $d0a
	db -1

.frame27:
	dw $509, $50a, $c09, $c0a
	db -1

.frame28:
	dw $609, $60a, $708, $70b
	dw $807, $80c, $907, $90c
	dw $a08, $a0b, $b09, $b0a
	db -1

.frame29:
	dw $808, $80b, $908, $90b
	db -1

.frame30:
	dw $709, $70a, $a09, $a0a
	db -1

.frame31:
	db -1

.frame32:
	dw $809, $80a, $909, $90a
	db -1

BattleTransition_CrossInward:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
	dw .frame9
	dw .frame10
	dw .frame11
	dw .frame12
	dw .frame13
	dw .frame14
	dw .frame15
	dw .frame16
	dw .frame17
	dw .frame18
	dw .frame19
	dw .frame20
	dw .frame21
	dw .frame22
	dw .frame23
	dw .frame24
	dw .frame25
	dw $0

.frame0:
	dw $800, $813, $900, $913
	db -1

.frame1:
	dw $700, $713, $801, $812
	dw $901, $912, $a00, $a13
	db -1

.frame2:
	dw $600, $613, $701, $712
	dw $802, $811, $902, $911
	dw $a01, $a12, $b00, $b13
	db -1

.frame3:
	dw $500, $513, $601, $612
	dw $702, $711, $803, $810
	dw $903, $910, $a02, $a11
	dw $b01, $b12, $c00, $c13
	db -1

.frame4:
	dw $400, $413, $501, $512
	dw $602, $611, $703, $710
	dw $804, $80f, $904, $90f
	dw $a03, $a10, $b02, $b11
	dw $c01, $c12, $d00, $d13
	db -1

.frame5:
	dw $300, $313, $401, $412
	dw $502, $511, $603, $610
	dw $704, $70f, $805, $80e
	dw $905, $90e, $a04, $a0f
	dw $b03, $b10, $c02, $c11
	dw $d01, $d12, $e00, $e13
	db -1

.frame6:
	dw $200, $213, $301, $312
	dw $402, $411, $503, $510
	dw $604, $60f, $705, $70e
	dw $806, $80d, $906, $90d
	dw $a05, $a0e, $b04, $b0f
	dw $c03, $c10, $d02, $d11
	dw $e01, $e12, $f00, $f13
	db -1

.frame7:
	dw $100, $113, $201, $212
	dw $302, $311, $403, $410
	dw $504, $50f, $605, $60e
	dw $706, $70d, $807, $80c
	dw $907, $90c, $a06, $a0d
	dw $b05, $b0e, $c04, $c0f
	dw $d03, $d10, $e02, $e11
	dw $f01, $f12, $1000, $1013
	db -1

.frame8:
	dw $0, $13, $101, $112
	dw $202, $211, $303, $310
	dw $404, $40f, $505, $50e
	dw $606, $60d, $707, $70c
	dw $808, $80b, $908, $90b
	dw $a07, $a0c, $b06, $b0d
	dw $c05, $c0e, $d04, $d0f
	dw $e03, $e10, $f02, $f11
	dw $1001, $1012, $1100, $1113
	db -1

.frame9:
	dw $1, $12, $102, $111
	dw $203, $210, $304, $30f
	dw $405, $40e, $506, $50d
	dw $607, $60c, $708, $70b
	dw $809, $80a, $909, $90a
	dw $a08, $a0b, $b07, $b0c
	dw $c06, $c0d, $d05, $d0e
	dw $e04, $e0f, $f03, $f10
	dw $1002, $1011, $1101, $1112
	dw $ffff, $ffff
	db -1

.frame10:
	db -1

.frame11:
	db -1

.frame12:
	db -1

.frame13:
	db -1

.frame22:
	db -1

.frame23:
	db -1

.frame24:
	db -1

.frame25:
	dw $ffff, $ffff
	db -1

.frame14:
	dw $9, $a, $1109, $110a
	db -1

.frame15:
	dw $8, $b, $109, $10a
	dw $1009, $100a, $1108, $110b
	db -1

.frame16:
	dw $7, $c, $108, $10b
	dw $209, $20a, $f09, $f0a
	dw $1008, $100b, $1107, $110c
	db -1

.frame17:
	dw $6, $d, $107, $10c
	dw $208, $20b, $309, $30a
	dw $e09, $e0a, $f08, $f0b
	dw $1007, $100c, $1106, $110d
	db -1

.frame18:
	dw $5, $e, $106, $10d
	dw $207, $20c, $308, $30b
	dw $409, $40a, $d09, $d0a
	dw $e08, $e0b, $f07, $f0c
	dw $1006, $100d, $1105, $110e
	db -1

.frame19:
	dw $4, $f, $105, $10e
	dw $206, $20d, $307, $30c
	dw $408, $40b, $509, $50a
	dw $c09, $c0a, $d08, $d0b
	dw $e07, $e0c, $f06, $f0d
	dw $1005, $100e, $1104, $110f
	db -1

.frame20:
	dw $3, $10, $104, $10f
	dw $205, $20e, $306, $30d
	dw $407, $40c, $508, $50b
	dw $609, $60a, $b09, $b0a
	dw $c08, $c0b, $d07, $d0c
	dw $e06, $e0d, $f05, $f0e
	dw $1004, $100f, $1103, $1110
	db -1

.frame21:
	dw $2, $11, $103, $110
	dw $204, $20f, $305, $30e
	dw $406, $40d, $507, $50c
	dw $608, $60b, $709, $70a
	dw $a09, $a0a, $b08, $b0b
	dw $c07, $c0c, $d06, $d0d
	dw $e05, $e0e, $f04, $f0f
	dw $1003, $1010, $1102, $1111
	db -1

BattleTransition_Dissolve:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
	dw .frame9
	dw .frame10
	dw .frame11
	dw .frame12
	dw .frame13
	dw .frame14
	dw .frame15
	dw .frame16
	dw .frame17
	dw .frame18
	dw .frame19
	dw .frame20
	dw .frame21
	dw .frame22
	dw .frame23
	dw .frame24
	dw .frame25
	dw .frame26
	dw .frame27
	dw .frame28
	dw .frame29
	dw .frame30
	dw .frame31
	dw .frame32
	dw .frame33
	dw .frame34
	dw .frame35
	dw .frame36
	dw .frame37
	dw .frame38
	dw .frame39
	dw .frame40
	dw .frame41
	dw .frame42
	dw .frame43
	dw .frame44
	dw $0

.frame0:
	db -1

.frame1:
	dw $e, $10e, $307, $30b
	dw $908, $c13, $d0e, $1000
	db -1

.frame2:
	dw $101, $313, $413, $90d
	dw $a08, $c0c, $1009, $100d
	db -1

.frame3:
	dw $606, $808, $a03, $a06
	dw $a12, $b08, $f0f, $100f
	db -1

.frame4:
	dw $105, $20b, $304, $404
	dw $40f, $613, $b12, $e0b
	db -1

.frame5:
	dw $20d, $211, $513, $706
	dw $c0d, $e10, $1006, $1105
	db -1

.frame6:
	dw $505, $70b, $70f, $801
	dw $d08, $d0b, $d0d, $f01
	db -1

.frame7:
	dw $10c, $113, $200, $20a
	dw $310, $402, $911, $1113
	db -1

.frame8:
	dw $902, $a13, $b0a, $c04
	dw $f07, $f0c, $f10, $1102
	db -1

.frame9:
	dw $10, $103, $104, $408
	dw $710, $a07, $e07, $f0e
	db -1

.frame10:
	dw $207, $301, $50b, $60f
	dw $70d, $803, $e04, $1003
	db -1

.frame11:
	dw $70c, $804, $809, $910
	dw $b0b, $b10, $c10, $f09
	db -1

.frame12:
	dw $110, $508, $50f, $90f
	dw $c0e, $d11, $e05, $1109
	db -1

.frame13:
	dw $203, $210, $503, $703
	dw $707, $a01, $b09, $1108
	db -1

.frame14:
	dw $9, $11, $204, $20e
	dw $50e, $701, $f05, $110b
	db -1

.frame15:
	dw $10d, $40e, $90a, $a0a
	dw $a0d, $b0c, $110a, $1110
	db -1

.frame16:
	dw $1, $205, $40d, $412
	dw $a09, $c02, $d01, $d0a
	db -1

.frame17:
	dw $506, $511, $713, $d03
	dw $d0f, $f06, $f11, $1106
	db -1

.frame18:
	dw $5, $13, $10a, $300
	dw $b05, $c03, $1004, $100b
	db -1

.frame19:
	dw $a, $20f, $40a, $70a
	dw $d09, $e08, $e0f, $f08
	db -1

.frame20:
	dw $30c, $30f, $407, $410
	dw $502, $603, $802, $80c
	db -1

.frame21:
	dw $6, $510, $700, $711
	dw $905, $90b, $b07, $e09
	db -1

.frame22:
	dw $2, $c, $112, $400
	dw $807, $90e, $b02, $f02
	db -1

.frame23:
	dw $30a, $312, $50d, $812
	dw $907, $a04, $a0f, $e13
	db -1

.frame24:
	dw $604, $611, $80a, $80d
	dw $a0b, $c00, $c0b, $f12
	db -1

.frame25:
	dw $7, $f, $30e, $409
	dw $c06, $e00, $1007, $1111
	db -1

.frame26:
	dw $411, $501, $608, $609
	dw $60b, $810, $912, $100e
	db -1

.frame27:
	dw $305, $50a, $607, $60c
	dw $80e, $d12, $f04, $110c
	db -1

.frame28:
	dw $206, $509, $610, $805
	dw $90c, $b0e, $e0e, $110e
	db -1

.frame29:
	dw $12, $209, $302, $903
	dw $c08, $d04, $d06, $e0d
	db -1

.frame30:
	dw $b, $601, $a00, $b03
	dw $b04, $c05, $c0a, $d13
	db -1

.frame31:
	dw $3, $303, $708, $d0c
	dw $e12, $f00, $1008, $1101
	db -1

.frame32:
	dw $306, $405, $40b, $813
	dw $d10, $e0c, $1002, $110d
	db -1

.frame33:
	dw $403, $406, $806, $901
	dw $a0e, $a10, $b01, $1012
	db -1

.frame34:
	dw $208, $20c, $213, $308
	dw $b06, $c0f, $1013, $1104
	db -1

.frame35:
	dw $212, $500, $900, $909
	dw $b0d, $b11, $e11, $1112
	db -1

.frame36:
	dw $600, $904, $a05, $a11
	dw $c11, $c12, $e03, $f0a
	db -1

.frame37:
	dw $712, $80b, $b00, $d00
	dw $d05, $f03, $1005, $1010
	db -1

.frame38:
	dw $60d, $612, $800, $e01
	dw $e02, $e0a, $1107, $110f
	db -1

.frame39:
	dw $0, $4, $8, $10b
	dw $10f, $709, $b13, $1001
	db -1

.frame40:
	dw $202, $30d, $40c, $50c
	dw $c01, $c09, $f0b, $1100
	db -1

.frame41:
	dw $107, $108, $309, $311
	dw $512, $70e, $c07, $f0d
	db -1

.frame42:
	dw $201, $602, $705, $906
	dw $d02, $e06, $100a, $100c
	db -1

.frame43:
	dw $d, $100, $111, $60a
	dw $60e, $a02, $a0c, $1011
	db -1

.frame44:
	dw $102, $106, $109, $605
	dw $702, $913, $d07, $f13
	db -1

BattleTransition_HorizontalStripes:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
	dw .frame9
	dw .frame10
	dw .frame11
	dw .frame12
	dw .frame13
	dw .frame14
	dw .frame15
	dw .frame16
	dw .frame17
	dw .frame18
	dw .frame19
	dw $0

.frame0:
	dw $100, $13, $300, $213
	dw $500, $413, $700, $613
	dw $900, $813, $b00, $a13
	dw $d00, $c13, $f00, $e13
	dw $1100, $1013
	db -1

.frame1:
	dw $101, $12, $301, $212
	dw $501, $412, $701, $612
	dw $901, $812, $b01, $a12
	dw $d01, $c12, $f01, $e12
	dw $1101, $1012
	db -1

.frame2:
	dw $102, $11, $302, $211
	dw $502, $411, $702, $611
	dw $902, $811, $b02, $a11
	dw $d02, $c11, $f02, $e11
	dw $1102, $1011
	db -1

.frame3:
	dw $103, $10, $303, $210
	dw $503, $410, $703, $610
	dw $903, $810, $b03, $a10
	dw $d03, $c10, $f03, $e10
	dw $1103, $1010
	db -1

.frame4:
	dw $104, $f, $304, $20f
	dw $504, $40f, $704, $60f
	dw $904, $80f, $b04, $a0f
	dw $d04, $c0f, $f04, $e0f
	dw $1104, $100f
	db -1

.frame5:
	dw $105, $e, $305, $20e
	dw $505, $40e, $705, $60e
	dw $905, $80e, $b05, $a0e
	dw $d05, $c0e, $f05, $e0e
	dw $1105, $100e
	db -1

.frame6:
	dw $106, $d, $306, $20d
	dw $506, $40d, $706, $60d
	dw $906, $80d, $b06, $a0d
	dw $d06, $c0d, $f06, $e0d
	dw $1106, $100d
	db -1

.frame7:
	dw $107, $c, $307, $20c
	dw $507, $40c, $707, $60c
	dw $907, $80c, $b07, $a0c
	dw $d07, $c0c, $f07, $e0c
	dw $1107, $100c
	db -1

.frame8:
	dw $108, $b, $308, $20b
	dw $508, $40b, $708, $60b
	dw $908, $80b, $b08, $a0b
	dw $d08, $c0b, $f08, $e0b
	dw $1108, $100b
	db -1

.frame9:
	dw $109, $a, $309, $20a
	dw $509, $40a, $709, $60a
	dw $909, $80a, $b09, $a0a
	dw $d09, $c0a, $f09, $e0a
	dw $1109, $100a
	db -1

.frame10:
	dw $10a, $9, $30a, $209
	dw $50a, $409, $70a, $609
	dw $90a, $809, $b0a, $a09
	dw $d0a, $c09, $f0a, $e09
	dw $110a, $1009
	db -1

.frame11:
	dw $10b, $8, $30b, $208
	dw $50b, $408, $70b, $608
	dw $90b, $808, $b0b, $a08
	dw $d0b, $c08, $f0b, $e08
	dw $110b, $1008
	db -1

.frame12:
	dw $10c, $7, $30c, $207
	dw $50c, $407, $70c, $607
	dw $90c, $807, $b0c, $a07
	dw $d0c, $c07, $f0c, $e07
	dw $110c, $1007
	db -1

.frame13:
	dw $10d, $6, $30d, $206
	dw $50d, $406, $70d, $606
	dw $90d, $806, $b0d, $a06
	dw $d0d, $c06, $f0d, $e06
	dw $110d, $1006
	db -1

.frame14:
	dw $10e, $5, $30e, $205
	dw $50e, $405, $70e, $605
	dw $90e, $805, $b0e, $a05
	dw $d0e, $c05, $f0e, $e05
	dw $110e, $1005
	db -1

.frame15:
	dw $10f, $4, $30f, $204
	dw $50f, $404, $70f, $604
	dw $90f, $804, $b0f, $a04
	dw $d0f, $c04, $f0f, $e04
	dw $110f, $1004
	db -1

.frame16:
	dw $110, $3, $310, $203
	dw $510, $403, $710, $603
	dw $910, $803, $b10, $a03
	dw $d10, $c03, $f10, $e03
	dw $1110, $1003
	db -1

.frame17:
	dw $111, $2, $311, $202
	dw $511, $402, $711, $602
	dw $911, $802, $b11, $a02
	dw $d11, $c02, $f11, $e02
	dw $1111, $1002
	db -1

.frame18:
	dw $112, $1, $312, $201
	dw $512, $401, $712, $601
	dw $912, $801, $b12, $a01
	dw $d12, $c01, $f12, $e01
	dw $1112, $1001
	db -1

.frame19:
	dw $113, $0, $313, $200
	dw $513, $400, $713, $600
	dw $913, $800, $b13, $a00
	dw $d13, $c00, $f13, $e00
	dw $1113, $1000
	db -1

BattleTransition_DiamondOutward:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
	dw .frame9
	dw .frame10
	dw .frame11
	dw .frame12
	dw .frame13
	dw .frame14
	dw .frame15
	dw .frame16
	dw .frame17
	dw $0

.frame0:
	dw $70a, $809, $80a, $80b
	dw $90a
	db -1

.frame1:
	dw $609, $60a, $60b, $709
	dw $708, $808, $908, $909
	dw $a09, $a0a, $a0b, $90b
	dw $90c, $70c, $80c, $70b
	db -1

.frame2:
	dw $509, $50a, $50b, $608
	dw $60c, $707, $807, $907
	dw $70d, $80d, $90d, $a08
	dw $a0c, $b09, $b0a, $b0b
	db -1

.frame3:
	dw $409, $40a, $40b, $508
	dw $50c, $607, $60d, $706
	dw $806, $906, $70e, $80e
	dw $90e, $a07, $a0d, $b08
	dw $b0c, $c09, $c0a, $c0b
	db -1

.frame4:
	dw $309, $30a, $30b, $408
	dw $507, $606, $40c, $50d
	dw $60e, $705, $805, $905
	dw $70f, $80f, $90f, $a06
	dw $b07, $c08, $a0e, $b0d
	dw $c0c, $d09, $d0a, $d0b
	db -1

.frame5:
	dw $209, $20a, $20b, $308
	dw $407, $506, $605, $30c
	dw $40d, $50e, $60f, $704
	dw $804, $904, $710, $810
	dw $910, $a05, $b06, $c07
	dw $d08, $e09, $e0a, $e0b
	dw $d0c, $c0d, $b0e, $a0f
	db -1

.frame6:
	dw $109, $10a, $10b, $208
	dw $307, $406, $505, $604
	dw $703, $803, $903, $a04
	dw $b05, $c06, $d07, $e08
	dw $f09, $f0a, $f0b, $e0c
	dw $d0d, $c0e, $b0f, $a10
	dw $911, $811, $711, $610
	dw $50f, $40e, $30d, $20c
	db -1

.frame7:
	dw $9, $a, $b, $108
	dw $207, $306, $405, $504
	dw $603, $702, $802, $902
	dw $a03, $b04, $c05, $d06
	dw $e07, $f08, $1009, $100a
	dw $100b, $f0c, $e0d, $d0e
	dw $c0f, $b10, $a11, $912
	dw $812, $712, $611, $510
	dw $40f, $30e, $20d, $10c
	db -1

.frame8:
	dw $8, $107, $206, $305
	dw $404, $503, $602, $701
	dw $801, $901, $a02, $b03
	dw $c04, $d05, $e06, $f07
	dw $1008, $1109, $110a, $110b
	dw $120a, $110b, $100c, $f0d
	dw $e0e, $d0f, $c10, $b11
	dw $a12, $913, $813, $713
	dw $612, $511, $410, $30f
	dw $20e, $10d, $c
	db -1

.frame9:
	dw $7, $106, $205, $304
	dw $403, $502, $601, $700
	dw $800, $900, $a01, $b02
	dw $c03, $d04, $e05, $f06
	dw $1007, $1108, $110c, $100d
	dw $f0e, $e0f, $d10, $c11
	dw $b12, $a13, $613, $512
	dw $411, $310, $20f, $10e
	dw $d
	db -1

.frame10:
	dw $6, $105, $204, $303
	dw $402, $501, $600, $a00
	dw $b01, $c02, $d03, $e04
	dw $f05, $1006, $1107, $110d
	dw $100e, $f0f, $e10, $d11
	dw $c12, $b13, $513, $412
	dw $311, $210, $10f, $e
	db -1

.frame11:
	dw $5, $104, $203, $302
	dw $401, $500, $b00, $c01
	dw $d02, $e03, $f04, $1005
	dw $1106, $110e, $100f, $f10
	dw $e11, $d12, $c13, $413
	dw $312, $211, $110, $f
	db -1

.frame12:
	dw $4, $103, $202, $301
	dw $400, $c00, $d01, $e02
	dw $f03, $1004, $1105, $110f
	dw $1010, $f11, $e12, $d13
	dw $313, $212, $111, $10
	db -1

.frame13:
	dw $3, $102, $201, $300
	dw $d00, $e01, $f02, $1003
	dw $1104, $1110, $1011, $f12
	dw $e13, $213, $112, $11
	db -1

.frame14:
	dw $2, $101, $200, $e00
	dw $f01, $1002, $1103, $1111
	dw $1012, $f13, $113, $12
	db -1

.frame15:
	dw $1, $100, $f00, $1001
	dw $1102, $1112, $1013, $113
	dw $13
	db -1

.frame16:
	dw $0, $1000, $1101, $1113
	db -1

.frame17:
	dw $1100
	db -1

BattleTransition_VerticalLines:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame1
	dw .frame4
	dw .frame1
	dw .frame6
	dw .frame1
	dw .frame8
	dw .frame1
	dw .frame10
	dw .frame1
	dw .frame12
	dw .frame1
	dw .frame14
	dw .frame1
	dw .frame16
	dw .frame1
	dw .frame18
	dw .frame1
	dw .frame20
	dw .frame1
	dw .frame22
	dw .frame1
	dw .frame24
	dw .frame1
	dw .frame26
	dw $0

.frame1:
	db -1

.frame0:
	dw $0, $100, $200, $f01
	dw $1001, $1101, $13, $113
	dw $213, $f12, $1012, $1112
	db -1

.frame2:
	dw $300, $400, $500, $c01
	dw $d01, $e01, $313, $413
	dw $513, $c12, $d12, $e12
	db -1

.frame4:
	dw $600, $700, $800, $901
	dw $a01, $b01, $613, $713
	dw $813, $912, $a12, $b12
	dw $2, $102, $202, $f03
	dw $1003, $1103, $11, $111
	dw $211, $f10, $1010, $1110
	db -1

.frame6:
	dw $900, $a00, $b00, $601
	dw $701, $801, $913, $a13
	dw $b13, $612, $712, $812
	dw $302, $402, $502, $c03
	dw $d03, $e03, $311, $411
	dw $511, $c10, $d10, $e10
	db -1

.frame8:
	dw $c00, $d00, $e00, $301
	dw $401, $501, $c13, $d13
	dw $e13, $312, $412, $512
	dw $602, $702, $802, $903
	dw $a03, $b03, $611, $711
	dw $811, $910, $a10, $b10
	dw $4, $104, $204, $f05
	dw $1005, $1105, $f, $10f
	dw $20f, $f0e, $100e, $110e
	db -1

.frame10:
	dw $f00, $1000, $1100, $1
	dw $101, $201, $f13, $1013
	dw $1113, $12, $112, $212
	dw $902, $a02, $b02, $603
	dw $703, $803, $911, $a11
	dw $b11, $610, $710, $810
	dw $304, $404, $504, $c05
	dw $d05, $e05, $30f, $40f
	dw $50f, $c0e, $d0e, $e0e
	db -1

.frame12:
	dw $c02, $d02, $e02, $303
	dw $403, $503, $c11, $d11
	dw $e11, $310, $410, $510
	dw $604, $704, $804, $905
	dw $a05, $b05, $60f, $70f
	dw $80f, $90e, $a0e, $b0e
	dw $6, $106, $206, $f07
	dw $1007, $1107, $d, $10d
	dw $20d, $f0c, $100c, $110c
	db -1

.frame14:
	dw $f02, $1002, $1102, $3
	dw $103, $203, $f11, $1011
	dw $1111, $10, $110, $210
	dw $904, $a04, $b04, $605
	dw $705, $805, $90f, $a0f
	dw $b0f, $60e, $70e, $80e
	dw $306, $406, $506, $c07
	dw $d07, $e07, $30d, $40d
	dw $50d, $c0c, $d0c, $e0c
	db -1

.frame16:
	dw $c04, $d04, $e04, $305
	dw $405, $505, $c0f, $d0f
	dw $e0f, $30e, $40e, $50e
	dw $606, $706, $806, $907
	dw $a07, $b07, $60d, $70d
	dw $80d, $90c, $a0c, $b0c
	dw $8, $108, $208, $f09
	dw $1009, $1109, $b, $10b
	dw $20b, $f0a, $100a, $110a
	db -1

.frame18:
	dw $f04, $1004, $1104, $5
	dw $105, $205, $f0f, $100f
	dw $110f, $e, $10e, $20e
	dw $906, $a06, $b06, $607
	dw $707, $807, $90d, $a0d
	dw $b0d, $60c, $70c, $80c
	dw $308, $408, $508, $c09
	dw $d09, $e09, $30b, $40b
	dw $50b, $c0a, $d0a, $e0a
	db -1

.frame20:
	dw $c06, $d06, $e06, $307
	dw $407, $507, $c0d, $d0d
	dw $e0d, $30c, $40c, $50c
	dw $608, $708, $808, $909
	dw $a09, $b09, $60b, $70b
	dw $80b, $90a, $a0a, $b0a
	db -1

.frame22:
	dw $f06, $1006, $1106, $7
	dw $107, $207, $f0d, $100d
	dw $110d, $c, $10c, $20c
	dw $908, $a08, $b08, $609
	dw $709, $809, $90b, $a0b
	dw $b0b, $60a, $70a, $80a
	db -1

.frame24:
	dw $c08, $d08, $e08, $309
	dw $409, $509, $c0b, $d0b
	dw $e0b, $30a, $40a, $50a
	db -1

.frame26:
	dw $f08, $1008, $1108, $9
	dw $109, $209, $f0b, $100b
	dw $110b, $a, $10a, $20a
	db -1

BattleTransition_DiagonalCheckerboard:
	dw .frame0
	dw .frame1
	dw .frame2
	dw .frame1
	dw .frame4
	dw .frame1
	dw .frame6
	dw .frame1
	dw .frame8
	dw .frame1
	dw .frame10
	dw .frame1
	dw .frame12
	dw .frame1
	dw .frame14
	dw .frame1
	dw .frame16
	dw .frame1
	dw .frame18
	dw .frame1
	dw .frame20
	dw .frame1
	dw .frame22
	dw .frame1
	dw .frame24
	dw .frame1
	dw .frame26
	dw .frame1
	dw .frame28
	dw .frame1
	dw .frame30
	dw .frame1
	dw .frame32
	dw .frame1
	dw .frame34
	dw .frame1
	dw .frame36
	dw $0

.frame1:
	db -1

.frame0:
	dw $13, $1000, $1101
	db -1

.frame2:
	dw $11, $112, $213, $e00
	dw $f01, $1002, $1103
	db -1

.frame4:
	dw $f, $110, $211, $312
	dw $413, $c00, $d01, $e02
	dw $f03, $1004, $1105
	db -1

.frame6:
	dw $a00, $b01, $c02, $d03
	dw $e04, $f05, $1006, $1107
	dw $d, $10e, $20f, $310
	dw $411, $512, $613
	db -1

.frame8:
	dw $800, $901, $a02, $b03
	dw $c04, $d05, $e06, $f07
	dw $1008, $1109, $b, $10c
	dw $20d, $30e, $40f, $510
	dw $611, $712, $813
	db -1

.frame10:
	dw $600, $701, $802, $903
	dw $a04, $b05, $c06, $d07
	dw $e08, $f09, $100a, $110b
	dw $9, $10a, $20b, $30c
	dw $40d, $50e, $60f, $710
	dw $811, $912, $a13
	db -1

.frame12:
	dw $400, $501, $602, $703
	dw $804, $905, $a06, $b07
	dw $c08, $d09, $e0a, $f0b
	dw $100c, $110d, $7, $108
	dw $209, $30a, $40b, $50c
	dw $60d, $70e, $80f, $910
	dw $a11, $b12, $c13
	db -1

.frame14:
	dw $200, $301, $402, $503
	dw $604, $705, $806, $907
	dw $a08, $b09, $c0a, $d0b
	dw $e0c, $f0d, $100e, $110f
	dw $5, $106, $207, $308
	dw $409, $50a, $60b, $70c
	dw $80d, $90e, $a0f, $b10
	dw $c11, $d12, $e13
	db -1

.frame16:
	dw $0, $101, $202, $303
	dw $404, $505, $606, $707
	dw $808, $909, $a0a, $b0b
	dw $c0c, $d0d, $e0e, $f0f
	dw $1010, $1111, $3, $104
	dw $205, $306, $407, $508
	dw $609, $70a, $80b, $90c
	dw $a0d, $b0e, $c0f, $d10
	dw $e11, $f12, $1013
	db -1

.frame18:
	dw $1, $102, $203, $304
	dw $405, $506, $607, $708
	dw $809, $90a, $a0b, $b0c
	dw $c0d, $d0e, $e0f, $f10
	dw $1011, $1112, $2, $103
	dw $204, $305, $406, $507
	dw $608, $709, $80a, $90b
	dw $a0c, $b0d, $c0e, $d0f
	dw $e10, $f11, $1012, $1113
	db -1

.frame20:
	dw $100, $201, $302, $403
	dw $504, $605, $706, $807
	dw $908, $a09, $b0a, $c0b
	dw $d0c, $e0d, $f0e, $100f
	dw $1110, $4, $105, $206
	dw $307, $408, $509, $60a
	dw $70b, $80c, $90d, $a0e
	dw $b0f, $c10, $d11, $e12
	dw $f13
	db -1

.frame22:
	dw $300, $401, $502, $603
	dw $704, $805, $906, $a07
	dw $b08, $c09, $d0a, $e0b
	dw $f0c, $100d, $110e, $6
	dw $107, $208, $309, $40a
	dw $50b, $60c, $70d, $80e
	dw $90f, $a10, $b11, $c12
	dw $d13
	db -1

.frame24:
	dw $500, $601, $702, $803
	dw $904, $a05, $b06, $c07
	dw $d08, $e09, $f0a, $100b
	dw $110c, $8, $109, $20a
	dw $30b, $40c, $50d, $60e
	dw $70f, $810, $911, $a12
	dw $b13
	db -1

.frame26:
	dw $700, $801, $902, $a03
	dw $b04, $c05, $d06, $e07
	dw $f08, $1009, $110a, $a
	dw $10b, $20c, $30d, $40e
	dw $50f, $610, $711, $812
	dw $913
	db -1

.frame28:
	dw $900, $a01, $b02, $c03
	dw $d04, $e05, $f06, $1007
	dw $1108, $c, $10d, $20e
	dw $30f, $410, $511, $612
	dw $713
	db -1

.frame30:
	dw $b00, $c01, $d02, $e03
	dw $f04, $1005, $1106, $e
	dw $10f, $210, $311, $412
	dw $513
	db -1

.frame32:
	dw $d00, $e01, $f02, $1003
	dw $1104, $10, $111, $212
	dw $313
	db -1

.frame34:
	dw $f00, $1001, $1102, $12
	dw $113
	db -1

.frame36:
	dw $1100
	db -1

unk_02d_6d77:
    dr $b2d77, $b3e8a

