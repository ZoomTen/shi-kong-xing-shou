SoundEngine2_Load:
	or a
	jp z, SoundEngine2_ResetSoundRegisters
	cp $a
	jp z, SoundEngine2_Fade
	push bc
	push de
	ld [wCurrentSongID], a

; Calculate song header location.
	push af
	add a
	add LOW(SoundEngine2_HeaderPointers)
	ld l, a
	ld a, HIGH(SoundEngine2_HeaderPointers)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .done
	ld a, [hli]
	ld [wSoundNumChannels], a
	ld a, [hli]
	ld [wd406], a
	ld b, h
	ld c, l
	xor a
	ld [wd402], a
	ld de, wChannels
.loop
	ld hl, wSoundNumChannels
	srl [hl]
	jr c, .skip
	jr z, .done
.loop2
	ld hl, wd402
	inc [hl]
	ld hl, CHANNEL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	jr .loop
.done
	pop de
	pop bc
	ret

.skip
	ld hl, CHANNEL_SONG_ID
	add hl, de
	ld a, [hli]
	or a
	jr z, .load_channel_pointers
	ld a, [wd406]
	cp [hl]
	jr nc, .load_channel_pointers
	inc bc
	inc bc
	jr .loop2

.load_channel_pointers
	ld h, b
	ld l, c
	ld a, [hli]
	ld b, [hl]
	inc hl
	push hl
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	ld [hli], a
	ld [hl], b
; CHANNEL_LOOP_POINT_1
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
; CHANNEL_LOOP_POINT_2
	ld [hli], a
	ld [hl], b

; Set default instrument parameters?
	ld hl, CHANNEL_VIBRATO_TABLE_POINTER
	add hl, de
	ld a, LOW(SoundEngine2_VibratoTables.vibrato1)
	ld [hli], a
	ld a, HIGH(SoundEngine2_VibratoTables.vibrato1)
	ld [hl], a
	pop bc
	ld a, [wd402]
	push af
	add LOW(unk_003_4a49)
	ld l, a
	ld a, HIGH(unk_003_4a49)
	adc 0
	ld h, a
	pop af
	ld a, [wd607]
	or [hl]
	ld [wd607], a
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
	jr .loop2

.asm_003_43e1
	push bc
	push de
	ld [wCurrentSongID], a
	push af
	add a
	add LOW(SoundEngine2_HeaderPointers)
	ld l, a
	ld a, HIGH(SoundEngine2_HeaderPointers)
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
	ld de, wd6be
	jp .loop

SoundEngine2_Fade:
	ld a, 7
	ld [wSound2FadeEnabled], a
	ld [wSound2FadeTimer], a
	ret

SoundEngine2_Play:
	ld a, [wSound2FadeEnabled]
	or a
	jr z, .run_audio
	ld hl, wSound2FadeTimer
	dec [hl]
	jr nz, .run_audio

; finished fading
	ld [hl], a
	ld hl, wSoundGlobalStereo
	ld a, [hl]
	or a
	jp z, SoundEngine2_ResetSoundRegisters
	sub $11
	ld [hl], a
.run_audio
	call .ProcessAudio
	jp SoundEngine2_ApplyAudio

.ProcessAudio
	xor a
	ld [wSoundCurChannel], a
	ld de, wChannels
.loop1
	ld hl, CHANNEL_SONG_ID
	add hl, de
	ld a, [hl]
	or a
	jr z, .skip
	call SoundEngine2_UpdateChannels
	call Func_003_4a51
.skip
	ld hl, CHANNEL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	ld hl, wSoundCurChannel
	inc [hl]
	ld a, 8
	cp [hl]
	jr nz, .loop1
	ld hl, wChannels
	ld de, CHANNEL_STRUCT_LENGTH
	ld a, [hl]
	add hl, de
	or [hl]
	add hl, de
	or [hl]
	add hl, de
	or [hl]
	ld [wd60d], a
	ret

SoundEngine2_UpdateChannels:
	ld hl, CHANNEL_FIELD08
	add hl, de
	inc [hl]
	dec hl
	dec [hl]
	call z, SoundEngine2_LoadNote
	ld a, [wSoundCurChannel]
	cp CHAN4
	ret z
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [hl]
	or a
	ret z
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld a, [hl]
	add a
	jp nc, asm_003_45fa
	ld a, [wSoundCurChannel]
	and 3
	cp CHAN3
	jp z, asm_003_459c
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	jp nz, asm_003_4635
	ld hl, CHANNEL_FIELD18
	add hl, de
	ld a, [hl]
	push af
	add a
	add LOW(Pointer_03_44af)
	ld l, a
	ld a, HIGH(Pointer_03_44af)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointer_03_44af:
	dw asm_003_44bf
	dw asm_003_44ee
	dw asm_003_4524
	dw asm_003_454b
	dw asm_003_4584
	dw asm_003_4635
	dw asm_003_4635
	dw asm_003_4635

