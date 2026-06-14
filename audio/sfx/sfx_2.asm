unk_003_50fc:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $25
	octave 2
	note D#, 8
	envelope_setting $2
	octave 3
	note D#, 4
	sound_end

unk_003_510a:
	sound_init 1 ; speed
	note C#, 1
	envelope_mode $f
	octave 5
	note G_, 2
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	duty_cycle DUTY_12, DUTY_12
	octave 5
	note F#, 2
	octave 1
	note C#, 2
	envelope_setting $c
	note C#, 2
	envelope_setting $8
	note C#, 2
	envelope_setting $4
	note C#, 2
	sound_end

unk_003_5126:
	sound_init 2 ; speed
	note C#, 1
	envelope_mode $f
	octave 5
	note G_, 2
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	duty_cycle DUTY_12, DUTY_12
	octave 2
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	envelope_setting $c
	note C_, 2
	envelope_setting $8
	note C_, 2
	envelope_setting $6
	note C_, 2
	envelope_setting $4
	note C_, 2
	envelope_setting $2
	note C_, 2
	sound_end

unk_003_514b:
	sound_init 3, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	octave 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	sound_end

unk_003_515c:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $a0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9a, $31, $f3 ; envelope mode, params
	octave 3
	note A_, 1
	octave 4
	note D_, 2
	rest 1
	octave 3
	note A_, 1
	octave 4
	note D_, 2
	rest 1
	sound_end

unk_003_516e:
	sound_init 3, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	mark_loop
	octave 4
	note C#, 1
	note D#, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note A#, 1
	octave 5
	note C_, 1
	note C#, 1
	envelope_setting $8
	repeat_loop 1
	sound_end

unk_003_5183:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $c0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1d
	octave 1
	note F#, 2
	rest 1
	sweep $1e
	octave 2
	note D#, 8
	envelope_setting $3
	note D#, 6
	sound_end

unk_003_5195:
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $f
	octave 4
	note B_, 1
	note A#, 1
	rest 1
	octave 1
	note D_, 3
	envelope_setting $c
	note D_, 1
	note D#, 1
	envelope_setting $9
	note E_, 1
	note F_, 1
	envelope_setting $6
	note F#, 1
	note G_, 1
	envelope_setting $3
	note G_, 1
	note G_, 1
	sound_end

unk_003_51b0:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $2e
	rest 1
	octave 4
	speed 2
	note C#, 7
	envelope_setting $c
	note C#, 7
	envelope_setting $8
	note C#, 7
	envelope_setting $6
	note C#, 7
	envelope_setting $4
	note C#, 7
	envelope_setting $2
	note C#, 7
	sound_end

unk_003_51cc:
	sound_init 1 ; speed
	note C#, 1
	octave 0
	note C_, 14
	octave 3
	note G_, 2
	note F#, 2
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	rest 1
	note E_, 3
	sound_end

unk_003_51db:
	sound_init 1 ; speed
	note C#, 1
	envelope_mode $f
	octave 6
	mark_loop
	note C_, 2
	note C#, 2
	note C_, 1
	note C#, 1
	rest 1
	repeat_loop 4
	duty_cycle DUTY_12, DUTY_12
	octave 4
	note C_, 2
	note C#, 2
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 2
	octave 2
	note C_, 2
	note C#, 2
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 2
	sound_end

unk_003_51fd:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	octave 4
	note E_, 1
	note C_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note C_, 1
	sound_end

unk_003_520c:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f2 ; envelope mode, params
	octave 4
	note G#, 3
	octave 5
	note F_, 0
	sound_end

unk_003_5218:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f2 ; envelope mode, params
	fine_pitch $2
	octave 4
	note G#, 3
	octave 5
	note F_, 0
	sound_end

unk_003_5226:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $e0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9e, $21, $81 ; envelope mode, params
	octave 3
	note G#, 7
	note C#, 7
	sound_end

unk_003_5231:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_50, \ ; duty cycle
	           $c0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $98, $11, $f1 ; envelope mode, params
	octave 3
	note C_, 4
	note E_, 4
	note G_, 4
	note A#, 4
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_50, \ ; duty cycle
	           $50, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $91, $11, $f1 ; envelope mode, params
	octave 3
	note E_, 4
	note G_, 4
	note A#, 4
	sound_end

unk_003_5249:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $a0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	sweep $1e
	octave 7
	note C#, 2
	sweep $17
	octave 4
	note D_, 6
	envelope_setting $4
	note D_, 6
	sound_end

unk_003_525a:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_25, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1e
	octave 6
	note C#, 4
	rest 2
	sweep $25
	envelope_setting $a
	octave 2
	note F#, 6
	octave 4
	note C#, 4
	envelope_setting $8
	octave 2
	note F#, 6
	octave 4
	note C#, 4
	envelope_setting $6
	octave 2
	note F#, 6
	octave 4
	note C#, 4
	envelope_setting $4
	octave 2
	note F#, 6
	octave 4
	note C#, 4
	envelope_setting $2
	octave 2
	note F#, 6
	octave 4
	note C#, 4
	sound_end

unk_003_5285:
	sound_init 1 ; speed
	note C#, 1
	rest 0
	note C_, 14
	octave 1
	note C#, 2
	envelope_setting $8c, $10, $11
	note C_, 4
	sound_end

unk_003_5291:
	sound_init 1 ; speed
	note C_, 0
	note C_, 0
	note C_, 14
	octave 1
	note D#, 1
	duty_cycle DUTY_25, DUTY_25
	envelope_setting $a
	octave 0
	note C_, 1
	envelope_setting $e
	octave 4
	note D#, 1
	envelope_setting $8
	octave 4
	note D#, 2
	sound_end

unk_003_52a6:
	sound_init 1 ; speed
	note C#, 1
	envelope_mode $f
	octave 5
	note G_, 2
	note F_, 1
	note G_, 1
	rest 2
	note G_, 2
	note F_, 1
	note D_, 1
	duty_cycle DUTY_12, DUTY_12
	octave 2
	note F_, 3
	envelope_setting $c
	note D#, 3
	envelope_setting $a
	note D_, 3
	envelope_setting $8
	note C#, 3
	envelope_setting $7
	note C#, 3
	envelope_setting $6
	note C#, 3
	envelope_setting $5
	note C#, 3
	envelope_setting $4
	note C#, 3
	envelope_setting $2
	note C#, 3
	sound_end

unk_003_52cf:
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $f
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	duty_cycle DUTY_12, 11
	note G_, 1
	rest 3
	sound_init 2 ; speed
	note C_, 0
	envelope_mode $8f
	note D_, 3
	retrigger $e3, $2c
	sound_end

unk_003_52e5:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $0, \ ; volume envelope
	           1, 7, \ ; vibrato
	           $8 ; envelope mode
	octave 4
	mark_loop
	note D_, 15
	repeat_loop 0
	sound_end

unk_003_52f0:
	sound_init 8, \ ; speed
	           DUTY_75, DUTY_75, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	octave 1
	note D#, 4
	envelope_setting $2
	note D#, 1
	sound_end

unk_003_52fb:
	sound_init 8, \ ; speed
	           DUTY_75, DUTY_75, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	octave 0
	note B_, 4
	envelope_setting $2
	note B_, 1
	sound_end

unk_003_5306:
	sound_init 4, \ ; speed
	           DUTY_75, DUTY_75, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	envelope_setting $8
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	envelope_setting $3
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	sound_end

unk_003_5325:
	sound_init 4, \ ; speed
	           DUTY_75, DUTY_75, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $8 ; envelope mode
	rest 1
	fine_pitch $1
	stereo_panning STEREO_ALTERNATING
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	envelope_setting $4
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	envelope_setting $2
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	sound_end

unk_003_5349:
	sound_init 1 ; speed
	note C_, 0
	note C_, 0
	note C_, 14
	octave 3
	note G_, 1
	duty_cycle DUTY_25, DUTY_25
	envelope_setting $8
	octave 0
	note C_, 1
	duty_cycle DUTY_12, DUTY_12
	envelope_setting $4
	octave 3
	note G_, 3
	envelope_setting $2
	note G_, 3
	sound_end

