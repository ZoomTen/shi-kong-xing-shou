unk_024_4000:
	dr $90000, $90053

Func_024_4053:
	ld de, unk_024_6d77
	ld a, [wd9bf]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wd9bf], a
	ret

Func_024_4062:
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_406b
	ld a, c
	cp $04
	jr c, .asm_407c
	push hl
	ld a, [hli]
	cp $60
	jr nc, .asm_4081
	ld a, [hli]
	cp $70
	jr c, .asm_4081
	pop hl
.asm_407c
	ld a, $a0
	ld [hl], a
	jr .asm_4082
.asm_4081
	pop hl
.asm_4082
	add hl, de
	dec c
	jr nz, .asm_406b
	call Func_024_6c42
	ret
Func_024_408a:
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_4093
	ld a, c
	cp $0c
	jr c, .asm_40a4
	push hl
	ld a, [hli]
	cp $60
	jr nc, .asm_40a9
	ld a, [hli]
	cp $70
	jr c, .asm_40a9
	pop hl
.asm_40a4
	ld a, $a0
	ld [hl], a
	jr .asm_40aa
.asm_40a9
	pop hl
.asm_40aa
	add hl, de
	dec c
	jr nz, .asm_4093
	call Func_024_6c42
	call Func_024_6c09
	call Func_024_6bd0
	ret
Func_024_40b8:
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_40c1
	ld a, c
	cp $08
	jr c, .asm_40d2
	push hl
	ld a, [hli]
	cp $60
	jr nc, .asm_40d7
	ld a, [hli]
	cp $70
	jr c, .asm_40d7
	pop hl
.asm_40d2
	ld a, $a0
	ld [hl], a
	jr .asm_40d8
.asm_40d7
	pop hl
.asm_40d8
	add hl, de
	dec c
	jr nz, .asm_40c1
	call Func_024_6c42
	call Func_024_6c09
	ret
Func_024_40e3:
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_40ec
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_40ec
	call Func_024_6c42
	call Func_024_6c7b
	call Func_024_6cb4
	ret

Func_024_40fd::
; Start menu related
	ld a, [_BANKNUM]
	ld [wd9f1], a
	ld a, [wd087]
	cp 1
	jr z, .asm_4111
	cp 2
	jr z, .asm_4129
	jp Func_024_4804

.asm_4111:
	ld de, unk_024_4130
	ldh a, [hFFC5]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd088], a
	ld a, [hli]
	ld [wd089], a
	ld a, 2
	ld [wd087], a
	ret

.asm_4129
	farcall Func_025_424e
	ret

unk_024_4130:
	dw unk_024_4162
	dw unk_024_4162
	dw unk_024_4181
	dw $41b7
	dw $41cb
	dw $41e3
	dw $41ec
	dw $420a
	dw $4208
	dw $42a5
	dw $42bb
	dw $42cb
	dw $42fa
	dw $430e
	dw $432e
	dw $4343
	dw $4355
	dw $438b
	dw $43af
	dw $4404
	dw $4421
	dw $449d
	dw $4509
	dw $453f
	dw $4304

unk_024_4162:
	dr $90162, $90181

unk_024_4181:
	dr $90181, $901c1
unk_024_41c1:
	dr $901c1, $902a5
unk_024_42a5:
	dr $902a5, $9054c
unk_024_454c:
	dr $9054c, $9054e
unk_024_454e:
	dr $9054e, $90553
unk_024_4553:
	dr $90553, $90564
unk_024_4564:
	dr $90564, $90589
unk_024_4589:
	dr $90589, $905a0
unk_024_45a0:
	dr $905a0, $905b0
unk_024_45b0:
	dr $905b0, $905c2
unk_024_45c2:
	dr $905c2, $905d1
unk_024_45d1:
	dr $905d1, $905e8
unk_024_45e8:
	dr $905e8, $90601
unk_024_4601:
	dr $90601, $9060f
unk_024_460f:
	dr $9060f, $9061d
unk_024_461d:
	dr $9061d, $9062b
unk_024_462b:
	dr $9062b, $90642
unk_024_4642:
	dr $90642, $90650
unk_024_4650:
	dr $90650, $90652
unk_024_4652:
	dr $90652, $90664
unk_024_4664:
	dr $90664, $9066d
unk_024_466d:
	dr $9066d, $9067d
unk_024_467d:
	dr $9067d, $906bf
unk_024_46bf:
	dr $906bf, $906cb
unk_024_46cb:
	dr $906cb, $906f5
unk_024_46f5:
	dr $906f5, $9071d
unk_024_471d:
	dr $9071d, $9073b
unk_024_473b:
	dr $9073b, $9075c
unk_024_475c:
	dr $9075c, $90771
unk_024_4771:
	dr $90771, $90775
unk_024_4775:
	dr $90775, $90792
unk_024_4792:
	dr $90792, $907bb
unk_024_47bb:
	dr $907bb, $90804

Func_024_4804:
	ld de, MenuStateJumptable
	ldh a, [hFFC5]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
MenuStateJumptable:
	dw Func_024_6ac8.loop
	dw Func_024_6ac8.loop
	dw Func_024_696d
	dw Func_024_66f8
	dw Func_024_6603
	dw Func_024_655a
	dw Func_024_64a9
	dw Func_024_6328
	dw Func_024_63a4
	dw Func_024_6099
	dw Func_024_5a49
	dw Func_024_5405
	dw Func_024_5330
	dw Func_024_5277
	dw Func_024_519d
	dw Func_024_503e
	dw Func_024_4ed9
	dw Func_024_4d77
	dw Func_024_4c48
	dw Func_024_4c08
	dw Func_024_4b04
	dw Func_024_4a87
	dw Func_024_48bd
	dw Func_024_4844
	dw Func_024_5398
Func_024_4844:
.asm_4844
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4859
	call .asm_485d
	jr .asm_4844
.asm_4859
	xor a
	ldh [hFFC6], a
	ret
.asm_485d
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_467d)
	inc hl
	ld [hl], HIGH(unk_024_467d)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ld [hFFC5], a
	call Func_024_694c
	ld hl, wcdf8
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, wcdf0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
unk_024_4893:
	dr $90893, $908bd
Func_024_48bd:
.asm_48bd
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_48d2
	call .asm_48d6
	jr .asm_48bd
.asm_48d2
	xor a
	ldh [hFFC6], a
	ret
.asm_48d6
	ld a, [wd9d9]
	and a
	jp z, .asm_495f
	call Func_024_6aab
	ld a, [wSelectedOption]
	swap a
	add $78
	ld hl, wcde0
	ld [hli], a
	ld a, $86
	ld [hli], a
	ld a, $01
	ld [hli], a
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4902
	ld a, [wSelectedOption]
	cp $01
	ret z
	inc a
	ld [wSelectedOption], a
	ret
.asm_4902
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4912
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
	ret
.asm_4912
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_4957
	ld a, [wSelectedOption]
	and a
	jr z, .asm_493b
.asm_491e
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_47bb)
	inc hl
	ld [hl], HIGH(unk_024_47bb)
	xor a
	ld [wd08a], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $15
	ldh [hFFC5], a
	ret
.asm_493b
	call WriteSaveData
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $16
	ldh [hFFC5], a
	xor a
	ld [wd9d9], a
	call Func_024_5ffb
	ret
.asm_4957
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	jp .asm_491e
.asm_495f
	ldh a, [hJoypadPressed]
	and $03
	ret z
	jp Func_024_6a71
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
	ld de, sa430
	ld hl, wddb0
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
	ld hl, wd9dd
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
	ld hl, wdb20 + $17C
	ld bc, $0010
	call CopyBytes3
	ld de, sEventFlags
	ld hl, wEventFlags
	ld bc, $0040
	call CopyBytes3
	ld de, sa6db
	ld hl, wdb20
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
Func_024_4a87:
	call Func_024_40e3
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4a9f
	call Func_024_6aab
	call .asm_4aa3
	jr Func_024_4a87
.asm_4a9f
	xor a
	ldh [hFFC6], a
	ret
.asm_4aa3
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4ab5
	ld a, [wSelectedOption]
	cp $01
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_4ac4
.asm_4ab5
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4acf
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_4ac4
	ld a, [wSelectedOption]
	swap a
	add $78
	ld [wcde0], a
	ret
.asm_4acf
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, Func_024_6a61
	ld a, [wSelectedOption]
	and a
	jp nz, Func_024_6a71
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $16
	ldh [hFFC5], a
	call Func_024_5ffb
	call Func_024_6022
	call SRAMTest_Fast
	ld b, a
	ld a, $01
	sub b
	ld [wd9d9], a
	and a
	ret nz
	call WriteSaveData
	ret