asm_003_44bf:
	push bc
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld a, [hl]
	and $f
	ld b, a
	ld a, [hl]
	swap a
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	and 7
	ld c, a
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	swap a
	and $f
	sub b
	jr c, asm_003_44ef
	call Func_003_47d7
	or a
	jr z, asm_003_44ef
	pop bc
	jp asm_003_4630

asm_003_44ee:
	push bc

asm_003_44ef:
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	and $f0
	ld b, a
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	swap a
	and 7
	ld c, a
	or b
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	and $f
	swap b
	ld l, a
	ld a, b
	sub l
	jr c, asm_003_4525
	call Func_003_47d7
	or a
	jr z, asm_003_4525
	pop bc
	jp asm_003_4630

asm_003_4524:
	push bc

asm_003_4525:
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	swap a
	and $f0
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD0A
	add hl, de
	ld a, [hl]
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld b, [hl]
	sub b
	jr c, asm_003_454c
	jr z, asm_003_454c
	pop bc
	jp asm_003_4630

asm_003_454b:
	push bc

asm_003_454c:
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld b, a
	ld hl, CHANNEL_FIELD13
	add hl, de
	ld a, [hl]
	and 7
	ld c, a
	or b
	ld hl,CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld a, b
	swap a
	push af
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	and $f
	ld b, a
	pop af
	sub b
	jr c, asm_003_4583
	call Func_003_47d7
	or a
	jr z, asm_003_4583
	pop bc
	jp asm_003_4630

asm_003_4583:
	pop bc

asm_003_4584:
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld a, $ff
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	jp asm_003_4630

asm_003_459c:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	ret nz
	ld hl, CHANNEL_FIELD18
	add hl, de
	ld a, [hl]
	cp 1
	jr c, asm_003_45b8
	cp 2
	jr c, asm_003_45d0
	cp 3
	jr c, asm_003_45e9
	cp 4
	jr c, asm_003_45ed
	ret

asm_003_45b8:
	ld a, $f0
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD0A
	add hl, de
	ld a, [hl]
	inc a
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a
	ret

asm_003_45d0:
	ld a, $50

asm_003_45d2:
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld a, [hl]
	and $7f
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a
	ret

asm_003_45e9:
	ld a, $10
	jr asm_003_45d2

asm_003_45ed:
	ld a, 0
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ret

asm_003_45fa:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	jr nz, asm_003_4635
	ld hl, CHANNEL_INSTRUMENT_VOLUME_OFFSET
	add hl, de
	inc [hl]
	ld a, [hl]
	ld hl, CHANNEL_INSTRUMENT_POINTER
	add hl, de
	push bc
	add [hl]
	ld c, a
	inc hl
	ld a, [hl]
	adc 0
	ld b, a
	ld a, [bc]
	pop bc
	cp $ff
; apply envelope on retriggered note
	jr nz, asm_003_4625
	ld hl, CHANNEL_INSTRUMENT_VOLUME_OFFSET
	add hl, de
	dec [hl]
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a
	jr asm_003_4635

asm_003_4625:
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	push af
	and $f0
	ld [hl], a
	pop af
	and $f

asm_003_4630:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a

asm_003_4635:
	ld a, [wSoundCurChannel]
	and 2
	jr nz, asm_003_467c
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN_OFFSET
	add hl, de
	dec [hl]
	jp nz, asm_003_467c
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	inc [hl]
	ld a, [hl]

asm_003_464a:
	ld hl, CHANNEL_VIBRATO_TABLE_POINTER
	add hl, de
	push bc
	add [hl]
	ld c, a
	inc hl
	ld a, [hl]
	adc 0
	ld b, a
	ld a, [bc]
	pop bc
	cp $ff
	jr nz, asm_003_4664
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	xor a
	ld [hl], a
	jr asm_003_464a

asm_003_4664:
	push af
	swap a
	and $f
	cp 8
	jr c, asm_003_466f
	or $f0

asm_003_466f:
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	ld [hl], a
	pop af
	and $f
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN_OFFSET
	add hl, de
	ld [hl], a

asm_003_467c:
	ret

SoundEngine2_LoadNote:
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]

SoundEngine2_ReadMusic:
	ld a, [bc]
	cp $d0
	jr c, .notes_and_rests
	call SoundEngine2_CommandProcessor
	jr SoundEngine2_ReadMusic

.notes_and_rests
	ld a, [wSoundCurChannel]
	cp CHAN4
	jp z, .channel4
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [bc]
	cp $c0
	jr c, .is_note
	ld [hl], 0
	jp .set_length

