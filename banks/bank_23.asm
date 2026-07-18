Func_023_4000::
	ld de, MoveAnimScript_Pointers
	ld a, [wBattleAnimID]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wBattleScriptPos], a
	ld a, [hli]
	ld [wBattleScriptPos + 1], a
	ret

INCLUDE "data/moves/anim_pointers.asm"

; battle-anim scripts, indexed via MoveAnimScript_Pointers (VM via AdvanceBattleScriptMode; opcode table unreversed)
BattleAnimScript_023_4132::
	anim_58
	anim_01
	anim_02 $50, $70, $20, $20, $01
	anim_80 SFX_1c
	anim_04 $00, $07, $08, $01, $02
	anim_04 $00, $03, $0b, $02, $03
	anim_80 SFX_26
	anim_04 $00, $03, $13, $03, $00
	anim_06 $06, $01
	anim_07 $00, $01
	anim_03
BattleAnimScript_023_4157::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_4c
	anim_71 $00, ObjectAnim_02e_697b
	anim_20
	anim_80 SFX_3b
	anim_72 $01, ObjectAnim_02e_6986
	anim_20
	anim_18 $03, $04
	anim_07 $01, $01
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4174::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_16
	anim_02 $50, $70, $20, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_674f
	anim_06 $06, $01
	anim_03
BattleAnimScript_023_418b::
	anim_58
	anim_01
	anim_02 $10, $18, $40, $68, $01
	anim_80 SFX_35
	anim_09 $00, $07, $00, MovementDeltas_02e_6740
	anim_14 $33, SubImage_033_444c
	anim_09 $00, $07, $00, MovementDeltas_02e_6747
	anim_14 $33, SubImage_033_4b0e
	anim_09 $00, $07, $00, MovementDeltas_02e_674c
	anim_06 $06, $00
	anim_03
BattleAnimScript_023_41b3::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_02 $40, $68, $10, $18, $01
	anim_80 SFX_3d
	anim_09 $00, $03, $00, MovementDeltas_02e_671a
	anim_17 $01, $04
	anim_18 $07, $04
	anim_06 $06, $01
	anim_03
BattleAnimScript_023_41d0::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_670c
	anim_80 SFX_2b
	anim_17 $01, $04
	anim_18 $07, $04
	anim_69 $00, $01
	anim_03
BattleAnimScript_023_41ed::
	anim_58
	anim_01
	anim_80 SFX_33
	anim_02 $40, $80, $30, $28, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_33
	anim_02 $50, $68, $10, $30, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_33
	anim_02 $50, $78, $20, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_33
	anim_02 $60, $80, $30, $38, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_33
	anim_02 $48, $70, $20, $30, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_17 $01, $04
	anim_18 $07, $04
	anim_07 $00, $01
	anim_03
BattleAnimScript_023_423f::
	anim_58
	anim_01
	anim_02 $10, $18, $40, $68, $01
	anim_80 SFX_27
	anim_09 $00, $07, $00, MovementDeltas_02e_66da
	anim_05 $00, $01, ScrollDeltas_02e_68fd
	anim_09 $00, $07, $00, MovementDeltas_02e_66e7
	anim_14 $33, SubImage_033_4c90
	anim_80 SFX_1f
	anim_09 $00, $07, $00, MovementDeltas_02e_66ed
	anim_14 $33, SubImage_033_5352
	anim_80 SFX_42
	anim_09 $00, $07, $00, MovementDeltas_02e_66f4
	anim_70 $cc, $67
	anim_03
BattleAnimScript_023_4276::
	anim_58
	anim_01
	anim_80 SFX_13
	anim_13
	anim_09 $00, $07, $00, MovementDeltas_02e_66bf
	anim_17 $01, $04
	anim_18 $07, $04
	db $44, $10, $50, $13, $0d, $09, $00, $07, $00, $bf, $66, $11, $01, $04, $12, $07, $04, $3c
	db $44, $10, $50, $13, $0d, $09, $00, $07, $00, $bf, $66, $11, $01, $04, $12, $07, $04, $3c
	anim_03
BattleAnimScript_023_42ac::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2b
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_66b3
	anim_14 $33, SubImage_033_5834
	anim_80 SFX_2b
	anim_09 $00, $07, $00, MovementDeltas_02e_66a9
	anim_20
	anim_23 $04
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_42d2::
	anim_01
	anim_02 $10, $18, $40, $68, $01
	anim_80 SFX_51
	anim_09 $00, $07, $00, MovementDeltas_02e_66a1
	anim_14 $33, SubImage_033_5ed6
	anim_09 $00, $07, $00, MovementDeltas_02e_669b
	anim_14 $33, SubImage_033_66d8
	anim_09 $00, $07, $00, MovementDeltas_02e_6696
	anim_17 $00, $04
	anim_18 $07, $04
	anim_69 $03, $00
	anim_03
BattleAnimScript_023_42ff::
	anim_01
	anim_02 $10, $18, $40, $68, $01
	anim_80 SFX_32
	anim_09 $00, $07, $00, MovementDeltas_02e_6684
	anim_14 $33, SubImage_033_6cda
	anim_80 SFX_0c
	anim_80 SFX_33
	anim_09 $00, $07, $00, MovementDeltas_02e_668c
	anim_14 $33, SubImage_033_739c
	anim_09 $00, $07, $00, MovementDeltas_02e_6691
	anim_69 $01, $00
	anim_03
BattleAnimScript_023_432a::
	anim_58
	anim_01
	anim_02 $38, $60, $08, $10, $01
	anim_80 SFX_29
	anim_09 $00, $07, $00, MovementDeltas_02e_666c
	anim_14 $3a, GFX_03a_4000
	anim_09 $00, $07, $00, MovementDeltas_02e_6675
	anim_14 $3a, (GFX_03a_4000 + 2050)
	anim_09 $00, $07, $00, MovementDeltas_02e_667d
	anim_06 $02, $01
	anim_03
BattleAnimScript_023_4352::
	anim_01
	anim_02 $10, $18, $40, $68, $01
	anim_80 SFX_21
	anim_09 $00, $07, $00, MovementDeltas_02e_664d
	anim_14 $3a, (GFX_03a_4000 + 3332)
	anim_09 $00, $07, $00, MovementDeltas_02e_6655
	anim_14 $3a, (GFX_03a_4000 + 5062)
	anim_80 SFX_1f
	anim_09 $00, $07, $00, MovementDeltas_02e_665a
	anim_14 $3a, (GFX_03a_4000 + 6600)
	anim_06 $04, $00
	anim_03
