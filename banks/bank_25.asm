Func_025_4000::
	ld a, [wd3f0]
	ld c, a
	ld a, [wd3f1]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	and a
	jr z, Func_025_4017
	ldh [hMathValue], a
	ld a, [hl]
	ldh [hMathValue + 1], a
	jr Func_025_4020

Func_025_4017::
	ld a, [hl]
	and a
	ret z
	xor a
	ldh [hMathValue + 1], a
	ld a, [hl]
	ldh [hMathValue], a

Func_025_4020::
	xor a
	ldh [hMathValue + 2], a
	ld a, $20
	ldh [hMathOperand], a
	call Multiply32By8
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	push af
	ldh a, [hMathValue + 1]
	push af
	ldh a, [hMathValue + 2]
	push af
	xor a
	ld [wd9d7], a
	ld a, [wd3f0]
	ld c, a
	ld a, [wd3f1]
	ld b, a
	call _ComputeStatValue
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	ldh [hMathOperand], a
	pop af
	ldh [hMathValue + 2], a
	pop af
	ldh [hMathValue + 1], a
	pop af
	ldh [hMathValue], a
	ld b, 4
	call Divide32By16
	ret

ScanParty::
	ld bc, wPartyMons

Func_025_406a::
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, Func_025_407b
	call Func_025_4087
	ld a, [wPartyScanType]
	cp $ff
	ret z

Func_025_407b::
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, Func_025_406a
	ret

Func_025_4087::
	ld de, unk_025_4737
	ld a, [bc]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, Func_025_4099
	ld a, [wPartyScanType]
	cp [hl]
	jr z, Func_025_40d3

Func_025_4099::
	ld hl, $14
	add hl, bc
	ld a, [hli]
	cp $11
	jr c, Func_025_40b8
	cp $15
	jr nc, Func_025_40b8
	sub $f
	ld [hFFD7], a
	ld d, a
	ld a, [wPartyScanType]
	cp d
	jr nz, Func_025_40b8
	call Func_025_47fd
	and a
	jr z, Func_025_40d3

Func_025_40b8::
	ld hl, $15
	add hl, bc
	ld a, [hli]
	cp $11
	ret c
	cp $15
	ret nc
	sub $f
	ld [hFFD7], a
	ld d, a
	ld a, [wPartyScanType]
	cp d
	ret nz
	call Func_025_47fd
	and a
	ret nz

Func_025_40d3::
	ld a, $ff
	ld [wPartyScanType], a
	ret

Func_025_40d9::
	ld a, [wd986]
	and a
	jr nz, Func_025_40f0
	ld a, [wd9b2]
	and a
	jr nz, Func_025_40f6

Func_025_40e5::
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jp _ComputeStatValue

Func_025_40f0::
	ld a, [wd9b2]
	and a
	jr nz, Func_025_40e5

Func_025_40f6::
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jp _ComputeStatValue

INCLUDE "engine/battle/stat_calc.asm"

Func_025_4222::
	ld a, e
	cp 1
	jr nz, Func_025_4228
	dec b

Func_025_4228::
	ldh a, [hMathOperand]
	srl a
	ldh [hMathOperand], a
	ldh a, [hMathOperand + 1]
	rr a
	ldh [hMathOperand + 1], a
	jr Func_025_41d1

Func_025_4236::
	ldh a, [hMathValue + 2]
	ldh [hMathOperand], a
	ldh a, [hMathAccum]
	ldh [hMathValue], a
	ldh a, [hMathAccum + 1]
	ldh [hMathValue + 1], a
	ldh a, [hMathAccum + 2]
	ldh [hMathValue + 2], a
	ldh a, [hMathAccum + 3]
	ldh [hMathValue + 3], a
	pop de
	pop bc
	pop hl
	ret

Func_025_424e::
	ld de, Jumptable_025_42b3
	ld a, [wBattleScriptByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Func_025_425d::
	ld de, wd1f5
	ld a, [wd0c3]
	ld [de], a
	ld bc, $9831
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, $ea
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ret

Func_025_4288::
	ld de, wd1f5
	ld a, [wd0c3]
	ld [de], a
	ld bc, $9891
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ret

Jumptable_025_42b3::
	dw Func_025_4373
	dw Func_025_4377
	dw Func_025_43a5
	dw Func_025_43ac
	dw Func_025_43e3
	dw Func_025_4465
	dw Func_025_4470
	dw Func_025_447e
	dw Func_025_4488
	dw Func_025_44a0
	dw Func_025_44b8
	dw Func_025_4525
	dw Func_025_4543
	dw Func_025_4561
	dw Func_025_4573
	dw Func_025_4582
	dw Func_025_459a
	dw Func_025_45bf
	dw Func_025_45d7
	dw Func_025_462e
	dw Func_025_4640
	dw Func_025_4684
	dw Func_025_4697
	dw Func_025_46a8
	dw Func_025_46b3
	dw Func_025_4858
	dw Func_025_489e
	dw Func_025_48a6
	dw Func_025_48d3
	dw Func_025_4944
	dw Func_025_4a32
	dw Func_025_4a75
	dw Func_025_4b0a
	dw Func_025_4b7a
	dw Func_025_4b9b
	dw Func_025_4bae
	dw Func_025_4bf1
	dw Func_025_4c16
	dw Func_025_4c6f
	dw Func_025_4c95
	dw Func_025_4cba
	dw Func_025_4d25
	dw Func_025_4d3d
	dw Func_025_4d5c
	dw Func_025_4d8f
	dw Func_025_4dd8
	dw Func_025_4e07
	dw Func_025_4e5b
	dw Func_025_4ea4
	dw Func_025_4edb
	dw Func_025_4efe
	dw Func_025_4f10
	dw Func_025_4f87
	dw Func_025_4fc0
	dw Func_025_4fd2
	dw Func_025_501e
	dw Func_025_5044
	dw Func_025_5061
	dw Func_025_50ad
	dw Func_025_514f
	dw Func_025_51e3
	dw Func_025_527c
	dw Func_025_52a3
	dw Func_025_52f1
	dw Func_025_532e
	dw Func_025_533d
	dw Func_025_535a
	dw Func_025_5377
	dw Func_025_53ae
	dw Func_025_5464
	dw Func_025_546f
	dw Func_025_5487
	dw Func_025_54b1
	dw Func_025_54b7
	dw Func_025_54bd
	dw Func_025_54d0
	dw Func_025_558b
	dw Func_025_559e
	dw Func_025_55b4
	dw Func_025_55e1
	dw Func_025_4b40
	dw Func_025_487b
	dw Func_025_5199
	dw Func_025_4dad
	dw Func_025_55e6
	dw Func_025_5124
	dw Func_025_5087
	dw Func_025_50ef
	dw Func_025_43fe
	dw Func_025_442f
	dw Func_025_44de
	dw Func_025_444a
	dw Func_025_4c3c
	dw Func_025_4b5d
	dw Func_025_5566
	dw Func_025_50cc

Func_025_4373::
	call AdvanceBattleScript
	ret

Func_025_4377::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wMenuTextX], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	push de
	pop hl
	call PrintMenuText
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_43a5::
	farcall Func_04a_5691
	ret