.is_note
	ld [hl], $ff
	push bc
	push af
	ld a, [wSoundCurChannel]
	cp CHAN8
	jr z, .sfxchannel4
	ld hl, CHANNEL_CUR_OCTAVE
	add hl, de
	ld a, [hl]
	add a
	add a
	ld b, a
	add a
	add b
	ld b, a
	pop af
	swap a
	and $f
	add b
	ld hl, CHANNEL_GLOBAL_TRANSPOSE
	add hl, de
	add [hl]
	push af
	add a
	add LOW(SoundEngine2_NoteFrequencies)
	ld c, a
	ld a, HIGH(SoundEngine2_NoteFrequencies)
	adc 0
	ld b, a
	pop af
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	pop bc
	jr .asm_003_46f3

.sfxchannel4
	pop af
	pop bc
	and $70
	ld hl, CHANNEL_CUR_OCTAVE
	add hl, de
	or [hl]
	swap a
	ld hl, CHANNEL_FIELD0C
	add hl, de
	or [hl]
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld [hli], a
	xor a
	ld [hl], a

.asm_003_46f3
	ld hl, CHANNEL_FIELD08
	add hl, de
	xor a
	ld [hl], a
	ld a, [bc]
	and $f
	call SoundEngine2_SetLengthCounter
	ld hl, CHANNEL_LENGTH_COUNTER
	add hl, de
	ld [hl], a
	call SoundEngine2_WriteToPlayhead
	ld hl, CHANNEL_FIELD11
	add hl, de
	bit 7, [hl]
	jr z, .asm_003_4735
	push af
	and $f
	ld c, a
	ld hl, CHANNEL_FIELD13
	add hl, de
	ld a, [hl]
	swap a
	and $f
	push af
	call Func_003_47d7
	swap a
	and $f
	ld hl, CHANNEL_FIELD0A
	add hl, de
	ld [hl], a
	pop af
	ld c, a
	pop af
	swap a
	and $f
	call Func_003_47d7
	add [hl]
	ld [hl], a

.asm_003_4735
	ld hl, CHANNEL_GLOBAL_STEREO_PANNING
	add hl, de
	ld a, [hli]
	or a
	jr nz, .asm_003_4746
	ld a, [hl]
	cp 3
	jr nz, .asm_003_4744
	ld a, 1
.asm_003_4744
	xor 3
.asm_003_4746
	and 3
	ld [hl], a
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	ld a, $ff
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	push hl
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_VIBRATO_DELAY
	add hl, de
	ld a, [hl]
	pop hl
	inc a
	ld [hli], a
	ld a, 1
	ld [hl], a
	ret

.channel4
	ld a, [wChannel7]
	cp 6
	jr c, .asm_003_478e
	cp $c
	jr nc, .asm_003_478e
	ld a, LOW(unk_003_4e6a)
	ld [wChannel7Playhead], a
	ld a, HIGH(unk_003_4e6a)
	ld [wChannel7Playhead + 1], a
	ld a, [wd607]
	or $40
	ld [wd607], a
	ld a, 1
	ld [wChannel7LengthCounter], a
	ld [wChannel7], a
	xor a
	ld [wChannel7Field01], a
.asm_003_478e
	ld a, [bc]
	swap a
	and $f
	cp $c
	call nz, SoundEngine2_Load.asm_003_43e1

.set_length
	ld a, [bc]
	and $f
	call SoundEngine2_SetLengthCounter
	ld hl, CHANNEL_LENGTH_COUNTER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD08
	add hl, de
	xor a
	ld [hl], a
	pop hl

SoundEngine2_WriteToPlayhead:
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	inc bc
	ld [hl], c
	inc hl
	ld [hl], b
	ret

SoundEngine2_SetLengthCounter:
	ld hl, CHANNEL_SPEED
	add hl, de
	or a
	jr z, SoundEngine2_LowNibbleOnlySwapped

SoundEngine2_AtimesHL:
	cp [hl]
	jr nc, .less_than_hl
; These lines are duplicated below
	push bc
	ld c, a
	ld b, [hl]
	xor a
.multiply_1:
	add b
	dec c
	jr nz, .multiply_1
	pop bc
	ret
; Duplicated
.less_than_hl:
	push bc
	ld c, a
	ld b, [hl]
	xor a
.multiply_2:
	add b
	dec c
	jr nz, .multiply_2
	pop bc
	ret

SoundEngine2_LowNibbleOnlySwapped:
	ld a, [hl]
	swap a
	and $f0
	ret

Func_003_47d7:
	or a
	ret z
	ld b, a
	xor a
	or c
	ret z
	cp b
	jr nc, asm_003_47e6
	xor a

asm_003_47e1:
	add b
	dec c
	jr nz, asm_003_47e1
	ret

asm_003_47e6:
	xor a

asm_003_47e7:
	add c
	dec b
	jr nz, asm_003_47e7
	ret

SoundEngine2_CommandProcessor:
	sub $e0
	jr c, .is_dx_command
	push af
	add a
	add LOW(SoundEngine2_Commands)
	ld l, a
	ld a, HIGH(SoundEngine2_Commands)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.is_dx_command
