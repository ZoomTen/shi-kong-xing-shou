
Music_Town4_Ch1:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	stereo_panning $4
	unknown_music_e9 $91
	speed 8
	transpose -12
	fine_pitch $1
	duty_cycle DUTY_50, 5
	mark_loop ;------
	octave 3
	note F_, 4
	note G#, 2
	note A#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 4
	note G#, 2
	note A#, 2
	note G_, 7
	rest 1
	note F_, 4
	note G#, 2
	note A#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note G#, 2
	note A#, 2
	note F_, 4
	note D#, 2
	note G#, 2
	note D#, 4
	note C#, 4
	note F_, 4
	note G#, 2
	note A#, 2
	note G_, 4
	note F_, 2
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note F_, 2
	note G#, 2
	note G_, 4
	note F_, 4
	note F_, 4
	note G#, 2
	note A#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note A#, 4
	note G#, 4
	note D#, 7
	rest 1
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note D#, 6
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F#, 2
	note F#, 6
	note F_, 2
	note F#, 2
	note G#, 2
	note F_, 2
	note A#, 2
	note A#, 6
	note A_, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 4
	note C_, 4
	note C#, 4
	octave 3
	note F_, 4
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note D#, 6
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F#, 2
	note F#, 6
	note F_, 2
	note F#, 2
	note G#, 2
	note F_, 2
	note A#, 2
	note A#, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note D#, 2
	note C_, 4
	octave 3
	note G#, 5
	rest 1
	note D#, 2
	note F_, 3
	rest 1
	repeat_loop 0 ;------

Music_Town4_Ch2:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	speed 8
	fine_pitch $2
	transpose -12
	unknown_music_e9 $11
	duty_cycle DUTY_12, DUTY_12
	mark_loop2 ;------
	stereo_panning STEREO_CENTER
	unknown_volume $10
	note F_, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 3
	note A#, 1
	rest 1
	note D#, 1
	rest 3
	note A#, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 3
	note D#, 1
	rest 1
	note A#, 1
	rest 3
	rest 2
	octave 4
	note C#, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note D#, 1
	rest 1
	note A#, 1
	rest 5
	rest 2
	note F_, 1
	rest 1
	note A#, 1
	rest 1
	octave 4
	note C_, 2
	note C#, 1
	rest 3
	note C_, 2
	rest 2
	octave 3
	note A#, 1
	rest 1
	note D#, 1
	note D#, 1
	note F_, 1
	rest 1
	octave 4
	note C#, 2
	rest 2
	octave 3
	note A#, 2
	rest 4
	rest 2
	note D#, 1
	rest 1
	note F_, 2
	octave 4
	note C#, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note D#, 1
	rest 5
	rest 2
	note F_, 1
	rest 1
	octave 4
	note C#, 2
	rest 2
	octave 3
	note A#, 1
	rest 1
	note D#, 1
	rest 5
	rest 2
	note F_, 1
	rest 1
	note A#, 1
	rest 7
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	octave 4
	note F_, 1
	note D#, 1
	octave 3
	note A#, 1
	note G#, 1
	note A#, 1
	rest 1
	octave 4
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note A#, 1
	rest 1
	octave 4
	note F_, 1
	note D#, 1
	octave 3
	note A#, 1
	note G#, 1
	note A#, 1
	rest 1
	octave 4
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note A#, 1
	rest 1
	octave 4
	note D#, 1
	rest 3
	note F_, 1
	rest 3
	note G#, 1
	rest 3
	note F_, 1
	rest 3
	note D#, 1
	note F_, 1
	note C#, 1
	rest 1
	note C_, 1
	rest 3
	octave 3
	note A#, 1
	rest 3
	note G#, 1
	rest 3
	octave 4
	note F_, 1
	note D#, 1
	octave 3
	note A#, 1
	note G#, 1
	note A#, 1
	rest 1
	octave 4
	note D#, 1
	rest 1
	note D#, 1
	rest 3
	note F_, 1
	rest 3
	note D#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	octave 3
	note A#, 1
	rest 3
	octave 4
	note D#, 1
	rest 3
	note F_, 1
	rest 3
	note C#, 1
	rest 7
	octave 3
	note A#, 1
	rest 3
	note G#, 1
	rest 3
	octave 4
	note C_, 1
	note C#, 1
	note D#, 1
	rest 5
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note G#, 1
	rest 1
	repeat_loop2 0 ;------

Music_Town4_Ch3:
	sound_init 7, \ ; speed
	           $1, $86, $b0 ; unknown
	stereo_panning $4
	speed 8
	transpose 12
	mark_loop ;------
	octave 0
	note G#, 1
	rest 1
	note A#, 1
	rest 1
	octave 1
	note F_, 4
	octave 0
	note A#, 1
	rest 1
	octave 1
	note D#, 6
	octave 0
	note G#, 2
	note A#, 1
	rest 1
	octave 1
	note F_, 4
	octave 0
	note A#, 1
	rest 1
	octave 1
	note D#, 6
	octave 0
	note G#, 1
	rest 1
	note A#, 1
	rest 1
	octave 1
	note F_, 4
	note D#, 2
	note A#, 6
	octave 0
	note A#, 4
	rest 4
	note G#, 1
	rest 1
	octave 1
	note D#, 2
	note G#, 4
	octave 0
	note G#, 2
	note A#, 2
	octave 1
	note F_, 4
	note D#, 1
	rest 1
	note A#, 4
	octave 0
	note G#, 2
	note A#, 2
	octave 1
	note C#, 1
	rest 1
	note F_, 4
	note D#, 1
	rest 1
	note A#, 6
	octave 0
	note A#, 2
	octave 1
	note C#, 2
	note F_, 4
	note D#, 7
	rest 1
	octave 0
	note G#, 2
	note A#, 2
	octave 1
	note C#, 2
	note F_, 2
	note G#, 2
	note A#, 6
	note D#, 2
	note F#, 2
	note A#, 4
	note F_, 2
	note G#, 6
	octave 0
	note A#, 2
	octave 1
	note F_, 2
	note D#, 6
	rest 2
	note F_, 4
	octave 0
	note A#, 2
	octave 1
	note D#, 2
	note F_, 8
	octave 0
	note G#, 4
	note A#, 2
	octave 1
	note C#, 2
	note D#, 2
	note F_, 2
	note G#, 2
	note A#, 2
	note G#, 2
	note F_, 2
	octave 0
	note A#, 2
	octave 1
	note D#, 2
	note D#, 5
	rest 1
	octave 0
	note A#, 2
	octave 1
	note D#, 4
	note D#, 2
	note F#, 1
	rest 1
	note F#, 4
	note A#, 4
	note F#, 4
	note F_, 6
	rest 2
	octave 0
	note G#, 1
	rest 1
	note A#, 1
	rest 1
	octave 1
	note F_, 4
	note D#, 4
	rest 4
	note F_, 1
	rest 1
	note G#, 5
	rest 1
	repeat_loop 0 ;------

Music_Town4_Ch4:
	sound_init 5 ; speed
	speed 8
	mark_loop ;------
	rest 4
	rest 4
	rest 4
	note D_, 4
	repeat_loop 0 ;------
