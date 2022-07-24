unk_00b_4000:
	dr $2c000, $2c13c

MovementData_OneLeft::
	db LEFT, $ff

MovementData_OneRight::
	db RIGHT, $ff

MovementData_00b_4140::
	db RIGHT, RIGHT, $ff

MovementData_00b_4143::
	db LEFT, DOWN, DOWN, RIGHT, $ff

MovementData_00b_4148::
	db DOWN, RIGHT, $ff

MovementData_00b_414b::
	db DOWN, LEFT, $ff

MovementData_00b_414e::
	db LEFT, DOWN, $ff

MovementData_00b_4151::
	db LEFT, UP, $ff

MovementData_00b_4154::
	db DOWN, LEFT, UP, $ff

MovementData_00b_4158::
	db RIGHT, DOWN, DOWN, LEFT, $ff

Pointers_00b_415d:
	dw .unk_00b_416d
	dw .unk_00b_4173
	dw .unk_00b_416d
	dw .unk_00b_4173
	dw .unk_00b_416d
	dw .unk_00b_4173
	dw .unk_00b_416d
	dw .unk_00b_4179

.unk_00b_416d:
	db $02, $02
	db $27, $29, $28, $2a

.unk_00b_4173:
	db $02, $02
	db $2b, $2d, $2c, $2e

.unk_00b_4179:
	db $ff, $ff

Func_00b_417b::
	call Func_00b_606f
	ld de, ScriptCommandTable
	ld a, [wScriptByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
	ret ; ?

unk_00b_418e:
	dr $2c18e, $2c191

MovementData_OneDown::
	db DOWN, $ff

MovementData_OneUp::
	db UP, $ff

unk_00b_4195::
	dr $2c195, $2c250

ScriptCommandTable:
; Entries correspond to script_* constants (see macros/script.asm)
	dw Script_continue ; $00
	dw Script_spriteface       ; $01
	dw Script_delay    ; $02
	dw Script_03       ; $03
	dw Script_04       ; $04 another textbox command?
	dw Script_face     ; $05
	dw Script_spritewalk       ; $06
	dw Script_07       ; $07
	dw Script_08       ; $08
	dw Script_end      ; $09
	dw Script_checkbit ; $0a
	dw Script_setbit   ; $0b
	dw Script_setmap   ; $0c
	dw Script_movemap  ; $0d
	dw Script_0e       ; $0e
	dw Script_move     ; $0f
	dw Script_10       ; $10
	dw Script_11       ; $11
	dw Script_12       ; $12
	dw Script_13       ; $13
	dw Script_text     ; $14
	dw Script_emote    ; $15
	dw Script_16       ; $16 load sprite definitions?
	dw Script_17       ; $17
	dw Script_18       ; $18
	dw Script_19       ; $19
	dw Script_1a       ; $1a
	dw Script_1b       ; $1b
	dw Script_1c       ; $1c
	dw Script_1d       ; $1d
	dw Script_1e       ; $1e
	dw Script_1f       ; $1f
	dw Script_20       ; $20
	dw Script_21       ; $21
	dw Script_22       ; $22
	dw Script_23       ; $23
	dw Script_24       ; $24
	dw Script_25       ; $25
	dw Script_26       ; $26
	dw Script_27       ; $27
	dw Script_28       ; $28
	dw Script_29       ; $29
	dw Script_farjump  ; $2a
	dw Script_2b       ; $2b
	dw Script_2c       ; $2c
	dw Script_2d       ; $2d
	dw Script_2e       ; $2e
	dw Script_2f       ; $2f
	dw Script_30       ; $30
	dw Script_31       ; $31
	dw Script_32       ; $32
	dw Script_33       ; $33
	dw Script_34       ; $34
	dw Script_35       ; $35
	dw Script_36       ; $36
	dw Script_37       ; $37
	dw Script_38       ; $38
	dw Script_39       ; $39
	dw Script_3a       ; $3a
	dw Script_3b       ; $3b start a battle?
	dw Script_3c       ; $3c
	dw Script_3d       ; $3d
	dw Script_3e       ; $3e
	dw Script_3f       ; $3f
	dw Script_40       ; $40
	dw Script_41       ; $41
	dw Script_42       ; $42
	dw Script_43       ; $43
	dw Script_44       ; $44
	dw Script_45       ; $45
	dw Script_46       ; $46
	dw Script_47       ; $47
	dw Script_48       ; $48
	dw Script_49       ; $49
	dw Script_4a       ; $4a
	dw Script_4b       ; $4b
	dw Script_4c       ; $4c
	dw Script_4d       ; $4d
	dw Script_4e       ; $4e
	dw Script_4f       ; $4f
	dw Script_50       ; $50
	dw Script_51       ; $51
	dw Script_52       ; $52
	dw Script_53       ; $53
	dw Script_54       ; $54
	dw Script_55       ; $55
	dw Script_56       ; $56
	dw Script_57       ; $57
	dw Script_58       ; $58
	dw Script_59       ; $59
	dw Script_5a       ; $5a
	dw Script_5b       ; $5b
	dw Script_5c       ; $5c
	dw Script_5d       ; $5d
	dw Script_5e       ; $5e
	dw Script_5f       ; $5f
	dw Script_60       ; $60
	dw Script_61       ; $61
	dw Script_62       ; $62
	dw Script_63       ; $63
	dw Script_64       ; $64
	dw Script_65       ; $65
	dw Script_66       ; $66
	dw Script_67       ; $67 follower related?
	dw Script_68       ; $68
	dw Script_69       ; $69
	dw Script_6a       ; $6a
	dw Script_6b       ; $6b
	dw Script_6c       ; $6c
	dw Script_6d       ; $6d
	dw Script_6e       ; $6e
	dw Script_6f       ; $6f
	dw Script_70       ; $70
	dw Script_71       ; $71
	dw Script_72       ; $72
	dw Script_73       ; $73
	dw Script_74       ; $74
	dw Script_75       ; $75
	dw Script_76       ; $76
	dw Script_77       ; $77

Script_continue:
	call GetScriptByte
	ret

Script_spriteface:
	call GetSpriteIDByte
	call GetScriptByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, 3
	add hl, bc
	ld a, [wScriptByte]
	ld [hli], a
	inc hl
	ld [hl], 0
	ld hl, $0d
	add hl, bc
	ld [hl], 1
	xor a
	ld [wScriptByte], a
	call Func_06f8
	ret

GetSpriteIDByte:
	call GetScriptByte
	ld a, [wScriptByte]
	cp $88
	jr z, .asm_437f
	cp $99
	jr z, .asm_4386
; sprite selected, translate this into
; proper sprite position in RAM
	swap a
	sla a
	ld [wSelectedObjectOffset], a
	ret

.asm_437f
	ld a, [wcd0b]
	ld [wSelectedObjectOffset], a
	ret

.asm_4386
	ld a, [wdce5]
	swap a
	sla a
	ld [wSelectedObjectOffset], a
	ret

Script_delay:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfc], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfd], a
	ld a, 3
	ld [wScriptByte], a
	ret