; D0 - DF sets the song speed
	ld hl, CHANNEL_SPEED
	add hl, de
	and $f
	ld [hli], a
	inc bc
	ld a, [wSoundCurChannel]
	cp CHAN4
	ret z
	cp CHAN8
	jr z, .asm_03_4826
	and 3
	cp 2
	jr z, .asm_03_4833
	ld a, [bc]
	and $33
	add a
	add a
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	call SoundEngine2_CommandEB
	jp asm_003_490e

.asm_03_4826:
	ld a, [bc]
	or a
	jr z, .asm_03_482c
	ld a, 8

.asm_03_482c:
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	jp SoundEngine2_CommandEE

.asm_03_4833:
	dec bc
	call SoundEngine2_CommandED
	ld a, [bc]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld [hli], a
	add a
	jp nc, asm_003_4917
	inc bc
	inc hl
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_Commands:
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE8
	dw SoundEngine2_CommandE9
	dw SoundEngine2_CommandEA
	dw SoundEngine2_CommandEB
	dw SoundEngine2_CommandEC
	dw SoundEngine2_CommandED
	dw SoundEngine2_CommandEE
	dw SoundEngine2_CommandEF
	dw SoundEngine2_CommandF0
	dw SoundEngine2_CommandF1
	dw SoundEngine2_CommandF2
	dw SoundEngine2_CommandF3
	dw SoundEngine2_CommandF4
	dw SoundEngine2_CommandSkip
	dw SoundEngine2_CommandF6
	dw SoundEngine2_CommandF7
	dw SoundEngine2_CommandF8
	dw SoundEngine2_CommandF9
	dw SoundEngine2_CommandFA
	dw SoundEngine2_CommandFB
	dw SoundEngine2_CommandFC
	dw SoundEngine2_CommandFD
	dw SoundEngine2_CommandFE
	dw SoundEngine2_CommandFF

; Ex (0-7) : set the current octave
SoundEngine2_CommandE0toE7:
	ld a, [bc]
	and 7
	ld hl, CHANNEL_CUR_OCTAVE
	add hl, de
	jr SoundEngine2_SetVariable

; E8 xy : Set instrument duty cycle pattern
SoundEngine2_CommandE8:
	inc bc
	ld a, [wSoundCurChannel]
	cp CHAN8
	jr z, .noise
	ld a, [bc]
	and $33
	add a
	add a
	ld hl, CHANNEL_FIELD0C
	add hl, de
	jr SoundEngine2_SetVariable
.noise
; always set the duty pattern to $08 if on noise channel
	ld a, [bc]
	or a
	jr z, .no_params
	ld a, 8
.no_params
	ld hl, CHANNEL_FIELD0C
	add hl, de
	jr SoundEngine2_SetVariable

SoundEngine2_CommandE9:
	ld hl, CHANNEL_FIELD0D
	add hl, de
	inc bc
	ld a, [bc]

SoundEngine2_SetVariable:
	ld [hl], a

; F5 : does nothing, essentially the sound engine's "nop" instruction
SoundEngine2_CommandSkip:
	inc bc
	ret

SoundEngine2_CommandEA:
	ld hl, CHANNEL_FIELD02
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; EB xy : Set vibrato delay and type
SoundEngine2_CommandEB:
	inc bc
; set delay in note length (x)
	ld a, [bc]
	swap a
	and $f
	ld hl, CHANNEL_SPEED
	add hl, de
	call SoundEngine2_AtimesHL
	ld hl, CHANNEL_VIBRATO_DELAY
	add hl, de
	inc a
	ld [hli], a
; set type (y)
	ld a, [bc]
	and $f
	push bc
	push af
	add a
	add LOW(SoundEngine2_VibratoTables)
	ld c, a
	ld a, HIGH(SoundEngine2_VibratoTables)
	adc 0
	ld b, a
	pop af

SoundEngine2_SetWord:
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	pop bc
	inc bc
	ret

; EC xx : set channel transpose
SoundEngine2_CommandEC:
	ld hl, CHANNEL_GLOBAL_TRANSPOSE
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandED:
	ld a, [wSoundCurChannel]
	cp CHAN3
	jr z, .asm_003_4906
	cp CHAN7
	jr nz, SoundEngine2_CommandSkip
	inc bc
	ld a, [bc]
	ld [wCh7TargetWaveform], a
	inc bc
	ret

.asm_003_4906
	inc bc
	ld a, [bc]
	ld [wCh3TargetWaveform], a
	inc bc
	ret

; EE xx (yy zz) : volume related stuff?
; (yy zz set only if xx > $7f)
SoundEngine2_CommandEE:
	inc bc

asm_003_490e:
	ld a, [bc]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld [hli], a
	add a
	jr c, SoundEngine2_InstrumentSetParams

