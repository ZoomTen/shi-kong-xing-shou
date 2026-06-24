PrintText::
	ld a, [_BANKNUM]
	push af
	call _PrintText
	pop af
	rst Bankswitch
	ret

DispatchScriptCommand::
	ld a, BANK(_DispatchScriptCommand)
	rst Bankswitch
	call _DispatchScriptCommand
	ld a, BANK(Func_005_440f)
	rst Bankswitch
	ret

GetScriptByte::
; Get byte from [hScriptBank]:[wScriptPos] and store it in [wScriptByte]
	ld a, [_BANKNUM]
	push af

; Get bank and address
	ldh a, [hScriptBank]
	rst Bankswitch
	ld a, [wScriptPos]
	ld l, a
	ld a, [wScriptPos + 1]
	ld h, a

; Get byte
	ld a, [hli]
	ld [wScriptByte], a
; Store new address
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a

	pop af
	rst Bankswitch
	ret

