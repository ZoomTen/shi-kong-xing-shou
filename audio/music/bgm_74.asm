Music_Bgm74_Ch1:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	fine_pitch $2
	duty_cycle DUTY_50, DUTY_50
	speed 8
	mark_loop ;------
	duty_cycle DUTY_75, DUTY_75
	transpose 0
	volume_envelope $91
	stereo_panning STEREO_LEFT
	rest 2
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 8
	sound_end

Music_Bgm74_Ch2:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; volume envelope
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 8
	fine_pitch $2
	volume_envelope $91
	duty_cycle DUTY_75, 5
	mark_loop ;------
	duty_cycle DUTY_50, DUTY_50
	transpose 0
	stereo_panning $4
	rest 1
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 8
	sound_end

Music_Bgm74_Ch3:
	sound_init 6, \ ; speed
	           $a, $84, $80 ; unknown
	stereo_panning $4
	speed 8
	mark_loop ;------
	transpose 12
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 8
	sound_end

Music_Bgm74_Ch4:
	sound_init 6 ; speed
	speed 6
	mark_loop ;------
	rest 4
	sound_end
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
