SoundEngine1_Load:
	or a
	jp z, SoundEngine1_ResetSoundRegisters
	cp $a
	jp z, SoundEngine1_Fade
	push bc
	push de
	ld [wCurrentSongID], a

; Calculate song header location.
	push af
	add a
	add LOW(SoundEngine1_HeaderPointers)
	ld l, a
	ld a, HIGH(SoundEngine1_HeaderPointers)
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
	ld a, $21    ; TODO
	ld [hli], a
	ld a, $50    ; TODO
	ld [hl], a
	pop bc
	ld a, [wd402]
	push af
	add $ab    ; TODO
	ld l, a
	ld a, $4a  ; TODO
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
	jr .loop2

.asm_002_4443
	push bc
	push de
	ld [wCurrentSongID], a
	push af
	add a
	add LOW(SoundEngine1_HeaderPointers)
	ld l, a
	ld a, HIGH(SoundEngine1_HeaderPointers)
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
	jp .loop

SoundEngine1_Fade:
	ld a, 7
	ld [wSound1FadeEnabled], a
	ld [wSound1FadeTimer], a
	ret

SoundEngine1_Play:
	ld a, [wSound1FadeEnabled]
	or a
	jr z, .run_audio
	ld hl, wSound1FadeTimer
	dec [hl]
	jr nz, .run_audio

; finished fading
	ld [hl], a
	ld hl, wSoundGlobalStereo
	ld a, [hl]
	or a
	jp z, SoundEngine1_ResetSoundRegisters
	sub $11
	ld [hl], a
.run_audio
	call .ProcessAudio
	jp SoundEngine1_ApplyAudio

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
	call SoundEngine1_UpdateChannels
	call Func_002_4ab3
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
	ld [wd40d], a
	ret

SoundEngine1_UpdateChannels:
	ld hl, CHANNEL_FIELD08
	add hl, de
	inc [hl]
	dec hl
	dec [hl]
	call z, SoundEngine1_LoadNote
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
	jp nc, .fade_handler
	ld a, [wSoundCurChannel]
	and 3
	cp CHAN3
	jp z, .retrig_noise
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	jp nz, Func_002_4697
	ld hl, CHANNEL_FIELD18
	add hl, de
	ld a, [hl]
	push af
	add a
	add LOW(.envelope_jumptable)
	ld l, a
	ld a, HIGH(.envelope_jumptable)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.envelope_jumptable:
	dw .envelope_case_0
	dw .envelope_case_2
	dw .envelope_case_4
	dw .envelope_case_6
	dw .envelope_case_8
	dw Func_002_4697
	dw Func_002_4697
	dw Func_002_4697

.envelope_case_0:
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
	jr c, .envelope_case_2_entry
	call Func_002_4839
	or a
	jr z, .envelope_case_2_entry
	pop bc
	jp .envelope_case_a

.envelope_case_2:
	push bc

.envelope_case_2_entry:
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
	jr c, .envelope_case_4_entry
	call Func_002_4839
	or a
	jr z, .envelope_case_4_entry
	pop bc
	jp .envelope_case_a

.envelope_case_4:
	push bc

.envelope_case_4_entry:
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
	jr c, .envelope_case_6_entry
	jr z, .envelope_case_6_entry
	pop bc
	jp .envelope_case_a

.envelope_case_6:
	push bc

.envelope_case_6_entry:
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
	ld hl, CHANNEL_ENVELOPE_MODIFIER
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
	jr c, .envelope_case_8_entry
	call Func_002_4839
	or a
	jr z, .envelope_case_8_entry
	pop bc
	jp .envelope_case_a

.envelope_case_8_entry:
	pop bc

.envelope_case_8:
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
	jp .envelope_case_a

.retrig_noise:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	ret nz
	ld hl, CHANNEL_FIELD18
	add hl, de
	ld a, [hl]
	cp 1
	jr c, .retrig_case_0
	cp 2
	jr c, .retrig_case_1
	cp 3
	jr c, .retrig_case_2
	cp 4
	jr c, .retrig_case_3
	ret

