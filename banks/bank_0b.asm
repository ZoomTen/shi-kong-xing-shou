MACRO bgcopy_patch
; BG tilemap patch stamped by Func_00b_606f: \1=width, \2=height, then width*height tile IDs
	db \1, \2
	shift 2
	db \#
ENDM

; TODO
unk_00b_4000:
INCBIN "data/unk_00b_4000.bin"

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
	dw unk_00b_4179

.unk_00b_416d:
	db $02, $02
	db $27, $29, $28, $2a

.unk_00b_4173:
	db $02, $02
	db $2b, $2d, $2c, $2e

unk_00b_4179:
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

MovementData_00b_418e::
	db DOWN, RIGHT, $ff

MovementData_OneDown::
	db DOWN, $ff

MovementData_OneUp::
	db UP, $ff

unk_00b_4195::
	dw unk_00b_4199, unk_00b_4179
unk_00b_4199:
	db $02, $04, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e
unk_00b_41a3:
	dw unk_00b_41a7, unk_00b_4179
unk_00b_41a7:
	db $02, $02, $6d, $6a, $6d, $68
	db $02, $02, $01, $01, $01, $01
	db $02, $04, $03, $03, $03, $03, $03, $03, $03, $03
	db $02, $04, $02, $02, $02, $02, $03, $03, $03, $03
unk_00b_41c7:
	dw unk_00b_41cb, unk_00b_4179
unk_00b_41cb:
	db $02, $04, $0c, $0e, $0d, $0f, $10, $12, $11, $13
MovementData_00b_41d5::
	db $04, $00, $fc, $00, $fc, $00, $04, $00, $04, $00, $fc, $00, $fc, $00, $04, $00, $04, $00, $fc, $00, $fc, $00, $04, $00, $04, $00, $fc, $00, $fc, $00, $04, $00, $04, $00, $fc, $00, $fc, $00, $04, $00, $88
MovementData_00b_41fe:
	db $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $01, $00, $ff, $00, $88
MovementData_00b_4227:
	db $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $02, $00, $fe, $00, $88

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
	ld a, script_delaywait
	ld [wScriptByte], a
	ret

Script_03:
; Delay?
	ld hl, wcbfc
	ldh a, [hFadeFrameCounter]
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
	ld a, TEXTSRC_SCRIPT
	ldh [hTextSource], a
	call AdjustTextboxYPosition
	xor a
	ld [wScriptByte], a
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	ld hl, 3
	add hl, bc
	ld a, [wPlayerFacing]
	srl a
	ld a, 0
	rla
	ld e, a
	ld a, 1
	sub e
	ld e, a
	ld a, [wPlayerFacing]
	and $0e
	add e
	ld [hl], a
	call Func_06f8
	ret

AdjustTextboxYPosition:
	ld a, TEXTBOX_TOP
	ld [wTextboxPos], a
; Check y coord
	ld a, [wPlayerScreenY]
	cp $60
	ret nc

	xor a ; TEXTBOX_BOTTOM
	ld [wTextboxPos], a
	ret

Script_face:
; Makes the player face a certain direction.
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wPlayerFacing], a
	ld a, 0
	ld [wPlayerAnimFrame], a
	ld a, 1
	ld [hFFAC], a
	ld [wdcd0], a
	ld a, 6
	ld [hFFAD], a
	xor a
	ld [wScriptByte], a
	call UpdatePlayerAnim_Banked
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
	ld a, script_spritewalkstep
	ld [wScriptByte], a
	ret

Script_07:
	call Func_0639
	call Func_00b_445e
	call UpdatePlayerAnim_Banked
	ret

Func_00b_445e:
	ld a, [wd1e2]
	and a
	ret z

	ld hl, wPlayerScreenY
	ld a, [wcd08]
	cp [hl]
	jr z, .asm_4472
	jr c, .asm_4471

	inc [hl]
	jr .asm_4472

.asm_4471
	dec [hl]

.asm_4472
	ld hl, wPlayerScreenX
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
	ld a, script_movemapstep
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
	ld a, script_movestep
	ld [wScriptByte], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret

Script_10:
	call Func_00b_60dd
	call Func_00b_61d6
	call UpdatePlayerAnim_Banked
	ret

Script_11:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
; move to next script
	ld a, script_move2step
	ld [wScriptByte], a
	ret

Script_12:
	call Func_00b_60b2
	call UpdatePlayerAnim_Banked
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
	ld a, TEXTSRC_SCRIPT
	ldh [hTextSource], a
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
	ld a, [wPlayerFacing]
	sub $0e
	jr .asm_4636
	ret ; ?

; TODO: indexed data table, classify type
unk_00b_465b:
; direction-indexed {dy, dx, value, 0} offset entries
	db $00, $00, $00, $00
	db $f0, $00, $1d, $00
	db $00, $f8, $1f, $00
	db $00, $10, $20, $00

; TODO: indexed data table, classify type
unk_00b_466b:
; direction-indexed {dy, dx, value, 0} offset entries
	db $f8, $08, $05, $00
	db $f0, $08, $07, $00
	db $f8, $08, $09, $00
	db $f8, $08, $0b, $00
	db $f2, $0a, $0d, $00
	db $c0, $00, $19, $00

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
	ld hl, LoadObjectSprite
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
	ld [wSavedScriptPos], a
	ld a, [wScriptPos + 1]
	ld [wSavedScriptPos + 1], a
	ld a, [wMovementPointer]
	ld [wScriptPos], a
	ld a, [wMovementPointer + 1]
	ld [wScriptPos + 1], a
	ldh a, [hScriptBank]
	ld [wdcad], a
	ld a, $b
	ldh [hScriptBank], a
; move to next script
	ld a, script_objscriptstep
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
	ld a, script_objscriptstep
	ld [wScriptByte], a
	ret

asm_00b_473a:
	ld a, [wSavedScriptPos]
	ld [wScriptPos], a
	ld a, [wSavedScriptPos + 1]
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
	ld [wPlayerMap2X], a
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
	ld [wPlayerMap2Y], a
	ld hl, $12
	add hl, bc
	ld a, [wPlayerMap2Y]
	ld [hli], a
	ld a, [wPlayerMap2X]
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
	ldh [hMapPredef], a
	xor a
	ld [wScriptByte], a
	ret

Script_20:
	ld de, Jumptable_00b_482d
	ld a, [wd080]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Jumptable_00b_482d:
	dw asm_00b_4841
	dw asm_00b_48b6
	dw asm_00b_48e0
	dw asm_00b_4907
	dw asm_00b_492e
	dw asm_00b_4955

; TODO: indexed data table, classify type
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
	ld a, [wPlayerScreenX]
	add l
	ld hl, 1
	add hl, bc
	ld [hld], a
	inc de
	ld a, [de]
	ld l, a
	ld a, [wPlayerScreenY]
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
	ld hl, wPlayerScreenY
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
	ld hl, LoadSelectedObjectSprite
	ld a, [hScriptBank]
	ld b, a
	rst FarCall
	xor a
	ld [wScriptByte], a
	ret

Script_24:
	ld a, [wPlayerFacing]
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
	ld [hl], LOW(MovementData_00b_4143)
	inc hl
	ld [hl], HIGH(MovementData_00b_4143)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_49fe:
	ld hl, wMovementPointer
	ld [hl], LOW(MovementData_00b_414b)
	inc hl
	ld [hl], HIGH(MovementData_00b_414b)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_4a0c:
	ld hl, wMovementPointer
	ld [hl], LOW(MovementData_00b_418e)
	inc hl
	ld [hl], HIGH(MovementData_00b_418e)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_4a1a:
	xor a
	ld [wScriptByte], a
	ret

Func_00b_4a1f:
	ld a, [wPlayerScreenY]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAB]
	add e
	ld [wPlayerMapY], a
	ld a, [wPlayerScreenX]
	sub 8
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAA]
	add e
	ld [wPlayerMapX], a
	ret

Script_25:
	call Func_00b_61a2
	call Func_00b_61d6
	call UpdatePlayerAnim_Banked
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
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeOutPalette
	ld a, $c7
	ldh [rLCDC], a
	xor a
	ld [wScriptByte], a
	ret

