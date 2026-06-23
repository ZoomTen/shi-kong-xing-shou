FlushSoundQueue::
	ld a, [wLoadedROMBank]
	push af
	ld hl, wdae3
	ld e, [hl]
	inc hl
.asm_25df
	ld a, l
	cp e
	jr nc, .asm_25ed

	ld a, [hli]
	push hl
	push de
	call PlayQueuedSound
	pop de
	pop hl
	jr .asm_25df

.asm_25ed
	pop af
	rst Bankswitch

.asm_25ef
	ld a, $e4
	ld [wdae3], a
	ret

ResetSoundQueue::
	xor a
	ld [wdae2], a
	jr FlushSoundQueue.asm_25ef

QueueSound::
	cp $7f
	ret nc
	or a
	jr nz, _QueueSound

; SoundID == 0
	call ResetSoundQueue
	xor a
	call _QueueSound
	push hl
	push de
	push bc
	call FlushSoundQueue
	pop bc
	pop de
	pop hl
	ret

_QueueSound::
	push hl
	ld hl, wdae2
	bit 0, [hl]
	jr z, .asm_261e
	cp $53
	jr c, .exit

.asm_261e
	ld hl, wdae3
	ld l, [hl]
	ld [hl], a
	ld l, LOW(wdae3)
	ld a, [hl]
	cp LOW(wdaeb)
	jr nc, .exit
	inc [hl]

.exit
	pop hl
	ret

InitSound::
	call ResetSoundQueue
	ld a, [wLoadedROMBank]
	push af
	ld a, [wCurrentSoundBank]
	rst Bankswitch
	call SOUND_INIT
	pop af
	rst Bankswitch
	ret

PlayQueuedSound::
; Load sound bank?
	ld e, a
	cp $53
	jr c, .asm_2677
	cp $65
	jr c, .asm_2657
	cp $6d
	jr c, .asm_265b
	cp $76
	jr c, .asm_2653

	ld a, $1d
	jr .asm_265d

.asm_2653
	ld a, $1d
	jr .asm_265d

.asm_2657
	ld a, $02
	jr c, .asm_265d ; jr

.asm_265b
	ld a, $03

.asm_265d
	ld hl, wCurrentSoundBank
	cp [hl]
	jr z, .asm_2672

	ld d, a
	push de
	ld e, 0
	ld a, [wCurrentSoundBank]
	call .asm_2672
	pop de
	ld a, d
	ld [wCurrentSoundBank], a

.asm_2672
	rst Bankswitch
	ld a, e
	jp SOUND_LOAD

.asm_2677
	ld a, [wCurrentSoundBank]
	jr .asm_2672

WaitSoundFlush::
	ldh a, [rLCDC]
	bit 7, a ; LCDCF_ON
	ret z
	call FlushSoundQueue
	ei
	xor a
	ld [hVBlank], a
.asm_2689
	halt
	ld a, [hVBlank]
	or a
	jr z, .asm_2689
	ret

; TODO: unreferenced data block, classify type
unk_2691::
	ds $40, 0