Func_025_43ac::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call CopyBytesVRAM_Bank0C
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_43e3::
	ld bc, wcde0
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	ld a, 1
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_43fe::
	ld bc, wcdf0
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	ld a, 4
	ld [bc], a
	ld bc, wcdf8
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	ld a, 6
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_442f::
	farcall Func_00c_402b
	farcall StageSelectedCharObjPal
	ld hl, wcaf0
	ld c, $80
	ld b, $40
	call LoadPalettes_OCPD
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_444a::
	farcall Func_00c_4000
	farcall Func_20_4048
	ld hl, wcaf0
	ld c, $80
	ld b, $40
	call LoadPalettes_OCPD
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4465::
	xor a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ret

Func_025_4470::
	call Func_025_6078
	call Func_025_605f
	call Func_025_602a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_447e::
	xor a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ret

Func_025_4488::
	ld a, $80
	ldh [rLCDC], a
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_44a0::
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_44b8::
	ldh a, [hSCX]
	ld [wd0bc], a
	ldh a, [hSCXHigh]
	ld [wd0bd], a
	ldh a, [hSCY]
	ld [wd0be], a
	ldh a, [hSCYHigh]
	ld [wd0bf], a
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wBattleScriptByte], a
	call ClearBGMap0
	ret

Func_025_44de::
	ld a, [wPlayerChar]
	ld [wSelectedOption], a
	ld de, MenuOptionTable_025_4505
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
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
	xor a
	ld [wBattleScriptByte], a
	ret

MenuOptionTable_025_4505::
	dw $1420

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_025_4507::
	dw $1818
	dw $3420
	dw $3818
	dw $5420
	dw $5818
	dw $7420
	dw $7818
	dw $1448
	dw $1840
	dw $3448
	dw $3840
	dw $5448
	dw $5840
	dw $7448
	dw $7840

Func_025_4525::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4543::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4561::
	call GetPartyMonPtr
	ld a, [bc]
	ld [wd9d9], a
	farcall Func_026_4c89
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4573::
	call GetPartyMonPtr
	ld a, [bc]
	ld [wd9d9], a
	call LoadMonPic
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4582::
	ld bc, $c0
	ld hl, $9620
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall asm_026_464f
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_459a::
	xor a
	ld [wd0c3], a
	ld bc, wPartyMons

Func_025_45a1::
	ld a, [bc]
	and a
	jr z, Func_025_45ba
	call Func_025_585a
	ld a, [wd0c3]
	inc a
	ld [wd0c3], a
	ld hl, $16
	add hl, bc
	ld c, l
	ld b, h
	ld a, c
	cp $80
	jr c, Func_025_45a1

Func_025_45ba::
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_45bf::
	ld hl, wc000
	ld bc, $28
	ld de, 4

Func_025_45c8::
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, Func_025_45c8
	xor a
	ld [wBattleScriptByte], a
	ld [wVirtualOAMPtr], a
	ret

Func_025_45d7::
	call GetPartyMonPtr

Func_025_45da::
	push bc
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	ld de, wd1f5
	ld [de], a
	inc de
	dec bc
	ld a, [bc]
	ld [de], a
	dec de
	ld hl, $998a
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	xor a
	ld [wd9d7], a
	call _ComputeStatValue
	ld de, wd1f5
	ldh a, [hMathValue + 1]
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	dec de
	ld hl, $99aa
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_462e::
	call GetPartyMonPtr
	ld a, [bc]
	ld [wd9d9], a
	farcall Func_026_4cb6
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4640::
	ld a, [wd0bc]
	ldh [hSCX], a
	ld a, [wd0bd]
	ldh [hSCXHigh], a
	ld a, [wd0be]
	ldh [hSCY], a
	ld a, [wd0bf]
	ldh [hSCYHigh], a
	call LoadMapGFX
	decoord 0, 0
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1412
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, $12
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call Func_025_57a0
	ld hl, wScreenRowBuffer
	ld de, wPaletteBuffer
	ld bc, $80
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4684::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ldh [hFFC5], a
	call Func_025_572f
	xor a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ret

Func_025_4697::
	ld hl, wPaletteBuffer
	ld de, wScreenRowBuffer
	ld bc, $80
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_46a8::
	farcall _BuildVirtualOAM
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_46b3::
	xor a
	ld [wd0c1], a
	ld [wd0c0], a
	ld a, 1
	ld [wd9d8], a
	ldh a, [hBattleJumptableIndex]
	and a
	jr nz, Func_025_46d0
	call GetPartyMonPtr
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, Func_025_46d0

