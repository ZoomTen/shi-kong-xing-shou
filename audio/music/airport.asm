Music_Airport_Ch1:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	stereo_panning STEREO_LEFT
	envelope_setting $5
	volume_envelope $91
	speed 6
	fine_pitch $1
	duty_cycle DUTY_50, DUTY_50
	mark_loop ;------
	transpose -12
	octave 4
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	octave 4
	note C_, 2
	note F_, 1
	rest 1
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	rest 2
	note G_, 2
	rest 2
	note F_, 3
	rest 1
	note G_, 2
	rest 2
	note C_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	rest 2
	note C_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	rest 2
	note A#, 2
	rest 2
	note G_, 2
	rest 2
	note G_, 1
	rest 1
	note G_, 2
	note C_, 2
	note F_, 2
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	rest 2
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	note G_, 2
	note A#, 2
	rest 2
	note G_, 3
	rest 1
	note F_, 2
	note G_, 2
	note F_, 2
	note C_, 3
	rest 1
	note F_, 3
	rest 1
	note G_, 3
	rest 1
	octave 5
	note C_, 3
	rest 1
	rest 2
	note C_, 2
	rest 2
	note C_, 5
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	repeat_loop 0 ;------

Music_Airport_Ch2:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	speed 6
	fine_pitch $2
	volume_envelope $11
	mark_loop2 ;------
	transpose -12
	duty_cycle DUTY_25, DUTY_25
	stereo_panning $4
	octave 3
	note A_, 5
	rest 1
	note A_, 2
	note A#, 2
	octave 4
	note C_, 2
	note F_, 2
	note D#, 2
	note D#, 5
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	octave 3
	note A#, 1
	rest 1
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 5
	rest 1
	note A_, 2
	note A#, 2
	note A_, 2
	note F_, 1
	rest 1
	note D#, 2
	note D#, 2
	note F_, 1
	rest 1
	note F_, 2
	note C_, 6
	note F_, 2
	note G_, 2
	note A_, 4
	rest 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 2
	note F_, 1
	rest 1
	note D#, 2
	note D#, 6
	note C_, 1
	rest 1
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 4
	note F_, 1
	rest 1
	note F_, 2
	note G_, 2
	note D#, 1
	rest 3
	note F_, 2
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 2
	note F_, 1
	rest 1
	note A_, 2
	note F_, 1
	rest 1
	note A_, 2
	note F_, 1
	rest 1
	repeat_loop2 0 ;------

Music_Airport_Ch3:
	sound_init 7, \ ; speed
	           $5, $86, $b0 ; unknown
	stereo_panning $4
	speed 6
	transpose 0
	mark_loop ;------
	octave 1
	note F_, 2
	rest 1
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	octave 1
	note F_, 3
	rest 1
	note F_, 2
	octave 2
	note F_, 2
	octave 1
	note F_, 2
	note D#, 2
	rest 1
	note D#, 1
	octave 2
	note D#, 2
	octave 1
	note D#, 3
	rest 1
	note D#, 2
	octave 2
	note D#, 2
	octave 1
	note D#, 2
	note F_, 3
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	octave 1
	note F_, 4
	note F_, 2
	octave 2
	note F_, 2
	octave 1
	note F_, 2
	note C_, 2
	rest 1
	note C_, 2
	rest 1
	note C_, 2
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	note C_, 2
	note F_, 3
	note F_, 1
	octave 2
	note F_, 2
	octave 1
	note F_, 3
	rest 1
	note F_, 2
	octave 2
	note F_, 2
	octave 1
	note F_, 2
	note D#, 2
	rest 1
	note D#, 1
	octave 2
	note D#, 2
	octave 1
	note D#, 3
	rest 1
	note D#, 2
	octave 2
	note D#, 2
	octave 1
	note D#, 2
	note F_, 3
	note F_, 1
	octave 2
	note F_, 2
	octave 1
	note F_, 2
	note C_, 2
	rest 1
	note C_, 4
	rest 1
	note F_, 3
	note F_, 1
	octave 2
	note F_, 2
	octave 1
	note F_, 1
	rest 1
	note D#, 2
	note D#, 2
	note C_, 3
	rest 1
	repeat_loop 0 ;------

Music_Airport_Ch4:
	sound_init 7 ; speed
	speed 6
	mark_loop ;------
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	octave 1
	note D#, 1
	rest 1
	octave 3
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	note D#, 2
	note C#, 1
	note C#, 1
	octave 1
	note D#, 1
	rest 1
	octave 3
	note C#, 1
	note C#, 1
	note D#, 1
	rest 1
	note C#, 1
	note C#, 1
	note D#, 1
	rest 1
	note C#, 1
	note C#, 1
	octave 1
	note D#, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	note D#, 1
	rest 1
	note C#, 1
	rest 1
	repeat_loop 0 ;------
	sound_end