Script_03:
; Delay?
	ld hl, wcbfc
	ldh a, [hFF9D]
	and [hl]
	ret nz
	ld a, [wcbfd]
	dec a
	ld [wcbfd], a
	ret nz

	xor a
	ld [wScriptByte], a
	ret

Script_04:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wTextStart], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wTextStart + 1], a
	ld a, 1
	ldh [hFFBC], a
	call AdjustTextboxYPosition
	xor a
	ld [wScriptByte], a
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, 3
	add hl, bc
	ld a, [wcd03]
	srl a
	ld a, 0
	rla
	ld e, a
	ld a, 1
	sub e
	ld e, a
	ld a, [wcd03]
	and $0e
	add e
	ld [hl], a
	call Func_06f8
	ret

AdjustTextboxYPosition:
	ld a, TEXTBOX_TOP
	ld [wTextboxPos], a
; Check y coord
	ld a, [wcd00]
	cp $60
	ret nc

	xor a ; TEXTBOX_BOTTOM
	ld [wTextboxPos], a
	ret

Script_face:
; Makes the player face a certain direction.
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcd03], a
	ld a, 0
	ld [wcd05], a
	ld a, 1
	ld [hFFAC], a
	ld [wdcd0], a
	ld a, 6
	ld [hFFAD], a
	xor a
	ld [wScriptByte], a
	call Func_0426
	ret

Script_spritewalk:
	call GetSpriteIDByte
	call GetScriptByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, $08
	add hl, bc
	ld a, [wScriptByte]
	ld [hl], a
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld hl, $0f
	add hl, bc
	ld [hl], $02
	ld a, $07
	ld [wScriptByte], a
	ret

Script_07:
	call Func_0639
	call Func_00b_445e
	call Func_0426
	ret

Func_00b_445e:
	ld a, [wd1e2]
	and a
	ret z

	ld hl, wcd00
	ld a, [wcd08]
	cp [hl]
	jr z, .asm_4472
	jr c, .asm_4471

	inc [hl]
	jr .asm_4472

.asm_4471
	dec [hl]

.asm_4472
	ld hl, wcd01
	ld a, [wcd09]
	cp [hl]
	ret z
	jr c, .asm_447e
	inc [hl]
	ret

.asm_447e
	dec [hl]
	ret

