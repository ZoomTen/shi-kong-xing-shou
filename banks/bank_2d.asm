Func_02d_4000::
	ld bc, $0480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame
	call Func_02d_403d
	xor a
	ld [wSelectedOption], a
	farcall Func_026_45b9
	call DelayFrame
	ld de, BattleTextPointers
	ld a, [wd3ff]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $b6
	ld [wMenuTextX], a
	ld a, $fe
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_02d_403d::
	ld a, [wd3ff]
	cp $2b
	jr z, Func_02d_404d
	cp $2c
	jr z, Func_02d_404d
	ld de, BattleWindowTilemap
	jr Func_02d_405a

Func_02d_404d::
	ld a, $a5
	ld [wd9d0], a
	ld a, $99
	ld [wd9d1], a
	ld de, BattleWindowTilemapWide

Func_02d_405a::
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

BattleWindowTilemap::
	db $04, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
	db $03, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8, $05
	db $03, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9, $05
	db $03, $da, $dc, $de, $e0, $e2, $e4, $e6, $e8, $ea, $ec, $ee, $f0, $f2, $f4, $f6, $f8, $fa, $fc, $05
	db $03, $db, $dd, $df, $e1, $e3, $e5, $e7, $e9, $eb, $ed, $ef, $f1, $f3, $f5, $f7, $f9, $fb, $fd, $05
	db $06, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $08

BattleWindowTilemapWide::
	db $04, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
	db $03, $b6, $b8, $ba, $bc, $00, $00, $00, $00, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $05
	db $03, $b7, $b9, $bb, $bd, $00, $00, $00, $00, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $05
	db $03, $d2, $d4, $d6, $d8, $da, $dc, $de, $e0, $e2, $e4, $e6, $e8, $ea, $ec, $ee, $f0, $f2, $f4, $05
	db $03, $d3, $d5, $d7, $d9, $db, $dd, $df, $e1, $e3, $e5, $e7, $e9, $eb, $ed, $ef, $f1, $f3, $f5, $05
	db $06, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $08

BattleTextPointers::
	dw BattleText_4216, BattleText_4216, BattleText_4257, BattleText_4263
	dw BattleText_4273, BattleText_4282, BattleText_428e, BattleText_42a5
	dw BattleText_42bb, BattleText_42cf, BattleText_42e1, BattleText_42ef
	dw BattleText_42fd, BattleText_4310, BattleText_4321, BattleText_4333
	dw BattleText_433c, BattleText_4346, BattleText_4350, BattleText_435b
	dw BattleText_436c, BattleText_4376, BattleText_437f, BattleText_4389
	dw BattleText_4393, BattleText_439e, BattleText_43a8, BattleText_43b0
	dw BattleText_43b9, BattleText_43c2, BattleText_43ce, BattleText_43d6
	dw BattleText_43e4, BattleText_43f3, BattleText_43ff, BattleText_440f
	dw BattleText_4427, BattleText_4439, BattleText_4444, BattleText_444d
	dw BattleText_445c, BattleText_4487, BattleText_4492, BattleText_44ac
	dw BattleText_44b7, BattleText_44bf, BattleText_44c7, BattleText_44d6
	dw BattleText_44ec, BattleText_44f3, BattleText_44f9, BattleText_4505
	dw BattleText_4511, BattleText_451b, BattleText_4525, BattleText_452b
	dw BattleText_4534, BattleText_4543, BattleText_4552, BattleText_455e
	dw BattleText_456d, BattleText_457c, BattleText_4588, BattleText_4597
	dw BattleText_45a0, BattleText_45aa, BattleText_45b5, BattleText_45bc
	dw BattleText_45c8, BattleText_45d1, BattleText_45e0, BattleText_45ec
	dw BattleText_45f5, BattleText_4602, BattleText_460b, BattleText_4613
	dw BattleText_461d, BattleText_4629, BattleText_4635, BattleText_464b
	dw BattleText_4651, BattleText_4657, BattleText_4660, BattleText_4668
	dw BattleText_4676, BattleText_4683, BattleText_468b, BattleText_4693
	dw BattleText_469b, BattleText_46a4, BattleText_46ab, BattleText_46bd
	dw BattleText_46cf

