ObjectEvents_00f_4000:
	objects_end

unk_00f_4001:
	scr_end

unk_00f_4002:
	scr_setmap $0c, $00 ; TEMP
	scr_end

unk_00f_4006:
	scr_setmap $0c, $02 ; TEMP
	scr_end

Script_00f_400a:
	scr_checkbit wdaa2, $06, unk_00f_4016
	db $66 ; TEMP
	scr_spriteface $40, $0e ; TEMP
	scr_end

unk_00f_4015:
	scr_end

unk_00f_4016:
	scr_setmap $0c, $01 ; TEMP
	scr_end

ObjectEvents_00f_401a:
	object_event $19,  7,  3, 0, $00, $00, $00, $00, unk_00f_4031
	object_event $16,  6,  6, 0, $00, $00, $06, $01, unk_00f_4035
	objects_end

unk_00f_4031:
	scr_04 text_0f_56ca
	scr_end

unk_00f_4035:
	scr_04 text_0f_573b
	scr_end

ObjectEvents_00f_4039:
	object_event $13,  4,  3, 0, $00, $00, $00, $00, unk_00f_405b
	object_event $1b,  6,  6, 0, $00, $00, $06, $01, unk_00f_4069
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, unk_00f_406d
	objects_end

unk_00f_405b:
	scr_checkbit wdaa1, $05, unk_00f_4065
	scr_04 text_0f_57ad
	scr_end

unk_00f_4065:
	scr_04 text_0f_58a2
	scr_end

unk_00f_4069:
	scr_04 text_0f_5811
	scr_end

unk_00f_406d:
	scr_checkbit wdaa1, $05, unk_00f_4095
	scr_spriteface $04, $03 ; TEMP
	scr_emote $04, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_spriteface $04, $02 ; TEMP
	scr_spriteface $02, $03 ; TEMP
	scr_text text_0f_5820
	scr_text text_0f_5877
	scr_spriteface $02, $00 ; TEMP
	scr_text text_0f_5881
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_end

unk_00f_4095:
	scr_04 text_0f_58cc
	scr_spriteface $02, $03 ; TEMP
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_5936
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_end

PowerPlantOutside_ObjectEvents2:
	object_event $2b,  5,  6, wdaa2, $04, $00, $00, $00, unk_00f_4001
	object_event $2e,  7,  7, wdaa2, $04, $00, $00, $01, unk_00f_4001
	objects_end

PowerPlantOutside_ObjectEvents:
	object_event $2b,  5,  6, wdaa2, $04, $00, $00, $00, unk_00f_40ce
	objects_end

unk_00f_40ce:
	scr_checkbit wdaa1, $06, unk_00f_40d8
	scr_04 text_0f_4691
	scr_end

unk_00f_40d8:
	scr_checkbit wdaa2, $03, unk_00f_40ef
	scr_04 text_0f_4691
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_46aa
	scr_setbit $daa1, $07 ; TEMP
	scr_end

unk_00f_40ef:
	scr_text text_0f_4a46
	scr_text text_0f_4a5a
	scr_face $02 ; TEMP
	scr_setmap $1d, $02 ; TEMP
	scr_spriteface $03, $02 ; TEMP
	scr_spriteface $02, $03 ; TEMP
	scr_spritewalk $03, $03 ; TEMP
	scr_spritewalk $03, $03 ; TEMP
	scr_spriteface $02, $00 ; TEMP
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_spriteface $03, $03 ; TEMP
	scr_spritewalk $03, $03 ; TEMP
	scr_spriteface $03, $01 ; TEMP
	scr_spritewalk $03, $02 ; TEMP
	scr_spriteface $03, $03 ; TEMP
	scr_spriteface $02, $02 ; TEMP
	scr_emote $02, $02 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_spriteface $03, $02 ; TEMP
	scr_1a $02, $03, $00, $10 ; TEMP
	scr_4e $03, unk_00f_45d4
	scr_1b $03 ; TEMP
	scr_emote $02, $00 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_4a72
	scr_emote $02, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_4a8e
	scr_3b $4ae3 ; XXX text_0f_4ae3
	scr_checkbit wdaa3, $03, unk_00f_415c
	scr_1c $03 ; TEMP
	scr_1c $02 ; TEMP
	scr_setbit $daa2, $04 ; TEMP
	scr_end