BattleAnimScript_023_437f::
	anim_58
	anim_01
	anim_80 SFX_36
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6645
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4393::
	anim_58
	anim_01
	anim_80 SFX_18
	anim_72 $03, ObjectAnim_02e_699c
	anim_20
	anim_18 $03, $02
	anim_80 SFX_51
	anim_72 $02, ObjectAnim_02e_69c8
	anim_20
	anim_06 $04, $01
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_43ad::
	anim_58
	anim_01
	anim_80 SFX_18
	anim_72 $03, ObjectAnim_02e_699c
	anim_20
	anim_18 $03, $02
	anim_80 SFX_51
	anim_72 $02, ObjectAnim_02e_69c8
	anim_20
	anim_06 $04, $01
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_43c7::
	anim_01
	anim_02 $10, $08, $38, $70, $01
	anim_80 SFX_4c
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_4c
	anim_02 $28, $28, $60, $78, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_4c
	anim_02 $30, $10, $50, $58, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_4c
	anim_02 $10, $20, $38, $58, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_80 SFX_4c
	anim_02 $20, $18, $48, $68, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6640
	anim_17 $00, $04
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_4415::
	anim_01
	anim_80 SFX_12
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_662b
	anim_80 SFX_12
	anim_02 $10, $10, $40, $60, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_662b
	anim_80 SFX_12
	anim_02 $10, $20, $40, $70, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_662b
	anim_20
	anim_18 $03, $04
	anim_80 SFX_12
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6632
	anim_06 $06, $00
	anim_03
BattleAnimScript_023_4456::
	anim_58
	anim_01
	anim_80 SFX_16
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6623
	anim_17 $00, $04
	anim_18 $07, $04
	anim_80 SFX_16
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6623
	anim_69 $00, $01
	anim_03
BattleAnimScript_023_447e::
	anim_58
	anim_01
	anim_80 SFX_17
	anim_02 $10, $18, $40, $68, $01
	anim_06 $01, $00
	anim_09 $00, $07, $00, MovementDeltas_02e_6606
	anim_14 $3a, (GFX_03a_4000 + 7690)
	anim_09 $00, $03, $00, MovementDeltas_02e_660e
	anim_06 $06, $00
	anim_80 SFX_35
	anim_02 $40, $68, $10, $18, $00
	anim_09 $00, $07, $00, MovementDeltas_02e_6614
	anim_06 $04, $01
	anim_60
	anim_03
BattleAnimScript_023_44b1::
	anim_58
	anim_01
	anim_80 BGM_57
	anim_02 $18, $18, $48, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6598
	anim_80 SFX_4c
	anim_19
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_44c8::
	anim_58
	anim_01
	anim_80 SFX_4c
	anim_02 $40, $68, $10, $18, $01
	anim_06 $01, $01
	anim_06 $02, $01
	anim_06 $01, $01
	anim_06 $02, $01
	anim_20
	anim_18 $03, $01
	anim_80 SFX_4c
	anim_02 $40, $68, $10, $18, $02
	anim_06 $01, $01
	anim_06 $02, $01
	anim_06 $01, $01
	anim_20
	anim_18 $03, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_44fb::
	anim_01
	anim_80 SFX_26
	anim_17 $00, $04
	anim_18 $07, $04
	anim_80 SFX_10
	anim_69 $03, $00
	anim_03
BattleAnimScript_023_450a::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2b
	anim_02 $48, $70, $18, $20, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_657d
	anim_11 $01, $bc, $5b, $06
	anim_18 $0f, $07
	anim_03
BattleAnimScript_023_4526::
	anim_58
	anim_01
	anim_80 SFX_2c
	anim_02 $50, $58, $20, $08, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6577
	anim_60
	anim_80 SFX_2c
	anim_02 $38, $70, $08, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6577
	anim_60
	db $44, $0f, $50, $2c, $02, $50, $58, $20, $08, $01, $09, $00, $03, $00, $77, $65, $3c
	anim_06 $02, $01
	anim_03
BattleAnimScript_023_455b::
	anim_01
	anim_06 $07, $00
	anim_33
	anim_18 $07, $04
	anim_06 $04, $00
	anim_80 SFX_26
	anim_69 $05, $00
	anim_03
BattleAnimScript_023_456c::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67fe
	anim_80 SFX_25
	anim_19
	anim_02 $48, $70, $18, $20, $02
	anim_09 $00, $03, $00, MovementDeltas_02e_656a
	anim_24 ScrollDeltas_02e_67fe
	anim_03
BattleAnimScript_023_4584::
	anim_58
	anim_01
	anim_80 SFX_17
	anim_02 $50, $68, $20, $18, $02
	anim_09 $00, $03, $00, MovementDeltas_02e_6562
	anim_07 $01, $01
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_459b::
	anim_58
	anim_01
	anim_80 SFX_3d
	anim_02 $38, $70, $10, $08, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_655d
	anim_80 SFX_3d
	anim_02 $60, $78, $28, $28, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_655d
	anim_80 SFX_3d
	anim_02 $50, $58, $30, $10, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_655d
	anim_80 SFX_3d
	anim_02 $38, $58, $10, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_655d
	anim_80 SFX_3d
	anim_02 $48, $68, $20, $18, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_655d
	anim_17 $01, $04
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_45ea::
	anim_58
	anim_01
	anim_17 $00, $04
	anim_18 $07, $04
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_3d
	anim_02 $48, $70, $18, $20, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_655d
	anim_24 ScrollDeltas_02e_67fe
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_460a::
	anim_58
	anim_01
	anim_17 $00, $04
	anim_18 $07, $04
	anim_80 SFX_3f
	anim_02 $48, $70, $18, $20, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_655d
	anim_24 ScrollDeltas_02e_67fe
	anim_80 SFX_3d
	anim_09 $00, $07, $00, MovementDeltas_02e_655d
	anim_24 ScrollDeltas_02e_67fe
	anim_03
BattleAnimScript_023_462f::
	anim_58
	anim_01
	anim_72 $01, ObjectAnim_02e_69e9
	anim_20
	anim_18 $07, $02
	anim_72 $01, ObjectAnim_02e_69ff
	anim_20
	anim_18 $07, $04
	anim_80 SFX_0f
	anim_02 $58, $70, $20, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6557
	anim_80 SFX_0f
	anim_02 $48, $80, $28, $18, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6557
	anim_80 SFX_0f
	anim_02 $40, $70, $18, $28, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6557
	anim_06 $04, $01
	anim_24 ScrollDeltas_02e_67fe
	anim_03
BattleAnimScript_023_4672::
	anim_58
	anim_01
	anim_80 SFX_32
	anim_19
	anim_80 SFX_0c
	anim_80 SFX_0f
	anim_02 $48, $70, $18, $20, $02
	anim_09 $00, $03, $00, MovementDeltas_02e_656a
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_468b::
	anim_58
	db $43, $0e, $01, $50, $21, $48, $01, $15, $6a, $14, $12, $03, $02, $1d, $01, $12
	anim_07 $08, $03