INCLUDE "data/text/battle_messages.asm"

GetPlayerWorldCoords::
	ld a, [wPlayerObject]
	sub $10
	swap a
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	swap a
	ld [wd3f9], a
	ld a, [hFFAB]
	ld l, a
	ld a, [wd0f9]
	add l
	ld c, a
	ld a, [hFFAA]
	ld l, a
	ld a, [wd3f9]
	add l
	ld e, a
	ret

LoadMapAttribute::
	ldh a, [hMapGroup]
	cp 1
	jp z, LoadMapAttribute_Group1
	cp 2
	jp z, LoadMapAttribute_Group2
	cp 3
	jp z, LoadMapAttribute_Group3
	cp 4
	jp z, LoadMapAttribute_Group4
	cp 5
	jp z, LoadMapAttribute_Group5
	cp 6
	jp z, LoadMapAttribute_Group6
	ret

LoadMapAttribute_Group1::
	ld de, MapAttr_Group1
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group2::
	ld de, MapAttr_Group2
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group3::
	ld de, MapAttr_Group3
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group4::
	ld de, MapAttr_Group4
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group5::
	ld de, MapAttr_Group5
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group6::
	ld de, MapAttr_Group6
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

MapAttr_Group1::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $04, $04, $02, $03, $03, $03, $03, $03, $00, $01, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

MapAttr_Group2::
	db $00, $00, $00, $02, $02, $02, $03, $03, $00, $04, $04, $04, $04, $04, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

MapAttr_Group3::
	db $00, $02, $02, $02, $02, $02, $02, $00, $00, $00, $00, $03, $03, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $02
	db $02, $00, $00, $00

MapAttr_Group4::
	db $00, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $00, $00, $00, $00, $00
	db $03, $00, $00, $00, $00, $05, $06, $00, $00, $00, $09, $09, $09, $09, $04, $00
	db $07, $0d, $0d, $0d, $0d, $00, $00, $00, $00, $00, $0c, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0a, $00
	db $0b, $0b, $0b, $0b, $00, $00

MapAttr_Group5::
	db $00, $03, $03, $04, $04, $04, $04, $00, $05, $05, $05, $05, $05, $05, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

MapAttr_Group6::
	db $00, $01, $01, $02, $02, $02, $02, $02, $04, $04, $04, $04, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

LoadScriptedPartyMon::
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	ld de, ScriptedMonSlots
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	push hl
	ld de, ScriptedMonData
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	push de
	push de
	push hl
	pop de
	call Func_02d_5133
	pop de
	ld bc, $16

.copy:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy
	pop bc
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	ret

ScriptedMonSlots::
	dw $de00, $de16, $de2c, $de42, $de58, $de6e, $de84, $de9a

ScriptedMonData::
	dw ScriptedMon_0, ScriptedMon_1, ScriptedMon_2, ScriptedMon_3
	dw ScriptedMon_4, ScriptedMon_5, ScriptedMon_6, ScriptedMon_7

ScriptedMon_0::
	db $51, $01, $00, $00, $05, $00, $00, $2c, $00, $00, $31, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

ScriptedMon_1::
	db $75, $03, $00, $00, $22, $00, $00, $2c, $00, $00, $0b, $00, $00, $1e, $00, $00, $00, $00, $00, $00, $00, $00

ScriptedMon_2::
	db $6c, $10, $00, $00, $ed, $15, $00, $57, $00, $00, $25, $00, $00, $2c, $00, $00, $13, $00, $00, $00, $00, $00

ScriptedMon_3::
	db $5b, $19, $00, $00, $6c, $48, $00, $1e, $00, $00, $40, $00, $00, $46, $00, $00, $07, $00, $00, $00, $03, $00