.retrig_case_0:
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

.retrig_case_1:
	ld a, $50

.retrig_shared:
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

.retrig_case_2:
	ld a, $10
	jr .retrig_shared

.retrig_case_3:
	ld a, 0
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ret

.fade_handler:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	jr nz, Func_002_4697
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
	jr nz, .fade_set_envelope
	ld hl, CHANNEL_INSTRUMENT_VOLUME_OFFSET
	add hl, de
	dec [hl]
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a
	jr Func_002_4697

.fade_set_envelope:
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	push af
	and $f0
	ld [hl], a
	pop af
	and $f

.envelope_case_a:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a

Func_002_4697:
	ld a, [wSoundCurChannel]
	and 2
	jr nz, .done
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN_OFFSET
	add hl, de
	dec [hl]
	jp nz, .done
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	inc [hl]
	ld a, [hl]

.vibrato_loop:
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
	jr nz, .vibrato_set
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	xor a
	ld [hl], a
	jr .vibrato_loop

.vibrato_set:
	push af
	swap a
	and $f
	cp 8
	jr c, .vibrato_no_sign_ext
	or $f0

.vibrato_no_sign_ext:
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	ld [hl], a
	pop af
	and $f
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN_OFFSET
	add hl, de
	ld [hl], a

.done:
	ret

SoundEngine1_LoadNote:
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]

SoundEngine1_ReadMusic:
	ld a, [bc]
	cp $d0
	jr c, .notes_and_rests
	call SoundEngine1_CommandProcessor
	jr SoundEngine1_ReadMusic

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
	add $0e     ; TODO
	ld c, a
	ld a, $4e   ; TODO
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
	jr .note_commit

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

.note_commit
	ld hl, CHANNEL_FIELD08
	add hl, de
	xor a
	ld [hl], a
	ld a, [bc]
	and $f
	call SoundEngine1_SetLengthCounter
	ld hl, CHANNEL_LENGTH_COUNTER
	add hl, de
	ld [hl], a
	call SoundEngine1_WriteToPlayhead
	ld hl, CHANNEL_FIELD11
	add hl, de
	bit 7, [hl]
	jr z, .skip_vibrato_init
	push af
	and $f
	ld c, a
	ld hl, CHANNEL_FIELD13
	add hl, de
	ld a, [hl]
	swap a
	and $f
	push af
	call Func_002_4839
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
	call Func_002_4839
	add [hl]
	ld [hl], a

.skip_vibrato_init
	ld hl, CHANNEL_GLOBAL_STEREO_PANNING
	add hl, de
	ld a, [hli]
	or a
	jr nz, .has_stereo_panning
	ld a, [hl]
	cp 3
	jr nz, .check_stereo_panning
	ld a, 1
.check_stereo_panning
	xor 3
.has_stereo_panning
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
	jr c, .noise_skip_retrig
	cp $c
	jr nc, .noise_skip_retrig
	ld a, $cc   ; TODO
	ld [wChannel7Playhead], a
	ld a, $4e   ; TODO
	ld [wChannel7Playhead + 1], a
	ld a, [wd407]
	or $40
	ld [wd407], a
	ld a, 1
	ld [wChannel7LengthCounter], a
	ld [wChannel7], a
	xor a
	ld [wChannel7Field01], a
.noise_skip_retrig
	ld a, [bc]
	swap a
	and $f
	cp $c
	call nz, SoundEngine1_Load.asm_002_4443

.set_length
	ld a, [bc]
	and $f
	call SoundEngine1_SetLengthCounter
	ld hl, CHANNEL_LENGTH_COUNTER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD08
	add hl, de
	xor a
	ld [hl], a
	pop hl

SoundEngine1_WriteToPlayhead:
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	inc bc
	ld [hl], c
	inc hl
	ld [hl], b
	ret

SoundEngine1_SetLengthCounter:
	ld hl, CHANNEL_SPEED
	add hl, de
	or a
	jr z, SoundEngine1_LowNibbleOnlySwapped