asm_003_4917:
	ld a, [bc]

SoundEngine2_UseInstrument:
	push bc
	push af
	add a
	add LOW(SoundEngine2_InstrumentPointers)
	ld c, a
	ld a, HIGH(SoundEngine2_InstrumentPointers)
	adc 0
	ld b, a
	pop af
	ld hl, CHANNEL_INSTRUMENT_POINTER
	add hl, de
	jr SoundEngine2_SetWord

SoundEngine2_InstrumentSetParams:
	inc bc
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; EF xx : set channel fine pitch
SoundEngine2_CommandEF:
	ld hl, CHANNEL_GLOBAL_FINE_PITCH
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandF0:
	ld hl, CHANNEL_FIELD11
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandF1:
	ld hl, CHANNEL_FIELD12
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandF2:
	ld hl, CHANNEL_FIELD13
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F3 xx : set stereo panning
SoundEngine2_CommandF3:
	ld hl, CHANNEL_GLOBAL_STEREO_PANNING
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F6 xx : set speed only
SoundEngine2_CommandF6:
	ld hl, CHANNEL_SPEED
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F7 xx yy : call a subpart
SoundEngine2_CommandF7:
	inc bc
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	push hl
; save the return point
	ld hl, CHANNEL_RETURN_POINT_1
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

; F8 xx yy : same as above but uses a different variable
SoundEngine2_CommandF8:
	inc bc
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	push hl
	ld hl, CHANNEL_RETURN_POINT_2
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

; F9 : return from F7 xx yy call
SoundEngine2_CommandF9:
	ld hl, CHANNEL_RETURN_POINT_1
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

; FA : return from F8 xx yy call
SoundEngine2_CommandFA:
	ld hl, CHANNEL_RETURN_POINT_2
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

; FB : begin a repeating phrase
SoundEngine2_CommandFB:
	inc bc
	ld hl, CHANNEL_LOOP_POINT_1
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, CHANNEL_LOOP_COUNTER_1
	add hl, de
	ld [hl], 0
	ret

; FC : begin a repeating phrase
SoundEngine2_CommandFC:
	inc bc
	ld hl, CHANNEL_LOOP_POINT_2
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, CHANNEL_LOOP_COUNTER_2
	add hl, de
	ld [hl], 0
	ret

; FD xx : end repeating phrase after xx repetitions
;         if xx is 0, then loop forever
SoundEngine2_CommandFD:
	inc bc
	ld a, [bc]
	or a
	jr z, .goto_loop
	ld hl, CHANNEL_LOOP_COUNTER_1
	add hl, de
	push hl
	ld h, [hl]
	cp h
	pop hl
	jr z, SoundEngine2_DoneRepeating
	inc [hl]
.goto_loop
	ld hl, CHANNEL_LOOP_POINT_1
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

SoundEngine2_DoneRepeating:
	ld [hl], 0
	jp SoundEngine2_CommandSkip

; FE xx : same as above but uses a different variable
SoundEngine2_CommandFE:
	inc bc
	ld a, [bc]
	or a
	jr z, .goto_loop
	ld hl, CHANNEL_LOOP_COUNTER_2
	add hl, de
	push hl
	ld h, [hl]
	cp h
	pop hl
	jr z, SoundEngine2_DoneRepeating
	inc [hl]
.goto_loop
	ld hl, CHANNEL_LOOP_POINT_2
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

SoundEngine2_CommandFF:
	ld a, [wSoundCurChannel]
	push af
	add LOW(unk_003_4a41)
	ld c, a
	ld a, HIGH(unk_003_4a41)
	adc 0
	ld b, a
	pop af
	ld a, [bc]
	ld hl, wd607
	and [hl]
	ld [hl], a
	ld a, [wSoundCurChannel]
	cp CHAN5
	jr z, .asm_003_4a38
	and 3
	jr z, .asm_003_4a0f
	cp CHAN4
	jr nz, .asm_003_4a13
.asm_003_4a0f
	ld a, 8
	jr .asm_003_4a14

.asm_003_4a13
	xor a
.asm_003_4a14
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	xor a
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld [hli], a
	ld [hl], a
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld [hl], a
	ld h, d
	ld l, e
	ld [hli], a
	ld [hli], a
	ld a, 8
	ld [hl], a
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld [hl], a
	pop hl
	ret

.asm_003_4a38
	ld a, 8
	ldh [rNR10], a
	ld [wCh1DataCurrentSweep], a
	jr .asm_003_4a0f

unk_003_4a41:
	db $fe  ; ch1
	db $fd  ; ch2
	db $fb  ; ch3
	db $f7  ; ch4

	db $ef  ; ch5
	db $df  ; ch6
	db $bf  ; ch7
	db $7f  ; ch8

unk_003_4a49:
	db $01  ; ch1
	db $02  ; ch2
	db $04  ; ch3
	db $08  ; ch4

	db $10  ; ch5
	db $20  ; ch6
	db $40  ; ch7
	db $80  ; ch8

