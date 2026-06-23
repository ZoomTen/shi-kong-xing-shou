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
; TEXT -> 辰虎：師兄﹐一較高下吧﹗
BattleText_4216:
	db $f2, $a4, $a5, $a6, $a7, $a8, $f1, $33, $f0, $1a, $f2, $a9, $f1, $9e, $f2, $aa
	db $ab, $f1, $35, $ed, $f2, $ac, $f1, $06, $f2, $a6, $ad, $f0, $32, $f2, $33, $ae
	db $af, $4a, $f1, $51, $53, $ed, $f2, $a4, $a5, $a6, $b0, $b1, $b2, $b3, $f1, $2c
	db $35, $ed, $f2, $ac, $f1, $06, $f2, $a6, $e7, $f2, $56, $4a, $f1, $51, $64, $53
	db $e2

; TEXT -> <NAME9>：<NAME>﹐去吧﹗
BattleText_4257:
	db $e9, $f2, $a6, $e7, $f1, $33, $f2, $bc, $ab, $f1, $35, $e2

; TEXT -> <NAME9>：輪到你了﹐<NAME>﹗
BattleText_4263:
	db $e9, $f2, $a6, $f2, $b7, $f1, $62, $f2, $4a, $f1, $64, $33, $e7, $f1, $35, $e2

; TEXT -> <NAME9>：<NAME>﹐就靠你了﹗
BattleText_4273:
	db $e9, $f2, $a6, $e7, $f1, $33, $f2, $d7, $f2, $b8, $4a, $f1, $64, $35, $e2

; TEXT -> <NAME9>：加油吧﹐<NAME>﹗
BattleText_4282:
	db $e9, $f2, $a6, $f2, $2b, $b9, $ab, $f1, $33, $e7, $35, $e2

; TEXT -> <NAME9>：看我的厲害⚬<NAME>﹖﹐去吧﹗
BattleText_428e:
	db $e9, $f2, $a6, $f2, $56, $ad, $f1, $51, $f2, $ba, $bb, $f1, $53, $e7, $f1, $5d
	db $33, $f2, $bc, $ab, $f1, $35, $e2

; TEXT -> <NAME9>：做的不錯﹐<NAME>回來吧﹗
BattleText_42a5:
	db $e9, $f2, $a6, $f2, $bd, $f1, $51, $f0, $32, $f2, $be, $f1, $33, $e7, $f1, $19
	db $f2, $bf, $ab, $f1, $35, $ed

; TEXT -> <NAME9>：算了～回來吧﹐<NAME>﹗
BattleText_42bb:
	db $e9, $f2, $a6, $f2, $c0, $f1, $64, $f2, $1f, $f1, $19, $f2, $bf, $ab, $f1, $33
	db $e7, $f1, $35, $e2

; TEXT -> <NAME9>：危險﹗回來吧﹐<NAME>﹗
BattleText_42cf:
	db $e9, $f2, $a6, $f2, $c1, $c2, $f1, $35, $19, $f2, $bf, $ab, $f1, $33, $e7, $f1
	db $35, $e2

; TEXT -> <NAME>的攻擊～<choice>
BattleText_42e1:
	db $e7, $f1, $51, $f0, $24, $07, $f2, $1f, $e6, $f2, $1f, $f1, $35, $ed

; TEXT -> <NAME>出招了～<choice>
BattleText_42ef:
	db $e7, $f2, $0a, $c3, $f1, $64, $f2, $1f, $e6, $f2, $1f, $f1, $35, $ed

; TEXT -> <NAME>使出了密技～<choice>
BattleText_42fd:
	db $e7, $f1, $3f, $f2, $0a, $f1, $64, $f2, $1e, $f1, $54, $f2, $1f, $e6, $f2, $1f
	db $f1, $35, $ed

; TEXT -> <NAME>法力聚集了﹗<choice>
BattleText_4310:
	db $e7, $f0, $bb, $19, $f2, $c4, $f0, $1b, $f1, $64, $35, $e6, $f2, $1f, $f1, $35
	db $ed

; TEXT -> <NAME>全心的攻擊～<choice>
BattleText_4321:
	db $e7, $f0, $18, $f2, $c5, $f1, $51, $f0, $24, $07, $f2, $1f, $e6, $f2, $1f, $f1
	db $35, $ed

; TEXT -> <NAME>躲過了⋯
BattleText_4333:
	db $e7, $f2, $c6, $b1, $f1, $64, $f2, $c7, $ed

; TEXT -> 沒有命中⋯
BattleText_433c:
	db $f2, $c8, $f1, $65, $f0, $4f, $29, $f2, $c7, $ed

; TEXT -> <NAME>似乎躲開了﹗
BattleText_4346:
	db $e7, $f2, $25, $c9, $c6, $0b, $f1, $64, $35, $ed

; TEXT -> 被<NAME>識破了﹗
BattleText_4350:
	db $f2, $60, $e7, $f2, $ca, $f0, $0c, $f1, $64, $35, $ed

; TEXT -> 對<NAME>起不了任何作用﹗
BattleText_435b:
	db $f2, $07, $e7, $f2, $cb, $f0, $32, $f1, $64, $f2, $3d, $3e, $cc, $f1, $40, $35
	db $ed

; TEXT -> 效果非常好﹗
BattleText_436c:
	db $f1, $7f, $7b, $f2, $69, $40, $cd, $f1, $35, $ed

; TEXT -> 效果很好﹗
BattleText_4376:
	db $f1, $7f, $7b, $cc, $f2, $cd, $f1, $35, $ed

; TEXT -> 效果普通﹗
BattleText_437f:
	db $f1, $7f, $7b, $f2, $a3, $f0, $89, $f1, $35, $ed

; TEXT -> 效果不好﹗
BattleText_4389:
	db $f1, $7f, $7b, $f0, $32, $f2, $cd, $f1, $35, $ed

; TEXT -> <NAME>被涷傷了﹗
BattleText_4393:
	db $e7, $f2, $60, $f1, $de, $f0, $2b, $f1, $64, $35, $ed

; TEXT -> <NAME>被灼傷了﹗
BattleText_439e:
	db $e7, $f2, $60, $d2, $f0, $2b, $f1, $64, $35, $ed

; TEXT -> <NAME>中毒了﹗
BattleText_43a8:
	db $e7, $f0, $29, $97, $f1, $64, $35, $ed

; TEXT -> <NAME>混亂了﹗
BattleText_43b0:
	db $e7, $f2, $d3, $f0, $88, $f1, $64, $35, $ed

; TEXT -> <NAME>睡著了﹗
BattleText_43b9:
	db $e7, $f0, $57, $f2, $1c, $f1, $64, $35, $ed

; TEXT -> <NAME>嚇了一跳﹗
BattleText_43c2:
	db $e7, $f2, $d4, $f1, $64, $f0, $1a, $f2, $d5, $f1, $35, $ed

; TEXT -> <NAME>麻痺了﹗
BattleText_43ce:
	db $e7, $f0, $cd, $ce, $f1, $64, $35, $ed

; TEXT -> <NAME>的防禦力下降了﹗
BattleText_43d6:
	db $e7, $f1, $51, $f0, $0a, $0b, $19, $f2, $aa, $05, $f1, $64, $35, $ed

; TEXT -> <NAME>的命中率下降了﹗
BattleText_43e4:
	db $e7, $f1, $51, $f0, $4f, $29, $f1, $cd, $f2, $aa, $05, $f1, $64, $35, $ed

; TEXT -> <NAME>的速度下降了﹗
BattleText_43f3:
	db $e7, $f1, $51, $70, $71, $f2, $aa, $05, $f1, $64, $35, $ed

; TEXT -> <NAME>將攻擊反彈回去了﹗
BattleText_43ff:
	db $e7, $f2, $8a, $f0, $24, $07, $87, $13, $f1, $19, $f2, $bc, $f1, $64, $35, $ed

; TEXT -> <NAME>不知怎麼回事的攻擊了自己﹗
BattleText_440f:
	db $e7, $f0, $32, $f2, $b3, $ce, $cf, $f1, $19, $f2, $d6, $f1, $51, $f0, $24, $07
	db $f1, $64, $f2, $6b, $6c, $f1, $35, $ed

; TEXT -> <NAME>嚇一跳﹐而忘了攻擊﹗
BattleText_4427:
	db $e7, $f2, $d4, $f0, $1a, $f2, $d5, $f1, $33, $d2, $59, $64, $f0, $24, $07, $f1
	db $35, $ed

; TEXT -> <NAME>還沒有醒來⋯
BattleText_4439:
	db $e7, $f2, $65, $c8, $f1, $65, $f2, $36, $bf, $c7, $ed

; TEXT -> <NAME>醒過來了﹗
BattleText_4444:
	db $e7, $f2, $36, $b1, $bf, $f1, $64, $35, $ed

; TEXT -> 命中了<NAME>的要害﹗﹗
BattleText_444d:
	db $f0, $4f, $29, $f1, $64, $e7, $f1, $51, $58, $f2, $bb, $f1, $35, $35, $ed

; TEXT -> 辰虎：師兄﹐這就是你的程度嗎﹖
BattleText_445c:
	db $f2, $a4, $a5, $a6, $a7, $a8, $f1, $33, $f2, $57, $d7, $f1, $43, $f2, $4a, $f1
	db $51, $f2, $d8, $f1, $71, $5c, $5d, $ed, $f0, $16, $f4, $23, $f1, $c6, $f2, $a6
	db $f1, $c8, $f2, $c7, $f1, $c8, $f0, $d8, $f1, $35, $ed

; TEXT -> 戰鬥勝利了﹗
BattleText_4487:
	db $f2, $03, $f0, $73, $f2, $d9, $f1, $7a, $64, $35, $ed

; TEXT -> 辰虎：可惡﹗師兄﹐我會再努力的﹗
BattleText_4492:
	db $f2, $a4, $a5, $a6, $f1, $c8, $f0, $d8, $f1, $35, $f2, $a7, $a8, $f1, $33, $f2
	db $ad, $33, $da, $db, $f0, $19, $f1, $51, $35, $ed

; TEXT -> 得到<NUM>點經驗值
BattleText_44ac:
	db $f2, $dc, $f1, $62, $e1, $f1, $b5, $73, $74, $75, $ed

; TEXT -> 得到<NUM>元
BattleText_44b7:
	db $f2, $dc, $f1, $62, $e1, $f1, $b4, $ed

; TEXT -> <NAME>升級了﹗
BattleText_44bf:
	db $e7, $f2, $dd, $17, $f1, $64, $35, $e2

; TEXT -> <getchoice>
BattleText_44c7:
	db $e5, $f1, $45, $46, $33, $f0, $4b, $f2, $de, $f1, $7f, $40, $f2, $1f, $ed

