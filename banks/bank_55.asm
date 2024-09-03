AirportCutscene2::
	dr $154000, $154bad

unk_055_4bad:
	dr $154bad, $15530a

ObjectEvents_055_530a:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_055_5316
	objects_end

Script_055_5316:
	scr_04 text_55_53ae
	scr_end

unk_055_531a:
	scr_face $02 ; TEMP
	scr_spriteface  2, FACE_RIGHT
	scr_text text_55_53ae
	scr_checkbit wdaa4, $01, Script_055_532b
	scr_35 $05 ; TEMP
	scr_end

Script_055_532b:
	scr_end

ObjectEvents_055_532c:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_055_5343
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_055_5347
	objects_end

Script_055_5343:
	scr_text text_55_5367
	scr_end

Script_055_5347:
	scr_text text_55_537f
	scr_end

Script_055_534b:
	scr_face $01 ; TEMP
	scr_text text_55_5367
	scr_checkbit wdaa3, $03, Script_055_5358
	scr_37
	scr_end

Script_055_5358:
	scr_end

Script_055_5359:
	scr_face $01 ; TEMP
	scr_text text_55_537f
	scr_checkbit wdaa3, $03, Script_055_5366
	scr_36
	scr_end

Script_055_5366:
	scr_end

INCLUDE "data/text/bank55_misc2.asm"

Script_055_53ef::
	scr_end

Script_055_53f0:
	scr_end

ObjectEvents_055_53f1:
	objects_end

unk_055_53f2:
	dr $1553f2, $1553f6

ObjectEvents_055_53f6:
	object_event $19, 15,  6, 0, $00, $00, $08, $00, Script_055_5933
	object_event $1c,  4,  7, 0, $00, $00, $0b, $01, Script_055_5937
	object_event $1a, 11,  6, 0, $00, $00, $06, $02, Script_055_593b
	object_event $14,  5, 14, 0, $00, $00, $06, $03, Script_055_593f
	object_event $13, 21, 13, 0, $00, $00, $06, $04, Script_055_5943
	object_event $15,  3, 21, 0, $00, $00, $00, $00, Script_055_5947
	object_event $17,  9, 19, 0, $00, $00, $0b, $01, Script_055_594b
	object_event $16, 15, 21, 0, $00, $00, $0b, $02, Script_055_594f
	object_event $16, 11, 14, 0, $00, $00, $00, $00, Script_055_5953
	objects_end

unk_055_545a:
	dr $15545a, $155479

ObjectEvents_055_5479:
	object_event $08,  8,  5, wdaa7, $02, $01, $00, $00, Script_055_54b3
	object_event $1f,  6,  5, 0, $00, $00, $00, $01, Script_055_5536
	object_event $1e,  6,  7, 0, $00, $00, $00, $02, Script_055_553a
	objects_end

unk_055_549b:
	dr $15549b, $1554a7

unk_055_54a7:
	dr $1554a7, $1554b3

Script_055_54b3:
	scr_63 $00, Script_055_54c1
	scr_emote $02, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_04 text_55_645b
	scr_end

Script_055_54c1:
	scr_24
	scr_face $01 ; TEMP
	scr_text text_55_6326
	scr_text text_55_6364
	scr_emote $02, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_63b0
	scr_16 unk_055_549b ; TEMP
	scr_delay $03, $10 ; TEMP
	scr_16 unk_055_54a7 ; TEMP
	scr_1c $04 ; TEMP
	scr_spriteface  5, FACE_UP
	scr_spriteface  6, FACE_LEFT
	scr_spriteface  3, FACE_DOWN
	scr_spritewalk  3, MOVE_DOWN
	scr_spriteface  2, FACE_DOWN
	scr_face $00 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_emote $02, $00 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6408
	scr_move MovementData_OneDown
	scr_1a $06, $05, $f0, $00 ; TEMP
	scr_4e $05, unk_055_7c94
	scr_1c $05 ; TEMP
	scr_1c $06 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6452
	scr_face $05 ; TEMP
	scr_4e $00, unk_055_7e6b
	scr_1c $00 ; TEMP
	scr_text text_55_645b
	scr_setbit $daa7, $03 ; TEMP
	scr_1f $14 ; TEMP
	scr_34 $0b, $12, $01 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6489
	scr_end

Script_055_5536:
	scr_04 text_55_62ff
	scr_end

Script_055_553a:
	scr_04 text_55_62c8
	scr_end