Script_29:
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
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
	ld a, [wPlayerFacing]
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
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette2
	call Func_00b_605c
	call Func_00b_603d
	call ClearBGMap0
	call Func_00b_604e
	call LoadMapBGPalettes
	call LoadBattlePalettes
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	ld a, 0
	ld [wPlayerScreenY], a
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
	ldh [hVRAMCopyWidth], a
	ld b, a
	ld a, [de]
	inc de
	ld [hVRAMCopyHeight], a
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
	ldh a, [hVRAMCopyWidth]
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
	ldh [hVRAMCopyWidth], a
	inc de
	ld a, [de]
	ld c, a
	ld [hVRAMCopyHeight], a
	inc de
	call Func_00b_65e7
	xor a
	ld [wScriptByte], a
	ret

Script_30:
	ld a, [wd083]
	ld [wdcca], a
	ld a, [wd083 + 1]
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
	ld a, [wd083 + 1]
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
	ldh [hVRAMCopyWidth], a
	inc de
	ld a, [de]
	ld c, a
	ldh [hVRAMCopyHeight], a
	inc de
	call Func_00b_65e7
	xor a
	ld [wScriptByte], a
	ret

Script_32:
	ld a, [wPlayerFacing]
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
	ld [hl], LOW(MovementData_00b_414e)
	inc hl
	ld [hl], HIGH(MovementData_00b_414e)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_4c3e:
	ld hl, wMovementPointer
	ld [hl], LOW(MovementData_00b_4151)
	inc hl
	ld [hl], HIGH(MovementData_00b_4151)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_4c4c:
	ld hl, wMovementPointer
	ld [hl], LOW(MovementData_00b_4154)
	inc hl
	ld [hl], HIGH(MovementData_00b_4154)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_4c5a:
	xor a
	ld [wScriptByte], a
	ret

Script_33:
	ld a, [wPlayerFacing]
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
	ld [hl], LOW(MovementData_00b_4158)
	inc hl
	ld [hl], HIGH(MovementData_00b_4158)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_4c82:
	ld hl, wMovementPointer
	ld [hl], LOW(MovementData_00b_414b)
	inc hl
	ld [hl], HIGH(MovementData_00b_414b)
	ld a, script_walkpathstep
	ld [wScriptByte], a
	ret

asm_00b_4c90:
	ld hl, wMovementPointer
	ld [hl], LOW(MovementData_00b_418e)
	inc hl
	ld [hl], HIGH(MovementData_00b_418e)
	ld a, script_walkpathstep
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
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd9f2], a
	ld a, BGM_TOWN1
	call PlaySound
	farcall Func_039_40a0
	xor a
	ld [wScriptByte], a
	ret

Script_36:
	ld a, BGM_TOWN1
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
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	call DelayFrame
	call DelayFrame
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	call DelayFrame
	ret

Script_38:
	farcall LoadWildMon
	xor a
	ld [wScriptByte], a
	ret

Script_39:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
	ld a, $3A
	ld [wScriptByte], a
	ret

Script_3a:
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	ld a, [hl]
	cp $88
	jr nz, .asm_4e24
	xor a
	ld [wScriptByte], a
	ret
.asm_4e24
	ldh a, [hSCY]
	add [hl]
	ldh [hSCY], a
	inc hl
	ldh a, [hSCX]
	add [hl]
	ldh [hSCX], a
	inc hl
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ret

Script_3b: ; start a battle (startbattle)
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
	ld hl, wEnemyMon
	ld a, l
	ld [wEnemyMonPtr], a
	ld a, h
	ld [wEnemyMonPtr + 1], a
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
	ld [wActiveMonPtr], a
	ld a, b
	ld [wActiveMonPtr + 1], a
	ld a, e
	ld [wActiveMonIndex], a
	call DelayFrame
	ret

Script_3c:
	call GetScriptByte
	ld a, [wScriptByte]
	ld e, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	ld a, [wMoney]
	and a
	jr nz, .asm_4ed1
	ld a, [wMoney + 1]
	cp d
	jr z, .asm_4ebe
	jr nc, .asm_4ed1
	jr .asm_4ec4
.asm_4ebe
	ld a, [wMoney + 2]
	cp e
	jr nc, .asm_4ed1
.asm_4ec4
	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret
.asm_4ed1
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret

Script_3d:
	call GetScriptByte
	ld a, [wScriptByte]
	ld e, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	ld a, [wMoney]
	and a
	jr nz, .asm_4f06
	ld a, [wMoney]
	and a
	jr nz, .asm_4f06
	ld a, [wMoney + 1]
	cp d
	jr z, .asm_4f00
	jr c, .asm_4f21
.asm_4f00
	ld a, [wMoney + 2]
	cp e
	jr c, .asm_4f21
.asm_4f06
	ld a, [wMoney + 2]
	sub e
	ld [wMoney + 2], a
	ld a, [wMoney + 1]
	sbc d
	ld [wMoney + 1], a
	ld a, [wMoney]
	sbc $00
	ld [wMoney], a
	xor a
	ld [wScriptByte], a
	ret
.asm_4f21
	xor a
	ld [wMoney + 2], a
	ld [wMoney + 1], a
	ld [wMoney], a
	ld [wScriptByte], a
	ret

Script_3e:
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

Script_3f:
	ld c, $00
	ld a, [wEventFlags + 7]
	bit 4, a
	jr z, .asm_4f52
	inc c
.asm_4f52
	ld a, [wEventFlags + 7]
	bit 5, a
	jr z, .asm_4f5a
	inc c
.asm_4f5a
	ld a, [wEventFlags + 7]
	bit 6, a
	jr z, .asm_4f62
	inc c
.asm_4f62
	ld a, [wEventFlags + 7]
	bit 7, a
	jr z, .asm_4f6a
	inc c
.asm_4f6a
	ld a, [wEventFlags + 8]
	bit 0, a
	jr z, .asm_4f72
	inc c
.asm_4f72
	ld a, [wEventFlags + 8]
	bit 1, a
	jr z, .asm_4f7a
	inc c
.asm_4f7a
	ld a, c
	cp $06
	jr c, .asm_4f8c
	ld a, [wEventFlags + 8]
	set 2, a
	ld [wEventFlags + 8], a
	xor a
	ld [wScriptByte], a
	ret
.asm_4f8c
	ld a, [wEventFlags + 8]
	res 2, a
	ld [wEventFlags + 8], a
	xor a
	ld [wScriptByte], a
	ret

Script_40:
	call GetScriptByte
	ld a, [wScriptByte]
	ld hl, wda00
	ld de, $000C
.asm_4fa5
	dec a
	jr z, .asm_4fab
	add hl, de
	jr .asm_4fa5
.asm_4fab
	ld a, [hl]
	ld [wdce5], a
	xor a
	ld [wScriptByte], a
	ret

Script_41:
	ld bc, wVisibleObjects + OBJECT_LENGTH
.asm_4fb7
	ld hl, OBJECT_ACTIVE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4fd4
	ld hl, $000D
	add hl, bc
	ld [hl], $01
	ld hl, $0005
	add hl, bc
	ld [hl], $00
	xor a
	ld [wScriptByte], a
	push bc
	call Func_06f8
	pop bc
.asm_4fd4
	ld hl, Bankswitch
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $E0
	jr c, .asm_4fb7
	xor a
	ld [wScriptByte], a
	call DelayFrame
	ret

Script_42:
	call GetScriptByte
	ld a, [wScriptByte]
	ld hl, wda00
	ld de, $000C
.asm_4ff3
	dec a
	jr z, .asm_4ff9
	add hl, de
	jr .asm_4ff3
.asm_4ff9
	ld a, [hl]
	swap a
	sla a
	ld c, a
	ld b, HIGH(wcd00)
	ld a, [bc]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ld a, [hFFAB]
	add e
	inc hl
	inc hl
	inc hl
	ld [hld], a
	inc bc
	ld a, [bc]
	sub $08
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ld a, [hFFAA]
	add e
	ld [hli], a
	xor a
	ld [wScriptByte], a
	ret

Script_43:
	call DelayFrame
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette2
	call Func_00b_605c
	call DelayFrame
	call Func_00b_603d
	call ClearBGMap0
	call DelayFrame
	call Func_00b_604e
	ld hl, Palette_00b_508d
	call CopyBackgroundPalettes
	ld a, $00
	ld [wVisibleObjects], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_505c:
	di
	ld a, $01
	ldh [rVBK], a
	ld hl, $9800
	ld bc, $0400
.asm_5067
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_5067
	ld a, $01
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_5067
	xor a
	ldh [rVBK], a
	ld hl, $9800
	ld bc, $0400
.asm_507e
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_507e
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_507e
	ei
	ret

Palette_00b_508d:
	RGB 31, 31, 31
	RGB 30, 25, 0
	RGB 29, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 18, 18
	RGB 15, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
