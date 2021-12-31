Music_Academy_Ch1:
	sound_init 6, \ ; speed
	            DUTY_50, DUTY_50, \ ; duty cycle 
	            $c1, \ ; unknown 1
	            5, 2, \ ; vibrato
	            $8b, $26, $b5 ; unknown 2
	fine_pitch $2
	duty_cycle DUTY_25, DUTY_25
	speed 6
	mark_loop ;------
	duty_cycle DUTY_12, DUTY_12
	unknown_music_e9 $22
	stereo_panning $3
	unknown_volume $10
	unknown_music_e9 $91
	transpose -12
	octave 4
	note C#, 3
	rest 1
	note C#, 1
	note C#, 1
	note C#, 2
	note D#, 3
	rest 1
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note F_, 11
	rest 1
	note D#, 2
	note F_, 2
	note F#, 4
	note F#, 2
	rest 1
	note F#, 1
	note F_, 2
	note D#, 2
	note C#, 2
	note F_, 2
	note D#, 4
	octave 3
	note G#, 3
	rest 1
	note G#, 4
	note G#, 1
	note A#, 1
	octave 4
	note C_, 2
	note C#, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note D#, 3
	rest 1
	note D#, 1
	rest 1
	note D#, 2
	note F_, 11
	rest 1
	note D#, 2
	note F_, 2
	note F#, 4
	note F#, 1
	note F#, 1
	note F#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note F_, 2
	note D#, 2
	rest 2
	octave 3
	note G#, 1
	note A#, 1
	octave 4
	note C_, 2
	note C#, 6
	rest 2
	repeat_loop 0 ;------

Music_Academy_Ch2:
	sound_init 6, \ ; speed
	            DUTY_50, DUTY_50, \ ; duty cycle
	            $c1, \ ; unknown 1
	            5, 2, \ ; vibrato
	            $8b, $26, $c5 ; unknown 2
	speed 6
	mark_loop ;------
	stereo_panning $4
	unknown_volume $13
	fine_pitch $2
	transpose 0
	unknown_music_e9 $11
	duty_cycle DUTY_75, DUTY_50
	octave 3
	note F_, 8
	note F#, 8
	note G#, 11
	rest 1
	note F#, 2
	note G#, 2
	note A#, 8
	note G#, 8
	note G#, 4
	note D#, 4
	note G#, 6
	rest 2
	note F_, 3
	rest 1
	note C#, 3
	rest 1
	note F#, 4
	note D#, 4
	note G#, 4
	note F_, 4
	note G#, 7
	rest 1
	note A#, 8
	note G#, 7
	rest 1
	note G#, 3
	rest 1
	note G#, 2
	rest 2
	note F_, 5
	rest 3
	repeat_loop 0 ;------

Music_Academy_Ch3:
	sound_init 6, \ ; speed
	           $7, $84, $80 ; unknown
	stereo_panning $4
	speed 6
	mark_loop ;------
	transpose 0
	octave 2
	note C#, 1
	rest 1
	note C#, 1
	note C#, 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	octave 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	octave 2
	note C#, 2
	note C#, 1
	note C#, 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	octave 1
	note F#, 1
	rest 1
	note F#, 1
	note F#, 1
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	octave 2
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 2
	octave 1
	note G#, 1
	rest 1
	note G#, 1
	note G#, 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	octave 2
	note D#, 1
	rest 1
	octave 1
	note G#, 1
	rest 1
	octave 2
	note D#, 2
	octave 1
	note G#, 1
	rest 1
	octave 2
	note C#, 1
	rest 1
	note C#, 1
	note C#, 1
	note C#, 1
	rest 1
	note C#, 2
	octave 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	octave 2
	note C#, 1
	rest 1
	note C#, 1
	note C#, 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 1
	note F#, 1
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	octave 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	octave 2
	note C#, 1
	rest 1
	note C#, 1
	note C#, 1
	note C#, 3
	rest 1
	repeat_loop 0 ;------

Music_Academy_Ch4:
	sound_init 6 ; speed
	stereo_panning $2
	speed 6
	mark_loop ;------
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note D#, 1
	rest 7
	note D#, 1
	rest 1
	note D#, 1
	note D#, 1
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note D#, 1
	rest 7
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note D#, 1
	rest 7
	note D#, 1
	rest 3
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note D#, 1
	rest 7
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	repeat_loop 0 ;------