ObjectEvents_055_553e:
	object_event $53, 16,  4, 0, $00, $00, $0a, $00, Script_055_5957
	object_event $54,  9,  2, 0, $00, $00, $06, $01, Script_055_5968
	object_event $53,  2,  6, 0, $00, $00, $00, $02, Script_055_5979
	object_event $55,  7, 17, 0, $00, $00, $0b, $03, Script_055_598a
	object_event $54,  9, 11, 0, $00, $00, $09, $04, Script_055_59a5
	object_event $55,  6,  8, wdaa8, $02, $00, $00, $00, Script_055_59f7
	object_event $55,  5,  8, wdaa8, $02, $01, $00, $00, Script_055_5a03
	object_event $53, 16, 15, 0, $00, $00, $00, $01, Script_055_59c0
	objects_end

ObjectEvents_055_5597:
	object_event $55,  4,  3, 0, $00, $00, $0b, $00, Script_055_5a0f
	objects_end

ObjectEvents_055_55a3:
	object_event $4a,  4,  4, wdaa8, $03, $00, $00, $00, Script_055_55af
	objects_end

Script_055_55af:
	scr_63 $00, Script_055_55bd
	scr_emote $02, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_04 text_55_68c8
	scr_end

Script_055_55bd:
	scr_spriteface  2, FACE_DOWN
	scr_24
	scr_face $01 ; TEMP
	scr_5f
	scr_spriteface  1, FACE_UP
	scr_text text_55_6894
	scr_emote $00, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_68d1
	scr_text text_55_68f6
	scr_emote $00, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6931
	scr_text text_55_693d
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_697d
	scr_text text_55_6997
	scr_face $03 ; TEMP
	scr_spriteface  2, FACE_RIGHT
	scr_spritewalk  2, MOVE_RIGHT
	scr_spriteface  2, FACE_DOWN
	scr_spritewalk  2, MOVE_DOWN
	scr_spriteface  2, FACE_LEFT
	scr_text text_55_69a5
	scr_text text_55_69eb
	scr_text text_55_6a12
	scr_text text_55_6a3e
	scr_text text_55_6a75
	scr_text text_55_6b37
	scr_spriteface  2, FACE_DOWN
	scr_4e $02, unk_055_7c94
	scr_1c $02 ; TEMP
	scr_setbit $daa8, $03 ; TEMP
	scr_end

ObjectEvents_055_561f:
	object_event $61,  2,  2, wdaa8, $04, $00, $00, $00, Script_055_53f0
	object_event $61,  3,  2, wdaa8, $04, $00, $00, $01, Script_055_53f0
	objects_end

ObjectEvents_055_5636:
	object_event $61,  2,  2, wdaa8, $04, $00, $00, $00, Script_055_53f0
	object_event $61,  3,  2, wdaa8, $04, $00, $00, $01, Script_055_53f0
	object_event $4a,  2,  3, wdaa8, $04, $00, $00, $02, Script_055_5666
	objects_end

unk_055_5658:
	dr $155658, $155666

Script_055_5666:
	scr_spriteface  2, FACE_RIGHT
	scr_text text_55_6b4c
	scr_spriteface  2, FACE_UP
	scr_spritewalk  2, MOVE_UP
	scr_1c $03 ; TEMP
	scr_face $01 ; TEMP
	scr_spriteface  1, FACE_UP
	scr_spriteface  2, FACE_RIGHT
	scr_spritewalk  2, MOVE_RIGHT
	scr_1c $04 ; TEMP
	scr_spriteface  2, FACE_DOWN
	scr_text text_55_6b89
	scr_spriteface  2, FACE_UP
	scr_spritewalk  2, MOVE_UP
	scr_spritewalk  2, MOVE_UP
	scr_spritewalk  2, MOVE_UP
	scr_1c $02 ; TEMP
	scr_1a $01, $00, $10, $00 ; TEMP
	scr_4e $00, unk_055_7c53
	scr_1b $01 ; TEMP
	scr_setmap $0f, $02 ; TEMP
	scr_spriteface  2, FACE_UP
	scr_emote $02, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6ba9
	scr_spriteface  2, FACE_RIGHT
	scr_face $03 ; TEMP
	scr_spritewalk  2, MOVE_RIGHT
	scr_spritewalk  2, MOVE_RIGHT
	scr_spritewalk  2, MOVE_RIGHT
	scr_spriteface  2, FACE_UP
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6bce
	scr_spritewalk  2, MOVE_UP
	scr_spritewalk  2, MOVE_UP
	scr_1c $02 ; TEMP
	scr_setbit $daa8, $04 ; TEMP
	scr_end

ObjectEvents_055_56d6:
	object_event $4a,  6,  4, wdaa8, $04, $00, $00, $00, Script_055_53f0
	objects_end

