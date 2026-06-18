unk_07a_4000:
	dr $1e8000, $1e801f

Func_07a_401f::
	call unk_07a_4000
	ld a, $6e
	call PlaySound
	xor a
	ldh [$ffbf], a
	ldh [$ffae], a
	ldh [$ffaf], a
	ldh [$ffb0], a
	ldh [$ffb1], a
	ld [wIntroStepTimer], a
	ld [wIntroScrollMode], a
	ld [wdcfb], a
	ld [wdce8], a
	ld [wIntroSeqStep], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld hl, $9800
	ld de, $492f
	ld bc, $1412
	ld a, $12
	ldh [$ff93], a
	ld a, $14
	ldh [$ff92], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, $47c7
	ld bc, $1412
	ld a, $12
	ldh [$ff93], a
	ld a, $14
	ldh [$ff92], a
	call PlaceAttrmap
	ld hl, $4a97
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, $530f
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, $4aaf
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, $8800
	ld bc, $0060
	call CopyBytesVRAM
	ld hl, $5317
	ld de, $8000
	ld bc, $01e0
	call CopyBytesVRAM
	call $400e
	ld a, $50
	ld [wcd55], a
	ld a, $28
	ld [wcd56], a
	ld a, $01
	ld [wcd57], a
	ld a, $81
	ld [wcd58], a
	ld a, $38
	ld [wcd59], a
	ld a, $48
	ld [wcd5a], a
	ld a, $01
	ld [wcd5b], a
	ld a, $81
	ld [wcd5c], a
	ld a, $48
	ld [wcd5d], a
	ld a, $78
	ld [wcd5e], a
	ld a, $01
	ld [wcd5f], a
	ld a, $81
	ld [wcd60], a
	call $4525
	ld a, $c7
	ldh [$ff40], a
	ld hl, wPaletteBuffer
	xor a
	ldh [$ffc4], a
	ldh [$ff9d], a
	call FadeInPalette
.asm_40f9
	call DelayFrame
	call $4525
	call $43de
	call $442d
	call $44d6
	ldh a, [$ff9d]
	inc a
	ldh [$ff9d], a
	ldh a, [$ffbf]
	and a
	jr nz, .asm_4115
	jp .asm_40f9
.asm_4115
	ld bc, wPaletteBuffer
	xor a
	ldh [$ffc4], a
	call FadeOutPalette
	call $400e
	ld hl, $9800
	ld de, $565f
	ld bc, $1412
	ld a, $12
	ldh [$ff93], a
	ld a, $14
	ldh [$ff92], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, $54f7
	ld bc, $1412
	ld a, $12
	ldh [$ff93], a
	ld a, $14
	ldh [$ff92], a
	call PlaceAttrmap
	ld hl, $57c7
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, $57df
	ld de, $9000
	ld bc, $0710
	call CopyBytesVRAM
	xor a
	ldh [$ffbf], a
	ld a, $c7
	ldh [$ff40], a
	ld hl, wPaletteBuffer
	xor a
	ldh [$ffc4], a
	ldh [$ff9d], a
	call FadeInPalette
.asm_4173
	call $43d0
	ldh a, [$ffbf]
	cp $02
	jr z, .asm_417f
	jp .asm_4173
.asm_417f
	xor a
	ldh [$ffbf], a
	ld [wTargetMode], a
	jp JumpToGameMode

Func_07a_4188::
	dr $1e8188, $1eba40


