asm_02b_4000:
	ld bc, $d200

asm_02b_4003:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_02b_4017

asm_02b_400b:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, asm_02b_4003
	ret

asm_02b_4017:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr nz, asm_02b_400b
	ld [hl], 0
	ld hl, 2
	add hl, bc
	ld [hl], 1
	jr asm_02b_400b
	ret

Func_02b_402b:
	ld a, 1
	ld [wd0fd], a
	xor a
	ld [wd1fc], a
	ld a, $6d
	ld [wd8fe], a
	ld a, [wd981]
	ld e, a
	ld a, [wd981 + 1]
	ld d, a
	inc de
	ld hl, $9908
	ld bc, $0102
	call Func_113f
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld de, 3
	add hl, de
	ld de, $d1f5
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	dec de
	ld hl, $9941
	ld bc, $0203
	call Func_113f
	call Func_02b_431e
	xor a
	ld [wd9d7], a
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	call Func_114c
	ld de, $ffcb
	ld hl, $9945
	ld bc, $0103
	call Func_113f
	ld de, $d876
	inc de
	ld hl, $984b
	ld bc, $0102
	call Func_113f
	call Func_02b_4243
	ret

Func_02b_4098:
	call Func_02b_5651
	call Func_02b_5ef2

Func_02b_409e:
	ld a, [wd986]
	and a
	jr nz, asm_02b_4113
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_4119

asm_02b_40aa:
	call Func_02b_4296
	ldh a, [hFFCB]
	and a
	jr z, asm_02b_4100
	ld [wd9bd], a
	call Func_02b_5b4f
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4296
	ldh a, [hFFCB]
	ld b, a
	ld a, [wd9bd]
	sub b
	ld [wd9bc], a
	call Func_02b_5b82
	ld a, [wd9bc]
	and a
	ret z

asm_02b_40dc:
	ld a, [wd9bd]
	and a
	jp z, asm_02b_5aa5
	call Func_02b_4248
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	dec a
	ld [wd9bd], a
	jp z, asm_02b_5aa5
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_40dc
	ret

asm_02b_4100:
	jp asm_02b_5aa5
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ret

asm_02b_4113:
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_40aa

asm_02b_4119:
	call Func_02b_4374
	ldh a, [hFFCB]
	and a
	jp z, asm_02b_5aaf
	ld [wd9bd], a
	call Func_02b_5b4f
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4374
	ldh a, [hFFCB]
	ld b, a
	ld a, [wd9bd]
	sub b
	ld [wd9bc], a
	call Func_02b_5b82
	ld a, [wd9bc]
	and a
	ret z

asm_02b_414c:
	ld a, [wd9bd]
	and a
	jp z, asm_02b_5aaf
	call Func_02b_4326
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	dec a
	ld [wd9bd], a
	jp z, asm_02b_5aaf
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_414c
	call Func_02b_402b
	ret
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 0
	ld hl, $14
	add hl, bc
	ld a, [hl]
	cp 1
	jp z, asm_02b_5ae1
	inc hl
	ld a, [hl]
	cp 1
	jp z, asm_02b_5ae1
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ret

Func_02b_419d:
	ld a, [wd986]
	and a
	jr nz, asm_02b_41ee
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_41f4

asm_02b_41a9:
	call Func_02b_4296
	ldh a, [hFFCB]
	ld [wd9bd], a
	call Func_02b_5ca2
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4296
	ld a, [wd9bd]
	ld b, a
	ldh a, [hFFCB]
	sub b
	inc a
	ld [wd9bc], a

asm_02b_41d1:
	ld a, [wd9bd]
	call Func_02b_4248
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	inc a
	ld [wd9bd], a
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_41d1
	ret

asm_02b_41ee:
	ld a, [wd9b5]
	and a
	jr nz, asm_02b_41a9

asm_02b_41f4:
	call Func_02b_4374
	ldh a, [hFFCB]
	ld [wd9bd], a
	call Func_02b_5ca2
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_02b_4374
	ld a, [wd9bd]
	ld b, a
	ldh a, [hFFCB]
	sub b
	inc a
	ld [wd9bc], a

asm_02b_421c:
	ld a, [wd9bd]
	call Func_02b_4326
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	inc a
	ld [wd9bd], a
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, asm_02b_421c
	call Func_02b_402b
	ret
	call Func_02b_4a40
	call Func_02b_4a52
	ret

Func_02b_4243:
	call Func_02b_4296
	ldh a, [hFFCB]

Func_02b_4248:
	ld d, 0
	srl a
	rr d
	srl a
	rr d
	srl a
	rr d
	ld e, a
	ld a, d
	swap a
	srl a
	ld d, a
	ld hl, $0d03
	call GetTextBGMapPointer
	push hl
	ld c, 6