Func_024_4b04:
.asm_4b04
	call Func_024_40e3
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4b1c
	call .asm_4b20
	call .asm_4b3d
	jr .asm_4b04
.asm_4b1c
	xor a
	ldh [hFFC6], a
	ret
.asm_4b20
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld bc, wcdf0
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4b35
	ld a, [bc]
	dec a
	ld [bc], a
	jr .asm_4b38
.asm_4b35
	ld a, [bc]
	inc a
	ld [bc], a
.asm_4b38
	ld a, $09
	sub [hl]
	ld [hl], a
	ret
.asm_4b3d
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4b4e
	ld a, $11
	call PlaySound
	call NextLivePartyMon
	jr .asm_4b5f
.asm_4b4d
	ret
.asm_4b4e
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4b91
	ld a, $11
	call PlaySound
	call PrevLivePartyMon
	jr .asm_4b5f
.asm_4b5e
	ret
.asm_4b5f
	ld de, unk_024_4be8
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, [hli]
	ld bc, wcdf8
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_454e)
	inc hl
	ld [hl], HIGH(unk_024_454e)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_4b91
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_4bc0
	ld a, $11
	call PlaySound
	ld a, [wSelectedOption]
	ld [wd9dd], a
	call unk_024_4000
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4564)
	inc hl
	ld [hl], HIGH(unk_024_4564)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	call Func_024_5ffb
	ret
.asm_4bc0
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $11
	call PlaySound
	call unk_024_4000
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4564)
	inc hl
	ld [hl], HIGH(unk_024_4564)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	call Func_024_5ffb
	ret
unk_024_4be8:
	dr $90be8, $90c08
Func_024_4c08:
.asm_4c08
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4c1d
	call .asm_4c21
	jr .asm_4c08
.asm_4c1d
	xor a
	ldh [hFFC6], a
	ret
.asm_4c21
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4792)
	inc hl
	ld [hl], HIGH(unk_024_4792)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $12
	ldh [hFFC5], a
	call Func_024_694c
	ret
Func_024_4c48:
.asm_4c48
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4c60
	call Func_024_6aab
	call .asm_4c64
	jr .asm_4c48
.asm_4c60
	xor a
	ldh [hFFC6], a
	ret
.asm_4c64
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4c76
	ld a, [wSelectedOption]
	cp $07
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_4c85
.asm_4c76
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4cb8
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_4c85
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4d6a)
	inc hl
	ld [hl], HIGH(unk_024_4d6a)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedOption]
	swap a
	add $18
	ld [wcde0], a
	ld a, [wSelectedPage]
	add a
	add a
	add a
	ld e, a
	ld a, [wSelectedOption]
	add e
	ld [wd9d8], a
	ld a, $11
	call PlaySound
	ret
.asm_4cb8
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4cd1
	ld a, [wSelectedPage]
	and a
	jr z, .asm_4cca
	dec a
	ld [wSelectedPage], a
	jr .asm_4ce8
.asm_4cca
	ld a, $12
	ld [wSelectedPage], a
	jr .asm_4ce8
.asm_4cd1
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4d11
	ld a, [wSelectedPage]
	cp $12
	jr z, .asm_4ce4
	inc a
	ld [wSelectedPage], a
	jr .asm_4ce8
.asm_4ce4
	xor a
	ld [wSelectedPage], a
.asm_4ce8
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4d49)
	inc hl
	ld [hl], HIGH(unk_024_4d49)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedPage]
	add a
	add a
	add a
	ld e, a
	ld a, [wSelectedOption]
	add e
	ld [wd9d8], a
	ld a, $28
	call PlaySound
	ret
.asm_4d11
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, Func_024_6a61
	ld a, $11
	call PlaySound
	ld de, wd7cb
	ld a, [wd9d8]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	ret z
	ld [wd9da], a
	ld a, l
	ld [wd9da + 1], a
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $13
	ldh [hFFC5], a
	call Func_024_5ffb
	ret
unk_024_4d49:
	dr $90d49, $90d6a
unk_024_4d6a:
	dr $90d6a, $90d77
Func_024_4d77:
.asm_4d77
	call Func_024_408a
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4d8f
	call Func_024_6aab
	call .asm_4d93
	jr .asm_4d77
.asm_4d8f
	xor a
	ldh [hFFC6], a
	ret
.asm_4d93
	xor a
	ld [wPlayerMap2Y], a
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4da9
	ld a, [wd9da + 1]
	and a
	jr z, .asm_4da9
	dec a
	ld [wd9da + 1], a
	jr .asm_4dc8
.asm_4da9
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4dec
	ld a, [wd9da + 1]
	cp $05
	ret z
	inc a
	ld [wd9da + 1], a
	call asm_0fdf
	ld a, [bc]
	and a
	jr nz, .asm_4dc8
	ld a, [wd9da + 1]
	dec a
	ld [wd9da + 1], a
	ret
.asm_4dc8
	ld a, $11
	call PlaySound
	call Func_024_4e9f
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4e77)
	inc hl
	ld [hl], HIGH(unk_024_4e77)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wd9da + 1]
	ld [wSelectedOption], a
	ret
.asm_4dec
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_4e42
	ld a, $11
	call PlaySound
	ld a, $0B
	call Func_024_4efd.asm_5032
	call asm_0fdf
	ld hl, $0014
	ld a, [wSelectedOption]
	ld e, a
	ld d, $00
	add hl, de
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4e23
	push hl
	call Func_024_4e9f.asm_4ebd
	pop hl
	ld a, [wd9f3]
	ld [hl], a
	call Func_024_603b.asm_605d
	ld a, [wd9f3]
	and a
	jr z, .asm_4e2a
	jr .asm_4e27
.asm_4e23
	ld a, [wd9f3]
	ld [hl], a
.asm_4e27
	call Func_024_603b
.asm_4e2a
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $17
	ldh [hFFC5], a
	ld a, [wd9da + 1]
	ld [wSelectedOption], a
	ret
.asm_4e42
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4775)
	inc hl
	ld [hl], HIGH(unk_024_4775)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call Func_024_694c
	ld hl, wcdf8
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, wcdf0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
unk_024_4e77:
	dr $90e77, $90e9f
Func_024_4e9f:
	ld a, [wd9da + 1]
	ld de, OptionCursorCoords
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld b, h
	ld c, l
	ld de, wd1a0
	ld hl, $0021
	add hl, de
	ld a, [wd9da + 1]
	ld [hli], a
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ret
.asm_4ebd
	ld b, a
	ld a, [wd1fe]
	ld l, a
	ld a, [wd1ff]
	ld h, a
.asm_4ec6
	ld a, [hl]
	and a
	jr nz, .asm_4ecf
	ld a, b
	ld [hli], a
	ld [hl], $01
	ret
.asm_4ecf
	cp b
	jr nz, .asm_4ed5
	inc hl
	inc [hl]
	ret
.asm_4ed5
	inc hl
	inc hl
	jr .asm_4ec6
Func_024_4ed9:
.asm_4ed9
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4ef1
	call Func_024_6aab
	call Func_024_4efd
	jr .asm_4ed9
.asm_4ef1
	xor a
	ldh [hFFC6], a
	ret
unk_024_4ef5:
	dr $90ef5, $90efd
Func_024_4efd:
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4f32
	ld a, [wSelectedOption]
	cp $02
	ret z
	cp $03
	ret z
	inc a
	inc a
	ld [wSelectedOption], a
	ld a, $0B
	call .asm_5032
	call asm_0fdf
	ld a, [wSelectedOption]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4f8c
	ld a, [wSelectedOption]
	dec a
	dec a
	ld [wSelectedOption], a
	ret
.asm_4f32
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4f65
	ld a, [wSelectedOption]
	cp $01
	ret z
	cp $03
	ret z
	inc a
	ld [wSelectedOption], a
	ld a, $0B
	call .asm_5032
	call asm_0fdf
	ld a, [wSelectedOption]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4f8c
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_4f65
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4f7a
	ld a, [wSelectedOption]
	and a
	ret z
	cp $01
	ret z
	dec a
	dec a
	ld [wSelectedOption], a
	jr .asm_4f8c
.asm_4f7a
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4fa6
	ld a, [wSelectedOption]
	and a
	ret z
	cp $02
	ret z
	dec a
	ld [wSelectedOption], a
