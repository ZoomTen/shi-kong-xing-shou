ParseCurrentMapEvents::
; Determine player's Y position
; Store it to c
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wPlayerScreenY]
	sub $10
	ld c, a
	ld a, 0
	sbc 0
	ld b, a
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld c, l
	ldh a, [hMapOffsetY]
	add a
	add c
	ld c, a

; Determine player's X position
; Store it to b
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wPlayerScreenX]
	sub 8
	ld e, a
	ld a, 0
	sbc 0
	ld d, a
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld b, l
	ldh a, [hMapOffsetX]
	add a
	add b
	ld b, a

	ld hl, wMapEvents

MapEventLoop:
.check_x
	push hl
	ld a, [hli]
; $FF marks end of map events
	cp -1
	jr z, .exit
; $EE marks any X position
	cp ABSOLUTE
	jr z, .check_y
	cp b
	jr nz, JumpToNextMapEvent

.check_y
	ld a, [hli]
; $EE marks any Y position
	cp ABSOLUTE
	jr z, .execute_event
	cp c
	jr nz, JumpToNextMapEvent

.execute_event
	ld de, MapEvent_Jumptable
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.exit
	pop hl
	xor a
	ld [wSignpostNumber], a
	ld [wFoundItem], a
	ld [wd0f8], a
	ld [wd0ee], a
	ret

JumpToNextMapEvent:
	pop hl
	ld a, l
	add 6
	ld l, a
	jr MapEventLoop

MapEvent_Jumptable:
	dw MapEvent_Warp      ; 00
	dw MapEvent_Script    ; 01
	dw MapEvent_Signpost  ; 02
	dw MapEvent_FarWarp   ; 03
	dw MapEvent_04        ; 04
	dw MapEvent_05        ; 05
	dw MapEvent_06        ; 06
	dw MapEvent_07        ; 07

MapEvent_Warp:
	pop hl
	ld a, [hli]
	ldh [hMapNumber], a
	ld a, [hli]
	ldh [hWarpNumber], a
	ld a, [hli]
	ldh [hScrollNumber], a
	ld a, 1
	ldh [hFade], a
	pop hl
	ret

MapEvent_FarWarp:
	pop hl
	ld a, [hli]
	ldh [hMapNumber], a
	ld a, [hli]
	ldh [hWarpNumber], a
	ld a, [hli]
	ldh [hMapGroup], a
	xor a
	ld [hScrollNumber], a
	ld a, 1
	ldh [hFade], a
	pop hl
	ret

MapEvent_Script:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hMapPredef]
	cp [hl]
	jp nz, JumpToNextMapEvent

.no_conditional
	inc hl
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	ld a, 1
	ldh [hFFD6], a
	xor a
	ld [wScriptByte], a
	ld [wSignpostNumber], a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_Signpost:
	pop hl
	ld a, [hli]
	ld [wSignpostNumber], a
	xor a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_04:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hMapPredef]
	cp [hl]
	jp nz, JumpToNextMapEvent

.no_conditional
	inc hl
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	ld a, 1
	ld [wd0f8], a
	xor a
	ld [wSignpostNumber], a
	ld [wd0ee], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_05:
	pop hl
	ld a, [hli]
	ld [wd0ee], a
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	xor a
	ld [wSignpostNumber], a
	ld [wd0f8], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_06:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hMapPredef]
	cp [hl]
	jp nc, JumpToNextMapEvent

.no_conditional
	inc hl
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	ld a, 1
	ldh [hFFD6], a
	xor a
	ld [wScriptByte], a
	pop hl
	ret

MapEvent_07:
	pop hl
	ld a, [hli]
	ld [wFoundItem], a
	xor a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wSignpostNumber], a
	pop hl
	ret
