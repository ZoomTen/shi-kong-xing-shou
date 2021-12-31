CopyTilemapToVRAM::
	; I'm sure there's already an equivalent function
	; but I haven't found it yet so here you go
	; quick hacks that waste a ton of clock cycles and ROM space
copyrow: MACRO
	ld hl, wTilemap + (\1 * SCREEN_WIDTH)
	ld de, vBGMap0 + (\1 * BG_MAP_WIDTH)
	ld bc, SCREEN_WIDTH
	call CopyBytesVRAM
ENDM
	copyrow 0
	copyrow 1
	copyrow 2
	copyrow 3
	copyrow 4
	copyrow 5
	copyrow 6
	copyrow 7
	copyrow 8
	copyrow 9
	copyrow 10
	copyrow 11
	copyrow 12
	copyrow 13
	copyrow 14
	copyrow 15
	copyrow 16
	copyrow 17
	ret

Func_1c2c_Continue::
	xor a
	ld [wCharacterTilemapPos], a
	ld [wTextLine], a
	ld [wCharacterTilePos], a
	ld a, BANK(English_Character_Set)
	ld [hTargetBank], a
	jp CheckCharacter

RepointText::
	pop hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst Bankswitch
	push hl
	jp CheckCharacter