ScriptedMon_4::
	db $63, $24, $00, $00, $c2, $cf, $00, $47, $00, $00, $4b, $00, $00, $24, $00, $00, $8b, $00, $00, $00, $02, $00

ScriptedMon_5::
	db $91, $27, $00, $00, $36, $05, $01, $57, $00, $00, $5c, $00, $00, $59, $00, $00, $14, $00, $00, $00, $11, $00

ScriptedMon_6::
	db $90, $2d, $00, $00, $b8, $82, $01, $83, $00, $00, $57, $00, $00, $02, $00, $00, $0f, $00, $00, $00, $10, $00

ScriptedMon_7::
	db $7e, $35, $00, $00, $4b, $73, $02, $55, $00, $00, $54, $00, $00, $56, $00, $00, $53, $00, $00, $00, $02, $00

LoadWildMon::
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	pop af
	ld e, a
	call GetFirstEmptyPartySlot
	and a
	jr nz, .case1
	push bc
	call Func_02d_5147
	pop bc
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	ret

.case1:
	ld a, [wMonBoxCount]
	cp $14
	jr nc, .case2
	ld hl, wMonBox
	ld a, [wMonBoxCount]
	ld de, $13
	and a
	jr z, .copy

.scan1:
	add hl, de
	dec a
	jr nz, .scan1

.copy:
	push de
	ld c, $13

.copyLoop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyLoop
	ld a, [wMonBoxCount]
	inc a
	ld [wMonBoxCount], a
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	ret

.case2:
	ld a, [wMonBox2Count]
	cp $14
	ret nc
	ld a, SRAM_ENABLE
	ld [rRAMG], a
	ld a, 1
	ld [rRAMB], a
	ld hl, sMonBox2
	ld a, [wMonBox2Count]
	ld de, $13
	and a
	jr z, .copy

.scan2:
	add hl, de
	dec a
	jr nz, .scan2
	ld a, [wMonBox2Count]
	inc a
	ld [wMonBox2Count], a
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	xor a
	ld [rRAMG], a
	ld [rRAMB], a
	ret

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_02d_4aa9::
	db $6a, $0d, $00, $00, $00, $13, $2b, $1a, $51, $00, $00
BattleData_02d_4ab4::
	db $01, $22, $03, $00, $00, $00, $2c, $27, $00, $00, $00, $00, $0f, $00, $50, $00
BattleData_02d_4ac4::
	db $02, $24, $06, $00, $00, $00, $2c, $25, $66, $00, $00, $00, $c8, $00, $c8, $00
	db $06, $06, $00, $00, $00, $32, $2c, $1f, $13, $00, $00, $5e, $01, $fa, $00
BattleData_02d_4ae3::
	db $01, $52, $0a, $00, $00, $00, $08, $2c, $00, $00, $00, $00, $f4, $01, $c8, $00
BattleData_02d_4af3::
	db $02, $24, $06, $00, $00, $00, $2c, $25, $66, $00, $00, $00, $c8, $00, $c8, $00
	db $06, $06, $00, $00, $00, $32, $2c, $1f, $13, $00, $00, $5e, $01, $fa, $00
BattleData_02d_4b12::
	db $03, $24, $0c, $00, $00, $00, $66, $25, $2c, $5d, $00, $00, $c9, $00, $32, $00
	db $0a, $0d, $00, $00, $00, $0b, $31, $02, $2c, $00, $00, $c2, $00, $14, $00, $2e
	db $0e, $00, $00, $00, $72, $2c, $00, $00, $00, $00, $02, $01, $2d, $00
BattleData_02d_4b40::
	db $01, $7f, $12, $00, $00, $00, $21, $0c, $50, $0e, $00, $00, $7d, $03, $fa, $00
BattleData_02d_4b50::
	db $01, $92, $15, $00, $00, $00, $7e, $57, $1d, $15, $13, $00, $20, $03, $2c, $01
BattleData_02d_4b60::
	db $01, $5a, $1a, $00, $00, $00, $0f, $41, $00, $00, $12, $00, $0e, $06, $f4, $01