Script_08:
	call GetSpriteIDByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld a, [bc]
	ld [wcd08], a
	inc bc
	ld a, [bc]
	ld [wcd09], a
	ld a, 1
	ld [wd1e2], a
	xor a
	ld [wScriptByte], a
	ret

Script_end:
	xor a
	ldh [hFFD6], a
	ldh [hSimulatedJoypadState], a
	ld [wd0f0], a
	call Func_0817
	call Func_19b6
	ret

Script_checkbit:
	call GetFlagLocation
	bit 0, b
	jr nz, .asm_44c9

	ld hl, wScriptPos
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, 2
	add hl, de
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a
	xor a
	ld [wScriptByte], a
	ret

.asm_44c9
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
	xor a
	ld [wScriptByte], a
	ret

GetFlagLocation:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld h, a
	pop af
	ld l, a
	push hl
	call GetScriptByte
	pop hl
	ld a, [hl]
	ld b, a
	ld a, [wScriptByte]
	ld c, a
	and a
	ret z
.asm_44ff
	rrc b
	dec c
	jr nz, .asm_44ff
	ret

Script_setbit:
	call GetFlagLocation
	set 0, b
	ld a, [wScriptByte]
	ld c, a
	and a
	jr z, .asm_4516
.asm_4511
	rlc b
	dec c
	jr nz, .asm_4511

.asm_4516
	ld a, b
	ld [hl], a
	xor a
	ld [wScriptByte], a
	ret

Script_setmap:
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hMapNumber], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hWarpNumber], a
; Enable map switch
	ld a, 1
	ld [hFade], a
	xor a
	ld [wScriptByte], a
	ret

Script_movemap:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
	ld a, $0e
	ld [wScriptByte], a
	ret

MovementData_TwelveUp:
rept 12
	db UP
endr
	db $ff

MovementData_TwoDown:
	db DOWN, DOWN, $ff

Script_0e:
	call DelayFrame
	call Func_00b_653d
	call Func_00b_6229
	call Func_00b_625c
	ret

Script_move:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
; Next command
	ld a, $10
	ld [wScriptByte], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret

Script_10:
	call Func_00b_60dd
	call Func_00b_61d6
	call Func_0426
	ret

Script_11:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
; move to next script
	ld a, $12
	ld [wScriptByte], a
	ret

Script_12:
	call Func_00b_60b2
	call Func_0426
	ret

Script_13:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcca], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdccb], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdccd], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcce], a

	xor a
	ld [wScriptByte], a
	ld [wdccc], a
	ld a, 1
	ld [wdccf], a
	ret

Script_text:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wTextStart], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wTextStart + 1], a

	call AdjustTextboxYPosition

; Display text
	ld a, 1
	ldh [hFFBC], a
	xor a
	ld [wScriptByte], a
	ret

Script_emote:
; Display emote
	ld a, SFX_44
	call PlaySound
	call GetSpriteIDByte
	call GetScriptByte
	ld bc, wd1a0
.asm_460d
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_461d

	ld hl, 8
	add hl, bc
	ld c, l
	ld b, h
	jr .asm_460d

.asm_461d
	ld hl, 3
	add hl, bc
	ld a, [wScriptByte]
	ld [hli], a
	ld a, [wSelectedObjectOffset]
	ld e, a
	ld [hl], a
	ld d, HIGH(wVisibleObjects)
	ld hl, unk_00b_466b
	ld a, [wScriptByte]
	cp $06
	jr z, .asm_4650

.asm_4636
	add a
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [de]
	add [hl]
	ld [bc], a
	inc hl
	inc de
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, [hl]
	ld [bc], a
	xor a
	ld [wScriptByte], a
	ret

.asm_4650
	ld hl, unk_00b_465b
	ld a, [wcd03]
	sub $0e
	jr .asm_4636
	ret ; ?

unk_00b_465b:
	dr $2c65b, $2c66b

unk_00b_466b:
	dr $2c66b, $2c683

Script_16:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	pop af
	ld e, a
	ld a, [wScriptByte]
	ld d, a
	dec de
	ld hl, Func_08a2
	ld a, [hScriptBank]
	ld b, a
	rst FarCall
	xor a
	ld [wScriptByte], a
	ret

Script_17:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	pop af
	swap a
	sla a
	ld l, a
	ld h, HIGH(wVisibleObjects)
	ld a, [wScriptByte]
	add [hl]
	ld [hli], a
	push hl
	call GetScriptByte
	pop hl
	ld a, [wScriptByte]
	add [hl]
	ld [hli], a
	ret