.asm_4f8c
	ld a, $28
	call PlaySound
	ld bc, unk_024_4ef5
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, bc
	ld bc, wcde0
	ld a, [hl]
	ld [bc], a
	inc hl
	inc bc
	ld a, [hl]
	ld [bc], a
	ret
.asm_4fa6
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_4fef
	ld a, $0B
	call .asm_5032
	call asm_0fdf
	ld a, [wSelectedOption]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld a, [hl]
	and a
	ret z
	call .asm_5011
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4771)
	inc hl
	ld [hl], HIGH(unk_024_4771)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $18
	ldh [hFFC5], a
	ld a, $0B
	call .asm_5032
	ld [wSelectedOption], a
	call Func_024_5ffb
	call .asm_5011
	ret
.asm_4fef
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_475c)
	inc hl
	ld [hl], HIGH(unk_024_475c)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call Func_024_694c
	ret
.asm_5011
	ld c, l
	ld b, h
	inc hl
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [wd9f3]
	cp $15
	jr z, .asm_5026
	cp $16
	jr z, .asm_5023
.asm_5023
	ld a, e
	jr .asm_502f
.asm_5026
	ld a, d
	add $0A
	cp e
	jr c, .asm_502f
	jr z, .asm_502f
	ld a, e
.asm_502f
	inc bc
	ld [bc], a
	ret
.asm_5032
	ld de, wd1a0
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ret
Func_024_503e:
.asm_503e
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5053
	call .asm_5057
	jr .asm_503e
.asm_5053
	xor a
	ldh [hFFC6], a
	ret
.asm_5057
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_5069
	ld a, [wSelectedOption]
	cp $01
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_5078
.asm_5069
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_5088
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_5078
	ld a, $11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $78
	ld [wcde0], a
	ret
.asm_5088
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_50d8
	ld a, $11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .asm_50dd
	call .asm_510a
	ld a, [hBattleJumptableIndex]
	cp $05
	jr z, .asm_50c0
	call Func_024_603b
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call Func_024_694c
	xor a
	ld [wSelectedOption], a
	ret
.asm_50c0
	call ClearBGMap0
	xor a
	ld [hFFC5], a
	ld [wd08a], a
	ld [wd087], a
	ld a, $01
	ldh [hFFC6], a
	call Func_024_5ffb
	call .asm_50ff
	ret
.asm_50d8
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_50dd
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_473b)
	inc hl
	ld [hl], HIGH(unk_024_473b)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0E
	ldh [hFFC5], a
	call Func_024_694c
	ret
.asm_50ff
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_5105
	ld [hli], a
	dec c
	jr nz, .asm_5105
	ret
.asm_510a
	ld a, [hBattleJumptableIndex]
	cp $05
	jp z, .asm_5168
	ld de, wd1a0
	ld a, $0B
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld de, wd1a0
	ld a, $0E
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
.asm_513b
	ld c, l
	ld b, h
	ld a, [wd0c1]
	cp $0A
	jr nz, .asm_5149
	ld a, [wd9e3]
	jr .asm_5156
.asm_5149
	ld de, unk_024_6e04
	ld a, [wd9f3]
	sub $28
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
.asm_5156
	ld [bc], a
	inc bc
	ld de, unk_024_6d77
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [bc], a
	inc bc
	ld [bc], a
	xor a
	ld [wSelectedOption], a
	ret
.asm_5168
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld de, wd1a0
	ld a, $0E
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wd9e3]
	ld [bc], a
	inc bc
	ld de, unk_024_6d77
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [bc], a
	inc bc
	ld [bc], a
	xor a
	ld [wSelectedOption], a
	ret
Func_024_519d:
.asm_519d
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_51b2
	call .asm_51b6
	jr .asm_519d
.asm_51b2
	xor a
	ldh [hFFC6], a
	ret
.asm_51b6
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_51c8
	ld a, [wSelectedOption]
	cp $03
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_51d7
.asm_51c8
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_51e2
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_51d7
	ld a, [wSelectedOption]
	swap a
	add $28
	ld [wcde0], a
	ret
.asm_51e2
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_5204
	ld a, $11
	call PlaySound
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	ld a, $0F
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_5204
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $11
	call PlaySound
	ld a, [hBattleJumptableIndex]
	cp $05
	jr z, .asm_5232
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_471d)
	inc hl
	ld [hl], HIGH(unk_024_471d)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0D
	ldh [hFFC5], a
	call Func_024_694c
	ret
.asm_5232
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_524f)
	inc hl
	ld [hl], HIGH(unk_024_524f)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0D
	ldh [hFFC5], a
	call Func_024_694c
	ret
unk_024_524f:
	dr $9124f, $91277
Func_024_5277:
.asm_5277
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_528f
	call Func_024_6aab
	call .asm_5293
	jr .asm_5277
.asm_528f
	xor a
	ldh [hFFC6], a
	ret
.asm_5293
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_52a1
	ld a, [wSelectedOption]
	cp $01
	ret z
	jr .asm_52ac
.asm_52a1
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_52be
	ld a, [wSelectedOption]
	and a
	ret z
.asm_52ac
	ld hl, wSelectedOption
	ld a, $01
	sub [hl]
	ld [hl], a
	ld a, [wSelectedOption]
	swap a
	add $48
	ld [wcde0], a
	ret
.asm_52be
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_52f1
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_52f6
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	ld a, $0E
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld de, wd1a0
	ld a, $0B
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ret
.asm_52f1
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_52f6
	ld a, [hBattleJumptableIndex]
	cp $05
	jr z, .asm_531a
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_46f5)
	inc hl
	ld [hl], HIGH(unk_024_46f5)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call Func_024_694c
	ret
.asm_531a
	ld a, $01
	ld [hFFC6], a
	xor a
	ld [wd08a], a
	ld [hFFC5], a
	ld [wd087], a
	call Func_024_5ffb
	call Func_024_503e.asm_50ff
	ret
Func_024_5330:
.asm_5330
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5345
	call .asm_5349
	jr .asm_5330
.asm_5345
	xor a
	ldh [hFFC6], a
	ret
.asm_5349
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_46bf)
	inc hl
	ld [hl], HIGH(unk_024_46bf)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ld [hFFC5], a
	call Func_024_694c
	ld a, [wdcae]
	and a
	ret nz
	call Func_024_603b
	ld a, [hBattleJumptableIndex]
	and a
	ret z
	ld a, $01
	ld [wd9ea], a
	xor a
	ld [wd08a], a
	ldh [hFFC5], a
	ld [wd087], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $08
	ld [wBattleIntroJumptableIndex], a
	call Func_024_5ffb
	ret
Func_024_5398:
.asm_5398
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_53ad
	call .asm_53b1
	jr .asm_5398
.asm_53ad
	xor a
	ldh [hFFC6], a
	ret
.asm_53b1
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_46cb)
	inc hl
	ld [hl], HIGH(unk_024_46cb)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ld [hFFC5], a
	call Func_024_694c
	ld a, [wdcae]
	and a
	ret nz
	call Func_024_603b
	ld a, [hBattleJumptableIndex]
	and a
	ret z
	ld a, $01
	ld [wd9ea], a
	xor a
	ld [wd08a], a
	ldh [hFFC5], a
	ld [wd087], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $08
	ld [wBattleIntroJumptableIndex], a
	call Func_024_5ffb
	ret
Func_024_5405:
	xor a
	ld [wdcae], a
.asm_5409
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5421
	call Func_024_6aab
	call .asm_5425
	jr .asm_5409
.asm_5421
	xor a
	ldh [hFFC6], a
	ret
.asm_5425
	ldh a, [hJoypadPressed]
	bit 7, a
	jp nz, Func_024_698f
	ldh a, [hJoypadPressed]
	bit 6, a
	jp nz, Func_024_69b0
	ldh a, [hJoypadPressed]
	bit 5, a
	jp nz, Func_024_69c3
	ldh a, [hJoypadPressed]
	bit 4, a
	jp nz, Func_024_69d7
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_556b
	ld a, [wd1f4]
	and a
	jr z, .asm_546d
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	ld a, $11
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld [wPlayerMap2Y], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedOption]
	ld [wd9da + 1], a
	ret
.asm_546d
	ld a, [wd9d3]
	and a
	ret z
	ld a, [wd0c1]
	cp $01
	jp z, .asm_54c5
	cp $02
	jp z, .asm_5512
	cp $03
	jr z, .asm_54ab
	cp $0A
	jr z, .asm_5488
	ret