BattleData_02d_4b70::
	db $04, $0a, $1a, $00, $00, $00, $20, $31, $1d, $25, $00, $00, $e6, $01, $64, $00
	db $24, $19, $00, $00, $00, $66, $5d, $02, $20, $00, $00, $fc, $01, $73, $00, $2e
	db $1c, $00, $00, $00, $73, $7c, $72, $00, $00, $00, $01, $02, $69, $00, $06, $1b
	db $00, $00, $00, $3c, $28, $3b, $32, $12, $00, $f0, $01, $5a, $00
BattleData_02d_4bad::
	db $02, $18, $1f, $00, $00, $00, $4a, $49, $47, $15, $00, $00, $dc, $05, $44, $02
	db $65, $20, $00, $00, $00, $49, $1d, $06, $80, $14, $00, $94, $06, $66, $03
BattleData_02d_4bcc::
	db $02
	db $4e, $20, $00, $00, $00, $33, $3e, $3b, $77, $00, $00, $26, $06, $b6, $03, $05
	db $21, $00, $00, $00, $36, $2d, $06, $2b, $12, $00, $f0, $04, $1a, $04
BattleData_02d_4beb::
	db $01, $91, $27, $00, $00, $00, $57, $5c, $59, $14, $11, $00, $00, $00, $00, $00
BattleData_02d_4bfb::
	db $02, $62, $25, $00, $00, $00, $3d, $29, $40, $08, $00, $00, $36, $04, $1a, $04
	db $5c, $26, $00, $00, $00, $41, $46, $24, $42, $14, $00, $38, $08, $e1, $05
BattleData_02d_4c1a::
	db $02, $35, $25, $00, $00, $00, $54, $53, $52, $51, $00, $00, $23, $04, $e8, $03
	db $05, $26, $00, $00, $00, $2a, $36, $2d, $06, $12, $00, $f1, $07, $e2, $04
BattleData_02d_4c39::
	db $03, $70, $26, $00, $00, $00, $5e, $66, $06, $12, $00, $00, $0b, $04, $52, $03
	db $71, $27, $00, $00, $00, $60, $5f, $81, $1d, $00, $00, $2a, $04, $84, $03, $6d
	db $28, $00, $00, $00, $5d, $63, $77, $5f, $13, $00, $18, $04, $dc, $05
BattleData_02d_4c67::
	db $04, $8d, $2d, $00, $00, $00, $54, $52, $0a, $50, $00, $00, $8d, $05, $21, $02
	db $41, $2e, $00, $00, $00, $05, $69, $71, $6e, $00, $00, $02, $06, $8f, $02, $3f
	db $2e, $00, $00, $00, $6b, $06, $6a, $68, $00, $00, $08, $06, $b6, $03, $9a, $2f
	db $00, $00, $00, $3f, $3d, $32, $31, $13, $00, $79, $06, $1f, $04
BattleData_02d_4ca4::
	db $02, $35, $2b, $00, $00, $00, $55, $54, $53, $52, $00, $00, $b2, $05, $dc, $05
	db $05, $2c, $00, $00, $00, $2e, $2a, $36, $2d, $12, $00, $36, $06, $41, $05
BattleData_02d_4cc3::
	db $03, $5f, $25, $00, $00, $00, $83, $82, $44, $43, $00, $00, $00, $04, $c8, $00
	db $68, $26, $00, $00, $00, $4c, $4d, $47, $73, $00, $00, $e9, $03, $c2, $01, $7a
	db $27, $00, $00, $00, $76, $81, $7e, $07, $07, $00, $ef, $03, $c4, $09
BattleData_02d_4cf1::
	db $03, $29, $29, $00, $00, $00, $7b, $7a, $20, $72, $00, $00, $dc, $05, $2b, $07
	db $32, $2a, $00, $00, $00, $75, $05, $0f, $04, $00, $00, $b6, $05, $9f, $06, $9d
	db $2b, $00, $00, $00, $75, $7a, $12, $7b, $07, $00, $66, $06, $01, $04
