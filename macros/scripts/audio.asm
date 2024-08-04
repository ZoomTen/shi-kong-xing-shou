; Header commands
MACRO channel_count
    assert (\1) <= 4 && 0 < (\1), \
    "channel_count: must not exceed maximum number of GB channels"

    db (1 << \1) - 1
ENDM

MACRO sfx_starting_channel
    db \1
ENDM

MACRO channel
    dw \1
ENDM

; Channel commands
MACRO note
    dn (\1), (\2) ; pitch, length
ENDM

MACRO rest
    note __, (\1)
ENDM

    const_def $d0

    const sound_init_cmd ; $d0
MACRO sound_init
    assert (\1) <= 15 && 0 < (\1), \
    "sound_init: speed must not exceed 15"

    db sound_init_cmd + (\1)

IF _NARG == 9
    assert 0<=(\2) && (\2)<=3, "sound_init: duty_cycle 1st argument between 0 - 3"
    assert 0<=(\3) && (\3)<=3, "sound_init: duty_cycle 2nd argument between 0 - 3"
    dn (\2), (\3) ; duty cycle

    db (\4)
    dn (\5), (\6) ; vibrato
    db (\7), (\8), (\9) ; unknown
ELIF _NARG == 4
    db (\2), (\3), (\4)
endc
ENDM

    const_skip 15
    const octave_cmd ; $e0
MACRO octave
    db octave_cmd + (\1)
ENDM

    const_skip 7
    const duty_cycle_cmd ; $e8
MACRO duty_cycle
    db duty_cycle_cmd
    dn (\1), (\2)
ENDM

    const unknown_music_e9_cmd ; $e9
MACRO unknown_music_e9
    db unknown_music_e9_cmd, (\1)
ENDM

    const unknown_music_ea_cmd ; $ea
MACRO unknown_music_ea
    db unknown_music_ea_cmd, (\1)
ENDM

    const vibrato_cmd ; $eb
MACRO vibrato
    db vibrato_cmd
    dn (\1), (\2) 
ENDM

    const transpose_cmd  ;  $ec
MACRO transpose
    db transpose_cmd, (\1)
ENDM

    const unknown_music_ed_cmd ; $ed
MACRO unknown_music_ed
    db unknown_music_ed_cmd, (\1)
ENDM

    const unknown_volume_cmd ; $ee
MACRO unknown_volume
    db unknown_volume_cmd, (\1)
if (\1) > $7f
    db (\2), (\3)
endc
ENDM

    const fine_pitch_cmd ; $ef
MACRO fine_pitch
    db fine_pitch_cmd, (\1)
ENDM

    const unknown_music_f0_cmd ; $f0 xx volume only?
MACRO unknown_music_f0
    db unknown_music_f0_cmd, (\1)
ENDM

    const unknown_music_f1_cmd ; $f1 xx vol param 1?
MACRO unknown_music_f1
    db unknown_music_f1_cmd, (\1)
ENDM
    
    const unknown_music_f2_cmd ; $f2 xx vol param 2?
MACRO unknown_music_f2
    db unknown_music_f2_cmd, (\1)
ENDM
    
    const stereo_panning_cmd   ; $f3 xx
MACRO stereo_panning
    db stereo_panning_cmd, (\1)
ENDM
        
    const unknown_music_f4_cmd ; $f4 xx yy ?
MACRO unknown_music_f4
    db unknown_music_f4_cmd, (\1), (\2)
ENDM
        
    const sound_nop_cmd        ; $f5
MACRO sound_nop
    db sound_nop
ENDM
        
    const speed_cmd            ; $f6
MACRO speed
    db speed_cmd, (\1)
ENDM
        
    const sound_call_cmd       ; $f7
MACRO sound_call
    dbw sound_call_cmd, (\1)
ENDM
        
    const sound_call2_cmd      ; $f8
MACRO sound_call2
    dbw sound_call2_cmd, (\1)
 ENDM
        
    const sound_ret_cmd        ; $f9
MACRO sound_ret
    db sound_ret_cmd
ENDM
        
    const sound_ret2_cmd       ; $fa
MACRO sound_ret2
    db sound_ret2_cmd
ENDM
        
    const mark_loop_cmd        ; $fb
MACRO mark_loop
    db mark_loop_cmd
ENDM
        
    const mark_loop2_cmd       ; $fc
MACRO mark_loop2
    db mark_loop2_cmd
ENDM
        
    const repeat_loop_cmd      ; $fd
MACRO repeat_loop
    db repeat_loop_cmd, (\1)
ENDM
        
    const repeat_loop2_cmd     ; $fe
MACRO repeat_loop2
    db repeat_loop2_cmd, (\1)
ENDM
        
    const sound_end_cmd        ; $ff
MACRO sound_end
    db sound_end_cmd
ENDM
        
