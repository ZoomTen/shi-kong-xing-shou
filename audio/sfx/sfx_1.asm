unk_002_4ecc:
	sound_end

unk_002_4ecd:
	sound_init 1 ; speed
	note C_, 0
	note A_, 0
	note G#, 9
	note C#, 1
	note G#, 1
	octave 0
	note C#, 5
	sound_end

unk_002_4ed6:
	sound_init 2 ; speed
	note C_, 0
	note A#, 0
	note G#, 10
	note D#, 1
	retrigger $e0, $1e
	sound_end

unk_002_4edf:
	sound_init 1 ; speed
	note C_, 0
	note A_, 0
	note G#, 9
	note C#, 1
	note B_, 1
	octave 1
	note B_, 7
	sound_end

unk_002_4ee8:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 3
	note F_, 1
	note D_, 1
	octave 2
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	octave 1
	note B_, 1
	note G#, 1
	sound_end

unk_002_4ef7:
	sound_init 1 ; speed
	note C#, 1
	note C_, 0
	note C_, 9
	octave 5
	note D#, 2
	envelope_setting $6
	note D#, 1
	envelope_setting $2
	note D#, 1
	sound_end

unk_002_4f04:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 4
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f21:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 4
	note D#, 1
	note C_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f3c:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f54:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 3
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f6a:
	sound_init 7, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $90, \ ; volume envelope
	           0, 10, \ ; vibrato
	           $e5, $4, $14 ; envelope mode, params
	note D_, 4
	note D#, 4
	note E_, 4
	note F_, 4
	note F#, 4
	note G_, 4
	sound_end

unk_002_4f78:
	sound_end

SoundEngine1_InstrumentPointers:
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


SoundEngine1_VibratoTables:
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
