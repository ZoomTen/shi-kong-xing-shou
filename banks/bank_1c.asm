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
TileAnimGroupPointers::
	dw TileAnimMaps_Group0
	dw TileAnimMaps_Group0
	dw TileAnimMaps_Group2
	dw TileAnimMaps_Group3
	dw TileAnimMaps_Group4
	dw TileAnimMaps_Group5
	dw TileAnimMaps_Group6
	dw TileAnimMaps_Group7
TileAnimMaps_Group0::
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40ea
	dw TileAnimList_01c_40ea
	dw TileAnimList_01c_4176
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4295
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4440
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_43b4
	dw TileAnimList_01c_44cc
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_46f5
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4202
	dw TileAnimList_01c_4202
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4176
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_43ac
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
TileAnimList_01c_40e9::
	db -1
TileAnimList_01c_40ea::
	tileanim $40, 2, $9190, TileAnimFrames_01c_40f2
	db -1
TileAnimFrames_01c_40f2::
	dw TileAnimGFX_01c_40f6
	dw TileAnimGFX_01c_40f6 + $40
TileAnimGFX_01c_40f6::
	INCBIN "gfx/tileanim/tileanim_01c_40f6.2bpp"
TileAnimList_01c_4176::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_417e
	db -1
TileAnimFrames_01c_417e::
	dw TileAnimGFX_01c_4182
	dw TileAnimGFX_01c_4182 + $40
TileAnimGFX_01c_4182::
	INCBIN "gfx/tileanim/tileanim_01c_4182.2bpp"
TileAnimList_01c_4202::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_417e
	tileanim $40, 2, $93e0, TileAnimFrames_01c_4211
	db -1
TileAnimFrames_01c_4211::
	dw TileAnimGFX_01c_4215
	dw TileAnimGFX_01c_4215 + $40
TileAnimGFX_01c_4215::
	INCBIN "gfx/tileanim/tileanim_01c_4215.2bpp"
TileAnimList_01c_4295::
	tileanim $40, 2, $92f0, TileAnimFrames_01c_42a4
	tileanim $40, 2, $93b0, TileAnimFrames_01c_4328
	db -1
TileAnimFrames_01c_42a4::
	dw TileAnimGFX_01c_42a8
	dw TileAnimGFX_01c_42a8 + $40
TileAnimGFX_01c_42a8::
	INCBIN "gfx/tileanim/tileanim_01c_42a8.2bpp"
TileAnimFrames_01c_4328::
	dw TileAnimGFX_01c_432c
	dw TileAnimGFX_01c_432c + $40
TileAnimGFX_01c_432c::
	INCBIN "gfx/tileanim/tileanim_01c_432c.2bpp"
TileAnimList_01c_43ac::
	tileanim $40, 2, $92f0, TileAnimFrames_01c_42a4
	db -1
TileAnimList_01c_43b4::
	tileanim $40, 2, $91c0, TileAnimFrames_01c_43bc
	db -1
TileAnimFrames_01c_43bc::
	dw TileAnimGFX_01c_43c0
	dw TileAnimGFX_01c_43c0 + $40
TileAnimGFX_01c_43c0::
	INCBIN "gfx/tileanim/tileanim_01c_43c0.2bpp"
TileAnimList_01c_4440::
	tileanim $40, 2, $9380, TileAnimFrames_01c_4448
	db -1
TileAnimFrames_01c_4448::
	dw TileAnimGFX_01c_444c
	dw TileAnimGFX_01c_444c + $40
TileAnimGFX_01c_444c::
	INCBIN "gfx/tileanim/tileanim_01c_444c.2bpp"
TileAnimList_01c_44cc::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_417e
	tileanim $60, 2, $9360, TileAnimFrames_01c_44e9
	tileanim $40, 2, $93c0, TileAnimFrames_01c_44ed
	tileanim $60, 2, $9400, TileAnimFrames_01c_44f1
	db -1