Script_44:
	xor a
	ld [wPlayerMapX], a
	ld [wPlayerMapY], a
	ld [wScriptByte], a
	ret

Script_45:
	call DelayFrame
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd0f1], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld c, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
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
	ld a, [wScriptByte]
	ld h, a
	pop af
	ld l, a
	call Func_134c
	xor a
	ld [wScriptByte], a
	ret

Script_46:
	call GetScriptByte
	ld a, [wScriptByte]
	ld e, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	ld a, [wMoney + 2]
	add e
	ld [wMoney + 2], a
	ld a, [wMoney + 1]
	adc d
	ld [wMoney + 1], a
	ld a, [wMoney]
	adc $00
	ld [wMoney], a
	xor a
	ld [wScriptByte], a
	ret

Script_47:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wTargetMode], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hMapNumber], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hWarpNumber], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hFFD5], a
	ld a, $01
	ldh [hFade], a
	xor a
	ld [wScriptByte], a
	ret

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

; list pointers indexed by wd1f4; each -> a wram (id,count) list searched by Script_4d/Script_59
unk_00b_5192:
	dw wd300, wddb0, wd284

Script_49:
	ld a, [wcd20]
	sub $10
	ld [wd0f9], a
	ld a, [wcd21]
	sub $08
	ld [wd3f9], a
	ld a, [wcd23]
	cp $00
	jr z, .asm_51d5
	cp $01
	jr z, .asm_51cb
	cp $02
	jr z, .asm_51c1
	ld a, [wd3f9]
	add $10
	ld [wd3f9], a
	jr .asm_51dd
.asm_51c1
	ld a, [wd3f9]
	sub $10
	ld [wd3f9], a
	jr .asm_51dd
.asm_51cb
	ld a, [wd0f9]
	sub $10
	ld [wd0f9], a
	jr .asm_51dd
.asm_51d5
	ld a, [wd0f9]
	add $10
	ld [wd0f9], a
.asm_51dd
	ld a, [wd0f9]
	srl a
	srl a
	srl a
	ld l, a
	ld a, [wd3f9]
	srl a
	srl a
	srl a
	ld h, a
	call .asm_5201
	ld a, l
	ld [wd083], a
	ld a, h
	ld [wd083 + 1], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5201
	ld a, [wd0ba]
	ld c, a
	ld a, [wd0bb]
	ld b, a
	ld e, h
	ld a, l
	add a
	add a
	add a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	ld d, $00
	add hl, bc
	bit 5, l
	jr z, .asm_5225
	add hl, de
	bit 5, l
	jr nz, .asm_522e
	ld a, l
	sub $20
	ld l, a
	jr .asm_522e
.asm_5225
	add hl, de
	bit 5, l
	jr z, .asm_522e
	ld a, l
	sub $20
	ld l, a
.asm_522e
	ld a, h
	and $03
	or $98
	ld h, a
	ret

Script_4a:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcac], a
	ld a, $01
	ld [wd0ef], a
	call Func_00b_5273
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $50
	inc hl
	ld a, [wdcac]
	and $0F
	add $0F
	ld [hli], a
	ld [hl], $07
	ld hl, wd1a8
	ld [hl], $10
	inc hl
	ld [hl], $48
	inc hl
	ld a, [wScriptByte]
	swap a
	and $0F
	add $0F
	ld [hli], a
	ld [hl], $05
	xor a
	ld [wScriptByte], a
	ret

Func_00b_5273::
	ld hl, GFX_00b_698e
	ld de, $8540
	ld bc, $0140
	call CopyBytesVRAM
	ld hl, Palette_00b_6ace
	ld b, $08
	ld c, $88
	call LoadPalettes_OCPD
	ld hl, wcaf0
	ld bc, $0008
	add hl, bc
	push hl
	pop de
	ld hl, Palette_00b_6ace
	call CopyBytes3
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $50
	inc hl
	ld a, [wdcac]
	and $0f
	add $0f
	ld [hli], a
	ld [hl], $07
	ld hl, wd1a8
	ld [hl], $10
	inc hl
	ld [hl], $48
	inc hl
	ld a, [wdcac]
	swap a
	and $0f
	add $0f
	ld [hli], a
	ld [hl], $07
	ret

Script_4b:
	xor a
	ld [wd0ef], a
	ld [wdcac], a
	ld hl, wd1a0
	call .asm_52d9
	ld hl, wd1a8
	call .asm_52d9
	xor a
	ld [wScriptByte], a
	ret
.asm_52d9
	ld c, $08
	xor a
.asm_52dc
	ld [hli], a
	dec c
	jr nz, .asm_52dc
	ret

Script_4c:
	ld a, GAMEMODE_GAME_OVER
	ld [wTargetMode], a
	ld a, $01
	ld [hFade], a
	xor a
	ld [wScriptByte], a
	ret

Script_4d:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd1f4], a
	ld de, unk_00b_5192
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1fe], a
	ld e, a
	ld a, [hli]
	ld [wd1ff], a
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
	ld l, e
	ld h, d
.asm_5314
	ld a, [hl]
	and a
	jr z, .asm_532d
	cp b
	jr z, .asm_531f
	inc hl
	inc hl
	jr .asm_5314
.asm_531f
	inc hl
	dec [hl]
	ld a, [hld]
	and a
	jr nz, .asm_532d
	ld [hl], $00
	farcall Func_024_605d
.asm_532d
	xor a
	ld [wScriptByte], a
	ret

Script_4e:
	call GetSpriteIDByte
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
	ld a, [wScriptPos]
	ld [wSavedScriptPos], a
	ld a, [wScriptPos + 1]
	ld [wSavedScriptPos + 1], a
	ld a, [wMovementPointer]
	ld [wScriptPos], a
	ld a, [wMovementPointer + 1]
	ld [wScriptPos + 1], a
	ldh a, [hScriptBank]
	ld [wdcad], a
	ld a, script_objscriptstep
	ld [wScriptByte], a
	ret

Script_4f:
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_538f
	ld e, $00
	ld hl, wPartyMons
.asm_5381
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [hl]
	cp d
	jr z, .asm_539c
	inc e
	add hl, bc
	ld a, l
	cp $80
	jr c, .asm_5381
.asm_538f
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret
.asm_539c
	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	ld a, e
	ld [wSelectedOption], a
	xor a
	ld [wScriptByte], a
	ret

Script_50:
	call GetPartyMonPtr
	push hl
	ld hl, MON_ITEM
	add hl, bc
	ld a, [hli]
	and a
	call nz, .asm_53cf
	ld a, [hl]
	and a
	call nz, .asm_53cf
	pop hl
	ld e, PARTYMON_STRUCT_LENGTH
	xor a
.asm_53c3
	ld [hli], a
	dec e
	jr nz, .asm_53c3
	call .asm_53e5
	xor a
	ld [wScriptByte], a
	ret
.asm_53cf
	push hl
	ld [wd9f3], a
	ld a, $01
	ld [wd1f4], a
	ld a, $01
	ld [wd9d3], a
	farcall asm_039_479f
	pop hl
	ret
.asm_53e5
	ld bc, wPartyMons
.asm_53e8
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5409
	push bc
	ld hl, $0016
	add hl, bc
	ld e, PARTYMON_STRUCT_LENGTH
.asm_53f7
	ld a, [hli]
	ld [bc], a
	inc bc
	dec e
	jr nz, .asm_53f7
	pop bc
	ld hl, $0016
	add hl, bc
	ld e, PARTYMON_STRUCT_LENGTH
	xor a
.asm_5405
	ld [hli], a
	dec e
	jr nz, .asm_5405
.asm_5409
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $60
	jr c, .asm_53e8
	ret

Script_51:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd1f4], a
	ld de, unk_00b_5192
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1fe], a
	ld e, a
	ld a, [hli]
	ld [wd1ff], a
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
	ld l, e
	ld h, d
.asm_5439
	ld a, [hl]
	cp b
	jr z, .asm_5444
	and a
	jr z, .asm_5451
	inc hl
	inc hl
	jr .asm_5439
.asm_5444
	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5451
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret

Script_52:
	ld a, [wd0da]
	inc a
	ld [wd0da], a
	xor a
	ld [wScriptByte], a
	ret

Script_53:
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hMapNumber], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hWarpNumber], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hMapGroup], a
	ld a, $01
	ld [hFade], a
	xor a
	ld [wScriptByte], a
	ret