asm_02b_4266:
	call WaitVRAM_STAT
	ld a, $a1
	ld [hli], a
	dec c
	jr nz, asm_02b_4266
	pop hl
	ld a, e
	ld b, a
	and a
	jr z, asm_02b_427e

asm_02b_4275:
	call WaitVRAM_STAT
	ld a, $99
	ld [hli], a
	dec e
	jr nz, asm_02b_4275

asm_02b_427e:
	ld a, b
	cp 6
	ret z
	ld a, e
	and a
	jr nz, asm_02b_428c
	ld a, d
	and a
	jr nz, asm_02b_428c
	ld d, 1

asm_02b_428c:
	ld a, $a1
	sub d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

Func_02b_4296:
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	ld [wd999], a
	ld a, [hl]
	ld [wd998], a
	xor a
	ld [wd9d7], a
	farcall Func_025_4101
	ld a, [hFFCB]
	ld [wd99a], a
	ld a, [hFFCC]
	ld [wd99b], a
	call Func_02b_42c4
	ret

Func_02b_42c4:
	ld a, [wd998]
	ld [hFFCB], a
	ld a, [wd999]
	ld [hFFCC], a
	xor a
	ld [hFFCD], a
	ld a, 2
	ldh [hFFC7], a
	farcall asm_025_41b8
	ld a, $30
	ldh [hFFC7], a
	farcall Func_025_414a
	ldh a, [hFFCB]
	push af
	ldh a, [hFFCC]
	push af
	ldh a, [hFFCD]
	push af
	ld a, [wd99a]
	ldh [hFFCB], a
	ld a, [wd99b]
	ldh [hFFCC], a
	xor a
	ldh [hFFCD], a
	ld a, 2
	ldh [hFFC7], a
	farcall asm_025_41b8
	ldh a, [hFFCB]
	ldh [hFFC7], a
	pop af
	ldh [hFFCD], a
	pop af
	ldh [hFFCC], a
	pop af
	ldh [hFFCB], a
	farcall asm_025_41b8
	ld d, 0
	ret

Func_02b_431e:
	call Func_02b_4374
	call DelayFrame
	ldh a, [hFFCB]

Func_02b_4326:
	ld d, 0
	srl a
	rr d
	srl a
	rr d
	srl a
	rr d
	ld e, a
	ld a, d
	swap a
	srl a
	ld d, a
	ld hl, $0609
	call GetTextBGMapPointer
	push hl
	ld c, 6

asm_02b_4344:
	call WaitVRAM_STAT
	ld a, $a2
	ld [hld], a
	dec c
	jr nz, asm_02b_4344
	pop hl
	ld a, e
	ld b, a
	and a
	jr z, asm_02b_435c

asm_02b_4353:
	call WaitVRAM_STAT
	ld a, $aa
	ld [hld], a
	dec e
	jr nz, asm_02b_4353

asm_02b_435c:
	ld a, b
	cp 6
	ret z
	ld a, e
	and a
	jr nz, asm_02b_436a
	ld a, d
	and a
	jr nz, asm_02b_436a
	ld d, 1

asm_02b_436a:
	ld a, $a2
	add d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

Func_02b_4374:
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	ld [wd999], a
	ld a, [hl]
	ld [wd998], a
	xor a
	ld [wd9d7], a
	ld a, [wd983]
	ld [wd08e], a
	farcall asm_025_410d
	ld a, [hFFCB]
	ld [wd99a], a
	ld a, [hFFCC]
	ld [wd99b], a
	call Func_02b_42c4
	ret

