NewGameContinueMenu::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ldh [hFFC2], a
	ldh [hJoypadPressed], a
	ld [hFFBB], a
	ld [wdccf], a
	ld [wdccc], a
	ldh [hFFA1], a
	ld [wcd0a], a
	call ClearBGMap0
	ld hl, $9800
	ld de, NewGameContinueMenu_Tilemap
	ld bc, $0B06
	ld a, $06
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, NewGameContinueMenu_Attrmap
	ld bc, $0B06
	ld a, $06
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, NewGameContinueMenu_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, NewGameContinueMenu_Palette2
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, NewGameContinueMenu_GFX
	ld de, $9000
	ld bc, $0090
	call CopyBytesVRAM
	ld hl, NewGameContinueMenu_GFX2
	ld de, $8FE0
	ld bc, $0020
	call CopyBytesVRAM
	ld hl, wcde0
	ld [hl], $18
	inc hl
	ld [hl], $10
	inc hl
	ld [hl], $01
	ld a, $C7
	ldh [rLCDC], a
	call .asm_41d6
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	ld [wSelectedOption], a
	call FadeInPalette
.asm_416a
	farcall ClearMenuSprites4
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_4183
	call .asm_418a
	jp .asm_416a
.asm_4183
	xor a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_418a
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_419f
	ld a, [wSelectedOption]
	and a
	ret z
	xor a
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $18
	ret
.asm_419f
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_41b5
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, $01
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $28
	ret
.asm_41b5
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $01
	ldh [hFade], a
	xor a
	ld [wd9d2], a
	ld a, [wcde0]
	cp $18
	ret z
	call SRAMTest_Fast
	and a
	ret nz
	ld a, $01
	ld [wd9d2], a
	call LoadSaveData
	ret
.asm_41d6
	ld hl, text_3c_41eb
	ld a, $10
	ld [wMenuTextX], a
	ld a, $30
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

INCLUDE "text/new_game_continue.asm"
NewGameContinueMenu_Tilemap:
	INCBIN "gfx/tilemaps/tilemap_03c_41f7.tilemap"
NewGameContinueMenu_Attrmap:
	ds 66
NewGameContinueMenu_Palette:
	RGB 31, 31, 31
	RGB 11, 27, 31
	RGB 10, 10, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 25, 0
	RGB 24, 0, 0
	RGB 0, 0, 0
NewGameContinueMenu_Palette2:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 15, 29
	RGB 31, 27, 23
NewGameContinueMenu_GFX:
	INCBIN "gfx/misc/gfx_3c_4293.2bpp"
NewGameContinueMenu_GFX2:
	INCBIN "gfx/misc/gfx_3c_4323.2bpp"
