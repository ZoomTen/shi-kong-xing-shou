SetupEnemyNameWindow::
	ld bc, $c0
	ld hl, $9610
	xor a
	call ByteFillVRAM
	ld a, $61
	ld [wMenuTextX], a
	ld a, $6d
	ld [wMenuTextEndX], a
	ld a, [wEnemyMonSpecies]
	ld [wd9d8], a
	farcall asm_026_4616
	ret

CopyNameByIndex:
	ld bc, wMenuTextBuffer
	ld de, NamePointers
	ld a, [wPlayerChar]
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

CopyNameString:
IF DEF(ENGLISH)
; EN names can exceed the 7-byte wMenuTextBuffer (zh names max out at 6 bytes),
; and the overrunning TX_LINE terminator lands on wSaveRecordCaught right after
; the buffer. Truncate: reserve the last byte for the terminator.
.loop
	ld a, [hli]
	ld [bc], a
	cp TX_LINE
	ret z
	inc bc
	ld a, c
	cp LOW(wMenuTextBuffer + 6)
	jr nz, .loop
	ld a, TX_LINE
	ld [bc], a
	ret
ELSE
	ld a, [hli]
	ld [bc], a
	inc bc
	cp $ed
	jr nz, CopyNameString
	ret
ENDC

CopySelectedOptionName:
	ld a, [wSelectedOption]
	cp 3
	jr nz, .asm_45e1
	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_45e1
	ld a, $2b
	jr .asm_45e4
.asm_45e1:
	ld a, [wSelectedOption]
.asm_45e4:
	ld bc, wMenuTextBuffer
	ld de, NamePointers
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
IF DEF(ENGLISH)
	jr CopyNameString ; bounded copy, see above
ELSE
.asm_45f3
	ld a, [hli]
	ld [bc], a
	inc bc
	cp TX_LINE
	jr nz, .asm_45f3
	ret
ENDC

NamePointers:: INCLUDE "data/name_pointers.asm"
INCLUDE "text/names.asm"