; TEXT -> <NAME>復活﹐並回復
BattleText_44d6:
	db $e7, $f1, $1a, $df, $33, $f2, $00, $f1, $19, $1a, $ed, $f1, $ad, $b2, $d6, $51
	db $ce, $f0, $19, $f1, $53, $ed

; TEXT -> 使用～<ITEM>
BattleText_44ec:
	db $f1, $3f, $40, $f2, $1f, $e8, $ed

; TEXT -> 使用道具
BattleText_44f3:
	db $f1, $3f, $40, $2c, $2d, $ed

; TEXT -> 提升<NAME>點魔禦力
BattleText_44f9:
	db $f1, $d4, $f2, $dd, $e7, $f1, $b5, $72, $f0, $0b, $19, $ed

; TEXT -> <NAME>學到了新技巧～<choice>
BattleText_4505:
	db $e7, $f1, $60, $62, $64, $63, $54, $55, $f2, $1f, $e6, $e2

; TEXT -> 效果不錯﹗
BattleText_4511:
	db $f1, $7f, $7b, $f0, $32, $f2, $be, $f1, $35, $ed

; TEXT -> 效果還可以﹗
BattleText_451b:
	db $f1, $7f, $7b, $f2, $65, $f1, $c8, $cb, $35, $ed

; TEXT -> <NAME>忍耐中
BattleText_4525:
	db $e7, $f0, $21, $22, $29, $ed

; TEXT -> <NAME>忍無可忍
BattleText_452b:
	db $e7, $f0, $21, $76, $f1, $c8, $f0, $21, $ed

; TEXT -> <NAME>的防禦力提昇了﹗
BattleText_4534:
	db $e7, $f1, $51, $f0, $0a, $0b, $19, $f1, $d4, $f2, $04, $f1, $64, $35, $ed

; TEXT -> <NAME>的命中率提昇了﹗
BattleText_4543:
	db $e7, $f1, $51, $f0, $4f, $29, $f1, $cd, $d4, $f2, $04, $f1, $64, $35, $ed

; TEXT -> <NAME>的速度提昇了﹗
BattleText_4552:
	db $e7, $f1, $51, $70, $71, $d4, $f2, $04, $f1, $64, $35, $ed

; TEXT -> <NAME>的攻擊力提昇了﹗
BattleText_455e:
	db $e7, $f1, $51, $f0, $24, $07, $19, $f1, $d4, $f2, $04, $f1, $64, $35, $ed

; TEXT -> <NAME>的命中率提昇了﹗
BattleText_456d:
	db $e7, $f1, $51, $f0, $4f, $29, $f1, $cd, $d4, $f2, $04, $f1, $64, $35, $ed

; TEXT -> <NAME>獲得先發攻擊﹗
BattleText_457c:
	db $e7, $f2, $df, $dc, $f0, $4a, $4b, $24, $07, $f1, $35, $ed

; TEXT -> <NAME>被封印了一項技巧
BattleText_4588:
	db $e7, $f2, $60, $f0, $1f, $20, $f1, $64, $f0, $1a, $f1, $5f, $54, $55, $ed

; TEXT -> <NAME>無法動彈
BattleText_4597:
	db $e7, $f0, $76, $bb, $f2, $87, $f0, $13, $ed

; TEXT -> <NAME>血量回復了
BattleText_45a0:
	db $e7, $f0, $3a, $f2, $44, $f1, $19, $1a, $64, $ed

; TEXT -> <NAME>迴避率提昇了
BattleText_45aa:
	db $e7, $f1, $9c, $9d, $cd, $d4, $f2, $04, $f1, $64, $ed

; TEXT -> <NAME>嚇跑了
BattleText_45b5:
	db $e7, $f2, $d4, $f1, $31, $64, $ed

; TEXT -> <NAME>提昇所有能力
BattleText_45bc:
	db $e7, $f1, $d4, $f2, $04, $f1, $d3, $65, $8d, $f0, $19, $ed

; TEXT -> <NAME>攻擊力下降
BattleText_45c8:
	db $e7, $f0, $24, $07, $19, $f2, $aa, $05, $ed

; TEXT -> <NAME>命中要害機率提昇
BattleText_45d1:
	db $e7, $f0, $4f, $29, $f1, $58, $f2, $bb, $f1, $90, $cd, $d4, $f2, $04, $ed

; TEXT -> <NAME>力量儲存中
BattleText_45e0:
	db $e7, $f0, $19, $f2, $44, $f3, $00, $f1, $39, $f0, $29, $ed

; TEXT -> <NAME>鑽入地底
BattleText_45ec:
	db $e7, $f2, $78, $30, $f0, $7a, $f3, $01, $ed

; TEXT -> <NAME>被種植寄魂種子
BattleText_45f5:
	db $e7, $f2, $60, $f0, $c8, $f3, $02, $f0, $c6, $c7, $c8, $c9, $ed

; TEXT -> <NAME>變成豬了
BattleText_4602:
	db $e7, $f1, $1d, $6a, $f3, $03, $f1, $64, $ed

; TEXT -> <NAME>使用替身
BattleText_460b:
	db $e7, $f1, $3f, $40, $0c, $f0, $38, $ed

; TEXT -> <NAME>飛上天空
BattleText_4613:
	db $e7, $f0, $a9, $f2, $b6, $f0, $80, $f1, $04, $ed

; TEXT -> <NAME>模仿對手技巧
BattleText_461d:
	db $e7, $f1, $13, $14, $f2, $07, $f0, $6f, $f1, $54, $55, $ed

; TEXT -> 雙方狀態恢復了
BattleText_4629:
	db $f0, $77, $f1, $cf, $db, $dc, $f3, $04, $f1, $1a, $64, $ed

; TEXT -> <NAME>燙傷‧凍傷‧麻痺‧混亂
BattleText_4635:
	db $e7, $f3, $05, $f0, $2b, $f3, $06, $f0, $a4, $2b, $f3, $06, $f0, $cd, $ce, $f3
	db $06, $f2, $d3, $f0, $88, $ed

; TEXT -> 逃跑成功
BattleText_464b:
	db $f1, $30, $31, $6a, $6b, $ed

; TEXT -> 逃跑失敗
BattleText_4651:
	db $f1, $30, $31, $6c, $6d, $ed

; TEXT -> <NAME>被收服了
BattleText_4657:
	db $e7, $f2, $60, $f0, $86, $f1, $c9, $64, $ed

; TEXT -> 收服失敗了
BattleText_4660:
	db $f0, $86, $f1, $c9, $6c, $6d, $64, $ed

; TEXT -> <NAME>已送回託管盒中
BattleText_4668:
	db $e7, $f1, $56, $f3, $07, $f1, $19, $f3, $08, $09, $0a, $f0, $29, $ed

; TEXT -> <NAME>的迴避率下降了﹗
BattleText_4676:
	db $e7, $f1, $51, $9c, $9d, $cd, $f2, $aa, $05, $f1, $64, $35, $ed

; TEXT -> 發現了<NAME>
BattleText_4683:
	db $f0, $4b, $f3, $0b, $f1, $64, $e7, $ed

; TEXT -> <NAME>出現了
BattleText_468b:
	db $e7, $f2, $0a, $f3, $0b, $f1, $64, $ed

; TEXT -> 戰鬥失敗
BattleText_4693:
	db $f2, $03, $f0, $73, $f1, $6c, $6d, $ed

; TEXT -> 錢被偷走了
BattleText_469b:
	db $f2, $4b, $60, $f0, $47, $ab, $f1, $64, $ed

; TEXT -> 變成<NAME>了
BattleText_46a4:
	db $f1, $1d, $6a, $e7, $f1, $64, $ed

; TEXT -> 抱歉﹗你的盒子已滿﹗
BattleText_46ab:
	db $f2, $59, $5a, $f1, $35, $f2, $4a, $f1, $51, $f3, $0a, $f0, $c9, $f1, $56, $57
	db $35, $ed

; TEXT -> 寄魂種子﹐發揮效用～
BattleText_46bd:
	db $f0, $c6, $c7, $c8, $c9, $f1, $33, $f0, $4b, $f2, $de, $f1, $7f, $40, $f2, $1f
	db $ed, $ed

; TEXT -> 謎的力量儲存中～
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
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group2:
	ld de, MapAttr_Group2
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group3:
	ld de, MapAttr_Group3
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group4:
	ld de, MapAttr_Group4
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group5:
	ld de, MapAttr_Group5
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
	ret

LoadMapAttribute_Group6:
	ld de, MapAttr_Group6
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wBattleMusic], a
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
	ld a, [wMonBoxCount]
	cp $14
	jr nc, .case2
	ld hl, wMonBox
	ld a, [wMonBoxCount]
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
	ld a, [wMonBoxCount]
	inc a
	ld [wMonBoxCount], a
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
	ld a, [wMonBox2Count]
	cp $14
	ret nc
	ld a, SRAM_ENABLE
	ld [rRAMG], a
	ld a, 1
	ld [rRAMB], a
	ld hl, sMonBox2
	ld a, [wMonBox2Count]
	ld de, $13
	and a
	jr z, .copy

.scan2:
	add hl, de
	dec a
	jr nz, .scan2
	ld a, [wMonBox2Count]
	inc a
	ld [wMonBox2Count], a
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
	ld [rRAMG], a
	ld [rRAMB], a
	ret

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_02d_4aa9:
	db $6a, $0d, $00, $00, $00, $13, $2b, $1a, $51, $00, $00
BattleData_02d_4ab4::
	db $01, $22, $03, $00, $00, $00, $2c, $27, $00, $00, $00, $00, $0f, $00, $50, $00
BattleData_02d_4ac4::
	db $02, $24, $06, $00, $00, $00, $2c, $25, $66, $00, $00, $00, $c8, $00, $c8, $00
	db $06, $06, $00, $00, $00, $32, $2c, $1f, $13, $00, $00, $5e, $01, $fa, $00
BattleData_02d_4ae3::
	db $01, $52, $0a, $00, $00, $00, $08, $2c, $00, $00, $00, $00, $f4, $01, $c8, $00
BattleData_02d_4af3::
	db $02, $24, $06, $00, $00, $00, $2c, $25, $66, $00, $00, $00, $c8, $00, $c8, $00
	db $06, $06, $00, $00, $00, $32, $2c, $1f, $13, $00, $00, $5e, $01, $fa, $00
BattleData_02d_4b12::
	db $03, $24, $0c, $00, $00, $00, $66, $25, $2c, $5d, $00, $00, $c9, $00, $32, $00
	db $0a, $0d, $00, $00, $00, $0b, $31, $02, $2c, $00, $00, $c2, $00, $14, $00, $2e
	db $0e, $00, $00, $00, $72, $2c, $00, $00, $00, $00, $02, $01, $2d, $00
