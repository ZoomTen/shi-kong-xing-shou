Func_02d_4000:
	ld bc, $0480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame
	call Func_02d_403d
	xor a
	ld [wSelectedOption], a
	farcall Func_026_45b9
	call DelayFrame
	ld de, BattleTextPointers
	ld a, [wd3ff]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $b6
	ld [wMenuTextX], a
	ld a, $fe
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_02d_403d:
	ld a, [wd3ff]
	cp $2b
	jr z, Func_02d_404d
	cp $2c
	jr z, Func_02d_404d
	ld de, BattleWindowTilemap
	jr Func_02d_405a

Func_02d_404d:
	ld a, $a5
	ld [wd9d0], a
	ld a, $99
	ld [wd9d1], a
	ld de, BattleWindowTilemapWide

Func_02d_405a:
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

BattleWindowTilemap:
	db $04, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
	db $03, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8, $05
	db $03, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9, $05
	db $03, $da, $dc, $de, $e0, $e2, $e4, $e6, $e8, $ea, $ec, $ee, $f0, $f2, $f4, $f6, $f8, $fa, $fc, $05
	db $03, $db, $dd, $df, $e1, $e3, $e5, $e7, $e9, $eb, $ed, $ef, $f1, $f3, $f5, $f7, $f9, $fb, $fd, $05
	db $06, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $08

BattleWindowTilemapWide:
	db $04, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
	db $03, $b6, $b8, $ba, $bc, $00, $00, $00, $00, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $05
	db $03, $b7, $b9, $bb, $bd, $00, $00, $00, $00, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $05
	db $03, $d2, $d4, $d6, $d8, $da, $dc, $de, $e0, $e2, $e4, $e6, $e8, $ea, $ec, $ee, $f0, $f2, $f4, $05
	db $03, $d3, $d5, $d7, $d9, $db, $dd, $df, $e1, $e3, $e5, $e7, $e9, $eb, $ed, $ef, $f1, $f3, $f5, $05
	db $06, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $08

BattleTextPointers:
	dw BattleText_4216, BattleText_4216, BattleText_4257, BattleText_4263
	dw BattleText_4273, BattleText_4282, BattleText_428e, BattleText_42a5
	dw BattleText_42bb, BattleText_42cf, BattleText_42e1, BattleText_42ef
	dw BattleText_42fd, BattleText_4310, BattleText_4321, BattleText_4333
	dw BattleText_433c, BattleText_4346, BattleText_4350, BattleText_435b
	dw BattleText_436c, BattleText_4376, BattleText_437f, BattleText_4389
	dw BattleText_4393, BattleText_439e, BattleText_43a8, BattleText_43b0
	dw BattleText_43b9, BattleText_43c2, BattleText_43ce, BattleText_43d6
	dw BattleText_43e4, BattleText_43f3, BattleText_43ff, BattleText_440f
	dw BattleText_4427, BattleText_4439, BattleText_4444, BattleText_444d
	dw BattleText_445c, BattleText_4487, BattleText_4492, BattleText_44ac
	dw BattleText_44b7, BattleText_44bf, BattleText_44c7, BattleText_44d6
	dw BattleText_44ec, BattleText_44f3, BattleText_44f9, BattleText_4505
	dw BattleText_4511, BattleText_451b, BattleText_4525, BattleText_452b
	dw BattleText_4534, BattleText_4543, BattleText_4552, BattleText_455e
	dw BattleText_456d, BattleText_457c, BattleText_4588, BattleText_4597
	dw BattleText_45a0, BattleText_45aa, BattleText_45b5, BattleText_45bc
	dw BattleText_45c8, BattleText_45d1, BattleText_45e0, BattleText_45ec
	dw BattleText_45f5, BattleText_4602, BattleText_460b, BattleText_4613
	dw BattleText_461d, BattleText_4629, BattleText_4635, BattleText_464b
	dw BattleText_4651, BattleText_4657, BattleText_4660, BattleText_4668
	dw BattleText_4676, BattleText_4683, BattleText_468b, BattleText_4693
	dw BattleText_469b, BattleText_46a4, BattleText_46ab, BattleText_46bd
	dw BattleText_46cf

; TODO: battle message text; control codes <NAME>/<NUM>/<ITEM>/<choice> are placeholders pending menu-text macros
	; "辰虎：師兄﹐一較高下吧﹗"
BattleText_4216:
	db $f2, $a4, $a5, $a6, $a7, $a8, $f1, $33, $f0, $1a, $f2, $a9, $f1, $9e, $f2, $aa
	db $ab, $f1, $35, $ed, $f2, $ac, $f1, $06, $f2, $a6, $ad, $f0, $32, $f2, $33, $ae
	db $af, $4a, $f1, $51, $53, $ed, $f2, $a4, $a5, $a6, $b0, $b1, $b2, $b3, $f1, $2c
	db $35, $ed, $f2, $ac, $f1, $06, $f2, $a6, $e7, $f2, $56, $4a, $f1, $51, $64, $53
	db $e2

	; "<NAME9>：<NAME>﹐去吧﹗"
BattleText_4257:
	db $e9, $f2, $a6, $e7, $f1, $33, $f2, $bc, $ab, $f1, $35, $e2

	; "<NAME9>：輪到你了﹐<NAME>﹗"
BattleText_4263:
	db $e9, $f2, $a6, $f2, $b7, $f1, $62, $f2, $4a, $f1, $64, $33, $e7, $f1, $35, $e2

	; "<NAME9>：<NAME>﹐就靠你了﹗"
BattleText_4273:
	db $e9, $f2, $a6, $e7, $f1, $33, $f2, $d7, $f2, $b8, $4a, $f1, $64, $35, $e2

	; "<NAME9>：加油吧﹐<NAME>﹗"
BattleText_4282:
	db $e9, $f2, $a6, $f2, $2b, $b9, $ab, $f1, $33, $e7, $35, $e2

	; "<NAME9>：看我的厲害⚬<NAME>﹖﹐去吧﹗"
BattleText_428e:
	db $e9, $f2, $a6, $f2, $56, $ad, $f1, $51, $f2, $ba, $bb, $f1, $53, $e7, $f1, $5d
	db $33, $f2, $bc, $ab, $f1, $35, $e2

	; "<NAME9>：做的不錯﹐<NAME>回來吧﹗"
BattleText_42a5:
	db $e9, $f2, $a6, $f2, $bd, $f1, $51, $f0, $32, $f2, $be, $f1, $33, $e7, $f1, $19
	db $f2, $bf, $ab, $f1, $35, $ed

	; "<NAME9>：算了～回來吧﹐<NAME>﹗"
BattleText_42bb:
	db $e9, $f2, $a6, $f2, $c0, $f1, $64, $f2, $1f, $f1, $19, $f2, $bf, $ab, $f1, $33
	db $e7, $f1, $35, $e2

	; "<NAME9>：危險﹗回來吧﹐<NAME>﹗"
BattleText_42cf:
	db $e9, $f2, $a6, $f2, $c1, $c2, $f1, $35, $19, $f2, $bf, $ab, $f1, $33, $e7, $f1
	db $35, $e2

	; "<NAME>的攻擊～<choice>"
BattleText_42e1:
	db $e7, $f1, $51, $f0, $24, $07, $f2, $1f, $e6, $f2, $1f, $f1, $35, $ed

	; "<NAME>出招了～<choice>"
BattleText_42ef:
	db $e7, $f2, $0a, $c3, $f1, $64, $f2, $1f, $e6, $f2, $1f, $f1, $35, $ed

	; "<NAME>使出了密技～<choice>"
BattleText_42fd:
	db $e7, $f1, $3f, $f2, $0a, $f1, $64, $f2, $1e, $f1, $54, $f2, $1f, $e6, $f2, $1f
	db $f1, $35, $ed

	; "<NAME>法力聚集了﹗<choice>"
BattleText_4310:
	db $e7, $f0, $bb, $19, $f2, $c4, $f0, $1b, $f1, $64, $35, $e6, $f2, $1f, $f1, $35
	db $ed

	; "<NAME>全心的攻擊～<choice>"
BattleText_4321:
	db $e7, $f0, $18, $f2, $c5, $f1, $51, $f0, $24, $07, $f2, $1f, $e6, $f2, $1f, $f1
	db $35, $ed

	; "<NAME>躲過了⋯"
BattleText_4333:
	db $e7, $f2, $c6, $b1, $f1, $64, $f2, $c7, $ed

	; "沒有命中⋯"
BattleText_433c:
	db $f2, $c8, $f1, $65, $f0, $4f, $29, $f2, $c7, $ed

	; "<NAME>似乎躲開了﹗"
BattleText_4346:
	db $e7, $f2, $25, $c9, $c6, $0b, $f1, $64, $35, $ed

	; "被<NAME>識破了﹗"
BattleText_4350:
	db $f2, $60, $e7, $f2, $ca, $f0, $0c, $f1, $64, $35, $ed

	; "對<NAME>起不了任何作用﹗"
BattleText_435b:
	db $f2, $07, $e7, $f2, $cb, $f0, $32, $f1, $64, $f2, $3d, $3e, $cc, $f1, $40, $35
	db $ed

	; "效果非常好﹗"
BattleText_436c:
	db $f1, $7f, $7b, $f2, $69, $40, $cd, $f1, $35, $ed

	; "效果很好﹗"
BattleText_4376:
	db $f1, $7f, $7b, $cc, $f2, $cd, $f1, $35, $ed

	; "效果普通﹗"
BattleText_437f:
	db $f1, $7f, $7b, $f2, $a3, $f0, $89, $f1, $35, $ed

	; "效果不好﹗"
BattleText_4389:
	db $f1, $7f, $7b, $f0, $32, $f2, $cd, $f1, $35, $ed

	; "<NAME>被涷傷了﹗"
BattleText_4393:
	db $e7, $f2, $60, $f1, $de, $f0, $2b, $f1, $64, $35, $ed

	; "<NAME>被灼傷了﹗"
BattleText_439e:
	db $e7, $f2, $60, $d2, $f0, $2b, $f1, $64, $35, $ed

	; "<NAME>中毒了﹗"
BattleText_43a8:
	db $e7, $f0, $29, $97, $f1, $64, $35, $ed

	; "<NAME>混亂了﹗"
BattleText_43b0:
	db $e7, $f2, $d3, $f0, $88, $f1, $64, $35, $ed

	; "<NAME>睡著了﹗"
BattleText_43b9:
	db $e7, $f0, $57, $f2, $1c, $f1, $64, $35, $ed

	; "<NAME>嚇了一跳﹗"
BattleText_43c2:
	db $e7, $f2, $d4, $f1, $64, $f0, $1a, $f2, $d5, $f1, $35, $ed

	; "<NAME>麻痺了﹗"
BattleText_43ce:
	db $e7, $f0, $cd, $ce, $f1, $64, $35, $ed

	; "<NAME>的防禦力下降了﹗"
BattleText_43d6:
	db $e7, $f1, $51, $f0, $0a, $0b, $19, $f2, $aa, $05, $f1, $64, $35, $ed

	; "<NAME>的命中率下降了﹗"
BattleText_43e4:
	db $e7, $f1, $51, $f0, $4f, $29, $f1, $cd, $f2, $aa, $05, $f1, $64, $35, $ed

	; "<NAME>的速度下降了﹗"
BattleText_43f3:
	db $e7, $f1, $51, $70, $71, $f2, $aa, $05, $f1, $64, $35, $ed

	; "<NAME>將攻擊反彈回去了﹗"
BattleText_43ff:
	db $e7, $f2, $8a, $f0, $24, $07, $87, $13, $f1, $19, $f2, $bc, $f1, $64, $35, $ed

	; "<NAME>不知怎麼回事的攻擊了自己﹗"
BattleText_440f:
	db $e7, $f0, $32, $f2, $b3, $ce, $cf, $f1, $19, $f2, $d6, $f1, $51, $f0, $24, $07
	db $f1, $64, $f2, $6b, $6c, $f1, $35, $ed

	; "<NAME>嚇一跳﹐而忘了攻擊﹗"
BattleText_4427:
	db $e7, $f2, $d4, $f0, $1a, $f2, $d5, $f1, $33, $d2, $59, $64, $f0, $24, $07, $f1
	db $35, $ed

	; "<NAME>還沒有醒來⋯"
BattleText_4439:
	db $e7, $f2, $65, $c8, $f1, $65, $f2, $36, $bf, $c7, $ed

	; "<NAME>醒過來了﹗"
BattleText_4444:
	db $e7, $f2, $36, $b1, $bf, $f1, $64, $35, $ed

	; "命中了<NAME>的要害﹗﹗"
BattleText_444d:
	db $f0, $4f, $29, $f1, $64, $e7, $f1, $51, $58, $f2, $bb, $f1, $35, $35, $ed

	; "辰虎：師兄﹐這就是你的程度嗎﹖"
BattleText_445c:
	db $f2, $a4, $a5, $a6, $a7, $a8, $f1, $33, $f2, $57, $d7, $f1, $43, $f2, $4a, $f1
	db $51, $f2, $d8, $f1, $71, $5c, $5d, $ed, $f0, $16, $f4, $23, $f1, $c6, $f2, $a6
	db $f1, $c8, $f2, $c7, $f1, $c8, $f0, $d8, $f1, $35, $ed

	; "戰鬥勝利了﹗"
BattleText_4487:
	db $f2, $03, $f0, $73, $f2, $d9, $f1, $7a, $64, $35, $ed

	; "辰虎：可惡﹗師兄﹐我會再努力的﹗"
BattleText_4492:
	db $f2, $a4, $a5, $a6, $f1, $c8, $f0, $d8, $f1, $35, $f2, $a7, $a8, $f1, $33, $f2
	db $ad, $33, $da, $db, $f0, $19, $f1, $51, $35, $ed

	; "得到<NUM>點經驗值"
BattleText_44ac:
	db $f2, $dc, $f1, $62, $e1, $f1, $b5, $73, $74, $75, $ed

	; "得到<NUM>元"
BattleText_44b7:
	db $f2, $dc, $f1, $62, $e1, $f1, $b4, $ed

	; "<NAME>升級了﹗"
BattleText_44bf:
	db $e7, $f2, $dd, $17, $f1, $64, $35, $e2

	; "<getchoice>"
BattleText_44c7:
	db $e5, $f1, $45, $46, $33, $f0, $4b, $f2, $de, $f1, $7f, $40, $f2, $1f, $ed

	; "<NAME>復活﹐並回復"
BattleText_44d6:
	db $e7, $f1, $1a, $df, $33, $f2, $00, $f1, $19, $1a, $ed, $f1, $ad, $b2, $d6, $51
	db $ce, $f0, $19, $f1, $53, $ed

	; "使用～<ITEM>"
BattleText_44ec:
	db $f1, $3f, $40, $f2, $1f, $e8, $ed

	; "使用道具"
BattleText_44f3:
	db $f1, $3f, $40, $2c, $2d, $ed

	; "提升<NAME>點魔禦力"
BattleText_44f9:
	db $f1, $d4, $f2, $dd, $e7, $f1, $b5, $72, $f0, $0b, $19, $ed

	; "<NAME>學到了新技巧～<choice>"
BattleText_4505:
	db $e7, $f1, $60, $62, $64, $63, $54, $55, $f2, $1f, $e6, $e2

	; "效果不錯﹗"
BattleText_4511:
	db $f1, $7f, $7b, $f0, $32, $f2, $be, $f1, $35, $ed

	; "效果還可以﹗"
BattleText_451b:
	db $f1, $7f, $7b, $f2, $65, $f1, $c8, $cb, $35, $ed

	; "<NAME>忍耐中"
BattleText_4525:
	db $e7, $f0, $21, $22, $29, $ed

	; "<NAME>忍無可忍"
