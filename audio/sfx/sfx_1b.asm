unk_002_515e:
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

unk_002_516c:
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

unk_002_5188:
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

unk_002_51ad:
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

unk_002_51be:
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

unk_002_51d0:
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

unk_002_51e5:
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

unk_002_51f7:
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

unk_002_5212:
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

unk_002_522e:
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

unk_002_523d:
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

unk_002_525f:
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

unk_002_526e:
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

unk_002_527a:
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

unk_002_5288:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_25, \ ; duty cycle
	           $e0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $9e, $21, $81 ; envelope mode, params
	octave 3
	note G#, 7
	note C#, 7
	sound_end

unk_002_5293:
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

unk_002_52ab:
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

unk_002_52bc:
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

unk_002_52e7:
	sound_init 1 ; speed
	note C#, 1
	rest 0
	note C_, 14
	octave 1
	note C#, 2
	envelope_setting $8c, $10, $11
	note C_, 4
	sound_end

unk_002_52f3:
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

unk_002_5308:
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

unk_002_5331:
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

unk_002_5347:
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

unk_002_5352:
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

unk_002_535d:
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

unk_002_5368:
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

unk_002_5387:
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

unk_002_53ab:
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

unk_002_53c1:
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

unk_002_53dd:
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

unk_002_540c:
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

unk_002_541f:
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

unk_002_5439:
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

unk_002_5465:
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

unk_002_5482:
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

unk_002_548e:
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

unk_002_549e:
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

unk_002_54ac:
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

unk_002_54d3:
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

unk_002_54e3:
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

unk_002_54ef:
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

unk_002_5503:
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

unk_002_551a:
	sound_end

unk_002_551b:
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

unk_002_553b:
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

unk_002_5548:
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

unk_002_555d:
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

unk_002_5577:
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

unk_002_55a6:
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

unk_002_55c7:
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

unk_002_55f5:
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

unk_002_5603:
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

unk_002_561f:
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

unk_002_5644:
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

unk_002_5652:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	sound_call unk_002_5664
	sound_call unk_002_5664
	mark_loop
	sound_call unk_002_5684
	repeat_loop 0
	sound_end

unk_002_5664:
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

unk_002_5684:
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

unk_002_5696:
	sound_init 2, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	sound_call unk_002_56a8
	sound_call unk_002_56a8
	mark_loop
	sound_call unk_002_56bb
	repeat_loop 0
	sound_end

unk_002_56a8:
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

unk_002_56bb:
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

unk_002_56c6:
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

unk_002_56d9:
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

unk_002_56f2:
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

unk_002_5718:
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

unk_002_574f:
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6

unk_002_5756:
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

unk_002_577c:
	sound_init 2, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6
	octave 3
	note C_, 1
	sound_call unk_002_5756

unk_002_5788:
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
	sound_call unk_002_57db
	transpose 12
	sound_call unk_002_57db
	transpose 24
	sound_call unk_002_57db
	transpose 36
	sound_call unk_002_57db
	transpose 48
	mark_loop2
	sound_call unk_002_5816
	repeat_loop2 0
	sound_end

unk_002_57db:
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

unk_002_5816:
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

unk_002_582d:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode

unk_002_5832:
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

unk_002_5855:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	octave 6
	note C_, 1
	sound_call unk_002_5832

unk_002_585f:
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

unk_002_587c:
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

unk_002_5888:
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

unk_002_5896:
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

unk_002_58a2:
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

unk_002_58b0:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_50, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $a ; envelope mode
	transpose 48
	mark_loop2
	sound_call unk_002_5816
	repeat_loop2 0
	sound_end

unk_002_58be:
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
	sound_call unk_002_58fc
	transpose 12
	sound_call unk_002_58fc
	transpose 24
	sound_call unk_002_58fc
	sound_end

unk_002_58fc:
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

unk_002_591f:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode

unk_002_5924:
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

unk_002_5985:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	octave 6
	note C_, 1
	sound_call unk_002_5924

unk_002_598f:
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

