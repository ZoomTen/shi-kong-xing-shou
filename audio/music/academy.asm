Music_Academy_Ch1:
	sound_init 6,                \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $C1,              \ ; ???
	           5, 2,             \ ; vibrato
	           $8b, $26, $b5       ; unknown
	fine_pitch 2
	duty_cycle DUTY_25, DUTY_25
	speed 6
	mark_loop ;------
	duty_cycle DUTY_12, DUTY_12
	unknown_music_e9 $22
	stereo_panning $03
	unknown_volume $10
	unknown_music_e9  $91
	transpose -12
	octave 4
	note C#, 4
	rest 2
	note C#, 2
	note C#, 2
	note C#, 3
	note D#, 4
	rest 2
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	note F_, 12
	rest 2
	note D#, 3
	note F_, 3
	note F#, 5
	note F#, 3
	rest 2
	note F#, 2
	note F_, 3
	note D#, 3
	note C#, 3
	note F_, 3
	note D#, 5
	octave 3
	note G#, 4
	rest 2
	note G#, 5
	note G#, 2
	note A#, 2
	octave 4
	note C_, 3
	note C#, 5
	note C#, 2
	note C#, 2
	note C#, 3
	note D#, 4
	rest 2
	note D#, 2
	rest 2
	note D#, 3
	note F_, 12
	rest 2
	note D#, 3
	note F_, 3
	note F#, 5
	note F#, 2
	note F#, 2
	note F#, 3
	note F_, 3
	note D#, 3
	note C#, 3
	note F_, 3
	note D#, 3
	rest 3
	octave 3
	note G#, 2
	note A#, 2
	octave 4
	note C_, 3
	note C#, 7
	rest 3
	repeat_loop 0 ;------

Music_Academy_Ch2:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $c5 ; unknown 2
	speed 6
	mark_loop ; ------
	stereo_panning $4
	unknown_volume $13
	fine_pitch $2
	transpose 0
	unknown_music_e9 $11
	duty_cycle DUTY_75, DUTY_50
	octave 3
	note F_, 9
	note F#, 9
	note G#, 12
	rest 2
	note F#, 3
	note G#, 3
	note A#, 9
	note G#, 9
	note G#, 5
	note D#, 5
	note G#, 7
	rest 3
	note F_, 4
	rest 2
	note C#, 4
	rest 2
	note F#, 5
	note D#, 5
	note G#, 5
	note F_, 5
	note G#, 8
	rest 2
	note A#, 9
	note G#, 8
	rest 2
	note G#, 4
	rest 2
	note G#, 3
	rest 3
	note F_, 6
	rest 4
	repeat_loop 0 ; ------

	Music_Academy_Ch3:
	sound_init 6, \ ; speed
	           $7, $84, $80 ; unknown
	stereo_panning $4
	speed 6
	mark_loop ; ------
	transpose 0
	octave 2
	note C#, 2
	rest 2
	note C#, 2
	note C#, 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	octave 1
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	octave 2
	note C#, 3
	note C#, 2
	note C#, 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	octave 1
	note F#, 2
	rest 2
	note F#, 2
	note F#, 2
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	octave 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 3
	octave 1
	note G#, 2
	rest 2
	note G#, 2
	note G#, 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	octave 2
	note D#, 2
	rest 2
	octave 1
	note G#, 2
	rest 2
	octave 2
	note D#, 3
	octave 1
	note G#, 2
	rest 2
	octave 2
	note C#, 2
	rest 2
	note C#, 2
	note C#, 2
	note C#, 2
	rest 2
	note C#, 3
	octave 1
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	octave 2
	note C#, 2
	rest 2
	note C#, 2
	note C#, 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	note F#, 2
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	octave 1
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	octave 2
	note C#, 2
	rest 2
	note C#, 2
	note C#, 2
	note C#, 4
	rest 2
	repeat_loop 0  ; ------

; not audible in bank $03
Music_Academy_Ch4:
	sound_init 6 ; speed
	stereo_panning $02
	speed 6
	mark_loop ;------
	note E_, 2
	rest 2
	note D#, 2
	note D#, 2
	note D#, 2
	rest 8
	note D#, 2
	rest 2
	note D#, 2
	note D#, 2
	note E_, 2
	rest 2
	note D#, 2
	note D#, 2
	note D#, 2
	rest 8
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note E_, 2
	rest 2
	note D#, 2
	note D#, 2
	note D#, 2
	rest 8
	note D#, 2
	rest 4
	note E_, 2
	rest 2
	note D#, 2
	note D#, 2
	note D#, 2
	rest 8
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	repeat_loop 0 ;------
