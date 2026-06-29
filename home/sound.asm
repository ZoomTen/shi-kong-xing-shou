FlushSoundQueue::
	ld a, [wLoadedROMBank]
	push af
	ld hl, wdae3
	ld e, [hl]
	inc hl
.loop
	ld a, l
	cp e
	jr nc, .done

	ld a, [hli]
	push hl
	push de
	call PlayQueuedSound
	pop de
	pop hl
	jr .loop

.done
	pop af
	rst Bankswitch

.resetQueuePtr
	ld a, $e4
	ld [wdae3], a
	ret

ResetSoundQueue::
	xor a
	ld [wdae2], a
	jr FlushSoundQueue.resetQueuePtr

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
	jr z, .enqueue
	cp $53
	jr c, .exit

.enqueue
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
	cp BGM_53
	jr c, .useCurrentBank
	cp BGM_ACADEMY
	jr c, .bankAudio1
	cp BGM_INTRO
	jr c, .bankAudio2
	cp BGM_76
	jr c, .bankAudio3

	ld a, BANK("Audio 3")
	jr .gotBank

.bankAudio3
	ld a, BANK("Audio 3")
	jr .gotBank

.bankAudio1
	ld a, BANK("Audio 1")
	jr c, .gotBank ; jr

.bankAudio2
	ld a, BANK("Audio 2")

.gotBank
	ld hl, wCurrentSoundBank
	cp [hl]
	jr z, .switchAndLoad

	ld d, a
	push de
	ld e, 0
	ld a, [wCurrentSoundBank]
	call .switchAndLoad
	pop de
	ld a, d
	ld [wCurrentSoundBank], a

.switchAndLoad
	rst Bankswitch
	ld a, e
	jp SOUND_LOAD

.useCurrentBank
	ld a, [wCurrentSoundBank]
	jr .switchAndLoad

WaitSoundFlush::
	ldh a, [rLCDC]
	bit 7, a ; LCDCF_ON
	ret z
	call FlushSoundQueue
	ei
	xor a
	ld [hVBlank], a
.waitVBlank
	halt
	ld a, [hVBlank]
	or a
	jr z, .waitVBlank
	ret