Script_54:
	call GetSpriteIDByte
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wMovementPointer + 1], a
	ld a, [wScriptPos]
	ld [wSavedScriptPos], a
	ld a, [wScriptPos + 1]
	ld [wSavedScriptPos + 1], a
	ld a, [wMovementPointer]
	ld [wScriptPos], a
	ld a, [wMovementPointer + 1]
	ld [wScriptPos + 1], a
	ldh a, [hScriptBank]
	ld [wdcad], a
	ld a, BANK(Script_55)
	ldh [hScriptBank], a
	ld a, $55
	ld [wScriptByte], a
	ret

Script_55:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wcd00)
	ld hl, $0000
	add hl, bc
	pop af
	cp $88
	jr z, .asm_54f0
	add [hl]
	ld [hli], a
	ld a, [wScriptByte]
	ld b, a
	ld a, [hl]
	sub b
	ld [hl], a
	ld a, $55
	ld [wScriptByte], a
	ret
.asm_54f0
	ld a, [wSavedScriptPos]
	ld [wScriptPos], a
	ld a, [wSavedScriptPos + 1]
	ld [wScriptPos + 1], a
	ld a, [wdcad]
	ldh [hScriptBank], a
	xor a
	ld [wScriptByte], a
	ret

Script_56:
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
	ld a, [wPlayerSpriteID]
	cp b
	jr z, .asm_5520
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5520
	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret

Script_57:
	ld a, $01
	ld [wd0f0], a
	xor a
	ld [wScriptByte], a
	ret

Script_58:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wPlayerSpriteID], a
	and a
	jr z, .asm_554a
	ld a, $43
	ld [wd0e4], a
	jr .asm_554e
.asm_554a
	xor a
	ld [wd0e4], a
.asm_554e
	xor a
	ld [wPlayerAnimFrame], a
	ld a, $01
	ld [hFFAC], a
	ld [wdcd0], a
	xor a
	ld [wScriptByte], a
	call UpdatePlayerAnim_Banked
	ret

Script_59:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd1f4], a
	ld de, unk_00b_5192
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1fe], a
	ld e, a
	ld a, [hli]
	ld [wd1ff], a
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld c, a
	ld l, e
	ld h, d
.asm_558d
	ld a, [hl]
	cp b
	jr z, .asm_5598
	and a
	jr z, .asm_55aa
	inc hl
	inc hl
	jr .asm_558d
.asm_5598
	inc hl
	ld a, [hl]
	cp c
	jr c, .asm_55aa
	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret
.asm_55aa
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret

Script_5a:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd1f4], a
	ld de, unk_00b_5192
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1fe], a
	ld e, a
	ld a, [hli]
	ld [wd1ff], a
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld c, a
	ld l, e
	ld h, d
.asm_55e2
	ld a, [hl]
	cp b
	jr z, .asm_55ea
	inc hl
	inc hl
	jr .asm_55e2
.asm_55ea
	inc hl
	ld a, [hl]
	sub c
	ld [hld], a
	and a
	jr nz, .asm_55f9
	ld [hl], $00
	farcall Func_024_605d
.asm_55f9
	xor a
	ld [wScriptByte], a
	ret

Script_5b:
	ld a, [wPlayerFacing]
	cp $03
	jr z, .asm_5617
	ld a, [wScriptPos]
	add $02
	ld [wScriptPos], a
	ld a, [wScriptPos + 1]
	adc $00
	ld [wScriptPos + 1], a
	jr .asm_562b
.asm_5617
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
.asm_562b
	xor a
	ld [wScriptByte], a
	ret

Script_5c:
	call Func_00b_4dc5
	call Func_00b_4dc5
	ld bc, wPartyMons
.asm_5639
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_565a
	ld hl, MON_HP + 1
	add hl, bc
	ld a, [hld]
	and a
	jr nz, .asm_564e
	ld a, [hl]
	cp $02
	jr c, .asm_565a
.asm_564e
	ld hl, MON_HP
	add hl, bc
	ld a, $01
	ld [hli], a
	ld a, $00
	ld [hli], a
	jr .asm_5665
.asm_565a
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, .asm_5639
.asm_5665
	xor a
	ld [wScriptByte], a
	ret

Script_5d:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wPartyScanType], a
	farcall ScanParty
	ld a, [wPartyScanType]
	cp $FF
	jr z, .asm_568d
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret
.asm_568d
	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	xor a
	ld [wScriptByte], a
	ret

Script_5e:
; Follower
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcea], a
	xor a
	ld [wScriptByte], a
	ret

Script_5f:
	ld a, [wPlayerScreenX]
	ld e, a
	ld a, [wcd21]
	sub e
	jp z, .asm_5739
	cp $10
	jr z, .asm_56d3
	cp $20
	jr z, .asm_56d3
	ld a, [wcd20]
	ld d, a
	ld a, [wVisibleObjects]
	sub d
	jp z, .asm_56eb
	cp $10
	jp z, .asm_5705
	cp $20
	jp z, .asm_571f
	jp .asm_5837
.asm_56d3
	ld a, [wcd20]
	ld d, a
	ld a, [wVisibleObjects]
	sub d
	jp z, .asm_5794
	cp $10
	jp z, .asm_577a
	cp $20
	jp z, .asm_5760
	jp .asm_5837
.asm_56eb
	ld a, [wcd23]
	cp $00
	jp z, .asm_57ae
	cp $01
	jp z, .asm_57b2
	cp $02
	jp z, .asm_57b6
	cp $03
	jp z, .asm_57ba
	jp .asm_5837
.asm_5705
	ld a, [wcd23]
	cp $00
	jp z, .asm_57be
	cp $01
	jp z, .asm_57c2
	cp $02
	jp z, .asm_57c6
	cp $03
	jp z, .asm_57ca
	jp .asm_5837
.asm_571f
	ld a, [wcd23]
	cp $00
	jp z, .asm_57ce
	cp $01
	jp z, .asm_57d2
	cp $02
	jp z, .asm_57d6
	cp $03
	jp z, .asm_57da
	jp .asm_5837
.asm_5739
	ld a, [wVisibleObjects]
	ld d, a
	ld a, [wcd20]
	sub d
	cp $10
	jp z, .asm_5837
	ld a, [wcd23]
	cp $00
	jp z, .asm_57de
	cp $01
	jp z, .asm_57e2
	cp $02
	jp z, .asm_57e6
	cp $03
	jp z, .asm_57ea
	jp .asm_5837
.asm_5760
	ld a, [wcd23]
	cp $00
	jp z, .asm_57ee
	cp $01
	jp z, .asm_57f2
	cp $02
	jp z, .asm_57f6
	cp $03
	jp z, .asm_57fa
	jp .asm_5837
.asm_577a
	ld a, [wcd23]
	cp $00
	jp z, .asm_57fe
	cp $01
	jp z, .asm_5802
	cp $02
	jp z, .asm_5806
	cp $03
	jp z, .asm_580a
	jp .asm_5837
.asm_5794
	ld a, [wcd23]
	cp $00
	jp z, .asm_580e
	cp $01
	jp z, .asm_5812
	cp $02
	jp z, .asm_5816
	cp $03
	jp z, .asm_581a
	jp .asm_5837
.asm_57ae
	ld a, $00
	jr .asm_581c
.asm_57b2
	ld a, $01
	jr .asm_581c
.asm_57b6
	ld a, $02
	jr .asm_581c
.asm_57ba
	ld a, $03
	jr .asm_581c
.asm_57be
	ld a, $04
	jr .asm_581c
.asm_57c2
	ld a, $05
	jr .asm_581c
.asm_57c6
	ld a, $06
	jr .asm_581c
.asm_57ca
	ld a, $07
	jr .asm_581c
.asm_57ce
	ld a, $08
	jr .asm_581c
.asm_57d2
	ld a, $09
	jr .asm_581c
.asm_57d6
	ld a, $0A
	jr .asm_581c
.asm_57da
	ld a, $0B
	jr .asm_581c
.asm_57de
	ld a, $0C
	jr .asm_581c
.asm_57e2
	ld a, $0D
	jr .asm_581c
.asm_57e6
	ld a, $0E
	jr .asm_581c
.asm_57ea
	ld a, $0F
	jr .asm_581c
.asm_57ee
	ld a, $10
	jr .asm_581c
.asm_57f2
	ld a, $11
	jr .asm_581c
.asm_57f6
	ld a, $12
	jr .asm_581c
.asm_57fa
	ld a, $13
	jr .asm_581c