unk_00f_415c:
	scr_setmap $1d, $03 ; TEMP
	scr_end

PowerPlant1F_ObjectEvents:
	object_event $34,  9,  6, 0, $00, $00, $00, $00, unk_00f_41fe
	object_event $34,  9,  4, 0, $00, $00, $00, $01, unk_00f_41fe
	object_event $34,  2,  3, 0, $00, $00, $00, $02, unk_00f_41fe
	object_event $34,  2,  5, 0, $00, $00, $00, $03, unk_00f_41fe
	objects_end

PowerPlant2F_ObjectEvents:
	object_event $34,  9,  6, 0, $00, $00, $00, $00, unk_00f_41fe
	object_event $34,  2,  3, 0, $00, $00, $00, $01, unk_00f_41fe
	object_event $17,  7,  4, wdaa2, $05, $00, $00, $02, unk_00f_41ff
	objects_end

PowerPlant3F_ObjectEvents:
	object_event $34,  6,  5, 0, $00, $00, $00, $00, unk_00f_41fe
	object_event $34,  6,  3, 0, $00, $00, $00, $01, unk_00f_41fe
	object_event $34,  2,  4, 0, $00, $00, $00, $02, unk_00f_41fe
	object_event $34,  2,  6, 0, $00, $00, $00, $03, unk_00f_41fe
	objects_end

PowerPlant4F_ObjectEvents:
	object_event $34,  7,  6, 0, $00, $00, $00, $00, unk_00f_41fe
	object_event $27,  7,  4, wdaa2, $06, $00, $00, $01, unk_00f_41fe
	object_event $28,  8,  4, wdaa2, $06, $00, $00, $02, unk_00f_41fe
	objects_end

unk_00f_41fe:
	scr_end

unk_00f_41ff:
	scr_04 text_0f_4ab7
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_4ac7
	scr_text text_0f_4ad7
	scr_spriteface $04, $02 ; TEMP
	scr_4e $04, unk_00f_59b1
	scr_1c $04 ; TEMP
	scr_setbit $daa2, $05 ; TEMP
	scr_end

Script_00f_421c:
	scr_checkbit wdaa2, $06, unk_00f_42af
	scr_spriteface $03, $03 ; TEMP
	scr_spriteface $04, $02 ; TEMP
	scr_text text_0f_4b28
	scr_text text_0f_4b4c
	scr_spriteface $03, $00 ; TEMP
	scr_spriteface $04, $00 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_emote $04, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_4b71
	scr_text text_0f_4b86
	scr_3b $4b12 ; XXX text_0f_4ae3
	scr_checkbit wdaa3, $03, unk_00f_42a3
	scr_text text_0f_4bc3
	scr_spriteface $03, $02 ; TEMP
	scr_spriteface $04, $02 ; TEMP
	scr_1a $04, $03, $00, $10 ; TEMP
	scr_4e $03, unk_00f_594f
	scr_1b $03 ; TEMP
	scr_4e $03, unk_00f_5980
	scr_1c $03 ; TEMP
	scr_spriteface $04, $03 ; TEMP
	scr_text text_0f_4bf0
	scr_spriteface $04, $02 ; TEMP
	scr_4e $04, unk_00f_5980
	scr_1c $04 ; TEMP
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_4c3c
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_move $4193 ; TEMP
	scr_move $4193 ; TEMP
	scr_face $03 ; TEMP
	scr_move $413e ; TEMP
	scr_move $413e ; TEMP
	scr_face $01 ; TEMP
	scr_text text_0f_4c47
	scr_setbit $daa2, $06 ; TEMP
	scr_1f $07 ; TEMP
	scr_face $00 ; TEMP
	scr_setmap $0c, $01 ; TEMP
	scr_end