.asm_5488
	call Func_024_6ba1
	call GetPartyMonPtr
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	cp $63
	jr nc, .asm_54eb
	inc [hl]
	ld a, [hl]
	ld [wd9e8], a
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall unk_04a_4000
	ret
.asm_54ab
	ld a, [wd9f3]
	cp $17
	jr z, .asm_54c2
	ld a, [wSelectedOption]
	ld [wd0c3], a
	call Func_024_6ba1
	ld a, $10
	ld [hFFC5], a
	jr .asm_54dd
.asm_54c2
	call .asm_5594
.asm_54c5
	call Func_024_6ba1
	xor a
	ld [wd3f9 + 4], a
	call Func_024_5603
	ld a, [wd3f9 + 4]
	and a
	jr nz, .asm_54eb
	ld a, $0C
	ld [hFFC5], a
	call Func_024_5ffb
.asm_54dd
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_54eb
	ld a, $46
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_55f9)
	inc hl
	ld [hl], HIGH(unk_024_55f9)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0C
	ldh [hFFC5], a
	call Func_024_5ffb
	ld a, $01
	ld [wdcae], a
	ret
.asm_5512
	call Func_024_6ba1
	call GetPartyMonPtr
	call .asm_55d6
	and a
	jr z, .asm_54eb
	ld de, unk_024_6e04
	ld a, [wd9f3]
	sub $28
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld d, a
	ld hl, $0007
	add hl, bc
	ld bc, $0003
	ld e, $04
.asm_5535
	ld a, [hl]
	cp d
	ret z
	and a
	jr z, .asm_5552
	add hl, bc
	dec e
	jr nz, .asm_5535
	ld a, $01
	ld [wd087], a
	ld a, $0D
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_5552
	call Func_024_503e.asm_513b
	ld a, $0C
	ld [hFFC5], a
	call Func_024_5ffb
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_556b
	ldh a, [hJoypadPressed]
	bit 1, a
	jr z, .asm_5593
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_467d)
	inc hl
	ld [hl], HIGH(unk_024_467d)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call Func_024_694c
	ret
.asm_5593
	ret
.asm_5594
	ld hl, wPartyMons
	ld de, $0016
	ld a, [wSelectedOption]
	and a
	jr z, .asm_55a4
.asm_55a0
	add hl, de
	dec a
	jr nz, .asm_55a0
.asm_55a4
	push hl
	pop bc
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55b2
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
.asm_55b2
	ld hl, $000A
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55be
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
.asm_55be
	ld hl, $000D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55ca
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
.asm_55ca
	ld hl, $0010
	add hl, bc
	ld a, [hl]
	and a
	ret z
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
	ret
.asm_55d6
	push hl
	pop bc
	ld de, unk_024_6e36
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9f3]
	sub $27
	ld d, a
.asm_55e9
	ld a, [hli]
	cp $FF
	jr z, .asm_55f7
	cp d
	jr z, .asm_55f4
	jp .asm_55e9
.asm_55f4
	ld a, $01
	ret
.asm_55f7
	xor a
	ret
unk_024_55f9:
	dr $915f9, $91603
Func_024_5603:
	call GetPartyMonPtr
	ld de, Jumptable_024_5616
	ld a, [wd9f3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.asm_5615
	ret
Jumptable_024_5616:
	dr $91616, $91646
Func_024_5646:
	ret
.asm_5647
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	ld a, $33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $001E
	add hl, bc
	ldh a, [hFFCC]
	ld d, a
	ldh a, [hFFCB]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_567c
	jr c, .asm_5680
	jr nc, .asm_5682
.asm_567c
	ld a, l
	cp e
	jr nc, .asm_5682
.asm_5680
	push hl
	pop de
.asm_5682
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_568b
	ld a, $01
	ld [wd3f9 + 4], a
	ret
.asm_5691
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	ld a, $33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0032
	add hl, bc
	ldh a, [hFFCC]
	ld d, a
	ldh a, [hFFCB]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_56c6
	jr c, .asm_56ca
	jr nc, .asm_56cc
.asm_56c6
	ld a, l
	cp e
	jr nc, .asm_56cc
.asm_56ca
	push hl
	pop de
.asm_56cc
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_56d5
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	ld a, $33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0064
	add hl, bc
	ldh a, [hFFCC]
	ld d, a
	ldh a, [hFFCB]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_570a
	jr c, .asm_570e
	jr nc, .asm_5710
.asm_570a
	ld a, l
	cp e
	jr nc, .asm_5710
.asm_570e
	push hl
	pop de
.asm_5710
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_5719
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	ld a, $33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $00C8
	add hl, bc
	ldh a, [hFFCC]
	ld d, a
	ldh a, [hFFCB]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_574e
	jr c, .asm_5752
	jr nc, .asm_5754
.asm_574e
	ld a, l
	cp e
	jr nc, .asm_5754
.asm_5752
	push hl
	pop de
.asm_5754
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_575d
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	ld a, $33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hFFCC]
	ld [wd9d8], a
	ldh a, [hFFCB]
	ld [wd9d9], a
	ld a, $14
	ldh [hFFC7], a
	farcall Multiply32By8
	ld a, $64
	ldh [hFFC7], a
	farcall Divide32By16_4Digit
	ldh a, [hFFCC]
	and a
	jr z, .asm_57a6
	ldh a, [hFFCB]
	ld [wd9da], a
	ldh a, [hFFCC]
	ld [wd9da + 1], a
	jr .asm_57af
.asm_57a6
	ldh a, [hFFCB]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_57af
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9da]
	ld b, a
	ld a, [wd9da + 1]
	ld c, a
	add hl, bc
	ld a, [wd9d8]
	ld d, a
	ld a, [wd9d9]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_57d1
	jr c, .asm_57d5
	jr nc, .asm_57d7
.asm_57d1
	ld a, l
	cp e
	jr nc, .asm_57d7
.asm_57d5
	push hl
	pop de
.asm_57d7
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_57e0
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	ld a, $33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hFFCC]
	ld [wd9d8], a
	ldh a, [hFFCB]
	ld [wd9d9], a
	ld a, $05
	ldh [hFFC7], a
	farcall Multiply32By8
	ld a, $0A
	ldh [hFFC7], a
	farcall Divide32By16_4Digit
	ldh a, [hFFCC]
	and a
	jr z, .asm_5829
	ldh a, [hFFCB]
	ld [wd9da], a
	ldh a, [hFFCC]
	ld [wd9da + 1], a
	jr .asm_5832
.asm_5829
	ldh a, [hFFCB]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_5832
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9da]
	ld b, a
	ld a, [wd9da + 1]
	ld c, a
	add hl, bc
	ld a, [wd9d8]
	ld d, a
	ld a, [wd9d9]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_5854
	jr c, .asm_5858
	jr nc, .asm_585a
.asm_5854
	ld a, l
	cp e
	jr nc, .asm_585a
.asm_5858
	push hl
	pop de
.asm_585a
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_5863
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	ld a, $33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hFFCC]
	ld [wd9d8], a
	ldh a, [hFFCB]
	ld [wd9d9], a
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9d9]
	ld [hli], a
	ld a, [wd9d8]
	ld [hl], a
	ret
.asm_5895
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	bit 0, a
	jp z, .asm_58c4
	res 0, a
	ld [hl], a
	ld a, $4C
	call PlaySound
	ret
.asm_58ad
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	bit 1, a
	jr z, .asm_58c4
	res 1, a
	ld [hl], a
	ld a, $4C
	call PlaySound
	ret
.asm_58c4
	ld a, $01
	ld [wd3f9 + 4], a
	ret
.asm_58ca
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	bit 4, a
	jp z, .asm_58c4
	res 4, a
	ld [hl], a
	ld a, $4C
	call PlaySound
	ret
.asm_58e2
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	bit 2, a
	jp z, .asm_58c4
	res 2, a
	ld [hl], a
	ld a, $4C
	call PlaySound
	ret
.asm_58fa
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	bit 3, a
	jp z, .asm_58c4
	res 3, a
	ld [hl], a
	ld a, $4C
	call PlaySound
	ret
.asm_5912
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	and a
	jp z, .asm_58c4
	ld [hl], $00
	ld a, $4C
	call PlaySound
	ret
