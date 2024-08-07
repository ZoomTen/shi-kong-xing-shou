SoundEngine1_Load:
	or a
	jp z, SoundEngine1_ResetSoundRegisters
	cp $a
	jp z, Func_002_446f
	push bc
	push de
	ld [wCurrentSongID], a
	push af
	add a
	add $8d
	ld l, a
	ld a, $40 ; 408d
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, Func_002_43e4
	ld a, [hli]
	ld [wSoundNumChannels], a
	ld a, [hli]
	ld [wd406], a
	ld b, h
	ld c, l
	xor a
	ld [wd402], a
	ld de, wChannel1

Func_002_43cf:
	ld hl, wSoundNumChannels
	srl [hl]
	jr c, Func_002_43e7
	jr z, Func_002_43e4

Func_002_43d8:
	ld hl, wd402
	inc [hl]
	ld hl, $2c
	add hl, de
	ld d, h
	ld e, l
	jr Func_002_43cf

Func_002_43e4:
	pop de
	pop bc
	ret

Func_002_43e7:
	ld hl, 0
	add hl, de
	ld a, [hli]
	or a
	jr z, Func_002_43f9
	ld a, [wd406]
	cp [hl]
	jr nc, Func_002_43f9
	inc bc
	inc bc
	jr Func_002_43d8

Func_002_43f9:
	ld h, b
	ld l, c
	ld a, [hli]
	ld b, [hl]
	inc hl
	push hl
	ld hl, $20
	add hl, de
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hli], a
	ld [hl], b
	ld hl, $f
	add hl, de
	ld a, $21
	ld [hli], a
	ld a, $50
	ld [hl], a
	pop bc
	ld a, [wd402]
	push af
	add $ab
	ld l, a
	ld a, $4a
	adc 0
	ld h, a
	pop af
	ld a, [wd407]
	or [hl]
	ld [wd407], a
	ld h, d
	ld l, e
	ld a, [wCurrentSongID]
	ld [hli], a
	ld a, [wd406]
	ld [hli], a
	ld a, 8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, 3
	ld [hli], a
	ld [hli], a
	ld a, 1
	ld [hl], a
	jr Func_002_43d8

Func_002_4443:
	push bc
	push de
	ld [wCurrentSongID], a
	push af
	add a
	add $8d
	ld l, a
	ld a, $40
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and $f0
	swap a
	ld [wSoundNumChannels], a
	ld a, [hli]
	ld [wd406], a
	ld b, h
	ld c, l
	ld a, 4
	ld [wd402], a
	ld de, wChannel5
	jp Func_002_43cf

Func_002_446f:
	ld a, 7
	ld [wd40b], a
	ld [wd40c], a
	ret

SoundEngine1_Play:
	dr $8478, $8d1e

SoundEngine1_ResetSoundRegisters:
	call .DoReset

.DoReset:
	push bc
	push de
	call SoundEngine1_TurnOffChannels
	ld a, $77
	ld [wSoundGlobalStereo], a
	jr SoundEngine1_ResetEngineVariables

SoundEngine1_Init:
	push bc
	push de
	call SoundEngine1_ResetHWVolumes
	ld a, $77
	ldh [rNR50], a
	ld [wSoundGlobalStereo], a

SoundEngine1_ResetEngineVariables:
	ld hl, wChannel1
	ld de, $2c
	ld a, 0
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	ld hl, wChannel1Field08
	ld a, 1
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	ld a, 0
	ld [wd407], a
	ld [wd40b], a
	ld [wd40c], a
	ld a, $ff
	ld [wCurrentWaveInst], a
	pop de
	pop bc
	ret

SoundEngine1_ResetHWVolumes:
	xor a
	ldh [rNR50], a
	ld a, $80
	ldh [rNR52], a

SoundEngine1_TurnOffChannels:
	ld a, 8
	ldh [rNR10], a
	ld [wCh1DataCurrentSweep], a
	ldh a, [rNR52]
	bit 0, a
	jr z, .ch1_is_off
	xor a
	ldh [rNR11], a
	ld [wCh1DataCurrentDutyLength], a
	ld a, 8
	ldh [rNR12], a
	ld [wCh1DataCurrentEnvelope], a
	xor a
	ldh [rNR13], a
	ld [wCh1DataCurrentFrequency], a
	ld [wCh1DataCurrentFrequency + 1], a
	ld a, $80
	ldh [rNR14], a
	xor a

.ch1_is_off:
	ldh a, [rNR52]
	bit 1, a
	jr z, .ch2_is_off
	xor a
	ldh [rNR21], a
	ld [wCh2DataCurrentDutyLength], a
	ldh [rNR22], a
	ld [wCh2DataCurrentEnvelope], a
	ldh [rNR23], a
	ld [wCh2DataCurrentFrequency], a
	ld [wCh2DataCurrentFrequency + 1], a
	ld a, $80
	ldh [rNR24], a

.ch2_is_off:
	ldh a, [rNR52]
	bit 2, a
	jr z, .wave_is_off
	xor a
	ldh [rNR32], a
	ld [wCh3DataCurrentVolume], a
	ld [wCh3DataCurrentFrequency + 1], a
	ld a, $80
	ldh [rNR34], a

.wave_is_off:
	ldh a, [rNR52]
	bit 3, a
	jr z, .done
	xor a
	ldh [rNR41], a
	ld [wCh4DataCurrentLength], a
	ld a, 8
	ldh [rNR42], a
	ld [wCh4DataCurrentEnvelope], a
	xor a
	ldh [rNR43], a
	ld [wCh4DataCurrentFrequency], a
	ld [wCh4DataCurrentFrequency + 1], a
	ld a, $80
	ldh [rNR44], a

.done:
	ret

	dr $8df7, $8ecc