BattleAnimScript_023_469f::
	anim_01
	anim_80 SFX_17
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6546
	anim_14 $3a, (GFX_03a_4000 + 8428)
	anim_80 SFX_16
	anim_09 $00, $07, $00, MovementDeltas_02e_654b
	anim_14 $3a, (GFX_03a_4000 + 10158)
	anim_09 $00, $07, $00, MovementDeltas_02e_6550
	anim_06 $04, $00
	anim_03
BattleAnimScript_023_46c8::
	anim_58
	anim_01
	anim_80 SFX_50
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_653e
	anim_80 SFX_42
	anim_69 $02, $01
	anim_03
BattleAnimScript_023_46de::
	anim_01
	anim_80 SFX_48
	anim_07 $00, $00
	anim_18 $07, $02
	anim_07 $00, $00
	anim_06 $04, $00
	anim_03
BattleAnimScript_023_46ee::
	anim_58
	anim_01
	anim_80 SFX_3d
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6546
	anim_14 $3a, (GFX_03a_4000 + 10416)
	anim_80 SFX_35
	anim_09 $00, $07, $00, MovementDeltas_02e_654b
	anim_06 $04, $00
	anim_80 SFX_31
	anim_69 $04, $00
	anim_03
BattleAnimScript_023_4713::
	anim_01
	anim_80 SFX_31
	anim_72 $01, ObjectAnim_02e_6a36
	anim_20
	anim_18 $03, $02
	anim_02 $10, $1c, $40, $6c, $03
	anim_09 $00, $07, $00, MovementDeltas_02e_6536
	anim_69 $01, $00
	anim_03
BattleAnimScript_023_472e::
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_51
	anim_72 $04, ObjectAnim_02e_6a4c
	anim_20
	anim_18 $03, $02
	anim_80 SFX_51
	anim_72 $04, ObjectAnim_02e_6a4c
	anim_20
	anim_18 $03, $02
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6529
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4756::
	anim_58
	anim_01
	anim_80 SFX_51
	anim_02 $10, $08, $20, $48, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_650f
	anim_14 $3a, (GFX_03a_4000 + 12146)
	anim_20
	anim_18 $03, $02
	anim_02 $40, $68, $10, $18, $05
	anim_09 $00, $07, $00, MovementDeltas_02e_6519
	anim_18 $03, $02
	anim_09 $00, $07, $00, MovementDeltas_02e_651f
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4787::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_26
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6508
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_479e::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_1f
	anim_02 $48, $70, $18, $20, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64fc
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_47b5::
	anim_58
	anim_01
	anim_80 SFX_20
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64ed
	anim_20
	anim_18 $03, $02
	anim_80 SFX_0f
	anim_02 $40, $68, $10, $18, $05
	anim_09 $00, $07, $00, MovementDeltas_02e_64f4
	anim_06 $04, $01
	anim_80 SFX_1f
	anim_36
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_47e1::
	anim_58
	anim_01
	anim_80 SFX_4c
	anim_34
	anim_80 SFX_2b
	anim_23 $04
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_47ee::
	anim_58
	anim_01
	anim_80 SFX_45
	anim_02 $18, $18, $48, $68, $01
	anim_18 $07, $03
	anim_04 $00, $07, $08, $01, $00
	anim_80 SFX_45
	anim_02 $18, $38, $48, $48, $02
	anim_09 $00, $07, $00, MovementDeltas_02e_64d1
	anim_52
	anim_53
	anim_14 $3a, (GFX_03a_4000 + 13876)
	anim_20
	anim_18 $03, $02
	anim_80 SFX_45
	anim_02 $10, $18, $40, $68, $09
	anim_18 $07, $03
	anim_04 $00, $07, $08, $09, $00
	anim_02 $18, $38, $48, $48, $0a
	anim_09 $00, $07, $00, MovementDeltas_02e_64d7
	anim_80 SFX_45
	anim_54
	anim_55
	anim_36
	anim_18 $07, $04
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4842::
	anim_01
	anim_80 SFX_27
	anim_02 $18, $18, $48, $68, $01
	anim_04 $00, $07, $08, $00, $01
	anim_06 $04, $00
	anim_69 $01, $00
	anim_03
BattleAnimScript_023_4858::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_35 ScrollDeltas_02e_68c4
	anim_80 SFX_36
	anim_02 $48, $70, $18, $20, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64dd
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4872::
	anim_58
	anim_01
	anim_80 SFX_2e
	anim_02 $18, $28, $48, $70, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64b4
	anim_18 $07, $03
	anim_80 SFX_2f
	anim_02 $40, $78, $10, $28, $04
	anim_09 $00, $07, $00, MovementDeltas_02e_64cc
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4897::
	anim_58
	anim_01
	anim_17 $00, $04
	anim_18 $07, $04
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_36
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64a6
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_48b4::
	anim_58
	anim_01
	anim_80 SFX_21
	anim_72 $04, ObjectAnim_02e_6a83
	anim_20
	anim_18 $07, $02
	anim_03
BattleAnimScript_023_48c1::
	anim_58
	anim_01
	anim_80 SFX_4c
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6498
	anim_14 $3b, GFX_03b_4000
	anim_20
	anim_18 $07, $02
	anim_80 SFX_42
	anim_72 $01, ObjectAnim_02e_6ae8
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_48e7::
	anim_58
	anim_01
	anim_80 SFX_0d
	anim_02 $40, $6c, $10, $1c, $01
	anim_04 $00, $07, $02, $01, $02
	anim_20
	anim_80 SFX_0d
	anim_02 $40, $84, $10, $34, $03
	anim_04 $00, $07, $02, $03, $04
	anim_20
	anim_80 SFX_0d
	anim_02 $40, $8c, $10, $3c, $05
	anim_04 $00, $07, $02, $05, $06
	anim_20
	anim_80 SFX_0d
	anim_02 $58, $7c, $28, $2c, $07
	anim_04 $00, $07, $02, $07, $08
	anim_20
	anim_80 SFX_0d
	anim_02 $68, $6c, $38, $1c, $01
	anim_04 $00, $07, $02, $01, $02
	anim_20
	anim_80 SFX_0d
	anim_02 $58, $64, $28, $14, $03
	anim_04 $00, $07, $02, $03, $04
	anim_20
	anim_80 SFX_0d
	anim_02 $40, $6c, $10, $1c, $05
	anim_04 $00, $07, $02, $05, $06
	anim_20
	anim_80 SFX_0d
	anim_02 $40, $64, $10, $14, $07
	anim_04 $00, $07, $02, $07, $08
	anim_20
	anim_14 $3b, (GFX_03b_4000 + 1442)
	anim_80 SFX_25
	anim_02 $38, $64, $08, $14, $09
	anim_04 $00, $07, $04, $09, $0a
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_497b::
	anim_58
	anim_01
	anim_80 SFX_31
	anim_02 $18, $1c, $48, $64, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_670c
	anim_20
	anim_18 $07, $02
	anim_80 SFX_0c
	anim_80 SFX_25
	anim_72 $01, ObjectAnim_02e_6afe
	anim_20
	anim_18 $07, $02
	anim_29 $01
	anim_18 $07, $04
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_49a4::
	anim_58
	anim_01
	anim_80 SFX_27
	anim_02 $48, $68, $18, $20, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6640
	anim_20
	anim_18 $07, $02
	anim_35 ScrollDeltas_02e_68c4
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_49bf::
	anim_58
	anim_01
	anim_80 SFX_26
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_648a
	anim_14 $3b, (GFX_03b_4000 + 2788)
	anim_09 $00, $07, $00, MovementDeltas_02e_6480
	anim_80 SFX_13
	anim_71 $01, ObjectAnim_02e_6b14
	anim_20
	anim_18 $07, $02
	anim_71 $01, ObjectAnim_02e_6b2a
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_60
	anim_03