TileAnimFrames_01c_44e9::
	dw TileAnimGFX_01c_44f5
	dw TileAnimGFX_01c_44f5 + $60
TileAnimFrames_01c_44ed::
	dw TileAnimGFX_01c_44f5 + $c0
	dw TileAnimGFX_01c_44f5 + $100
TileAnimFrames_01c_44f1::
	dw TileAnimGFX_01c_44f5 + $140
	dw TileAnimGFX_01c_44f5 + $1a0
TileAnimGFX_01c_44f5::
	INCBIN "gfx/tileanim/tileanim_01c_44f5.2bpp"
TileAnimList_01c_46f5::
	tileanim $40, 2, $9210, TileAnimFrames_01c_46fd
	db -1
TileAnimFrames_01c_46fd::
	dw TileAnimGFX_01c_4701
	dw TileAnimGFX_01c_4701 + $40
TileAnimGFX_01c_4701::
	INCBIN "gfx/tileanim/tileanim_01c_4701.2bpp"
TileAnimMaps_Group2::
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4a6b
	dw TileAnimList_01c_4af7
	dw TileAnimList_01c_4d25
	dw TileAnimList_01c_4d25
	dw TileAnimList_01c_4d25
	dw TileAnimList_01c_4e3c
	dw TileAnimList_01c_4e3c
	dw TileAnimList_01c_4176
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4b83
	dw TileAnimList_01c_4b83
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
TileAnimList_01c_47c9::
	tileanim $40, 2, $9210, TileAnimFrames_01c_47df
	tileanim $80, 2, $9520, TileAnimFrames_01c_47e3
	tileanim $80, 2, $95a0, TileAnimFrames_01c_47e7
	db -1
TileAnimFrames_01c_47df::
	dw TileAnimGFX_01c_47eb
	dw TileAnimGFX_01c_47eb + $40
TileAnimFrames_01c_47e3::
	dw TileAnimGFX_01c_47eb + $80
	dw TileAnimGFX_01c_47eb + $100
TileAnimFrames_01c_47e7::
	dw TileAnimGFX_01c_47eb + $180
	dw TileAnimGFX_01c_47eb + $200
TileAnimGFX_01c_47eb::
	INCBIN "gfx/tileanim/tileanim_01c_47eb.2bpp"
TileAnimList_01c_4a6b::
	tileanim $40, 2, $90b0, TileAnimFrames_01c_4a73
	db -1
TileAnimFrames_01c_4a73::
	dw TileAnimGFX_01c_4a77
	dw TileAnimGFX_01c_4a77 + $40
TileAnimGFX_01c_4a77::
	INCBIN "gfx/tileanim/tileanim_01c_4a77.2bpp"
TileAnimList_01c_4af7::
	tileanim $40, 2, $91b0, TileAnimFrames_01c_4aff
	db -1
TileAnimFrames_01c_4aff::
	dw TileAnimGFX_01c_4b03
	dw TileAnimGFX_01c_4b03 + $40
TileAnimGFX_01c_4b03::
	INCBIN "gfx/tileanim/tileanim_01c_4b03.2bpp"
TileAnimList_01c_4b83::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_4b99
	tileanim $40, 2, $94f0, TileAnimFrames_01c_4b9d
	tileanim $40, 2, $93e0, TileAnimFrames_01c_4ba1
	db -1
TileAnimFrames_01c_4b99::
	dw TileAnimGFX_01c_4ba5
	dw TileAnimGFX_01c_4ba5 + $40
TileAnimFrames_01c_4b9d::
	dw TileAnimGFX_01c_4ba5 + $80
	dw TileAnimGFX_01c_4ba5 + $c0
TileAnimFrames_01c_4ba1::
	dw TileAnimGFX_01c_4ba5 + $100
	dw TileAnimGFX_01c_4ba5 + $140
TileAnimGFX_01c_4ba5::
	INCBIN "gfx/tileanim/tileanim_01c_4ba5.2bpp"