.asm_5928
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp nz, .asm_568b
	ld [hl], $00
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hFFCC]
	ld [wd9d8], a
	ldh a, [hFFCB]
	ld [wd9d9], a
	ld a, $02
	ldh [hFFC7], a
	farcall Multiply32By8
	ld a, $0A
	ldh [hFFC7], a
	farcall Divide32By16_4Digit
	ldh a, [hFFCC]
	and a
	jr z, .asm_596e
	ldh a, [hFFCB]
	ld [wd9da], a
	ldh a, [hFFCC]
	ld [wd9da + 1], a
	jr .asm_5977
.asm_596e
	ldh a, [hFFCB]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_5977
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9da + 1]
	ld [hli], a
	ld a, [wd9da]
	ld [hl], a
	ld a, $33
	call PlaySound
	ret
.asm_598a
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp nz, .asm_568b
	ld [hl], $00
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hFFCC]
	ld [wd9d8], a
	ldh a, [hFFCB]
	ld [wd9d9], a
	ld a, $05
	ldh [hFFC7], a
	farcall Multiply32By8
	ld a, $0A
	ldh [hFFC7], a
	farcall Divide32By16_4Digit
	ldh a, [hFFCC]
	and a
	jr z, .asm_59d0
	ldh a, [hFFCB]
	ld [wd9da], a
	ldh a, [hFFCC]
	ld [wd9da + 1], a
	jr .asm_59d9
.asm_59d0
	ldh a, [hFFCB]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_59d9
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9da + 1]
	ld [hli], a
	ld a, [wd9da]
	ld [hl], a
	ld a, $33
	call PlaySound
	ret
.asm_59ec
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp nz, .asm_568b
	ld [hl], $00
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hFFCC]
	ld [wd9d8], a
	ldh a, [hFFCB]
	ld [wd9d9], a
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9d9]
	ld [hli], a
	ld a, [wd9d8]
	ld [hl], a
	ld a, $33
	call PlaySound
	ret
.asm_5a20
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, .asm_568b
	call GetPartyMonPtr
	ld hl, $0007
	add hl, bc
	ld bc, $0003
	ld e, $04
.asm_5a36
	ld a, [hl]
	and a
	ret z
	push hl
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
	pop hl
	add hl, bc
	dec e
	jr nz, .asm_5a36
	ld a, $33
	call PlaySound
	ret
Func_024_5a49:
.asm_5a49
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5a61
	call Func_024_6aab
	call .asm_5a65
	jr .asm_5a49
.asm_5a61
	xor a
	ldh [hFFC6], a
	ret
.asm_5a65
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_5a73
	ld a, [wSelectedOption]
	cp $01
	ret z
	jr .asm_5a7e
.asm_5a73
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_5a95
	ld a, [wSelectedOption]
	and a
	ret z
.asm_5a7e
	ld a, $11
	call PlaySound
	ld hl, wSelectedOption
	ld a, $01
	sub [hl]
	ld [hl], a
	ld a, [wSelectedOption]
	swap a
	add $78
	ld [wcde0], a
	ret
.asm_5a95
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_5ae7
	ld a, $11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .asm_5ac5
	ld a, [wd1f4]
	cp $01
	jr z, .asm_5ab3
	cp $02
	ret z
	jr .asm_5ab3
.asm_5ab3
	call Func_024_603b
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4652)
	inc hl
	ld [hl], HIGH(unk_024_4652)
	jr .asm_5afe
.asm_5ac5
	ld a, [wd1f4]
	and a
	jp z, .asm_5b19
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd1fd]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd9f3], a
	ld a, [hl]
	ld [wd9d3], a
	jp .asm_5b7e
.asm_5ae7
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4664)
	inc hl
	ld [hl], HIGH(unk_024_4664)
.asm_5afe
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call Func_024_694c
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
.asm_5b19
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd1fd]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd9f3], a
	ld a, [hl]
	ld [wd9d3], a
	ld de, unk_024_5f82
	ld a, [wd9f3]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $01
	jp z, .asm_5b7e
	cp $02
	jp z, .asm_5b9c
	cp $03
	jp z, .asm_5b7e
	cp $04
	jp z, .asm_5bf4
	cp $05
	jp z, .asm_5ba8
	cp $06
	jp z, .asm_5bc7
	cp $07
	jp z, .asm_5bca
	cp $08
	jp z, .asm_5bcd
	cp $09
	jp z, .asm_5bd0
	cp $0A
	jp z, .asm_5b71
	ret
.asm_5b71
	ld [wd0c1], a
	ld a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_5c20
	jp .asm_5b81
.asm_5b7e
	ld [wd0c1], a
.asm_5b81
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	ld a, $0B
	ldh [hFFC5], a
	xor a
	ld [wd08a], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	call Func_024_5ffb
	ret
.asm_5b9c
	ld [wd0c1], a
	ld a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_5c20
	jr .asm_5b81
.asm_5ba8
	ld [wd0c1], a
	ld a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_5c20
	ld a, [wd0d3]
	and a
	jp z, .asm_5c20
	ld a, [wd9eb]
	and a
	jp nz, .asm_5c20
	call Func_024_5f19
	call .asm_5c4d
	ret
.asm_5bc7
	jp .asm_5c20
.asm_5bca
	jp .asm_5c20
.asm_5bcd
	jp .asm_5c20
.asm_5bd0
	ld a, [wd0d3]
	cp $02
	jr nz, .asm_5c20
	ld a, [hBattleJumptableIndex]
	and a
	jr nz, .asm_5c20
	call .asm_5c75
	xor a
	ld [wPlayerSpriteID], a
	ld [wd0e4], a
	ld [wPlayerAnimFrame], a
	ld [wd0df], a
	call Func_024_5ffb
	call Func_024_603b
	ret
.asm_5bf4
	ld a, [hBattleJumptableIndex]
	and a
	jr z, .asm_5c20
	ld a, $02
	ld [wd9ea], a
	xor a
	ld [wd08a], a
	ldh [hFFC5], a
	ld [wd087], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $09
	ld [wBattleIntroJumptableIndex], a
	call Func_024_603b
	call Func_024_5ffb
	call DelayFrame
	ret
.asm_5c20
	ld a, $22
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_5f78)
	inc hl
	ld [hl], HIGH(unk_024_5f78)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call Func_024_694c
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
.asm_5c4d
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_5f67)
	inc hl
	ld [hl], HIGH(unk_024_5f67)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call Func_024_694c
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
.asm_5c75
	ld de, unk_024_5c97
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
	ldh [hMapNumber], a
	ld a, [hli]
	ldh [hWarpNumber], a
	ld a, $01
	ldh [hFade], a
	call Func_024_689a
	ret
unk_024_5c97:
	dr $91c97, $91f19
Func_024_5f19:
	ld a, [wd9f3]
	cp $23
	jr z, .asm_5f29
	cp $24
	jr z, .asm_5f30
	cp $25
	jr z, .asm_5f37
	ret
.asm_5f29
	ld a, $32
	ld [wd9eb], a
	jr .asm_5f3c
.asm_5f30
	ld a, $78
	ld [wd9eb], a
	jr .asm_5f3c
.asm_5f37
	ld a, $C8
	ld [wd9eb], a
.asm_5f3c
	call Func_024_603b
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_42a5)
	inc hl
	ld [hl], HIGH(unk_024_42a5)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call Func_024_694c
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
unk_024_5f67:
	dr $91f67, $91f78
unk_024_5f78:
	dr $91f78, $91f82
unk_024_5f82:
	dr $91f82, $91ffb
Func_024_5ffb:
	ld hl, wcde0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wVirtualOAMSprite38YCoord
	ld c, $08
	xor a
.asm_601d
	ld [hli], a
	dec c
	jr nz, .asm_601d
	ret
Func_024_6022:
	ld hl, wcdf8
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wVirtualOAMSprite24YCoord
	ld c, $28
	xor a
.asm_6036
	ld [hli], a
	dec c
	jr nz, .asm_6036
	ret
Func_024_603b:
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd1fd]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret z
	inc hl
	dec [hl]
	ld a, [hld]
	and a
	jr nz, .asm_6056
	ld [hl], $00
.asm_6056
	ld [wd9d3], a
	xor a
	ld [wd0c0], a
.asm_605d
	ld de, unk_024_6096
	ld a, [wd1f4]
	ld l, a
	ld h, $00
	add hl, de
	ld c, [hl]
	ld a, [wd1fe]
	ld l, a
	ld e, a
	ld a, [wd1ff]
	ld h, a
	ld d, a
.asm_6072
	ld a, [hl]
	and a
	jr z, .asm_6080
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_6072
	ret
.asm_6080
	ld a, l
	add $02
	ld l, a
	dec c
	jr nz, .asm_6072
	ld a, l
	sub e
	srl a
	ld c, a