.asm_57fe
	ld a, $14
	jr .asm_581c
.asm_5802
	ld a, $15
	jr .asm_581c
.asm_5806
	ld a, $16
	jr .asm_581c
.asm_580a
	ld a, $17
	jr .asm_581c
.asm_580e
	ld a, $18
	jr .asm_581c
.asm_5812
	ld a, $19
	jr .asm_581c
.asm_5816
	ld a, $1A
	jr .asm_581c
.asm_581a
	ld a, $1B
.asm_581c
	ld de, .Pointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ld a, $60
	ld [wScriptByte], a
	xor a
	ldh [hFFDD], a
	ret
.asm_5837
	xor a
	ld [wScriptByte], a
	ret

.Pointers
	dw .move_5874
	dw .move_5874
	dw .move_5874
	dw .move_5874
	dw .move_5877
	dw .move_5877
	dw .move_5877
	dw .move_5877
	dw .move_587c
	dw .move_587c
	dw .move_587c
	dw .move_587c
	dw .move_5881
	dw .move_5881
	dw .move_5881
	dw .move_5881
	dw .move_5888
	dw .move_5888
	dw .move_5888
	dw .move_5888
	dw .move_588d
	dw .move_588d
	dw .move_588d
	dw .move_588d
	dw .move_5892
	dw .move_5892
	dw .move_5892
	dw .move_5892
.move_5874
	db $00, $03, $ff
.move_5877
	db $00, $00, $03, $03, $ff
.move_587c
	db $00, $00, $00, $03, $ff
.move_5881
	db $02, $00, $00, $00, $00, $03, $ff
.move_5888
	db $00, $00, $00, $02, $ff
.move_588d
	db $00, $00, $02, $02, $ff
.move_5892
	db $00, $02, $ff

Script_60:
	call Func_00b_6134
	call Func_00b_6168
	call UpdatePlayerAnim_Banked
	call Func_00b_610b
	ret

Script_61:
	farcall LoadScriptedPartyMon
	xor a
	ld [wScriptByte], a
	ret

Script_62:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcf3], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcf4], a
	call Func_04f2
	xor a
	ld [wScriptByte], a
	ld [wdcf3], a
	ld [wdcf4], a
	ret

Script_63:
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	ld a, [wPlayerChar]
	sub d
	jr z, .asm_58f1
	ld hl, wScriptPos
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $0002
	add hl, de
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a
	xor a
	ld [wScriptByte], a
	ret
.asm_58f1
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

Script_64:
	call .asm_5917
	ld a, $01
	ld [wdcbb], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5917
	ld de, wPartyMons
	ld hl, wde00
	ld bc, PARTYMON_STRUCT_LENGTH
.asm_5920
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .asm_5920
	ret

Script_65:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wPlayerChar], a
	call Func_00b_64b2
	xor a
	ld [wScriptByte], a
	ret

Script_66:
	call GetScriptByte
	ld a, [wScriptByte]
	ld e, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [hScriptBank], a
	ld a, d
	ld [wScriptPos + 1], a
	ld a, e
	ld [wScriptPos], a
	xor a
	ld [wScriptByte], a
	ret

Script_67:
	push hl
	push bc
	push de
	ld a, [wPlayerScreenX]
	ld l, a
	ld a, [wVisibleObjects]
	ld h, a
	ld a, [wcd21]
	ld c, a
	ld a, [wcd20]
	ld b, a
	ld a, l
	ld [wcd21], a
	ld a, h
	ld [wcd20], a
	ld a, c
	ld [wPlayerScreenX], a
	ld a, b
	ld [wVisibleObjects], a
	ld a, [wPlayerFacing]
	ld d, a
	ld a, [wcd23]
	ld e, a
	ld a, e
	ld [wPlayerFacing], a
	ld a, d
	ld [wcd23], a
	pop de
	pop bc
	pop hl
	xor a
	ld [wScriptByte], a
	ret

Script_68:
	ld bc, wPartyMons
	ld hl, MON_MOVE1ID
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	cp $89
	jr z, Func_00b_5a04
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
	ld hl, MON_MOVE2ID
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
	ld hl, MON_MOVE3ID
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
	ld hl, MON_MOVE4ID
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
	jr Func_00b_5a04

Func_00b_59da:
	ld bc, wPartyMons
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $01
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $02
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $03
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $04
	inc hl
	ld [hl], $0C
	inc hl
	ld [hl], $0C
Func_00b_5a04:
	xor a
	ld [wScriptByte], a
	ret

Script_69:
	xor a
	ldh [hFFD6], a
	ldh [hSimulatedJoypadState], a
	ld [wd0f0], a
	call Func_080a
	call Func_19b6
	ret

Script_6a:
	ld a, [wEventFlags + 9]
	res 5, a
	ld [wEventFlags + 9], a
	ld a, [wEventFlags + 9]
	res 6, a
	ld [wEventFlags + 9], a
	ld a, [wEventFlags + 9]
	res 7, a
	ld [wEventFlags + 9], a
	ld a, [wEventFlags + $A]
	res 0, a
	ld [wEventFlags + $A], a
	ld a, [wEventFlags + $A]
	res 1, a
	ld [wEventFlags + $A], a
	ld a, [wdcfd]
	inc a
	and $0F
	ld [wdcfd], a
	ld de, .WarpFlagTable
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld [wdcfe], a
	call .asm_5aa4
	xor a
	ld [wScriptByte], a
	ret

.WarpFlagTable:
	dw wEventFlags + 9
	db $05, $01
	dw wEventFlags + 9
	db $06, $02
	dw wEventFlags + $A
	db $01, $05
	dw wEventFlags + $A
	db $00, $04
	dw wEventFlags + 9
	db $07, $03
	dw wEventFlags + 9
	db $05, $01
	dw wEventFlags + $A
	db $00, $04
	dw wEventFlags + $A
	db $01, $05
	dw wEventFlags + 9
	db $06, $02
	dw wEventFlags + 9
	db $05, $01
	dw wEventFlags + $A
	db $00, $04
	dw wEventFlags + 9
	db $07, $03
	dw wEventFlags + $A
	db $01, $05
	dw wEventFlags + 9
	db $05, $01
	dw wEventFlags + $A
	db $00, $04
	dw wEventFlags + 9
	db $06, $02
.asm_5aa4
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .asm_5aaf
.asm_5aaa
	rrc l
	dec a
	jr nz, .asm_5aaa
.asm_5aaf
	set 0, l
	ld a, b
	and a
	jr z, .asm_5aba
.asm_5ab5
	rlc l
	dec a
	jr nz, .asm_5ab5
.asm_5aba
	ld a, l
	ld [de], a
	ret

Script_6b:
	ld a, MAP_POWER_PLANT_3F
	ldh [hMapNumber], a
	ld a, [wdcfe]
	ldh [hWarpNumber], a
	xor a
	ld [wdcea], a
	ld a, $09
	ld [wd0e4], a
	ld a, $04
	ld [wPlayerChar], a
	call Func_00b_64b2
	ld a, $01
	ld [hFade], a
	xor a
	ld [wScriptByte], a
	ret

Script_6c:
	ld a, $02
	ld [wdcea], a
	xor a
	ld [wd0e4], a
	ld a, $04
	ld [wPlayerChar], a
	call Func_00b_64b2
	xor a
	ld [wScriptByte], a
	ret

Script_6d:
	call GetScriptByte
	ld a, [wScriptByte]
	ld b, a
	ld c, $00
	ld a, [wEventFlags + $10]
	bit 0, a
	jr z, .asm_5b08
	inc c
.asm_5b08
	ld a, [wEventFlags + $10]
	bit 1, a
	jr z, .asm_5b10
	inc c
.asm_5b10
	ld a, [wEventFlags + $10]
	bit 2, a
	jr z, .asm_5b18
	inc c
.asm_5b18
	ld a, [wEventFlags + $10]
	bit 3, a
	jr z, .asm_5b20
	inc c
.asm_5b20
	ld a, [wEventFlags + $10]
	bit 4, a
	jr z, .asm_5b28
	inc c
.asm_5b28
	ld a, [wEventFlags + $10]
	bit 5, a
	jr z, .asm_5b30
	inc c
.asm_5b30
	ld a, [wEventFlags + $10]
	bit 6, a
	jr z, .asm_5b38
	inc c
.asm_5b38
	ld a, [wEventFlags + $10]
	bit 7, a
	jr z, .asm_5b40
	inc c