unk_003_535f:
	sound_init 1, \ ; speed
	           DUTY_75, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1c
	octave 5
	note D#, 5
	rest 1
	octave 3
	note D#, 5
	rest 1
	octave 3
	note F_, 9
	envelope_setting $9
	octave 3
	note G#, 9
	envelope_setting $5
	octave 3
	note E_, 9
	envelope_setting $3
	octave 3
	note F_, 9
	sound_end

unk_003_537b:
	sound_init 1 ; speed
	note C#, 1
	note C_, 0
	note C_, 14
	octave 7
	note C#, 1
	envelope_setting $c
	note D_, 1
	envelope_setting $a
	note C#, 1
	rest 3
	envelope_setting $e
	octave 7
	note C#, 1
	envelope_setting $c
	note D_, 1
	envelope_setting $a
	note C#, 1
	rest 2
	envelope_setting $e
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	rest 1
	envelope_setting $c
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	sound_init 3 ; speed
	note C_, 0
	note A#, 0
	note G#, 10
	note D_, 2
	stereo_panning $e5
	note E_, 10
	sound_end

unk_003_53aa:
	sound_init 1, \ ; speed
	           DUTY_75, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1b
	octave 4
	note D_, 5
	rest 1
	octave 4
	note A_, 8
	envelope_setting $8
	note F_, 8
	envelope_setting $4
	note F_, 8
	sound_end

unk_003_53bd:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1d
	octave 2
	note C#, 3
	sweep $14
	octave 0
	note G#, 8
	envelope_setting $c
	note G#, 8
	envelope_setting $8
	note G#, 8
	envelope_setting $4
	note G#, 8
	envelope_setting $2
	note G#, 8
	sound_end

unk_003_53d7:
	sound_init 1 ; speed
	note C#, 1
	rest 0
	note C_, 14
	octave 1
	note F_, 2
	note D#, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note F#, 2
	note E_, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	note C#, 2
	envelope_setting $8
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	envelope_setting $4
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	envelope_setting $2
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	sound_end

unk_003_5403:
	sound_init 1 ; speed
	note C_, 0
	rest 0
	note C_, 14
	octave 0
	note F#, 2
	duty_cycle DUTY_25, DUTY_25
	note E_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	envelope_setting $8
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	envelope_setting $4
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	sound_end

unk_003_5420:
	sound_init 1 ; speed
	note C_, 0
	rest 0
	note C_, 14
	octave 0
	note C_, 3
	note C#, 3
	note D_, 2
	note D#, 2
	note E_, 1
	note F_, 1
	sound_end

unk_003_542c:
	sound_init 1 ; speed
	note C_, 0
	rest 0
	note C_, 8
	octave 3
	note G_, 3
	envelope_setting $b
	note F#, 3
	envelope_setting $e
	note F_, 2
	note E_, 2
	note D#, 1
	note D_, 1
	sound_end

unk_003_543c:
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $8f
	note D_, 1
	envelope_param2 $e5
	rest 1
	speed 2
	note D#, 1
	note D_, 1
	note D#, 10
	sound_end

unk_003_544a:
	sound_init 3, \ ; speed
	           DUTY_75, DUTY_12, \ ; duty cycle
	           $b1, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $d ; envelope mode
	sweep $1f
	octave 6
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note G_, 1
	note D#, 1
	octave 5
	note B_, 1
	note G_, 1
	note D#, 1
	octave 4
	note B_, 1
	note G_, 1
	note D#, 1
	octave 3
	note B_, 1
	note G_, 1
	note D#, 1
	envelope_setting $6
	octave 3
	note B_, 1
	note G_, 1
	note D#, 1
	envelope_setting $3
	octave 3
	note B_, 1
	note G_, 1
	note D#, 1
	sound_end

unk_003_5471:
	sound_init 1 ; speed
	note C_, 0
	rest 0
	note C_, 15
	octave 2
	note G_, 3
	note F#, 2
	envelope_setting $c
	note F_, 2
	envelope_setting $a
	note E_, 1
	note D#, 1
	note D_, 1
	sound_end

unk_003_5481:
	speed 1
	rest 1
	sound_init 15 ; speed
	note C_, 0
	rest 0
	note G#, 12
	note D_, 9
	note E_, 15
	octave 3
	note D_, 6
	sound_end

unk_003_548d:
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $f
	octave 3
	note C#, 1
	note D#, 1
	rest 1
	octave 1
	note C#, 2
	rest 1
	sound_init 2 ; speed
	note C_, 0
	envelope_mode $8f
	note D_, 3
	retrigger $e3, $36
	sound_end

unk_003_54a1:
	sound_init 14, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $b0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $93, $f0, $8f ; envelope mode, params
	octave 4
	note G_, 1
	note A#, 1
	octave 5
	vibrato 0, 8
	note C_, 5
	vibrato 0, 9
	octave 4
	note A#, 1
	vibrato 0, 8
	octave 5
	note D_, 6
	sound_end

unk_003_54b8:
	sound_end

unk_003_54b9:
	sound_init 1 ; speed
	note C#, 1
	note C_, 0
	note C_, 14
	octave 6
	note F#, 1
	note C#, 1
	rest 3
	note D#, 1
	note C#, 1
	rest 3
	duty_cycle DUTY_12, DUTY_12
	octave 3
	note F#, 1
	note F_, 1
	rest 4
	envelope_setting $8
	note F#, 1
	note F_, 1
	rest 4
	envelope_setting $6
	note F#, 1
	note F_, 1
	rest 4
	envelope_setting $3
	note F#, 1
	note F_, 1
	sound_end

unk_003_54d9:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $c0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $2e
	octave 2
	note A#, 2
	sweep $25
	note F#, 4
	sound_end

unk_003_54e6:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1b
	octave 4
	note D#, 3
	rest 1
	note B_, 6
	envelope_setting $c
	note D#, 6
	envelope_setting $8
	note D#, 6
	envelope_setting $4
	note D#, 6
	sound_end

unk_003_54fb:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1c
	octave 3
	rest 1
	note D#, 5
	rest 1
	note D#, 5
	rest 1
	note D#, 5
	rest 1
	note F_, 9
	envelope_setting $c
	note G#, 9
	envelope_setting $8
	note E_, 9
	envelope_setting $4
	note C#, 9
	sound_end

unk_003_5515:
	sound_init 1 ; speed
	note C#, 1
	note C_, 0
	note C_, 14
	octave 7
	mark_loop
	envelope_setting $e
	octave 7
	rest 1
	note C#, 1
	envelope_setting $c
	note D_, 2
	envelope_setting $a
	note C#, 1
	rest 2
	repeat_loop 2
	envelope_setting $e
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	rest 1
	envelope_setting $c
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	envelope_setting $a
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	envelope_setting $8
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	sound_end

unk_003_5544:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_50, \ ; duty cycle
	           $80, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1c
	octave 3
	rest 1
	note D#, 3
	rest 1
	note D#, 3
	duty_cycle DUTY_50, DUTY_50
	sweep $1b
	stereo_panning STEREO_ALTERNATING
	octave 3
	rest 1
	note G_, 7
	rest 1
	note G_, 7
	envelope_setting $c
	note G_, 8
	envelope_setting $8
	note G_, 8
	envelope_setting $4
	note G_, 8
	sound_end

unk_003_5565:
	sound_init 1 ; speed
	note C#, 1
	envelope_mode $f
	octave 7
	mark_loop
	envelope_setting $e
	octave 7
	rest 1
	note C#, 1
	envelope_setting $c
	note D_, 1
	envelope_setting $a
	note C#, 1
	rest 1
	repeat_loop 1
	octave 5
	envelope_setting $c
	note G_, 2
	note F_, 1
	note D_, 1
	note G_, 2
	note F_, 1
	note D_, 1
	envelope_setting $8
	note G_, 2
	note F_, 1
	note D_, 1
	note G_, 2
	note F_, 1
	note D_, 1
	envelope_setting $6
	note G_, 2
	note F_, 1
	note D_, 1
	note G_, 2
	note F_, 1
	note D_, 1
	sound_end

unk_003_5593:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $25
	octave 2
	note D_, 8
	envelope_setting $2
	octave 3
	note D_, 4
	sound_end