ObjectEvents_055_56e2:
	object_event $4a,  5,  7, 0, $00, $00, $00, $00, Script_055_53f0
	object_event $1e,  6,  3, 0, $00, $00, $00, $01, Script_055_53f0
	object_event $4c,  6,  6, 0, $00, $00, $00, $02, Script_055_53f0
	objects_end
; $155704

unk_055_5704:
	dr $155704, $155710

unk_055_5710:
	dr $155710, $15571d

Script_055_571d:
	scr_setmap $05, $00 ; TEMP
	scr_end

Script_055_5721:
	scr_checkbit wdaa8, $05, Script_055_571d
	scr_65 $00 ; TEMP
	scr_setmap $05, $01 ; TEMP
	scr_spriteface  3, $04 ; TEMP
	scr_spriteface  2, FACE_UP
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6bec
	scr_text text_55_6c08
	scr_emote $00, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6c84
	scr_text text_55_6c9b
	scr_emote $02, $00 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6ccc
	scr_text text_55_6d04
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_spritewalk  2, MOVE_UP
	scr_spriteface  2, FACE_RIGHT
	scr_spriteface  4, FACE_LEFT
	scr_text text_55_6d54
	scr_text text_55_6d9e
	scr_spriteface  4, FACE_UP
	scr_spriteface  2, FACE_UP
	scr_4e $02, unk_055_7df6
	scr_1c $02 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_spriteface  4, FACE_DOWN
	scr_text text_55_6da7
	scr_move MovementData_OneUp
	scr_spritewalk  1, MOVE_UP
	scr_emote $00, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6e1f
	scr_text text_55_6e29
	scr_3b unk_055_4bad
	scr_checkbit wdaa3, $03, Script_055_5823
	scr_1c $04 ; TEMP
	scr_spriteface  3, $05 ; TEMP
	scr_4e $03, unk_055_7d7f
	scr_spriteface  3, FACE_DOWN
	scr_spritewalk  3, MOVE_DOWN
	scr_spriteface  3, FACE_RIGHT
	scr_face $02 ; TEMP
	scr_text text_55_6e53
	scr_44
	scr_spritewalk  3, MOVE_RIGHT
	scr_1c $03 ; TEMP
	scr_face $01 ; TEMP
	scr_text text_55_6eb9
	scr_16 unk_055_5704 ; TEMP
	scr_4e $02, unk_055_7f17
	scr_1c $02 ; TEMP
	scr_16 unk_055_5704 ; TEMP
	scr_4e $02, unk_055_7f40
	scr_1c $02 ; TEMP
	scr_16 unk_055_5704 ; TEMP
	scr_4e $02, unk_055_7f6d
	scr_1c $02 ; TEMP
	scr_16 unk_055_5710 ; TEMP
	scr_4e $02, unk_055_7c94
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6ed6
	scr_4e $02, unk_055_7d36
	scr_1c $02 ; TEMP
	scr_text text_55_6f0b
	scr_48 $02, $0f
	scr_setbit $daa8, $05 ; TEMP
	scr_34 $09, $24, $01 ; TEMP
	scr_spriteface  3, FACE_UP
	scr_text text_55_6f21
	scr_emote $02, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6f4e
	scr_text text_55_6fa0
	scr_spriteface  3, FACE_DOWN
	scr_4e $03, unk_055_7cd5
	scr_1c $03 ; TEMP
	scr_face $00 ; TEMP
	scr_setmap $0f, $01 ; TEMP
	scr_end

Script_055_5823:
	scr_face $00 ; TEMP
	scr_setmap $04, $00 ; TEMP
	scr_end

ObjectEvents_055_5829:
	object_event $4d,  6,  4, 0, $00, $00, $00, $00, Script_055_53f0
	object_event $62,  6,  5, 0, $00, $00, $00, $01, Script_055_53f0
	objects_end

ObjectEvents_055_5840:
	object_event $54,  2,  4, 0, $00, $00, $00, $00, Script_055_587c
	object_event $55,  9,  4, 0, $00, $00, $00, $01, Script_055_58aa
	object_event $53,  7,  2, 0, $00, $00, $00, $02, Script_055_58bf
	objects_end

Script_055_5862:
	scr_63 $03, Script_055_586f
	scr_face $02 ; TEMP
	scr_spriteface  2, FACE_RIGHT
	scr_text text_55_64e9
	scr_end

Script_055_586f:
	scr_face $02 ; TEMP
	scr_spriteface  2, FACE_RIGHT
	scr_text text_55_67b7
	scr_farjump Script_055_5887
	scr_end