BattleAnimScript_023_49f0::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_16
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_14 $3b, (GFX_03b_4000 + 4838)
	anim_02 $40, $68, $10, $18, $06
	anim_09 $00, $07, $00, MovementDeltas_02e_6479
	anim_60
	anim_35 ScrollDeltas_02e_68c4
	anim_06 $04, $01
	anim_06 $02, $00
	anim_03
BattleAnimScript_023_4a1e::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_4c
	anim_72 $00, ObjectAnim_02e_6b40
	anim_20
	anim_18 $03, $02
	anim_72 $00, ObjectAnim_02e_6b4b
	anim_20
	anim_18 $03, $02
	anim_72 $00, ObjectAnim_02e_6b56
	anim_20
	anim_18 $03, $02
	anim_80 SFX_42
	anim_23 $04
	anim_18 $07, $08
	anim_02 $40, $68, $10, $18, $05
	anim_04 $00, $07, $04, $05, $00
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4a54::
	anim_58
	anim_01
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_644e
	anim_80 SFX_51
	anim_37
	anim_80 SFX_2c
	anim_02 $40, $68, $10, $10, $03
	anim_09 $00, $07, $00, MovementDeltas_02e_6447
	anim_20
	anim_18 $07, $02
	anim_23 $04
	anim_18 $07, $08
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4a80::
	anim_58
	anim_01
	anim_80 SFX_2b
	anim_02 $38, $70, $10, $08, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6441
	anim_80 SFX_2b
	anim_02 $60, $78, $28, $28, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6441
	anim_80 SFX_2b
	anim_02 $50, $58, $30, $10, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6441
	anim_80 SFX_2b
	anim_02 $38, $58, $10, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6441
	anim_80 SFX_2b
	anim_02 $48, $68, $20, $18, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6441
	anim_17 $01, $04
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_4acf::
	anim_58
	anim_01
	anim_80 SFX_10
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_17 $00, $04
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_4ae7::
	anim_58
	anim_01
	anim_80 SFX_2e
	anim_02 $38, $70, $10, $08, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6546
	anim_60
	anim_80 SFX_2e
	anim_02 $60, $78, $28, $28, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6546
	anim_60
	anim_80 SFX_2e
	anim_02 $50, $58, $30, $10, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6546
	anim_60
	anim_80 SFX_2e
	anim_02 $38, $58, $10, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6546
	db $44, $0f, $02, $48, $68, $20, $18, $01, $50, $2e, $09, $00, $03, $00, $46, $65, $3c
	db $44, $0f, $02, $38, $88, $10, $38, $01, $50, $2e, $09, $00, $03, $00, $46, $65, $3c
	db $44, $0f, $02, $48, $80, $18, $40, $01, $50, $2e, $09, $00, $03, $00, $46, $65, $3c
	db $44, $0e, $02, $48, $68, $20, $18, $01, $50, $2e, $09, $00, $03, $00, $46, $65
	anim_06 $04, $01
	anim_23 $04
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_4b70::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_16
	anim_02 $48, $68, $18, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6431
	anim_70 $cc, $67
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4b8a::
	anim_58
	anim_01
	anim_80 SFX_51
	anim_23 $06
	anim_52
	anim_53
	anim_70 $cc, $67
	anim_06 $04, $01
	anim_80 SFX_51
	db $44, $0b, $17, $06, $34, $35, $46, $cc, $67, $06, $04, $01, $3c
	db $44, $0c, $17, $06, $50, $41, $34, $35, $46, $cc, $67, $06, $04, $01
	anim_03
BattleAnimScript_023_4bb6::
	anim_58
	anim_01
	anim_17 $00, $06
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_35
	anim_71 $01, ObjectAnim_02e_6b61
	anim_20
	anim_18 $07, $02
	anim_71 $01, ObjectAnim_02e_6b77
	anim_70 $cc, $67
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4bd3::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2b
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_641d
	anim_17 $01, $06
	anim_70 $cc, $67
	anim_18 $07, $02
	anim_03
BattleAnimScript_023_4bf0::
	anim_58
	anim_01
	anim_80 SFX_3d
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_640b
	anim_20
	anim_80 SFX_3d
	anim_02 $48, $68, $18, $18, $05
	anim_09 $00, $07, $00, MovementDeltas_02e_6411
	anim_20
	anim_14 $3b, (GFX_03b_4000 + 6248)
	anim_80 SFX_3d
	anim_02 $60, $68, $30, $18, $09
	anim_09 $00, $07, $00, MovementDeltas_02e_6417
	anim_20
	anim_23 $04
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_4c29::
	anim_58
	anim_01
	anim_80 SFX_31
	anim_02 $18, $18, $48, $68, $01
	anim_04 $00, $07, $06, $01, $00
	anim_06 $03, $00
	anim_80 SFX_0c
	anim_80 SFX_51
	anim_71 $00, ObjectAnim_02e_6b8d
	anim_20
	anim_23 $04
	anim_18 $07, $08
	anim_06 $02, $00
	anim_60
	anim_03
BattleAnimScript_023_4c4f::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_51
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_51
	anim_02 $50, $68, $20, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_51
	anim_02 $60, $68, $30, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_51
	anim_02 $48, $68, $18, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_51
	anim_02 $58, $68, $28, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_23 $04
	anim_70 $cc, $67
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_4ca8::
	anim_58
	anim_01
	anim_80 SFX_1c
	anim_71 $00, ObjectAnim_02e_6b98
	anim_20
	anim_17 $00, $04
	anim_18 $07, $04
	anim_14 $3a, (GFX_03a_4000 + 15286)
	anim_08 ScrollDeltas_02e_67ed
	anim_02 $48, $70, $18, $20, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64fc
	anim_06 $04, $01
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_4cd1::
	anim_58
	anim_01
	anim_80 SFX_0f
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4ce1::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2f
	anim_16
	anim_20
	anim_18 $07, $02
	anim_80 SFX_26
	anim_29 $01
	anim_18 $07, $04
	anim_51 $01
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4cfa::
	anim_58
	anim_01
	anim_80 SFX_25
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_23 $04
	anim_18 $07, $08
	anim_06 $04, $01
	anim_60
	anim_03