unk_003_55a1:
	sound_init 1 ; speed
	note C#, 1
	envelope_mode $f
	octave 5
	note F_, 2
	note E_, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note C#, 1
	note G_, 1
	duty_cycle DUTY_12, DUTY_12
	octave 5
	note F#, 2
	octave 1
	note C#, 2
	envelope_setting $c
	note C#, 2
	envelope_setting $8
	note C#, 2
	envelope_setting $4
	note C#, 2
	sound_end

unk_003_55bd:
	sound_init 2 ; speed
	note C#, 1
	envelope_mode $f
	octave 5
	note F_, 2
	note E_, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note C#, 1
	note G_, 1
	duty_cycle DUTY_12, DUTY_12
	octave 2
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 1
	envelope_setting $c
	note C_, 2
	envelope_setting $8
	note C_, 2
	envelope_setting $6
	note C_, 2
	envelope_setting $4
	note C_, 2
	envelope_setting $2
	note C_, 2
	sound_end

unk_003_55e2:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $25
	octave 2
	note D_, 8
	envelope_setting $2
	octave 3
	note D_, 4
	sound_end

unk_003_55f0:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	sound_call unk_003_5602
	sound_call unk_003_5602
	mark_loop
	sound_call unk_003_5622
	repeat_loop 0
	sound_end

unk_003_5602:
	octave 0
	note G_, 1
	octave 1
	note C_, 1
	octave 0
	note A_, 1
	octave 1
	note D_, 1
	octave 0
	note G_, 1
	octave 0
	note B_, 1
	octave 1
	note E_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note D#, 1
	note G#, 1
	note D_, 1
	note E_, 1
	note A_, 1
	note F_, 1
	note A#, 1
	note E_, 1
	note F_, 1
	note B_, 1
	note E_, 1
	note F_, 1
	sound_ret

unk_003_5622:
	octave 0
	note G_, 1
	octave 1
	note C_, 1
	octave 0
	note A_, 1
	octave 1
	note D_, 1
	octave 0
	note G_, 1
	octave 0
	note B_, 1
	octave 1
	note E_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	sound_ret

unk_003_5634:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	sound_call unk_003_5646
	sound_call unk_003_5646
	mark_loop
	sound_call unk_003_5659
	repeat_loop 0
	sound_end

unk_003_5646:
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note C_, 1
	note G_, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note A_, 1
	sound_ret

unk_003_5659:
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	octave 2
	note B_, 1
	sound_ret

unk_003_5664:
	sound_init 3, \ ; speed
	           DUTY_25, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	transpose 1
	octave 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	sound_end

unk_003_5677:
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $a1, \ ; volume envelope
	           4, 2, \ ; vibrato
	           $8b, $16, $a1 ; envelope mode, params
	mark_loop
	octave 2
	note C_, 4
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	octave 2
	note A_, 4
	rest 4
	repeat_loop 0
	sound_end

unk_003_5690:
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $a1, \ ; volume envelope
	           4, 2, \ ; vibrato
	           $8b, $16, $a1 ; envelope mode, params
	mark_loop
	octave 2
	note E_, 1
	octave 3
	note E_, 1
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F#, 1
	octave 3
	note F#, 1
	octave 2
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G#, 1
	octave 3
	note G#, 1
	octave 2
	note A_, 1
	octave 3
	note A_, 1
	octave 2
	note A_, 4
	rest 6
	repeat_loop 0
	sound_end

unk_003_56b6:
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $a1, \ ; volume envelope
	           4, 2, \ ; vibrato
	           $8b, $16, $a1 ; envelope mode, params
	mark_loop
	volume_envelope $a1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note C_, 1
	note G_, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note A_, 1
	octave 3
	note E_, 1
	note A_, 1
	volume_envelope $91
	note E_, 1
	note A_, 1
	volume_envelope $81
	note E_, 1
	note A_, 1
	volume_envelope $71
	note E_, 1
	note A_, 1
	volume_envelope $61
	note E_, 1
	note A_, 1
	volume_envelope $51
	note E_, 1
	note A_, 1
	rest 6
	repeat_loop 0
	sound_end

unk_003_56ed:
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6

unk_003_56f4:
	octave 2
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	octave 3
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	envelope_setting $b
	octave 5
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
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
	sound_end

unk_003_571a:
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6
	octave 3
	note C_, 1
	sound_call unk_003_56f4

unk_003_5726:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	mark_loop
	octave 0
	note G_, 1
	octave 1
	note C_, 1
	octave 0
	note A_, 1
	octave 1
	note D_, 1
	octave 0
	note B_, 1
	octave 1
	note E_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D#, 1
	note G#, 1
	note D#, 1
	repeat_loop 1
	mark_loop
	note E_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note G_, 1
	note B_, 1
	note G_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	octave 1
	note G#, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	octave 1
	note G#, 1
	repeat_loop 1
	sound_call unk_003_5779
	transpose 12
	sound_call unk_003_5779
	transpose 24
	sound_call unk_003_5779
	transpose 36
	sound_call unk_003_5779
	transpose 48
	mark_loop2
	sound_call unk_003_57b4
	repeat_loop2 0
	sound_end

unk_003_5779:
	mark_loop
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	octave 1
	note A_, 1
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	octave 1
	note A#, 1
	octave 1
	note B_, 1
	octave 2
	note D#, 1
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note E_, 1
	note C_, 1
	repeat_loop 1
	mark_loop
	note C#, 1
	note F_, 1
	note C#, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	repeat_loop 1
	mark_loop
	note F_, 1
	note A_, 1
	note F_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note G#, 1
	octave 3
	note C_, 1
	octave 2
	note G#, 1
	repeat_loop 1
	mark_loop
	sound_ret

unk_003_57b4:
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	octave 1
	note A_, 1
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	octave 1
	note A#, 1
	octave 1
	note B_, 1
	octave 2
	note D#, 1
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note E_, 1
	note C_, 1
	sound_ret

unk_003_57cb:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode

unk_003_57d0:
	envelope_setting $b
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
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
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 1
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 0
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	sound_end

unk_003_57f3:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	octave 6
	note C_, 1
	sound_call unk_003_57d0

unk_003_57fd:
	sound_init 2 ; speed
	note C#, 1
	envelope_mode $f
	duty_cycle DUTY_12, DUTY_12
	octave 2
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 1
	envelope_setting $c
	note C_, 2
	envelope_setting $8
	note C_, 2
	envelope_setting $6
	note C_, 2
	envelope_setting $4
	note C_, 2
	envelope_setting $2
	note C_, 2
	sound_end

unk_003_581a:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f1 ; envelope mode, params
	octave 4
	note F_, 4
	octave 5
	note A#, 12
	sound_end

unk_003_5826:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f1 ; envelope mode, params
	fine_pitch $2
	octave 4
	note G#, 4
	octave 5
	note A#, 12
	sound_end

unk_003_5834:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f1 ; envelope mode, params
	octave 3
	note C#, 4
	octave 4
	note C_, 12
	sound_end

unk_003_5840:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f1 ; envelope mode, params
	fine_pitch $2
	octave 3
	note E_, 4
	octave 4
	note C_, 12
	sound_end

unk_003_584e:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	transpose 48
	mark_loop2
	sound_call unk_003_57b4
	repeat_loop2 0
	sound_end

unk_003_585c:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	mark_loop
	octave 0
	note G_, 1
	octave 1
	note C_, 1
	octave 0
	note A_, 1
	octave 1
	note D_, 1
	octave 0
	note B_, 1
	octave 1
	note E_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D#, 1
	note G#, 1
	note D#, 1
	repeat_loop 1
	mark_loop
	octave 1
	note E_, 1
	note G#, 1
	note F_, 1
	note A_, 1
	note F#, 1
	note A#, 1
	note G_, 1
	note B_, 1
	note G#, 1
	octave 2
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	repeat_loop 1
	sound_call unk_003_589a
	transpose 12
	sound_call unk_003_589a
	transpose 24
	sound_call unk_003_589a
	sound_end