Script_055_587c:
	scr_63 $03, Script_055_5884
	scr_04 text_55_64e9
	scr_end

Script_055_5884:
	scr_04 text_55_67b7

Script_055_5887:
	scr_checkbit wdaa3, $03, Script_055_588f
	scr_37
	scr_end

Script_055_588f:
	scr_end

Script_055_5890:
	scr_63 $03, Script_055_589d
	scr_face $03 ; TEMP
	scr_spriteface  3, FACE_LEFT
	scr_text text_55_64f1
	scr_end

Script_055_589d:
	scr_face $03 ; TEMP
	scr_spriteface  3, FACE_LEFT
	scr_text text_55_683c
	scr_farjump Script_055_58b5
	scr_end

Script_055_58aa:
	scr_63 $03, Script_055_58b2
	scr_04 text_55_64f1
	scr_end

Script_055_58b2:
	scr_04 text_55_683c

Script_055_58b5:
	scr_checkbit wdaa4, $01, Script_055_58be
	scr_35 $06 ; TEMP
	scr_end

Script_055_58be:
	scr_end

Script_055_58bf:
	scr_04 text_55_53c5
	scr_checkbit wdaa3, $03, Script_055_58ca
	scr_36
	scr_end

Script_055_58ca:
	scr_end

ObjectEvents_055_58cb:
	object_event $18,  5,  5, 0, $00, $00, $00, $00, Script_055_5a1b
	object_event $1d,  8,  5, 0, $00, $00, $00, $01, Script_055_5a4c
	objects_end

ObjectEvents_055_58e2:
	object_event $1f,  3,  3, 0, $00, $00, $00, $00, Script_055_5a50
	object_event $1e,  5,  5, 0, $00, $00, $06, $01, Script_055_5a54
	objects_end

ObjectEvents_055_58f9:
	object_event $16,  3,  4, 0, $00, $00, $00, $00, Script_055_5a6d
	object_event $19,  8,  3, 0, $00, $00, $06, $01, Script_055_5a71
	objects_end

ObjectEvents_055_5910:
	object_event $1b,  4,  5, 0, $00, $00, $06, $00, Script_055_5a75
	objects_end

ObjectEvents_055_591c:
	object_event $08,  4,  4, wdaa7, $02, $00, $00, $00, Script_055_5a79
	object_event $4b,  6,  3, 0, $00, $00, $00, $01, Script_055_5a7d
	objects_end

Script_055_5933:
	scr_04 text_55_5b1f
	scr_end

Script_055_5937:
	scr_04 text_55_5b52
	scr_end

Script_055_593b:
	scr_04 text_55_5ba0
	scr_end

Script_055_593f:
	scr_04 text_55_5be3
	scr_end

Script_055_5943:
	scr_04 text_55_5c28
	scr_end

Script_055_5947:
	scr_04 text_55_5c6f
	scr_end

Script_055_594b:
	scr_04 text_55_5cbb
	scr_end

Script_055_594f:
	scr_04 text_55_5d0a
	scr_end

Script_055_5953:
	scr_04 text_55_5fc7
	scr_end

Script_055_5957:
	scr_63 $03, Script_055_595f
	scr_04 text_55_64aa
	scr_end

Script_055_595f:
	scr_04 text_55_64f9
	scr_setbit $daa7, $04 ; TEMP
	db $3f ; TEMP
	scr_end

Script_055_5968:
	scr_63 $03, Script_055_5970
	scr_04 text_55_64b2
	scr_end

Script_055_5970:
	scr_04 text_55_650e
	scr_setbit $daa7, $05 ; TEMP
	db $3f ; TEMP
	scr_end

Script_055_5979:
	scr_63 $03, Script_055_5981
	scr_04 text_55_64ba
	scr_end

Script_055_5981:
	scr_04 text_55_653d
	scr_setbit $daa7, $06 ; TEMP
	db $3f ; TEMP
	scr_end

Script_055_598a:
	scr_63 $03, Script_055_5992
	scr_04 text_55_64c2
	scr_end

Script_055_5992:
	scr_checkbit wdaa8, $05, Script_055_59a1
	scr_04 text_55_65c6
	scr_setbit $daa7, $07 ; TEMP
	db $3f ; TEMP
	scr_end

Script_055_59a1:
	scr_04 text_55_6fab
	scr_end

Script_055_59a5:
	scr_63 $03, Script_055_59ad
	scr_04 text_55_64ca
	scr_end

Script_055_59ad:
	scr_checkbit wdaa8, $05, Script_055_59bc
	scr_04 text_55_6630
	scr_setbit $daa8, $00 ; TEMP
	db $3f ; TEMP
	scr_end

Script_055_59bc:
	scr_04 text_55_6fda
	scr_end

Script_055_59c0:
	scr_63 $03, Script_055_59c8
	scr_04 text_55_64da
	scr_end

Script_055_59c8:
	scr_checkbit wdaa8, $05, Script_055_59d7
	scr_04 text_55_6684
	scr_setbit $daa8, $01 ; TEMP
	db $3f ; TEMP
	scr_end

Script_055_59d7:
	scr_24
	scr_face $01 ; TEMP
	scr_5f
	scr_spriteface  1, FACE_UP
	scr_text text_55_7043
	scr_emote $00, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_70ad
	scr_text text_55_70ee
	scr_text text_55_7109
	scr_face $00 ; TEMP
	db $66 ; TEMP
	scr_35 $41 ; TEMP
	db $5c ; TEMP
	scr_end

Script_055_59f7:
	scr_63 $03, Script_055_59ff
	scr_04 text_55_64d2
	scr_end

Script_055_59ff:
	scr_04 text_55_6704
	scr_end

Script_055_5a03:
	scr_63 $03, Script_055_5a0b
	scr_04 text_55_64d2
	scr_end

Script_055_5a0b:
	scr_04 text_55_672a
	scr_end

Script_055_5a0f:
	scr_63 $03, Script_055_5a17
	scr_04 text_55_64e1
	scr_end

Script_055_5a17:
	scr_04 text_55_673a
	scr_end

Script_055_5a1b:
	scr_04 text_55_5d57
	scr_spriteface  3, FACE_LEFT
	scr_text text_55_5da9
	scr_spriteface  2, FACE_RIGHT
	scr_emote $02, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_5dc7
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_5dd7
	scr_text text_55_5e09
	scr_emote $03, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_5e3e
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_end

Script_055_5a4c:
	scr_04 text_55_5da9
	scr_end

Script_055_5a50:
	scr_04 text_55_5e56
	scr_end

Script_055_5a54:
	scr_04 text_55_5e96
	scr_spriteface  2, FACE_DOWN
	scr_text text_55_5edc
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_5efc
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_end

Script_055_5a6d:
	scr_04 text_55_5f11
	scr_end

Script_055_5a71:
	scr_04 text_55_5f65
	scr_end

Script_055_5a75:
	scr_04 text_55_5f91
	scr_end

Script_055_5a79:
	scr_04 text_55_5fe4
	scr_end

Script_055_5a7d:
	scr_checkbit wdaa7, $02, Script_055_5aeb
	scr_24
	scr_face $01 ; TEMP
	scr_5f
	scr_spriteface  1, FACE_UP
	scr_text text_55_6073
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_spriteface  3, FACE_LEFT
	scr_delay $03, $10 ; TEMP
	scr_spriteface  3, FACE_RIGHT
	scr_delay $03, $10 ; TEMP
	scr_spriteface  3, FACE_DOWN
	scr_text text_55_6122
	scr_spriteface  2, FACE_RIGHT
	scr_spritewalk  2, MOVE_RIGHT
	scr_spriteface  2, FACE_UP
	scr_text text_55_6144
	scr_face $02 ; TEMP
	scr_spriteface  3, FACE_LEFT
	scr_spritewalk  3, MOVE_LEFT
	scr_spriteface  3, FACE_DOWN
	scr_text text_55_6168
	scr_emote $02, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_6193
	scr_emote $03, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_55_61c5
	scr_text text_55_61ce
	scr_spriteface  2, FACE_DOWN
	scr_4e $02, unk_055_7c94
	scr_1c $02 ; TEMP
	scr_spritewalk  3, MOVE_DOWN
	scr_spriteface  3, FACE_RIGHT
	scr_text text_55_61e2
	scr_setbit $daa7, $02 ; TEMP
	scr_end

Script_055_5aeb:
	scr_04 text_55_6288
	scr_end

INCLUDE "data/text/bank55_misc.asm"

unk_055_7c53:
	dr $157c53, $157c94

unk_055_7c94:
	dr $157c94, $157cd5

unk_055_7cd5:
	dr $157cd5, $157d36

unk_055_7d36:
	dr $157d36, $157d7f

unk_055_7d7f:
	dr $157d7f, $157df6

unk_055_7df6:
	dr $157df6, $157e6b

unk_055_7e6b:
	dr $157e6b, $157f17

unk_055_7f17:
	dr $157f17, $157f40

unk_055_7f40:
	dr $157f40, $157f6d

unk_055_7f6d:
	dr $157f6d, $157fff