BattleJumptable:
	ld de, .Jumptable
	ldh a, [hBattleJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw HandleBattleIntro
	dw HandleBattleIntro
	dw HandleBattleMenu
	dw HandleBattleMoves
	dw HandleBattleTurns
	dw HandleBattleEnd

HandleBattleEnd:
	dr $ac3c2, $ac569

Func_02b_4569::
	dr $ac569, $aca40

Func_02b_4a40:
    dr $aca40, $aca52

Func_02b_4a52:
    dr $aca52, $acd8c

HandleBattleTurns:
	dr $acd8c, $ad547

Func_02b_5547:
	dr $ad547, $ad5cb

Func_02b_55cb:
	ld c, 32
.delay
	call DelayFrame
	dec c
	jr nz, .delay
	ret

Func_02b_55d4:
	dr $ad5d4, $ad651

Func_02b_5651:
	dr $ad651, $adaa5

asm_02b_5aa5:
	dr $adaa5, $adaaf

asm_02b_5aaf:
	dr $adaaf, $adae1

asm_02b_5ae1:
	dr $adae1, $adb4f

Func_02b_5b4f:
	dr $adb4f, $adb82

Func_02b_5b82:
	dr $adb82, $adca2

Func_02b_5ca2:
	dr $adca2, $adef2

Func_02b_5ef2:
	dr $adef2, $ae17c

HandleBattleMoves:
	dr $ae17c, $ae417

HandleBattleMenu:
	dr $ae417, $ae847


HandleBattleIntro:
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw BattleIntro_Jump_1
	dw BattleIntro_Jump_2
	dw BattleIntro_Jump_3
	dw BattleIntro_Jump_4
	dw BattleIntro_Jump_5
	dw BattleIntro_Jump_6

BattleIntro_Jump_1:
	farcall Func_00b_4dc5
	call DelayFrame
	farcall Func_00b_4dc5
	call DelayFrame
	farcall Func_00b_4dc5
	call DelayFrame
	call Func_1159
	ld a, [wd991]
	and 7
	ld [wdcd9], a
	xor a
	ld [wdcda], a
	farcall StartBattleTransition
	call DelayFrame
	ld a, $e1
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, $80
	ldh [rLCDC], a
	ld hl, wcab0
	ld de, wcb30
	ld bc, $80
	call CopyBytes3
	ld hl, unk_2b38
	call CopyBackgroundPalettes
	ld hl, unk_2b38
	call CopyObjectPalettes
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4

asm_02b_68c3:
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, asm_02b_68c3
	ldh a, [hSCX]
	ld [wd9ec], a
	ldh a, [hFFAF]
	ld [wd9ed], a
	ldh a, [hSCY]
	ld [wd9ee], a
	ldh a, [hFFB1]
	ld [wd9ef], a
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wd9f8], a
	ld [wd08a], a
	ld [wd9cc], a
	ld [wd9cc + 1], a
	ld [wd9ca], a
	ld [wd9cb], a
	ld [wd9f6], a
	ld [wd9f5], a
	ld [wd9ea], a
	ld [wdb18], a
	ld [wd996], a
	ld [wd997], a
	ld [wd9b4], a
	ld [wd9b3], a
	ld [wd9b8], a
	ld [wd9b9], a
	call ClearBGMap0
	ld hl, wd978
	ld c, 8
	xor a

asm_02b_6922:
	ld [hli], a
	dec c
	jr nz, asm_02b_6922
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld bc, wPartyMons

asm_02b_692e:
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, asm_02b_693a
	and 1
	ld [hl], a

asm_02b_693a:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, asm_02b_692e
	call DelayFrame
	ret

BattleIntro_Jump_2:
	call DelayFrame
	call Func_02b_69fa
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a
	ld a, [hl]
	ld [wd9e5], a
	farcall unk_02c_4000
	call DelayFrame
	farcall asm_00a_4593
	call Func_02b_6ad1
	call DelayFrame
	ld hl, unk_02b_6cd6
	ld de, $96d0
	ld bc, $90
	call CopyBytesVRAM
	ld hl, unk_02b_6c06
	ld de, $9000
	ld bc, $d0
	call CopyBytesVRAM
	call DelayFrame
	ld hl, unk_02b_6d66
	ld de, $cab0
	ld bc, $30
	call CopyBytes3
	ld hl, unk_02b_74d6
	ld de, $caf0
	ld bc, $30
	call CopyBytes3
	call DelayFrame
	ld de, unk_02b_6e56
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hFF92], a
	ldh [hFF93], a
	call PlaceTilemap
	ld de, unk_02b_6ee6
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hFF92], a
	ldh [hFF93], a
	call PlaceAttrmap
	ld de, unk_02b_6e7a
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hFF92], a
	ldh [hFF93], a
	call PlaceTilemap
	ld de, unk_02b_6e9e
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hFF92], a
	ldh [hFF93], a
	call PlaceAttrmap
	call DelayFrame
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	call Func_02b_6a41
	ret

Func_02b_69fa:
	ld de, unk_02b_6a15
	ld a, [wd9be]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	call PlaySound
	ret
	ld a, $74
	call PlaySound
	ret
	ld a, $69
	call PlaySound
	ret

unk_02b_6a15:
	db BGM_5a, BGM_5f, BGM_61, BGM_62, BGM_5a
	db BGM_5a, BGM_5f, BGM_61, BGM_62, BGM_5a
	db BGM_5a, BGM_5f, BGM_61, BGM_62, BGM_5a
	db BGM_5a, BGM_5f, BGM_61, BGM_62, BGM_5a
	db BGM_5a, BGM_5f, BGM_61, BGM_62, BGM_5a
	db BGM_5a, BGM_5f, BGM_61, BGM_62, BGM_5a

	ld hl, wd93c
	ld c, 6
	jr asm_02b_6a46
	ld hl, wd900
	ld c, 6
	jr asm_02b_6a46