BattleData_02d_4b40::
	db $01, $7f, $12, $00, $00, $00, $21, $0c, $50, $0e, $00, $00, $7d, $03, $fa, $00
BattleData_02d_4b50::
	db $01, $92, $15, $00, $00, $00, $7e, $57, $1d, $15, $13, $00, $20, $03, $2c, $01
BattleData_02d_4b60::
	db $01, $5a, $1a, $00, $00, $00, $0f, $41, $00, $00, $12, $00, $0e, $06, $f4, $01
BattleData_02d_4b70::
	db $04, $0a, $1a, $00, $00, $00, $20, $31, $1d, $25, $00, $00, $e6, $01, $64, $00
	db $24, $19, $00, $00, $00, $66, $5d, $02, $20, $00, $00, $fc, $01, $73, $00, $2e
	db $1c, $00, $00, $00, $73, $7c, $72, $00, $00, $00, $01, $02, $69, $00, $06, $1b
	db $00, $00, $00, $3c, $28, $3b, $32, $12, $00, $f0, $01, $5a, $00
BattleData_02d_4bad::
	db $02, $18, $1f, $00, $00, $00, $4a, $49, $47, $15, $00, $00, $dc, $05, $44, $02
	db $65, $20, $00, $00, $00, $49, $1d, $06, $80, $14, $00, $94, $06, $66, $03
BattleData_02d_4bcc::
	db $02
	db $4e, $20, $00, $00, $00, $33, $3e, $3b, $77, $00, $00, $26, $06, $b6, $03, $05
	db $21, $00, $00, $00, $36, $2d, $06, $2b, $12, $00, $f0, $04, $1a, $04
BattleData_02d_4beb::
	db $01, $91, $27, $00, $00, $00, $57, $5c, $59, $14, $11, $00, $00, $00, $00, $00
BattleData_02d_4bfb::
	db $02, $62, $25, $00, $00, $00, $3d, $29, $40, $08, $00, $00, $36, $04, $1a, $04
	db $5c, $26, $00, $00, $00, $41, $46, $24, $42, $14, $00, $38, $08, $e1, $05
BattleData_02d_4c1a::
	db $02, $35, $25, $00, $00, $00, $54, $53, $52, $51, $00, $00, $23, $04, $e8, $03
	db $05, $26, $00, $00, $00, $2a, $36, $2d, $06, $12, $00, $f1, $07, $e2, $04
BattleData_02d_4c39::
	db $03, $70, $26, $00, $00, $00, $5e, $66, $06, $12, $00, $00, $0b, $04, $52, $03
	db $71, $27, $00, $00, $00, $60, $5f, $81, $1d, $00, $00, $2a, $04, $84, $03, $6d
	db $28, $00, $00, $00, $5d, $63, $77, $5f, $13, $00, $18, $04, $dc, $05
BattleData_02d_4c67::
	db $04, $8d, $2d, $00, $00, $00, $54, $52, $0a, $50, $00, $00, $8d, $05, $21, $02
	db $41, $2e, $00, $00, $00, $05, $69, $71, $6e, $00, $00, $02, $06, $8f, $02, $3f
	db $2e, $00, $00, $00, $6b, $06, $6a, $68, $00, $00, $08, $06, $b6, $03, $9a, $2f
	db $00, $00, $00, $3f, $3d, $32, $31, $13, $00, $79, $06, $1f, $04
BattleData_02d_4ca4::
	db $02, $35, $2b, $00, $00, $00, $55, $54, $53, $52, $00, $00, $b2, $05, $dc, $05
	db $05, $2c, $00, $00, $00, $2e, $2a, $36, $2d, $12, $00, $36, $06, $41, $05
BattleData_02d_4cc3::
	db $03, $5f, $25, $00, $00, $00, $83, $82, $44, $43, $00, $00, $00, $04, $c8, $00
	db $68, $26, $00, $00, $00, $4c, $4d, $47, $73, $00, $00, $e9, $03, $c2, $01, $7a
	db $27, $00, $00, $00, $76, $81, $7e, $07, $07, $00, $ef, $03, $c4, $09
BattleData_02d_4cf1::
	db $03, $29, $29, $00, $00, $00, $7b, $7a, $20, $72, $00, $00, $dc, $05, $2b, $07
	db $32, $2a, $00, $00, $00, $75, $05, $0f, $04, $00, $00, $b6, $05, $9f, $06, $9d
	db $2b, $00, $00, $00, $75, $7a, $12, $7b, $07, $00, $66, $06, $01, $04
BattleData_02d_4d1f::
	db $03, $79, $2d, $00, $00, $00, $76, $74, $73, $72, $00, $00, $da, $05
	db $15, $04, $7b, $2e, $00, $00, $00, $75, $7a, $7b, $12, $12, $00, $2c, $06, $ce
	db $04, $05, $2f, $00, $00, $00, $2e, $2d, $36, $2a, $01, $00, $40, $06, $1f, $04
BattleData_02d_4d4d::
	db $03, $8c, $30, $00, $00, $00, $6b, $69, $6f, $68, $00, $00, $f9, $06, $ed, $03
	db $88, $31, $00, $00, $00, $69, $6b, $5a, $68, $14, $00, $08, $07, $51, $04, $64
	db $32, $00, $00, $00, $4f, $4e, $4d, $3c, $01, $00, $74, $07, $4c, $04
BattleData_02d_4d7b::
	db $04, $2e
	db $30, $00, $00, $00, $88, $74, $73, $72, $00, $00, $e3, $06, $14, $00, $24, $31
	db $00, $00, $00, $5d, $7e, $81, $15, $00, $00, $08, $07, $32, $00, $0a, $32, $00
	db $00, $00, $0a, $0f, $20, $02, $12, $00, $5a, $07, $0f, $00, $06, $33, $00, $00
	db $00, $36, $35, $3d, $3c, $13, $00, $9f, $07, $23, $00
BattleData_02d_4db8::
	db $03, $0b, $32, $00, $00, $00, $43, $41, $8a, $21, $00, $00, $44, $07, $29, $04
	db $03, $33, $00, $00, $00, $3c, $39, $3f, $37, $00, $00, $c0, $07, $0b, $04, $05
	db $35, $00, $00, $00, $36, $2a, $2e, $2d, $01, $00, $98, $08, $4c, $04
BattleData_02d_4de6::
	db $03, $42, $32, $00, $00, $00, $29, $6b, $89, $6f, $00, $00, $74, $07, $1a, $04
	db $05, $33, $00, $00, $00, $17, $2e, $2a, $36, $00, $00, $9f, $07, $e8, $03, $0b
	db $34, $00, $00, $00, $43, $8a, $41, $29, $00, $00, $ec, $07, $51, $04
BattleData_02d_4e14::
	db $02, $7d, $33, $00, $00, $00, $88, $89, $74, $0a, $00, $00, $c5, $07, $4c, $04
	db $2e, $34, $00, $00, $00, $88, $89, $74, $0a, $00, $00, $e5, $07, $51, $04
BattleData_02d_4e33::
	db $03, $53, $32, $00, $00, $00, $22, $36, $0a, $20, $00, $00, $62, $07, $ed, $03
	db $14, $33, $00, $00, $00, $81, $46, $83, $7e, $00, $00, $a8, $07, $1a, $04, $3d
	db $34, $00, $00, $00, $68, $22, $87, $06, $00, $00, $ee, $07, $7e, $04
BattleData_02d_4e61::
	db $02, $31, $32, $00, $00, $00, $76, $27, $74, $42, $00, $00, $6c, $07, $e8, $03
	db $77, $33, $00, $00, $00, $73, $88, $89, $74, $00, $00, $a7, $07, $ed, $03
BattleData_02d_4e80::
	db $03, $06, $32, $00, $00, $00, $36, $28, $3b, $0b, $00, $00, $35, $07, $e8, $03
	db $87, $33, $00, $00, $00, $6c, $89, $5a, $69, $00, $00, $a5, $07, $1a, $04, $79
	db $34, $00, $00, $00, $76, $74, $73, $42, $00, $00, $e4, $07, $4c, $04
BattleData_02d_4eae::
	db $02, $06, $32, $00, $00, $00, $35, $3d, $24, $3c, $00, $00, $32, $07, $1a, $04
	db $79, $33, $00, $00, $00, $74, $42, $0b, $27, $00, $00, $6b, $07, $4c, $04
BattleData_02d_4ecd::
	db $03, $53, $32, $00, $00, $00, $36, $22, $0a, $20, $00, $00, $2f, $07, $e8, $03
	db $55, $33, $00, $00, $00, $3e, $29, $89, $83, $00, $00, $71, $07, $f2, $03, $52
	db $34, $00, $00, $00, $38, $32, $11, $0d, $00, $00, $f0, $07, $60, $04
BattleData_02d_4efb::
	db $03, $36, $35, $00, $00, $00, $54, $52, $56, $0a, $00, $00, $f8, $07, $2c, $06
	db $3a, $36, $00, $00, $00, $0a, $26, $54, $02, $00, $00, $34, $08, $45, $06, $05
	db $37, $00, $00, $00, $2e, $2a, $2d, $36, $12, $00, $98, $08, $a5, $05
BattleData_02d_4f29::
	db $03, $8e, $36, $00
	db $00, $00, $69, $06, $05, $71, $00, $00, $46, $08, $2c, $06, $8a, $37, $00, $00
	db $00, $85, $00, $00, $00, $00, $00, $f8, $07, $45, $06, $7c, $38, $00, $00, $00
	db $7a, $7b, $73, $20, $14, $00, $30, $09, $a5, $05
BattleData_02d_4f57::
	db $03, $98, $36, $00, $00, $00, $75, $12, $7a, $7b, $00, $00, $1c, $08, $dc, $05
	db $2c, $37, $00, $00, $00, $76, $75, $74, $73, $00, $00, $38, $08, $aa, $05, $9d
	db $38, $00, $00, $00, $7a, $7b, $12, $75, $13, $00, $fc, $08, $e2, $04
BattleData_02d_4f85::
	db $03, $1b, $39, $00, $00, $00, $49, $12, $82, $89, $00, $00, $34, $08, $dc, $05
	db $66, $3a, $00, $00, $00, $4b, $4a, $49, $48, $00, $00, $a9, $08, $72, $06, $9b
	db $3b, $00, $00, $00, $4e, $4b, $48, $8b, $13, $00, $db, $09, $a4, $06
BattleData_02d_4fb3::
	db $03, $0d, $3a, $00, $00, $00, $46, $19, $0a, $45, $00, $00, $10, $09, $45, $06
	db $61, $3b, $00, $00, $00, $44, $43, $42, $41, $00, $00, $f2, $09, $af, $05, $9c
	db $3c, $00, $00, $00, $41, $7d, $22, $45, $14, $00, $2c, $0a, $40, $06
BattleData_02d_4fe1::
	db $03, $98, $3b, $00, $00, $00, $75, $12, $7a, $7b, $00, $00, $9b, $08, $dc, $05
	db $7b, $3c, $00, $00, $00, $75, $7a, $7b, $1a, $00, $00, $71, $09, $78, $05, $9d
	db $3d, $00, $00, $00, $7a, $7b, $12, $75, $01, $00, $28, $0a, $0e, $06
BattleData_02d_500f::
	db $03, $4e, $3c, $00, $00, $00, $3d, $3c, $3e, $3b, $00, $00, $51, $09, $00, $00
	db $4a, $3d, $00, $00, $00, $58, $7d, $77, $7f, $00, $00, $c9, $09, $00, $00, $9e
	db $3e, $00, $00, $00, $33, $77, $3e, $3d, $02, $00, $96, $0a, $00, $00
BattleData_02d_503d::
	db $03, $40, $3d, $00, $00, $00, $6c, $69, $5a, $13, $13, $00, $00, $00, $00, $00
	db $45, $3e, $00, $00, $00, $6a, $7e, $82, $81, $14, $00, $00, $00, $00, $00, $9f
	db $3f, $00, $00, $00, $4f, $61, $5d, $62, $02, $00, $00, $00, $00, $00
BattleData_02d_506b::
	db $01, $83, $5a, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00

Func_02d_507b::
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	jp Func_02d_50b3

Func_02d_5086::
	call LoadMapAttribute
	ld de, WildEncGroups
	ldh a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wBattleMusic]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ldh a, [hFFD8]
	inc a
	ld [hFFD8], a
	and $f
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

Func_02d_50b3:
	ld a, [hli]
	ld [wd9bf], a
	cp 1
	jr z, .skip
	ld a, [hl]
	ld [wd9dc], a
.skip
	call Func_02d_510c
	xor a
	ld [wd98b], a
	ld e, l
	ld d, h
	ld bc, wd876
.loop
	call Func_02d_511b
	call Func_02d_5147
	push bc
	ld bc, wdb00
	ld a, [wd98b]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
REPT 4
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	pop bc
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, [wd98b]
	inc a
	ld [wd98b], a
	ld a, [wd9bf]
	dec a
	ld [wd9bf], a
	jr nz, .loop
	xor a
	ld [wd98b], a
	call DelayFrame
	call Func_02d_51ba
	ret

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
	push de
	push hl
	ld hl, wd7cb
	ld a, [de]
	cp $a0
	jr nc, .done
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .done
	ld [hl], 1
.done
	pop hl
	pop de
	ret

Func_02d_5133:
	push de
	push hl
	ld hl, wd7cb
	ld a, [de]
	cp $a0
	jr nc, .done
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 2
.done
	pop hl
	pop de
	ret

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
	ld hl, MON_SPECIES
	add hl, bc
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
	ret

Func_02d_51ba:
	xor a
	ld [wd987], a
	ld bc, wd876

Func_02d_51c1:
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	ret z
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
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, h
	cp $d9
	jr c, Func_02d_51c1
	ret

asm_02d_51eb:
	jp Func_02d_51c1
	nop
	nop
	nop

Func_02d_51f1:
	ld hl, MON_HP
	add hl, bc
	ldh a, [hMathValue]
	ld [hli], a
	ldh a, [hMathValue + 1]
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

WildEncGroups:
	dw WildEncAttr_526a
	dw WildEncAttr_526a
	dw WildEncAttrSlots_54b4
	dw WildEncAttrSlots_572e
	dw WildEncAttrSlots_5916
	dw WildEncAttrSlots_5f22
	dw WildEncAttrSlots_61fe
	dw WildEncAttr_526a

WildEncAttr_526a:
	dw WildEncSlots_5274
	dw WildEncSlots_52d4
	dw WildEncSlots_5354
	dw WildEncSlots_53d4
	dw WildEncSlots_5454

WildEncSlots_5274:
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4

WildEnc_5294:
	; species, level, exp[3], move1, move2, move3, move4, item, unk22, unk[5]
	db $01, 8, $01, $02, $00, $00, $2c, $25, $00, $00, $00, $00, $0a, $00, $0a, $00
WildEnc_52a4:
	db $01, 34, $02, $10, $00, $00, $2c, $0b, $00, $00, $00, $00, $14, $00, $0f, $00
WildEnc_52b4:
	db $01, 41, $01, $04, $00, $00, $2c, $00, $00, $00, $00, $00, $0f, $00, $0f, $00
WildEnc_52c4:
	db $01, 50, $02, $14, $00, $00, $2c, $0b, $00, $00, $00, $00, $14, $00, $0f, $00
WildEncSlots_52d4:
	dw WildEnc_52f4
	dw WildEnc_5304
	dw WildEnc_5314
	dw WildEnc_5324
	dw WildEnc_5334
	dw WildEnc_5344
	dw WildEnc_5304
	dw WildEnc_5314
	dw WildEnc_5324
	dw WildEnc_5334
	dw WildEnc_5344
	dw WildEnc_5304
	dw WildEnc_5314
	dw WildEnc_5324
	dw WildEnc_5334
	dw WildEnc_5344
WildEnc_52f4:
	db $01, 1, $02, $0e, $00, $00, $2c, $13, $00, $00, $00, $00, $24, $00, $16, $00
WildEnc_5304:
	db $01, 7, $03, $23, $00, $00, $2c, $0b, $00, $00, $00, $00, $2c, $00, $22, $00
WildEnc_5314:
	db $01, 33, $03, $30, $00, $00, $2c, $13, $00, $00, $00, $00, $32, $00, $1e, $00
WildEnc_5324:
	db $01, 50, $04, $82, $00, $00, $2c, $00, $00, $00, $00, $00, $2d, $00, $19, $00
WildEnc_5334:
	db $01, 106, $04, $aa, $00, $00, $1f, $2b, $00, $00, $00, $00, $28, $00, $20, $00
WildEnc_5344:
	db $01, 151, $05, $fa, $00, $00, $2c, $08, $00, $00, $00, $00, $37, $00, $1e, $00
WildEncSlots_5354:
	dw WildEnc_5374
	dw WildEnc_5384
	dw WildEnc_5394
	dw WildEnc_53a4
	dw WildEnc_53b4
	dw WildEnc_53c4
	dw WildEnc_5384
	dw WildEnc_5394
	dw WildEnc_53a4
	dw WildEnc_53b4
	dw WildEnc_53c4
	dw WildEnc_5384
	dw WildEnc_5394
	dw WildEnc_53a4
	dw WildEnc_53b4
	dw WildEnc_53c4
WildEnc_5374:
	db $01, 2, $03, $0c, $01, $00, $03, $00, $00, $00, $00, $00, $28, $00, $14, $00
WildEnc_5384:
	db $01, 7, $04, $c3, $01, $00, $2c, $0b, $00, $00, $00, $00, $3a, $00, $19, $00
WildEnc_5394:
	db $01, 8, $05, $56, $02, $00, $13, $2c, $00, $00, $00, $00, $42, $00, $28, $00
WildEnc_53a4:
	db $01, 9, $04, $e0, $01, $00, $25, $2c, $00, $00, $00, $00, $36, $00, $19, $00
WildEnc_53b4:
	db $01, 66, $03, $f3, $00, $00, $2c, $00, $00, $00, $00, $00, $2e, $00, $1e, $00
WildEnc_53c4:
	db $01, 118, $05, $9b, $02, $00, $2c, $08, $00, $00, $00, $00, $45, $00, $23, $00
WildEncSlots_53d4:
	dw WildEnc_53f4
	dw WildEnc_5404
	dw WildEnc_5414
	dw WildEnc_5424
	dw WildEnc_5434
	dw WildEnc_5444
	dw WildEnc_5404
	dw WildEnc_5414
	dw WildEnc_5424
	dw WildEnc_5434
	dw WildEnc_5444
	dw WildEnc_5404
	dw WildEnc_5414
	dw WildEnc_5424
	dw WildEnc_5434
	dw WildEnc_5444
WildEnc_53f4:
	db $01, 4, $07, $8c, $02, $00, $1f, $2c, $00, $00, $00, $00, $3c, $00, $2d, $00
WildEnc_5404:
	db $01, 36, $06, $d8, $01, $00, $2c, $25, $00, $00, $00, $00, $34, $00, $1e, $00
WildEnc_5414:
	db $01, 139, $08, $7b, $03, $00, $2b, $6f, $00, $00, $00, $00, $46, $00, $14, $00
WildEnc_5424:
	db $01, 151, $06, $ec, $01, $00, $08, $2c, $00, $00, $00, $00, $37, $00, $1e, $00
WildEnc_5434:
	db $01, 135, $07, $2b, $02, $00, $18, $2b, $00, $00, $00, $00, $41, $00, $28, $00
WildEnc_5444:
	db $01, 11, $07, $ba, $02, $00, $1c, $25, $2c, $00, $00, $00, $3c, $00, $23, $00
WildEncSlots_5454:
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
WildEnc_5474:
	db $01, 66, $09, $20, $04, $00, $67, $2c, $0c, $00, $00, $00, $8e, $00, $32, $00
WildEnc_5484:
	db $01, 139, $0a, $1a, $06, $00, $1d, $2b, $0b, $00, $00, $00, $9b, $00, $14, $00
WildEnc_5494:
	db $01, 4, $0a, $6f, $06, $00, $2b, $2c, $1f, $00, $00, $00, $a1, $00, $2d, $00
WildEnc_54a4:
	db $01, 9, $0b, $bf, $07, $00, $31, $25, $2c, $00, $00, $00, $b1, $00, $23, $00
WildEncAttrSlots_54b4:
	dw WildEncSlots_54be
	dw WildEncSlots_551e
	dw WildEncSlots_558e
	dw WildEncSlots_561e
	dw WildEncSlots_569e
WildEncSlots_54be:
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
WildEnc_54de:
	db $01, 34, $0b, $cc, $07, $00, $2c, $10, $13, $00, $00, $00, $cc, $00, $37, $00
WildEnc_54ee:
	db $01, 55, $0c, $58, $0a, $00, $15, $24, $1a, $00, $00, $00, $ec, $00, $41, $00
WildEnc_54fe:
	db $01, 39, $0c, $89, $09, $00, $29, $80, $64, $5d, $00, $00, $d7, $00, $32, $00
WildEnc_550e:
	db $01, 43, $0d, $51, $0b, $00, $7e, $07, $2c, $00, $00, $00, $fe, $00, $46, $00
WildEncSlots_551e:
	dw WildEnc_553e
	dw WildEnc_554e
	dw WildEnc_555e
	dw WildEnc_556e
	dw WildEnc_557e
	dw WildEnc_553e
	dw WildEnc_554e
	dw WildEnc_555e
	dw WildEnc_556e
	dw WildEnc_557e
	dw WildEnc_553e
	dw WildEnc_554e
	dw WildEnc_555e
	dw WildEnc_556e
	dw WildEnc_557e
	dw WildEnc_553e
WildEnc_553e:
	db $01, 34, $0c, $ed, $08, $00, $13, $10, $2c, $00, $00, $00, $48, $01, $32, $00
WildEnc_554e:
	db $01, 43, $0d, $f4, $0a, $00, $07, $2c, $7e, $00, $00, $00, $64, $01, $2d, $00
WildEnc_555e:
	db $01, 118, $0d, $ca, $0b, $00, $86, $25, $15, $08, $00, $00, $71, $01, $3c, $00
WildEnc_556e:
	db $01, 131, $0e, $a7, $0e, $00, $50, $2c, $13, $00, $00, $00, $72, $01, $41, $00
WildEnc_557e:
	db $01, 39, $0f, $e6, $11, $00, $65, $29, $80, $64, $00, $00, $7f, $01, $4b, $00
WildEncSlots_558e:
	dw WildEnc_55ae
	dw WildEnc_55be
	dw WildEnc_55ce
	dw WildEnc_55de
	dw WildEnc_55ee
	dw WildEnc_55fe
	dw WildEnc_560e
	dw WildEnc_55ae
	dw WildEnc_55be
	dw WildEnc_55ce
	dw WildEnc_55de
	dw WildEnc_55ee
	dw WildEnc_55fe
	dw WildEnc_560e
	dw WildEnc_55ae
	dw WildEnc_55be
WildEnc_55ae:
	db $01, 40, $0e, $72, $0e, $00, $5d, $25, $66, $13, $00, $00, $98, $01, $37, $00
WildEnc_55be:
	db $01, 33, $0f, $c8, $10, $00, $63, $27, $5d, $13, $00, $00, $aa, $01, $3c, $00
WildEnc_55ce:
	db $01, 51, $0f, $4c, $11, $00, $50, $13, $2c, $00, $00, $00, $ae, $01, $41, $00
WildEnc_55de:
	db $01, 39, $10, $46, $14, $00, $65, $29, $80, $64, $00, $00, $d4, $01, $3c, $00
WildEnc_55ee:
	db $01, 71, $10, $eb, $13, $00, $2c, $25, $09, $13, $00, $00, $cb, $01, $46, $00
WildEnc_55fe:
	db $01, 110, $10, $99, $15, $00, $6d, $5e, $5f, $29, $00, $00, $d7, $01, $4b, $00
WildEnc_560e:
	db $01, 115, $11, $80, $17, $00, $25, $57, $2c, $13, $00, $00, $ef, $01, $50, $00
WildEncSlots_561e:
	dw WildEnc_563e
	dw WildEnc_564e
	dw WildEnc_565e
	dw WildEnc_566e
	dw WildEnc_567e
	dw WildEnc_568e
	dw WildEnc_563e
	dw WildEnc_564e
	dw WildEnc_565e
	dw WildEnc_566e
	dw WildEnc_567e
	dw WildEnc_568e
	dw WildEnc_563e
	dw WildEnc_564e
	dw WildEnc_565e
	dw WildEnc_566e
WildEnc_563e:
	db $01, 128, $11, $99, $18, $00, $13, $2c, $0f, $07, $00, $00, $a6, $01, $37, $00
WildEnc_564e:
	db $01, 131, $11, $e7, $19, $00, $0e, $50, $2c, $13, $00, $00, $b3, $01, $32, $00
WildEnc_565e:
	db $01, 58, $12, $93, $1b, $00, $02, $0f, $07, $2c, $00, $00, $ca, $01, $41, $00
WildEnc_566e:
	db $01, 55, $12, $70, $1d, $00, $51, $50, $15, $24, $00, $00, $bb, $01, $3c, $00
WildEnc_567e:
	db $01, 51, $12, $47, $1d, $00, $0e, $2c, $50, $13, $00, $00, $c3, $01, $4b, $00
WildEnc_568e:
	db $01, 35, $13, $77, $21, $00, $80, $17, $5f, $2b, $00, $00, $a9, $01, $46, $00
WildEncSlots_569e:
	dw WildEnc_56be
	dw WildEnc_56ce
	dw WildEnc_56de
	dw WildEnc_56ee
	dw WildEnc_56fe
	dw WildEnc_570e
	dw WildEnc_571e
	dw WildEnc_56be
	dw WildEnc_56ce
	dw WildEnc_56de
	dw WildEnc_56ee
	dw WildEnc_56fe
	dw WildEnc_570e
	dw WildEnc_571e
	dw WildEnc_56be
	dw WildEnc_56ce
WildEnc_56be:
	db $01, 79, $12, $66, $1d, $00, $17, $08, $03, $0b, $00, $00, $a0, $01, $41, $00
WildEnc_56ce:
	db $01, 84, $12, $39, $1d, $00, $0f, $25, $7e, $31, $00, $00, $a9, $01, $46, $00
WildEnc_56de:
	db $01, 135, $12, $a8, $1c, $00, $6e, $86, $28, $71, $00, $00, $b6, $01, $50, $00
WildEnc_56ee:
	db $01, 142, $13, $22, $20, $00, $69, $1f, $6e, $2b, $00, $00, $be, $01, $4b, $00
WildEnc_56fe:
	db $01, 147, $13, $99, $20, $00, $16, $84, $13, $09, $00, $00, $b7, $01, $37, $00
WildEnc_570e:
	db $01, 149, $13, $33, $21, $00, $58, $27, $23, $57, $00, $00, $bc, $01, $3c, $00
WildEnc_571e:
	db $01, 48, $14, $f9, $24, $00, $73, $6f, $27, $20, $00, $00, $d4, $01, $41, $00
WildEncAttrSlots_572e:
	dw WildEncSlots_5736
	dw WildEncSlots_5796
	dw WildEncSlots_5806
	dw WildEncSlots_5896
WildEncSlots_5736:
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
WildEnc_5756:
	db $01, 118, $13, $41, $20, $00, $72, $25, $86, $15, $00, $00, $e2, $01, $50, $00
WildEnc_5766:
	db $01, 55, $14, $27, $25, $00, $50, $15, $24, $1a, $00, $00, $f8, $01, $4b, $00
WildEnc_5776:
	db $01, 131, $13, $9a, $21, $00, $2c, $13, $50, $00, $00, $00, $ef, $01, $55, $00
WildEnc_5786:
	db $01, 115, $14, $1c, $25, $00, $57, $25, $13, $2c, $00, $00, $06, $02, $46, $00
WildEncSlots_5796:
	dw WildEnc_57b6
	dw WildEnc_57c6
	dw WildEnc_57d6
	dw WildEnc_57e6
	dw WildEnc_57f6
	dw WildEnc_57b6
	dw WildEnc_57c6
	dw WildEnc_57d6
	dw WildEnc_57e6
	dw WildEnc_57f6
	dw WildEnc_57b6
	dw WildEnc_57c6
	dw WildEnc_57d6
	dw WildEnc_57e6
	dw WildEnc_57f6
	dw WildEnc_57d6
WildEnc_57b6:
	db $01, 33, $14, $a8, $24, $00, $32, $63, $27, $5d, $00, $00, $10, $02, $50, $00
WildEnc_57c6:
	db $01, 35, $15, $57, $2b, $00, $17, $5f, $25, $2b, $00, $00, $20, $02, $4b, $00
WildEnc_57d6:
	db $01, 48, $14, $58, $26, $00, $27, $20, $1e, $08, $00, $00, $07, $02, $55, $00
WildEnc_57e6:
	db $01, 51, $15, $f6, $2a, $00, $50, $0e, $13, $2c, $00, $00, $1a, $02, $5a, $00
WildEnc_57f6:
	db $01, 4, $15, $d6, $2e, $00, $07, $2b, $20, $1f, $00, $00, $11, $02, $55, $00
WildEncSlots_5806:
	dw WildEnc_5826
	dw WildEnc_5836
	dw WildEnc_5846
	dw WildEnc_5856
	dw WildEnc_5866
	dw WildEnc_5876
	dw WildEnc_5886
	dw WildEnc_5826
	dw WildEnc_5836
	dw WildEnc_5846
	dw WildEnc_5856
	dw WildEnc_5866
	dw WildEnc_5876
	dw WildEnc_5886
	dw WildEnc_5876
	dw WildEnc_5856
WildEnc_5826:
	db $01, 7, $16, $47, $30, $00, $03, $31, $08, $0b, $00, $00, $24, $02, $5a, $00
WildEnc_5836:
	db $01, 34, $17, $05, $37, $00, $80, $10, $13, $00, $00, $00, $29, $02, $5f, $00
WildEnc_5846:
	db $01, 36, $18, $d6, $3f, $00, $02, $0c, $20, $15, $00, $00, $31, $02, $69, $00
WildEnc_5856:
	db $01, 51, $16, $cc, $32, $00, $50, $0e, $13, $2c, $00, $00, $19, $02, $50, $00
WildEnc_5866:
	db $01, 110, $17, $c4, $36, $00, $6d, $5e, $5f, $29, $00, $00, $21, $02, $55, $00
WildEnc_5876:
	db $01, 33, $18, $80, $3e, $00, $32, $63, $27, $5d, $00, $00, $34, $02, $64, $00
WildEnc_5886:
	db $01, 65, $17, $1e, $37, $00, $6e, $1f, $2b, $00, $00, $00, $25, $02, $5f, $00
WildEncSlots_5896:
	dw WildEnc_58b6
	dw WildEnc_58c6
	dw WildEnc_58d6
	dw WildEnc_58e6
	dw WildEnc_58f6
	dw WildEnc_5906
	dw WildEnc_58b6
	dw WildEnc_58c6
	dw WildEnc_58d6
	dw WildEnc_58e6
	dw WildEnc_58f6
	dw WildEnc_5906
	dw WildEnc_58b6
	dw WildEnc_58c6
	dw WildEnc_58d6
	dw WildEnc_58e6
WildEnc_58b6:
	db $01, 1, $18, $7c, $40, $00, $38, $2b, $0c, $25, $00, $00, $38, $02, $64, $00
WildEnc_58c6:
	db $01, 4, $19, $88, $45, $00, $2b, $15, $07, $20, $00, $00, $41, $02, $6e, $00
WildEnc_58d6:
	db $01, 48, $1a, $bc, $4d, $00, $6f, $27, $20, $1e, $00, $00, $50, $02, $73, $00
WildEnc_58e6:
	db $01, 65, $1b, $3e, $59, $00, $2b, $6e, $1f, $00, $00, $00, $67, $02, $78, $00
WildEnc_58f6:
	db $01, 84, $19, $90, $47, $00, $0f, $7e, $31, $80, $00, $00, $48, $02, $73, $00
WildEnc_5906:
	db $01, 149, $1a, $0a, $52, $00, $58, $23, $57, $27, $00, $00, $51, $02, $64, $00
WildEncAttrSlots_5916:
	dw WildEncSlots_5932
	dw WildEncSlots_59a2
	dw WildEncSlots_5a22
	dw WildEncSlots_5a82
	dw WildEncSlots_5ae2
	dw WildEncSlots_5b42
	dw WildEncSlots_5bc2
	dw WildEncSlots_5c42
	dw WildEncSlots_5ca2
	dw WildEncSlots_5cf2
	dw WildEncSlots_5d62
	dw WildEncSlots_5dc2
	dw WildEncSlots_5e42
	dw WildEncSlots_5ea2
WildEncSlots_5932:
	dw WildEnc_5952
	dw WildEnc_5962
	dw WildEnc_5972
	dw WildEnc_5982
	dw WildEnc_5992
	dw WildEnc_5952
	dw WildEnc_5962
	dw WildEnc_5972
	dw WildEnc_5982
	dw WildEnc_5992
	dw WildEnc_5952
	dw WildEnc_5962
	dw WildEnc_5972
	dw WildEnc_5982
	dw WildEnc_5992
	dw WildEnc_5972
WildEnc_5952:
	db $01, 25, $1b, $81, $58, $00, $4c, $4d, $0b, $17, $00, $00, $74, $02, $96, $00
WildEnc_5962:
	db $01, 28, $1c, $fb, $61, $00, $47, $08, $03, $0c, $00, $00, $77, $02, $b9, $00
WildEnc_5972:
	db $01, 29, $1d, $34, $6d, $00, $48, $0e, $25, $0f, $00, $00, $85, $02, $9b, $00
WildEnc_5982:
	db $01, 21, $1b, $0a, $58, $00, $47, $29, $48, $1c, $00, $00, $5b, $02, $a0, $00
WildEnc_5992:
	db $01, 106, $1c, $ba, $65, $00, $48, $17, $3c, $1f, $00, $00, $6a, $02, $af, $00
WildEncSlots_59a2:
	dw WildEnc_59c2
	dw WildEnc_59d2
	dw WildEnc_59e2
	dw WildEnc_59f2
	dw WildEnc_5a02
	dw WildEnc_5a12
	dw WildEnc_59c2
	dw WildEnc_59d2
	dw WildEnc_59e2
	dw WildEnc_59f2
	dw WildEnc_5a02
	dw WildEnc_5a12
	dw WildEnc_59c2
	dw WildEnc_59e2
	dw WildEnc_5a12
	dw WildEnc_5a02
WildEnc_59c2:
	db $01, 102, $1c, $3a, $61, $00, $48, $0d, $4a, $49, $00, $00, $a3, $02, $dc, $00
WildEnc_59d2:
	db $01, 25, $1d, $98, $6d, $00, $4d, $0b, $4c, $17, $00, $00, $98, $02, $eb, $00
WildEnc_59e2:
	db $01, 30, $1e, $f5, $76, $00, $48, $7c, $29, $47, $00, $00, $a9, $02, $fa, $00
WildEnc_59f2:
	db $01, 29, $1d, $5a, $6b, $00, $09, $48, $0e, $0f, $00, $00, $92, $02, $f0, $00
WildEnc_5a02:
	db $01, 21, $1c, $ae, $61, $00, $47, $29, $1c, $48, $00, $00, $89, $02, $d7, $00
WildEnc_5a12:
	db $01, 27, $1d, $e0, $6d, $00, $49, $30, $7c, $12, $00, $00, $9f, $02, $f5, $00
WildEncSlots_5a22:
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
WildEnc_5a42:
	db $01, 1, $1d, $04, $6e, $00, $19, $38, $0c, $25, $00, $00, $c1, $02, $59, $01
WildEnc_5a52:
	db $01, 42, $1e, $6a, $75, $00, $73, $24, $72, $1e, $00, $00, $d1, $02, $7c, $01
WildEnc_5a62:
	db $01, 63, $1f, $9a, $83, $00, $68, $67, $1a, $13, $00, $00, $e2, $02, $68, $01
WildEnc_5a72:
	db $01, 76, $1e, $a6, $75, $00, $57, $4b, $09, $86, $00, $00, $e9, $02, $77, $01
WildEncSlots_5a82:
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
WildEnc_5aa2:
	db $01, 22, $1f, $ed, $85, $00, $0a, $49, $81, $47, $00, $00, $31, $03, $a9, $01
WildEnc_5ab2:
	db $01, 24, $20, $d7, $92, $00, $4a, $47, $15, $49, $00, $00, $3a, $03, $c7, $01
WildEnc_5ac2:
	db $01, 107, $21, $b6, $9f, $00, $7e, $1b, $14, $80, $00, $00, $47, $03, $e5, $01
WildEnc_5ad2:
	db $01, 103, $20, $56, $92, $00, $67, $47, $70, $01, $00, $00, $27, $03, $ae, $01
WildEncSlots_5ae2:
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
WildEnc_5b02:
	db $01, 19, $20, $7b, $90, $00, $41, $18, $80, $40, $00, $00, $63, $03, $fe, $01
WildEnc_5b12:
	db $01, 31, $21, $fa, $9e, $00, $5e, $12, $1d, $66, $00, $00, $5b, $03, $f9, $01
WildEnc_5b22:
	db $01, 52, $22, $94, $ae, $00, $52, $53, $0c, $2c, $00, $00, $6b, $03, $21, $02
WildEnc_5b32:
	db $01, 129, $21, $2b, $a0, $00, $52, $0c, $53, $10, $00, $00, $52, $03, $30, $02
WildEncSlots_5b42:
	dw WildEnc_5b62
	dw WildEnc_5b72
	dw WildEnc_5b82
	dw WildEnc_5b92
	dw WildEnc_5ba2
	dw WildEnc_5bb2
	dw WildEnc_5b62
	dw WildEnc_5b72
	dw WildEnc_5b82
	dw WildEnc_5b92
	dw WildEnc_5ba2
	dw WildEnc_5bb2
	dw WildEnc_5b62
	dw WildEnc_5b82
	dw WildEnc_5ba2
	dw WildEnc_5bb2
WildEnc_5b62:
	db $01, 95, $20, $ee, $94, $00, $42, $43, $44, $82, $00, $00, $66, $03, $6c, $02
WildEnc_5b72:
	db $01, 98, $21, $66, $9c, $00, $40, $3d, $29, $0d, $00, $00, $63, $03, $ad, $02
WildEnc_5b82:
	db $01, 18, $22, $db, $ab, $00, $43, $8a, $1d, $41, $00, $00, $71, $03, $99, $02
WildEnc_5b92:
	db $01, 16, $21, $af, $a0, $00, $21, $40, $03, $24, $00, $00, $5f, $03, $62, $02
WildEnc_5ba2:
	db $01, 13, $20, $7b, $90, $00, $15, $02, $04, $0a, $00, $00, $56, $03, $b2, $02
WildEnc_5bb2:
	db $01, 14, $21, $9d, $9f, $00, $03, $40, $0f, $0e, $00, $00, $68, $03, $85, $02
WildEncSlots_5bc2:
	dw WildEnc_5be2
	dw WildEnc_5bf2
	dw WildEnc_5c02
	dw WildEnc_5c12
	dw WildEnc_5c22
	dw WildEnc_5c32
	dw WildEnc_5be2
	dw WildEnc_5bf2
	dw WildEnc_5c02
	dw WildEnc_5c12
	dw WildEnc_5c22
	dw WildEnc_5c32
	dw WildEnc_5be2
	dw WildEnc_5c02
	dw WildEnc_5c22
	dw WildEnc_5c32
WildEnc_5be2:
	db $01, 12, $21, $7d, $a0, $00, $41, $1e, $40, $06, $00, $00, $97, $03, $ad, $02
WildEnc_5bf2:
	db $01, 15, $22, $38, $aa, $00, $41, $83, $20, $1b, $00, $00, $88, $03, $9e, $02
WildEnc_5c02:
	db $01, 17, $23, $39, $bf, $00, $42, $30, $40, $24, $00, $00, $9b, $03, $7b, $02
WildEnc_5c12:
	db $01, 20, $22, $c4, $ab, $00, $1f, $81, $0f, $7e, $00, $00, $8f, $03, $62, $02
WildEnc_5c22:
	db $01, 93, $21, $9e, $9f, $00, $42, $23, $0f, $0b, $00, $00, $99, $03, $99, $02
WildEnc_5c32:
	db $01, 94, $22, $25, $aa, $00, $28, $41, $50, $0c, $00, $00, $8b, $03, $8f, $02
WildEncSlots_5c42:
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
WildEnc_5c62:
	db $01, 104, $22, $84, $aa, $00, $4c, $11, $4d, $0a, $00, $00, $cc, $03, $bc, $02
WildEnc_5c72:
	db $01, 105, $23, $c0, $bd, $00, $4d, $49, $47, $86, $00, $00, $c2, $03, $f3, $02
WildEnc_5c82:
	db $01, 23, $24, $85, $ca, $00, $48, $49, $4b, $0a, $00, $00, $d5, $03, $d5, $02
WildEnc_5c92:
	db $01, 22, $23, $94, $ba, $00, $47, $49, $11, $0a, $00, $00, $c7, $03, $0c, $03
WildEncSlots_5ca2:
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cd2
WildEnc_5cc2:
	db $01, 16, $23, $b2, $bd, $00, $40, $24, $21, $03, $00, $00, $dd, $03, $d9, $03
WildEnc_5cd2:
	db $01, 96, $24, $ed, $cc, $00, $83, $81, $80, $27, $00, $00, $e2, $03, $b7, $02
WildEnc_5ce2:
	db $01, 97, $25, $f4, $db, $00, $06, $05, $42, $41, $00, $00, $03, $04, $5d, $02
WildEncSlots_5cf2:
	dw WildEnc_5d12
	dw WildEnc_5d22
	dw WildEnc_5d32
	dw WildEnc_5d42
	dw WildEnc_5d52
	dw WildEnc_5d12
	dw WildEnc_5d22
	dw WildEnc_5d32
	dw WildEnc_5d42
	dw WildEnc_5d52
	dw WildEnc_5d12
	dw WildEnc_5d22
	dw WildEnc_5d32
	dw WildEnc_5d42
	dw WildEnc_5d52
	dw WildEnc_5d42
WildEnc_5d12:
	db $01, 32, $25, $2a, $e1, $00, $63, $16, $64, $18, $00, $00, $41, $04, $52, $03
WildEnc_5d22:
	db $01, 37, $26, $7a, $f3, $00, $60, $5f, $5e, $5d, $00, $00, $47, $04, $2f, $03
WildEnc_5d32:
	db $01, 38, $27, $13, $04, $01, $63, $61, $0a, $65, $00, $00, $75, $04, $4d, $03
WildEnc_5d42:
	db $01, 111, $26, $0b, $f6, $00, $60, $5e, $66, $09, $00, $00, $37, $04, $34, $03
WildEnc_5d52:
	db $01, 114, $25, $36, $e1, $00, $60, $64, $16, $68, $00, $00, $e6, $03, $75, $03
WildEncSlots_5d62:
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
WildEnc_5d82:
	db $01, 116, $27, $36, $03, $01, $06, $5e, $12, $66, $00, $00, $ed, $04, $9d, $03
WildEnc_5d92:
	db $01, 122, $28, $0f, $12, $01, $76, $7e, $81, $07, $00, $00, $12, $05, $de, $03
WildEnc_5da2:
	db $01, 125, $29, $27, $2e, $01, $72, $73, $74, $89, $00, $00, $18, $05, $cf, $03
WildEnc_5db2:
	db $01, 132, $28, $9b, $1f, $01, $1a, $51, $50, $52, $00, $00, $eb, $04, $a7, $03
WildEncSlots_5dc2:
	dw WildEnc_5de2
	dw WildEnc_5df2
	dw WildEnc_5e02
	dw WildEnc_5e12
	dw WildEnc_5e22
	dw WildEnc_5e32
	dw WildEnc_5de2
	dw WildEnc_5df2
	dw WildEnc_5e02
	dw WildEnc_5e12
	dw WildEnc_5e22
	dw WildEnc_5df2
	dw WildEnc_5e02
	dw WildEnc_5e12
	dw WildEnc_5e22
	dw WildEnc_5e32
WildEnc_5de2:
	db $01, 6, $28, $d6, $13, $01, $36, $35, $3d, $3c, $00, $00, $06, $05, $1a, $04
WildEnc_5df2:
	db $01, 67, $29, $fa, $2e, $01, $6e, $71, $69, $6d, $00, $00, $2b, $05, $7e, $04
WildEnc_5e02:
	db $01, 85, $2a, $34, $40, $01, $3e, $34, $31, $1d, $00, $00, $7a, $05, $e8, $03
WildEnc_5e12:
	db $01, 77, $29, $36, $26, $01, $78, $5c, $58, $80, $00, $00, $47, $05, $41, $05
WildEnc_5e22:
	db $01, 75, $28, $0c, $14, $01, $5a, $59, $58, $57, $00, $00, $1c, $05, $83, $04
WildEnc_5e32:
	db $01, 141, $29, $de, $29, $01, $52, $0a, $50, $0e, $00, $00, $0f, $05, $3d, $04
WildEncSlots_5e42:
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
WildEnc_5e62:
	db $01, 42, $2a, $db, $3e, $01, $72, $73, $74, $22, $00, $00, $74, $05, $d4, $03
WildEnc_5e72:
	db $01, 44, $2b, $ae, $56, $01, $74, $72, $73, $76, $00, $00, $8a, $05, $1a, $04
WildEnc_5e82:
	db $01, 59, $2c, $80, $71, $01, $53, $52, $51, $50, $00, $00, $ac, $05, $c5, $03
WildEnc_5e92:
	db $01, 74, $2b, $72, $55, $01, $7f, $58, $77, $7d, $00, $00, $7f, $05, $de, $03
WildEncSlots_5ea2:
	dw WildEnc_5ec2
	dw WildEnc_5ed2
	dw WildEnc_5ee2
	dw WildEnc_5ef2
	dw WildEnc_5f02
	dw WildEnc_5f12
	dw WildEnc_5ec2
	dw WildEnc_5ed2
	dw WildEnc_5ee2
	dw WildEnc_5ef2
	dw WildEnc_5f02
	dw WildEnc_5ed2
	dw WildEnc_5ee2
	dw WildEnc_5ef2
	dw WildEnc_5f02
	dw WildEnc_5f12
WildEnc_5ec2:
	db $01, 83, $2b, $d2, $59, $01, $22, $36, $0a, $16, $00, $00, $ad, $05, $e2, $04
WildEnc_5ed2:
	db $01, 87, $2c, $9c, $6b, $01, $8a, $16, $3d, $32, $00, $00, $d9, $05, $51, $04
WildEnc_5ee2:
	db $01, 112, $2d, $b2, $82, $01, $62, $66, $5e, $12, $00, $00, $ef, $05, $49, $07
WildEnc_5ef2:
	db $01, 79, $2b, $8b, $55, $01, $57, $05, $03, $0f, $00, $00, $a6, $05, $cd, $05
WildEnc_5f02:
	db $01, 77, $2d, $ea, $82, $01, $78, $5c, $58, $80, $00, $00, $f8, $05, $13, $06
WildEnc_5f12:
	db $01, 134, $2c, $f2, $6d, $01, $82, $7f, $56, $55, $00, $00, $d1, $05, $72, $06
WildEncAttrSlots_5f22:
	dw WildEncSlots_5f2e
	dw WildEncSlots_5f9e
	dw WildEncSlots_600e
	dw WildEncSlots_607e
	dw WildEncSlots_60fe
	dw WildEncSlots_617e
WildEncSlots_5f2e:
	dw WildEnc_5f4e
	dw WildEnc_5f5e
	dw WildEnc_5f6e
	dw WildEnc_5f7e
	dw WildEnc_5f8e
	dw WildEnc_5f4e
	dw WildEnc_5f5e
	dw WildEnc_5f6e
	dw WildEnc_5f7e
	dw WildEnc_5f8e
	dw WildEnc_5f4e
	dw WildEnc_5f5e
	dw WildEnc_5f6e
	dw WildEnc_5f7e
	dw WildEnc_5f8e
	dw WildEnc_5f6e
WildEnc_5f4e:
	db $01, 45, $2c, $cd, $6d, $01, $7a, $7b, $14, $82, $00, $00, $bb, $05, $6f, $04
WildEnc_5f5e:
	db $01, 47, $2d, $3a, $7f, $01, $75, $7a, $7b, $12, $00, $00, $e0, $05, $47, $04
WildEnc_5f6e:
	db $01, 49, $2e, $5b, $a1, $01, $76, $74, $73, $72, $00, $00, $33, $06, $b0, $04
WildEnc_5f7e:
	db $01, 119, $2d, $bf, $82, $01, $73, $74, $88, $89, $00, $00, $db, $05, $2e, $04
WildEnc_5f8e:
	db $01, 120, $2c, $e9, $79, $01, $16, $7a, $7b, $82, $00, $00, $9e, $05, $65, $04
WildEncSlots_5f9e:
	dw WildEnc_5fbe
	dw WildEnc_5fce
	dw WildEnc_5fde
	dw WildEnc_5fee
	dw WildEnc_5ffe
	dw WildEnc_5fbe
	dw WildEnc_5fce
	dw WildEnc_5fde
	dw WildEnc_5fee
	dw WildEnc_5ffe
	dw WildEnc_5fbe
	dw WildEnc_5fce
	dw WildEnc_5fde
	dw WildEnc_5fee
	dw WildEnc_5ffe
	dw WildEnc_5fde
WildEnc_5fbe:
	db $01, 31, $2d, $fd, $7f, $01, $62, $5e, $12, $66, $00, $00, $28, $06, $a1, $04
WildEnc_5fce:
	db $01, 41, $2e, $4f, $a8, $01, $7a, $7b, $72, $20, $00, $00, $44, $06, $42, $04
WildEnc_5fde:
	db $01, 40, $2f, $2f, $b8, $01, $5d, $60, $7e, $64, $00, $00, $79, $06, $ed, $03
WildEnc_5fee:
	db $01, 54, $2d, $75, $82, $01, $56, $54, $52, $51, $00, $00, $3e, $06, $97, $04
WildEnc_5ffe:
	db $01, 61, $2e, $28, $89, $01, $21, $68, $67, $22, $00, $00, $61, $06, $4c, $04
WildEncSlots_600e:
	dw WildEnc_602e
	dw WildEnc_603e
	dw WildEnc_604e
	dw WildEnc_605e
	dw WildEnc_606e
	dw WildEnc_602e
	dw WildEnc_603e
	dw WildEnc_604e
	dw WildEnc_605e
	dw WildEnc_606e
	dw WildEnc_602e
	dw WildEnc_603e
	dw WildEnc_604e
	dw WildEnc_605e
	dw WildEnc_606e
	dw WildEnc_604e
WildEnc_602e:
	db $01, 3, $2d, $5b, $81, $01, $3c, $3f, $39, $37, $00, $00, $29, $06, $b5, $04
WildEnc_603e:
	db $01, 73, $2e, $70, $9c, $01, $79, $57, $82, $7f, $00, $00, $2f, $06, $a1, $04
WildEnc_604e:
	db $01, 69, $2f, $44, $b4, $01, $6a, $0a, $81, $82, $00, $00, $98, $06, $ed, $03
WildEnc_605e:
	db $01, 113, $30, $34, $d4, $01, $83, $60, $5f, $2b, $00, $00, $c0, $06, $e8, $03
WildEnc_606e:
	db $01, 152, $2f, $33, $b8, $01, $75, $7a, $7b, $12, $00, $00, $9e, $06, $37, $05
WildEncSlots_607e:
	dw WildEnc_609e
	dw WildEnc_60ae
	dw WildEnc_60be
	dw WildEnc_60ce
	dw WildEnc_60de
	dw WildEnc_60ee
	dw WildEnc_609e
	dw WildEnc_60ae
	dw WildEnc_60be
	dw WildEnc_60ce
	dw WildEnc_60de
	dw WildEnc_60ee
	dw WildEnc_609e
	dw WildEnc_60be
	dw WildEnc_60ce
	dw WildEnc_60ee
WildEnc_609e:
	db $01, 26, $2e, $53, $a8, $01, $4b, $8b, $4e, $48, $00, $00, $45, $06, $fc, $03
WildEnc_60ae:
	db $01, 68, $2f, $07, $b0, $01, $6b, $5a, $69, $6e, $00, $00, $7a, $06, $9c, $04
WildEnc_60be:
	db $01, 70, $30, $90, $d4, $01, $6b, $7f, $41, $00, $00, $00, $f6, $06, $ed, $03
WildEnc_60ce:
	db $01, 86, $31, $48, $fb, $01, $24, $3c, $3b, $22, $00, $00, $09, $07, $e7, $04
WildEnc_60de:
	db $01, 89, $30, $5b, $d5, $02, $34, $3e, $89, $0e, $00, $00, $fe, $06, $19, $05
WildEnc_60ee:
	db $01, 143, $2f, $2d, $b8, $01, $6a, $69, $88, $25, $00, $00, $8d, $06, $1a, $04