TileAnimList_01c_4d25::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_4d34
	tileanim $40, 2, $9170, TileAnimFrames_01c_4d38
	db -1
TileAnimFrames_01c_4d34::
	dw TileAnimGFX_01c_4d3c
	dw TileAnimGFX_01c_4d3c + $40
TileAnimFrames_01c_4d38::
	dw TileAnimGFX_01c_4d3c + $80
	dw TileAnimGFX_01c_4d3c + $c0
TileAnimGFX_01c_4d3c::
	INCBIN "gfx/tileanim/tileanim_01c_4d3c.2bpp"
TileAnimList_01c_4e3c::
	tileanim $40, 2, $9340, TileAnimFrames_01c_4e4b
	tileanim $40, 2, $9110, TileAnimFrames_01c_4e4f
	db -1
TileAnimFrames_01c_4e4b::
	dw TileAnimGFX_01c_4e53
	dw TileAnimGFX_01c_4e53 + $40
TileAnimFrames_01c_4e4f::
	dw TileAnimGFX_01c_4e53 + $80
	dw TileAnimGFX_01c_4e53 + $c0
TileAnimGFX_01c_4e53::
	INCBIN "gfx/tileanim/tileanim_01c_4e53.2bpp"
TileAnimMaps_Group3::
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4f9b
	dw TileAnimList_01c_4f9b
	dw TileAnimList_01c_4f9b
	dw TileAnimList_01c_5027
	dw TileAnimList_01c_5027
	dw TileAnimList_01c_5027
	dw TileAnimList_01c_4a6b
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_50b3
	dw TileAnimList_01c_50b3
	dw TileAnimList_01c_50b3
	dw TileAnimList_01c_50b3
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_50ff
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_5216
	dw TileAnimList_01c_5216
	dw TileAnimList_01c_5216
	dw TileAnimList_01c_4b83
	dw TileAnimList_01c_4b83
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4f9b
	dw TileAnimList_01c_5027
	dw TileAnimList_01c_5216
	dw TileAnimList_01c_5216
	dw TileAnimList_01c_5216
TileAnimList_01c_4f9b::
	tileanim $40, 2, $8940, TileAnimFrames_01c_4fa3
	db -1
TileAnimFrames_01c_4fa3::
	dw TileAnimGFX_01c_4fa7
	dw TileAnimGFX_01c_4fa7 + $40
TileAnimGFX_01c_4fa7::
	INCBIN "gfx/tileanim/tileanim_01c_4fa7.2bpp"
TileAnimList_01c_5027::
	tileanim $40, 2, $8920, TileAnimFrames_01c_502f
	db -1
TileAnimFrames_01c_502f::
	dw TileAnimGFX_01c_5033
	dw TileAnimGFX_01c_5033 + $40
TileAnimGFX_01c_5033::
	INCBIN "gfx/tileanim/tileanim_01c_5033.2bpp"
TileAnimList_01c_50b3::
	tileanim $20, 2, $9220, TileAnimFrames_01c_50bb
	db -1
TileAnimFrames_01c_50bb::
	dw TileAnimGFX_01c_50bf
	dw TileAnimGFX_01c_50bf + $20
TileAnimGFX_01c_50bf::
	INCBIN "gfx/tileanim/tileanim_01c_50bf.2bpp"
TileAnimList_01c_50ff::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_510e
	tileanim $40, 2, $93e0, TileAnimFrames_01c_5112
	db -1
TileAnimFrames_01c_510e::
	dw TileAnimGFX_01c_5116
	dw TileAnimGFX_01c_5116 + $40
TileAnimFrames_01c_5112::
	dw TileAnimGFX_01c_5116 + $80
	dw TileAnimGFX_01c_5116 + $c0
TileAnimGFX_01c_5116::
	INCBIN "gfx/tileanim/tileanim_01c_5116.2bpp"
TileAnimList_01c_5216::
	tileanim $40, 2, $9630, TileAnimFrames_01c_521e
	db -1