.asm_5b40
	ld a, c
	sub b
	cp $09
	jr c, .asm_5b5d
	ld hl, wScriptPos
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $0002
	add hl, de
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5b5d
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

Script_6e:
	ld c, $00
	ld a, [wEventFlags + $10]
	bit 0, a
	jr z, .asm_5b80
	inc c
.asm_5b80
	ld a, [wEventFlags + $10]
	bit 1, a
	jr z, .asm_5b88
	inc c
.asm_5b88
	ld a, [wEventFlags + $10]
	bit 2, a
	jr z, .asm_5b90
	inc c
.asm_5b90
	ld a, [wEventFlags + $10]
	bit 3, a
	jr z, .asm_5b98
	inc c
.asm_5b98
	ld a, [wEventFlags + $10]
	bit 4, a
	jr z, .asm_5ba0
	inc c
.asm_5ba0
	ld a, [wEventFlags + $10]
	bit 5, a
	jr z, .asm_5ba8
	inc c
.asm_5ba8
	ld a, [wEventFlags + $10]
	bit 6, a
	jr z, .asm_5bb0
	inc c
.asm_5bb0
	ld a, [wEventFlags + $10]
	bit 7, a
	jr z, .asm_5bb8
	inc c
.asm_5bb8
	ld a, c
	and a
	jp z, .asm_5be6
	cp $01
	jp z, .asm_5bff
	cp $02
	jp z, .asm_5c1e
	cp $03
	jp z, .asm_5c43
	cp $04
	jp z, .asm_5c6e
	cp $05
	jp z, .asm_5c9f
	cp $06
	jp z, .asm_5cd6
	cp $07
	jp z, .asm_5d1b
	cp $08
	jp z, .asm_5d66
	ret
.asm_5be6
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
.asm_5bff
	call GetScriptByte
	call GetScriptByte
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
.asm_5c1e
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
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
.asm_5c43
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
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
.asm_5c6e
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
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
.asm_5c9f
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
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
.asm_5cd6
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
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
	ld a, [wEventFlags + $F]
	res 7, a
	ld [wEventFlags + $F], a
	ret
.asm_5d1b
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
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
	ld a, [wEventFlags + $F]
	res 7, a
	ld [wEventFlags + $F], a
	ret
.asm_5d66
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
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
	ld a, [wEventFlags + $F]
	set 7, a
	ld [wEventFlags + $F], a
	ret

Script_6f: ; if wdce8: script goto; else show TEXTSRC_SCRIPT_MSG (Text_01e_6ddb)
	ld a, [wdce8]
	and a
	jr z, .asm_5dd6
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
.asm_5dd6
	xor a
	ld [wScriptByte], a
	ld [hFFD6], a
	ld a, [wSavedScriptBank]
	ld [hScriptBank], a
	ld a, TEXTSRC_SCRIPT_MSG
	ldh [hTextSource], a
	ld a, BANK(Text_01e_6ddb)
	ldh [hTextSourceBank4], a
	ld hl, Text_01e_6ddb
	ld a, l
	ld [wTextStart], a
	ld a, h
	ld [wTextStart + 1], a
	call AdjustTextboxYPosition
	ret

	ld a, [wPlayerFacing]
	and a
	jr z, .asm_5e0e
	cp $01
	jr z, .asm_5e24
	cp $02
	jr z, .asm_5e40
	cp $03
	jr z, .asm_5e62
	jr .asm_5e88
.asm_5e0e
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
	jr .asm_5e88
.asm_5e24
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
	jr .asm_5e88
.asm_5e40
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
	jr .asm_5e88
.asm_5e62
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
.asm_5e88
	xor a
	ld [wScriptByte], a
	ret

Script_70:
	ld a, [wSavedScriptBank]
	ld [hScriptBank], a
	xor a
	ld [wScriptByte], a
	ld [hFFD6], a
	ret

Script_71:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [hMapGroup], a
	xor a
	ld [wScriptByte], a
	ret

Script_72:
	ld a, [wPlayerFacing]
	and a
	jr z, .asm_5ece
	cp $01
	jr z, .asm_5ec8
	cp $02
	jr z, .asm_5ec2
	cp $03
	jr z, .asm_5ebc
	ret
.asm_5ebc
	call GetScriptByte
	call GetScriptByte
.asm_5ec2
	call GetScriptByte
	call GetScriptByte
.asm_5ec8
	call GetScriptByte
	call GetScriptByte
.asm_5ece
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

Script_73:
	ld a, [wPlayerFacing]
	and a
	jr z, .asm_5efa
	cp $01
	jr z, .asm_5f13
	cp $02
	jr z, .asm_5f2c
	cp $03
	jr z, .asm_5f45
	ret
.asm_5efa
	ld a, [wVisibleObjects]
	sub $10
	ld [wcd20], a
	ld a, [wPlayerScreenX]
	ld [wcd21], a
	ld a, [wPlayerFacing]
	ld [wcd23], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5f13
	ld a, [wVisibleObjects]
	add $10
	ld [wcd20], a
	ld a, [wPlayerScreenX]
	ld [wcd21], a
	ld a, [wPlayerFacing]
	ld [wcd23], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5f2c
	ld a, [wPlayerScreenX]
	add $10
	ld [wcd21], a
	ld a, [wVisibleObjects]
	ld [wcd20], a
	ld a, [wPlayerFacing]
	ld [wcd23], a
	xor a
	ld [wScriptByte], a
	ret
.asm_5f45
	ld a, [wPlayerScreenX]
	sub $10
	ld [wcd21], a
	ld a, [wVisibleObjects]
	ld [wcd20], a
	ld a, [wPlayerFacing]
	ld [wcd23], a
	xor a
	ld [wScriptByte], a
	ret

Script_74:
	farcall WorldMap
	xor a
	ld [wScriptByte], a
	ret

Script_75:
	xor a
	ldh [hFFD6], a
	ldh [hSimulatedJoypadState], a
	ld [wd0f0], a
	ld a, [wdcad]
	ld [hScriptBank], a
	call Func_13d5
	call .asm_5f7e
	ret
.asm_5f7e
	ld hl, wda00
.asm_5f81
	ldh a, [hFFAA]
	ld d, a
	ldh a, [hFFAB]
	ld e, a
	push hl
	ld a, [hli]
	cp $88
	jr z, .asm_5ff4
	cp $FF
	jr nz, .asm_5fec
	inc hl
	ld a, d
	cp $02
	jr c, .asm_5f99
	sub $02
.asm_5f99
	cp [hl]
	jr nc, .asm_5fec
	add $0C
	cp [hl]
	jr c, .asm_5fec
	inc hl
	ld a, e
	cp $02
	jr c, .asm_5fa9
	sub $02
.asm_5fa9
	cp [hl]
	jr nc, .asm_5fec
	add $0B
	cp [hl]
	jr c, .asm_5fec
	inc hl
	ld a, [hli]
	and a
	jr nz, .asm_5fbb
	inc hl
	inc hl
	inc hl
	jr .asm_5fd6
.asm_5fbb
	push bc
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [de]
	ld b, a
	ld a, c
	and a
	jr z, .asm_5fcc
.asm_5fc7
	srl b
	dec c
	jr nz, .asm_5fc7
.asm_5fcc
	ld a, b
	and $01
	cp [hl]
	jr z, .asm_5fd5
	pop bc
	jr .asm_5fec
.asm_5fd5
	pop bc
.asm_5fd6
	pop de
	push de
	call LoadObjectSprite
	ld a, c
	and a
	jr z, .asm_5fe9
	swap a
	and $0F
	srl a
	pop hl
	ld [hl], a
	jr .asm_5fed
.asm_5fe9
	pop hl
	jr .asm_5fed
.asm_5fec
	pop hl
.asm_5fed
	ld bc, $000C
	add hl, bc
	jp .asm_5f81
.asm_5ff4
	pop hl
	ret

Script_76:
	call GetScriptByte
	ld a, [wScriptByte]
	call PlaySound
	xor a
	ld [wScriptByte], a
	ret

Script_77:
	ld a, [wPlayerScreenX]
	ld e, a
	ld a, [wcd21]
	sub e
	jr z, .asm_6020
	cp $10
	jr z, .asm_6019
	ld a, $03
	ld [wcd23], a
	jr .asm_6038
.asm_6019
	ld a, $02
	ld [wcd23], a
	jr .asm_6038
.asm_6020
	ld a, [wVisibleObjects]
	ld d, a
	ld a, [wcd20]
	sub d
	cp $10
	jr z, .asm_6033
	ld a, $00
	ld [wcd23], a
	jr .asm_6038