SoundEngine1_AtimesHL:
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

SoundEngine1_LowNibbleOnlySwapped:
	ld a, [hl]
	swap a
	and $f0
	ret

Func_002_4839:
	or a
	ret z
	ld b, a
	xor a
	or c
	ret z
	cp b
	jr nc, .interp_a_geq_b
	xor a

.interp_b_times_c:
	add b
	dec c
	jr nz, .interp_b_times_c
	ret

.interp_a_geq_b:
	xor a

.interp_c_times_b:
	add c
	dec b
	jr nz, .interp_c_times_b
	ret

SoundEngine1_CommandProcessor:
	sub $e0
	jr c, .is_dx_command
	push af
	add a
	add LOW(.cmd_jumptable)
	ld l, a
	ld a, HIGH(.cmd_jumptable)
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
	jr z, .cmd_e0_ch7
	and 3
	cp CHAN3
	jr z, .cmd_e0_ch2
	ld a, [bc]
	and $33
	add a
	add a
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	call .cmd_eb
	jp .cmd_ee_entry

.cmd_e0_ch7:
	ld a, [bc]
	or a
	jr z, .cmd_e0_ch7_zero
	ld a, 8

.cmd_e0_ch7_zero:
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	jp .cmd_ee

.cmd_e0_ch2:
	dec bc
	call .cmd_ed
	ld a, [bc]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld [hli], a
	add a
	jp nc, .cmd_ee_no_flag
	inc bc
	inc hl
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

.cmd_jumptable
	dw .cmd_e0toE7
	dw .cmd_e0toE7
	dw .cmd_e0toE7
	dw .cmd_e0toE7
	dw .cmd_e0toE7
	dw .cmd_e0toE7
	dw .cmd_e0toE7
	dw .cmd_e0toE7
	dw .cmd_e8
	dw .cmd_e9
	dw .cmd_ea
	dw .cmd_eb
	dw .cmd_ec
	dw .cmd_ed
	dw .cmd_ee
	dw .cmd_ef
	dw .cmd_f0
	dw .cmd_f1
	dw .cmd_f2
	dw .cmd_f3
	dw $4df7     ; TODO
	dw .cmd_f5
	dw .cmd_f6
	dw .cmd_f7
	dw .cmd_f8
	dw .cmd_f9
	dw .cmd_fa
	dw .cmd_fb
	dw .cmd_fc
	dw .cmd_fd
	dw .cmd_fe
	dw .cmd_ff

; Ex (0-7) : set the current octave
.cmd_e0toE7
	ld a, [bc]
	and 7
	ld hl, CHANNEL_CUR_OCTAVE
	add hl, de
	jr .cmd_set_var

; E8 xy : Set instrument duty cycle pattern
.cmd_e8
	inc bc
	ld a, [wSoundCurChannel]
	cp CHAN8
	jr z, .cmd_e8_noise
	ld a, [bc]
	and $33
	add a
	add a
	ld hl, CHANNEL_FIELD0C
	add hl, de
	jr .cmd_set_var
.cmd_e8_noise
; always set the duty pattern to $08 if on noise channel
	ld a, [bc]
	or a
	jr z, .cmd_e8_no_params
	ld a, 8
.cmd_e8_no_params
	ld hl, CHANNEL_FIELD0C
	add hl, de
	jr .cmd_set_var

.cmd_e9
	ld hl, CHANNEL_FIELD0D
	add hl, de
	inc bc
	ld a, [bc]

.cmd_set_var
	ld [hl], a

; F5 : does nothing, essentially the sound engine's "nop" instruction
.cmd_f5
	inc bc
	ret

.cmd_ea
	ld hl, CHANNEL_FIELD02
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; EB xy : Set vibrato delay and type
.cmd_eb
	inc bc
; set delay in note length (x)
	ld a, [bc]
	swap a
	and $f
	ld hl, CHANNEL_SPEED
	add hl, de
	call SoundEngine1_AtimesHL
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
	add $01     ; TODO
	ld c, a
	ld a, $50   ; TODO
	adc 0
	ld b, a
	pop af