Script_18:
	call GetSpriteIDByte
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
	ld a, [wScriptPos]
	ld [wdcd3], a
	ld a, [wScriptPos + 1]
	ld [wdcd3 + 1], a
	ld a, [wMovementPointer]
	ld [wScriptPos], a
	ld a, [wMovementPointer + 1]
	ld [wScriptPos + 1], a
	ldh a, [hScriptBank]
	ld [wdcad], a
	ld a, $b
	ldh [hScriptBank], a
; move to next script
	ld a, $19
	ld [wScriptByte], a
	ret

Script_19:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, 0
	add hl, bc
	pop af
	cp $88
	jr z, asm_00b_473a
	add [hl]
	ld [hli], a
	ld a, [wScriptByte]
	add [hl]
	ld [hl], a
	ld hl, $14
	add hl, bc
	ld a, [hl]
	and a
	jr z, asm_00b_4734
	ld e, a
	ld d, $cd
	inc hl
	ld a, [bc]
	add [hl]
	ld [de], a
	inc bc
	inc de
	inc hl
	ld a, [bc]
	add [hl]
	ld [de], a

asm_00b_4734:
	ld a, $19
	ld [wScriptByte], a
	ret

asm_00b_473a:
	ld a, [wdcd3]
	ld [wScriptPos], a
	ld a, [wdcd3 + 1]
	ld [wScriptPos + 1], a
	ld a, [wdcad]
	ldh [hScriptBank], a
	xor a
	ld [wScriptByte], a
	ret

Script_1a:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetSpriteIDByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, $14
	add hl, bc
	pop af
	swap a
	sla a
	ld [hli], a
	push hl
	call GetScriptByte
	pop hl
	ld a, [wScriptByte]
	ld [hli], a
	push hl
	call GetScriptByte
	pop hl
	ld a, [wScriptByte]
	ld [hli], a
	xor a
	ld [wScriptByte], a
	ret

Script_1b:
	call GetSpriteIDByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, $14
	add hl, bc
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wScriptByte], a
	ret

Script_1c:
	call GetSpriteIDByte

Func_00b_4799:
	ld a, [wSelectedObjectOffset]
	ld l, a
	ld h, HIGH(wVisibleObjects)
	ld c, $20
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ld [wScriptByte], a
	ret

Script_1d:
	call GetSpriteIDByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, 1
	add hl, bc
	ld a, [hl]
	sub 8
	srl a
	srl a
	srl a
	srl a
	ld l, a
	ld a, [hFFAA]
	add l
	ld [de], a
	ld [wd0c3], a
	ld a, [bc]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld l, a
	ld a, [hFFAB]
	add l
	ld [de], a
	inc de
	ld [wd0c2], a
	ld hl, $12
	add hl, bc
	ld a, [wd0c2]
	ld [hli], a
	ld a, [wd0c3]
	ld [hl], a
	xor a
	ld [wScriptByte], a
	ret

Script_1e:
	call GetScriptByte
	ld a, [wScriptByte]
	ld hl, wda00
	ld de, $c
.loop
	dec a
	jr z, .skip
	add hl, de
	jr .loop
.skip
	push hl
	call GetScriptByte
	pop hl
	ld a, [wScriptByte]
	ld [hl], a
	xor a
	ld [wScriptByte], a
	ret

Script_1f:
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hFFBA], a
	xor a
	ld [wScriptByte], a
	ret

Script_20:
	ld de, unk_00b_482d
	ld a, [wd080]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

unk_00b_482d:
	dw asm_00b_4841
	dw asm_00b_48b6
	dw asm_00b_48e0
	dw asm_00b_4907
	dw asm_00b_492e
	dw asm_00b_4955

unk_00b_4839:
	db $16
	db $0
	db $f4
	db $0
	db $0
	db $3
	db $0
	db $0

asm_00b_4841:
	ld a, SFX_4b
	call PlaySound
	ld a, 1
	ld [wd080], a
	xor a
	ld [wd081], a
	ld de, unk_00b_4839
	dec de
	ld bc, wcd40

asm_00b_4856:
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_00b_48ad
	ld a, c
	ld [wSelectedObjectOffset], a
	inc de
	ld a, [de]
	ld hl, 4
	add hl, bc
	ld [hl], a
	inc de
	ld a, [de]
	ld l, a
	ld a, [wcd01]
	add l
	ld hl, 1
	add hl, bc
	ld [hld], a
	inc de
	ld a, [de]
	ld l, a
	ld a, [wcd00]
	add l
	ld hl, 0
	add hl, bc
	ld [hli], a
	inc hl
	ld [hl], 1
	ld hl, 6
	add hl, bc
	ld a, c
	swap a
	and $f
	add a
	add a
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld hl, 8
	add hl, bc
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, 1
	ld [hl], a
	call LoadSpritePalette
	ret

asm_00b_48ad:
	ld hl, $20
	add hl, bc
	push hl
	pop bc
	jr asm_00b_4856
	ret