unk_002_59ac:
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

unk_002_5a2d:
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

unk_002_5ab7:
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

unk_002_5b40:
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

unk_002_5bb5:
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

unk_002_5bd1:
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

unk_002_5bfb:
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

unk_002_5c30:
	sound_init 1, \ ; speed
	           $5, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	stereo_panning STEREO_ALTERNATING
	sound_call unk_002_5c63
	envelope_setting $c
	sound_call unk_002_5c63
	envelope_setting $a
	sound_call unk_002_5c63
	envelope_setting $8
	sound_call unk_002_5c63
	envelope_setting $6
	sound_call unk_002_5c63
	envelope_setting $4
	sound_call unk_002_5c63
	envelope_setting $3
	sound_call unk_002_5c63
	envelope_setting $2
	sound_call unk_002_5c63
	envelope_setting $1
	sound_call unk_002_5c63
	sound_end

unk_002_5c63:
	mark_loop
	octave 1
	note C_, 1
	octave 0
	note G_, 1
	note E_, 1
	note C_, 1
	repeat_loop 4
	sound_ret

unk_002_5c6d:
	sound_init 2 ; speed
	note C#, 1
	note C_, 0
	note C_, 14
	sound_call2 unk_002_5c89
	sound_call2 unk_002_5c89
	sound_call2 unk_002_5c89
	sound_call2 unk_002_5c89
	envelope_setting $c
	mark_loop2
	sound_call2 unk_002_5c89
	retrigger $11, $ff
	repeat_loop2 7
	sound_end

unk_002_5c89:
	octave 7
	note C#, 1
	retrigger $11, $fe
	note D_, 1
	retrigger $11, $fe
	note C#, 1
	retrigger $11, $4
	rest 1
	sound_ret2

unk_002_5c98:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_25, \ ; duty cycle
	           $f0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $f ; envelope mode
	sweep $1f
	octave 5
	note B_, 6
	sound_end

unk_002_5ca2:
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

unk_002_5cae:
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

unk_002_5cbc:
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

unk_002_5cdb:
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

unk_002_5ced:
	sound_end

unk_002_5cee:
	sound_init 1, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 7, \ ; vibrato
	           $8 ; envelope mode
	octave 4
	note G#, 12
	sound_end

unk_002_5cf6:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6

unk_002_5cfd:
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

unk_002_5d38:
	sound_init 1, \ ; speed
	           DUTY_12, DUTY_12, \ ; duty cycle
	           $0, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $e ; envelope mode
	transpose 6
	octave 3
	note C_, 1
	sound_call unk_002_5cfd

unk_002_5d44:
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

unk_002_5d52:
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

unk_002_5d74:
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

unk_002_5d91:
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

unk_002_5db2:
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

unk_002_5ddf:
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

unk_002_5e0b:
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

unk_002_5e21:
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

unk_002_5e3b:
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

unk_002_5e63:
	sound_init 5, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $b1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; envelope mode, params
	rest 3
	fine_pitch $1
	volume_envelope $d1
	duty_cycle DUTY_25, 6
	stereo_panning STEREO_RIGHT
	transpose 0
	sound_call unk_002_5e93
	stereo_panning STEREO_CENTER
	speed 5
	volume_envelope $b1
	duty_cycle DUTY_12, 11
	mark_loop
	transpose 2
	sound_call2 unk_002_5ea7
	transpose 4
	sound_call2 unk_002_5ea7
	transpose 6
	sound_call2 unk_002_5f35
	repeat_loop 0
	sound_end

unk_002_5e93:
	speed 2
	octave 1
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

unk_002_5ea7:
	volume_envelope $b1
	octave 1
	note F#, 1
	note G#, 15
	note G#, 3
	note F#, 13
	note E_, 1
	note F#, 15
	note F#, 1
	note G#, 7
	volume_envelope $91
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	volume_envelope $b1
	octave 1
	note F#, 1
	note G#, 15
	note G#, 3
	note F#, 13
	note E_, 1
	note F#, 15
	note F#, 1
	note G#, 11
	volume_envelope $c1
	note C#, 1
	note D#, 1
	note E_, 1
	note F#, 1
	sound_ret2