.cmd_set_word
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	pop bc
	inc bc
	ret

; EC xx : set channel transpose
.cmd_ec
	ld hl, CHANNEL_GLOBAL_TRANSPOSE
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

.cmd_ed
	ld a, [wSoundCurChannel]
	cp CHAN3
	jr z, .cmd_ed_ch3
	cp CHAN7
	jr nz, .cmd_f5
	inc bc
	ld a, [bc]
	ld [wd409], a
	inc bc
	ret

.cmd_ed_ch3
	inc bc
	ld a, [bc]
	ld [wd408], a
	inc bc
	ret

; EE xx (yy zz) : volume related stuff?
; (yy zz set only if xx > $7f)
.cmd_ee
	inc bc

.cmd_ee_entry
	ld a, [bc]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld [hli], a
	add a
	jr c, .cmd_ee_flag

.cmd_ee_no_flag
	ld a, [bc]

.cmd_ee_ptr_setup
	push bc
	push af
	add a
	add $79     ; TODO
	ld c, a
	ld a, $4f   ; TODO
	adc 0
	ld b, a
	pop af
	ld hl, CHANNEL_INSTRUMENT_POINTER
	add hl, de
	jr .cmd_set_word

.cmd_ee_flag:
	inc bc
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; EF xx : set channel fine pitch
.cmd_ef
	ld hl, CHANNEL_GLOBAL_FINE_PITCH
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

.cmd_f0
	ld hl, CHANNEL_FIELD11
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

.cmd_f1
	ld hl, CHANNEL_FIELD12
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

.cmd_f2
	ld hl, CHANNEL_FIELD13
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F3 xx : set stereo panning
.cmd_f3
	ld hl, CHANNEL_GLOBAL_STEREO_PANNING
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F6 xx : set speed only
.cmd_f6
	ld hl, CHANNEL_SPEED
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F7 xx yy : call a subpart
.cmd_f7
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
.cmd_f8
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
.cmd_f9
	ld hl, CHANNEL_RETURN_POINT_1
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

; FA : return from F8 xx yy call
.cmd_fa
	ld hl, CHANNEL_RETURN_POINT_2
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

; FB : begin a repeating phrase
.cmd_fb
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
.cmd_fc
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
.cmd_fd
	inc bc
	ld a, [bc]
	or a
	jr z, .cmd_fd_loop
	ld hl, CHANNEL_LOOP_COUNTER_1
	add hl, de
	push hl
	ld h, [hl]
	cp h
	pop hl
	jr z, .cmd_fd_done
	inc [hl]
.cmd_fd_loop
	ld hl, CHANNEL_LOOP_POINT_1
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

.cmd_fd_done
	ld [hl], 0
	jp .cmd_f5

; FE xx : same as above but uses a different variable
.cmd_fe
	inc bc
	ld a, [bc]
	or a
	jr z, .cmd_fe_loop
	ld hl, CHANNEL_LOOP_COUNTER_2
	add hl, de
	push hl
	ld h, [hl]
	cp h
	pop hl
	jr z, .cmd_fd_done
	inc [hl]
.cmd_fe_loop
	ld hl, CHANNEL_LOOP_POINT_2
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

.cmd_ff
	ld a, [wSoundCurChannel]
	push af
	add LOW(SoundEngine1_ChannelMaskTable1)
	ld c, a
	ld a, HIGH(SoundEngine1_ChannelMaskTable1)
	adc 0
	ld b, a
	pop af
	ld a, [bc]
	ld hl, wd407
	and [hl]
	ld [hl], a
	ld a, [wSoundCurChannel]
	cp CHAN5
	jr z, .cmd_ff_ch4
	and 3
	jr z, .cmd_ff_ch_03
	cp CHAN4
	jr nz, .cmd_ff_ch_other
.cmd_ff_ch_03
	ld a, 8
	jr .cmd_ff_set

.cmd_ff_ch_other
	xor a
.cmd_ff_set
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