unk_00f_42a3:
	scr_face $00 ; TEMP
	scr_move $4191 ; TEMP
	scr_move $4191 ; TEMP
	scr_spriteface $01, $00 ; TEMP
	scr_end

unk_00f_42af:
	scr_end

TechCity_ObjectEvents:
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, unk_00f_4309
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, unk_00f_430d
	object_event $16, 11, 17, 0, $00, $00, $05, $02, unk_00f_4311
	object_event $19, 24, 10, 0, $00, $00, $00, $03, unk_00f_4315
	object_event $17,  7, 10, 0, $00, $00, $00, $04, unk_00f_4319
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, unk_00f_431d
	object_event $21, 24,  6, 0, $00, $00, $00, $01, unk_00f_4321
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, unk_00f_4325
	objects_end

unk_00f_4309:
	scr_04 text_0f_4c56
	scr_end

unk_00f_430d:
	scr_04 text_0f_4c89
	scr_end

unk_00f_4311:
	scr_04 text_0f_4cc8
	scr_end

unk_00f_4315:
	scr_04 text_0f_4d0f
	scr_end

unk_00f_4319:
	scr_04 text_0f_4d50
	scr_end

unk_00f_431d:
	scr_04 text_0f_5627
	scr_end

unk_00f_4321:
	scr_04 text_0f_4da4
	scr_end

unk_00f_4325:
	scr_04 text_0f_5673
	scr_end

ObjectEvents_00f_4329:
	object_event $12,  7,  5, 0, $00, $00, $0b, $00, unk_00f_4340
	object_event $1d,  6,  3, 0, $00, $00, $00, $01, unk_00f_4344
	objects_end

unk_00f_4340:
	scr_04 text_0f_4e1b
	scr_end

unk_00f_4344:
	scr_04 text_0f_55c3
	scr_end

ObjectEvents_00f_4348:
	object_event $16,  5,  5, 0, $00, $00, $00, $00, unk_00f_435f
	object_event $17,  9,  4, 0, $00, $00, $00, $01, unk_00f_4371
	objects_end

unk_00f_435f:
	scr_checkbit wdaa2, $07, unk_00f_436d
	scr_04 text_0f_4e54
	scr_setbit $daa2, $07 ; TEMP
	scr_end

unk_00f_436d:
	scr_04 text_0f_4e9b
	scr_end

unk_00f_4371:
	scr_04 text_0f_4eae
	scr_end

TechShop_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, unk_00f_4381
	objects_end

unk_00f_4381:
	scr_04 text_0f_4ebe
	scr_end

Script_00f_4385:
	scr_face $02 ; TEMP
	scr_spriteface $02, $03 ; TEMP
	scr_text text_0f_4ebe
	scr_checkbit wdaa4, $01, unk_00f_4396
	scr_35 $00 ; TEMP
	scr_end

unk_00f_4396:
	scr_end

TechHealingCenter_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, unk_00f_43ae
	object_event $25,  8,  2, 0, $00, $00, $00, $01, unk_00f_43b2
	objects_end

unk_00f_43ae:
	scr_text text_0f_4efb
	scr_end

unk_00f_43b2:
	scr_text text_0f_4f13
	scr_end

Script_00f_43b6:
	scr_face $01 ; TEMP
	scr_text text_0f_4efb
	scr_checkbit wdaa3, $03, unk_00f_43c3
	scr_37
	scr_end

unk_00f_43c3:
	scr_end

Script_00f_43c4:
	scr_face $01 ; TEMP
	scr_text text_0f_4f13
	scr_checkbit wdaa3, $03, unk_00f_43d1
	scr_36
	scr_end

unk_00f_43d1:
	scr_end

ObjectEvents_00f_43d2:
	object_event $29,  5,  5, 0, $00, $00, $00, $00, unk_00f_4427
	object_event $2d,  6,  4, wdaa3, $00, $00, $00, $01, unk_00f_4423
	objects_end

