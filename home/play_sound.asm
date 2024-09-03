PlaySound::
; Play music or sound effect indicated by a.
	push hl
	push de
	push bc
	ld d, a
	cp $53
	jr c, .play

; If the sound to be played is music (a >= $53),
; it won't replay it if it is already playing.
	ldh a, [hCurSound]
	cp d
	jr z, .done

.play
	ld a, d
	ldh [hCurSound], a
	ld a, [wLoadedROMBank]
	push af
	ld a, d
	call Func_25fb
	call Func_25d6
	pop af
	rst Bankswitch

.done
	pop bc
	pop de
	pop hl
	ret