BattleData_02d_4d1f::
	db $03, $79, $2d, $00, $00, $00, $76, $74, $73, $72, $00, $00, $da, $05
	db $15, $04, $7b, $2e, $00, $00, $00, $75, $7a, $7b, $12, $12, $00, $2c, $06, $ce
	db $04, $05, $2f, $00, $00, $00, $2e, $2d, $36, $2a, $01, $00, $40, $06, $1f, $04
BattleData_02d_4d4d::
	db $03, $8c, $30, $00, $00, $00, $6b, $69, $6f, $68, $00, $00, $f9, $06, $ed, $03
	db $88, $31, $00, $00, $00, $69, $6b, $5a, $68, $14, $00, $08, $07, $51, $04, $64
	db $32, $00, $00, $00, $4f, $4e, $4d, $3c, $01, $00, $74, $07, $4c, $04
BattleData_02d_4d7b::
	db $04, $2e
	db $30, $00, $00, $00, $88, $74, $73, $72, $00, $00, $e3, $06, $14, $00, $24, $31
	db $00, $00, $00, $5d, $7e, $81, $15, $00, $00, $08, $07, $32, $00, $0a, $32, $00
	db $00, $00, $0a, $0f, $20, $02, $12, $00, $5a, $07, $0f, $00, $06, $33, $00, $00
	db $00, $36, $35, $3d, $3c, $13, $00, $9f, $07, $23, $00
BattleData_02d_4db8::
	db $03, $0b, $32, $00, $00, $00, $43, $41, $8a, $21, $00, $00, $44, $07, $29, $04
	db $03, $33, $00, $00, $00, $3c, $39, $3f, $37, $00, $00, $c0, $07, $0b, $04, $05
	db $35, $00, $00, $00, $36, $2a, $2e, $2d, $01, $00, $98, $08, $4c, $04
BattleData_02d_4de6::
	db $03, $42, $32, $00, $00, $00, $29, $6b, $89, $6f, $00, $00, $74, $07, $1a, $04
	db $05, $33, $00, $00, $00, $17, $2e, $2a, $36, $00, $00, $9f, $07, $e8, $03, $0b
	db $34, $00, $00, $00, $43, $8a, $41, $29, $00, $00, $ec, $07, $51, $04
BattleData_02d_4e14::
	db $02, $7d, $33, $00, $00, $00, $88, $89, $74, $0a, $00, $00, $c5, $07, $4c, $04
	db $2e, $34, $00, $00, $00, $88, $89, $74, $0a, $00, $00, $e5, $07, $51, $04
BattleData_02d_4e33::
	db $03, $53, $32, $00, $00, $00, $22, $36, $0a, $20, $00, $00, $62, $07, $ed, $03
	db $14, $33, $00, $00, $00, $81, $46, $83, $7e, $00, $00, $a8, $07, $1a, $04, $3d
	db $34, $00, $00, $00, $68, $22, $87, $06, $00, $00, $ee, $07, $7e, $04
BattleData_02d_4e61::
	db $02, $31, $32, $00, $00, $00, $76, $27, $74, $42, $00, $00, $6c, $07, $e8, $03
	db $77, $33, $00, $00, $00, $73, $88, $89, $74, $00, $00, $a7, $07, $ed, $03
BattleData_02d_4e80::
	db $03, $06, $32, $00, $00, $00, $36, $28, $3b, $0b, $00, $00, $35, $07, $e8, $03
	db $87, $33, $00, $00, $00, $6c, $89, $5a, $69, $00, $00, $a5, $07, $1a, $04, $79
	db $34, $00, $00, $00, $76, $74, $73, $42, $00, $00, $e4, $07, $4c, $04
BattleData_02d_4eae::
	db $02, $06, $32, $00, $00, $00, $35, $3d, $24, $3c, $00, $00, $32, $07, $1a, $04
	db $79, $33, $00, $00, $00, $74, $42, $0b, $27, $00, $00, $6b, $07, $4c, $04