unk_003_589a:
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	octave 1
	note B_, 1
	octave 2
	note D#, 1
	octave 2
	note C_, 1
	note E_, 1
	note C#, 1
	note F_, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note G_, 1
	note E_, 1
	note G#, 1
	note F_, 1
	note A_, 1
	note F#, 1
	note A#, 1
	note G_, 1
	note B_, 1
	note G#, 1
	octave 3
	note C_, 1
	octave 2
	note G#, 1
	sound_ret

unk_003_58bd:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode

unk_003_58c2:
	envelope_setting $b
	envelope_setting $8
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
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
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 1
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 0
	note A_, 2
	note F#, 2
	note D#, 2
	envelope_setting $1
	note C_, 4
	envelope_setting $3
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 1
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 0
	note A_, 2
	note F#, 2
	note D#, 2
	envelope_setting $1
	note C_, 8
	envelope_setting $2
	octave 2
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 1
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 0
	note A_, 2
	note F#, 2
	note D#, 2
	envelope_setting $1
	note C_, 12
	octave 2
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 1
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	octave 0
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	sound_end

unk_003_5923:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	octave 6
	note C_, 1
	sound_call unk_003_58c2

unk_003_592d:
	sound_init 2 ; speed
	note C#, 1
	envelope_mode $f
	duty_cycle DUTY_12, DUTY_12
	octave 2
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 1
	envelope_setting $c
	note C_, 2
	envelope_setting $8
	note C_, 2
	envelope_setting $6
	note C_, 2
	envelope_setting $4
	note C_, 2
	envelope_setting $2
	note C_, 2
	sound_end

unk_003_594a:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $a1, \ ; volume envelope
	           4, 2, \ ; vibrato
	           $8b, $16, $a1 ; envelope mode, params
	mark_loop
	envelope_setting $a
	octave 2
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	envelope_setting $b
	note F#, 1
	note B_, 1
	envelope_setting $c
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	envelope_setting $7
	note C_, 1
	note F_, 1
	envelope_setting $d
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	envelope_setting $c
	note D#, 1
	note G#, 1
	envelope_setting $b
	note C#, 1
	note F#, 1
	envelope_setting $a
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	envelope_setting $8
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $7
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $6
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $5
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $4
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $3
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $2
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	rest 10
	repeat_loop 0
	sound_end

unk_003_59cb:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $a1, \ ; volume envelope
	           4, 2, \ ; vibrato
	           $8b, $16, $a1 ; envelope mode, params
	mark_loop
	envelope_setting $a
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $b
	octave 2
	note A#, 1
	octave 3
	note D_, 1
	envelope_setting $c
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	envelope_setting $7
	note D_, 1
	note G_, 1
	envelope_setting $d
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	envelope_setting $c
	note D#, 1
	note G#, 1
	envelope_setting $b
	note C#, 1
	note F#, 1
	envelope_setting $a
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	envelope_setting $8
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $7
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $6
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $5
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $4
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $3
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $2
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	envelope_setting $1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	rest 10
	repeat_loop 0
	sound_end

unk_003_5a55:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $a1, \ ; volume envelope
	           4, 2, \ ; vibrato
	           $8b, $16, $a1 ; envelope mode, params
	mark_loop
	envelope_setting $a
	octave 2
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	octave 2
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $a
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $9
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $8
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $7
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $6
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $5
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $4
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	envelope_setting $3
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	rest 0
	rest 0
	repeat_loop 0
	sound_end

unk_003_5ade:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $a1, \ ; volume envelope
	           4, 2, \ ; vibrato
	           $8b, $16, $a1 ; envelope mode, params
	mark_loop
	envelope_setting $a
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note A#, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	envelope_setting $a
	note C_, 1
	note G_, 1
	envelope_setting $9
	note C_, 1
	note G_, 1
	envelope_setting $8
	note C_, 1
	note G_, 1
	envelope_setting $7
	note C_, 1
	note G_, 1
	envelope_setting $6
	note C_, 1
	note G_, 1
	envelope_setting $5
	note C_, 1
	note G_, 1
	envelope_setting $4
	note C_, 1
	note G_, 1
	envelope_setting $3
	note C_, 1
	note G_, 1
	rest 0
	rest 0
	repeat_loop 0
	sound_end

unk_003_5b53:
	sound_init 1 ; speed
	note C#, 1
	envelope_mode $f
	octave 5
	note F_, 2
	note E_, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note C#, 1
	note G_, 1
	duty_cycle DUTY_12, DUTY_12
	octave 5
	note F#, 2
	octave 1
	note C#, 2
	envelope_setting $c
	note C#, 2
	envelope_setting $8
	note C#, 2
	envelope_setting $4
	note C#, 2
	sound_end

unk_003_5b6f:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	octave 6
	rest 8
	envelope_setting $8
	octave 2
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	sound_end

unk_003_5b99:
	sound_init 2, \ ; speed
	           DUTY_75, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1c
	octave 5
	note D#, 5
	rest 1
	octave 3
	note D#, 5
	envelope_setting $b
	octave 3
	note F_, 9
	envelope_setting $9
	octave 3
	note G#, 9
	envelope_setting $8
	octave 3
	note E_, 9
	envelope_setting $7
	octave 3
	note F_, 9
	envelope_setting $6
	octave 3
	note G#, 9
	envelope_setting $5
	octave 3
	note E_, 9
	envelope_setting $4
	octave 3
	note F_, 9
	envelope_setting $3
	octave 3
	note G#, 9
	envelope_setting $2
	octave 3
	note E_, 9
	envelope_setting $1
	octave 3
	note F_, 9
	sound_end

unk_003_5bce:
	sound_init 1, \ ; speed
	           $5, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	stereo_panning STEREO_ALTERNATING
	sound_call unk_003_5c01
	envelope_setting $c
	sound_call unk_003_5c01
	envelope_setting $a
	sound_call unk_003_5c01
	envelope_setting $8
	sound_call unk_003_5c01
	envelope_setting $6
	sound_call unk_003_5c01
	envelope_setting $4
	sound_call unk_003_5c01
	envelope_setting $3
	sound_call unk_003_5c01
	envelope_setting $2
	sound_call unk_003_5c01
	envelope_setting $1
	sound_call unk_003_5c01
	sound_end

unk_003_5c01:
	mark_loop
	octave 1
	note C_, 1
	octave 0
	note G_, 1
	note E_, 1
	note C_, 1
	repeat_loop 4
	sound_ret

unk_003_5c0b:
	sound_init 2 ; speed
	note C#, 1
	note C_, 0
	note C_, 14
	sound_call2 unk_003_5c27
	sound_call2 unk_003_5c27
	sound_call2 unk_003_5c27
	sound_call2 unk_003_5c27
	envelope_setting $c
	mark_loop2
	sound_call2 unk_003_5c27
	retrigger $11, $ff
	repeat_loop2 7
	sound_end

unk_003_5c27:
	octave 7
	note C#, 1
	retrigger $11, $fe
	note D_, 1
	retrigger $11, $fe
	note C#, 1
	retrigger $11, $4
	rest 1
	sound_ret2

unk_003_5c36:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_25, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1f
	octave 5
	note B_, 6
	sound_end

unk_003_5c40:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f2 ; envelope mode, params
	octave 4
	note C#, 3
	octave 6
	note C_, 0
	sound_end

unk_003_5c4c:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9f, $21, $f2 ; envelope mode, params
	fine_pitch $2
	octave 4
	note C#, 3
	octave 6
	note C_, 0
	sound_end

unk_003_5c5a:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_25, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1e
	octave 5
	note B_, 4
	rest 2
	sweep $26
	envelope_setting $a
	octave 3
	note E_, 6
	octave 4
	note B_, 4
	envelope_setting $8
	octave 3
	note E_, 6
	octave 4
	note B_, 4
	envelope_setting $4
	octave 3
	note E_, 6
	octave 4
	note B_, 4
	sound_end

unk_003_5c79:
	sound_init 2, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $a0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9a, $31, $f3 ; envelope mode, params
	octave 1
	note A_, 1
	octave 2
	note D_, 2
	rest 1
	octave 2
	note A_, 1
	octave 3
	note D_, 2
	rest 1
	sound_end

unk_003_5c8b:
	sound_end