.asm_6033
	ld a, $01
	ld [wcd23], a
.asm_6038
	xor a
	ld [wScriptByte], a
	ret

Func_00b_603d::
	ld hl, wVirtualOAM
	ld bc, $0028
	ld de, $0004
.loop
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

Func_00b_604e::
	ld hl, wTilemap
	ld bc, $0190
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Func_00b_605c::
	ld hl, $9000
	ld c, $10
.wait
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .wait
	ld a, $FF
	ld [hli], a
	dec c
	jr nz, .wait
	ret
	ret

Func_00b_606f:
	ld a, [wdccf]
	and a
	ret z
	ldh a, [hFadeFrameCounter]
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
	ldh [hVRAMCopyWidth], a
	inc de
	ld a, [de]
	ld c, a
	ldh [hVRAMCopyHeight], a
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
	ld a, [wPlayerScreenY]
	add [hl]
	ld [wPlayerScreenY], a
	inc hl
	ld a, [wPlayerScreenX]
	add [hl]
	ld [wPlayerScreenX], a
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
	ld a, [wFollowerObject]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAB]
	add e
	ld [wcd32], a
	ld a, [wcd21]
	sub $08
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAA]
	add e
	ld [wcd32 + 1], a
	ret

Func_00b_6134:
	ldh a, [hFFDD]
	and a
	ret nz
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_614c
	xor a
	ld [wScriptByte], a
	ldh [hFFDD], a
	ret
.asm_614c
	ld [wcd23], a
	inc a
	ld [hFFDD], a
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ld a, $10
	ld [hFFDE], a
	ld a, $01
	ldh [hFFDB], a
	ld [wdceb], a
	ret

Func_00b_6168:
	ldh a, [hFFDD]
	and a
	ret z
	ldh a, [hFFDD]
	cp $01
	jr z, .asm_617f
	cp $02
	jr z, .asm_6185
	cp $03
	jr z, .asm_618b
	cp $04
	jr z, .asm_6191
	ret
.asm_617f
	ld hl, wFollowerObject
	inc [hl]
	jr .asm_6195
.asm_6185
	ld hl, wFollowerObject
	dec [hl]
	jr .asm_6195
.asm_618b
	ld hl, wcd21
	dec [hl]
	jr .asm_6195
.asm_6191
	ld hl, wcd21
	inc [hl]
.asm_6195
	ld a, [hFFDE]
	dec a
	ld [hFFDE], a
	and a
	ret nz
	xor a
	ldh [hFFDD], a
	ret

Func_00b_61a2::
	ldh a, [hSimulatedJoypadState]
	and a
	ret nz
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_61ba
	xor a
	ld [wScriptByte], a
	ldh [hSimulatedJoypadState], a
	ret
.asm_61ba
	ld [wPlayerFacing], a
	inc a
	ld [hSimulatedJoypadState], a
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ld a, $10
	ld [hFFA6], a
	ld a, $01
	ldh [hFFAC], a
	ld [wdcd0], a
	ret

Func_00b_61d6:
	ldh a, [hSimulatedJoypadState]
	and a
	ret z
	xor a
	ld [wd3f2], a
	ld [wd3f3], a
	ldh a, [hSimulatedJoypadState]
	cp $01
	jr z, .asm_61f4
	cp $02
	jr z, .asm_61ff
	cp $03
	jr z, .asm_620a
	cp $04
	jr z, .asm_6214
	ret
.asm_61f4
	ld a, $ff
	ld [wd3f3], a
	ld hl, wPlayerObject
	inc [hl]
	jr .asm_621c
.asm_61ff
	ld a, $01
	ld [wd3f3], a
	ld hl, wPlayerObject
	dec [hl]
	jr .asm_621c
.asm_620a
	xor a
	ld [wd3f3], a
	ld hl, wPlayerScreenX
	dec [hl]
	jr .asm_621c
.asm_6214
	xor a
	ld [wd3f3], a
	ld hl, wPlayerScreenX
	inc [hl]
.asm_621c
	ld a, [hFFA6]
	dec a
	ld [hFFA6], a
	and a
	ret nz
	xor a
	ldh [hSimulatedJoypadState], a
	ret

Func_00b_6229:
	ldh a, [hSimulatedJoypadState]
	and a
	ret nz
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	ld a, [hli]
	ld d, a
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ld a, d
	cp $FF
	jr nz, .asm_624b
	xor a
	ld [wScriptByte], a
	ldh [hSimulatedJoypadState], a
	ret
.asm_624b
	ldh [hFF9E], a
	ld de, .directions
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ldh [hSimulatedJoypadState], a
	ret
.directions
	db $08, $04, $02, $01

Func_00b_625c:
	ldh a, [hFF9E]
	cp $80
	ret nc
	and a
	jp z, .asm_6275
	cp $01
	jp z, .asm_628e
	cp $02
	jp z, .asm_62a4
	cp $03
	jp z, .asm_62ba
	ret
.asm_6275
	ld hl, hFFA9
	ldh a, [hFFAB]
	cp [hl]
	jr nz, .asm_6281
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_6281
	call .asm_63f8
	call BuildBlockmap_Banked
	call Func_00b_653d.asm_65b4
	call .asm_62f9
	ret
.asm_628e
	ldh a, [hFFAB]
	and a
	jr nz, .asm_6297
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_6297
	call .asm_6429
	call BuildBlockmap_Banked
	call Func_00b_653d.asm_65b4
	call .asm_62d3
	ret
.asm_62a4
	ldh a, [hFFAA]
	and a
	jr nz, .asm_62ad
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_62ad
	call .asm_645c
	call BuildBlockmap_Banked
	call Func_00b_653d.asm_65b4
	call .asm_632a
	ret
.asm_62ba
	ld hl, hFFA8
	ldh a, [hFFAA]
	cp [hl]
	jr nz, .asm_62c6
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_62c6
	call .asm_6487
	call BuildBlockmap_Banked
	call Func_00b_653d.asm_65b4
	call .asm_6350
	ret
.asm_62d3
	ld hl, wTilemap
	ld de, wd128
	call .asm_6399
	ld c, $28
	call .asm_6380
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call .asm_63d3
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_62f9
	ld hl, wTilemap + $140
	ld de, wd128
	call .asm_6399
	ld c, $28
	call .asm_6380
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $0200
	add hl, bc
	ld a, h
	and $03
	or $98
	ld e, l
	ld d, a
	call .asm_63d3
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_632a
	ld hl, wTilemap
	ld de, wd128
	call .asm_63a2
	ld c, $24
	call .asm_6380
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call .asm_63b5
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_6350
	ld hl, wTilemap + $12
	ld de, wd128
	call .asm_63a2
	ld c, $24
	call .asm_6380
	ld a, [wd0ba]
	ld e, a
	and $E0
	ld b, a
	ld a, e
	add $12
	and $1F
	or b
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call .asm_63b5
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_6380
	ld hl, wd128
	ld de, wd100
.asm_6386
	ld a, [hli]
	push hl
	ld hl, wMapTileAttrs
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, .asm_6386
	ret
.asm_6399
	ld c, $28
.asm_639b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_639b
	ret
.asm_63a2
	ld c, $12
.asm_63a4
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $13
	add l
	ld l, a
	jr nc, .asm_63b1
	inc h
.asm_63b1
	dec c
	jr nz, .asm_63a4
	ret
.asm_63b5
	ld hl, wBGMapBufferPointers
	ld c, $12
.asm_63ba
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, .asm_63cb
	inc d
	ld a, d
	and $03
	or $98
	ld d, a
.asm_63cb
	dec c
	jr nz, .asm_63ba
	ld a, $12
	ldh [hFFA5], a
	ret
.asm_63d3
	ld hl, wBGMapBufferPointers
	push de
	call .asm_63df
	pop de
	ld a, $20
	add e
	ld e, a
.asm_63df
	ld c, $0A
.asm_63e1
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	inc a
	and $1F
	ld b, a
	ld a, e
	and $E0
	or b
	ld e, a
	dec c
	jr nz, .asm_63e1
	ld a, $14
	ldh [hFFA5], a
	ret
.asm_63f8
	ld hl, hFFAB
	inc [hl]
	ld a, [wd0ba]
	add $40
	ld [wd0ba], a
	jr nc, .asm_6411
	ld a, [wd0bb]
	inc a
	and $03
	or $98
	ld [wd0bb], a
.asm_6411
	ld hl, hFFA0
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	ret nz
	call .asm_641e
	ret