Func_003_4a51:
	ld a, [wSoundCurChannel]
	push af
	add a
	add LOW(Pointer_03_4a63)
	ld l, a
	ld a, HIGH(Pointer_03_4a63)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointer_03_4a63:
; music channels
	dw .Ch1
	dw .Ch2
	dw .Ch3
	dw .Ch4
; sfx channels
	dw .Ch5
	dw .Ch6
	dw .Ch7
	dw .Ch8

.Ch1:
	ld hl, wd6be
	ld a, [hl]
	or a
	ret nz

.Ch5:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bb7)
	ld l, a
	ld a, HIGH(unk_003_4bb7)
	adc 0
	ld h, a
	pop af
	ld bc, wSoundStereoChannels
	ld a, [bc]
	and $ee
	or [hl]
	ld [bc], a
	ld bc, wCh1DataCurrentSweep
	ld hl, CHANNEL_FIELD02
	add hl, de
	ld a, [hl]
	ld [bc], a
	inc bc
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld a, [hl]
	ld [wCh1NoteCounter], a

.asm_003_4aa4
	or a
	jr z, .asm_003_4ab0
	ld hl, CHANNEL_FIELD0C
	add hl, de
	ld a, [hl]
	swap a
	jr .asm_003_4ab5

.asm_003_4ab0
	ld hl, CHANNEL_FIELD0C
	add hl, de
	ld a, [hl]

.asm_003_4ab5
	and $c0
	ld [bc], a
	inc bc
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [hl]
	or a
	jr nz, .asm_003_4ac5
	ld a, 8
	jr .asm_003_4aca

.asm_003_4ac5
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld a, [hl]

.asm_003_4aca
	ld [bc], a
	inc bc

.asm_003_4acc
	ld hl, CHANNEL_GLOBAL_FINE_PITCH
	add hl, de
	ld a, [hl]
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	add [hl]
	inc hl
	bit 7, a
	jr nz, .asm_003_4ae6
	add [hl]
	inc hl
	ld [bc], a
	ld a, [hl]
	adc 0

.asm_003_4ae1
	inc bc
	and 7
	ld [bc], a

.Ch4:
	ret

.asm_003_4ae6
	add [hl]
	push af
	inc hl
	ld [bc], a
	pop af
	ld a, [hl]
	adc $ff
	jr .asm_003_4ae1

.Ch2:
	ld hl, wd6ea
	ld a, [hl]
	or a
	ret nz

.Ch6:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bbb)
	ld l, a
	ld a, HIGH(unk_003_4bbb)
	adc 0
	ld h, a
	pop af
	ld bc, wSoundStereoChannels
	ld a, [bc]
	and $dd
	or [hl]
	ld [bc], a
	ld bc, wCh2DataCurrentDutyLength
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld a, [hl]
	ld [wCh2NoteCounter], a
	jr .asm_003_4aa4

.Ch3:
	ld hl, wChannel7
	ld a, [hl]
	or a
	ret nz

.Ch7:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bbf)
	ld l, a
	ld a, HIGH(unk_003_4bbf)
	adc 0
	ld h, a
	pop af
	ld bc, wSoundStereoChannels
	ld a, [bc]
	and $bb
	or [hl]
	ld [bc], a
	ld bc, wCh3DataEnable
	ld a, $80
	ld [bc], a
	inc bc
	inc bc
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [hl]
	or a
	jr z, .asm_003_4b61
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld a, [hl]
	swap a
	and $f
	push bc
	push af
	add LOW(unk_003_4ba7)
	ld c, a
	ld a, HIGH(unk_003_4ba7)
	adc 0
	ld b, a
	pop af
	ld a, [bc]
	pop bc

.asm_003_4b61
	ld [bc], a
	inc bc
	jp .asm_003_4acc

.Ch8:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bc3)
	ld l, a
	ld a, HIGH(unk_003_4bc3)
	adc 0
	ld h, a
	pop af
	ld bc, wSoundStereoChannels
	ld a, [bc]
	and $77
	or [hl]
	ld [bc], a
	ld bc, wCh4DataCurrentEnvelope
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld a, [hl]
	ld [wCh4DataLastEnvelope], a
	ld hl, CHANNEL_FIELD09
	add hl, de
	xor a
	or [hl]
	jr nz, .asm_003_4b96
	ld a, 8
	jr .asm_003_4b9b

.asm_003_4b96
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld a, [hl]

.asm_003_4b9b
	ld [bc], a
	inc bc
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a
	ret

unk_003_4ba7:
	db 0
	db $60
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20

unk_003_4bb7:
	db $11
	db $01
	db $10
	db $11

unk_003_4bbb:
	db $22
	db $02
	db $20
	db $22