unk_003_5c8c:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 7, \ ; vibrato
	           $8 ; envelope mode
	octave 4
	note G#, 12
	sound_end

unk_003_5c94:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6

unk_003_5c9b:
	octave 1
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	rest 1
	octave 2
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	rest 1
	octave 3
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	rest 1
	envelope_setting $b
	octave 5
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	speed 2
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

unk_003_5cd6:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6
	octave 3
	note C_, 1
	sound_call unk_003_5c9b

unk_003_5ce2:
	sound_init 1 ; speed
	note C#, 1
	sound_init 1 ; speed
	note C_, 14
	octave 3
	note F#, 1
	duty_cycle DUTY_25, DUTY_25
	rest 1
	octave 1
	note D_, 1
	octave 2
	note A_, 1
	sound_end

unk_003_5cf0:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $e1, \ ; volume envelope
	           1, 7, \ ; vibrato
	           $8 ; envelope mode
	octave 3
	duty_cycle DUTY_12, DUTY_12
	envelope_setting $f
	transpose -6
	note C_, 4
	note E_, 1
	note F_, 2
	note F#, 2
	note G_, 6
	note G#, 15
	note G#, 2
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	envelope_setting $6
	duty_cycle DUTY_25, DUTY_25
	note D_, 4
	note C#, 15
	envelope_setting $3
	note C#, 6
	sound_end

unk_003_5d12:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 15, \ ; vibrato
	           $e3, $1, $21 ; envelope mode, params
	note E_, 1
	note F#, 1
	duty_cycle DUTY_12, 11
	envelope_setting $a
	note G_, 1
	rest 3
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $a0, \ ; volume envelope
	           8, 15, \ ; vibrato
	           $23 ; envelope mode
	retrigger $ee, $6
	octave 3
	note D_, 1
	envelope_setting $4
	note D_, 1
	sound_end

unk_003_5d2f:
	sound_init 1 ; speed
	note D_, 0
	envelope_mode $f
	duty_cycle DUTY_50, DUTY_12
	octave 2
	note F_, 3
	envelope_setting $c
	note D#, 3
	envelope_setting $a
	note D_, 3
	envelope_setting $8
	note C#, 3
	envelope_setting $7
	note C#, 3
	envelope_setting $6
	note C#, 3
	envelope_setting $5
	note C#, 3
	envelope_setting $4
	note C#, 3
	envelope_setting $2
	note C#, 3
	sound_end

unk_003_5d50:
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $f
	envelope_setting $a
	octave 3
	note C_, 3
	note D_, 3
	note E_, 2
	note F#, 1
	duty_cycle DUTY_25, 6
	note G_, 1
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $8f
	note D_, 3
	retrigger $e3, $21
	envelope_setting $b
	octave 5
	note C#, 2
	envelope_setting $e
	note C#, 2
	envelope_setting $c
	note C#, 1
	envelope_setting $9
	note C#, 1
	envelope_setting $7
	note C_, 1
	envelope_setting $5
	note C_, 1
	envelope_setting $3
	note C_, 1
	sound_end

unk_003_5d7d:
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $f
	envelope_setting $9
	octave 3
	note C_, 3
	note C#, 2
	note D_, 1
	duty_cycle DUTY_25, 6
	sound_init 1 ; speed
	note D_, 2
	envelope_mode $8f
	note D_, 3
	retrigger $ee, $e
	octave 2
	note C_, 1
	envelope_setting $f
	note C#, 5
	envelope_setting $e
	note C#, 3
	envelope_setting $a
	note C#, 2
	envelope_setting $9
	note C_, 1
	envelope_setting $7
	note C_, 1
	envelope_setting $5
	note C_, 1
	envelope_setting $3
	note C_, 1
	sound_end

unk_003_5da9:
	sound_init 1 ; speed
	note C_, 0
	envelope_mode $f
	octave 4
	note C_, 1
	note D_, 1
	note E_, 1
	note F#, 2
	duty_cycle DUTY_12, 11
	note G_, 1
	rest 4
	sound_init 2 ; speed
	note C_, 0
	envelope_mode $8f
	note D_, 3
	retrigger $e4, $5
	sound_end

unk_003_5dbf:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	envelope_setting $7
	octave 3
	note C_, 2
	envelope_setting $a
	octave 3
	note D_, 8
	envelope_setting $6
	octave 3
	note E_, 2
	envelope_setting $3
	octave 3
	note F#, 2
	envelope_setting $2
	octave 4
	note C_, 1
	sound_end

unk_003_5dd9:
	sound_init 1 ; speed
	note C_, 0
	note C_, 0
	note C_, 14
	octave 3
	note F#, 1
	duty_cycle DUTY_25, DUTY_25
	note F#, 4
	duty_cycle DUTY_12, DUTY_12
	note F_, 1
	duty_cycle DUTY_25, DUTY_25
	note F_, 4
	duty_cycle DUTY_12, DUTY_12
	note E_, 1
	duty_cycle DUTY_25, DUTY_25
	note E_, 4
	duty_cycle DUTY_12, DUTY_12
	note D#, 1
	duty_cycle DUTY_25, DUTY_25
	note D#, 4
	duty_cycle DUTY_12, DUTY_12
	note D_, 1
	duty_cycle DUTY_25, DUTY_25
	note D_, 4
	duty_cycle DUTY_12, DUTY_12
	note C#, 1
	duty_cycle DUTY_25, DUTY_25
	note C#, 4
	sound_end

unk_003_5e01:
	sound_init 8, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $b2, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $9b, $26, $c4 ; envelope mode, params
	rest 2
	transpose 4
	fine_pitch $2
	speed 6
	rest 4
	octave 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 7
	sound_call unk_003_5e3e
	speed 8
	volume_envelope $51
	octave 2
	note E_, 4
	note D#, 4
	note D_, 4
	note D#, 4
	volume_envelope $b1
	octave 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 2
	note E_, 1
	note C_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note A_, 6
	octave 2
	note A_, 1
	note A_, 1
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	note A_, 2
	sound_end

unk_003_5e3e:
	speed 2
	octave 1
	note A_, 1
	note B_, 1
	octave 2
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	sound_ret

unk_003_5e53:
	sound_init 8, \ ; speed
	           DUTY_75, DUTY_12, \ ; duty cycle
	           $92, \ ; volume envelope
	           2, 3, \ ; vibrato
	           $89, $25, $c4 ; envelope mode, params
	rest 2
	transpose 7
	envelope_setting $5
	fine_pitch $1
	speed 6
	rest 4
	octave 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 7
	sound_call unk_003_5e3e
	transpose 4
	speed 8
	envelope_setting $6
	volume_envelope $91
	mark_loop
	octave 1
	note E_, 1
	repeat_loop 15
	octave 1
	note E_, 1
	octave 0
	note A_, 1
	octave 1
	note E_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	octave 2
	note E_, 1
	octave 2
	note E_, 6
	octave 3
	note E_, 1
	note E_, 1
	note E_, 2
	rest 2
	note E_, 1
	note E_, 1
	note E_, 2
	sound_end

unk_003_5e95:
	sound_init 8, \ ; speed
	           DUTY_12, $6, \ ; duty cycle
	           $86, \ ; volume envelope
	           11, 0, \ ; vibrato
	           $c2, $ec, $4 ; envelope mode, params
	speed 6
	rest 4
	octave 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 7
	sound_call unk_003_5e3e
	speed 8
	mark_loop
	octave 1
	note A_, 1
	repeat_loop 15
	octave 1
	note A_, 2
	note A_, 2
	octave 2
	note C_, 1
	note C_, 2
	octave 1
	note A_, 6
	octave 1
	note A_, 1
	note A_, 1
	note A_, 2
	octave 0
	note A_, 2
	octave 1
	note A_, 1
	note A_, 1
	note A_, 2
	octave 0
	note A_, 2
	sound_end

unk_003_5ec9:
	sound_init 8, \ ; speed
	           $c, DUTY_50, \ ; duty cycle
	           $f6, \ ; volume envelope
	           0, 6, \ ; vibrato
	           $32 ; envelope mode
	note D#, 1
	note D#, 1
	rest 0
	speed 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	speed 8
	note C#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D#, 1
	note D_, 2
	note D_, 2
	note D_, 3
	note D#, 1
	note D#, 1
	note D#, 2
	rest 2
	note D#, 1
	note D#, 1
	note D#, 2
	sound_end