BattleAnimScript_023_4d12::
	anim_58
	anim_01
	anim_80 SFX_26
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6640
	anim_14 $3b, (GFX_03b_4000 + 6954)
	anim_80 SFX_31
	anim_02 $50, $58, $20, $18, $04
	anim_09 $00, $07, $00, MovementDeltas_02e_65f8
	anim_29 $01
	anim_18 $07, $04
	anim_51 $01
	anim_80 SFX_0c
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4d41::
	anim_58
	anim_01
	anim_80 SFX_51
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_60
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	db $44, $1b, $50, $51, $48, $00, $a3, $6b, $14, $12, $07, $02, $06, $04, $01, $50, $51, $48, $00, $a3, $6b, $14, $12, $07, $02, $06, $04, $01, $3c
	db $44, $1a, $50, $51, $48, $00, $a3, $6b, $14, $12, $07, $02, $06, $04, $01, $50, $51, $48, $00, $a3, $6b, $14, $12, $07, $02, $06, $04, $01
	anim_03
BattleAnimScript_023_4d96::
	anim_58
	anim_01
	anim_80 SFX_51
	anim_12
	anim_18 $07, $04
	anim_06 $01, $01
	anim_80 SFX_44
	anim_02 $40, $68, $10, $18, $0b
	anim_04 $00, $07, $06, $0b, $00
	anim_06 $06, $01
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_4db6::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_23 $06
	anim_80 SFX_42
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_18 $04, $02
	anim_80 SFX_42
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_18 $04, $02
	anim_80 SFX_42
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_18 $07, $04
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4ddf::
	anim_58
	anim_01
	anim_17 $00, $04
	anim_18 $07, $04
	anim_08 MovementDeltas_02e_67cc
	anim_80 SFX_2b
	anim_23 $10
	anim_72 $00, ObjectAnim_02e_6bb9
	anim_20
	anim_18 $03, $02
	anim_72 $00, ObjectAnim_02e_6bae
	anim_20
	anim_18 $03, $02
	anim_80 SFX_2b
	anim_72 $00, ObjectAnim_02e_6bc4
	anim_20
	anim_18 $03, $02
	anim_72 $00, ObjectAnim_02e_6bae
	anim_20
	anim_18 $03, $02
	anim_80 SFX_2b
	anim_72 $00, ObjectAnim_02e_6bcf
	anim_20
	anim_18 $03, $02
	anim_80 SFX_2b
	anim_72 $00, ObjectAnim_02e_6bae
	anim_20
	anim_18 $03, $02
	anim_70 $cc, $67
	anim_18 $07, $04
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4e2e::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_27
	anim_72 $00, ObjectAnim_02e_6ba3
	anim_20
	anim_18 $07, $02
	anim_70 $cc, $67
	db $44, $11, $08, $ed, $67, $50, $27, $48, $00, $a3, $6b, $14, $12, $07, $02, $46, $cc, $67, $3c
	db $44, $11, $08, $ed, $67, $50, $27, $48, $00, $a3, $6b, $14, $12, $07, $02, $46, $cc, $67, $3c
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4e6a::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2a
	anim_71 $00, ObjectAnim_02e_6bda
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4e7d::
	anim_58
	anim_01
	anim_80 SFX_2b
	anim_72 $00, ObjectAnim_02e_6be5
	anim_20
	anim_18 $07, $02
	anim_80 SFX_2b
	anim_72 $00, ObjectAnim_02e_6bf0
	anim_20
	anim_18 $07, $02
	anim_70 $cc, $67
	anim_03
BattleAnimScript_023_4e97::
	anim_58
	anim_01
	anim_80 SFX_42
	anim_26 $00
	anim_06 $01, $00
	anim_03
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6606
	anim_70 $cc, $67
	anim_06 $02, $00
	anim_03
BattleAnimScript_023_4eb4::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_42
	anim_23 $08
	anim_35 ScrollDeltas_02e_68c4
	anim_35 ScrollDeltas_02e_688b
	anim_18 $07, $08
	anim_70 $cc, $67
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4ecd::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2b
	anim_52
	anim_80 SFX_2a
	anim_53
	anim_70 $cc, $67
	anim_03
BattleAnimScript_023_4edc::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_42
	anim_72 $01, ObjectAnim_02e_6bfb
	anim_35 ScrollDeltas_02e_68c4
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4eee::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2b
	anim_72 $00, ObjectAnim_02e_6c11
	anim_20
	anim_02 $60, $70, $30, $20, $06
	anim_09 $00, $07, $00, MovementDeltas_02e_63f5
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4f0e::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2b
	anim_72 $00, ObjectAnim_02e_6c27
	anim_20
	anim_02 $58, $68, $28, $28, $06
	anim_09 $00, $07, $00, MovementDeltas_02e_63f5
	anim_20
	db $44, $18, $08, $ed, $67, $50, $2b, $48, $00, $1c, $6c, $14, $02, $60, $58, $30, $08, $06, $09, $00, $07, $00, $f5, $63, $14, $3c
	db $44, $16, $08, $ed, $67, $50, $2b, $48, $00, $32, $6c, $14, $02, $68, $78, $38, $28, $06, $09, $00, $07, $00, $f5, $63
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4f61::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_51
	anim_71 $00, ObjectAnim_02e_6c3d
	anim_09 $00, $07, $00, MovementDeltas_02e_63fd
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4f7a::
	anim_58
	anim_01
	anim_80 SFX_42
	anim_02 $48, $60, $18, $10, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_648a
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4f8e::
	anim_58
	anim_01
	anim_80 SFX_26
	anim_02 $30, $68, $00, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64ed
	anim_14 $3b, (GFX_03b_4000 + 8524)
	anim_02 $30, $68, $00, $18, $03
	anim_09 $00, $07, $00, MovementDeltas_02e_64e5
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4fb2::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_42
	anim_02 $44, $64, $14, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6498
	anim_06 $04, $01
	anim_07 $03, $01
	anim_03
BattleAnimScript_023_4fcc::
	anim_58
	anim_01
	anim_80 SFX_21
	anim_31
	anim_70 $cc, $67
	anim_06 $04, $01
	anim_60
	anim_03
BattleAnimScript_023_4fd9::
	anim_58
	anim_01
	anim_80 SFX_0f
	anim_72 $00, ObjectAnim_02e_6c48
	anim_20
	anim_18 $03, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4fe9::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_20
	anim_71 $00, ObjectAnim_02e_6c53
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_4ffc::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_36
	anim_71 $00, ObjectAnim_02e_6c5e
	anim_20
	anim_18 $07, $02
	anim_80 SFX_2e
	anim_02 $50, $74, $20, $24, $08
	anim_04 $00, $07, $06, $08, $09
	anim_20
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_501e::
	anim_58
	anim_01
	anim_80 SFX_32
	anim_02 $10, $18, $40, $68, $04
	anim_09 $00, $07, $00, MovementDeltas_02e_65fe
	anim_17 $00, $04
	anim_18 $07, $04
	anim_03
	anim_03
BattleAnimScript_023_5036::
	anim_58
	anim_01
	anim_80 SFX_51
	anim_72 $01, ObjectAnim_02e_6c74
	anim_20
	anim_80 SFX_51
	anim_72 $01, ObjectAnim_02e_6c78
	anim_20
	anim_80 SFX_51
	anim_72 $01, ObjectAnim_02e_6c7c
	anim_20
	anim_23 $04
	anim_06 $06, $01
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_5056::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_3b
	anim_71 $00, ObjectAnim_02e_6cb6
	anim_20
	anim_02 $40, $68, $10, $18, $02
	anim_09 $00, $07, $00, MovementDeltas_02e_64c0
	anim_70 $cc, $67
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_5075::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_36
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_63e2
	anim_20
	anim_06 $04, $01
	anim_07 $00, $01
	anim_03
BattleAnimScript_023_5090::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_26
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_63e2
	anim_20
	anim_06 $04, $01
	anim_07 $03, $01
	anim_03
BattleAnimScript_023_50ab::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_22
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_63e2
	anim_20
	anim_06 $04, $01
	anim_07 $02, $01
	anim_03
BattleAnimScript_023_50c6::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_1f
	anim_02 $48, $70, $18, $18, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_6498
	anim_20
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_50de::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_39
	anim_02 $30, $70, $08, $20, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_6472
	anim_20
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_50f6::
	anim_58
	anim_01
	anim_17 $00, $04
	anim_18 $07, $04
	anim_80 SFX_51
	anim_38
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_5105::
	anim_58
	anim_01
	anim_80 SFX_35
	anim_02 $40, $60, $10, $10, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_6468
	anim_20
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_511a::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_31
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_65d3
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_5131::
	anim_58
	anim_01
	anim_23 $08
	anim_80 SFX_39
	anim_72 $00, ObjectAnim_02e_6cc1
	anim_20
	anim_80 SFX_39
	anim_72 $00, ObjectAnim_02e_6ccc
	anim_20
	anim_80 SFX_39
	anim_72 $00, ObjectAnim_02e_6cd7
	anim_20
	anim_06 $04, $01
	anim_18 $07, $06
	anim_03
BattleAnimScript_023_5151::
	anim_58
	anim_01
	anim_35 ScrollDeltas_02e_6882
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6ce2
	anim_20
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6ced
	anim_20
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6cf8
	anim_20
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6d03
	anim_20
	anim_06 $04, $01
	anim_07 $00, $01
	anim_03
BattleAnimScript_023_5179::
	anim_58
	anim_01
	anim_23 $0a
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6ce2
	anim_20
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6ced
	anim_20
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6cf8
	anim_20
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6d03
	anim_20
	anim_06 $04, $01
	anim_18 $07, $04
	anim_07 $01, $01
	anim_03
BattleAnimScript_023_51a3::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6ce2
	anim_20
	anim_72 $00, ObjectAnim_02e_6ced
	anim_20
	anim_80 SFX_2d
	anim_72 $00, ObjectAnim_02e_6cf8
	anim_20
	anim_72 $00, ObjectAnim_02e_6d03
	anim_20
	anim_06 $06, $01
	anim_03
BattleAnimScript_023_51c4::
	anim_58
	anim_01
	anim_17 $00, $04
	anim_80 SFX_2d
	anim_71 $00, ObjectAnim_02e_6d0e
	anim_20
	anim_18 $07, $02
	anim_72 $02, ObjectAnim_02e_6d19
	anim_20
	anim_18 $07, $02
	anim_06 $06, $01
	anim_02 $40, $68, $10, $18, $05
	anim_09 $00, $07, $02, MovementDeltas_02e_66a9
	anim_20
	anim_27 $99, $01
	anim_03
BattleAnimScript_023_51ef::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_10
	anim_71 $00, ObjectAnim_02e_6d0e
	anim_20
	anim_18 $07, $02
	anim_72 $02, ObjectAnim_02e_6d19
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_07 $04, $01
	anim_03
BattleAnimScript_023_520d::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_26
	anim_38
	anim_24 ScrollDeltas_02e_67fe
	anim_03
BattleAnimScript_023_5219::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_0f
	anim_72 $00, ObjectAnim_02e_6d3a
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_522c::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_35
	anim_71 $00, ObjectAnim_02e_6d45
	anim_72 $00, ObjectAnim_02e_6d50
	anim_20
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_5240::
	anim_58
	anim_01
	anim_17 $00, $04
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_31
	anim_02 $50, $64, $20, $14, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_65bf
	db $0f, $0c, $50, $64, $20, $14, $01, $09, $00, $07, $02, $bf, $65, $3c
	db $0f, $0c, $50, $64, $20, $14, $01, $09, $00, $07, $02, $bf, $65, $3c
	db $0f, $0c, $50, $64, $20, $14, $01, $09, $00, $07, $02, $bf, $65, $3c
	db $0f, $0c, $50, $64, $20, $14, $01, $09, $00, $07, $02, $bf, $65, $3c
	anim_06 $06, $01
	anim_03
BattleAnimScript_023_5292::
	anim_58
	anim_01
	anim_80 SFX_31
	anim_72 $00, ObjectAnim_02e_6d5b
	anim_20
	anim_72 $00, ObjectAnim_02e_6d66
	anim_20
	anim_72 $00, ObjectAnim_02e_6d71
	anim_20
	anim_18 $07, $02
	anim_35 ScrollDeltas_02e_6882
	anim_72 $00, ObjectAnim_02e_6d7c
	anim_20
	anim_72 $00, ObjectAnim_02e_6d87
	anim_20
	anim_72 $00, ObjectAnim_02e_6d92
	anim_20
	anim_18 $07, $04
	anim_80 SFX_4c
	anim_14 $3b, (GFX_03b_4000 + 9966)
	anim_72 $00, ObjectAnim_02e_6d9d
	anim_20
	anim_18 $07, $02
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_52cf::
	anim_01
	anim_06 $04, $00
	anim_03
	anim_80 SFX_30
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_65a2
	anim_80 SFX_30
	anim_14 $3b, (GFX_03b_4000 + 10480)
	anim_02 $10, $18, $40, $68, $05
	anim_80 SFX_30
	anim_09 $00, $07, $02, MovementDeltas_02e_65ab
	anim_06 $06, $00
	anim_03
	anim_03
	anim_03
BattleAnimScript_023_52fc::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_30
	anim_38
	anim_24 ScrollDeltas_02e_67fe
	anim_03
BattleAnimScript_023_5308::
	anim_58
	anim_01
	anim_23 $10
	anim_08 MovementDeltas_02e_67cc
	anim_80 SFX_2c
	anim_72 $00, ObjectAnim_02e_6da8
	anim_09 $00, $07, $02, MovementDeltas_02e_6655
	anim_18 $04, $01
	anim_80 SFX_2c
	anim_72 $00, ObjectAnim_02e_6db3
	anim_09 $00, $07, $02, MovementDeltas_02e_6655
	anim_18 $04, $01
	anim_80 SFX_2c
	anim_72 $00, ObjectAnim_02e_6dbe
	anim_09 $00, $07, $02, MovementDeltas_02e_6655
	anim_18 $07, $02
	anim_06 $06, $01
	anim_03
BattleAnimScript_023_5340::
	anim_01
	anim_06 $01, $00
	anim_80 SFX_32
	anim_02 $10, $08, $40, $58, $01
	anim_04 $00, $07, $06, $00, $01
	anim_72 $00, ObjectAnim_02e_6dc9
	anim_27 $00, $00
	anim_03
BattleAnimScript_023_535a::
	anim_58
	anim_01
	anim_80 SFX_51
	anim_41
	anim_14 $49, SubImage_049_7041
	anim_72 $00, ObjectAnim_02e_6e2c
	anim_20
	anim_06 $06, $01
	anim_03
BattleAnimScript_023_536c::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_34
	anim_72 $00, ObjectAnim_02e_6dd4
	anim_20
	anim_06 $06, $01
	anim_69 $06, $01
	anim_03
BattleAnimScript_023_537f::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_20
	anim_42
	anim_06 $04, $00
	anim_03
BattleAnimScript_023_538b::
	anim_58
	anim_01
	anim_02 $10, $18, $40, $68, $01
	anim_80 SFX_26
	anim_09 $00, $07, $02, MovementDeltas_02e_6764
	anim_06 $01, $00
	anim_14 $3b, (GFX_03b_4000 + 12114)
	anim_80 SFX_27
	anim_71 $00, ObjectAnim_02e_6ddf
	anim_09 $00, $07, $02, MovementDeltas_02e_6756
	anim_24 ScrollDeltas_02e_67fe
	anim_06 $04, $00
	anim_60
	anim_03
BattleAnimScript_023_53b6::
	anim_01
	anim_80 SFX_4c
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_63d7
	anim_14 $48, SubImage_048_4cb3
	anim_09 $00, $07, $02, MovementDeltas_02e_63cc
	anim_06 $04, $00
	anim_18 $07, $04
	anim_80 SFX_4c
	anim_14 $48, SubImage_048_4b71
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_63d7
	anim_14 $48, SubImage_048_4cb3
	anim_09 $00, $07, $02, MovementDeltas_02e_63cc
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_53f5::
	anim_58
	anim_01
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_20
	anim_72 $00, ObjectAnim_02e_6dea
	anim_09 $00, $07, $02, MovementDeltas_02e_65f8
	anim_06 $04, $01
	anim_07 $02, $01
	anim_03
BattleAnimScript_023_540d::
	anim_58
	anim_01
	anim_80 SFX_45
	anim_71 $00, ObjectAnim_02e_6df5
	anim_20
	anim_18 $04, $02
	anim_02 $48, $58, $20, $30, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_65f1
	anim_06 $04, $01
	anim_07 $02, $01
	anim_03
BattleAnimScript_023_542c::
	anim_01
	anim_80 SFX_32
	anim_02 $28, $20, $58, $70, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_6733
	anim_18 $04, $02
	anim_72 $00, ObjectAnim_02e_6e00
	anim_20
	anim_18 $07, $04
	anim_14 $48, SubImage_048_627b
	anim_03
	anim_02 $10, $18, $40, $68, $06
	anim_09 $00, $03, $00, MovementDeltas_02e_672d
	anim_02 $10, $10, $40, $60, $06
	anim_09 $00, $03, $00, MovementDeltas_02e_672d
	anim_02 $10, $20, $40, $70, $06
	anim_09 $00, $03, $00, MovementDeltas_02e_672d
	anim_17 $00, $04
	anim_18 $07, $04
	anim_03
BattleAnimScript_023_5476::
	anim_58
	anim_01
	anim_80 SFX_51
	anim_37
	anim_35 ScrollDeltas_02e_6882
	anim_23 $06
	anim_80 SFX_42
	anim_02 $40, $68, $10, $18, $02
	anim_09 $00, $03, $00, MovementDeltas_02e_63c5
	anim_18 $07, $06
	anim_03
BattleAnimScript_023_5492::
	anim_58
	anim_01
	anim_80 SFX_41
	anim_72 $00, ObjectAnim_02e_6e0b
	anim_20
	anim_18 $04, $02
	anim_71 $00, ObjectAnim_02e_6e16
	anim_20
	anim_06 $04, $01
	anim_03
BattleAnimScript_023_54a7::
	anim_01
	anim_06 $07, $00
	anim_80 SFX_36
	anim_02 $10, $18, $40, $68, $02
	anim_09 $00, $03, $00, MovementDeltas_02e_63ba
	anim_27 $88, $00
	anim_06 $04, $00
	anim_03
BattleAnimScript_023_54c0::
	anim_01
	anim_80 SFX_1f
	anim_02 $10, $18, $40, $68, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_66cc
	anim_29 $00
	anim_03
BattleAnimScript_023_54d2::
	anim_01
	anim_80 SFX_12
	anim_02 $18, $20, $48, $70, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_639a
	anim_03
BattleAnimScript_023_54e2::
	anim_58
	anim_01
	anim_80 SFX_12
	anim_02 $18, $20, $48, $70, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_63ab
	anim_03
BattleAnimScript_023_54f3::
	anim_58
	anim_01
	anim_23 $02
	anim_08 ScrollDeltas_02e_67ed
	anim_80 SFX_14
	anim_72 $00, ObjectAnim_02e_6e21
	anim_20
	anim_18 $07, $04
	anim_06 $04, $01
	anim_07 $05, $01
	anim_07 $06, $01
	anim_07 $03, $01
	anim_07 $01, $01
	anim_03
BattleAnimScript_023_5514::
	anim_01
	anim_80 SFX_26
	anim_02 $30, $10, $60, $60, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_26
	anim_02 $28, $10, $58, $60, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_26
	anim_02 $20, $10, $50, $60, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_26
	anim_02 $18, $10, $48, $60, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_80 SFX_26
	anim_02 $10, $10, $40, $60, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6472
	anim_20
	anim_17 $00, $06
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_5567::
	anim_01
	anim_80 SFX_35
	anim_02 $10, $10, $40, $60, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_638e
	anim_14 $49, SubImage_049_609d
	anim_02 $10, $18, $40, $68, $0b
	anim_09 $00, $07, $00, MovementDeltas_02e_637e
	anim_20
	anim_18 $07, $04
	anim_17 $00, $06
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_5591::
	anim_01
	anim_80 SFX_32
	anim_02 $10, $14, $40, $64, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6375
	anim_14 $49, SubImage_049_685f
	anim_09 $00, $07, $00, MovementDeltas_02e_6360
	anim_20
	anim_18 $07, $04
	anim_17 $00, $06
	anim_18 $07, $08
	anim_03
BattleAnimScript_023_55b5::
	anim_01
	anim_80 SFX_14
	anim_02 $18, $20, $48, $70, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_64fc
	anim_03
Script_023_55c5::
	anim_80 SFX_47
	anim_65 $01
	anim_51 $01
	anim_03

; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_55cc::
	anim_80 SFX_29
	anim_62 $e2, $5e
	anim_63 $14, $40
	anim_02 $00, $7c, $00, $7c, $01
	anim_05 $00, $06, ScrollDeltas_02e_6870
	anim_20
	anim_63 $18, $41
	anim_02 $40, $60, $40, $60, $05
	anim_09 $00, $07, $00, MovementDeltas_02e_677e
	anim_06 $02, $00
	anim_63 $ac, $5b
	anim_03
; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_55f6::
	anim_80 SFX_39
	anim_73
	anim_03
; TODO disassemble
Func_023_55fa::
	db $11, $0e, $56, $fa, $f3, $d9, $6f, $26, $00, $29, $19, $2a, $ea, $88, $d0, $2a
	db $ea, $89, $d0, $c9, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56
	db $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56
	db $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56, $5e, $56
	db $5e, $56, $5e, $56, $07, $57, $17, $57, $27, $57, $37, $57, $47, $57, $57, $57
	db $67, $57, $77, $57, $87, $57, $97, $57, $a7, $57, $5e, $56, $5e, $56, $5e, $56
	db $5e, $56, $5e, $56, $3e, $e2, $5e, $3f, $14, $40, $02, $6c, $7c, $6c, $7c, $01
	db $05, $00, $0a, $4c, $68, $14, $3f, $18, $41, $02, $08, $10, $08, $10, $05, $09
	db $00, $03, $00, $7e, $67, $3f, $1c, $47, $02, $08, $10, $08, $10, $09, $06, $01
	db $01, $09, $00, $03, $00, $86, $67, $3f, $20, $4e, $02, $08, $10, $08, $10, $0b
	db $09, $00, $03, $00, $8c, $67, $40, $03
BattleScript_023_56a2::
	anim_20
	anim_63 $24, $53
	anim_02 $08, $10, $08, $10, $0d
	anim_09 $00, $03, $00, MovementDeltas_02e_6793
	anim_20
	anim_02 $38, $28, $38, $28, $01
	anim_05 $00, $04, ScrollDeltas_02e_6867
	anim_20
	anim_27 $00, $01
	anim_63 $ac, $5b
	anim_03
	anim_20
	anim_63 $08, $56
	anim_02 $08, $10, $08, $10, $0f
	anim_06 $02, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6799
	anim_20
	anim_63 $ac, $5b
	anim_03
Func_023_56de::
	ld hl, BattleScript_023_56a2
	ld a, l
	ld [wBattleScriptPos], a
	ld a, h
	ld [wBattleScriptPos + 1], a
	ld a, $01
	ld [wd993], a
	xor a
	ld [wBattleState], a
	ret
; TODO disassemble
Func_023_56f3::
	db $21, $c6, $56, $7d, $ea, $88, $d0, $7c, $ea, $89, $d0, $af, $ea, $93, $d9, $af
	db $ea, $89, $d9, $c9, $3e, $ea, $5e, $3f, $30, $5c, $02, $30, $28, $60, $78, $01
	db $50, $45, $2e, $03, $3e, $f2, $5e, $3f, $74, $5c, $02, $30, $28, $60, $78, $01
	db $50, $45, $2e, $03, $3e, $fa, $5e, $3f, $b8, $5c, $02, $30, $28, $60, $78, $01
	db $50, $45, $2e, $03, $3e, $02, $5f, $3f, $fc, $5c, $02, $30, $28, $60, $78, $01
	db $50, $45, $2e, $03, $3e, $0a, $5f, $3f, $40, $5d, $02, $30, $28, $60, $78, $01
	db $50, $45, $2e, $03, $3e, $12, $5f, $3f, $84, $5d, $02, $40, $78, $10, $28, $01
	db $50, $45, $2f, $03, $3e, $1a, $5f, $3f, $c8, $5d, $02, $40, $78, $10, $28, $01
	db $50, $45, $2f, $03, $3e, $22, $5f, $3f, $0c, $5e, $02, $40, $78, $10, $28, $01
	db $50, $45, $2f, $03, $3e, $2a, $5f, $3f, $50, $5e, $02, $40, $78, $10, $28, $01
	db $50, $45, $2f, $03, $3e, $32, $5f, $3f, $94, $5e, $02, $40, $78, $10, $28, $01
	db $50, $45, $2f, $03, $50, $27, $43, $02, $1d, $00, $03
Script_023_57ae::
	anim_01
	anim_80 SFX_36
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $02, MovementDeltas_02e_65a2
	anim_14 $3b, (GFX_03b_4000 + 10480)
	anim_80 SFX_2f
	anim_02 $40, $68, $10, $18, $05
	anim_09 $00, $07, $02, MovementDeltas_02e_65b8
	anim_20
	anim_03
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_57d1::
	anim_66 $90
	anim_80 SFX_42
	anim_72 $00, ObjectAnim_02e_6e37
	anim_20
	anim_18 $03, $02
	anim_06 $06, $01
	anim_03
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_57e1::
	anim_14 $3a, (GFX_03a_4000 + 15286)
	anim_08 ScrollDeltas_02e_67ed
	anim_72 $00, ObjectAnim_02e_6c69
	anim_20
	anim_06 $04, $01
	anim_18 $07, $04
	anim_03
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_57f4::
	anim_66 $53
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $07, $00, MovementDeltas_02e_6606
	anim_70 $cc, $67
	anim_06 $02, $00
	anim_03
; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_5809::
	anim_07 $01, $00
	anim_10 $00
	anim_03
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_580f::
	anim_66 $8f
	anim_02 $40, $68, $10, $18, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6771
	anim_02 $48, $70, $18, $20, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6771
	anim_02 $50, $78, $20, $28, $01
	anim_09 $00, $03, $00, MovementDeltas_02e_6771
	anim_06 $06, $01
	anim_03
	anim_00
	anim_00
	anim_00
	anim_00
	anim_00
	anim_00
	anim_00