unk_003_4bbf:
	db $44
	db $04
	db $40
	db $44

unk_003_4bc3:
	db $88
	db $08
	db $80
	db $88

SoundEngine2_ApplyAudio:
	ld hl, wCh1DataCurrentSweep
	ld de, wCh1DataLastSweep
	ld c, LOW(rNR10)
	ld a, [wCh1NoteCounter]
	ld b, a
	or a
	jr z, .update_sweep
	ld a, [de]
	cp [hl]
	jr z, .next

.update_sweep
; apply Ch1 sweep
	ld a, [hl]
	ld [de], a
	ldh [c], a
	ldh [c], a ; ?

.next
; apply Ch1 duty cycle
	inc hl
	inc de
	inc c
	call SoundEngine2_UpdateLastData

; apply Ch1 envelope
	ld a, b
	call SoundEngine2_DoUpdateEnvelopes

; apply Ch1 note frequency
	ld a, b
	call SoundEngine2_CheckNeedUpdateLastData
	call SoundEngine2_DoUpdateFrequency

; next byte is not used
	inc c

; apply Ch2 sound length
	call SoundEngine2_UpdateLastData

; apply Ch2 envelope
	ld a, [wCh2NoteCounter]
	call SoundEngine2_DoUpdateEnvelopes

; apply Ch2 note frequency
	call SoundEngine2_UpdateLastData
	call SoundEngine2_DoUpdateFrequency

; apply Ch3 enable
	call SoundEngine2_UpdateLastData

; skip setting length
	inc hl
	inc de
	inc c

; apply Ch3 output level
	call SoundEngine2_UpdateLastData

; apply Ch3 note frequency
	call SoundEngine2_UpdateLastData
	call SoundEngine2_DoUpdateFrequency

; skip
	inc c

; skip audio length
	inc hl
	inc de
	inc c

; apply Ch4 envelope
	ld a, [wCh4DataLastEnvelope]
	call SoundEngine2_DoUpdateEnvelopes

; apply Ch4 "frequency"
	call SoundEngine2_UpdateLastData
	call SoundEngine2_DoUpdateFrequency

; apply global stereo
	ld hl, rNR50
	ld a, [wSoundGlobalStereo]
	ld [hli], a

; apply sound 
	ld a, [wSoundStereoChannels]
	ld [hli], a

; any sfx?
	ld a, [wChannel7]
	or a
	jr nz, .use_other_waveform
	ld a, [wCh3TargetWaveform]
	jr .UpdateWaveform

.use_other_waveform
	ld a, [wCh7TargetWaveform]

.UpdateWaveform:
; don't need to update if it's the same as the last one
	ld hl, wSound2LastWaveform
	cp [hl]
	ret z

; find waveform data
	ld [hl], a
	push af
	add a
	add LOW(SoundEngine2_Waveforms)
	ld l, a
	ld a, HIGH(SoundEngine2_Waveforms)
	adc 0
	ld h, a

; do overwrite
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, LOW(_AUD3WAVERAM)
	xor a
	ldh [rNR30], a
rept 16
	ld a, [hli]
	ldh [c], a
	inc c
endr
	ld a, %10000000
	ldh [rNR30], a

; replay ch3
	ld a, [wCh3DataCurrentFrequency + 1]
	or %10000000
	ldh [rNR34], a
	ret

SoundEngine2_DoUpdateEnvelopes:
	or a
	jr z, SoundEngine2_UpdateEnvelopes
	ld a, [de]
	cp [hl]
	jr z, SoundEngine2_SkipUpdatingLastData

SoundEngine2_UpdateEnvelopes:
	ld a, [hli]
	ld [de], a
	ldh [c], a
	inc hl
	set 7, [hl]
	dec hl
	inc de
	inc c
	ret

SoundEngine2_CheckNeedUpdateLastData:
	or a
	jr z, SoundEngine2_DoUpdateLastData

SoundEngine2_UpdateLastData:
	ld a, [de]
	cp [hl]
	jr z, SoundEngine2_SkipUpdatingLastData

SoundEngine2_DoUpdateLastData:
	ld a, [hl]
	ld [de], a
	ldh [c], a

SoundEngine2_SkipUpdatingLastData:
	inc hl
	inc de
	inc c
	ret

SoundEngine2_DoUpdateFrequency:
	ld a, [de]
	bit 7, a
	jr nz, asm_003_4cb3
	cp [hl]
	jr z, SoundEngine2_SkipUpdatingLastData

asm_003_4cb3:
	ld a, [hl]
	ldh [c], a
	and 7
	ld [de], a
	inc hl
	inc de
	inc c
	ret

SoundEngine2_ResetSoundRegisters:
	call .DoReset

.DoReset:
	push bc
	push de
	call SoundEngine2_TurnOffChannels
	ld a, $77
	ld [wSoundGlobalStereo], a
	jr SoundEngine2_ResetEngineVariables