.asm_641e
	ld hl, wMapLayoutPointer
	ld a, [hMapWidth]
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_6429
	ld hl, hFFAB
	dec [hl]
	ld a, [wd0ba]
	sub $40
	ld [wd0ba], a
	jr nc, .asm_6442
	ld a, [wd0bb]
	dec a
	and $03
	or $98
	ld [wd0bb], a
.asm_6442
	ld hl, hFFA0
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	ret z
	call .asm_644f
	ret
.asm_644f
	ld hl, wMapLayoutPointer
	ld a, [hMapWidth]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
.asm_645c
	ld hl, hFFAA
	dec [hl]
	ld a, [wd0ba]
	ld e, a
	and $E0
	ld d, a
	ld a, e
	sub $02
	and $1F
	or d
	ld [wd0ba], a
	ld hl, hFF9F
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	ret z
	call .asm_647d
	ret
.asm_647d
	ld hl, wMapLayoutPointer
	ld a, [hl]
	sub $01
	ld [hli], a
	ret nc
	dec [hl]
	ret
.asm_6487
	ld hl, hFFAA
	inc [hl]
	ld a, [wd0ba]
	ld e, a
	and $E0
	ld d, a
	ld a, e
	add $02
	and $1F
	or d
	ld [wd0ba], a
	ld hl, hFF9F
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	ret nz
	call .asm_64a8
	ret
.asm_64a8
	ld hl, wMapLayoutPointer
	ld a, [hl]
	add $01
	ld [hli], a
	ret nc
	inc [hl]
	ret
Func_00b_64b2:
	ld hl, wPartyMons
.asm_64b5
	ld a, [hl]
	cp MON_081
	jr z, .asm_64e0
	cp MON_117
	jr z, .asm_64e5
	cp MON_108
	jr z, .asm_64ea
	cp MON_091
	jr z, .asm_64ef
	cp MON_099
	jr z, .asm_64f4
	cp MON_145
	jr z, .asm_64f9
	cp MON_144
	jr z, .asm_64fe
	cp MON_126
	jr z, .asm_6503
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld a, l
	cp $80
	jr c, .asm_64b5
	ret
.asm_64e0
	ld de, wde00
	jr .asm_6506
.asm_64e5
	ld de, wde16
	jr .asm_6506
.asm_64ea
	ld de, wde2c
	jr .asm_6506
.asm_64ef
	ld de, wde42
	jr .asm_6506
.asm_64f4
	ld de, wde58
	jr .asm_6506
.asm_64f9
	ld de, wde6e
	jr .asm_6506
.asm_64fe
	ld de, wde84
	jr .asm_6506
.asm_6503
	ld de, wde9a
.asm_6506
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
.asm_650a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .asm_650a
	ld de, .PartyMonBufferPointers
	ld a, [wPlayerChar]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	ld bc, PARTYMON_STRUCT_LENGTH
.asm_6524
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .asm_6524
	ret
.PartyMonBufferPointers
	dw wde00, wde16, wde2c, wde42, wde58, wde6e, wde84, wde9a

Func_00b_653d:
	ldh a, [hSimulatedJoypadState]
	and a
	ret z
	xor a
	ld [wd3f2], a
	ld [wd3f3], a
	ldh a, [hSimulatedJoypadState]
	bit 3, a
	jr nz, .asm_655b
	bit 2, a
	jr nz, .asm_656c
	bit 1, a
	jr nz, .asm_657d
	bit 0, a
	jr nz, .asm_6592
	ret
.asm_655b
	ld a, $ff
	ld [wd3f3], a
	ld hl, hSCY
	ld a, [hl]
	add $01
	ld [hli], a
	jr nc, .asm_65a7
	inc [hl]
	jr .asm_65a7
.asm_656c
	ld a, $01
	ld [wd3f3], a
	ld hl, hSCY
	ld a, [hl]
	sub $01
	ld [hli], a
	jr nc, .asm_65a7
	dec [hl]
	jr .asm_65a7
.asm_657d
	xor a
	ld [wd3f3], a
	ld a, $01
	ld [wd3f2], a
	ld hl, hSCX
	ld a, [hl]
	sub $01
	ld [hli], a
	jr nc, .asm_65a7
	dec [hl]
	jr .asm_65a7
.asm_6592
	xor a
	ld [wd3f3], a
	ld a, $ff
	ld [wd3f2], a
	ld hl, hSCX
	ld a, [hl]
	add $01
	ld [hli], a
	jr nc, .asm_65a7
	inc [hl]
	jr .asm_65a7
.asm_65a7
	ld a, [hFFA6]
	dec a
	ld [hFFA6], a
	and a
	ret nz
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_65b4
	ld hl, wc740
	ldh a, [hFFA0]
	and a
	jr z, .asm_65c0
	ld bc, $0030
	add hl, bc
.asm_65c0
	ldh a, [hFF9F]
	and a
	jr z, .asm_65c7
	inc hl
	inc hl
.asm_65c7
	call .asm_65ce
	ret
	ld hl, wc740
.asm_65ce
	ld de, wTilemap
	ld b, $12
.asm_65d3
	ld c, $14
.asm_65d5
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_65d5
	ld a, l
	add $04
	ld l, a
	ld a, h
	adc a, $00
	ld h, a
	dec b
	jr nz, .asm_65d3
	ret

Func_00b_65e7::
	ldh a, [hConsoleType]
	cp $11
	ret nz
	ld a, $01
	ldh [rVBK], a
	jr Func_00b_65f6
	ld a, $00
	ldh [rVBK], a

Func_00b_65f6:
	push hl
.asm_65f7
	ld a, [de]
	push bc
	ld c, a
.asm_65fa
	ldh a, [rSTAT]
	and $03
	jr nz, .asm_65fa
	ld a, c
	ld [hl], a
	inc l
	xor a
	adc $00
	ld c, a
	ld a, l
	and $0F
	jr nz, .asm_6614
	ld a, l
	bit 4, a
	jr nz, .asm_6614
	sub $20
	ld l, a
.asm_6614
	inc de
	pop bc
	dec b
	jr nz, .asm_65f7
	pop hl
	push bc
	ld bc, $0020
	add hl, bc
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, Func_00b_65f6
	ld a, $00
	ldh [rVBK], a
	ret

; structured data table
unk_00b_662b:
; pointer table: dw record, dw handler
	dw .record_6645, unk_00b_4179
	dw .record_664b, unk_00b_4179
	dw .record_6656, unk_00b_4179
	dw .record_6668, unk_00b_4179
	dw .record_663f, unk_00b_4179
.record_663f
	db $02, $02, $44, $45, $3f, $3f
.record_6645
	db $02, $02, $01, $02, $03, $04
.record_664b
	db $03, $03, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d
.record_6656
	db $04, $04, $0e, $0f, $10, $11, $12, $13, $09, $14, $15, $09, $09, $16, $17, $18
	db $19, $1a
.record_6668
	db $05, $05, $1b, $1c, $1d, $1e, $1b, $1f, $20, $09, $21, $22, $23, $09, $09, $09
	db $24, $25, $26, $09, $27, $28, $1b, $29, $2a, $2b, $2c
INCBIN "data/record_00b_6668.bin"
; BG-copy patch tables: $ffff-terminated lists of patch pointers (see setbgcopyplayer, Func_00b_606f)
BGCopyTable_00b_696a::
	dw BGCopyPatch_00b_696e
	dw unk_00b_4179
BGCopyPatch_00b_696e:
	bgcopy_patch 2, 2, $24, $25, $06, $26
BGCopyTable_00b_6974::
	dw BGCopyPatch_00b_6978
	dw unk_00b_4179
BGCopyPatch_00b_6978:
	bgcopy_patch 2, 2, $4f, $21, $50, $22
BGCopyTable_00b_697e::
	dw BGCopyPatch_00b_6982
	dw unk_00b_4179
BGCopyPatch_00b_6982:
	bgcopy_patch 2, 2, $33, $35, $34, $36
BGCopyPatch_00b_6988:
	bgcopy_patch 2, 2, $01, $01, $01, $01

GFX_00b_698e:
INCBIN "gfx/misc/gfx_00b_698e.2bpp"
Palette_00b_6ace:
; first 4 colors = OBJ palette (Func_00b_5273); rest is $ff/$fe/$88 data
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 0, 25
	RGB 30, 30, 30
INCBIN "data/data_00b_6ace.bin" ; $ff/$fe/$88 data (trailing zero pad omitted)