TileAnimFrames_01c_521e::
	dw TileAnimGFX_01c_5222
	dw TileAnimGFX_01c_5222 + $40
TileAnimGFX_01c_5222::
	INCBIN "gfx/tileanim/tileanim_01c_5222.2bpp"
TileAnimMaps_Group4::
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_54d0
	dw TileAnimList_01c_54d0
	dw TileAnimList_01c_54d0
	dw TileAnimList_01c_54d0
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_5673
	dw TileAnimList_01c_5673
	dw TileAnimList_01c_5673
	dw TileAnimList_01c_5673
	dw TileAnimList_01c_5673
	dw TileAnimList_01c_40ea
	dw TileAnimList_01c_56ff
	dw TileAnimList_01c_5893
	dw TileAnimList_01c_59aa
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_5b5b
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4295
	dw TileAnimList_01c_4e3c
	dw TileAnimList_01c_4e3c
	dw TileAnimList_01c_5c39
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_55e7
	dw TileAnimList_01c_55e7
	dw TileAnimList_01c_55e7
	dw TileAnimList_01c_55e7
	dw TileAnimList_01c_4b83
	dw TileAnimList_01c_56ff
	dw TileAnimList_01c_5b5b
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_4af7
	dw TileAnimList_01c_4af7
	dw TileAnimList_01c_4af7
	dw TileAnimList_01c_536e
	dw TileAnimList_01c_536e
	dw TileAnimList_01c_50ff
	dw TileAnimList_01c_4176
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_50ff
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_56ff
	dw TileAnimList_01c_40ea
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_5acf
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_5c39
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_536e
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_50ff
	dw TileAnimList_01c_4176
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_50ff
	dw TileAnimList_01c_40e9
TileAnimList_01c_536e::
	tileanim $40, 2, $91d0, TileAnimFrames_01c_5384
	tileanim $40, 2, $9390, TileAnimFrames_01c_5388
	tileanim $20, 2, $94a0, TileAnimFrames_01c_538c
	db -1
TileAnimFrames_01c_5384::
	dw TileAnimGFX_01c_5390
	dw TileAnimGFX_01c_5390 + $40
TileAnimFrames_01c_5388::
	dw TileAnimGFX_01c_5390 + $80
	dw TileAnimGFX_01c_5390 + $c0
TileAnimFrames_01c_538c::
	dw TileAnimGFX_01c_5390 + $100
	dw TileAnimGFX_01c_5390 + $120
TileAnimGFX_01c_5390::
	INCBIN "gfx/tileanim/tileanim_01c_5390.2bpp"
TileAnimList_01c_54d0::
	tileanim $40, 2, $9290, TileAnimFrames_01c_54df
	tileanim $40, 2, $92d0, TileAnimFrames_01c_54e3
	db -1
TileAnimFrames_01c_54df::
	dw TileAnimGFX_01c_54e7
	dw TileAnimGFX_01c_54e7 + $40
TileAnimFrames_01c_54e3::
	dw TileAnimGFX_01c_54e7 + $80
	dw TileAnimGFX_01c_54e7 + $c0
TileAnimGFX_01c_54e7::
	INCBIN "gfx/tileanim/tileanim_01c_54e7.2bpp"
TileAnimList_01c_55e7::
	tileanim $40, 2, $93c0, TileAnimFrames_01c_55ef
	db -1
TileAnimFrames_01c_55ef::
	dw TileAnimGFX_01c_55f3
	dw TileAnimGFX_01c_55f3 + $40
TileAnimGFX_01c_55f3::
	INCBIN "gfx/tileanim/tileanim_01c_55f3.2bpp"
TileAnimList_01c_5673::
	tileanim $40, 2, $9220, TileAnimFrames_01c_567b
	db -1
TileAnimFrames_01c_567b::
	dw TileAnimGFX_01c_567f
	dw TileAnimGFX_01c_567f + $40
