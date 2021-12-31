
Music_Battle3_Ch1:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $61, \ ; unknown 1
	           0, 0, \ ; vibrato
	           $86, $12, $85 ; unknown 2
	speed 6
	stereo_panning $4
	fine_pitch $2
	transpose 0
	unknown_volume $10
	mark_loop ;------
	unknown_music_e9 $81
	duty_cycle DUTY_50, DUTY_50
	octave 2
	note A_, 5
	rest 1
	note A_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note G_, 2
	note D_, 10
	rest 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 6
	note C_, 2
	note C_, 4
	note D_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 2
	note B_, 8
	note G_, 4
	note A_, 6
	note A_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note G_, 2
	note D_, 11
	rest 1
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 3
	rest 1
	octave 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 8
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note E_, 2
	note A_, 6
	note A_, 4
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note G_, 6
	note G_, 8
	note E_, 2
	note F_, 6
	note F_, 4
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 6
	note E_, 6
	note C_, 2
	note E_, 2
	note A_, 6
	note A_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note G_, 4
	note D_, 4
	note E_, 4
	note G_, 4
	note A_, 5
	rest 1
	note A_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 6
	note E_, 2
	note E_, 4
	note D_, 2
	note E_, 2
	repeat_loop 0 ;------

Music_Battle3_Ch2:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $61, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	speed 6
	stereo_panning STEREO_CENTER
	unknown_volume $12
	fine_pitch $2
	mark_loop ;------
	unknown_music_e9 $81
	transpose -12
	duty_cycle DUTY_12, DUTY_12
	octave 2
	note A_, 2
	octave 3
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note G_, 1
	rest 2
	note G_, 1
	note G_, 1
	rest 2
	note G_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	note G_, 1
	note A_, 1
	note D_, 1
	rest 1
	octave 4
	note D_, 1
	note D_, 1
	rest 2
	note D_, 1
	note D_, 1
	rest 2
	note D_, 1
	note D_, 1
	note D_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note D_, 1
	rest 1
	note A_, 1
	note A_, 1
	note G_, 1
	rest 1
	note G_, 1
	rest 3
	note G_, 1
	note G_, 1
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	note A_, 1
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note F_, 1
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note F_, 1
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note F_, 1
	note F_, 1
	octave 2
	note E_, 1
	rest 1
	octave 3
	note F_, 1
	note F_, 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note G_, 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note G_, 1
	rest 2
	note G_, 1
	note G_, 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note G_, 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note G_, 1
	rest 2
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note G_, 1
	rest 2
	note G_, 1
	note G_, 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	note A_, 1
	rest 2
	note A_, 1
	rest 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note F_, 1
	note F_, 1
	rest 2
	note F_, 1
	note F_, 1
	rest 2
	note F_, 1
	note F_, 1
	rest 2
	note F_, 1
	rest 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note G_, 1
	rest 2
	note G_, 1
	note G_, 1
	rest 2
	note E_, 1
	note E_, 1
	rest 2
	note G_, 1
	rest 1
	repeat_loop 0 ;------

Music_Battle3_Ch3:
	sound_init 6, \ ; speed
	           $5, $84, $80 ; unknown
	stereo_panning $4
	speed 6
	mark_loop ;------
	transpose 12
	octave 0
	note A_, 2
	note A_, 2
	octave 1
	note C_, 2
	octave 0
	note A_, 2
	rest 2
	note G_, 2
	note A_, 4
	octave 1
	note D_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	rest 2
	note C_, 2
	note D_, 4
	octave 0
	note G_, 2
	note A_, 2
	note A_, 2
	octave 1
	note C_, 3
	rest 1
	octave 0
	note A_, 2
	note G_, 2
	note A_, 1
	rest 1
	note E_, 2
	note E_, 2
	note G_, 1
	rest 1
	note G_, 2
	note A_, 2
	note A_, 2
	octave 1
	note D_, 2
	note C_, 2
	octave 0
	note A_, 1
	rest 1
	note A_, 2
	octave 1
	note C_, 2
	octave 0
	note A_, 2
	rest 2
	note A_, 2
	octave 1
	note C_, 2
	note E_, 2
	note D_, 1
	rest 1
	note D_, 2
	octave 0
	note A_, 2
	octave 1
	note D_, 3
	rest 1
	note D_, 2
	octave 0
	note A_, 2
	octave 1
	note D_, 2
	octave 0
	note F_, 2
	note F_, 2
	note A_, 2
	rest 2
	note G_, 1
	rest 1
	note G_, 2
	octave 1
	note D_, 4
	octave 0
	note A_, 1
	rest 1
	note A_, 2
	octave 1
	note C_, 2
	octave 0
	note A_, 2
	rest 2
	note A_, 2
	octave 1
	note C_, 2
	note E_, 2
	octave 0
	note F_, 1
	rest 1
	note F_, 2
	note A_, 2
	note F_, 3
	rest 1
	note F_, 2
	octave 1
	note C_, 2
	octave 0
	note F_, 2
	note G_, 1
	rest 1
	note G_, 2
	octave 1
	note D_, 2
	octave 0
	note G_, 2
	rest 2
	note G_, 2
	octave 1
	note D_, 2
	octave 0
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 2
	note F_, 2
	rest 2
	note F_, 2
	note A_, 2
	note F_, 2
	note E_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	rest 2
	note E_, 2
	note G_, 2
	note E_, 2
	note F_, 2
	note F_, 2
	octave 1
	note C_, 2
	octave 0
	note F_, 2
	rest 2
	note F_, 2
	octave 1
	note C_, 2
	octave 0
	note F_, 2
	note G_, 1
	rest 1
	note G_, 2
	octave 1
	note D_, 2
	octave 0
	note G_, 1
	rest 3
	note A_, 2
	octave 1
	note E_, 2
	octave 0
	note A_, 2
	note F_, 2
	note F_, 2
	octave 1
	note C_, 2
	octave 0
	note F_, 2
	rest 2
	note F_, 2
	octave 1
	note C_, 2
	octave 0
	note F_, 2
	note G_, 2
	note G_, 2
	octave 1
	note D_, 2
	octave 0
	note G_, 2
	rest 2
	octave 1
	note D_, 2
	note E_, 2
	note G_, 2
	repeat_loop 0 ;------

Music_Battle3_Ch4:
	sound_init 6 ; speed
	stereo_panning STEREO_LEFT
	speed 6
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note E_, 2
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	rest 2
	repeat_loop 0 ;------