.asm_608c
	dec c
	ret z
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	jr .asm_608c
.asm_6095
	ret
unk_024_6096:
	dr $92096, $92099
Func_024_6099:
.asm_6099
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_60b1
	call Func_024_6aab
	call .asm_60b5
	jr .asm_6099
.asm_60b1
	xor a
	ldh [hFFC6], a
	ret
.asm_60b5
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_60da
	ld a, [wSelectedOption]
	cp $04
	ret nc
	inc a
	ld [wSelectedOption], a
	ld a, [wd1f4]
	cp $01
	jr z, .asm_60e9
	call .asm_62f7
	and a
	jr nz, .asm_60e9
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_60da
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_6114
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_60e9
	ld a, $11
	call PlaySound
	ld a, [wSelectedOption]
	sla a
	sla a
	sla a
	sla a
	add $18
	ld [wcde0], a
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4650)
	inc hl
	ld [hl], HIGH(unk_024_4650)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_6114
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_6125
	ld a, [wSelectedPage]
	and a
	ret z
	dec a
	ld [wSelectedPage], a
	jr .asm_614c
.asm_6125
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_6189
	ld de, unk_024_6344
	ld a, [wd1f4]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedPage]
	cp [hl]
	ret z
	inc a
	ld [wSelectedPage], a
	call .asm_6312
	and a
	jr nz, .asm_614c
	ld a, [wSelectedPage]
	dec a
	ld [wSelectedPage], a
	ret
.asm_614c
	ld a, $11
	call PlaySound
	xor a
	ld [wSelectedOption], a
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4642)
	inc hl
	ld [hl], HIGH(unk_024_4642)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wd3f9 + 1]
	and a
	ret z
	ld a, [wSelectedPage]
	ld c, a
	ld a, [wd3f9 + 3]
	cp c
	jr z, .asm_6181
	ld hl, wcdf0
	inc hl
	inc hl
	ld [hl], $00
	ret
.asm_6181
	ld hl, wcdf0
	inc hl
	inc hl
	ld [hl], $03
	ret
.asm_6189
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_627d
	ld a, $11
	call PlaySound
	ld a, [wd1f4]
	cp $01
	jr z, .asm_61e4
	call .asm_62f7
	and a
	ret z
	ld [wd9f3], a
	ld a, [wd3f9 + 1]
	and a
	jp nz, .asm_622c
	ld a, [wd1f4]
	and a
	jr z, .asm_6208
	ld a, [wd9f3]
	cp $07
	ret nz
	call Func_024_6ba1
	ld a, [wdce4]
	cp $01
	jp nz, Func_024_5a49.asm_5c20
	ld a, $01
	ldh [hFFD6], a
	ld [wd0fd + 1], a
	xor a
	ld [wScriptByte], a
	ld a, [hScriptBank]
	ld [wdcad], a
	ld a, $4A
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], $d7
	inc hl
	ld [hl], $7f
	call Func_024_689a
	ret
.asm_61e4
	call .asm_62f7
	ld [wd9f3], a
	call Func_024_6ba1
	ld a, $02
	ld [wd087], a
	ld a, $0A
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld hl, wd088
	ld [hl], LOW(unk_024_466d)
	inc hl
	ld [hl], HIGH(unk_024_466d)
	ret
.asm_6208
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	ld a, $0A
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld bc, wcde0
	ld hl, wcdf0
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	ld [hli], a
	ret
.asm_622c
	call .asm_62f7
	push hl
	push af
	inc hl
	ld a, [hl]
	push af
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd3f9 + 3]
	ld l, a
	add a
	add a
	add l
	ld l, a
	ld a, [wd3f9 + 2]
	add l
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop af
	ld [hld], a
	pop af
	ld [hl], a
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
.asm_6259
	ld a, [wd3f9 + 3]
	ld [wSelectedPage], a
	ld a, [wd3f9 + 2]
	ld [wSelectedOption], a
	ld hl, wcdf0
	ld de, wcde0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $01
	ld [de], a
	ld [hl], $00
	xor a
	ld [wd3f9 + 1], a
	jp .asm_614c
.asm_627d
	ldh a, [hJoypadPressed]
	bit 1, a
	jp z, .asm_62c8
	ld a, $11
	call PlaySound
	ld a, [wd3f9 + 1]
	and a
	jr nz, .asm_6259
	ldh a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_62b2
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_462b)
	inc hl
	ld [hl], HIGH(unk_024_462b)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $07
	ldh [hFFC5], a
	call Func_024_694c
	ret
.asm_62b2
	xor a
	ld [wd08a], a
	ldh [hFFC5], a
	ld [wd087], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ld [wBattleIntroJumptableIndex], a
	call Func_024_5ffb
	ret
.asm_62c8
	ldh a, [hJoypadPressed]
	bit 2, a
	ret z
	ld a, [wd3f9 + 1]
	and a
	jp nz, .asm_622c
	ld a, [wSelectedPage]
	ld [wd3f9 + 3], a
	ld a, [wSelectedOption]
	ld [wd3f9 + 2], a
	ld a, $01
	ld [wd3f9 + 1], a
	ld hl, wcde0
	ld de, wcdf0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $03
	ld [de], a
	ld [hl], $01
	ret
.asm_62f7
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wSelectedPage]
	ld l, a
	add a
	add a
	add l
	ld l, a
	ld a, [wSelectedOption]
	add l
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	ret
.asm_6312
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wSelectedPage]
	ld l, a
	add a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	ret
Func_024_6328:
.asm_6328
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6340
	call Func_024_6aab
	call Func_024_6347
	jr .asm_6328
.asm_6340
	xor a
	ldh [hFFC6], a
	ret
unk_024_6344:
	dr $92344, $92347
Func_024_6347:
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_635a
	ld a, [wSelectedOption]
	cp $02
	jr z, .asm_635a
	inc a
	ld [wSelectedOption], a
	jr .asm_636a
.asm_635a
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_637a
	ld a, [wSelectedOption]
	and a
	jr z, .asm_637a
	dec a
	ld [wSelectedOption], a
.asm_636a
	ld a, $11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $18
	ld [wcde0], a
	ret
.asm_637a
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, Func_024_6a61
	ld a, [wSelectedOption]
	ld [wd1f4], a
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	ld a, $09
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	xor a
	ld [wSelectedOption], a
	ld [wSelectedPage], a
	ret
Func_024_63a4:
.asm_63a4
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_63bc
	call Func_024_6aab
	call .asm_63c0
	jr .asm_63a4
.asm_63bc
	xor a
	ldh [hFFC6], a
	ret
.asm_63c0
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_63e2
	ld a, [wSelectedOption]
	cp $03
	jr nc, .asm_63e2
	add $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	sub $03
	ld [wSelectedOption], a
	ret
.asm_63e2
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_6404
	ld a, [wSelectedOption]
	cp $03
	jr c, .asm_6404
	sub $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	add $03
	ld [wSelectedOption], a
	ret
.asm_6404
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_6428
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6428
	cp $03
	jr z, .asm_6428
	dec a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	add $01
	ld [wSelectedOption], a
	ret
.asm_6428
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_645f
	ld a, [wSelectedOption]
	cp $02
	ret z
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	sub $01
	ld [wSelectedOption], a
	ret
.asm_644b
	ld de, OptionCursorCoords
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ret
.asm_645f
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_6485
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_461d)
	inc hl
	ld [hl], HIGH(unk_024_461d)
	ld a, $03
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_6485
	ldh a, [hJoypadPressed]
	bit 1, a
	jr z, .asm_64a8
	ld a, $11
	call PlaySound
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	call Func_024_694c
	ret
.asm_64a8
	ret
Func_024_64a9:
.asm_64a9
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_64be
	call .asm_64c2
	jr .asm_64a9
.asm_64be
	xor a
	ldh [hFFC6], a
	ret
.asm_64c2
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_64d4
	ld a, [wSelectedOption]
	and a
	jr z, .asm_64d4
	dec a
	ld [wSelectedOption], a
	jr .asm_64f3
.asm_64d4
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_6511
	ld a, [wSelectedOption]
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_64f3
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_64f3
	ld a, $28
	call PlaySound
	call Func_024_66da
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_45e8)
	inc hl
	ld [hl], HIGH(unk_024_45e8)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_6511
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_6536
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_460f)
	inc hl
	ld [hl], HIGH(unk_024_460f)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ret
.asm_6536
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4601)
	inc hl
	ld [hl], HIGH(unk_024_4601)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $05
	ldh [hFFC5], a
	ret
