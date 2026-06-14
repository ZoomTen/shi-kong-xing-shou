Music_Bgm73_Ch1:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	fine_pitch $2
	duty_cycle DUTY_50, DUTY_25
	speed 1
	mark_loop ;------
	duty_cycle DUTY_75, DUTY_75
	transpose 14
	volume_envelope $91
	stereo_panning $4
	rest 1
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	stereo_panning STEREO_CENTER
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	stereo_panning STEREO_RIGHT
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	sound_end

Music_Bgm73_Ch2:
	sound_init 1, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; volume envelope
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 1
	fine_pitch $2
	volume_envelope $91
	duty_cycle DUTY_75, 5
	mark_loop ;------
	duty_cycle DUTY_50, DUTY_50
	transpose -12
	stereo_panning $4
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	stereo_panning STEREO_CENTER
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	stereo_panning STEREO_RIGHT
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	sound_end

Music_Bgm73_Ch3:
	sound_init 1, \ ; speed
	           $2, $84, $80 ; unknown
	stereo_panning $4
	speed 1
	mark_loop ;------
	transpose 0
	rest 2
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	stereo_panning STEREO_CENTER
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	stereo_panning STEREO_LEFT
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	stereo_panning STEREO_RIGHT
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	sound_end

Music_Bgm73_Ch4:
	sound_init 6 ; speed
	speed 6
	mark_loop ;------
	rest 4
	sound_end
