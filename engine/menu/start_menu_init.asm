InitStartMenu:
; Init Start Menu
	ld a, 1
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	call ClearStartMenuBuffer
	ret

ClearStartMenuBuffer:
	ld hl, wcde0
	ld c, $20
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret
