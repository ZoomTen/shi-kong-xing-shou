Func_023_4000:
	ld de, BattleAnimScript_Pointers
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

; battle-script pointer table, indexed by wBattleAnimID (IDs $00-$8e)
BattleAnimScript_Pointers:
	dw BattleAnimScript_023_4132
	dw BattleAnimScript_023_4132
	dw BattleAnimScript_023_4157
	dw BattleAnimScript_023_4174
	dw BattleAnimScript_023_418b
	dw BattleAnimScript_023_41b3
	dw BattleAnimScript_023_41d0
	dw BattleAnimScript_023_41ed
	dw BattleAnimScript_023_423f
	dw BattleAnimScript_023_4276
	dw BattleAnimScript_023_42ac
	dw BattleAnimScript_023_42d2
	dw BattleAnimScript_023_42ff
	dw BattleAnimScript_023_432a
	dw BattleAnimScript_023_4352
	dw BattleAnimScript_023_437f
	dw BattleAnimScript_023_4393
	dw BattleAnimScript_023_43c7
	dw BattleAnimScript_023_4415
	dw BattleAnimScript_023_4456
	dw BattleAnimScript_023_447e
	dw BattleAnimScript_023_43ad
	dw BattleAnimScript_023_44b1
	dw BattleAnimScript_023_44c8
	dw BattleAnimScript_023_44fb
	dw BattleAnimScript_023_450a
	dw BattleAnimScript_023_4526
	dw BattleAnimScript_023_455b
	dw BattleAnimScript_023_456c
	dw BattleAnimScript_023_4584
	dw BattleAnimScript_023_459b
	dw BattleAnimScript_023_45ea
	dw BattleAnimScript_023_460a
	dw BattleAnimScript_023_462f
	dw BattleAnimScript_023_4672
	dw BattleAnimScript_023_468b
	dw BattleAnimScript_023_469f
	dw BattleAnimScript_023_46c8
	dw BattleAnimScript_023_46de
	dw BattleAnimScript_023_46ee
	dw BattleAnimScript_023_4713
	dw BattleAnimScript_023_472e
	dw BattleAnimScript_023_4756
	dw BattleAnimScript_023_4787
	dw BattleAnimScript_023_479e
	dw BattleAnimScript_023_47b5
	dw BattleAnimScript_023_47e1
	dw BattleAnimScript_023_47ee
	dw BattleAnimScript_023_4842
	dw BattleAnimScript_023_4858
	dw BattleAnimScript_023_4872
	dw BattleAnimScript_023_4897
	dw BattleAnimScript_023_48b4
	dw BattleAnimScript_023_48c1
	dw BattleAnimScript_023_48e7
	dw BattleAnimScript_023_497b
	dw BattleAnimScript_023_49a4
	dw BattleAnimScript_023_49bf
	dw BattleAnimScript_023_49f0
	dw BattleAnimScript_023_4a1e
	dw BattleAnimScript_023_4a54
	dw BattleAnimScript_023_4a80
	dw BattleAnimScript_023_4acf
	dw BattleAnimScript_023_4ae7
	dw BattleAnimScript_023_4b70
	dw BattleAnimScript_023_4b8a
	dw BattleAnimScript_023_4bb6
	dw BattleAnimScript_023_4bd3
	dw BattleAnimScript_023_4bf0
	dw BattleAnimScript_023_4c29
	dw BattleAnimScript_023_4c4f
	dw BattleAnimScript_023_4ca8
	dw BattleAnimScript_023_4cd1
	dw BattleAnimScript_023_4ce1
	dw BattleAnimScript_023_4cfa
	dw BattleAnimScript_023_4d12
	dw BattleAnimScript_023_4d41
	dw BattleAnimScript_023_4d96
	dw BattleAnimScript_023_4db6
	dw BattleAnimScript_023_4ddf
	dw BattleAnimScript_023_4e2e
	dw BattleAnimScript_023_4e6a
	dw BattleAnimScript_023_4e7d
	dw BattleAnimScript_023_4e97
	dw BattleAnimScript_023_4eb4
	dw BattleAnimScript_023_4ecd
	dw BattleAnimScript_023_4edc
	dw BattleAnimScript_023_4eee
	dw BattleAnimScript_023_4f0e
	dw BattleAnimScript_023_4f61
	dw BattleAnimScript_023_4f7a
	dw BattleAnimScript_023_4f8e
	dw BattleAnimScript_023_4fb2
	dw BattleAnimScript_023_4fcc
	dw BattleAnimScript_023_4fd9
	dw BattleAnimScript_023_4fe9
	dw BattleAnimScript_023_4ffc
	dw BattleAnimScript_023_501e
	dw BattleAnimScript_023_5036
	dw BattleAnimScript_023_5056
	dw BattleAnimScript_023_5075
	dw BattleAnimScript_023_5090
	dw BattleAnimScript_023_50ab
	dw BattleAnimScript_023_50c6
	dw BattleAnimScript_023_50de
	dw BattleAnimScript_023_50f6
	dw BattleAnimScript_023_5105
	dw BattleAnimScript_023_511a
	dw BattleAnimScript_023_5131
	dw BattleAnimScript_023_5151
	dw BattleAnimScript_023_5179
	dw BattleAnimScript_023_51a3
	dw BattleAnimScript_023_51c4
	dw BattleAnimScript_023_51ef
	dw BattleAnimScript_023_520d
	dw BattleAnimScript_023_5219
	dw BattleAnimScript_023_522c
	dw BattleAnimScript_023_5240
	dw BattleAnimScript_023_5292
	dw BattleAnimScript_023_52cf
	dw BattleAnimScript_023_52fc
	dw BattleAnimScript_023_5308
	dw BattleAnimScript_023_5340
	dw BattleAnimScript_023_535a
	dw BattleAnimScript_023_536c
	dw BattleAnimScript_023_537f
	dw BattleAnimScript_023_538b
	dw BattleAnimScript_023_53b6
	dw BattleAnimScript_023_53f5
	dw BattleAnimScript_023_540d
	dw BattleAnimScript_023_542c
	dw BattleAnimScript_023_5476
	dw BattleAnimScript_023_5492
	dw BattleAnimScript_023_54a7
	dw BattleAnimScript_023_54c0
	dw BattleAnimScript_023_54d2
	dw BattleAnimScript_023_54e2
	dw BattleAnimScript_023_54f3
	dw BattleAnimScript_023_5514
	dw BattleAnimScript_023_5567
	dw BattleAnimScript_023_5591
	dw BattleAnimScript_023_55b5
	dw BattleAnimScript_023_55b5

; battle-anim scripts, indexed via BattleAnimScript_Pointers (VM via AdvanceBattleScriptMode; opcode table unreversed)
BattleAnimScript_023_4132::
	dr $8c132, $8c157
BattleAnimScript_023_4157::
	dr $8c157, $8c174
BattleAnimScript_023_4174::
	dr $8c174, $8c18b
BattleAnimScript_023_418b::
	dr $8c18b, $8c1b3
BattleAnimScript_023_41b3::
	dr $8c1b3, $8c1d0
BattleAnimScript_023_41d0::
	dr $8c1d0, $8c1ed
BattleAnimScript_023_41ed::
	dr $8c1ed, $8c23f
BattleAnimScript_023_423f::
	dr $8c23f, $8c276
BattleAnimScript_023_4276::
	dr $8c276, $8c2ac
BattleAnimScript_023_42ac::
	dr $8c2ac, $8c2d2
BattleAnimScript_023_42d2::
	dr $8c2d2, $8c2ff
BattleAnimScript_023_42ff::
	dr $8c2ff, $8c32a
BattleAnimScript_023_432a::
	dr $8c32a, $8c352
BattleAnimScript_023_4352::
	dr $8c352, $8c37f
BattleAnimScript_023_437f::
	dr $8c37f, $8c393
BattleAnimScript_023_4393::
	dr $8c393, $8c3ad
BattleAnimScript_023_43ad::
	dr $8c3ad, $8c3c7
BattleAnimScript_023_43c7::
	dr $8c3c7, $8c415
BattleAnimScript_023_4415::
	dr $8c415, $8c456
BattleAnimScript_023_4456::
	dr $8c456, $8c47e
BattleAnimScript_023_447e::
	dr $8c47e, $8c4b1
BattleAnimScript_023_44b1::
	dr $8c4b1, $8c4c8
BattleAnimScript_023_44c8::
	dr $8c4c8, $8c4fb
BattleAnimScript_023_44fb::
	dr $8c4fb, $8c50a
BattleAnimScript_023_450a::
	dr $8c50a, $8c526
BattleAnimScript_023_4526::
	dr $8c526, $8c55b
BattleAnimScript_023_455b::
	dr $8c55b, $8c56c
BattleAnimScript_023_456c::
	dr $8c56c, $8c584
BattleAnimScript_023_4584::
	dr $8c584, $8c59b
BattleAnimScript_023_459b::
	dr $8c59b, $8c5ea
BattleAnimScript_023_45ea::
	dr $8c5ea, $8c60a
BattleAnimScript_023_460a::
	dr $8c60a, $8c62f
BattleAnimScript_023_462f::
	dr $8c62f, $8c672
BattleAnimScript_023_4672::
	dr $8c672, $8c68b
BattleAnimScript_023_468b::
	dr $8c68b, $8c69f
BattleAnimScript_023_469f::
	dr $8c69f, $8c6c8
BattleAnimScript_023_46c8::
	dr $8c6c8, $8c6de
BattleAnimScript_023_46de::
	dr $8c6de, $8c6ee
BattleAnimScript_023_46ee::
	dr $8c6ee, $8c713
BattleAnimScript_023_4713::
	dr $8c713, $8c72e
BattleAnimScript_023_472e::
	dr $8c72e, $8c756
BattleAnimScript_023_4756::
	dr $8c756, $8c787
BattleAnimScript_023_4787::
	dr $8c787, $8c79e
BattleAnimScript_023_479e::
	dr $8c79e, $8c7b5
BattleAnimScript_023_47b5::
	dr $8c7b5, $8c7e1
BattleAnimScript_023_47e1::
	dr $8c7e1, $8c7ee
BattleAnimScript_023_47ee::
	dr $8c7ee, $8c842
BattleAnimScript_023_4842::
	dr $8c842, $8c858
BattleAnimScript_023_4858::
	dr $8c858, $8c872
BattleAnimScript_023_4872::
	dr $8c872, $8c897
BattleAnimScript_023_4897::
	dr $8c897, $8c8b4
BattleAnimScript_023_48b4::
	dr $8c8b4, $8c8c1
BattleAnimScript_023_48c1::
	dr $8c8c1, $8c8e7
BattleAnimScript_023_48e7::
	dr $8c8e7, $8c97b
BattleAnimScript_023_497b::
	dr $8c97b, $8c9a4
BattleAnimScript_023_49a4::
	dr $8c9a4, $8c9bf
BattleAnimScript_023_49bf::
	dr $8c9bf, $8c9f0
BattleAnimScript_023_49f0::
	dr $8c9f0, $8ca1e
BattleAnimScript_023_4a1e::
	dr $8ca1e, $8ca54
BattleAnimScript_023_4a54::
	dr $8ca54, $8ca80
BattleAnimScript_023_4a80::
	dr $8ca80, $8cacf
BattleAnimScript_023_4acf::
	dr $8cacf, $8cae7
BattleAnimScript_023_4ae7::
	dr $8cae7, $8cb70
BattleAnimScript_023_4b70::
	dr $8cb70, $8cb8a
BattleAnimScript_023_4b8a::
	dr $8cb8a, $8cbb6
BattleAnimScript_023_4bb6::
	dr $8cbb6, $8cbd3
BattleAnimScript_023_4bd3::
	dr $8cbd3, $8cbf0
BattleAnimScript_023_4bf0::
	dr $8cbf0, $8cc29
BattleAnimScript_023_4c29::
	dr $8cc29, $8cc4f
BattleAnimScript_023_4c4f::
	dr $8cc4f, $8cca8
BattleAnimScript_023_4ca8::
	dr $8cca8, $8ccd1
BattleAnimScript_023_4cd1::
	dr $8ccd1, $8cce1
BattleAnimScript_023_4ce1::
	dr $8cce1, $8ccfa
BattleAnimScript_023_4cfa::
	dr $8ccfa, $8cd12
BattleAnimScript_023_4d12::
	dr $8cd12, $8cd41
BattleAnimScript_023_4d41::
	dr $8cd41, $8cd96
BattleAnimScript_023_4d96::
	dr $8cd96, $8cdb6
BattleAnimScript_023_4db6::
	dr $8cdb6, $8cddf
BattleAnimScript_023_4ddf::
	dr $8cddf, $8ce2e
BattleAnimScript_023_4e2e::
	dr $8ce2e, $8ce6a
BattleAnimScript_023_4e6a::
	dr $8ce6a, $8ce7d
BattleAnimScript_023_4e7d::
	dr $8ce7d, $8ce97
BattleAnimScript_023_4e97::
	dr $8ce97, $8ceb4
BattleAnimScript_023_4eb4::
	dr $8ceb4, $8cecd
BattleAnimScript_023_4ecd::
	dr $8cecd, $8cedc
BattleAnimScript_023_4edc::
	dr $8cedc, $8ceee
BattleAnimScript_023_4eee::
	dr $8ceee, $8cf0e
BattleAnimScript_023_4f0e::
	dr $8cf0e, $8cf61
BattleAnimScript_023_4f61::
	dr $8cf61, $8cf7a
BattleAnimScript_023_4f7a::
	dr $8cf7a, $8cf8e
BattleAnimScript_023_4f8e::
	dr $8cf8e, $8cfb2
BattleAnimScript_023_4fb2::
	dr $8cfb2, $8cfcc
BattleAnimScript_023_4fcc::
	dr $8cfcc, $8cfd9
BattleAnimScript_023_4fd9::
	dr $8cfd9, $8cfe9
BattleAnimScript_023_4fe9::
	dr $8cfe9, $8cffc
BattleAnimScript_023_4ffc::
	dr $8cffc, $8d01e
BattleAnimScript_023_501e::
	dr $8d01e, $8d036
BattleAnimScript_023_5036::
	dr $8d036, $8d056
BattleAnimScript_023_5056::
	dr $8d056, $8d075
BattleAnimScript_023_5075::
	dr $8d075, $8d090
BattleAnimScript_023_5090::
	dr $8d090, $8d0ab
BattleAnimScript_023_50ab::
	dr $8d0ab, $8d0c6
BattleAnimScript_023_50c6::
	dr $8d0c6, $8d0de
BattleAnimScript_023_50de::
	dr $8d0de, $8d0f6
BattleAnimScript_023_50f6::
	dr $8d0f6, $8d105
BattleAnimScript_023_5105::
	dr $8d105, $8d11a
BattleAnimScript_023_511a::
	dr $8d11a, $8d131
BattleAnimScript_023_5131::
	dr $8d131, $8d151
BattleAnimScript_023_5151::
	dr $8d151, $8d179
BattleAnimScript_023_5179::
	dr $8d179, $8d1a3
BattleAnimScript_023_51a3::
	dr $8d1a3, $8d1c4
BattleAnimScript_023_51c4::
	dr $8d1c4, $8d1ef
BattleAnimScript_023_51ef::
	dr $8d1ef, $8d20d
BattleAnimScript_023_520d::
	dr $8d20d, $8d219
BattleAnimScript_023_5219::
	dr $8d219, $8d22c
BattleAnimScript_023_522c::
	dr $8d22c, $8d240
BattleAnimScript_023_5240::
	dr $8d240, $8d292
BattleAnimScript_023_5292::
	dr $8d292, $8d2cf
BattleAnimScript_023_52cf::
	dr $8d2cf, $8d2fc
BattleAnimScript_023_52fc::
	dr $8d2fc, $8d308
BattleAnimScript_023_5308::
	dr $8d308, $8d340
BattleAnimScript_023_5340::
	dr $8d340, $8d35a
BattleAnimScript_023_535a::
	dr $8d35a, $8d36c
BattleAnimScript_023_536c::
	dr $8d36c, $8d37f
BattleAnimScript_023_537f::
	dr $8d37f, $8d38b
BattleAnimScript_023_538b::
	dr $8d38b, $8d3b6
BattleAnimScript_023_53b6::
	dr $8d3b6, $8d3f5
BattleAnimScript_023_53f5::
	dr $8d3f5, $8d40d
BattleAnimScript_023_540d::
	dr $8d40d, $8d42c
BattleAnimScript_023_542c::
	dr $8d42c, $8d476
BattleAnimScript_023_5476::
	dr $8d476, $8d492
BattleAnimScript_023_5492::
	dr $8d492, $8d4a7
BattleAnimScript_023_54a7::
	dr $8d4a7, $8d4c0
BattleAnimScript_023_54c0::
	dr $8d4c0, $8d4d2
BattleAnimScript_023_54d2::
	dr $8d4d2, $8d4e2
BattleAnimScript_023_54e2::
	dr $8d4e2, $8d4f3
BattleAnimScript_023_54f3::
	dr $8d4f3, $8d514
BattleAnimScript_023_5514::
	dr $8d514, $8d567
BattleAnimScript_023_5567::
	dr $8d567, $8d591
BattleAnimScript_023_5591::
	dr $8d591, $8d5b5
BattleAnimScript_023_55b5::
	dr $8d5b5, $8d5cc

; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_55cc:
	dr $8d5cc, $8d5f6
; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_55f6:
	dr $8d5f6, $8d5fa
; TODO disassemble
Func_023_55fa:
	dr $8d5fa, $8d6a2
BattleScript_023_56a2:
	dr $8d6a2, $8d6de
Func_023_56de:
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
Func_023_56f3:
	dr $8d6f3, $8d7ae
; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_57ae:
	dr $8d7ae, $8d7d1
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_57d1:
	dr $8d7d1, $8d7e1
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_57e1:
	dr $8d7e1, $8d7f4
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_57f4:
	dr $8d7f4, $8d809
; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_5809:
	dr $8d809, $8d80f
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
Script_023_580f:
	dr $8d80f, $8d840