Func_024_655a:
.asm_655a
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_656f
	call .asm_6573
	jr .asm_655a
.asm_656f
	xor a
	ldh [hFFC6], a
	ret
.asm_6573
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_6585
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6585
	dec a
	ld [wSelectedOption], a
	jr .asm_65a4
.asm_6585
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_65c2
	ld a, [wSelectedOption]
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_65a4
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_65a4
	ld a, $28
	call PlaySound
	call Func_024_66da
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_45d1)
	inc hl
	ld [hl], HIGH(unk_024_45d1)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_65c2
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_65df
	ld a, $11
	call PlaySound
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $06
	ldh [hFFC5], a
	ret
.asm_65df
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $11
	call PlaySound
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_45c2)
	inc hl
	ld [hl], HIGH(unk_024_45c2)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ldh [hFFC5], a
	ret
Func_024_6603:
.asm_6603
	call Func_024_40b8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6618
	call .asm_661c
	jr .asm_6603
.asm_6618
	xor a
	ldh [hFFC6], a
	ret
.asm_661c
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_662e
	ld a, [wSelectedOption]
	and a
	jr z, .asm_662e
	dec a
	ld [wSelectedOption], a
	jr .asm_664d
.asm_662e
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_666b
	ld a, [wSelectedOption]
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_664d
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_664d
	ld a, $28
	call PlaySound
	call Func_024_66da
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_45b0)
	inc hl
	ld [hl], HIGH(unk_024_45b0)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_666b
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_6688
	ld a, $11
	call PlaySound
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $05
	ldh [hFFC5], a
	ret
.asm_6688
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $11
	call PlaySound
	ld a, [hBattleJumptableIndex]
	and a
	jr nz, .asm_66b1
	ld a, $02
	ld [wd087], a
	call Func_024_694c
	ld hl, wd088
	ld [hl], LOW(unk_024_45a0)
	inc hl
	ld [hl], HIGH(unk_024_45a0)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_66b1
	ld a, $02
	ld [wd087], a
	call Func_024_694c
	ld hl, wd088
	ld [hl], LOW(unk_024_66ca)
	inc hl
	ld [hl], HIGH(unk_024_66ca)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret
unk_024_66ca:
	dr $926ca, $926da
Func_024_66da:
	ld a, [wSelectedOption]
	ld de, OptionCursorCoords
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld b, h
	ld c, l
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [wSelectedOption]
	ld [hli], a
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ret
Func_024_66f8:
.asm_66f8
	call Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6710
	call Func_024_6aab
	call .asm_6714
	jr .asm_66f8
.asm_6710
	xor a
	ldh [hFFC6], a
	ret
.asm_6714
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_672a
	ld a, [wSelectedOption]
	cp $01
	jr z, .asm_672a
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
	jr .asm_673c
.asm_672a
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_6750
	ld a, [wSelectedOption]
	and a
	ret z
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
.asm_673c
	ld de, unk_024_6969
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ret
.asm_6750
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_6844
	ld a, $11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6787
	cp $01
	jr z, .asm_6767
	ret
.asm_6767
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ldh [hFFC5], a
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [hl]
	ld [wSelectedOption], a
	ret
.asm_6787
	ldh a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_67b8
	call Func_024_6ba1
	ld a, $01
	ld [wd087], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $08
	ldh [hFFC5], a
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld [wd9d9], a
	ld de, wcde0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret
.asm_67b8
	ld a, [wdb1c]
	and a
	jr z, .asm_67d9
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld b, $0C
	ld de, wdcbb + 1
.asm_67cf
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_67cf
	xor a
	ld [wdb1c], a
.asm_67d9
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [hl]
	ld d, a
	ld a, [wd983]
	cp d
	ret z
	call Func_024_6916
	and a
	ret z
	ld a, d
	ld [wd983], a
	ld a, $01
	ld [wdcaf], a
	xor a
	ld [wd08a], a
	ldh [hFFC5], a
	ld [wd087], a
	ld [wdb18], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $08
	ld [wBattleIntroJumptableIndex], a
	call Func_024_5ffb
	call DelayFrame
	ld hl, wd978
	ld c, $04
	xor a
.asm_681b
	ld [hli], a
	dec c
	jr nz, .asm_681b
	ld hl, wd900
	ld c, $0C
.asm_6824
	ld a, $0A
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $0A
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_6824
	xor a
	ld [wd9b3], a
	ld [wd9b8], a
	ld [wd9bb], a
	ld [wd997], a
	ret
.asm_6844
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $02
	ld [wd087], a
	ldh [hFFC5], a
	call Func_024_694c
	ld hl, wd088
	ld [hl], LOW(unk_024_4589)
	inc hl
	ld [hl], HIGH(unk_024_4589)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [hFFC6], a
	ret

Func_024_6864::
	ld a, [wPlayerFacing]
	and a
	jr z, .asm_687f
	cp $01
	jr z, .asm_6876
	cp $02
	jr z, .asm_6888
	cp $03
	jr z, .asm_6891
.asm_6876
	ld a, [wPlayerObject]
	sub $10
	ld [wPlayerObject], a
	ret
.asm_687f
	ld a, [wPlayerObject]
	add $10
	ld [wPlayerObject], a
	ret
.asm_6888
	ld a, [wPlayerScreenX]
	sub $10
	ld [wPlayerScreenX], a
	ret
.asm_6891
	ld a, [wPlayerScreenX]
	add $10
	ld [wPlayerScreenX], a
	ret
Func_024_689a:
	ld a, $80
	ldh [$ff40], a
	ld hl, $2b38
	call CopyBackgroundPalettes
	ld hl, $2b38
	call CopyObjectPalettes
	call DelayFrame
	ld a, [wd0bc]
	ldh [$ffae], a
	ld a, [wd0bd]
	ldh [$ffaf], a
	ld a, [wd0be]
	ldh [$ffb0], a
	ld a, [wd0bf]
	ldh [$ffb1], a
	call LoadMapGFX
	ld de, wTilemap
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1412
	ld a, $14
	ldh [$ff92], a
	ld a, $12
	ldh [$ff93], a
	call PlaceTilemap
	ld hl, $57a0
	ld b, $25
	rst $30
	ld de, wPaletteBuffer
	ld hl, wcb30
	ld bc, $0080
	call CopyBytes3
	call Func_024_6941
	ld hl, unk_024_4000
	ld b, $04
	rst $30
	ld a, $c7
	ldh [$ff40], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	ld a, $01
	ldh [$ffc6], a
	xor a
	ldh [$ffc5], a
	ld [wd087], a
	ret
Func_024_6916:
	ld hl, wPartyMon1
	ld bc, $0016
	ld a, d
	and a
	jr z, .asm_6924
.asm_6920
	add hl, bc
	dec a
	jr nz, .asm_6920
.asm_6924
	push hl
	pop bc
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, .asm_693f
	and $41
	ld [hl], a
	ld a, c
	ld [wActiveMonPtr], a
	ld a, b
	ld [wd982], a
	ld a, [bc]
	ld [wd9e5], a
	ret
.asm_693f
	xor a
	ret
Func_024_6941:
	ld hl, wd1a0
	ld c, $40
	xor a
Func_024_6947:
	ld [hli], a
	dec c
	jr nz, Func_024_6947
	ret
Func_024_694c:
	ld de, wd1a0
	ldh a, [$ffc5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, $01
	ld [bc], a
	ret

unk_024_6969:
	db $78, $78, $88, $78
Func_024_696d:
	call Func_024_4062
	call DelayFrame
	ldh a, [$ff9d]
	inc a
	ldh [$ff9d], a
	ldh a, [$ffc6]
	and a
	jr nz, .asm_6985
	call Func_024_6aab
	call Func_024_6989
	jr Func_024_696d
.asm_6985
	xor a
	ldh [$ffc6], a
	ret
Func_024_6989:
	ldh a, [$ff94]
	bit 7, a
	jr z, Func_024_69aa
Func_024_698f:
	ld a, [wSelectedOption]
	cp $03
	ret nc
	add $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, Func_024_69f3
	ld a, [wSelectedOption]
	sub $03
	ld [wSelectedOption], a
	ret
Func_024_69aa:
	ldh a, [$ff94]
	bit 6, a
	jr z, Func_024_69bd
Func_024_69b0:
	ld a, [wSelectedOption]
	cp $03
	ret c
	sub $03
	ld [wSelectedOption], a
	jr Func_024_69f3
Func_024_69bd:
	ldh a, [$ff94]
	bit 5, a
	jr z, Func_024_69d1
Func_024_69c3:
	ld a, [wSelectedOption]
	and a
	ret z
	cp $03
	ret z
	dec a
	ld [wSelectedOption], a
	jr Func_024_69f3
Func_024_69d1:
	ldh a, [$ff94]
	bit 4, a
	jr z, Func_024_6a20
Func_024_69d7:
	ld a, [wSelectedOption]
	cp $02
	ret z
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, Func_024_69f3
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
Func_024_69f3:
	ld a, $11
	call PlaySound
	ld de, $6a9f
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4553)
	inc hl
	ld [hl], HIGH(unk_024_4553)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [$ffc6], a
