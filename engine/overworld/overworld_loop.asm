Overworld::
; upon entering overworld
	call PlayMapMusic
; ?
	ld a, $1C
	ld [wdce7], a

	xor a
	ldh [hFade], a
	ldh [hTextSource], a
	ldh [hFFC2], a	; map animations

	xor a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ldh [hFF9F], a
	ldh [hFFA0], a
	ldh [hFFC2], a
	ldh [hJoypadDown], a
	ldh [hJoypadPressed], a
	ld a, $FF
	ldh [hFF9E], a

	ld hl, wTileAnimFrameCounters
	ld c, $0C
	xor a
.fill
	ld [hli], a
	dec c
	jr nz, .fill

	call CopyPlayerCharName
	call SetMapZoneFlags
	call LoadMap
	call CopyMapBufferToTilemap
	ld hl, $9800
	ld de, wTilemap
	ld bc, $1412
	ld a, $12
	ld [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call CopyBlockToVRAM
	call ClearObjectData
	call LoadVisibleMapObjects
	call CopyBGMapAttributes
	call SpawnPlayerSprite
	call _UpdatePlayerMapCoords
	xor a
	ldh [hSimulatedJoypadState], a
	ldh [hFFA4], a
	call BuildVirtualOAM
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	ld [wd9d2], a
	call FadeInPalette

OverworldLoop:
	call DelayFrame

; increase frame counter
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a

; check if we're fading to another map
	ldh a, [hFade]
	and a
	jp nz, Overworld_DoFade

; check if we have any part of the start menu open
	ldh a, [hFFC5]
	and a
	jp nz, Overworld_GotoProcessStartMenu

; check if we should be in battle
	ldh a, [hBattleJumptableIndex]
	and a
	jp nz, Overworld_GotoBattleJumptable

; not in battle

	call UpdateWalkAnimTimer
; update OAM?
	call BuildVirtualOAM

; check if we should briefly display
; a short text scroll now
	ldh a, [hScrollNumber]
	and a
	jp nz, Overworld_GotoProcessScroll

; check if we should be spawning
; a text box
	ldh a, [hTextSource]
	and a
	jp nz, Overworld_GotoProcessTextbox

; check if we are currently in a script
	ldh a, [hFFD6]
	and a
	jp nz, Overworld_GotoProcessScript

; trigger joypad reading
	ld a, $01
	ld [wd082], a

; move one step
	call Overworld_MovePlayerOneStep

; check for fade (again)
	ldh a, [hFade]
	and a
	jr nz, Overworld_DoFade

; disable joypad reading
	xor a
	ld [wd082], a

; if we are in a battle, go back to loop
	ld a, [hBattleJumptableIndex]
	and a
	jr nz, OverworldLoop

; specific events in the overworld
	call Overworld_DoBlackFlashing
	call HandleOverworldInput
	call Overworld_ProcessJoypadInput

; object events?
	call UpdateVisibleObjects
	call UpdatePlayerAnim
	call UpdateObjectAnimations
	jp OverworldLoop

Overworld_GotoProcessScript:
	xor a
	ld [wd082], a
	call DispatchScriptCommand
	call UpdateObjectAnimations
	call UpdatePlayerAnim
	jp OverworldLoop

Overworld_GotoProcessTextbox:
	ld hl, wTextStart
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp OverworldLoop

Overworld_GotoProcessScroll:
	call AnimatePaperScroll
	jp OverworldLoop

Overworld_GotoProcessStartMenu:
	call ExecuteBattleScript
	jp OverworldLoop

Overworld_GotoBattleJumptable:
	farcall BattleJumptable
	jp OverworldLoop

Overworld_DoFade:
	ld a, [wPlayerFacing]
	ld [wd0e3], a
	ld a, [wcd23]
	ld [wdcec], a
	jp JumpToGameMode

Overworld_DoBlackFlashing:
; for maps 04:06 through 04:09
; flashes to black, and then flashes back
; to the original palette
	ld a, [hMapGroup]
	cp MAPGROUP_GROUP_04
	ret nz
	ldh a, [hMapNumber]
	cp MAP_G4_06
	jr z, .DoFlash
	cp MAP_G4_07
	jr z, .DoFlash
	cp MAP_G4_08
	jr z, .DoFlash
	cp MAP_G4_09
	jr z, .DoFlash
	ret

.DoFlash:
	ld a, [wdcb9]
	and a
	jr z, FlashToBlack
	ld a, [wdcb8]
	inc a
	ld [wdcb8], a
	cp $20
	ret nz
	xor a
	ld [wdcb8], a
	ld [wdcb9], a
	ld hl, Palette_005_4394
	call PartialCopyBackgroundPalettes
	ret

FlashToBlack:
	ld a, [wdcb8]
	inc a
	ld [wdcb8], a
	cp $18
	ret nz
	xor a
	ld [wdcb8], a
	ld a, $01
	ld [wdcb9], a
	ld hl, Palettes_005_4364
	call PartialCopyBackgroundPalettes
	ret

Palettes_005_4364:
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0

Palette_005_4394:
	RGB 31, 31, 31
	RGB 31, 31,  4
	RGB 31,  6,  0
	RGB  0,  0,  0
	RGB 24, 31, 31
	RGB  8, 21, 31
	RGB  0,  4, 28
	RGB  0,  0,  0
	RGB 31, 23, 12
	RGB 27, 13,  4
	RGB 17,  5,  0
	RGB  0,  0,  0
	RGB 24, 31, 16
	RGB 17, 31,  9
	RGB 10, 22,  6
	RGB  0,  0,  0
	RGB 29, 29, 18
	RGB 25, 25,  9
	RGB 17, 17,  4
	RGB  0,  0,  0
	RGB 30, 30, 27
	RGB 24, 25, 19
	RGB 18, 18, 13
	RGB  9,  9,  2

; Unreferenced (dead) tilemap-place routine. Final call target $57a0 is stale: it lands
; mid-instruction inside Overworld_ProcessJoypadInput, so it stays a bare address.
DrawFullScreenTilemap:
	ld de, wTilemap
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1412
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, $12
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call $57a0
	ret

UpdateWalkAnimTimer:
	ld a, [wdcfa]
	and a
	ret z
	dec a
	ld [wdcfa], a
	and a
	jr z, .set
	and $07
	ret nz
	ld hl, wcd02
	ld a, $01
	sub [hl]
	ld [hl], a
	jr .done
.set
	ld a, $01
	ld [wcd02], a
.done
	ldh [hFFAC], a
	ld [wdcd0], a
	ld a, $0A
	ldh [hFFAD], a
	ret

CopyPlayerCharName:
	farcall CopyNameByIndex
	ret