Func_025_46d0::
	ld de, Pointers_025_4848
	ld a, [wd9d8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [hli]
	ld c, a
	ldh [hVRAMCopyHeight], a
	push hl
	pop de
	ld a, [de]
	inc de
	ld l, a
	ld [wd0b8], a
	ld a, [de]
	inc de
	ld h, a
	ld [wd0b9], a
	call PlaceTilemap
	ld de, Pointers_025_4850
	ld a, [wd9d8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [hli]
	ld c, a
	ldh [hVRAMCopyHeight], a
	push hl
	pop de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	call PlaceAttrmap
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_471d:: ; unreferenced?
	ld de, unk_025_4737
	ld a, [bc]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hFFD7], a
	jp Func_025_47bb

Func_025_472f::
	ld a, [wd9d8]
	inc a
	ld [wd9d8], a
	ret

; TODO: unk_ - lookup table indexed by bc
unk_025_4737::
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $6
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0

Func_025_47a6:: ; unreferenced?
	ld hl, $14
	add hl, bc
	ld a, [hli]
	cp $11
	ret c
	cp $15
	ret nc
	sub $f
	ld [hFFD7], a
	call Func_025_47fd
	and a
	ret nz

Func_025_47bb::
	ld a, [hFFD7]
	call Func_025_574c

Func_025_47c1::
	ld a, [wd9d8]
	inc a
	ld [wd9d8], a
	ld a, [wd0c1]
	and a
	jr z, Func_025_47d5
	ld a, [hFFD7]
	ld [wd0c0], a
	ret

Func_025_47d5::
	ld a, [hFFD7]
	ld [wd0c1], a
	ret

Func_025_47dc:: ; unreferenced?
	ld hl, $15
	add hl, bc
	ld a, [hli]
	cp $11
	ret c
	cp $15
	ret nc
	sub $f
	ld [hFFD7], a
	call Func_025_47fd
	and a
	ret nz
	jp Func_025_47bb

Func_025_47f4:: ; unreferenced?
	ld a, [hFFD7]
	call Func_025_574c
	jp Func_025_47c1

Func_025_47fd::
	push hl
	cp 5
	jr nz, Func_025_480b
	push af
	ld a, [wdce4]
	cp 1
	jr nz, Func_025_4822
	pop af

Func_025_480b::
	ld de, Pointers_025_482a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [bc]
	ld e, a

Func_025_4818::
	ld a, [hli]
	cp $ff
	jr z, Func_025_4823
	cp e
	jr z, Func_025_4827
	jr Func_025_4818

Func_025_4822::
	pop af

Func_025_4823::
	ld a, 1
	pop hl
	ret

Func_025_4827::
	xor a
	pop hl
	ret

Pointers_025_482a::
	dw unk_025_4836
	dw unk_025_483e
	dw unk_025_4840
	dw unk_025_4842
	dw unk_025_4844
	dw unk_025_4846

; TODO: unk_ - record pointed to by a dw pointer-table
unk_025_4836::
	db $2, $3, $5, $6, $7, $9, $a, -1
; TODO: unk_ - record pointed to by a dw pointer-table
unk_025_483e::
	db $d, -1
; TODO: unk_ - record pointed to by a dw pointer-table
unk_025_4840::
	db $22, -1
; TODO: unk_ - record pointed to by a dw pointer-table
unk_025_4842::
	db $22, -1
; TODO: unk_ - record pointed to by a dw pointer-table
unk_025_4844::
	db $30, -1
; TODO: unk_ - record pointed to by a dw pointer-table
unk_025_4846::
	db $22, -1

Pointers_025_4848::
	dw Tilemap_025_61c4
	dw Tilemap_025_61c4
	dw Tilemap_025_6220
	dw Tilemap_025_62a8
Pointers_025_4850::
	dw Tilemap_025_61f2
	dw Tilemap_025_61f2
	dw Tilemap_025_6264
	dw Tilemap_025_62fc

Func_025_4858::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	ld [hVRAMCopyHeight], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [wd0b8]
	ld l, a
	ld a, [wd0b9]
	ld h, a
	call ClearBGMapBox
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_487b::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	ld [hVRAMCopyHeight], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [wd0b8]
	ld l, a
	ld a, [wd0b9]
	ld h, a
	call ClearBGMapBox_VRAM1
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_489e::
	xor a
	ld [wBattleScriptByte], a
	ld [wBattleScriptState], a
	ret

Func_025_48a6::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	ldh [hVRAMCopyHeight], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	ldh [hVRAMCopyWidth], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call ClearBGMapBox
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_48d3::
	call GetPartyMonPtr
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, Func_025_492f
	ld [wd9d8], a
	bit 0, a
	call nz, Func_025_4901
	ld a, [wd9d8]
	bit 1, a
	call nz, Func_025_4909
	ld a, [wd9d8]
	bit 4, a
	call nz, Func_025_4911
	ld a, [wd9d8]
	bit 5, a
	call nz, Func_025_4919
	jr Func_025_492f

Func_025_4901::
	ld de, Tilemap_025_4934
	ld hl, $0f0c
	jr Func_025_491f

Func_025_4909::
	ld de, Tilemap_025_4938
	ld hl, $110c
	jr Func_025_491f

Func_025_4911::
	ld de, Tilemap_025_493c
	ld hl, $0f0e
	jr Func_025_491f

Func_025_4919::
	ld de, Tilemap_025_4940
	ld hl, $110e

Func_025_491f::
	call GetTextBGMapPointer
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

Func_025_492f::
	xor a
	ld [wBattleScriptByte], a
	ret

Tilemap_025_4934::
	db $2e, $2f, $36, $37
Tilemap_025_4938::
	db $32, $33, $3a, $3b
Tilemap_025_493c::
	db $30, $31, $38, $39
Tilemap_025_4940::
	db $34, $35, $3c, $3d

Func_025_4944::
	call GetPartyMonPtr

Func_025_4947::
	push bc
	ld a, 1
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9846
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld a, 2
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9886
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld a, 3
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9850
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld a, 5
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9890
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld de, wd1f5
	ld hl, 6
	add hl, bc
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	dec de
	dec de
	ld hl, $98e6
	ld bc, $0306
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	call Func_025_561b
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4a32::
	ld hl, wcde0
	ld [hl], $a0
	ld hl, wcdf0
	ld [hl], $a0
	ld a, [wSelectedOption]
	and a
	jr z, Func_025_4a65
	ld hl, wcdf0
	ld a, $90
	ld [hli], a
	ld a, $4e
	ld [hli], a
	ld a, 2
	ld [hli], a
	ld a, [wSelectedOption]
	cp 5
	jr z, Func_025_4a70
	push af
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	pop af
	ld [wSelectedOption], a
	ld a, [bc]
	and a
	jr z, Func_025_4a70

Func_025_4a65::
	ld hl, wcde0
	ld a, $90
	ld [hli], a
	ld a, $5a
	ld [hli], a
	ld [hl], 1

Func_025_4a70::
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4a75::
	ld bc, $0400
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr

Func_025_4a85::
	xor a
	ld [wd0c0], a
	ld hl, 7
	add hl, bc

Func_025_4a8d::
	ld a, [hli]
	and a
	jr z, Func_025_4b05
	ld [wd9d8], a
	ld a, [hli]
	ld [wd0c3], a
	ld a, [hli]
	ld [wPlayerMap2Y], a
	push hl
	farcall Func_026_4012
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0302
	add hl, bc
	call GetTextBGMapPointer
	ld de, wd1f5
	ld a, [wd0c3]
	ld [de], a
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0602
	add hl, bc
	call GetTextBGMapPointer
	ld de, wd1f5
	ld a, [wPlayerMap2Y]
	ld [de], a
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop hl
	ld a, [wd0c0]
	inc a
	ld [wd0c0], a
	cp 4
	jr nz, Func_025_4a8d

Func_025_4b05::
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4b0a::
	ld bc, $0100
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	ld hl, $14
	add hl, bc
	ld a, [hli]
	ld [wd0c1], a
	ld d, a
	ld a, [hli]
	ld [wd0c0], a
	ld a, $a0
	ld [wMenuTextX], a
	ld a, $fd
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall PrintEquipmentName
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4b40::
	ld bc, $40
	ld hl, $8790
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	ld a, [bc]
	ld d, a
	farcall Func_01e_42ba
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4b5d::
	ld bc, $40
	ld hl, $8790
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetBoxMonPtr
	ld a, [bc]
	ld d, a
	farcall Func_01e_42ba
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4b7a::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
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
	ld a, 1
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4b9b::
	ld hl, wcde0
	ld de, wcdf0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4bae::
	ld a, [wSelectedOption]
	push af
	ld a, [wd9d9]
	ld [wSelectedOption], a
	call GetPartyMonPtr
	pop af
	push bc
	ld [wSelectedOption], a
	ld hl, wd100
	ld d, $16

Func_025_4bc5::
	ld a, [bc]
	ld [hli], a
	inc bc
	dec d
	jr nz, Func_025_4bc5
	call GetPartyMonPtr
	push bc
	pop hl
	pop bc
	push hl
	ld d, $16

Func_025_4bd4::
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, Func_025_4bd4
	pop bc
	ld hl, wd100
	ld d, $16

Func_025_4be0::
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, Func_025_4be0
	ld a, [wd9d9]
	ld [wSelectedOption], a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4bf1::
	call AdvanceBattleScript
	ld de, wd1a0
	ld a, [wBattleScriptByte]
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
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
	ld a, 1
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4c16::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $a0
	ld [wMenuTextX], a
	ld a, $e8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4c3c::
	ld bc, $0200
	ld hl, $9600
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0280
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $60
	ld [wMenuTextX], a
	ld a, $a8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4c6f::
	ld bc, $0240
	ld hl, $8d80
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $d8
	ld [wMenuTextX], a
	ld a, $fc
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4c95::
	ld bc, $0400
	ld hl, $9400
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0100
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall DrawItemListPage
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4cba::
	ld a, [wSelectedPage]
	and a
	jr z, Func_025_4cca
	ld hl, $996f
	call WaitVRAM_STAT
	ld [hl], $e8
	jr Func_025_4cd2

Func_025_4cca::
	ld hl, $996f
	call WaitVRAM_STAT
	ld [hl], 0

Func_025_4cd2::
	ld a, [wSelectedPage]
	inc a
	call Func_025_4d12
	and a
	jr z, Func_025_4ce6
	ld hl, $9972
	call WaitVRAM_STAT
	ld [hl], $e9
	jr Func_025_4cee

Func_025_4ce6::
	ld hl, $9972
	call WaitVRAM_STAT
	ld [hl], 0

Func_025_4cee::
	ld de, wd1f5
	ld a, [wSelectedPage]
	inc a
	ld [de], a
	ld hl, $9970
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4d12::
	ld l, a
	add a
	add a
	add l

Func_025_4d16::
	ld l, a
	ld h, 0
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	add hl, hl
	add hl, de
	ld a, [hl]
	ret

Func_025_4d25::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_01e_47fb
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4d3d::
	ld bc, $0400
	ld hl, $9400
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0100
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4d5c::
	ld a, [wd9d3]
	ld de, wd1f5
	ld [de], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4d8f::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_026_45f8
	farcall Func_01e_484f
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4dad::
	ld bc, $0400
	ld hl, $9400
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $80
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_026_45f8
	farcall Func_01e_487b
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4dd8::
	call GetPartyMonPtr
	ld bc, $0500
	ld hl, $8a80
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_026_45f8
	ld a, $a8
	ld [wMenuTextX], a
	ld a, $f8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4e07::
	ld bc, $0400
	ld hl, $8980
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	xor a
	ld [wd0c0], a
	ld hl, 7
	add hl, bc

Func_025_4e1f::
	ld a, [hli]
	and a
	jr z, Func_025_4e56
	ld [wd9d8], a
	ld a, [hli]
	ld [wd0c3], a
	ld a, [hli]
	ld [wPlayerMap2Y], a
	ld a, [wd0c0]
	add a
	add a
	add a
	add a
	add $98
	ld [wMenuTextX], a
	ld a, $d8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	push hl
	farcall Func_026_4000
	pop hl
	ld a, [wd0c0]
	inc a
	ld [wd0c0], a
	cp 4
	jr nz, Func_025_4e1f

Func_025_4e56::
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4e5b::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wd9d8], a
	swap a
	ld l, a
	and $f
	or $80
	ld h, a
	ld a, l
	and $f0
	ld l, a
	ld bc, $0100
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	ld hl, $14
	add hl, bc
	ld a, [hli]
	ld [wd0c1], a
	ld d, a
	ld a, [hli]
	ld [wd0c0], a
	ld a, [wd9d8]
	ld [wMenuTextX], a
	ld a, $90
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall PrintEquipmentName
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4ea4::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld de, wd1a0
	ld a, $b
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	call GetPartyMonPtrByIndex
	ld hl, $14
	add hl, bc
	ld a, [wPlayerMap2Y]
	add l
	ld [wd9d4], a
	ld a, h
	ld [wd9d5], a
	farcall Func_01e_4745
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4edb::
	ld de, wd7cb
	ld a, [wd9d8]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, Func_025_4eef
	xor a
	ld [wd9d9], a
	jr Func_025_4ef6

