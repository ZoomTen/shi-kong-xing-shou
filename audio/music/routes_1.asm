
Music_Routes1_Ch1:
	sound_init 8, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $61, \ ; unknown 1
	           0, 0, \ ; vibrato
	           $86, $12, $85 ; unknown 2
	speed 7
	stereo_panning $4
	fine_pitch $2
	unknown_music_e9 $a1
	transpose -11
	mark_loop ;------
	duty_cycle DUTY_50, DUTY_75
	octave 4
	note C_, 8
	note D_, 2
	note D#, 2
	note A#, 2
	note F_, 2
	note F_, 6
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 4
	octave 4
	note C_, 8
	note D_, 2
	note D#, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	note A#, 2
	note F_, 4
	note D#, 4
	note D_, 2
	note D#, 2
	note F_, 2
	note C_, 5
	rest 1
	note C_, 2
	note D_, 2
	note D#, 2
	note G_, 2
	note F_, 2
	note F_, 2
	rest 4
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 5
	rest 1
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 1
	rest 1
	note G_, 2
	note G_, 2
	note A#, 3
	rest 1
	octave 5
	note C_, 4
	note D#, 2
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 4
	note C_, 2
	octave 4
	note A#, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	note G_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note G_, 2
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 4
	note C_, 2
	octave 4
	note A#, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	octave 5
	note D_, 4
	note D#, 2
	note C_, 2
	octave 4
	note G_, 2
	rest 2
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 4
	note D#, 2
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note D_, 3
	rest 1
	repeat_loop 0 ;------

Music_Routes1_Ch2:
	sound_init 8, \ ; speed
	           DUTY_25, DUTY_25, \ ; duty cycle
	           $b1, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	speed 7
	stereo_panning $4
	fine_pitch $2
	unknown_music_e9 $91
	mark_loop ;------
	transpose -23
	duty_cycle DUTY_12, DUTY_12
	octave 3
	note D#, 2
	note G_, 2
	octave 4
	note C_, 4
	rest 2
	octave 3
	note G_, 2
	octave 4
	note C_, 3
	rest 1
	rest 2
	octave 3
	note F_, 2
	octave 4
	note C_, 3
	rest 3
	octave 3
	note A#, 2
	note F_, 2
	note A#, 2
	rest 1
	octave 4
	note C_, 1
	octave 3
	note G_, 2
	octave 4
	note C_, 3
	rest 3
	octave 3
	note G_, 2
	octave 4
	note C_, 3
	rest 1
	rest 2
	octave 3
	note F_, 2
	note A#, 2
	rest 4
	note A#, 2
	rest 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note D#, 2
	rest 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note D#, 2
	note D#, 1
	rest 1
	note C_, 2
	rest 2
	octave 3
	note F_, 3
	rest 1
	note F_, 2
	rest 2
	note D#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note D#, 3
	rest 3
	octave 3
	note G_, 2
	octave 4
	note D#, 2
	rest 2
	rest 4
	note D_, 3
	rest 1
	note C_, 3
	rest 1
	octave 3
	note A#, 3
	rest 1
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 2
	octave 3
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	octave 3
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
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 2
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 2
	note D_, 2
	octave 3
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	note G_, 1
	rest 1
	note G_, 1
	note G_, 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	repeat_loop 0 ;------

Music_Routes1_Ch3:
	sound_init 8, \ ; speed
	           $5, $84, $80 ; unknown
	stereo_panning $4
	speed 7
	mark_loop ;------
	transpose 1
	octave 2
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 2
	octave 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	note G_, 2
	note A#, 2
	octave 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	octave 1
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	note G_, 2
	note A#, 2
	octave 2
	note C_, 2
	note C_, 2
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	octave 1
	note F_, 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	note G_, 2
	octave 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 2
	octave 1
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 1
	rest 1
	note A#, 2
	note A#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	note A#, 2
	note G_, 2
	note G_, 2
	note G_, 1
	rest 1
	note G_, 2
	octave 2
	note C_, 1
	rest 1
	note C_, 2
	note C_, 1
	rest 1
	note C_, 2
	octave 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	octave 2
	note C_, 2
	note C_, 2
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	note D#, 2
	note D_, 2
	octave 1
	note A#, 2
	note G#, 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 2
	note A#, 1
	rest 1
	note A#, 2
	note A#, 1
	rest 1
	note A#, 2
	note G_, 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 2
	octave 2
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	octave 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	repeat_loop 0 ;------

Music_Routes1_Ch4:
	sound_init 8 ; speed
	speed 7
	mark_loop ;------
	note D#, 1
	rest 1
	note C#, 1
	note C#, 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note C#, 1
	note C#, 1
	note D#, 1
	rest 1
	note C#, 1
	note C#, 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	note D#, 1
	rest 5
	note C#, 1
	rest 1
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note C#, 1
	rest 3
	repeat_loop 0 ;------