asm_00b_48b6:
	ld a, [wd081]
	inc a
	ld [wd081], a
	cp $38
	ret c
	xor a
	ld [wd081], a
	ld a, SFX_4b
	call PlaySound
	ld a, 2
	ld [wd080], a
	ld a, [wSelectedObjectOffset]
	ld l, a
	ld h, HIGH(wVisibleObjects)
	ld a, [hl]
	add 8
	ld [hli], a
	ld a, [hl]
	sub 8
	ld [hli], a
	inc hl
	ld [hl], 1
	ret

asm_00b_48e0:
	ld a, [wd081]
	inc a
	ld [wd081], a
	cp $38
	ret c
	ld a, SFX_4b
	call PlaySound
	xor a
	ld [wd081], a
	ld a, 3
	ld [wd080], a
	ld a, [wSelectedObjectOffset]
	ld l, a
	ld h, HIGH(wVisibleObjects)
	ld a, [hl]
	add $10
	ld [hli], a
	inc hl
	inc hl
	ld [hl], 2
	ret

asm_00b_4907:
	ld a, [wd081]
	inc a
	ld [wd081], a
	cp $38
	ret c
	ld a, SFX_4b
	call PlaySound
	xor a
	ld [wd081], a
	ld a, 4
	ld [wd080], a
	ld a, [wSelectedObjectOffset]
	ld l, a
	ld h, HIGH(wVisibleObjects)
	inc hl
	ld a, [hl]
	add $10
	ld [hli], a
	inc hl
	ld [hl], 3
	ret

asm_00b_492e:
	ld a, [wd081]
	inc a
	ld [wd081], a
	cp $38
	ret c
	ld a, SFX_4b
	call PlaySound
	xor a
	ld [wd081], a
	ld a, 5
	ld [wd080], a
	ld a, [wSelectedObjectOffset]
	ld l, a
	ld h, HIGH(wVisibleObjects)
	ld a, [hl]
	sub $10
	ld [hli], a
	inc hl
	inc hl
	ld [hl], 4
	ret

asm_00b_4955:
	ld a, [wd081]
	inc a
	ld [wd081], a
	cp $38
	ret c
	xor a
	ld [wd081], a
	ld [wd080], a
	call Func_00b_4799
	ld a, SFX_32
	call PlaySound
	ret

Script_21:
	call GetSpriteIDByte
	ld a, [wSelectedObjectOffset]
	ld l, a
	ld h, HIGH(wVisibleObjects)
	push hl
	call GetSpriteIDByte
	pop hl
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	inc bc
	inc hl
	ld a, [hl]
	ld [bc], a
	xor a
	ld [wScriptByte], a
	ret

Script_22:
	call GetSpriteIDByte
	ld a, [wSelectedObjectOffset]
	ld l, a
	ld h, HIGH(wVisibleObjects)
	push hl
	call GetSpriteIDByte
	pop hl
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, $cd
	ld a, [hl]
	ld [bc], a
	xor a
	ld [wScriptByte], a
	ret

Script_23:
	call GetScriptByte
	ld a, [wScriptByte]
	ld hl, wcd00
	ld bc, $20
	and a
	jr z, asm_00b_49ba

asm_00b_49b6:
	add hl, bc
	dec a
	jr nz, asm_00b_49b6

asm_00b_49ba:
	ld a, l
	ld [wSelectedObjectOffset], a
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	pop af
	ld e, a
	ld a, [wScriptByte]
	ld d, a
	ld hl, Func_0925
	ld a, [hScriptBank]
	ld b, a
	rst FarCall
	xor a
	ld [wScriptByte], a
	ret

Script_24:
	ld a, [wcd03]
	cp 1
	jr z, asm_00b_4a1a
	cp 0
	jr z, asm_00b_49f0
	cp 2
	jr z, asm_00b_49fe
	cp 3
	jr z, asm_00b_4a0c
	jr asm_00b_4a1a

asm_00b_49f0:
	ld hl, wMovementPointer
	ld [hl], $43
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_49fe:
	ld hl, wMovementPointer
	ld [hl], $4b
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4a0c:
	ld hl, wMovementPointer
	ld [hl], $8e
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4a1a:
	xor a
	ld [wScriptByte], a
	ret

Func_00b_4a1f:
	ld a, [wcd00]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAB]
	add e
	ld [wcd12], a
	ld a, [wcd01]
	sub 8
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAA]
	add e
	ld [wcd13], a
	ret

Script_25:
	call Func_00b_61a2
	call Func_00b_61d6
	call Func_0426
	call Func_00b_4a1f
	ret

Script_26:
	call GetScriptByte
	ld a, [wScriptByte]
	ld hl, wda00
	ld de, $c