Func_025_4eef::
	ld a, [wd9d8]
	inc a
	ld [wd9d9], a

Func_025_4ef6::
	call LoadMonPic
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4efe::
	ld a, [wd9d8]
	inc a
	ld [wd9d9], a
	farcall Func_026_4c89
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4f10::
	ld bc, $0600
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wSelectedPage]
	ld hl, wd7cb
	ld de, 8
	call Func_025_4f7f
	xor a
	ld [wd0c1], a

Func_025_4f2d::
	ld a, [hli]
	push hl
	and a
	jr nz, Func_025_4f38
	xor a
	ld [wd0c0], a
	jr Func_025_4f68

Func_025_4f38::
	cp 2
	jr nz, Func_025_4f62
	ld a, l
	sub $cb
	ld [wd0c0], a
	ld de, $982c
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld bc, $0102
	ld a, 1
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	ld e, $38
	call IncFillBoxVRAM
	jr Func_025_4f68

Func_025_4f62::
	ld a, l
	sub $cb
	ld [wd0c0], a

Func_025_4f68::
	farcall asm_026_4680
	pop hl
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 8
	jr c, Func_025_4f2d
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4f7f::
	and a
	jr z, Func_025_4f86

Func_025_4f82::
	add hl, de
	dec a
	jr nz, Func_025_4f82

Func_025_4f86::
	ret

Func_025_4f87::
	ld de, wd0d5
	ld hl, $99e5
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld bc, $0103
	ld a, 0
	ld [wd0fd], a
	call _PrintNumber
	ld de, wd0d6
	ld hl, $9965
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld bc, $0103
	ld a, 0
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4fc0::
	ld a, [wd9d8]
	inc a
	ld [wd9d9], a
	farcall Func_026_4cb6
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_4fd2::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	ld a, [de]
	inc a
	ld b, a
	ld de, wd1f5
	ld [de], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_501e::
	ld bc, $c0
	ld hl, $9720
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $72
	ld [wMenuTextX], a
	ld a, $7e
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_026_53ab
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5044::
; Used in dex
	ld bc, $40
	ld hl, $93c0
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wd9d8]
	inc a
	ld d, a
	farcall Func_01e_4290
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5061::
	ld bc, $06c0
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $80
	ld [wMenuTextX], a
	ld a, $ec
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_026_5711
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5087::
	ld bc, $0480
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $80
	ld [wMenuTextX], a
	ld a, $c8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_026_54cc
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_50ad::
	farcall Func_01f_4028
	ld hl, wMenuTextBuffer
	ld a, $70
	ld [wMenuTextX], a
	ld a, $7c
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_50cc::
	farcall Func_20_407b
	ld hl, wcaf0
	ld c, $80
	ld b, $40
	call LoadPalettes_OCPD
	ld bc, wcdf8
	ld a, $18
	ld [bc], a
	inc bc
	ld a, $28
	ld [bc], a
	inc bc
	ld a, 7
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_50ef::
	farcall Func_01f_40b7
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	farcall Func_01f_40ea
	farcall CopySelectedOptionName
	ld hl, wMenuTextBuffer
	ld a, $d0
	ld [wMenuTextX], a
	ld a, $dc
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5124::
	xor a
	ld [wBattleScriptByte], a