ObjectEvents_00f_43e9:
	object_event $29,  5,  5, 0, $00, $00, $00, $00, unk_00f_44d1
	object_event $02,  4,  3, wdaa3, $01, $00, $00, $01, unk_00f_4422
	object_event $03,  3,  3, wdaa3, $01, $00, $00, $02, unk_00f_4422
	object_event $2d,  6,  4, wdaa3, $00, $00, $00, $03, unk_00f_4422
	objects_end

ObjectEvents_00f_4416:
	object_event $29,  5,  5, 0, $00, $00, $00, $00, unk_00f_44db
	objects_end

unk_00f_4422:
	scr_end

unk_00f_4423:
	scr_04 text_0f_4f42
	scr_end

unk_00f_4427:
	scr_face $01 ; TEMP
	scr_65 $00 ; TEMP
	scr_62 $01, $00 ; TEMP
	scr_setmap $12, $01 ; TEMP
	scr_emote $02, $00 ; TEMP
	scr_delay $02, $20 ; TEMP
	scr_text text_0f_4f94
	scr_emote $00, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_4fca
	scr_text text_0f_4fdc
	scr_face $02 ; TEMP
	scr_move $413c ; TEMP
	scr_move $413c ; TEMP
	scr_text text_0f_504b
	scr_face $01 ; TEMP
	scr_text text_0f_5097
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_face $03 ; TEMP
	scr_move $413e ; TEMP
	scr_move $413e ; TEMP
	scr_face $01 ; TEMP
	scr_spriteface $02, $01 ; TEMP
	scr_spritewalk $02, $02 ; TEMP
	scr_spritewalk $02, $02 ; TEMP
	scr_delay $03, $10 ; TEMP
	scr_spriteface $02, $03 ; TEMP
	scr_spritewalk $02, $04 ; TEMP
	scr_spritewalk $02, $04 ; TEMP
	scr_spriteface $02, $01 ; TEMP
	scr_delay $03, $10 ; TEMP
	scr_spriteface $02, $02 ; TEMP
	scr_spritewalk $02, $03 ; TEMP
	scr_spritewalk $02, $03 ; TEMP
	scr_spriteface $02, $00 ; TEMP
	scr_spritewalk $02, $01 ; TEMP
	scr_spritewalk $02, $01 ; TEMP
	scr_text text_0f_50ed
	scr_emote $00, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_51c1
	db $52 ; TEMP
	scr_spriteface $05, $02 ; TEMP
	scr_spritewalk $05, $03 ; TEMP
	scr_spritewalk $05, $03 ; TEMP
	scr_spriteface $05, $00 ; TEMP
	scr_spritewalk $05, $01 ; TEMP
	scr_spriteface $05, $03 ; TEMP
	scr_emote $05, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0f_5200
	scr_spriteface $05, $00 ; TEMP
	scr_spritewalk $05, $01 ; TEMP
	scr_spritewalk $05, $01 ; TEMP
	scr_spritewalk $05, $01 ; TEMP
	scr_spritewalk $05, $01 ; TEMP
	scr_1c $05 ; TEMP
	scr_setbit $daa3, $00 ; TEMP
	scr_end

unk_00f_44d1:
	scr_checkbit wdaa3, $01, unk_00f_44db
	scr_04 text_0f_5299
	scr_end

unk_00f_44db:
	scr_04 text_0f_554f
	scr_end

Script_00f_44df:
	scr_checkbit wdaa3, $01, unk_00f_458e
	scr_spriteface $02, $00 ; TEMP
	scr_text text_0f_52fb
	scr_face $01 ; TEMP
	scr_move $4193 ; TEMP
	scr_44
	scr_spritewalk $01, $01 ; TEMP
	scr_spriteface $01, $01 ; TEMP
	scr_face $03 ; TEMP
	scr_move $413e ; TEMP
	scr_face $01 ; TEMP
	scr_spriteface $01, $03 ; TEMP
	scr_spritewalk $01, $04 ; TEMP
	scr_spriteface $01, $01 ; TEMP