.cmd_ff_ch4
	ld a, 8
	ldh [rNR10], a
	ld [wCh1DataCurrentSweep], a
	jr .cmd_ff_ch_03

SoundEngine1_ChannelMaskTable1:
	db $fe  ; ch1
	db $fd  ; ch2
	db $fb  ; ch3
	db $f7  ; ch4

	db $ef  ; ch5
	db $df  ; ch6
	db $bf  ; ch7
	db $7f  ; ch8

SoundEngine1_ChannelMaskTable2:
	db $01  ; ch1
	db $02  ; ch2
	db $04  ; ch3
	db $08  ; ch4

	db $10  ; ch5
	db $20  ; ch6
	db $40  ; ch7
	db $80  ; ch8

Func_002_4ab3:
	ld a, [wSoundCurChannel]
	push af
	add a
	add LOW(.output_jumptable)
	ld l, a
	ld a, HIGH(.output_jumptable)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.output_jumptable:
; music channels
	dw .Ch5
	dw .Ch6
	dw .Ch3
	dw .Ch4
; sfx channels
	dw .Ch1
	dw .Ch2
	dw .Ch7
	dw .Ch8

.Ch5:
	ld hl, wChannel5
	ld a, [hl]
	or a
	ret nz

.Ch1:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(.ch1_stereo_table)
	ld l, a
	ld a, HIGH(.ch1_stereo_table)
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

.output_ch1_common:
	or a
	jr z, .output_ch1_freq0
	ld hl, CHANNEL_FIELD0C
	add hl, de
	ld a, [hl]
	swap a
	jr .output_ch1_duty

.output_ch1_freq0:
	ld hl, CHANNEL_FIELD0C
	add hl, de
	ld a, [hl]

.output_ch1_duty:
	and $c0
	ld [bc], a
	inc bc
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [hl]
	or a
	jr nz, .output_ch1_envelope
	ld a, 8
	jr .output_ch1_env_done

.output_ch1_envelope:
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld a, [hl]

.output_ch1_env_done:
	ld [bc], a
	inc bc

.output_freq_common:
	ld hl, CHANNEL_GLOBAL_FINE_PITCH
	add hl, de
	ld a, [hl]
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	add [hl]
	inc hl
	bit 7, a
	jr nz, .output_freq_negative
	add [hl]
	inc hl
	ld [bc], a
	ld a, [hl]
	adc 0

.output_freq_hi:
	inc bc
	and 7
	ld [bc], a

.Ch4:
	ret

.output_freq_negative:
	add [hl]
	push af
	inc hl
	ld [bc], a
	pop af
	ld a, [hl]
	adc $ff
	jr .output_freq_hi

.Ch6:
	ld hl, wChannel6
	ld a, [hl]
	or a
	ret nz

.Ch2:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(.ch2_stereo_table)
	ld l, a
	ld a, HIGH(.ch2_stereo_table)
	adc 0
	ld h, a
	pop af
	ld bc, wSoundStereoChannels
	ld a, [bc]
	and $dd
	or [hl]
	ld [bc], a
	ld bc, wCh1DataCurrentSweep + 5 ; TODO
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld a, [hl]
	ld [wCh2NoteCounter], a
	jr .output_ch1_common

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
	add LOW(.ch3_stereo_table)
	ld l, a
	ld a, HIGH(.ch3_stereo_table)
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
	jr z, .output_ch3_vol0
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld a, [hl]
	swap a
	and $f
	push bc
	push af
	add LOW(.ch3_vol_table)
	ld c, a
	ld a, HIGH(.ch3_vol_table)
	adc 0
	ld b, a
	pop af
	ld a, [bc]
	pop bc

.output_ch3_vol0:
	ld [bc], a
	inc bc
	jp .output_freq_common

.Ch8:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(.ch4_stereo_table)
	ld l, a
	ld a, HIGH(.ch4_stereo_table)
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
	jr nz, .output_ch4_envelope
	ld a, 8
	jr .output_ch4_env_done