Func_025_5128::
	ld de, wdd00
	ld a, [wBattleScriptByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	jr z, Func_025_513f
	farcall Func_01f_405d

Func_025_513f::
	ld a, [wBattleScriptByte]
	inc a
	ld [wBattleScriptByte], a
	cp 8
	jr c, Func_025_5128
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_514f::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wd8fe], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld a, 1
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5199::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wd8fe], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_51e3::
	ld a, [wd9d9]
	and a
	jr z, Func_025_5221
	ld hl, String_025_6112
	ld a, $80
	ld [wMenuTextX], a
	ld a, $9c
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ld hl, $c
	call GetTextBGMapPointer
	ld de, Tilemap_025_6350
	ld a, [de]
	inc de
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ld [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceTilemap
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5221::
	ld hl, String_025_611b
	ld a, $80
	ld [wMenuTextX], a
	ld a, $94
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ld hl, $c
	call GetTextBGMapPointer
	ld de, Tilemap_025_63ca
	ld a, [de]
	inc de
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ld [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceTilemap
	call Func_025_525d
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_525d::
	ld a, [wd0d5]
	ld [wd871], a
	ld a, [wd0d6]
	ld [wd872], a
	ld a, [wd0da]
	ld [wd873], a
	ld a, [wGameTimeHours]
	ld [wd874], a
	ld a, [wGameTimeMinutes]
	ld [wd875], a
	ret

Func_025_527c::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	xor a
	call ByteFillVRAM
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_52a3::
	ld hl, wcdf0
	ld [hl], $a0
	ld hl, wcdf8
	ld [hl], $a0
	ld a, [wSelectedOption]
	and a
	jr z, Func_025_52d6
	ld hl, wcdf0
	ld a, $94
	ld [hli], a
	ld a, $4e
	ld [hli], a
	ld a, 2
	ld [hli], a
	ld a, [wSelectedOption]
	cp 5
	jr z, Func_025_52e1
	push af
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	pop af
	ld [wSelectedOption], a
	ld a, [bc]
	and a
	jr z, Func_025_52e1

Func_025_52d6::
	ld hl, wcdf8
	ld a, $94
	ld [hli], a
	ld a, $5a
	ld [hli], a
	ld [hl], 1

Func_025_52e1::
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $30
	inc hl
	ld [hl], $30
	ret

Func_025_52f1::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wTempBank], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call FarCopyBytesVRAM
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_532e::
	xor a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ld a, 2
	ld [hFFC6], a
	ret

Func_025_533d::
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, Func_025_534f
	farcall DrawItemPageWithIcons
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_534f::
	farcall DrawItemMenuPage
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_535a::
	ld a, [wd1f4]
	and a
	jr z, Func_025_5368
	ld bc, $80
	ld hl, $9290
	jr Func_025_536e

Func_025_5368::
	ld bc, $80
	ld hl, $9310

Func_025_536e::
	xor a
	call ByteFillVRAM
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5377::
	ld bc, $0200
	ld hl, $9600
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0280
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, Func_025_53a3
	farcall Func_01e_47af
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_53a3::
	farcall Func_01e_475c
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_53ae::
	ld a, [wEventFlags + 4]
	bit 0, a
	jp z, Func_025_5410
	ld a, [wSelectedPage]
	and a
	jr z, Func_025_53c6
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], $f8
	jr Func_025_53ce

Func_025_53c6::
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], 0

Func_025_53ce::
	ld a, [wSelectedPage]
	inc a
	add a
	add a
	call Func_025_4d16
	and a
	jr z, Func_025_53e4
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], $f9
	jr Func_025_53ec

Func_025_53e4::
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], 0

Func_025_53ec::
	ld de, wd1f5
	ld a, [wSelectedPage]
	inc a
	ld [de], a
	ld hl, $9990
	ld bc, $0102
	ld a, 9
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5410::
	ld a, [wSelectedPage]
	and a
	jr z, Func_025_5420
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], $f8
	jr Func_025_5428

Func_025_5420::
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], 0

Func_025_5428::
	ld a, [wSelectedPage]
	and a
	jr nz, Func_025_5438
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], $f9
	jr Func_025_5440

Func_025_5438::
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], 0

Func_025_5440::
	ld de, wd1f5
	ld a, [wSelectedPage]
	inc a
	ld [de], a
	ld hl, $9990
	ld bc, $0102
	ld a, 9
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5464::
	farcall Func_01e_4416
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_546f::
	ld bc, $0500
	ld hl, $8a80
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall asm_026_46af
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5487::
	call GetBoxMonPtr
	push bc
	ld a, [bc]
	ld [wd9d9], a
	farcall Func_026_4cb6
	pop bc
	call LoadMonPic
	ld bc, $c0
	ld hl, $9620
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall asm_026_464a
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_54b1::
	call GetBoxMonPtr
	jp Func_025_45da

Func_025_54b7::
	call GetBoxMonPtr
	jp Func_025_4947

Func_025_54bd::
	ld bc, $0400
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetBoxMonPtr
	jp Func_025_4a85

Func_025_54d0::
	ld c, 0

Func_025_54d2::
	push bc
	ld a, [wMonBoxIndex]
	add c
	ld de, wd1f5
	inc a
	ld [de], a
	ld l, c
	swap l
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9826
	add hl, bc
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld de, wdca0
	ld l, c
	ld a, [wMonBoxIndex]
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, Func_025_552a
	ld l, c
	swap l
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9828
	add hl, bc
	ld de, SelectionMarkerRightTiles
	ld bc, $0102
	ld a, 1
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap

Func_025_552a::
	pop bc
	push bc
	jr Func_025_5555

Func_025_552e::
	ld a, [wMonBoxIndex]
	add c
	ld l, a
	ld a, [wdc9d]
	cp l
	jr nz, Func_025_5555
	ld l, c
	swap l
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9822
	add hl, bc
	ld de, SelectionMarkerLeftTiles
	ld bc, $0102
	ld a, 1
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap

Func_025_5555::
	pop bc
	inc c
	ld a, c
	cp 5
	jp c, Func_025_54d2
	xor a
	ld [wBattleScriptByte], a
	ret
SelectionMarkerRightTiles::
	db $2d
	db $2e
SelectionMarkerLeftTiles::
	db $2b
	db $2c

Func_025_5566::
	ld de, wd1f5
	ld a, [wdc9d]
	inc a
	ld [de], a
	ld hl, $9870
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_558b::
	call Func_025_5593
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_5593::
	ld hl, wd1a0
	ld c, $40
	xor a

Func_025_5599::
	ld [hli], a
	dec c
	jr nz, Func_025_5599
	ret

Func_025_559e::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wBattleScriptByte], a
	call ClearBGMap0
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_55b4::
	xor a
	ld [wd0d6], a
	ld [wd0d5], a
	ld hl, wd7cb
	ld bc, $9f

Func_025_55c1::
	ld a, [hli]
	and a
	jr z, Func_025_55d7
	cp 1
	jr z, Func_025_55d0
	ld a, [wd0d5]
	inc a
	ld [wd0d5], a

Func_025_55d0::
	ld a, [wd0d6]
	inc a
	ld [wd0d6], a