unk_003_5f06:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_25, \ ; duty cycle
	           $b1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $ab, $26, $b5 ; envelope mode, params
	rest 2
	fine_pitch $2
	sound_call unk_003_5f2d
	mark_loop
	transpose 3
	speed 9
	octave 2
	note C_, 9
	octave 1
	note A_, 2
	octave 2
	note C_, 1
	octave 1
	note B_, 10
	rest 2
	octave 2
	note C_, 9
	octave 1
	note A_, 2
	octave 2
	note C_, 1
	octave 2
	note D_, 10
	rest 2
	repeat_loop 0
	sound_end

unk_003_5f2d:
	speed 3
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 1
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 2
	sound_ret

unk_003_5f42:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $31, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $ab, $26, $b5 ; envelope mode, params
	rest 2
	fine_pitch $1
	sound_call unk_003_5f2d
	transpose 3
	mark_loop
	speed 9
	octave 2
	note E_, 9
	note C_, 2
	note E_, 1
	note D_, 6
	note C_, 6
	note E_, 9
	note C_, 2
	note E_, 1
	note F_, 6
	note G_, 6
	repeat_loop 0
	sound_end

unk_003_5f62:
	sound_init 6, \ ; speed
	           DUTY_12, $6, \ ; duty cycle
	           $86, \ ; volume envelope
	           11, 0, \ ; vibrato
	           $c2, $f7, $2d ; envelope mode, params
	note F_, 15
	transpose 3
	mark_loop
	speed 3
	octave 1
	note A_, 9
	note A_, 3
	note A_, 3
	note A_, 3
	note A_, 9
	note A_, 3
	note B_, 3
	octave 2
	note C_, 3
	octave 1
	note G_, 9
	note G_, 3
	note G_, 3
	note G_, 3
	note G_, 9
	note G_, 3
	note A_, 3
	note B_, 3
	octave 1
	note A_, 9
	note A_, 3
	note A_, 3
	note A_, 3
	note A_, 9
	note A_, 3
	note B_, 3
	octave 2
	note C_, 3
	octave 1
	note B_, 9
	note B_, 3
	note B_, 3
	note B_, 3
	note B_, 9
	note B_, 3
	octave 2
	note C_, 3
	note D_, 3
	repeat_loop 0
	sound_end

unk_003_5f99:
	sound_init 6, \ ; speed
	           $c, DUTY_50, \ ; duty cycle
	           $61, \ ; volume envelope
	           6, 1, \ ; vibrato
	           $71 ; envelope mode
	note G_, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	mark_loop
	sound_call unk_003_5faa
	repeat_loop 0
	sound_end

unk_003_5faa:
	speed 3
	note D_, 9
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 9
	note D#, 3
	note D#, 3
	note D#, 3
	note D_, 9
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	sound_ret

unk_003_5fbf:
	sound_init 3, \ ; speed
	           DUTY_50, DUTY_12, \ ; duty cycle
	           $c1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $bb, $26, $b5 ; envelope mode, params
	rest 2
	fine_pitch $2
	transpose 6
	rest 8
	octave 2
	note E_, 2
	note E_, 3
	rest 3
	note G_, 5
	rest 1
	note A_, 6
	note A_, 3
	rest 1
	note B_, 2
	note E_, 2
	note G_, 3
	speed 6
	octave 3
	note C_, 0
	rest 1
	sound_end

unk_003_5fde:
	sound_init 3, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $91, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $bb, $26, $b5 ; envelope mode, params
	rest 2
	fine_pitch $1
	transpose 6
	rest 8
	octave 2
	note E_, 2
	note E_, 3
	rest 3
	note G_, 5
	rest 1
	note F_, 6
	note F_, 3
	rest 1
	note G_, 2
	note C_, 2
	note G_, 3
	speed 6
	note G_, 0
	rest 1
	sound_end

unk_003_5ffc:
	sound_init 3, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $86, \ ; volume envelope
	           11, 0, \ ; vibrato
	           $c2, $ec, $6 ; envelope mode, params
	rest 8
	octave 2
	note C_, 2
	note C_, 4
	rest 2
	octave 1
	note B_, 6
	octave 2
	note C_, 6
	note C_, 4
	note D_, 2
	note C_, 2
	octave 1
	note B_, 3
	speed 6
	octave 2
	note C_, 0
	rest 1
	sound_end

unk_003_6017:
	sound_init 3, \ ; speed
	           $c, DUTY_50, \ ; duty cycle
	           $34, \ ; volume envelope
	           3, 2, \ ; vibrato
	           $32 ; envelope mode
	note D#, 2
	note D#, 4
	rest 2
	note D_, 6
	note D_, 6
	note D#, 4
	note D#, 2
	note D#, 2
	note D#, 4
	speed 6
	note D_, 14
	note D#, 1
	note D#, 1
	note D#, 1
	sound_end

unk_003_602c:
	sound_init 8, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $e1, \ ; volume envelope
	           2, 2, \ ; vibrato
	           $9b, $3e, $a6 ; envelope mode, params
	stereo_panning STEREO_RIGHT
	rest 4
	octave 2
	note E_, 8
	octave 3
	note C#, 4
	rest 4
	octave 2
	note D_, 8
	octave 3
	note D_, 4
	rest 4
	octave 2
	note A_, 8
	octave 3
	note F_, 4
	note D_, 1
	rest 2
	note G_, 1
	note G_, 4
	note D#, 1
	rest 2
	note G#, 1
	note G#, 4
	note G_, 1
	rest 2
	octave 4
	note D_, 1
	note D_, 0
	sound_end

unk_003_6052:
	sound_init 8, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $e1, \ ; volume envelope
	           2, 2, \ ; vibrato
	           $9b, $3e, $a6 ; envelope mode, params
	stereo_panning STEREO_LEFT
	rest 8
	octave 2
	note A_, 8
	rest 8
	octave 2
	note B_, 8
	rest 8
	octave 3
	note C_, 8
	octave 2
	note B_, 1
	rest 2
	octave 3
	note D_, 1
	note D_, 4
	note C_, 1
	rest 2
	note D#, 1
	note D#, 4
	note D_, 1
	rest 2
	note G_, 1
	note G_, 0
	sound_end

unk_003_6073:
	sound_init 8, \ ; speed
	           DUTY_12, $9, \ ; duty cycle
	           $98, \ ; volume envelope
	           12, 0, \ ; vibrato
	           $e1, $90, $70 ; envelope mode, params
	note F_, 0
	note G_, 1
	rest 2
	note G_, 1
	note G_, 4
	note G#, 1
	rest 2
	note G#, 1
	note G#, 4
	note G_, 1
	rest 2
	note G_, 1
	note G_, 15
	rest 1
	sound_end

unk_003_6089:
	sound_init 8, \ ; speed
	           DUTY_50, $4, \ ; duty cycle
	           $24, \ ; volume envelope
	           2, 4, \ ; vibrato
	           $32 ; envelope mode
	note D#, 1
	note D#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	note D#, 2
	note D#, 1
	note D#, 1
	note D#, 3
	note D#, 1
	sound_call unk_003_60b4
	note D#, 3
	note D#, 1
	sound_call unk_003_60b4
	note D#, 3
	note D#, 1
	sound_call unk_003_60b4
	sound_call unk_003_60b4
	sound_call unk_003_60b4
	note D#, 4
	sound_end

unk_003_60b4:
	speed 1
	note D#, 6
	note D#, 5
	note D#, 5
	note D#, 6
	note D#, 5
	note D#, 5
	speed 8
	sound_ret

unk_003_60bf:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_25, \ ; duty cycle
	           $d1, \ ; volume envelope
	           2, 5, \ ; vibrato
	           $ab, $15, $a6 ; envelope mode, params
	fine_pitch $2
	rest 2
	rest 0
	mark_loop2
	volume_envelope $d1
	transpose 4
	sound_call unk_003_60e0
	sound_call unk_003_60e0
	transpose 6
	sound_call unk_003_60e0
	sound_call unk_003_60e0
	repeat_loop2 0
	sound_end

