
Music_Trouble_Ch1:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; unknown 1
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 7
	fine_pitch $2
	unknown_music_e9 $a3
	duty_cycle DUTY_75, DUTY_50
	mark_loop ;------
	transpose 13
	stereo_panning STEREO_LEFT
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	octave 1
	note F_, 2
	octave 2
	note E_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	octave 1
	note G_, 2
	octave 2
	note D_, 2
	note E_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note G_, 2
	octave 1
	note F_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	octave 1
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 1
	note G_, 2
	octave 3
	note C_, 2
	note G_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	duty_cycle DUTY_25, DUTY_50
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note C_, 2
	duty_cycle DUTY_75, DUTY_50
	octave 1
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 1
	rest 1
	duty_cycle DUTY_25, DUTY_50
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	note C_, 2
	octave 1
	note F_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	octave 1
	note G_, 2
	octave 2
	note D_, 2
	note A_, 2
	note G_, 2
	repeat_loop 0 ;------

Music_Trouble_Ch2:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; unknown 1
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 7
	fine_pitch $2
	unknown_music_e9 $51
	duty_cycle DUTY_50, DUTY_50
	mark_loop ;------
	transpose -11
	stereo_panning STEREO_CENTER
	octave 3
	note E_, 2
	note A_, 2
	rest 2
	octave 4
	note E_, 8
	rest 2
	rest 4
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C_, 9
	rest 1
	rest 4
	octave 3
	note G_, 2
	note A_, 3
	rest 7
	rest 4
	octave 4
	note C_, 3
	rest 1
	octave 3
	note B_, 4
	note A_, 3
	rest 1
	rest 4
	note A_, 1
	rest 1
	octave 4
	note E_, 8
	rest 2
	rest 4
	octave 3
	note F_, 1
	rest 1
	octave 4
	note C_, 3
	rest 7
	rest 10
	note G_, 1
	rest 1
	note E_, 2
	rest 2
	note C_, 11
	rest 5
	octave 3
	note A_, 4
	rest 8
	note B_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note B_, 1
	rest 11
	octave 4
	note C_, 1
	rest 1
	note D_, 1
	rest 1
	note C_, 1
	rest 15
	rest 8
	note C_, 1
	rest 1
	note D_, 1
	rest 1
	note E_, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A_, 2
	rest 8
	note B_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note D_, 1
	rest 1
	octave 3
	note B_, 1
	rest 11
	octave 4
	note C_, 2
	note D_, 1
	rest 1
	note E_, 2
	rest 3
	note D_, 2
	rest 1
	note C_, 1
	rest 3
	note D_, 2
	rest 2
	note C_, 1
	rest 3
	octave 3
	note B_, 1
	rest 3
	note A_, 1
	rest 3
	note G_, 1
	rest 3
	repeat_loop 0 ;------

Music_Trouble_Ch3:
	sound_init 7, \ ; speed
	           $4, $84, $80 ; unknown
	stereo_panning $4
	speed 7
	mark_loop ;------
	transpose 13
	octave 0
	note A_, 3
	rest 5
	note A_, 1
	note A_, 2
	rest 5
	note F_, 3
	rest 5
	note F_, 1
	note F_, 3
	rest 4
	note G_, 3
	rest 5
	note G_, 1
	note G_, 2
	rest 5
	note A_, 3
	rest 5
	note A_, 1
	note A_, 2
	rest 1
	note A_, 1
	note A_, 3
	note A_, 1
	note A_, 2
	rest 5
	note A_, 1
	note A_, 2
	rest 5
	note F_, 1
	note F_, 1
	rest 6
	note F_, 1
	rest 1
	note F_, 2
	rest 4
	note G_, 1
	note G_, 1
	rest 6
	note G_, 1
	rest 1
	note G_, 2
	rest 4
	note A_, 1
	note A_, 1
	rest 6
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 2
	note F_, 2
	rest 2
	note F_, 3
	rest 1
	note F_, 3
	rest 1
	note F_, 3
	rest 1
	note G_, 3
	rest 1
	note G_, 3
	rest 1
	note G_, 3
	rest 1
	note G_, 3
	rest 1
	note A_, 1
	note A_, 2
	rest 5
	note A_, 2
	rest 6
	note A_, 1
	note A_, 2
	rest 5
	note A_, 3
	rest 1
	note A_, 3
	rest 1
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 1
	rest 1
	note F_, 2
	note F_, 2
	note G_, 1
	rest 1
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 1
	note A_, 1
	rest 6
	note G_, 1
	note G_, 2
	rest 5
	octave 1
	note F_, 1
	note F_, 2
	rest 5
	note E_, 2
	note D_, 2
	note C_, 2
	octave 0
	note B_, 2
	repeat_loop 0 ;------

Music_Trouble_Ch4:
	sound_init 7 ; speed
	speed 7
	mark_loop ;------
	note F_, 1
	note F_, 1
	rest 6
	note F_, 1
	note F_, 1
	rest 1
	note C#, 1
	note D_, 1
	rest 3
	note F_, 2
	rest 6
	note F_, 1
	note F_, 1
	rest 1
	note C#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	rest 1
	repeat_loop 0 ;------