Func_02b_6a41:
	ld hl, wd900
	ld c, $c

asm_02b_6a46:
	ld a, $a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, asm_02b_6a46
	ret

BattleIntro_Jump_3:
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld a, $40
	ldh [hSCX], a
	ld a, $c0
	ld [wWX], a
	xor a
	ld [wWY], a
	ld hl, $1072
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e1], a
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wcab0
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	ld a, 3
	ld [wBattleIntroJumptableIndex], a
	ret

BattleIntro_Jump_4:
	ldh a, [hSCX]
	sub 2
	ldh [hSCX], a
	ld a, [wWX]
	add 2
	ld [wWX], a
	and a
	jr z, asm_02b_6a9f
	ret

asm_02b_6a9f:
	ld a, 4
	ld [wBattleIntroJumptableIndex], a
	ld de, unk_02b_6d96
	ld hl, $98e1
	ld bc, $0904
	ld a, 9
	ldh [hFF92], a
	ld a, 4
	ldh [hFF93], a
	call PlaceTilemap
	call Func_02b_6ae6
	ret
	ld de, unk_02b_6dde
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hFF92], a
	ld a, 6
	ldh [hFF93], a
	call PlaceTilemap
	ret

Func_02b_6ad1:
	ld hl, wd86a
	ld a, $55
	ld [wd08b], a
	ld a, $61
	ld [wd08c], a
	xor a
	ld [wCharacterTilePos], a
	call Func_0b65
	ret

Func_02b_6ae6:
	xor a
	ld [wd0c1], a
	ld de, $9942
	ld bc, wPartyMons

asm_02b_6af0:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, asm_02b_6b20
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, asm_02b_6b08
	call WaitVRAM_STAT
	ld a, $6d
	ld [de], a
	jr asm_02b_6b0e

asm_02b_6b08:
	call WaitVRAM_STAT
	ld a, $6e
	ld [de], a

asm_02b_6b0e:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 6
	jr c, asm_02b_6af0

asm_02b_6b20:
	xor a
	ld [wd0c1], a
	ld a, [wd9dc]
	and a
	ret z
	ld de, $988b
	ld bc, wd876

asm_02b_6b2f:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, asm_02b_6b46
	call WaitVRAM_STAT
	ld a, $6d
	ld [de], a
	jr asm_02b_6b4c

asm_02b_6b46:
	call WaitVRAM_STAT
	ld a, $6e
	ld [de], a

asm_02b_6b4c:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 6
	jr c, asm_02b_6b2f
	ret

BattleIntro_Jump_5:
	ld a, 1
	ld [wd986], a
	ld a, 1
	ld [wd9b5], a
	call Func_1159
	ld a, [wd991]
	and 1
	add $55
	ld [wd3ff], a
	farcall Func_02d_4000
	call Func_02b_55cb
	call Func_02b_55cb
	xor a
	ld [wd9b5], a
	call Func_1159
	ld a, [wd991]
	and 1
	add 2
	ld [wd3ff], a
	farcall Func_02d_4000
	ld a, 9
	ldh [hFF92], a
	ld a, 4
	ldh [hFF93], a
	ld bc, $0904
	ld hl, $9829
	call Func_0fef
	ld bc, $0904
	ld hl, $98e1
	call Func_0fef
	ld a, $14
	ldh [hFF92], a
	ld a, 6
	ldh [hFF93], a
	ld bc, $1406
	ld hl, $9980
	call Func_0fef
	ld a, 5
	ld [wBattleIntroJumptableIndex], a
	ret

BattleIntro_Jump_6:
	ld a, [wWX]
	sub 4
	ld [wWX], a
	cp $c0
	ret nc
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hFF92], a
	ld a, 6
	ldh [hFF93], a
	call Func_0fef
	xor a
	ldh [hSCX], a
	ld [wWX], a
	ld a, 2
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	di
	ld a, $8f
	ldh [rLYC], a
	ei
	ld hl, $106f
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e1], a
	ret

unk_02b_6c06:
	dr $aec06, $aecd6

unk_02b_6cd6::
	dr $aecd6, $aed66

unk_02b_6d66::
	dr $aed66, $aed96

unk_02b_6d96::
	dr $aed96, $aedde

unk_02b_6dde::
	dr $aedde, $aee56

unk_02b_6e56::
	dr $aee56, $aee7a

unk_02b_6e7a::
	dr $aee7a, $aee9e

unk_02b_6e9e::
	dr $aee9e, $aeee6

unk_02b_6ee6::
	dr $aeee6, $af4d6

unk_02b_74d6::
	dr $af4d6, $af650