unk_002_5eca:
	sound_init 5, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $61, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $ab, $26, $b5 ; envelope mode, params
	rest 3
	volume_envelope $d1
	duty_cycle DUTY_25, 6
	stereo_panning STEREO_LEFT
	transpose 3
	speed 2
	sound_call unk_002_5e93
	duty_cycle DUTY_12, 11
	speed 5
	stereo_panning STEREO_CENTER
	envelope_setting $5
	volume_envelope $91
	mark_loop
	transpose 2
	sound_call unk_002_5f05
	sound_call unk_002_5f05
	transpose 4
	sound_call unk_002_5f05
	sound_call unk_002_5f05
	transpose 6
	sound_call unk_002_5f05
	sound_call unk_002_5f05
	repeat_loop 0
	sound_end

unk_002_5f05:
	octave 1
	note A_, 1
	note B_, 7
	octave 2
	note E_, 2
	note G#, 1
	note B_, 1
	note E_, 2
	note G#, 1
	note B_, 1
	octave 1
	note B_, 3
	note A_, 5
	octave 2
	note D_, 2
	note F#, 1
	note A_, 1
	note D_, 2
	note F#, 1
	note A_, 1
	octave 1
	note G_, 1
	note A_, 7
	octave 2
	note D_, 2
	note F#, 1
	note A_, 1
	note D_, 2
	note F#, 1
	note A_, 1
	octave 2
	rest 1
	note B_, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note E_, 1
	note F#, 1
	note C#, 1
	note E_, 1
	note D#, 1
	sound_ret

unk_002_5f35:
	octave 1
	note F#, 1
	note G#, 15
	note G#, 3
	note F#, 13
	note E_, 1
	note F#, 15
	note F#, 1
	note G#, 15
	octave 1
	note F#, 1
	note G#, 15
	note G#, 3
	note F#, 13
	note E_, 1
	note F#, 15
	note F#, 1
	note G#, 11
	note G#, 1
	note G_, 1
	note F_, 1
	note E_, 1
	sound_ret2

unk_002_5f4c:
	sound_init 5, \ ; speed
	           DUTY_12, $6, \ ; duty cycle
	           $86, \ ; volume envelope
	           11, 0, \ ; vibrato
	           $c3, $ec, $fc ; envelope mode, params
	sound_call unk_002_5e93
	stereo_panning STEREO_CENTER
	speed 5
	mark_loop2
	transpose 2
	sound_call unk_002_5f76
	sound_call2 unk_002_5f8b
	transpose 4
	sound_call unk_002_5f76
	sound_call2 unk_002_5f8b
	transpose 6
	sound_call unk_002_5f76
	sound_call unk_002_5f76
	repeat_loop2 0
	sound_end

unk_002_5f76:
	mark_loop
	octave 1
	note E_, 2
	repeat_loop 7
	mark_loop
	octave 1
	note D_, 2
	repeat_loop 15
	mark_loop
	octave 1
	note E_, 2
	repeat_loop 3
	octave 1
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	sound_ret

unk_002_5f8b:
	mark_loop
	octave 1
	note E_, 2
	repeat_loop 7
	mark_loop
	octave 1
	note D_, 2
	repeat_loop 15
	mark_loop
	octave 1
	note E_, 2
	repeat_loop 3
	octave 1
	note E_, 2
	note B_, 2
	note C#, 1
	note D#, 1
	note E_, 1
	note F#, 1
	sound_ret2

unk_002_5fa2:
	sound_init 5, \ ; speed
	           $c, DUTY_75, \ ; duty cycle
	           $f6, \ ; volume envelope
	           0, 2, \ ; vibrato
	           $31 ; envelope mode
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	speed 5
	mark_loop2
	mark_loop
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	repeat_loop 6
	note C#, 2
	note C#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	repeat_loop2 0
	sound_end