Func_025_55d7::
	dec c
	ld a, c
	or b
	jr nz, Func_025_55c1
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_55e1::
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_55e6::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	call GetPartyMonPtr
	ld hl, $14
	add hl, bc
	ld a, [hl]
	and a
	jr nz, Func_025_55fa
	call Func_025_55ff

Func_025_55fa::
	xor a
	ld [wBattleScriptByte], a
	ret

Func_025_55ff::
	push de
	push hl
	ld a, [wBattleScriptPos]
	ld e, a
	ld a, [wBattleScriptPos + 1]
	ld d, a
	ld a, [wBattleScriptByte]
	ld l, a
	ld h, 0
	add hl, de
	ld a, l
	ld [wBattleScriptPos], a
	ld a, h
	ld [wBattleScriptPos + 1], a
	pop hl
	pop de
	ret

Func_025_561b::
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	push hl
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall GetExpToNextLevel
	ld de, wd1f5
	ldh a, [hMathValue + 2]
	ld [de], a
	inc de
	ldh a, [hMathValue + 1]
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	ld de, wd1f5
	ld hl, $98ed
	ld bc, $0306
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop hl
	ld a, l
	ld [wd981], a
	ld a, h
	ld [wd982], a
	ret

unknown::
	db $0
	db $0
	db $0
	db $0
	db $8
	db $0
	db $13
	db $0
	db $25
	db $0
	db $3d
	db $0
	db $5b
	db $0
	db $7f
	db $0
	db $a9
	db $0
	db $d9
	db $0
	db $f
	db $1
	db $4b
	db $1
	db $8d
	db $1
	db $d5
	db $1
	db $23
	db $2
	db $77
	db $2
	db $d1
	db $2
	db $31
	db $3
	db $97
	db $3
	db $3
	db $4
	db $75
	db $4
	db $ed
	db $4
	db $6b
	db $5
	db $ef
	db $5
	db $79
	db $6
	db $9
	db $7
	db $9f
	db $7
	db $3b
	db $8
	db $dd
	db $8
	db $85
	db $9
	db $33
	db $a
	db $f
	db $1
	db $a1
	db $b
	db $63
	db $c
	db $27
	db $d
	db $f3
	db $d
	db $c5
	db $e
	db $9d
	db $f
	db $7b
	db $10
	db $5f
	db $11
	db $49
	db $12
	db $39
	db $13
	db $2f
	db $14
	db $2b
	db $15
	db $23
	db $16
	db $35
	db $17
	db $43
	db $18
	db $bf
	db $1a
	db $71
	db $1a
	db $91
	db $1b
	db $b7
	db $1c
	db $e3
	db $1d
	db $15
	db $1f
	db $4d
	db $20
	db $8d
	db $21
	db $cf
	db $22
	db $19
	db $24
	db $69
	db $25
	db $bf
	db $26
	db $1b
	db $28
	db $7d
	db $29
	db $e5
	db $2a
	db $53
	db $2c
	db $c7
	db $2d
	db $41
	db $2f
	db $c1
	db $30
	db $47
	db $32
	db $d3
	db $33
	db $65
	db $35
	db $fd
	db $36
	db $9d
	db $38
	db $3f
	db $3a
	db $e9
	db $3b
	db $99
	db $3d
	db $4f
	db $3f
	db $b
	db $41
	db $cd
	db $42
	db $95
	db $44
	db $63
	db $46
	db $37
	db $48
	db $11
	db $4a
	db $f1
	db $4b
	db $d7
	db $4d
	db $c3
	db $4f
	db $b5
	db $51
	db $ad
	db $53
	db $ab
	db $55
	db $af
	db $57
	db $b9
	db $59
	db $c7
	db $5b
	db $df
	db $5d
	db $fb
	db $5f
	db $1d
	db $62
	db $45
	db $64
	db $73
	db $66
	db $a7
	db $68
	db $e1
	db $6a
	db $21
	db $6d
	db $67
	db $6f
	db $b3
	db $71
	db $ff
	db $ff

Func_025_572f::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
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
	ld a, 1
	ld [bc], a
	ret

Func_025_574c::
	ld de, Pointers_025_5776
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld [wCharacterTilePos], a
	ld a, $90
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	ld a, [wd9d8]
	cp 2
	jr nz, Func_025_5772
	ld a, $98
	ld [wMenuTextX], a

Func_025_5772::
	call PrintMenuText
	ret

Pointers_025_5776::
	dw unk_025_5782
	dw unk_025_5787
	dw unk_025_578c
	dw unk_025_5791
	dw unk_025_5796
	dw unk_025_579b

; Strings, but they don't decode into anything coherent
unk_025_5782::
	db $f0, $19, $f1, $5f, $ed
unk_025_5787::
	db $f5, $64, $f0, $56, $ed
unk_025_578c::
	db $f0, $5d, $f5, $a0, $ed
unk_025_5791::
	db $f8, $0d, $f3, $05, $ed
unk_025_5796::
	db $f3, $73, $f1, $5f, $ed
unk_025_579b::
	db $f5, $63, $f0, $80, $ed

Func_025_57a0::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz
	hlcoord 0, 0
	ld a, h
	ld [wAnimFramePtr + 1], a
	ld a, l
	ld [wAnimFramePtr], a
	call Func_025_581f
	ld de, wd100
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1406
	ld a, $14
	ld [hVRAMCopyWidth], a
	ld a, 6
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	call Func_025_581f
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld de, $c0
	add hl, de
	ld a, h
	and 3
	or $98
	ld h, a
	ld de, wd100
	ld bc, $1406
	ld a, $14
	ld [hVRAMCopyWidth], a
	ld a, 6
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	call Func_025_581f
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld de, $0180
	add hl, de
	ld a, h
	and 3
	or $98
	ld h, a
	ld de, wd100
	ld bc, $1406
	ld a, $14
	ld [hVRAMCopyWidth], a
	ld a, 6
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	ret

Func_025_581f::
	ld hl, wd100
	ld a, h
	ld [wBGMapAddr + 1], a
	ld a, l
	ld [wBGMapAddr], a
	ld a, [wAnimFramePtr + 1]
	ld h, a
	ld a, [wAnimFramePtr]
	ld l, a
	ld de, wMapTileAttrs
	ld c, $78

Func_025_5837::
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, de
	push de
	ld a, [wBGMapAddr + 1]
	ld d, a
	ld a, [wBGMapAddr]
	ld e, a
	ld a, [hli]
	ld [de], a
	pop de
	ld hl, wBGMapAddr
	inc [hl]
	pop hl
	dec c
	jr nz, Func_025_5837
	ld a, l
	ld [wAnimFramePtr], a
	ld a, h
	ld [wAnimFramePtr + 1], a
	ret

Func_025_585a::
	push bc

; Get starting address for each "icon box"
	ld a, [wd0c3]
	ld l, a
	ld h, 0
	ld de, .coords
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [wd1f2], a
	ld a, h
	ld [wd1f3], a
	call GetTextBGMapPointer

