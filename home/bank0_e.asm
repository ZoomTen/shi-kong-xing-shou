WaitVRAM_STAT2::
; Copy of WaitVRAM_STAT
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT2

CopyBytes2::
; Copy bc bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