TileAnimGFX_01c_567f::
	INCBIN "gfx/tileanim/tileanim_01c_567f.2bpp"
TileAnimList_01c_56ff::
	tileanim $40, 6, $91e0, TileAnimFrames_01c_5707
	db -1
TileAnimFrames_01c_5707::
	dw TileAnimGFX_01c_5713
	dw TileAnimGFX_01c_5713 + $40
	dw TileAnimGFX_01c_5713 + $80
	dw TileAnimGFX_01c_5713 + $c0
	dw TileAnimGFX_01c_5713 + $100
	dw TileAnimGFX_01c_5713 + $140
TileAnimGFX_01c_5713::
	INCBIN "gfx/tileanim/tileanim_01c_5713.2bpp"
TileAnimList_01c_5893::
	tileanim $40, 2, $91b0, TileAnimFrames_01c_58a2
	tileanim $40, 2, $92f0, TileAnimFrames_01c_58a6
	db -1
TileAnimFrames_01c_58a2::
	dw TileAnimGFX_01c_58aa
	dw TileAnimGFX_01c_58aa + $40
TileAnimFrames_01c_58a6::
	dw TileAnimGFX_01c_58aa + $80
	dw TileAnimGFX_01c_58aa + $c0
TileAnimGFX_01c_58aa::
	INCBIN "gfx/tileanim/tileanim_01c_58aa.2bpp"
TileAnimList_01c_59aa::
	tileanim $40, 2, $91b0, TileAnimFrames_01c_58a2
	tileanim $40, 2, $92f0, TileAnimFrames_01c_58a6
	tileanim $40, 2, $9540, TileAnimFrames_01c_59c7
	tileanim $40, 2, $95f0, TileAnimFrames_01c_59cb
	db -1
TileAnimFrames_01c_59c7::
	dw TileAnimGFX_01c_59cf
	dw TileAnimGFX_01c_59cf + $40
TileAnimFrames_01c_59cb::
	dw TileAnimGFX_01c_59cf + $80
	dw TileAnimGFX_01c_59cf + $c0
TileAnimGFX_01c_59cf::
	INCBIN "gfx/tileanim/tileanim_01c_59cf.2bpp"
TileAnimList_01c_5acf::
	tileanim $40, 2, $9370, TileAnimFrames_01c_5ad7
	db -1
TileAnimFrames_01c_5ad7::
	dw TileAnimGFX_01c_5adb
	dw TileAnimGFX_01c_5adb + $40
TileAnimGFX_01c_5adb::
	INCBIN "gfx/tileanim/tileanim_01c_5adb.2bpp"
TileAnimList_01c_5b5b::
	tileanim $40, 6, $91e0, TileAnimFrames_01c_5707
	tileanim $40, 2, $9230, TileAnimFrames_01c_5b71
	tileanim $20, 2, $9290, TileAnimFrames_01c_5b75
	db -1
TileAnimFrames_01c_5b71::
	dw TileAnimGFX_01c_5b79
	dw TileAnimGFX_01c_5b79 + $40
TileAnimFrames_01c_5b75::
	dw TileAnimGFX_01c_5b79 + $80
	dw TileAnimGFX_01c_5b79 + $a0
TileAnimGFX_01c_5b79::
	INCBIN "gfx/tileanim/tileanim_01c_5b79.2bpp"
TileAnimList_01c_5c39::
	tileanim $20, 5, $9110, TileAnimFrames_01c_5c41
	db -1
TileAnimFrames_01c_5c41::
	dw TileAnimGFX_01c_5c4b
	dw TileAnimGFX_01c_5c4b + $20
	dw TileAnimGFX_01c_5c4b + $40
	dw TileAnimGFX_01c_5c4b + $60
	dw TileAnimGFX_01c_5c4b + $80
TileAnimGFX_01c_5c4b::
	INCBIN "gfx/tileanim/tileanim_01c_5c4b.2bpp"