; Place tilemap
	lb bc, $06, $04
	ld a, $06
	ld [hVRAMCopyWidth], a
	ld a, $04
	ld [hVRAMCopyHeight], a
	ld de, Tilemap_025_645c
	call PlaceTilemap

; Place attribute map
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	lb bc, $06, $04
	ld a, $06
	ld [hVRAMCopyWidth], a
	ld a, $04
	ld [hVRAMCopyHeight], a
	ld de, AttrMap_025_6444
	call PlaceAttrmap

	pop bc
	push bc
	ld a, [bc]
	ld d, a
	farcall Func_01e_431f

; Add [1, 1] to point to where icons should load
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	lb bc, $01, $01
	add hl, bc
	call GetTextBGMapPointer

; Load mon icon tilemap
	ld a, [wd0c3]
	sla a
	sla a ; 4 tiles
	add $80 ; start at tile $80
	ld e, a
	lb bc, $02, $02
	ld a, $02
	ld [hVRAMCopyWidth], a
	ld [hVRAMCopyHeight], a
	call IncFillBoxVRAM

	pop bc
	push bc
	call Func_025_5dcb
	pop bc
	push bc

	call DelayFrame
	call Func_025_58ed
	pop bc
	ret

.coords
	db $00, $00
	db $00, $07
	db $00, $0e
	db $04, $00
	db $04, $07
	db $04, $0e

Func_025_58ed::
	ld a, c
	ld [wd3f0], a
	ld a, b
	ld [wd3f1], a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	and a
	jr z, Func_025_5904
	ldh [hMathValue], a
	ld a, [hl]
	ldh [hMathValue + 1], a
	jr Func_025_590d

Func_025_5904::
	ld a, [hl]
	and a
	ret z
	xor a
	ldh [hMathValue + 1], a
	ld a, [hl]
	ldh [hMathValue], a

Func_025_590d::
	xor a
	ldh [hMathValue + 2], a
	ld a, $20
	ldh [hMathOperand], a
	call Multiply32By8
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	push af
	ldh a, [hMathValue + 1]
	push af
	ldh a, [hMathValue + 2]
	push af
	xor a
	ld [wd9d7], a
	ld a, [wd3f0]
	ld c, a
	ld a, [wd3f1]
	ld b, a
	call _ComputeStatValue
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	ldh [hMathOperand], a
	pop af
	ldh [hMathValue + 2], a
	pop af
	ldh [hMathValue + 1], a
	pop af
	ldh [hMathValue], a
	ld b, 4
	call Divide32By16
	ld d, 0
	ldh a, [hMathValue]
	cp $20
	jr c, Func_025_595f
	ld a, $20
	ldh [hMathValue], a

Func_025_595f::
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
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0103
	add hl, bc
	call GetTextBGMapPointer
	ld a, e
	ld b, a
	and a
	jr z, Func_025_598f

Func_025_5986::
	call WaitVRAM_STAT
	ld a, $70
	ld [hli], a
	dec e
	jr nz, Func_025_5986

Func_025_598f::
	ld a, b
	cp 4
	ret z
	ld a, e
	and a
	jr nz, Func_025_599d
	ld a, d
	and a
	jr nz, Func_025_599d
	ld d, 1

Func_025_599d::
	ld a, $78
	sub d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

INCLUDE "data/monsters/stats.asm"
Func_025_5dcb::
	ld hl, 1
	add hl, bc
	push hl
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0402
	add hl, bc
	call GetTextBGMapPointer
	pop de
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ret

_PrintNumber::
	push bc
	xor a
	ldh [hMathValue + 3], a
	ldh [hMathValue + 2], a
	ldh [hMathValue + 1], a
	ld a, b
	and $f
	cp 1
	jr z, Func_025_5e1e
	cp 2
	jr z, Func_025_5e15
	ld a, [de]
	ldh [hMathValue + 2], a
	inc de
	ld a, [de]
	ldh [hMathValue + 1], a
	inc de
	ld a, [de]
	ldh [hMathValue], a
	jr Func_025_5e21

Func_025_5e15::
	ld a, [de]
	ldh [hMathValue + 1], a
	inc de
	ld a, [de]
	ldh [hMathValue], a
	jr Func_025_5e21

Func_025_5e1e::
	ld a, [de]
	ldh [hMathValue], a

Func_025_5e21::
	push de
	ld d, b
	ld a, c
	ld b, a
	xor a
	ld c, a
	ld a, b
	cp 2
	jr z, Func_025_5e92
	cp 3
	jr z, Func_025_5e82
	cp 4
	jr z, Func_025_5e71
	cp 5
	jr z, Func_025_5e60
	cp 6
	jr z, Func_025_5e4e
	ld a, $f
	ldh [hMathOperand], a
	ld a, $42
	ldh [hMathOperand + 1], a
	ld a, $40
	ldh [hMathAccum + 3], a
	call Func_025_5f0e
	call Func_025_5fc1

Func_025_5e4e::
	ld a, 1
	ldh [hMathOperand], a
	ld a, $86
	ldh [hMathOperand + 1], a
	ld a, $a0
	ldh [hMathAccum + 3], a
	call Func_025_5f0e
	call Func_025_5fc1

Func_025_5e60::
	xor a
	ldh [hMathOperand], a
	ld a, $27
	ldh [hMathOperand + 1], a
	ld a, $10
	ldh [hMathAccum + 3], a
	call Func_025_5f0e
	call Func_025_5fc1

Func_025_5e71::
	xor a
	ldh [hMathOperand], a
	ld a, 3
	ldh [hMathOperand + 1], a
	ld a, $e8
	ldh [hMathAccum + 3], a
	call Func_025_5f0e
	call Func_025_5fc1

Func_025_5e82::
	xor a
	ldh [hMathOperand], a
	xor a
	ldh [hMathOperand + 1], a
	ld a, $64
	ldh [hMathAccum + 3], a
	call Func_025_5f0e
	call Func_025_5fc1

Func_025_5e92::
	ld c, 0
	ldh a, [hMathValue]

Func_025_5e96::
	cp $a
	jr c, Func_025_5e9f
	sub $a
	inc c
	jr Func_025_5e96

Func_025_5e9f::
	ld b, a
	ldh a, [hMathValue + 3]
	or c
	ldh [hMathValue + 3], a
	jr nz, Func_025_5eac
	call Func_025_5f94
	jr Func_025_5ed9

Func_025_5eac::
	ld a, [wd1fc]
	and a
	jr nz, Func_025_5ebe
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	jr Func_025_5ed9

Func_025_5ebe::
	push bc
	ld a, c
	add a
	ld c, a
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, c
	inc a
	ld [hl], a
	pop hl
	pop bc

Func_025_5ed9::
	call Func_025_5fc1
	ld a, [wd1fc]
	and a
	jr nz, Func_025_5ef0
	ld a, [wd8fe]
	add b
	ld b, a
	call WaitVRAM_STAT
	ld a, b
	ld [hli], a
	pop de
	dec de
	pop bc
	ret