unk_003_60e0:
	octave 1
	note C_, 2
	rest 2
	note G_, 8
	note F_, 1
	note F_, 1
	rest 1
	note G_, 9
	note F_, 2
	note G_, 6
	sound_ret

unk_003_60eb:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $91, \ ; volume envelope
	           2, 5, \ ; vibrato
	           $ab, $14, $a6 ; envelope mode, params
	fine_pitch $1
	rest 2
	rest 14
	octave 1
	note C_, 1
	note C_, 1
	mark_loop2
	transpose 4
	sound_call unk_003_610c
	sound_call unk_003_610c
	transpose 6
	sound_call unk_003_610c
	sound_call unk_003_610c
	repeat_loop2 0

unk_003_610c:
	octave 1
	note E_, 2
	note E_, 1
	note E_, 1
	note G_, 1
	note G_, 2
	note G_, 1
	note E_, 2
	note E_, 1
	note E_, 1
	note G_, 1
	note G_, 2
	note G_, 1
	octave 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 2
	note C_, 1
	sound_ret

unk_003_612c:
	sound_end

unk_003_612d:
	sound_init 6, \ ; speed
	           DUTY_12, $6, \ ; duty cycle
	           $83, \ ; volume envelope
	           10, 0, \ ; vibrato
	           $c2, $ce, $e1 ; envelope mode, params
	note C_, 1
	note C_, 1
	mark_loop2
	transpose 4
	sound_call unk_003_6149
	sound_call unk_003_6149
	transpose 6
	sound_call unk_003_6149
	sound_call unk_003_6149
	repeat_loop2 0

unk_003_6149:
	octave 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	sound_ret

unk_003_6163:
	sound_end

unk_003_6164:
	sound_init 6, \ ; speed
	           $c, DUTY_50, \ ; duty cycle
	           $32, \ ; volume envelope
	           3, 1, \ ; vibrato
	           $31 ; envelope mode
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 2
	note D#, 2
	rest 2
	note D#, 1
	note D#, 1
	mark_loop
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	rest 1
	note D#, 1
	note D#, 1
	note D#, 1
	repeat_loop 0
	sound_end

unk_003_6190:
	sound_init 5, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $b1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; envelope mode, params
	rest 4
	fine_pitch $2
	transpose 1
	volume_envelope $a1
	duty_cycle DUTY_50, DUTY_25
	rest 4
	octave 2
	note E_, 8
	rest 2
	note E_, 2
	note F_, 2
	note G_, 10
	rest 2
	note F_, 2
	note G_, 2
	note A_, 10
	rest 2
	note A_, 2
	note A_, 2
	note B_, 10
	note B_, 4
	octave 3
	note C_, 4
	mark_loop2
	volume_envelope $c1
	duty_cycle DUTY_50, DUTY_50
	octave 2
	rest 4
	note E_, 4
	note D_, 2
	note C_, 4
	note G_, 6
	note F_, 4
	note E_, 2
	note F_, 6
	note D_, 6
	note D_, 10
	volume_envelope $71
	duty_cycle DUTY_25, DUTY_25
	rest 2
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 2
	rest 2
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 2
	volume_envelope $c1
	duty_cycle DUTY_50, DUTY_50
	octave 2
	rest 4
	note E_, 4
	note D_, 2
	note C_, 4
	note G_, 4
	note G_, 2
	note F_, 4
	note E_, 4
	note G_, 4
	note A_, 6
	note B_, 10
	volume_envelope $71
	duty_cycle DUTY_25, DUTY_25
	volume_envelope $91
	note B_, 2
	rest 4
	note B_, 6
	volume_envelope $d1
	duty_cycle DUTY_50, DUTY_50
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	volume_envelope $c1
	octave 3
	note C_, 6
	octave 2
	note B_, 2
	rest 2
	note B_, 2
	rest 2
	note A_, 10
	note A_, 2
	note B_, 6
	octave 3
	note C_, 6
	octave 2
	note B_, 2
	rest 2
	note B_, 2
	rest 2
	note A_, 10
	note G_, 3
	note F_, 3
	note E_, 2
	note D_, 12
	note C_, 2
	note G_, 4
	note G_, 2
	note F_, 4
	note E_, 2
	note F_, 6
	octave 3
	note C_, 6
	note C_, 10
	volume_envelope $91
	duty_cycle DUTY_25, DUTY_25
	octave 2
	rest 2
	note E_, 2
	note G_, 2
	note E_, 2
	note A_, 2
	note G_, 2
	rest 4
	repeat_loop2 0
	sound_end

unk_003_6225:
	sound_init 5, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $71, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; envelope mode, params
	rest 4
	transpose 1
	fine_pitch $1
	rest 4
	octave 2
	note G_, 10
	note G_, 2
	note A_, 2
	note B_, 12
	note A_, 2
	note B_, 2
	octave 3
	note C_, 12
	note C_, 2
	note C_, 2
	note D_, 10
	note D_, 4
	note E_, 4
	mark_loop2
	duty_cycle DUTY_25, DUTY_25
	mark_loop
	envelope_setting $6
	octave 2
	note C_, 2
	envelope_setting $5
	note E_, 2
	note G_, 2
	note B_, 2
	repeat_loop 3
	mark_loop
	envelope_setting $6
	note D_, 2
	envelope_setting $5
	note F_, 2
	note G_, 2
	note B_, 2
	repeat_loop 1
	envelope_setting $6
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	note D_, 2
	rest 2
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 2
	mark_loop
	envelope_setting $6
	octave 2
	note C_, 2
	envelope_setting $5
	note E_, 2
	note G_, 2
	note B_, 2
	repeat_loop 3
	mark_loop
	envelope_setting $6
	note D_, 2
	envelope_setting $5
	note F_, 2
	note G_, 2
	note B_, 2
	repeat_loop 1
	envelope_setting $8
	note G_, 2
	rest 4
	note G_, 6
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	duty_cycle DUTY_50, DUTY_50
	sound_call unk_003_62b6
	envelope_setting $9
	note F_, 2
	note G_, 6
	sound_call unk_003_62b6
	envelope_setting $9
	note E_, 3
	note D_, 3
	note C_, 2
	envelope_setting $6
	note D_, 4
	note D_, 1
	note E_, 1
	note F_, 10
	note E_, 8
	note C_, 2
	note D_, 6
	note G_, 6
	note G_, 10
	duty_cycle DUTY_25, DUTY_25
	rest 3
	note E_, 2
	note G_, 2
	note E_, 2
	note A_, 2
	note G_, 2
	rest 3
	repeat_loop2 0
	sound_end

unk_003_62b6:
	envelope_setting $9
	volume_envelope $91
	duty_cycle DUTY_50, DUTY_50
	octave 2
	note A_, 6
	note G_, 2
	rest 2
	note G_, 2
	rest 2
	note F_, 2
	envelope_setting $7
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	sound_ret

unk_003_62ce:
	sound_init 5, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $86, \ ; volume envelope
	           11, 0, \ ; vibrato
	           $c4, $ec, $1 ; envelope mode, params
	rest 4
	octave 2
	note C_, 10
	note C_, 2
	note D_, 2
	note E_, 12
	note D_, 2
	note E_, 2
	note F_, 12
	note F_, 2
	note F_, 2
	note G_, 10
	note G_, 4
	note A_, 4
	mark_loop2
	mark_loop
	octave 2
	note C_, 2
	repeat_loop 15
	mark_loop
	octave 1
	note B_, 2
	repeat_loop 15
	mark_loop
	octave 2
	note C_, 2
	repeat_loop 15
	mark_loop
	octave 1
	note B_, 2
	repeat_loop 15
	sound_call unk_003_6328
	note C_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	sound_call unk_003_6328
	note C_, 3
	note D_, 3
	note E_, 2
	mark_loop
	octave 2
	note D_, 2
	repeat_loop 3
	mark_loop
	octave 2
	note C_, 2
	repeat_loop 3
	mark_loop
	octave 1
	note B_, 2
	repeat_loop 3
	mark_loop
	octave 1
	note A_, 2
	repeat_loop 3
	mark_loop
	octave 2
	note C_, 2
	repeat_loop 7
	rest 2
	note C_, 2
	note E_, 2
	note C_, 2
	note F_, 2
	note E_, 2
	rest 4
	repeat_loop2 0
	sound_end