BattleText_452b:
	db $e7, $f0, $21, $76, $f1, $c8, $f0, $21, $ed

	; "<NAME>的防禦力提昇了﹗"
BattleText_4534:
	db $e7, $f1, $51, $f0, $0a, $0b, $19, $f1, $d4, $f2, $04, $f1, $64, $35, $ed

	; "<NAME>的命中率提昇了﹗"
BattleText_4543:
	db $e7, $f1, $51, $f0, $4f, $29, $f1, $cd, $d4, $f2, $04, $f1, $64, $35, $ed

	; "<NAME>的速度提昇了﹗"
BattleText_4552:
	db $e7, $f1, $51, $70, $71, $d4, $f2, $04, $f1, $64, $35, $ed

	; "<NAME>的攻擊力提昇了﹗"
BattleText_455e:
	db $e7, $f1, $51, $f0, $24, $07, $19, $f1, $d4, $f2, $04, $f1, $64, $35, $ed

	; "<NAME>的命中率提昇了﹗"
BattleText_456d:
	db $e7, $f1, $51, $f0, $4f, $29, $f1, $cd, $d4, $f2, $04, $f1, $64, $35, $ed

	; "<NAME>獲得先發攻擊﹗"
BattleText_457c:
	db $e7, $f2, $df, $dc, $f0, $4a, $4b, $24, $07, $f1, $35, $ed

	; "<NAME>被封印了一項技巧"
BattleText_4588:
	db $e7, $f2, $60, $f0, $1f, $20, $f1, $64, $f0, $1a, $f1, $5f, $54, $55, $ed

	; "<NAME>無法動彈"
BattleText_4597:
	db $e7, $f0, $76, $bb, $f2, $87, $f0, $13, $ed

	; "<NAME>血量回復了"
BattleText_45a0:
	db $e7, $f0, $3a, $f2, $44, $f1, $19, $1a, $64, $ed

	; "<NAME>迴避率提昇了"
BattleText_45aa:
	db $e7, $f1, $9c, $9d, $cd, $d4, $f2, $04, $f1, $64, $ed

	; "<NAME>嚇跑了"
BattleText_45b5:
	db $e7, $f2, $d4, $f1, $31, $64, $ed

	; "<NAME>提昇所有能力"
BattleText_45bc:
	db $e7, $f1, $d4, $f2, $04, $f1, $d3, $65, $8d, $f0, $19, $ed

	; "<NAME>攻擊力下降"
BattleText_45c8:
	db $e7, $f0, $24, $07, $19, $f2, $aa, $05, $ed

	; "<NAME>命中要害機率提昇"
BattleText_45d1:
	db $e7, $f0, $4f, $29, $f1, $58, $f2, $bb, $f1, $90, $cd, $d4, $f2, $04, $ed

	; "<NAME>力量儲存中"
BattleText_45e0:
	db $e7, $f0, $19, $f2, $44, $f3, $00, $f1, $39, $f0, $29, $ed

	; "<NAME>鑽入地底"
BattleText_45ec:
	db $e7, $f2, $78, $30, $f0, $7a, $f3, $01, $ed

	; "<NAME>被種植寄魂種子"
BattleText_45f5:
	db $e7, $f2, $60, $f0, $c8, $f3, $02, $f0, $c6, $c7, $c8, $c9, $ed

	; "<NAME>變成豬了"
BattleText_4602:
	db $e7, $f1, $1d, $6a, $f3, $03, $f1, $64, $ed

	; "<NAME>使用替身"
BattleText_460b:
	db $e7, $f1, $3f, $40, $0c, $f0, $38, $ed

	; "<NAME>飛上天空"
BattleText_4613:
	db $e7, $f0, $a9, $f2, $b6, $f0, $80, $f1, $04, $ed

	; "<NAME>模仿對手技巧"
BattleText_461d:
	db $e7, $f1, $13, $14, $f2, $07, $f0, $6f, $f1, $54, $55, $ed

	; "雙方狀態恢復了"
BattleText_4629:
	db $f0, $77, $f1, $cf, $db, $dc, $f3, $04, $f1, $1a, $64, $ed

	; "<NAME>燙傷‧凍傷‧麻痺‧混亂"
BattleText_4635:
	db $e7, $f3, $05, $f0, $2b, $f3, $06, $f0, $a4, $2b, $f3, $06, $f0, $cd, $ce, $f3
	db $06, $f2, $d3, $f0, $88, $ed

	; "逃跑成功"
BattleText_464b:
	db $f1, $30, $31, $6a, $6b, $ed

	; "逃跑失敗"
BattleText_4651:
	db $f1, $30, $31, $6c, $6d, $ed

	; "<NAME>被收服了"
BattleText_4657:
	db $e7, $f2, $60, $f0, $86, $f1, $c9, $64, $ed

	; "收服失敗了"
BattleText_4660:
	db $f0, $86, $f1, $c9, $6c, $6d, $64, $ed

	; "<NAME>已送回託管盒中"
BattleText_4668:
	db $e7, $f1, $56, $f3, $07, $f1, $19, $f3, $08, $09, $0a, $f0, $29, $ed

	; "<NAME>的迴避率下降了﹗"
BattleText_4676:
	db $e7, $f1, $51, $9c, $9d, $cd, $f2, $aa, $05, $f1, $64, $35, $ed

	; "發現了<NAME>"
BattleText_4683:
	db $f0, $4b, $f3, $0b, $f1, $64, $e7, $ed

	; "<NAME>出現了"
BattleText_468b:
	db $e7, $f2, $0a, $f3, $0b, $f1, $64, $ed

	; "戰鬥失敗"
BattleText_4693:
	db $f2, $03, $f0, $73, $f1, $6c, $6d, $ed

	; "錢被偷走了"
BattleText_469b:
	db $f2, $4b, $60, $f0, $47, $ab, $f1, $64, $ed

	; "變成<NAME>了"
BattleText_46a4:
	db $f1, $1d, $6a, $e7, $f1, $64, $ed

	; "抱歉﹗你的盒子已滿﹗"
BattleText_46ab:
	db $f2, $59, $5a, $f1, $35, $f2, $4a, $f1, $51, $f3, $0a, $f0, $c9, $f1, $56, $57
	db $35, $ed

	; "寄魂種子﹐發揮效用～"
BattleText_46bd:
	db $f0, $c6, $c7, $c8, $c9, $f1, $33, $f0, $4b, $f2, $de, $f1, $7f, $40, $f2, $1f
	db $ed, $ed

	; "謎的力量儲存中～"
BattleText_46cf:
	db $f1, $20, $f1, $51, $f0, $19, $f2, $44, $f3, $00, $f1, $39, $f0, $29, $f2, $1f
	db $ed

GetPlayerWorldCoords:
	ld a, [wPlayerObject]
	sub $10
	swap a
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	swap a
	ld [wd3f9], a
	ld a, [hFFAB]
	ld l, a
	ld a, [wd0f9]
	add l
	ld c, a
	ld a, [hFFAA]
	ld l, a
	ld a, [wd3f9]
	add l
	ld e, a
	ret

LoadMapAttribute:
	ldh a, [hMapGroup]
	cp 1
	jp z, LoadMapAttribute_Group1
	cp 2
	jp z, LoadMapAttribute_Group2
	cp 3
	jp z, LoadMapAttribute_Group3
	cp 4
	jp z, LoadMapAttribute_Group4
	cp 5
	jp z, LoadMapAttribute_Group5
	cp 6
	jp z, LoadMapAttribute_Group6
	ret

LoadMapAttribute_Group1:
	ld de, MapAttr_Group1
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [$d9be], a
	ret

LoadMapAttribute_Group2:
	ld de, MapAttr_Group2
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [$d9be], a
	ret

LoadMapAttribute_Group3:
	ld de, MapAttr_Group3
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [$d9be], a
	ret

LoadMapAttribute_Group4:
	ld de, MapAttr_Group4
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [$d9be], a
	ret

LoadMapAttribute_Group5:
	ld de, MapAttr_Group5
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [$d9be], a
	ret

LoadMapAttribute_Group6:
	ld de, MapAttr_Group6
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [$d9be], a
	ret

MapAttr_Group1:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $04, $04, $02, $03, $03, $03, $03, $03, $00, $01, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

MapAttr_Group2:
	db $00, $00, $00, $02, $02, $02, $03, $03, $00, $04, $04, $04, $04, $04, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

MapAttr_Group3:
	db $00, $02, $02, $02, $02, $02, $02, $00, $00, $00, $00, $03, $03, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $02
	db $02, $00, $00, $00

MapAttr_Group4:
	db $00, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $00, $00, $00, $00, $00
	db $03, $00, $00, $00, $00, $05, $06, $00, $00, $00, $09, $09, $09, $09, $04, $00
	db $07, $0d, $0d, $0d, $0d, $00, $00, $00, $00, $00, $0c, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0a, $00
	db $0b, $0b, $0b, $0b, $00, $00

MapAttr_Group5:
	db $00, $03, $03, $04, $04, $04, $04, $00, $05, $05, $05, $05, $05, $05, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

MapAttr_Group6:
	db $00, $01, $01, $02, $02, $02, $02, $02, $04, $04, $04, $04, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

LoadScriptedPartyMon:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	ld de, ScriptedMonSlots
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	push hl
	ld de, ScriptedMonData
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	push de
	push de
	push hl
	pop de
	call Func_02d_5133
	pop de
	ld bc, $16

.copy:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy
	pop bc
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	ret

ScriptedMonSlots:
	dw $de00, $de16, $de2c, $de42, $de58, $de6e, $de84, $de9a

ScriptedMonData:
	dw ScriptedMon_0, ScriptedMon_1, ScriptedMon_2, ScriptedMon_3
	dw ScriptedMon_4, ScriptedMon_5, ScriptedMon_6, ScriptedMon_7

ScriptedMon_0:
	db $51, $01, $00, $00, $05, $00, $00, $2c, $00, $00, $31, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

ScriptedMon_1:
	db $75, $03, $00, $00, $22, $00, $00, $2c, $00, $00, $0b, $00, $00, $1e, $00, $00, $00, $00, $00, $00, $00, $00

ScriptedMon_2:
	db $6c, $10, $00, $00, $ed, $15, $00, $57, $00, $00, $25, $00, $00, $2c, $00, $00, $13, $00, $00, $00, $00, $00

ScriptedMon_3:
	db $5b, $19, $00, $00, $6c, $48, $00, $1e, $00, $00, $40, $00, $00, $46, $00, $00, $07, $00, $00, $00, $03, $00

ScriptedMon_4:
	db $63, $24, $00, $00, $c2, $cf, $00, $47, $00, $00, $4b, $00, $00, $24, $00, $00, $8b, $00, $00, $00, $02, $00

ScriptedMon_5:
	db $91, $27, $00, $00, $36, $05, $01, $57, $00, $00, $5c, $00, $00, $59, $00, $00, $14, $00, $00, $00, $11, $00

ScriptedMon_6:
	db $90, $2d, $00, $00, $b8, $82, $01, $83, $00, $00, $57, $00, $00, $02, $00, $00, $0f, $00, $00, $00, $10, $00

ScriptedMon_7:
	db $7e, $35, $00, $00, $4b, $73, $02, $55, $00, $00, $54, $00, $00, $56, $00, $00, $53, $00, $00, $00, $02, $00

LoadWildMon:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld d, a
	pop af
	ld e, a
	call Func_132f
	and a
	jr nz, .case1
	push bc
	call Func_02d_5147
	pop bc
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	ret

.case1:
	ld a, [$dc9c]
	cp $14
	jr nc, .case2
	ld hl, wdb20
	ld a, [$dc9c]
	ld de, $13
	and a
	jr z, .copy

.scan1:
	add hl, de
	dec a
	jr nz, .scan1

.copy:
	push de
	ld c, $13

.copyLoop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyLoop
	ld a, [$dc9c]
	inc a
	ld [$dc9c], a
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	ret

.case2:
	ld a, [$dcab]
	cp $14
	ret nc
	ld a, $a
	ld [$0000], a
	ld a, 1
	ld [$4000], a
	ld hl, $b600
	ld a, [$dcab]
	ld de, $13
	and a
	jr z, .copy

.scan2:
	add hl, de
	dec a
	jr nz, .scan2
	ld a, [$dcab]
	inc a
	ld [$dcab], a
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	xor a
	ld [$0000], a
	ld [$4000], a
	ret

