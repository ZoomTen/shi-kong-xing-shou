Music_Racing_Ch1:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	fine_pitch $2
	duty_cycle DUTY_25, DUTY_25
	mark_loop ;------
	transpose -10
	stereo_panning $2
	octave 4
	note G_, 1
	rest 3
	note G_, 2
	note F_, 2
	note G_, 1
	rest 3
	note G_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	rest 6
	note D#, 1
	rest 3
	note D#, 2
	note C_, 2
	note D#, 1
	rest 7
	rest 2
	note D_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 1
	rest 3
	note G_, 2
	note F_, 2
	note G_, 1
	rest 3
	note G_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 3
	rest 5
	note D#, 1
	rest 3
	note D#, 2
	rest 2
	note F_, 2
	rest 2
	note F_, 1
	rest 3
	note G_, 2
	rest 2
	note G_, 2
	rest 2
	note G_, 2
	rest 2
	octave 5
	note C_, 3
	rest 1
	rest 2
	note C_, 1
	rest 3
	note C_, 1
	rest 3
	note C_, 1
	rest 3
	note C_, 1
	rest 1
	rest 2
	octave 4
	note A#, 1
	rest 3
	note A#, 1
	rest 3
	note A#, 1
	rest 3
	note A#, 1
	rest 1
	rest 2
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note D#, 1
	rest 3
	note D#, 1
	rest 1
	rest 2
	note C_, 1
	rest 3
	note D_, 1
	rest 3
	note D#, 1
	rest 1
	note F_, 2
	note G_, 1
	rest 1
	rest 2
	octave 5
	note C_, 1
	rest 3
	note C_, 1
	rest 3
	note C_, 1
	rest 3
	note C_, 1
	rest 1
	rest 2
	octave 4
	note A#, 1
	rest 3
	note A#, 1
	rest 3
	note A#, 1
	rest 3
	note A#, 1
	rest 1
	rest 2
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 1
	rest 2
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note F_, 1
	rest 1
	note G_, 3
	rest 1
	repeat_loop 0 ;------

Music_Racing_Ch2:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; unknown 1
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 6
	fine_pitch $2
	unknown_music_e9 $a1
	duty_cycle DUTY_50, DUTY_50
	mark_loop ;------
	transpose -10
	stereo_panning $4
	note C_, 1
	rest 3
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 1
	rest 3
	note C_, 2
	octave 3
	note A#, 1
	rest 1
	octave 4
	note C_, 2
	note D_, 2
	note D_, 1
	rest 1
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note D#, 1
	rest 1
	note C_, 1
	rest 3
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 1
	rest 3
	note D_, 2
	note D#, 2
	note F_, 2
	note G_, 4
	note G#, 4
	note G_, 2
	note F_, 2
	note G_, 2
	octave 4
	note C_, 2
	rest 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 1
	rest 3
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note D#, 2
	note C_, 2
	note D#, 3
	rest 1
	note F_, 3
	rest 1
	note G_, 3
	rest 1
	note A#, 2
	note A#, 1
	rest 1
	note G_, 2
	note A#, 2
	note B_, 2
	octave 4
	note C_, 1
	rest 1
	note D#, 2
	note F_, 2
	note D#, 2
	octave 5
	note C_, 1
	rest 3
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	rest 3
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	rest 2
	note D#, 4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 1
	rest 3
	note G_, 2
	note F_, 2
	note G_, 2
	rest 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 3
	rest 1
	note A#, 4
	note G#, 2
	note G_, 2
	note D#, 2
	note C_, 2
	rest 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	rest 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	rest 2
	note G#, 3
	rest 1
	octave 4
	note C_, 3
	rest 1
	octave 3
	note B_, 2
	note B_, 1
	rest 1
	octave 4
	note C_, 3
	rest 1
	note D_, 4
	note F_, 2
	note D#, 2
	note D_, 2
	repeat_loop 0 ;------

Music_Racing_Ch3:
	sound_init 6, \ ; speed
	           $2, $84, $80 ; unknown
	stereo_panning $4
	speed 6
	mark_loop ;------
	transpose 2
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	note G_, 2
	note G#, 2
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	note G_, 2
	note G#, 2
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	note G#, 2
	note A#, 2
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 2
	note C_, 2
	octave 1
	note A#, 2
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note A#, 2
	octave 2
	note C_, 1
	rest 1
	octave 1
	note C_, 2
	octave 2
	note C_, 2
	octave 0
	note A#, 2
	octave 1
	note A#, 2
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	note G_, 2
	note G#, 2
	note C_, 1
	rest 1
	note A#, 1
	note A#, 2
	rest 1
	note A#, 2
	note C_, 2
	octave 2
	note C_, 1
	note C_, 2
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	note D#, 2
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	rest 1
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note G#, 2
	octave 1
	note G#, 1
	note G#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 0
	note A#, 2
	octave 1
	note A#, 1
	note A#, 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note C_, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note G_, 1
	note G_, 1
	octave 1
	note F_, 2
	octave 2
	note F_, 1
	note F_, 1
	octave 1
	note D#, 2
	octave 2
	note D#, 1
	note D#, 1
	octave 1
	note D_, 2
	octave 2
	note D_, 1
	note D_, 1
	repeat_loop 0 ;------

Music_Racing_Ch4:
	sound_init 6 ; speed
	speed 6
	note D#, 2
	note C#, 1
	note C#, 1
	note D_, 2
	note C#, 1
	note C#, 1
	repeat_loop 0 ;------