asm_00b_4a61:
	dec a
	jr z, asm_00b_4a67
	add hl, de
	jr asm_00b_4a61

asm_00b_4a67:
	ld [hl], $ff
	xor a
	ld [wScriptByte], a
	ret

Script_27:
	call GetFlagLocation
	res 0, b
	ld a, [wScriptByte]
	ld c, a
	and a
	jr z, asm_00b_4a7f

asm_00b_4a7a:
	rlc b
	dec c
	jr nz, asm_00b_4a7a

asm_00b_4a7f:
	ld a, b
	ld [hl], a
	xor a
	ld [wScriptByte], a
	ret

Script_28:
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeOutPalette
	ld a, $c7
	ldh [rLCDC], a
	xor a
	ld [wScriptByte], a
	ret

Script_29:
	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette
	xor a
	ld [wScriptByte], a
	ret

Script_farjump:
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hScriptBank], a
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
	xor a
	ld [wScriptByte], a
	ret

Script_2b:
	ld a, [wcd03]
	and a
	jr z, asm_00b_4ae3
	ld a, [wScriptPos]
	add 2
	ld [wScriptPos], a
	ld a, [wScriptPos + 1]
	adc 0
	ld [wScriptPos + 1], a
	jr asm_00b_4af7

asm_00b_4ae3:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a

asm_00b_4af7:
	xor a
	ld [wScriptByte], a
	ret

Script_2c:
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call Func_09a6
	call Func_00b_605c
	call Func_00b_603d
	call ClearBGMap0
	call Func_00b_604e
	call Func_0a0a
	call Func_0a46
	ld hl, wcab0
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	ld a, 0
	ld [wcd00], a
	xor a
	ld [wScriptByte], a
	ret

Script_2d:
	call GetScriptByte
	ld a, [wScriptByte]
	ld e, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	push de
	pop hl
	ld a, [wScriptByte]
	ld d, a
	pop af
	ld e, a
	ld a, [de]
	inc de
	ldh [hFF92], a
	ld b, a
	ld a, [de]
	inc de
	ld [hFF93], a
	ld c, a

asm_00b_4b5a:
	push hl

asm_00b_4b5b:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, asm_00b_4b5b
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, asm_00b_4b5a
	xor a
	ld [wScriptByte], a
	ret

Script_2e:
	call GetScriptByte
	ld a, [wScriptByte]
	ld c, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld hl, wMapLayout
	add hl, bc
	ld [hl], a
	xor a
	ld [wScriptByte], a
	ret

Script_2f:
	call GetScriptByte
	ld a, [wScriptByte]
	ld e, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	push de
	pop hl
	ld a, [wScriptByte]
	ld d, a
	pop af
	ld e, a
	ld a, [de]
	ld b, a
	ldh [hFF92], a
	inc de
	ld a, [de]
	ld c, a
	ld [hFF93], a
	inc de
	call Func_00b_65e7
	xor a
	ld [wScriptByte], a
	ret

Script_30:
	ld a, [wd083]
	ld [wdcca], a
	ld a, [wd084]
	ld [wdccb], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdccd], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcce], a
	xor a
	ld [wScriptByte], a
	ld [wdccc], a
	ld a, 1
	ld [wdccf], a
	ret

Script_31:
	ld a, [wd083]
	ld e, a
	ld a, [wd084]
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	push de
	pop hl
	ld a, [wScriptByte]
	ld d, a
	pop af
	ld e, a
	ld a, [de]
	ld b, a
	ldh [hFF92], a
	inc de
	ld a, [de]
	ld c, a
	ldh [hFF93], a
	inc de
	call Func_00b_65e7
	xor a
	ld [wScriptByte], a
	ret

Script_32:
	ld a, [wcd03]
	cp 3
	jr z, asm_00b_4c5a
	cp 0
	jr z, asm_00b_4c30
	cp 1
	jr z, asm_00b_4c3e
	cp 2
	jr z, asm_00b_4c4c
	jr asm_00b_4c5a

asm_00b_4c30:
	ld hl, wMovementPointer
	ld [hl], $4e
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4c3e:
	ld hl, wMovementPointer
	ld [hl], $51
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4c4c:
	ld hl, wMovementPointer
	ld [hl], $54
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4c5a:
	xor a
	ld [wScriptByte], a
	ret

Script_33:
	ld a, [wcd03]
	cp 1
	jr z, asm_00b_4c9e
	cp 0
	jr z, asm_00b_4c74
	cp 2
	jr z, asm_00b_4c82
	cp 3
	jr z, asm_00b_4c90
	jr asm_00b_4c9e

