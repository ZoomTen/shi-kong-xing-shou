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
	dr $8c014, $8c132

; TODO: battle-script interpreter + script data (read via AdvanceBattleScriptMode)
unk_023_4132:
	dr $8c132, $8d5cc

; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_55cc:
	dr $8d5cc, $8d5f6
; TODO disassemble (script data, read via AdvanceBattleScriptMode)
Script_023_55f6:
	dr $8d5f6, $8d5fa
; TODO disassemble
Func_023_55fa:
	dr $8d5fa, $8d6de
; TODO disassemble
Func_023_56de:
	dr $8d6de, $8d6f3
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