SoundEngine2_Init:
	push bc
	push de
	call SoundEngine2_ResetHWVolumes
	ld a, $77
	ldh [rNR50], a
	ld [wSoundGlobalStereo], a

SoundEngine2_ResetEngineVariables:
	ld hl, wChannels
	ld de, CHANNEL_STRUCT_LENGTH
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
	ld hl, wd616
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
	ld [wd607], a
	ld [wSound2FadeEnabled], a
	ld [wSound2FadeTimer], a
	ld a, $ff
	ld [wSound2LastWaveform], a
	pop de
	pop bc
	ret

SoundEngine2_ResetHWVolumes:
	xor a
	ldh [rNR50], a
	ld a, $80
	ldh [rNR52], a

SoundEngine2_TurnOffChannels:
; reset sweep
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

SoundEngine2_CommandF4:
	inc bc
	ld a, [bc]
	push af
	ld l, a
	xor a
	ld h, a
	add hl, de
	inc bc
	ld a, [bc]
	add [hl]
	ld [hl], a
	pop af
	cp $11
	jr z, asm_003_4da8
	jp SoundEngine2_CommandSkip

asm_003_4da8:
	ld a, [hl]
	jp SoundEngine2_UseInstrument

SoundEngine2_NoteFrequencies:
INCLUDE "audio/notes.asm"

unk_003_4e6a: db $ff
unk_003_4e6b: dr $ce6b, $ce74
unk_003_4e74: dr $ce74, $ce7d
unk_003_4e7d: dr $ce7d, $ce86
unk_003_4e86: dr $ce86, $ce95
unk_003_4e95: dr $ce95, $cea2
unk_003_4ea2: dr $cea2, $cebf
unk_003_4ebf: dr $cebf, $ceda
unk_003_4eda: dr $ceda, $cef2
unk_003_4ef2: dr $cef2, $cf17

SoundEngine2_InstrumentPointers:
	dw .instrument1
	dw .instrument2
	dw .instrument3
	dw .instrument4
	dw .instrument5
	dw .instrument6
	dw .instrument7
	dw .instrument8
	dw .instrument9
	dw .instrument10
	dw .instrument11
	dw .instrument12
	dw .instrument13
	dw .instrument14
	dw .instrument15
	dw .instrument16
	dw .instrument17
	dw .instrument18
	dw .instrument19
	dw .instrument20

.instrument1:
	db $8f
	db -1

.instrument2:
	db $1f
	db -1

.instrument3:
	db $2f
	db -1

.instrument4:
	db $3f
	db -1

.instrument5:
	db $4f
	db -1

.instrument6:
	db $5f
	db -1

.instrument7:
	db $6f
	db -1

.instrument8:
	db $7f
	db -1

.instrument9:
	db $8f
	db -1

.instrument10:
	db $9f
	db -1

.instrument11:
	db $af
	db -1

.instrument12:
	db $bf
	db -1

.instrument13:
	db $cf
	db -1

.instrument14:
	db $df
	db -1

.instrument15:
	db $ef
	db -1

.instrument16:
	db $fe
	db -1

.instrument17:
	db $b2, $52, $92, $42, $72, $32, $52, $22
	db -1

.instrument18:
	db $92, $42, $72, $32, $52, $22, $32, $12
	db -1

.instrument19:
	db $b3, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43
	db -1

.instrument20:
	db $83, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23
	db -1


SoundEngine2_VibratoTables:
	dw .vibrato1
	dw .vibrato2
	dw .vibrato3
	dw .vibrato4
	dw .vibrato5
	dw .vibrato6
	dw .vibrato7
	dw .vibrato8
	dw .vibrato9
	dw .vibrato10
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11

.vibrato1
	db $0f
	db -1

.vibrato2
	db $14, $03, $f4, $03
	db -1

.vibrato3
	db $11, $22, $11, $02, $f1, $e2, $f1, $02
	db -1

.vibrato4
	db $21, $32, $21, $02, $e1, $d2, $e1, $02
	db -1

.vibrato5
	db $21, $42, $21, $02, $e1, $c2, $e1, $02
	db -1

.vibrato6
	db $31, $52, $31, $02, $d1, $b2, $d1, $02
	db -1

.vibrato7
	db $31, $62, $31, $02, $d1, $a2, $d1, $02
	db -1

.vibrato8
	db $32, $72, $32, $02, $d2, $92, $d2, $02
	db -1

.vibrato9
	db $81, $91, $a1, $b1, $c1, $d1, $e1, $f1
	db $0f, $0f, $0f, $0f, $0f, $0f
	db -1

.vibrato10
	db $31, $21, $11, $0f, $0f, $0f, $0f, $0f, $0f
	db -1

.vibrato11
	db $03, $13, $23, $13
	db -1


SoundEngine2_Waveforms:
INCLUDE "audio/wave_instruments.asm"