TileAnimMaps_Group5::
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_5d3b
	dw TileAnimList_01c_5d3b
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4a6b
	dw TileAnimList_01c_5dc7
	dw TileAnimList_01c_5dc7
	dw TileAnimList_01c_5dc7
	dw TileAnimList_01c_5dc7
	dw TileAnimList_01c_5dc7
	dw TileAnimList_01c_5dc7
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_4af7
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4b83
	dw TileAnimList_01c_4b83
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40ea
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_56ff
TileAnimList_01c_5d3b::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_5d43
	db -1
TileAnimFrames_01c_5d43::
	dw TileAnimGFX_01c_5d47
	dw TileAnimGFX_01c_5d47 + $40
TileAnimGFX_01c_5d47::
	INCBIN "gfx/tileanim/tileanim_01c_5d47.2bpp"
TileAnimList_01c_5dc7::
	tileanim $80, 2, $9540, TileAnimFrames_01c_5dd6
	tileanim $80, 2, $95c0, TileAnimFrames_01c_5dda
	db -1
TileAnimFrames_01c_5dd6::
	dw TileAnimGFX_01c_5dde
	dw TileAnimGFX_01c_5dde + $80
TileAnimFrames_01c_5dda::
	dw TileAnimGFX_01c_5dde + $100
	dw TileAnimGFX_01c_5dde + $180
TileAnimGFX_01c_5dde::
	INCBIN "gfx/tileanim/tileanim_01c_5dde.2bpp"
TileAnimMaps_Group6::
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_4e3c
	dw TileAnimList_01c_4e3c
	dw TileAnimList_01c_46f5
	dw TileAnimList_01c_46f5
	dw TileAnimList_01c_46f5
	dw TileAnimList_01c_46f5
	dw TileAnimList_01c_46f5
	dw TileAnimList_01c_6038
	dw TileAnimList_01c_6038
	dw TileAnimList_01c_6038
	dw TileAnimList_01c_6038
	dw TileAnimList_01c_4295
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_61bc
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_60a4
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_60a4
	dw TileAnimList_01c_60a4
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_47c9
	dw TileAnimList_01c_40e9
TileAnimList_01c_6038::
	tileanim $30, 2, $9060, TileAnimFrames_01c_6040
	db -1
TileAnimFrames_01c_6040::
	dw TileAnimGFX_01c_6044
	dw TileAnimGFX_01c_6044 + $30
TileAnimGFX_01c_6044::
	INCBIN "gfx/tileanim/tileanim_01c_6044.2bpp"
TileAnimList_01c_60a4::
	tileanim $40, 2, $91d0, TileAnimFrames_01c_60ac
	db -1
TileAnimFrames_01c_60ac::
	dw TileAnimGFX_01c_60b0
	dw TileAnimGFX_01c_60b0 + $40
TileAnimGFX_01c_60b0::
	INCBIN "gfx/tileanim/tileanim_01c_60b0.2bpp"
TileAnimList_01c_6130::
	tileanim $40, 2, $9240, TileAnimFrames_01c_6138
	db -1
TileAnimFrames_01c_6138::
	dw TileAnimGFX_01c_613c
	dw TileAnimGFX_01c_58aa + $40
TileAnimGFX_01c_613c::
	INCBIN "gfx/tileanim/tileanim_01c_613c.2bpp"
TileAnimList_01c_61bc::
	tileanim $40, 2, $90d0, TileAnimFrames_01c_61c4
	db -1
TileAnimFrames_01c_61c4::
	dw TileAnimGFX_01c_61c8
	dw TileAnimGFX_01c_61c8 + $40
TileAnimGFX_01c_61c8::
	INCBIN "gfx/tileanim/tileanim_01c_61c8.2bpp"
TileAnimMaps_Group7::
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40ea
	dw TileAnimList_01c_56ff
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_536e
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_40e9
	dw TileAnimList_01c_5b5b
	dw TileAnimList_01c_40e9
	dw 0