WildEncSlots_60fe:
	dw WildEnc_611e
	dw WildEnc_612e
	dw WildEnc_613e
	dw WildEnc_614e
	dw WildEnc_615e
	dw WildEnc_616e
	dw WildEnc_611e
	dw WildEnc_612e
	dw WildEnc_613e
	dw WildEnc_614e
	dw WildEnc_615e
	dw WildEnc_616e
	dw WildEnc_611e
	dw WildEnc_613e
	dw WildEnc_614e
	dw WildEnc_616e
WildEnc_611e:
	db $01, 61, $31, $3e, $fb, $01, $68, $22, $67, $03, $00, $00, $09, $07, $e8, $03
WildEnc_612e:
	db $01, 67, $32, $c4, $11, $02, $69, $83, $6f, $86, $00, $00, $62, $07, $e8, $03
WildEnc_613e:
	db $01, 68, $33, $5c, $2d, $02, $5a, $69, $6b, $7c, $00, $00, $d2, $07, $1a, $04
WildEnc_614e:
	db $01, 138, $34, $7c, $4a, $02, $85, $00, $00, $00, $00, $00, $ec, $07, $51, $04
WildEnc_615e:
	db $01, 137, $33, $ad, $2a, $02, $6a, $6b, $67, $68, $00, $00, $ce, $07, $1f, $04
WildEnc_616e:
	db $01, 140, $32, $49, $12, $02, $68, $6b, $69, $67, $00, $00, $61, $07, $b0, $04
WildEncSlots_617e:
	dw WildEnc_619e
	dw WildEnc_61ae
	dw WildEnc_61be
	dw WildEnc_61ce
	dw WildEnc_61de
	dw WildEnc_61ee
	dw WildEnc_619e
	dw WildEnc_61ae
	dw WildEnc_61be
	dw WildEnc_61ce
	dw WildEnc_61de
	dw WildEnc_61ee
	dw WildEnc_619e
	dw WildEnc_61be
	dw WildEnc_61ce
	dw WildEnc_61ee
WildEnc_619e:
	db $01, 9, $31, $2f, $f1, $01, $34, $2a, $14, $1f, $00, $00, $08, $07, $b5, $04
WildEnc_61ae:
	db $01, 67, $32, $96, $0d, $02, $69, $83, $6f, $86, $00, $00, $66, $07, $a1, $04
WildEnc_61be:
	db $01, 82, $33, $4f, $2d, $02, $38, $32, $87, $31, $00, $00, $cf, $07, $4c, $04
WildEnc_61ce:
	db $01, 79, $34, $a0, $4a, $02, $83, $05, $02, $57, $00, $00, $ee, $07, $1f, $04
WildEnc_61de:
	db $01, 45, $33, $80, $39, $02, $7a, $7b, $82, $16, $00, $00, $d6, $07, $1c, $04
WildEnc_61ee:
	db $01, 150, $32, $8b, $16, $02, $5a, $59, $77, $57, $00, $00, $47, $07, $15, $04
WildEncAttrSlots_61fe:
	dw WildEncSlots_6208
	dw WildEncSlots_6278
	dw WildEncSlots_62f8
	dw WildEncSlots_6378
	dw WildEncSlots_63e8
WildEncSlots_6208:
	dw WildEnc_6228
	dw WildEnc_6238
	dw WildEnc_6248
	dw WildEnc_6258
	dw WildEnc_6268
	dw WildEnc_6228
	dw WildEnc_6238
	dw WildEnc_6248
	dw WildEnc_6258
	dw WildEnc_6268
	dw WildEnc_6228
	dw WildEnc_6238
	dw WildEnc_6248
	dw WildEnc_6258
	dw WildEnc_6268
	dw WildEnc_6248
WildEnc_6228:
	db $01, 46, $32, $07, $12, $02, $74, $88, $73, $72, $00, $00, $d4, $07, $27, $06
WildEnc_6238:
	db $01, 88, $33, $0c, $35, $02, $35, $2f, $12, $2a, $00, $00, $05, $08, $aa, $05
WildEnc_6248:
	db $01, 121, $34, $75, $4b, $02, $73, $76, $74, $72, $00, $00, $2f, $08, $40, $06
WildEnc_6258:
	db $01, 123, $35, $c0, $72, $02, $75, $7a, $7b, $12, $00, $00, $3b, $08, $e1, $05
WildEnc_6268:
	db $01, 148, $34, $b4, $4e, $02, $5a, $59, $77, $57, $00, $00, $28, $08, $13, $06
WildEncSlots_6278:
	dw WildEnc_6298
	dw WildEnc_62a8
	dw WildEnc_62b8
	dw WildEnc_62c8
	dw WildEnc_62d8
	dw WildEnc_62e8
	dw WildEnc_6298
	dw WildEnc_62a8
	dw WildEnc_62b8
	dw WildEnc_62c8
	dw WildEnc_62d8
	dw WildEnc_62e8
	dw WildEnc_6298
	dw WildEnc_62a8
	dw WildEnc_62c8
	dw WildEnc_62e8
WildEnc_6298:
	db $01, 53, $33, $29, $31, $02, $55, $56, $54, $53, $00, $00, $fd, $07, $c1, $07
WildEnc_62a8:
	db $01, 56, $34, $07, $4e, $e3, $53, $55, $52, $54, $00, $00, $32, $08, $0d, $07
WildEnc_62b8:
	db $01, 57, $35, $98, $70, $02, $54, $53, $52, $51, $00, $00, $5c, $08, $a4, $06
WildEnc_62c8:
	db $01, 60, $36, $7c, $97, $02, $52, $22, $51, $50, $00, $00, $8b, $08, $04, $06
WildEnc_62d8:
	db $01, 130, $35, $ca, $78, $02, $53, $54, $51, $52, $00, $00, $6b, $08, $9a, $06
WildEnc_62e8:
	db $01, 133, $34, $10, $4b, $02, $2f, $53, $52, $51, $00, $00, $37, $08, $73, $05
WildEncSlots_62f8:
	dw WildEnc_6318
	dw WildEnc_6328
	dw WildEnc_6338
	dw WildEnc_6348
	dw WildEnc_6358
	dw WildEnc_6368
	dw WildEnc_6318
	dw WildEnc_6328
	dw WildEnc_6338
	dw WildEnc_6348
	dw WildEnc_6358
	dw WildEnc_6368
	dw WildEnc_6318
	dw WildEnc_6328
	dw WildEnc_6348
	dw WildEnc_6368
WildEnc_6318:
	db $01, 136, $34, $4b, $50, $02, $6b, $7c, $5a, $69, $00, $00, $43, $08, $db, $06
WildEnc_6328:
	db $01, 62, $35, $91, $70, $02, $88, $6a, $69, $13, $00, $00, $7e, $08, $3a, $07
WildEnc_6338:
	db $01, 64, $36, $70, $96, $02, $69, $6c, $5a, $89, $00, $00, $b7, $08, $9e, $07
WildEnc_6348:
	db $01, 70, $37, $6c, $b9, $02, $6b, $41, $7f, $00, $00, $00, $dd, $08, $40, $06
WildEnc_6358:
	db $01, 137, $36, $70, $96, $02, $6a, $67, $6b, $68, $00, $00, $b2, $08, $3a, $07
WildEnc_6368:
	db $01, 141, $35, $8a, $6c, $02, $0e, $54, $0a, $52, $00, $00, $8a, $08, $36, $06
WildEncSlots_6378:
	dw WildEnc_6398
	dw WildEnc_63a8
	dw WildEnc_63b8
	dw WildEnc_63c8
	dw WildEnc_63d8
	dw WildEnc_6398
	dw WildEnc_63a8
	dw WildEnc_63b8
	dw WildEnc_63c8
	dw WildEnc_63d8
	dw WildEnc_6398
	dw WildEnc_63a8
	dw WildEnc_63b8
	dw WildEnc_63c8
	dw WildEnc_63d8
	dw WildEnc_6398
WildEnc_6398:
	db $01, 72, $37, $c2, $bd, $02, $78, $5c, $5b, $59, $00, $00, $fb, $08, $90, $06
WildEnc_63a8:
	db $01, 78, $38, $ec, $e0, $02, $3c, $3d, $3e, $33, $00, $00, $51, $09, $f9, $06
WildEnc_63b8:
	db $01, 80, $39, $4a, $08, $03, $5a, $77, $59, $86, $00, $00, $85, $09, $9e, $07
WildEnc_63c8:
	db $01, 14, $38, $6e, $da, $02, $42, $41, $05, $40, $00, $00, $60, $09, $08, $07
WildEnc_63d8:
	db $01, 95, $37, $ce, $ba, $02, $46, $44, $45, $43, $00, $00, $0c, $09, $d6, $06
WildEncSlots_63e8:
	dw WildEnc_6408
	dw WildEnc_6418
	dw WildEnc_6428
	dw WildEnc_6438
	dw WildEnc_6448
	dw WildEnc_6458
	dw WildEnc_6468
	dw WildEnc_6478
	dw WildEnc_6488
	dw WildEnc_6498
	dw WildEnc_6458
	dw WildEnc_6448
	dw WildEnc_6438
	dw WildEnc_6428
	dw WildEnc_6498
	dw WildEnc_6478
WildEnc_6408:
	db $01, 5, $38, $a4, $e5, $02, $36, $2e, $2a, $2d, $00, $00, $74, $09, $dc, $05
WildEnc_6418:
	db $01, 90, $39, $5d, $08, $03, $43, $42, $45, $88, $00, $00, $b6, $09, $09, $06
WildEnc_6428:
	db $01, 92, $3a, $1b, $32, $03, $46, $42, $43, $40, $00, $00, $c8, $09, $72, $06
WildEnc_6438:
	db $01, 100, $39, $c5, $0c, $03, $4f, $4d, $4e, $83, $00, $00, $bb, $09, $e1, $05
WildEnc_6448:
	db $01, 101, $38, $18, $e4, $02, $83, $4b, $49, $80, $00, $00, $6c, $09, $a4, $06
WildEnc_6458:
	db $01, 109, $3a, $5e, $30, $03, $5d, $8c, $77, $63, $00, $00, $db, $09, $72, $06
WildEnc_6468:
	db $01, 124, $38, $e7, $e4, $02, $7a, $7b, $73, $20, $00, $00, $93, $09, $af, $05
WildEnc_6478:
	db $01, 146, $39, $46, $09, $03, $79, $57, $82, $7e, $00, $00, $bf, $09, $72, $06
WildEnc_6488:
	db $01, 10, $3a, $e4, $30, $03, $0a, $0f, $20, $31, $00, $00, $e4, $09, $78, $05
WildEnc_6498:
	db $01, 127, $39, $bc, $08, $03, $51, $52, $0e, $50, $00, $00, $b9, $09, $e1, $05