.output_ch4_envelope:
	ld hl, CHANNEL_ENVELOPE_MODIFIER
	add hl, de
	ld a, [hl]

.output_ch4_env_done:
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

.ch3_vol_table:
	db 0, $60
	db $40, $40, $40, $40, $40, $40
	db $20, $20, $20, $20, $20, $20, $20, $20

.ch1_stereo_table:
	db $11, 1, $10, $11

.ch2_stereo_table:
	db $22, 2, $20, $22

.ch3_stereo_table:
	db $44, 4, $40, $44

.ch4_stereo_table:
	db $88, 8, $80, $88

SoundEngine1_ApplyAudio:
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
	call SoundEngine1_UpdateLastData

; apply Ch1 envelope
	ld a, b
	call SoundEngine1_DoUpdateEnvelopes

; apply Ch1 note frequency
	ld a, b
	call SoundEngine1_CheckNeedUpdateLastData
	call SoundEngine1_DoUpdateFrequency

; next byte is not used
	inc c

; apply Ch2 sound length
	call SoundEngine1_UpdateLastData

; apply Ch2 envelope
	ld a, [wCh2NoteCounter]
	call SoundEngine1_DoUpdateEnvelopes

; apply Ch2 note frequency
	call SoundEngine1_UpdateLastData
	call SoundEngine1_DoUpdateFrequency

; apply Ch3 enable
	call SoundEngine1_UpdateLastData

; skip setting length
	inc hl
	inc de
	inc c

; apply Ch3 output level
	call SoundEngine1_UpdateLastData

; apply Ch3 note frequency
	call SoundEngine1_UpdateLastData
	call SoundEngine1_DoUpdateFrequency

; skip
	inc c

; skip audio length
	inc hl
	inc de
	inc c

; apply Ch4 envelope
	ld a, [wCh4DataLastEnvelope]
	call SoundEngine1_DoUpdateEnvelopes

; apply Ch4 "frequency"
	call SoundEngine1_UpdateLastData
	call SoundEngine1_DoUpdateFrequency

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
	ld a, [wd408]
	jr .UpdateWaveform

.use_other_waveform
	ld a, [wd409]

.UpdateWaveform:
; don't need to update if it's the same the last one
	ld hl, wSound1LastWaveform
	cp [hl]
	ret z

; find waveform data
	ld [hl], a
	push af
	add a
	add $7c    ; TODO
	ld l, a
	ld a, $50    ; TODO
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

SoundEngine1_DoUpdateEnvelopes:
	or a
	jr z, .write_reg
	ld a, [de]
	cp [hl]
	jr z, SoundEngine1_SkipUpdatingLastData

.write_reg:
	ld a, [hli]
	ld [de], a
	ldh [c], a
	inc hl
	set 7, [hl]
	dec hl
	inc de
	inc c
	ret

SoundEngine1_CheckNeedUpdateLastData:
	or a
	jr z, SoundEngine1_DoUpdateLastData

SoundEngine1_UpdateLastData:
	ld a, [de]
	cp [hl]
	jr z, SoundEngine1_SkipUpdatingLastData

SoundEngine1_DoUpdateLastData:
	ld a, [hl]
	ld [de], a
	ldh [c], a

SoundEngine1_SkipUpdatingLastData:
	inc hl
	inc de
	inc c
	ret

SoundEngine1_DoUpdateFrequency:
	ld a, [de]
	bit 7, a
	jr nz, .write_reg
	cp [hl]
	jr z, SoundEngine1_SkipUpdatingLastData

.write_reg:
	ld a, [hl]
	ldh [c], a
	and 7
	ld [de], a
	inc hl
	inc de
	inc c
	ret

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
	ld [wSound1FadeEnabled], a
	ld [wSound1FadeTimer], a
	ld a, $ff
	ld [wSound1LastWaveform], a
	pop de
	pop bc
	ret

SoundEngine1_ResetHWVolumes:
	xor a
	ldh [rNR50], a
	ld a, $80
	ldh [rNR52], a

SoundEngine1_TurnOffChannels:
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

	dr $8df7, $8ecc