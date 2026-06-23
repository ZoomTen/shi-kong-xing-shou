Music_Forest_Ch1:
	sound_init 6, \ ; speed
	           DUTY_25, $0b, \ ; duty cycle
	           $61, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $86, $12, $85 ; unknown 2
	speed 6
	stereo_panning STEREO_CENTER
	fine_pitch $1
	mark_loop ;------
	transpose -12
	duty_cycle DUTY_12, DUTY_12
	volume_envelope $c1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	rest 2
	octave 3
	note A_, 2
	octave 4
	note C_, 1
	rest 3
	note D_, 1
	rest 3
	note D_, 1
	rest 3
	note C_, 1
	note C_, 1
	rest 2
	note C_, 1
	rest 3
	note C_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note G_, 1
	octave 4
	note C_, 2
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 4
	note G_, 1
	rest 3
	note F_, 1
	rest 3
	note C_, 1
	rest 3
	octave 3
	note A_, 1
	rest 3
	note F_, 2
	rest 2
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	octave 4
	note C_, 2
	rest 1
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 3
	note D_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note D_, 1
	rest 3
	note C_, 1
	rest 3
	octave 3
	note G_, 2
	rest 2
	octave 4
	note C_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	rest 2
	octave 3
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 3
	octave 3
	note A_, 1
	rest 3
	note F_, 2
	rest 2
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note F_, 1
	rest 1
	octave 4
	note F_, 1
	note D_, 1
	note F_, 1
	rest 1
	note F_, 1
	rest 3
	note F_, 1
	note D_, 1
	note F_, 1
	rest 1
	note F_, 1
	rest 3
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 3
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 3
	note D_, 1
	rest 3
	note D_, 1
	rest 3
	note D_, 1
	rest 3
	note D_, 1
	rest 3
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 3
	note F_, 2
	note E_, 1
	rest 1
	note D_, 2
	note C_, 1
	rest 1
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	rest 1
	note D_, 1
	rest 3
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	rest 1
	note D_, 1
	rest 3
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 3
	note C_, 1
	rest 3
	octave 3
	note G_, 1
	rest 3
	note A_, 1
	note F_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	note A_, 1
	note F_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	note G_, 1
	rest 3
	octave 4
	note C_, 1
	rest 3
	octave 3
	note F_, 1
	note C_, 1
	note F_, 1
	rest 1
	note F_, 1
	rest 3
	repeat_loop 0 ;------

Music_Forest_Ch2:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $b1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	speed 6
	stereo_panning $4
	fine_pitch $2
	volume_envelope $81
	mark_loop ;------
	transpose -12
	duty_cycle DUTY_75, DUTY_75
	note A_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	note F_, 1
	note A_, 2
	rest 1
	note F_, 2
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note C_, 1
	rest 3
	note G_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	note C_, 1
	note G_, 1
	note G_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	note G_, 1
	note A_, 1
	rest 1
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	note F_, 5
	rest 2
	note F_, 1
	note G_, 1
	note A_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	note F_, 1
	note A_, 3
	note G_, 1
	note A_, 1
	note A#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note A_, 1
	note G_, 2
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note C_, 1
	rest 3
	note G_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	note C_, 1
	note G_, 1
	rest 2
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	note G_, 1
	note A_, 1
	rest 1
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	note F_, 2
	rest 3
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note D_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	rest 2
	octave 3
	note A#, 1
	rest 1
	octave 4
	note F_, 1
	rest 1
	note D_, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	rest 2
	octave 3
	note A_, 1
	rest 1
	octave 4
	note F_, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 1
	note A#, 1
	rest 2
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note D_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	rest 2
	octave 3
	note A#, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note D_, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	note G_, 1
	note A_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	note F_, 1
	note A_, 1
	rest 2
	note G_, 1
	note A_, 1
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note F_, 1
	rest 5
	note F_, 1
	note G_, 1
	repeat_loop 0 ;------

Music_Forest_Ch3:
	sound_init 6, \ ; speed
	           $4, $84, $80 ; unknown
	stereo_panning $4
	speed 6
	mark_loop ;------
	transpose 0
	octave 1
	note F_, 2
	rest 1
	note F_, 1
	note F_, 3
	rest 1
	note F_, 1
	note F_, 1
	rest 1
	note F_, 1
	note F_, 3
	rest 1
	note A#, 2
	rest 1
	note A#, 1
	note A#, 2
	note A#, 2
	octave 2
	note C_, 3
	note C_, 1
	rest 2
	note C_, 2
	note C_, 2
	rest 1
	note C_, 1
	note C_, 3
	rest 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 2
	rest 2
	octave 1
	note F_, 2
	rest 1
	note F_, 1
	note F_, 2
	note C_, 2
	note F_, 3
	rest 1
	note F_, 3
	rest 1
	note F_, 1
	rest 2
	note F_, 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	note F_, 2
	note F_, 3
	rest 2
	note A#, 2
	rest 1
	note A#, 1
	note A#, 2
	note A#, 2
	octave 2
	note C_, 3
	rest 1
	note C_, 3
	rest 1
	note C_, 2
	rest 1
	note C_, 1
	note C_, 3
	rest 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 3
	rest 1
	octave 1
	note F_, 3
	rest 1
	note F_, 2
	rest 2
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 3
	rest 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	note A#, 1
	note A#, 3
	note A#, 1
	rest 1
	note A#, 2
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	note A_, 3
	note A_, 2
	note A_, 2
	note A_, 2
	note G_, 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	note G_, 2
	rest 1
	note G_, 2
	note G_, 1
	rest 1
	note G_, 2
	octave 2
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	note C_, 1
	note C_, 3
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	octave 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	note A#, 1
	note A#, 3
	note A#, 2
	note A#, 2
	note A#, 2
	octave 2
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 1
	note C_, 2
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	rest 2
	octave 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	rest 2
	note F_, 1
	note F_, 1
	rest 2
	note F_, 3
	rest 1
	octave 2
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	octave 1
	note F_, 1
	note F_, 1
	rest 2
	note F_, 2
	rest 2
	repeat_loop 0 ;------

Music_Forest_Ch4:
	sound_init 6 ; speed
	speed 6
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	note F_, 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	note F_, 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	note F_, 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	note E_, 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	repeat_loop 0 ;------