unk_02d_4aa9:
	db $6a, $0d, $00, $00, $00, $13, $2b, $1a, $51, $00, $00, $01, $22, $03, $00, $00
	db $00, $2c, $27, $00, $00, $00, $00, $0f, $00, $50, $00, $02, $24, $06, $00, $00
	db $00, $2c, $25, $66, $00, $00, $00, $c8, $00, $c8, $00, $06, $06, $00, $00, $00
	db $32, $2c, $1f, $13, $00, $00, $5e, $01, $fa, $00, $01, $52, $0a, $00, $00, $00
	db $08, $2c, $00, $00, $00, $00, $f4, $01, $c8, $00, $02, $24, $06, $00, $00, $00
	db $2c, $25, $66, $00, $00, $00, $c8, $00, $c8, $00, $06, $06, $00, $00, $00, $32
	db $2c, $1f, $13, $00, $00, $5e, $01, $fa, $00, $03, $24, $0c, $00, $00, $00, $66
	db $25, $2c, $5d, $00, $00, $c9, $00, $32, $00, $0a, $0d, $00, $00, $00, $0b, $31
	db $02, $2c, $00, $00, $c2, $00, $14, $00, $2e, $0e, $00, $00, $00, $72, $2c, $00
	db $00, $00, $00, $02, $01, $2d, $00, $01, $7f, $12, $00, $00, $00, $21, $0c, $50
	db $0e, $00, $00, $7d, $03, $fa, $00, $01, $92, $15, $00, $00, $00, $7e, $57, $1d
	db $15, $13, $00, $20, $03, $2c, $01, $01, $5a, $1a, $00, $00, $00, $0f, $41, $00
	db $00, $12, $00, $0e, $06, $f4, $01, $04, $0a, $1a, $00, $00, $00, $20, $31, $1d
	db $25, $00, $00, $e6, $01, $64, $00, $24, $19, $00, $00, $00, $66, $5d, $02, $20
	db $00, $00, $fc, $01, $73, $00, $2e, $1c, $00, $00, $00, $73, $7c, $72, $00, $00
	db $00, $01, $02, $69, $00, $06, $1b, $00, $00, $00, $3c, $28, $3b, $32, $12, $00
	db $f0, $01, $5a, $00, $02, $18, $1f, $00, $00, $00, $4a, $49, $47, $15, $00, $00
	db $dc, $05, $44, $02, $65, $20, $00, $00, $00, $49, $1d, $06, $80, $14, $00, $94
	db $06, $66, $03, $02, $4e, $20, $00, $00, $00, $33, $3e, $3b, $77, $00, $00, $26
	db $06, $b6, $03, $05, $21, $00, $00, $00, $36, $2d, $06, $2b, $12, $00, $f0, $04
	db $1a, $04, $01, $91, $27, $00, $00, $00, $57, $5c, $59, $14, $11, $00, $00, $00
	db $00, $00, $02, $62, $25, $00, $00, $00, $3d, $29, $40, $08, $00, $00, $36, $04
	db $1a, $04, $5c, $26, $00, $00, $00, $41, $46, $24, $42, $14, $00, $38, $08, $e1
	db $05, $02, $35, $25, $00, $00, $00, $54, $53, $52, $51, $00, $00, $23, $04, $e8
	db $03, $05, $26, $00, $00, $00, $2a, $36, $2d, $06, $12, $00, $f1, $07, $e2, $04
	db $03, $70, $26, $00, $00, $00, $5e, $66, $06, $12, $00, $00, $0b, $04, $52, $03
	db $71, $27, $00, $00, $00, $60, $5f, $81, $1d, $00, $00, $2a, $04, $84, $03, $6d
	db $28, $00, $00, $00, $5d, $63, $77, $5f, $13, $00, $18, $04, $dc, $05, $04, $8d
	db $2d, $00, $00, $00, $54, $52, $0a, $50, $00, $00, $8d, $05, $21, $02, $41, $2e
	db $00, $00, $00, $05, $69, $71, $6e, $00, $00, $02, $06, $8f, $02, $3f, $2e, $00
	db $00, $00, $6b, $06, $6a, $68, $00, $00, $08, $06, $b6, $03, $9a, $2f, $00, $00
	db $00, $3f, $3d, $32, $31, $13, $00, $79, $06, $1f, $04, $02, $35, $2b, $00, $00
	db $00, $55, $54, $53, $52, $00, $00, $b2, $05, $dc, $05, $05, $2c, $00, $00, $00
	db $2e, $2a, $36, $2d, $12, $00, $36, $06, $41, $05, $03, $5f, $25, $00, $00, $00
	db $83, $82, $44, $43, $00, $00, $00, $04, $c8, $00, $68, $26, $00, $00, $00, $4c
	db $4d, $47, $73, $00, $00, $e9, $03, $c2, $01, $7a, $27, $00, $00, $00, $76, $81
	db $7e, $07, $07, $00, $ef, $03, $c4, $09, $03, $29, $29, $00, $00, $00, $7b, $7a
	db $20, $72, $00, $00, $dc, $05, $2b, $07, $32, $2a, $00, $00, $00, $75, $05, $0f
	db $04, $00, $00, $b6, $05, $9f, $06, $9d, $2b, $00, $00, $00, $75, $7a, $12, $7b
	db $07, $00, $66, $06, $01, $04, $03, $79, $2d, $00, $00, $00, $76, $74, $73, $72
	db $00, $00, $da, $05, $15, $04, $7b, $2e, $00, $00, $00, $75, $7a, $7b, $12, $12
	db $00, $2c, $06, $ce, $04, $05, $2f, $00, $00, $00, $2e, $2d, $36, $2a, $01, $00
	db $40, $06, $1f, $04, $03, $8c, $30, $00, $00, $00, $6b, $69, $6f, $68, $00, $00
	db $f9, $06, $ed, $03, $88, $31, $00, $00, $00, $69, $6b, $5a, $68, $14, $00, $08
	db $07, $51, $04, $64, $32, $00, $00, $00, $4f, $4e, $4d, $3c, $01, $00, $74, $07
	db $4c, $04, $04, $2e, $30, $00, $00, $00, $88, $74, $73, $72, $00, $00, $e3, $06
	db $14, $00, $24, $31, $00, $00, $00, $5d, $7e, $81, $15, $00, $00, $08, $07, $32
	db $00, $0a, $32, $00, $00, $00, $0a, $0f, $20, $02, $12, $00, $5a, $07, $0f, $00
	db $06, $33, $00, $00, $00, $36, $35, $3d, $3c, $13, $00, $9f, $07, $23, $00, $03
	db $0b, $32, $00, $00, $00, $43, $41, $8a, $21, $00, $00, $44, $07, $29, $04, $03
	db $33, $00, $00, $00, $3c, $39, $3f, $37, $00, $00, $c0, $07, $0b, $04, $05, $35
	db $00, $00, $00, $36, $2a, $2e, $2d, $01, $00, $98, $08, $4c, $04, $03, $42, $32
	db $00, $00, $00, $29, $6b, $89, $6f, $00, $00, $74, $07, $1a, $04, $05, $33, $00
	db $00, $00, $17, $2e, $2a, $36, $00, $00, $9f, $07, $e8, $03, $0b, $34, $00, $00
	db $00, $43, $8a, $41, $29, $00, $00, $ec, $07, $51, $04, $02, $7d, $33, $00, $00
	db $00, $88, $89, $74, $0a, $00, $00, $c5, $07, $4c, $04, $2e, $34, $00, $00, $00
	db $88, $89, $74, $0a, $00, $00, $e5, $07, $51, $04, $03, $53, $32, $00, $00, $00
	db $22, $36, $0a, $20, $00, $00, $62, $07, $ed, $03, $14, $33, $00, $00, $00, $81
	db $46, $83, $7e, $00, $00, $a8, $07, $1a, $04, $3d, $34, $00, $00, $00, $68, $22
	db $87, $06, $00, $00, $ee, $07, $7e, $04, $02, $31, $32, $00, $00, $00, $76, $27
	db $74, $42, $00, $00, $6c, $07, $e8, $03, $77, $33, $00, $00, $00, $73, $88, $89
	db $74, $00, $00, $a7, $07, $ed, $03, $03, $06, $32, $00, $00, $00, $36, $28, $3b
	db $0b, $00, $00, $35, $07, $e8, $03, $87, $33, $00, $00, $00, $6c, $89, $5a, $69
	db $00, $00, $a5, $07, $1a, $04, $79, $34, $00, $00, $00, $76, $74, $73, $42, $00
	db $00, $e4, $07, $4c, $04, $02, $06, $32, $00, $00, $00, $35, $3d, $24, $3c, $00
	db $00, $32, $07, $1a, $04, $79, $33, $00, $00, $00, $74, $42, $0b, $27, $00, $00
	db $6b, $07, $4c, $04, $03, $53, $32, $00, $00, $00, $36, $22, $0a, $20, $00, $00
	db $2f, $07, $e8, $03, $55, $33, $00, $00, $00, $3e, $29, $89, $83, $00, $00, $71
	db $07, $f2, $03, $52, $34, $00, $00, $00, $38, $32, $11, $0d, $00, $00, $f0, $07
	db $60, $04, $03, $36, $35, $00, $00, $00, $54, $52, $56, $0a, $00, $00, $f8, $07
	db $2c, $06, $3a, $36, $00, $00, $00, $0a, $26, $54, $02, $00, $00, $34, $08, $45
	db $06, $05, $37, $00, $00, $00, $2e, $2a, $2d, $36, $12, $00, $98, $08, $a5, $05
	db $03, $8e, $36, $00, $00, $00, $69, $06, $05, $71, $00, $00, $46, $08, $2c, $06
	db $8a, $37, $00, $00, $00, $85, $00, $00, $00, $00, $00, $f8, $07, $45, $06, $7c
	db $38, $00, $00, $00, $7a, $7b, $73, $20, $14, $00, $30, $09, $a5, $05, $03, $98
	db $36, $00, $00, $00, $75, $12, $7a, $7b, $00, $00, $1c, $08, $dc, $05, $2c, $37
	db $00, $00, $00, $76, $75, $74, $73, $00, $00, $38, $08, $aa, $05, $9d, $38, $00
	db $00, $00, $7a, $7b, $12, $75, $13, $00, $fc, $08, $e2, $04, $03, $1b, $39, $00
	db $00, $00, $49, $12, $82, $89, $00, $00, $34, $08, $dc, $05, $66, $3a, $00, $00
	db $00, $4b, $4a, $49, $48, $00, $00, $a9, $08, $72, $06, $9b, $3b, $00, $00, $00
	db $4e, $4b, $48, $8b, $13, $00, $db, $09, $a4, $06, $03, $0d, $3a, $00, $00, $00
	db $46, $19, $0a, $45, $00, $00, $10, $09, $45, $06, $61, $3b, $00, $00, $00, $44
	db $43, $42, $41, $00, $00, $f2, $09, $af, $05, $9c, $3c, $00, $00, $00, $41, $7d
	db $22, $45, $14, $00, $2c, $0a, $40, $06, $03, $98, $3b, $00, $00, $00, $75, $12
	db $7a, $7b, $00, $00, $9b, $08, $dc, $05, $7b, $3c, $00, $00, $00, $75, $7a, $7b
	db $1a, $00, $00, $71, $09, $78, $05, $9d, $3d, $00, $00, $00, $7a, $7b, $12, $75
	db $01, $00, $28, $0a, $0e, $06, $03, $4e, $3c, $00, $00, $00, $3d, $3c, $3e, $3b
	db $00, $00, $51, $09, $00, $00, $4a, $3d, $00, $00, $00, $58, $7d, $77, $7f, $00
	db $00, $c9, $09, $00, $00, $9e, $3e, $00, $00, $00, $33, $77, $3e, $3d, $02, $00
	db $96, $0a, $00, $00, $03, $40, $3d, $00, $00, $00, $6c, $69, $5a, $13, $13, $00
	db $00, $00, $00, $00, $45, $3e, $00, $00, $00, $6a, $7e, $82, $81, $14, $00, $00
	db $00, $00, $00, $9f, $3f, $00, $00, $00, $4f, $61, $5d, $62, $02, $00, $00, $00
	db $00, $00, $01, $83, $5a, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00
	db $00, $00