asm_00b_4c74:
	ld hl, wMovementPointer
	ld [hl], $58
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4c82:
	ld hl, wMovementPointer
	ld [hl], $4b
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4c90:
	ld hl, wMovementPointer
	ld [hl], $8e
	inc hl
	ld [hl], $41
	ld a, $25
	ld [wScriptByte], a
	ret

asm_00b_4c9e:
	xor a
	ld [wScriptByte], a
	ret

Script_34:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wTargetMode], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hMapNumber], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hWarpNumber], a
	ld a, $01
	ldh [hFade], a
	xor a
	ld [wScriptByte], a
	ret

Script_35:
	dr $2ccc5, $2ccde

Script_36:
	ld a, BGM_59
	call PlaySound
	farcall Func_039_4892
	xor a
	ld [wScriptByte], a
	ret

Script_37:
	ld a, SFX_29
	call PlaySound
	call Func_00b_4dc5
	call Func_00b_4dc5
	call Func_00b_4dc5
	call Func_00b_4d04
	xor a
	ld [wScriptByte], a
	ret

Func_00b_4d04:
	xor a
	ld [hFFB9], a
	ld bc, wde00

asm_00b_4d0b:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_00b_4d20

asm_00b_4d13:
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $b0
	jr c, asm_00b_4d0b
	jr asm_00b_4d3c

asm_00b_4d20:
	push bc
	call Func_1296
	pop bc
	ld hl, 2
	add hl, bc
	ld a, [wd99a]
	ld [hli], a
	ld a, [wd99b]
	ld [hli], a
	ld hl, $13
	add hl, bc
	ld [hl], 0
	call Func_00b_4d6c
	jr asm_00b_4d13

asm_00b_4d3c:
	ld bc, wPartyMons

asm_00b_4d3f:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	ret z
	push bc
	call Func_1296
	pop bc
	ld hl, 2
	add hl, bc
	ld a, [wd99a]
	ld [hli], a
	ld a, [wd99b]
	ld [hli], a
	ld hl, $13
	add hl, bc
	ld [hl], 0
	call Func_00b_4d6c
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, asm_00b_4d3f
	ret

Func_00b_4d6c:
	ld hl, 7
	add hl, bc
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc
	ld hl, 8
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc
	ld hl, $b
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc
	ld hl, $e
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc
	ld hl, $11
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ret

Func_00b_4dc5:
	ld hl, unk_2b38
	call CopyBackgroundPalettes
	ld hl, unk_2b38
	call CopyObjectPalettes
	call DelayFrame
	call DelayFrame
	ld hl, wcab0
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	call DelayFrame
	ret

Script_38:
	dr $2cdea, $2cdf5

Script_39:
	dr $2cdf5, $2ce0d

Script_3a:
	dr $2ce0d, $2ce39

Script_3b: ; start a battle?
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
	farcall Func_02d_507b
	ld a, $01
	ld [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld [wScriptByte], a
	ld a, $0c
	ld [wd3ff], a
	xor a
	ld [wd987], a
	ld hl, wd876
	ld a, l
	ld [wd984], a
	ld a, h
	ld [wd984 + 1], a
	ld a, [hl]
	ld [wEnemyMonSpecies], a
	ld bc, wPartyMons
	ld e, 0
.asm_4e7a:
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_4e90

	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc e
	ld a, l
	cp $80
	jr nc, .asm_4e90

	ld c, l
	ld b, h
	jr .asm_4e7a

.asm_4e90
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd981 + 1], a
	ld a, e
	ld [wd983], a
	call DelayFrame
	ret

Script_3c:
	dr $2cea0, $2cede

Script_3d:
	dr $2cede, $2cf2f

Script_3e:
	dr $2cf2f, $2cf48

Script_3f:
	dr $2cf48, $2cf99

Script_40:
	dr $2cf99, $2cfb4

Script_41:
	dr $2cfb4, $2cfe7

Script_42:
	dr $2cfe7, $2d02c

Script_43:
	dr $2d02c, $2d0cd

Script_44:
	xor a
	ld [wcd13], a
	ld [wcd12], a
	ld [wScriptByte], a
	ret

Script_45:
	dr $2d0d8, $2d118

Script_46:
	dr $2d118, $2d141

Script_47:
	dr $2d141, $2d16b

Script_48:
	ld a, SFX_1a
	call PlaySound
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd1f4], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd9f3], a
	ld a, 1
	ld [wd9d3], a
	farcall asm_039_479f
	xor a
	ld [wScriptByte], a
	ret

unk_00b_5192:
	dw wd300, wddb0, wd284

Script_49:
	dr $2d198, $2d235

Script_4a:
	dr $2d235, $2d273

Func_00b_5273::
	dr $2d273, $2d2c1

Script_4b:
	dr $2d2c1, $2d2e1

