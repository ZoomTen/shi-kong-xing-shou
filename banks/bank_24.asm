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
	call $6c42
	ret
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
	call $6c42
	call $6c09
	call Func_024_6bd0
	ret
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
	call $6c42
	call $6c09
	ret
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_40ec
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_40ec
	call $6c42
	call $6c7b
	call $6cb4
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
	ld [wd088 + 1], a
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
	dr $90181, $90804

Func_024_4804:
	dr $90804, $92864

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
	call .asm_6941
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
.asm_6941
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_6947
	ld [hli], a
	dec c
	jr nz, .asm_6947
	ret
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
	ld a, b
	ld a, b
	adc a, b
	ld a, b
.asm_696d
	call Func_024_4062
	call DelayFrame
	ldh a, [$ff9d]
	inc a
	ldh [$ff9d], a
	ldh a, [$ffc6]
	and a
	jr nz, .asm_6985
	call .asm_6aab
	call .asm_6989
	jr .asm_696d
.asm_6985
	xor a
	ldh [$ffc6], a
	ret
.asm_6989
	ldh a, [$ff94]
	bit 7, a
	jr z, .asm_69aa
	ld a, [wSelectedOption]
	cp $03
	ret nc
	add $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_69f3
	ld a, [wSelectedOption]
	sub $03
	ld [wSelectedOption], a
	ret
.asm_69aa
	ldh a, [$ff94]
	bit 6, a
	jr z, .asm_69bd
	ld a, [wSelectedOption]
	cp $03
	ret c
	sub $03
	ld [wSelectedOption], a
	jr .asm_69f3
.asm_69bd
	ldh a, [$ff94]
	bit 5, a
	jr z, .asm_69d1
	ld a, [wSelectedOption]
	and a
	ret z
	cp $03
	ret z
	dec a
	ld [wSelectedOption], a
	jr .asm_69f3
.asm_69d1
	ldh a, [$ff94]
	bit 4, a
	jr z, .asm_6a20
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
	jr nz, .asm_69f3
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_69f3
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
	ld [hl], $53
	inc hl
	ld [hl], $45
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [$ffc6], a
.asm_6a20
	ldh a, [$ff94]
	bit 0, a
	jr z, .asm_6a61
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
	ld [hl], $c1
	inc hl
	ld [hl], $41
	ret
.asm_6a61
	ldh a, [$ff94]
	bit 1, a
	jr z, .asm_6a9e
	ld a, $11
	call PlaySound
	ldh a, [$ffd3]
	and a
	jr nz, .asm_6a8c
	ld a, $02
	ld [wd087], a
	ld hl, wd088
	ld [hl], $64
	inc hl
	ld [hl], $45
	xor a
	ld [wd08a], a
	ld a, $01
	ldh [$ffc6], a
	ldh [$ffc5], a
	call $5ffb
	ret
.asm_6a8c
	xor a
	ld [wd08a], a
	ldh [$ffc5], a
	ld [wd087], a
	ld a, $01
	ldh [$ffc6], a
	ld a, $03
	ld [wBattleIntroJumptableIndex], a
.asm_6a9e
	ret
	jr .asm_6aa9
	jr $6ae3
	jr $6b1d
	jr c, .asm_6aaf
	jr c, $6ae9
.asm_6aa9
	jr c, $6b23
.asm_6aab
	ldh a, [$ff9d]
	and $07
.asm_6aaf
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
	ld [hl], $4c
	inc hl
	ld [hl], $45
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
	dr $92bd0, $92d77

unk_024_6d77:
	dr $92d77, $93c10