unk_00f_4507:
	scr_spritewalk $02, $01 ; TEMP
	scr_text text_0f_531f
	scr_text text_0f_538f
	scr_48 $02, $06
	scr_text text_0f_539e
	scr_48 $02, $07
	scr_text text_0f_53ad
	scr_spriteface $03, $00 ; TEMP
	scr_spriteface $04, $00 ; TEMP
	scr_1a $04, $03, $00, $f0 ; TEMP
	scr_4e $03, unk_00f_5a12
	scr_1b $03 ; TEMP
	scr_spriteface $03, $03 ; TEMP
	scr_spriteface $02, $02 ; TEMP
	scr_text text_0f_53e1
	scr_text text_0f_53f6
	scr_text text_0f_5439
	scr_spriteface $03, $00 ; TEMP
	scr_spriteface $02, $01 ; TEMP
	scr_spritewalk $02, $02 ; TEMP
	scr_spriteface $02, $02 ; TEMP
	scr_spritewalk $02, $03 ; TEMP
	scr_spritewalk $02, $03 ; TEMP
	scr_spriteface $02, $00 ; TEMP
	scr_delay $03, $10 ; TEMP
	scr_spriteface $02, $02 ; TEMP
	scr_spritewalk $02, $03 ; TEMP
	scr_spriteface $02, $00 ; TEMP
	scr_spritewalk $02, $01 ; TEMP
	scr_spriteface $02, $03 ; TEMP
	scr_text text_0f_5446
	scr_44
	scr_spritewalk $03, $01 ; TEMP
	scr_1c $03 ; TEMP
	scr_spriteface $04, $03 ; TEMP
	scr_spritewalk $04, $04 ; TEMP
	scr_spriteface $04, $00 ; TEMP
	scr_spritewalk $04, $01 ; TEMP
	scr_1c $04 ; TEMP
	scr_62 $01, $01 ; TEMP
	scr_text text_0f_54ad
	scr_text text_0f_54c5
	scr_spriteface $02, $00 ; TEMP
	scr_text text_0f_5521
	scr_setbit $daa3, $01 ; TEMP
	scr_end

unk_00f_458e:
	scr_setmap $0c, $08 ; TEMP
	scr_end

Script_00f_4592:
	scr_checkbit wdaa3, $01, unk_00f_458e
	scr_spriteface $02, $00 ; TEMP
	scr_text text_0f_52fb
	scr_face $01 ; TEMP
	scr_move $4193 ; TEMP
	scr_44
	scr_spritewalk $01, $01 ; TEMP
	scr_spriteface $01, $01 ; TEMP
	scr_farjump unk_00f_4507
	scr_end

Script_00f_45af:
	scr_checkbit wdaa3, $01, unk_00f_45b9
	scr_setmap $12, $00 ; TEMP
	scr_end

unk_00f_45b9:
	scr_setmap $12, $02 ; TEMP
	scr_end

Script_00f_45bd:
	scr_text text_0f_557d
	scr_checkbit wdaa3, $01, unk_00f_45c7
	scr_end

unk_00f_45c7:
	scr_63 $01, unk_00f_45cf
	scr_text text_0f_5595
	scr_end

unk_00f_45cf:
	db $66 ; TEMP
	db $89 ; TEMP
	db $41 ; TEMP
	db $12 ; TEMP
	scr_end

unk_00f_45d4:
	dr $3c5d4, $3c691

IF "{LANG}" == "fr"
INCLUDE "data/translated/fr/bank0f_misc.asm"
INCLUDE "data/translated/fr/bank0f_misc2.asm"
ELIF "{LANG}" == "id"
INCLUDE "data/translated/id/bank0f_misc.asm"
INCLUDE "data/translated/id/bank0f_misc2.asm"
ELSE
INCLUDE "data/translated/en/bank0f_misc.asm"
INCLUDE "data/translated/en/bank0f_misc2.asm"
ENDC

unk_00f_594f::
	dr $3d94f, $3d980

unk_00f_5980::
	dr $3d980, $3d9b1

unk_00f_59b1::
	dr $3d9b1, $3da12

unk_00f_5a12::
	dr $3da12, $3da80

SECTION "banknumf", ROMX[$7fff], BANK[$f]
	db $f