Func_02d_507b::
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	jp Func_02d_50b3

Func_02d_5086::
	dr $b5086, $b50b3

Func_02d_50b3:
	dr $b50b3, $b510c

Func_02d_510c:
	push hl
	push bc

	ld hl, wd876
	ld c, $84
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear

	pop bc
	pop hl
	ret

Func_02d_511b:
	dr $b511b, $b5133

Func_02d_5133:
	dr $b5133, $b5147

Func_02d_5147:
; Load wild mon encounter data

; Get species and level
	ld hl, MON_SPECIES
	add hl, bc ; ld hl, bc
REPT 2
	ld a, [de]
	inc de
	ld [hli], a
ENDR

	ld hl, MON_EXP
	add hl, bc
REPT 4
	ld a, [de]
	inc de
	ld [hli], a
ENDR

	ld hl, MON_MOVE2ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, MON_MOVE3ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, MON_MOVE4ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, MON_STATUS
	add hl, bc
	ld [hl], 0
	inc hl
REPT 2
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	ret

Func_02d_5184:
	dr $b5184, $b51f1

Func_02d_51f1:
	ld hl, MON_HP
	add hl, bc
	ldh a, [hFFCB]
	ld [hli], a
	ldh a, [hFFCC]
	ld [hli], a

	ld hl, MON_MOVE1ID
	add hl, bc
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE1PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE2PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE3PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE4PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a

	ld hl, MON_STATUS
	add hl, bc
	ld [hl], 0
	ret

unk_02d_525a:
	dr $b525a, $b5294

unk_02d_5294:
	dr $b5294, $b64b0