unk_003_6328:
	octave 2
	note E_, 2
	note E_, 2
	note E_, 2
	note D_, 4
	note D_, 2
	note D_, 2
	note C_, 4
	note C_, 2
	note C_, 2
	note C_, 2
	sound_ret

unk_003_6334:
	sound_init 5, \ ; speed
	           $c, $4, \ ; duty cycle
	           $32, \ ; volume envelope
	           3, 2, \ ; vibrato
	           $24 ; envelope mode
	mark_loop
	note C#, 4
	note C#, 4
	note C#, 2
	note D_, 6
	repeat_loop 2
	note C#, 4
	note D#, 1
	note D#, 1
	note D#, 2
	note D#, 2
	note D#, 1
	note D#, 1
	mark_loop2
	mark_loop
	sound_call unk_003_6380
	repeat_loop 14
	note D#, 2
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 4
	note D#, 2
	note D_, 4
	note D_, 2
	note D#, 2
	note D_, 4
	note D_, 2
	note D#, 2
	note D_, 4
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D_, 2
	note D#, 2
	note D_, 4
	note D_, 2
	note D#, 4
	note D#, 3
	note D#, 3
	note D#, 2
	mark_loop
	sound_call unk_003_6380
	repeat_loop 4
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 12
	note D#, 2
	note D#, 1
	note D#, 1
	repeat_loop2 0
	sound_end

unk_003_6380:
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	sound_ret

unk_003_6387:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $b1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $9b, $26, $b5 ; envelope mode, params
	fine_pitch $2
	rest 2
	mark_loop2
	transpose 2
	volume_envelope $b1
	duty_cycle DUTY_50, DUTY_25
	sound_call unk_003_63b1
	sound_call unk_003_63b1
	transpose 4
	sound_call unk_003_63b1
	sound_call unk_003_63b1
	transpose 6
	sound_call unk_003_63b1
	sound_call unk_003_63b1
	repeat_loop2 0
	sound_end

unk_003_63b1:
	octave 1
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 12
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 12
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 12
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 12
	sound_ret

unk_003_63c7:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $71, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; envelope mode, params
	transpose 2
	rest 2
	fine_pitch $1
	sound_call unk_003_63b1
	transpose 2
	volume_envelope $31
	duty_cycle DUTY_25, DUTY_25
	mark_loop
	sound_call unk_003_640a
	repeat_loop 2
	sound_call2 unk_003_642a
	mark_loop2
	transpose 4
	mark_loop
	sound_call unk_003_640a
	repeat_loop 6
	sound_call2 unk_003_642a
	transpose 6
	mark_loop
	sound_call unk_003_640a
	repeat_loop 6
	sound_call2 unk_003_642a
	transpose 2
	mark_loop
	sound_call unk_003_640a
	repeat_loop 6
	sound_call2 unk_003_642a
	repeat_loop2 0
	sound_end

unk_003_640a:
	envelope_setting $5
	octave 2
	note D#, 1
	envelope_setting $4
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note D#, 1
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note D#, 1
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note D#, 1
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note D#, 1
	note G_, 1
	octave 3
	note C_, 1
	octave 2
	note D#, 1
	sound_ret

unk_003_642a:
	octave 2
	note C_, 1
	note D#, 1
	note G_, 1
	octave 3
	note D#, 1
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	note A#, 1
	note D#, 1
	note G_, 1
	note D#, 1
	note C_, 1
	octave 1
	note A#, 1
	octave 2
	note C_, 1
	octave 1
	note A_, 1
	sound_ret2

unk_003_6443:
	sound_init 6, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $86, \ ; volume envelope
	           11, 0, \ ; vibrato
	           $c2, $fc, $ec ; envelope mode, params
	note C_, 2
	sound_call unk_003_63b1
	sound_call unk_003_63b1
	transpose 4
	sound_call unk_003_63b1
	sound_call unk_003_63b1
	transpose 6
	sound_call unk_003_63b1
	sound_call unk_003_63b1
	repeat_loop2 0
	sound_end

unk_003_6464:
	sound_init 6, \ ; speed
	           $c, DUTY_50, \ ; duty cycle
	           $fb, \ ; volume envelope
	           1, 4, \ ; vibrato
	           $fd, $e, $31 ; envelope mode, params
	note D#, 1
	note D#, 1
	note D#, 1
	mark_loop2
	mark_loop
	sound_call unk_003_647e
	repeat_loop 6
	note D#, 1
	note C#, 1
	note G_, 2
	note D#, 1
	note C#, 1
	note G_, 2
	repeat_loop2 0
	sound_end

unk_003_647e:
	note D#, 1
	note C#, 1
	note D_, 2
	note D#, 1
	note C#, 1
	note D_, 2
	sound_ret

unk_003_6485:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $91, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $ab, $26, $b5 ; envelope mode, params
	rest 2
	fine_pitch $2
	transpose -10
	sound_call unk_003_64a4
	note G_, 12
	rest 4
	mark_loop2
	transpose -10
	sound_call2 unk_003_64bc
	transpose -12
	sound_call2 unk_003_64bc
	repeat_loop2 0
	sound_end

unk_003_64a4:
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	sound_ret

unk_003_64bc:
	duty_cycle DUTY_50, DUTY_25
	volume_envelope $c1
	octave 2
	note G_, 6
	note G_, 2
	octave 3
	note E_, 12
	octave 2
	note A_, 2
	note B_, 2
	note B_, 2
	octave 3
	note C_, 2
	note C_, 2
	note D_, 2
	octave 2
	note E_, 2
	note G_, 4
	rest 2
	octave 3
	note E_, 14
	rest 2
	note D_, 8
	sound_ret2

unk_003_64d6:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $71, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $ab, $26, $b5 ; envelope mode, params
	rest 2
	fine_pitch $1
	transpose 2
	sound_call unk_003_64a4
	transpose 2
	octave 2
	note E_, 2
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 2
	note E_, 1
	note E_, 2
	rest 4
	note E_, 1
	note E_, 1
	envelope_setting $5
	mark_loop2
	transpose 2
	sound_call unk_003_6514
	sound_call unk_003_6514
	sound_call unk_003_6514
	sound_call unk_003_6514
	transpose 0
	sound_call unk_003_6514
	sound_call unk_003_6514
	sound_call unk_003_6514
	sound_call unk_003_64a4
	repeat_loop2 0
	sound_end

unk_003_6514:
	octave 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	note E_, 2
	octave 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	note E_, 2
	sound_ret

unk_003_6521:
	sound_init 6, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $86, \ ; volume envelope
	           11, 0, \ ; vibrato
	           $c2, $c0, $ec ; envelope mode, params
	note C_, 2
	octave 2
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 2
	rest 4
	note C_, 1
	note C_, 1
	mark_loop2
	transpose 2
	sound_call unk_003_6554
	sound_call unk_003_6554
	sound_call unk_003_6554
	sound_call unk_003_6554
	transpose 0
	sound_call unk_003_6554
	sound_call unk_003_6554
	sound_call unk_003_6554
	sound_call unk_003_6554
	repeat_loop2 0
	sound_end

unk_003_6554:
	octave 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note C_, 2
	note C_, 2
	sound_ret

unk_003_6560:
	sound_init 6, \ ; speed
	           $c, DUTY_50, \ ; duty cycle
	           $c0, \ ; volume envelope
	           3, 2, \ ; vibrato
	           $31 ; envelope mode
	note D#, 1
	note D#, 1
	note D#, 2
	note D#, 1
	note D#, 2
	rest 4
	note D#, 1
	note D#, 1
	mark_loop2
	sound_call unk_003_6587
	sound_call unk_003_6587
	sound_call unk_003_6587
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 2
	note D#, 1
	note D#, 1
	repeat_loop2 0
	sound_end

unk_003_6587:
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note D_, 2
	sound_ret