Script_4c:
	dr $2d2e1, $2d2f0

Script_4d:
	dr $2d2f0, $2d332

Script_4e:
	dr $2d332, $2d36a

Script_4f:
	dr $2d36a, $2d3ad

Script_50:
	dr $2d3ad, $2d415

Script_51:
	dr $2d415, $2d45e

Script_52:
	dr $2d45e, $2d46a

Script_53:
	dr $2d46a, $2d48c

Script_54:
	dr $2d48c, $2d4c8

Script_55:
	dr $2d4c8, $2d506

Script_56:
	dr $2d506, $2d52d

Script_57:
	dr $2d52d, $2d537

Script_58:
	dr $2d537, $2d562

Script_59:
	dr $2d562, $2d5b7

Script_5a:
	dr $2d5b7, $2d5fe

Script_5b:
	dr $2d5fe, $2d630

Script_5c:
	dr $2d630, $2d66a

Script_5d:
	dr $2d66a, $2d69a

Script_5e:
; Follower
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcea], a
	xor a
	ld [wScriptByte], a
	ret

Script_5f:
	dr $2d6a8, $2d895

Script_60:
	dr $2d895, $2d8a2

Script_61:
	dr $2d8a2, $2d8ad

Script_62:
	dr $2d8ad, $2d8cd

Script_63:
	dr $2d8cd, $2d90a

Script_64:
	dr $2d90a, $2d929

Script_65:
	dr $2d929, $2d93a

Script_66:
	dr $2d93a, $2d95e

Script_67:
	dr $2d95e, $2d999

Script_68:
	dr $2d999, $2da09

Script_69:
	dr $2da09, $2da18

Script_6a:
	dr $2da18, $2dabd

Script_6b:
	dr $2dabd, $2dae1

Script_6c:
	dr $2dae1, $2daf7

Script_6d:
	dr $2daf7, $2db76

Script_6e:
	dr $2db76, $2ddb7

Script_6f:
	dr $2ddb7, $2de8d

Script_70:
	dr $2de8d, $2de9b

Script_71:
	dr $2de9b, $2dea9

Script_72:
	dr $2dea9, $2dee7

Script_73:
	dr $2dee7, $2df5e

Script_74:
	dr $2df5e, $2df69

Script_75:
	dr $2df69, $2dff6

Script_76:
	dr $2dff6, $2e004

Script_77:
	dr $2e004, $2e03d

Func_00b_603d::
	dr $2e03d, $2e04e

Func_00b_604e::
	dr $2e04e, $2e05c

Func_00b_605c::
	dr $2e05c, $2e06f

Func_00b_606f:
	ld a, [wdccf]
	and a
	ret z
	ldh a, [hFF9D]
	and $07
	ret nz

	ld a, [wdccd]
	ld l, a
	ld a, [wdcce]
	ld h, a
	ld a, [wdccc]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wdcca]
	ld l, a
	ld a, [wdccb]
	ld h, a
	ld a, [de]
	cp $ff
	jr z, .asm_60ad

	ld b, a
	ldh [hFF92], a
	inc de
	ld a, [de]
	ld c, a
	ldh [hFF93], a
	inc de
	call Func_00b_65f6
	ld a, [wdccc]
	inc a
	ld [wdccc], a
	ret

.asm_60ad
	xor a
	ld [wdccf], a
	ret

Func_00b_60b2:
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	ld a, [hl]
	cp $88
	jr nz, asm_00b_60c4
	xor a
	ld [wScriptByte], a
	ret

asm_00b_60c4:
	ld a, [wcd00]
	add [hl]
	ld [wcd00], a
	inc hl
	ld a, [wcd01]
	add [hl]
	ld [wcd01], a
	inc hl
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ret

Func_00b_60dd:
	ldh a, [hSimulatedJoypadState]
	and a
	ret nz

	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_60f5

	xor a
	ld [wScriptByte], a
	ldh [hSimulatedJoypadState], a
	ret

.asm_60f5
	inc a
	ld [hSimulatedJoypadState], a
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ld a, $10
	ld [hFFA6], a
	ld a, 1
	ldh [hFFAC], a
	ret

Func_00b_610b:
	dr $2e10b, $2e1a2

Func_00b_61a2::
	dr $2e1a2, $2e1d6

Func_00b_61d6:
	dr $2e1d6, $2e229

Func_00b_6229:
	dr $2e229, $2e25c

Func_00b_625c:
	dr $2e25c, $2e53d

Func_00b_653d:
	dr $2e53d, $2e5e7

Func_00b_65e7::
	dr $2e5e7, $2e5f6

Func_00b_65f6:
	dr $2e5f6, $2f1e0

SECTION "banknumb", ROMX[$7fff], BANK[$b]
	db $b