BattleData_02d_4ecd::
	db $03, $53, $32, $00, $00, $00, $36, $22, $0a, $20, $00, $00, $2f, $07, $e8, $03
	db $55, $33, $00, $00, $00, $3e, $29, $89, $83, $00, $00, $71, $07, $f2, $03, $52
	db $34, $00, $00, $00, $38, $32, $11, $0d, $00, $00, $f0, $07, $60, $04
BattleData_02d_4efb::
	db $03, $36, $35, $00, $00, $00, $54, $52, $56, $0a, $00, $00, $f8, $07, $2c, $06
	db $3a, $36, $00, $00, $00, $0a, $26, $54, $02, $00, $00, $34, $08, $45, $06, $05
	db $37, $00, $00, $00, $2e, $2a, $2d, $36, $12, $00, $98, $08, $a5, $05
BattleData_02d_4f29::
	db $03, $8e, $36, $00
	db $00, $00, $69, $06, $05, $71, $00, $00, $46, $08, $2c, $06, $8a, $37, $00, $00
	db $00, $85, $00, $00, $00, $00, $00, $f8, $07, $45, $06, $7c, $38, $00, $00, $00
	db $7a, $7b, $73, $20, $14, $00, $30, $09, $a5, $05
BattleData_02d_4f57::
	db $03, $98, $36, $00, $00, $00, $75, $12, $7a, $7b, $00, $00, $1c, $08, $dc, $05
	db $2c, $37, $00, $00, $00, $76, $75, $74, $73, $00, $00, $38, $08, $aa, $05, $9d
	db $38, $00, $00, $00, $7a, $7b, $12, $75, $13, $00, $fc, $08, $e2, $04
BattleData_02d_4f85::
	db $03, $1b, $39, $00, $00, $00, $49, $12, $82, $89, $00, $00, $34, $08, $dc, $05
	db $66, $3a, $00, $00, $00, $4b, $4a, $49, $48, $00, $00, $a9, $08, $72, $06, $9b
	db $3b, $00, $00, $00, $4e, $4b, $48, $8b, $13, $00, $db, $09, $a4, $06
BattleData_02d_4fb3::
	db $03, $0d, $3a, $00, $00, $00, $46, $19, $0a, $45, $00, $00, $10, $09, $45, $06
	db $61, $3b, $00, $00, $00, $44, $43, $42, $41, $00, $00, $f2, $09, $af, $05, $9c
	db $3c, $00, $00, $00, $41, $7d, $22, $45, $14, $00, $2c, $0a, $40, $06
BattleData_02d_4fe1::
	db $03, $98, $3b, $00, $00, $00, $75, $12, $7a, $7b, $00, $00, $9b, $08, $dc, $05
	db $7b, $3c, $00, $00, $00, $75, $7a, $7b, $1a, $00, $00, $71, $09, $78, $05, $9d
	db $3d, $00, $00, $00, $7a, $7b, $12, $75, $01, $00, $28, $0a, $0e, $06
BattleData_02d_500f::
	db $03, $4e, $3c, $00, $00, $00, $3d, $3c, $3e, $3b, $00, $00, $51, $09, $00, $00
	db $4a, $3d, $00, $00, $00, $58, $7d, $77, $7f, $00, $00, $c9, $09, $00, $00, $9e
	db $3e, $00, $00, $00, $33, $77, $3e, $3d, $02, $00, $96, $0a, $00, $00
BattleData_02d_503d::
	db $03, $40, $3d, $00, $00, $00, $6c, $69, $5a, $13, $13, $00, $00, $00, $00, $00
	db $45, $3e, $00, $00, $00, $6a, $7e, $82, $81, $14, $00, $00, $00, $00, $00, $9f
	db $3f, $00, $00, $00, $4f, $61, $5d, $62, $02, $00, $00, $00, $00, $00
BattleData_02d_506b::
	db $01, $83, $5a, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00

INCLUDE "engine/battle/wild_encounters.asm"
