ExecuteBattleScript::
	homecall _ExecuteBattleScript
	ret

AdvanceBattleScript::
	ld a, [_BANKNUM]
	push af

	ld a, [wBattleScriptBank]
	rst Bankswitch
	ld a, [wBattleScriptPos]
	ld l, a
	ld a, [wBattleScriptPos + 1]
	ld h, a
	ld a, [hli]
	ld [wBattleScriptByte], a
	ld a, l
	ld [wBattleScriptPos], a
	ld a, h
	ld [wBattleScriptPos + 1], a
	pop af
	rst Bankswitch
	ret