Func_024_6a20:
	ldh a, [$ff94]
	bit 0, a
	jr z, Func_024_6a61
	ld a, $11
	call PlaySound
	call Func_024_6ba1
	ldh a, [$ffd3]
	and a
	jr nz, .asm_6a46
	ld a, $01
	ld [wd087], a
	ld a, $03
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [$ffc6], a
	ret
.asm_6a46
	ld a, $02
	ld [wd087], a
	ld a, $03
	ld [hFFC5], a
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [$ffc6], a
	ld hl, wd088
	ld [hl], LOW(unk_024_41c1)
	inc hl
	ld [hl], HIGH(unk_024_41c1)
	ret
Func_024_6a61:
	ldh a, [$ff94]
	bit 1, a
	jr z, Func_024_6a9e
	ld a, $11
	call PlaySound
	ldh a, [$ffd3]
	and a
	jr nz, Func_024_6a8c
Func_024_6a71:
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_4564)
	inc hl
	ld [hl], HIGH(unk_024_4564)
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [$ffc6], a
	ldh [$ffc5], a
	call Func_024_5ffb
	ret
Func_024_6a8c:
	xor a
	ld [wd08a], a
	ldh [$ffc5], a
	ld [wd087], a
	ld a, $01
	ldh [$ffc6], a
	ld a, $03
	ld [wBattleIntroJumptableIndex], a
Func_024_6a9e:
	ret

OptionCursorCoords:
	db $18, $08
	db $18, $40
	db $18, $78
	db $38, $08
	db $38, $40
	db $38, $78

Func_024_6aab:
	ldh a, [$ff9d]
	and $07
Func_024_6aaf:
	ret nz
	ld bc, wcde0
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_6ac0
	ld a, [bc]
	dec a
	ld [bc], a
	jr .asm_6ac3
.asm_6ac0
	ld a, [bc]
	inc a
	ld [bc], a
.asm_6ac3
	ld a, $01
	sub [hl]
	ld [hl], a
	ret

Func_024_6ac8:
; Start menu main loop
.loop
	call Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6ae0

	call StartMenu_BounceCursor
	call StartMenu_Input
	jr .loop

.asm_6ae0:
	xor a
	ldh [hFFC6], a
	ret

StartMenu_Input:
; Check down
	ldh a, [hJoypadPressed]
	bit D_DOWN_F, a
	jr z, .check_up

; Pressed down
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
	cp 5
	jr c, .asm_6b1c

; reached bottom
	xor a
	ld [wSelectedOption], a
	jr .asm_6b1c

.check_up
	ldh a, [hJoypadPressed]
	bit D_UP_F, a
	jr z, .check_a

; Pressed up
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .reached_top

	dec a
	ld [wSelectedOption], a
	jr .asm_6b1c

.reached_top
	ld a, 4
	ld [wSelectedOption], a

.asm_6b1c
	ld a, [wSelectedOption]
	add a
	add a
	add a
	add a
	add $18
	ld [wcde0], a
	jr .ret

.check_a
	ldh a, [hJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .check_exit

; Pressed A
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6b3c
	cp 1
	jr z, .asm_6b3c
	jr .asm_6b42

.asm_6b3c
	ld a, [wdcbb]
	and a
	jr z, .check_exit

.asm_6b42
	ld a, [wSelectedOption]
	cp 2
	jr nz, .asm_6b57

	ld a, [hFFBA]
	cp $11
	jr z, .check_exit

	ld a, [wPlayerSpriteID]
	cp 9
	jr z, .check_exit

.asm_6b57
	ld a, SFX_11
	call PlaySound
	call Func_024_6ba1
	ld a, 1
	ld [wd087], a
	ldh [hFFC6], a
	xor a
	ld [wd08a], a

	ld de, unk_024_6b9c
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ldh [hFFC5], a

	xor a
	ld [wd9d8], a
	ld [wSelectedPage], a
	jr .ret

.check_exit
	ldh a, [hJoypadPressed]
	and START | B_BUTTON
	jr z, .ret

; Close menu
	ld a, 2
	ld [wd087], a
	ld hl, wd088
	ld [hl], LOW(unk_024_454c)
	inc hl
	ld [hl], HIGH(unk_024_454c)
	xor a
	ld [wd08a], a
	ld a, 1
	ldh [hFFC6], a

.ret
	ret

unk_024_6b9c:
	dr $92b9c, $92ba1

Func_024_6ba1:
	ld de, wd1a0
	ldh a, [$ffc5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedOption]
	ld [hli], a
	ld bc, wcde0
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ret

StartMenu_BounceCursor:
	ldh a, [hFadeFrameCounter]
	and 7 ; 0 or 8
	ret nz

; x coord = 76 or 77
	ld bc, wcde0
	inc bc
	ld a, [bc]
	cp $76
	jr z, .move

	ld a, $76
	ld [bc], a
	ret

.move
	ld a, $77
	ld [bc], a
	ret

Func_024_6bd0:
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf8
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $94
	ld e, a
	ld d, $C0
.asm_6bef
	ld a, [hli]
	cp $FF
	jr z, .asm_6c04
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_6bef
.asm_6c04
	ld a, e
	ld [wd1fb], a
	ret

Func_024_6c09:
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf0
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $98
	ld e, a
	ld d, $C0
.asm_6c28
	ld a, [hli]
	cp $FF
	jr z, .asm_6c3d
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_6c28
.asm_6c3d
	ld a, e
	ld [wd1fb], a
	ret

Func_024_6c42:
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcde0
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $9C
	ld e, a
	ld d, $C0
.asm_6c61
	ld a, [hli]
	cp $FF
	jr z, .asm_6c76
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_6c61
.asm_6c76
	ld a, e
	ld [wd1fb], a
	ret

Func_024_6c7b:
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf0
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $80
	ld e, a
	ld d, $C0
.asm_6c9a
	ld a, [hli]
	cp $FF
	jr z, .asm_6caf
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_6c9a
.asm_6caf
	ld a, e
	ld [wd1fb], a
	ret

Func_024_6cb4:
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf8
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $60
	ld e, a
	ld d, $C0
.asm_6cd3
	ld a, [hli]
	cp $FF
	jr z, .asm_6ce8
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_6cd3
.asm_6ce8
	ld a, e
	ld [wd1fb], a
	ret

SpriteOAMTemplate_Pointers:
	dw .template0
	dw .template0
	dw .template1
	dw .template2
	dw .template3
	dw .template4
	dw .template5
	dw .template6
.template0
	db $00, $00, $00, $FE, $00, $FF
.template1
	db $00, $00, $00, $FE, $20, $FF
.template2
	db $00, $00, $00, $FE, $03, $FF
.template3
	db $00, $00, $08, $F6, $00
	db $00, $08, $00, $F8, $00
	db $FF
.template4
	db $00, $00, $08, $FA, $00
	db $00, $08, $00, $FC, $00
	db $FF
.template5
	db $00, $00, $08, $00, $01
	db $00, $08, $00, $02, $01
	db $00, $10, $08, $04, $01
	db $00, $18, $00, $06, $01
	db $10, $00, $08, $08, $01
	db $10, $08, $00, $0A, $01
	db $10, $10, $08, $0C, $01
	db $10, $18, $00, $0E, $01
	db $FF
.template6
	db $00, $00, $08, $E0, $01
	db $00, $08, $00, $E2, $01
	db $00, $10, $08, $E4, $01
	db $00, $18, $00, $E6, $01
	db $10, $00, $08, $E8, $01
	db $10, $08, $00, $EA, $01
	db $10, $10, $08, $EC, $01
	db $10, $18, $00, $EE, $01
	db $FF

unk_024_6d77:
	dr $92d77, $92e04
unk_024_6e04:
	dr $92e04, $92e36
unk_024_6e36:
	dr $92e36, $93c10

