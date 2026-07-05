; Variable-width font for the MENU reader (menus, battles, names).
;
; Reuses the dialogue compositor from text_vwf.asm -- VWF_ComposeGlyph shifts
; and ORs the proportional glyph into the 2-tile rolling window wVWFWindow at
; sub-pixel offset wVWFSubX; VWF_ShiftWindow / VWF_ResetLine / VWFWidths are
; shared verbatim.
;
; The one thing that differs from dialogue: the menu box tilemap is STATIC
; (the bank caller draws it), so there is no BG-map streaming to drive. A
; finalized tile is simply uploaded into the fixed VRAM slot the tilemap
; already points at, computed from tile-id = wMenuTextX + wCharacterTilePos
; (the same nibble math the fixed .english path uses). The cursor advances by
; +2 tile-ids per finalized 8px tile, so English glyphs land on the top-row
; cells the fixed-width path used -- and stay interleavable with fixed 2x2
; Chinese glyphs on the same line.

Menu_VWF_PrintChar::
	ld a, [wCurrentCharacterByte]
	call VWF_ComposeGlyph

; newSubX = wVWFSubX + VWFWidths[char]
	ld a, [wCurrentCharacterByte]
	ld hl, VWFWidths
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld hl, wVWFSubX
	add [hl]
	cp 8
	jr nc, .render
; still inside the tile, keep buffering
	ld [hl], a
	jp Menu_CheckCharacter

.render
; a = subX + width (>= 8). A wide glyph (advance 9) at subX=7 gives 16 and
; crosses TWO 8px boundaries, so finalize once per crossed boundary until the
; residue is back in 0..7.
	sub 8
	ld [wVWFSubX], a
	call Menu_VWF_FinalizeTile
	call VWF_ShiftWindow
	ld a, [wVWFSubX]
	cp 8
	jr nc, .render
	jp Menu_CheckCharacter

; Upload the completed wVWFWindow tile into the menu's fixed VRAM slot for the
; current cursor, then advance the cursor. Called per finalized tile and by
; Menu_VWF_FlushPartial.
Menu_VWF_FinalizeTile:
; wCharacterTileDest = VRAM slot for tile-id (wMenuTextX + wCharacterTilePos).
; hi nibble >= 8 -> base $8000 ($8800-$8ff0); else base $9000 ($9000-$97f0).
	ld a, [wCharacterTilePos]
	ld c, a
	ld a, [wMenuTextX]
	add c
	ld c, a
	ld [wcbf3], a
	swap a
	ld b, a
	and $0f
	cp $08
	jr nc, .useBase80
	or $90
	jr .storeHigh
.useBase80
	or $80
.storeHigh
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a

; source = the composited window (WRAM); one tile. hTargetBank is only used by
; LoadCharacter's ROM bankswitch before it reads the (WRAM) source, so any
; valid bank works -- use the VWF font's for def's sake.
	ld a, BANK(VWF_Charset_English)
	ld [hTargetBank], a
	ld a, LOW(wVWFWindow)
	ld [wCharacterTileSrc], a
	ld a, HIGH(wVWFWindow)
	ld [wCharacterTileSrc + 1], a
	ld a, 1
	ld [wCharacterTileCount], a

; arm the transfer, then wait a FRESH vblank so LoadCharacter uploads the
; window BEFORE VWF_ShiftWindow slides it out from under the pending transfer
; (the swallow-avoidance the dialogue finalize also needs). Source is set
; before status, so there is no arm-then-override window to di/ei around.
	ld a, 1
	ld [wCharacterTileTransferStatus], a
	xor a
	ldh [hVBlank], a
	call DelayFrame

; advance one tile (+2 tile-ids = next top-row cell); wrap at the right edge
; exactly like the fixed .english path.
	ld a, [wMenuTextEndX]
	ld c, a
	ld a, [wCharacterTilePos]
	add 2
	ld [wCharacterTilePos], a
	cp c
	ret c
	xor a
	ld [wCharacterTilePos], a
	ret

; Flush any pending partial tile (EN->ZH switch, para line break, string end)
; so the next Chinese glyph / new line starts tile-aligned and the last
; English glyph of a run is never dropped. No-op (just resets) when nothing is
; pending.
Menu_VWF_FlushPartial::
	ld a, [wVWFSubX]
	and a
	jr z, .done
	call Menu_VWF_FinalizeTile
.done
	jp VWF_ResetLine

; The $ef control byte (`<even>` in the CSV). Flush the pending partial to the
; next whole tile so a composed-menu label ends on a tile boundary and the next
; label starts fresh -- no two labels share a tile, so the tilemap can map each
; label's tiles to its own button. Then resume the string.
MenuText_TileFlush::
	call Menu_VWF_FlushPartial
	jp Menu_CheckCharacter