Func_025_5ef0::
	ld a, b
	add a
	ld b, a
	ld a, [wd8fe]
	add b
	ld b, a
	call WaitVRAM_STAT
	ld a, b
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, b
	inc a
	ld [hl], a
	pop hl
	inc hl
	pop de
	dec de
	pop bc
	ret

Func_025_5f0e::
	ld c, 0

Func_025_5f10::
	ldh a, [hMathOperand]
	ld b, a
	ldh a, [hMathValue + 2]
	ldh [hMathAccum + 2], a
	cp b
	jr c, Func_025_5f60
	sub b
	ldh [hMathValue + 2], a
	ldh a, [hMathOperand + 1]
	ld b, a
	ldh a, [hMathValue + 1]
	ldh [hMathAccum + 1], a
	cp b
	jr nc, Func_025_5f32
	ldh a, [hMathValue + 2]
	or 0
	jr z, Func_025_5f5c
	dec a
	ldh [hMathValue + 2], a
	ldh a, [hMathValue + 1]

Func_025_5f32::
	sub b
	ldh [hMathValue + 1], a
	ldh a, [hMathAccum + 3]
	ld b, a
	ldh a, [hMathValue]
	ldh [hMathAccum], a
	cp b
	jr nc, Func_025_5f52
	ldh a, [hMathValue + 1]
	and a
	jr nz, Func_025_5f4d
	ldh a, [hMathValue + 2]
	and a
	jr z, Func_025_5f58
	dec a
	ldh [hMathValue + 2], a
	xor a

Func_025_5f4d::
	dec a
	ldh [hMathValue + 1], a
	ldh a, [hMathValue]

Func_025_5f52::
	sub b
	ldh [hMathValue], a
	inc c
	jr Func_025_5f10

Func_025_5f58::
	ldh a, [hMathAccum + 1]
	ldh [hMathValue + 1], a

Func_025_5f5c::
	ldh a, [hMathAccum + 2]
	ldh [hMathValue + 2], a

Func_025_5f60::
	ldh a, [hMathValue + 3]
	or c
	jr z, Func_025_5f94
	ld a, [wd1fc]
	and a
	jr nz, Func_025_5f78
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	ldh [hMathValue + 3], a
	ret

Func_025_5f78::
	ld a, c
	add a
	ld c, a
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, c
	inc a
	ld [hl], a
	ldh [hMathValue + 3], a
	pop hl
	ret

Func_025_5f94::
	ld a, [wd0fd]
	and a
	jr nz, Func_025_5f9d
	bit 7, d
	ret z

Func_025_5f9d::
	ld a, [wd1fc]
	and a
	jr nz, Func_025_5fab
	call WaitVRAM_STAT
	ld a, [wd8fe]
	ld [hl], a
	ret

Func_025_5fab::
	call WaitVRAM_STAT
	ld a, [wd8fe]
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, [wd8fe]
	inc a
	ld [hl], a
	pop hl
	ret

Func_025_5fc1::
	bit 7, d
	jr nz, Func_025_5fcd
	bit 6, d
	jr z, Func_025_5fcd
	ldh a, [hMathValue + 3]
	and a
	ret z

Func_025_5fcd::
	inc hl
	ret

Func_025_5fcf::
	ld e, 0
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	ret z
	bit 4, a
	jr z, Func_025_5fe0
	call Func_025_5ffb

Func_025_5fe0::
	inc e
	ld a, [hl]
	bit 5, a
	jr z, Func_025_5fe9
	call Func_025_5ffb

Func_025_5fe9::
	inc e
	ld a, [hl]
	bit 1, a
	jr z, Func_025_5ff2
	call Func_025_5ffb

Func_025_5ff2::
	inc e
	ld a, [hl]
	bit 0, a
	ret z
	call Func_025_5ffb
	ret

Func_025_5ffb::
	push hl
	push bc
	ld bc, unk_025_6022
	ld l, e
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1f2]
	ld c, a
	ld a, [wd1f3]
	ld b, a
	add hl, bc
	push de
	call GetTextBGMapPointer
	pop de
	ld a, e
	add $2e
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	pop bc
	pop hl
	ret

; TODO: unk_ - indexed table (index hli)
unk_025_6022::
	dw $100d
	dw $120d
	dw $100f
	dw $120f

Func_025_602a::
	ld hl, wScreenRowBuffer
	ld de, wd100
	ld c, $54

Func_025_6032::
	ld a, [hli]
	push hl
	ld hl, wMapTileAttrs
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, Func_025_6032
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	ld de, wd100
	ld a, 7
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, $c
	ld c, a
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	ret

Func_025_605f::
	ld hl, $0d00
	call GetTextBGMapPointer
	ld a, 7
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, $c
	ld c, a
	ld [hVRAMCopyHeight], a
	ld de, wScreenRowBuffer
	call PlaceTilemap
	ret

Func_025_6078::
	hlcoord 0, 0
	ld de, $d
	add hl, de
	ld de, wScreenRowBuffer
	ld bc, $070c

Func_025_6085::
	push hl

Func_025_6086::
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, Func_025_6086
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	ld b, 7
	dec c
	jr nz, Func_025_6085
	ret

INCLUDE "data/text/menu_25_6099.asm"

Palette_025_6129::
	db $ff, $7f, $14, $63, $a5, $35, $00, $00, $ff, $7f, $5f, $03, $1b, $00, $00, $00
	db $ff, $7f, $a0, $7e, $80, $70, $00, $00, $ff, $7f, $d6, $6e, $6b, $41, $00, $00
	db $ff, $7f, $4d, $03, $c0, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Palette_025_6169::
	db $b5, $56, $00, $00, $1d, $00, $bf, $67, $b5, $56, $ff, $45, $3f, $53, $7e, $03
	db $b5, $56, $00, $00, $d6, $6e, $de, $7b, $b5, $56, $00, $00, $1d, $00, $bf, $67
	db $ff, $7f, $6b, $7f, $4a, $7d, $00, $00, $ff, $7f, $3f, $03, $18, $00, $00, $00

INCLUDE "data/text/menu_25_6199.asm"

Tilemap_025_61c4:: INCBIN "gfx/tilemaps/tilemap_025_61c4.tilemap"
Tilemap_025_61f2:: INCBIN "gfx/tilemaps/tilemap_025_61f2.tilemap"
Tilemap_025_6220:: INCBIN "gfx/tilemaps/tilemap_025_6220.tilemap"
Tilemap_025_6264:: INCBIN "gfx/tilemaps/tilemap_025_6264.tilemap"
Tilemap_025_62a8:: INCBIN "gfx/tilemaps/tilemap_025_62a8.tilemap"
Tilemap_025_62fc:: INCBIN "gfx/tilemaps/tilemap_025_62fc.tilemap"
Tilemap_025_6350:: INCBIN "gfx/tilemaps/tilemap_025_6350.tilemap"
Tilemap_025_63ca:: INCBIN "gfx/tilemaps/tilemap_025_63ca.tilemap"

AttrMap_025_6444::
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $02, $01, $01, $01, $01, $02 ; HP Bar

Tilemap_025_645c::
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $17, $0a, $0b ; Lv01
	db $6e, $78, $78, $78, $78, $6f ; HP Bar
