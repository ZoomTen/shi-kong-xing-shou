; Renders pairs of characters into memory and then lets the text engine
; blit them on-screen.

INCLUDE "gfx/character_set/english_vwf_widths.asm"

VWF_PrintChar::
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
	jp CheckCharacter

.render
; a = subX + width (>= 8)
; wide glyph (advance 9) at subX=7 gives 16 = crosses TWO 8px boundaries
; render once per crossed boundary until residue is back in 0..7
	sub 8
	ld [wVWFSubX], a

; don't write past the row
	ld a, [wCharacterTilemapPos]
	cp 14
	jr nc, .drop

; fire to VRAM
	call VWF_FinalizeTile
	call CheckCharacter_Continue.QueueCharBGMapPointers
	ld a, 1
	ld [wCharacterBGMapTransferStatus], a
	xor a
	ldh [hVBlank], a
	call DelayFrame

; advance column
	ld hl, wCharacterTilemapPos
	inc [hl]
	call VWF_ShiftWindow

; keep going until we're left with something clean
	ld a, [wVWFSubX]
	cp 8
	jr nc, .render
	jp CheckCharacter

.drop
; discard the buffer and reset VWF state
	ld a, [wVWFSubX]
	cp 8
	jr c, .shift
	sub 8
	ld [wVWFSubX], a
.shift
	call VWF_ShiftWindow
	jp CheckCharacter

; OR one 1bpp glyph into wVWFWindow / wVWFWindow+8 at shift wVWFSubX
; INPUT
;	a          = glyph code
;	[wVWFSubX] = how much to shift
; OUTPUT
;	[wVWFWindow..wVWFWindow+16] = buffer
; REPLACE
;	af bc de hl
VWF_ComposeGlyph:
; fetch the character data
	ld h, 0
	ld l, a
	add hl, hl ; a * 2
	add hl, hl ;     4
	add hl, hl ;     8
	; + VWF_Charset_English
	ld bc, VWF_Charset_English
	add hl, bc
; bc <-
	ld b, h
	ld c, l
	ld a, [_BANKNUM]
	push af
	ld a, BANK(VWF_Charset_English)
	rst Bankswitch
; hl <- wVWFWindow
	ld hl, wVWFBufferTile1
	ld a, [wVWFSubX]
	ld e, a
	ld d, 8

; d <- row counter
; e <- how much to shift right
.row
	ld a, e
	and a
	; immediately blit this row
	jr z, .blit

; perform the shift
	ld a, [bc]
	push de
		ld d, e
; shift the actual GFX data
.sr
		srl a
		dec d
		jr nz, .sr
; do the blit
		or [hl]
		ld [hl], a
; but that's just one half of the data!
; let's move to the second tile and deal with whatever's left
ASSERT wVWFBufferTile2 == wVWFBufferTile1+8, "VWF buffer tiles must be contiguous"
ASSERT HIGH(wVWFWindow) == HIGH(wVWFWindowEnd), "both halves of wVWFWindow must fit in the same page"
; doing maths here that's why those two are preconditions
		ld a, l
		add 8
		ld l, a
		ld a, 8
		sub e
		ld d, a
; reload so we can do the left shift
		ld a, [bc]
.sl
		sla a
		dec d
		jr nz, .sl
; blit the other half
		or [hl]
		ld [hl], a
		ld a, l
		sub 8
		ld l, a
; hl restored to point to the first half
	pop de ; restore counter + shift
	jr .next
.blit
	ld a, [bc]
	or [hl]
	ld [hl], a
.next
	inc bc ; into GFX
	inc hl ; into target
	dec d  ; row count
	jr nz, .row

; done with this chara
	pop af
	rst Bankswitch
	ret

; prepare to transfer wVWFWindow
VWF_FinalizeTile:
	; guarded because if VBlank fires it'd discard the VWF tile
	; and render from (invalid) ROM instead
	di
	call RequestLoadCharacter_wTilemap
	ld a, LOW(wVWFWindow)
	ld [wCharacterTileSrc], a
	ld a, HIGH(wVWFWindow)
	ld [wCharacterTileSrc + 1], a
	ei
	ret

VWF_ShiftWindow:
	ld hl, wVWFBufferTile2
	ld de, wVWFBufferTile1
	ld b, 8
.loop
	ld a, [hl]
	ld [de], a
	xor a
	ld [hl], a
	inc hl
	inc de
	dec b
	jr nz, .loop
	ret

; initialize a new line
VWF_ResetLine::
	xor a
	ld [wVWFSubX], a
	ld hl, wVWFWindow
	ld b, 8 * 2
.loop:
	ld [hl], a
	inc hl
	dec b
	jr nz, .loop
	ret

; to prevent cutoffs, flush any pending tile on a line/cont/para/end
VWF_FlushPartial::
; nothing pending?
	ld a, [wVWFSubX]
	and a
	jr z, .done

; full?
	ld a, [wCharacterTilemapPos]
	cp 14
	jr nc, .done
	call VWF_FinalizeTile

; reveal pending tiles
	call CheckCharacter_Continue.QueueCharBGMapPointers
	ld a, 1
	ld [wCharacterBGMapTransferStatus], a
	xor a
	ldh [hVBlank], a
	call DelayFrame
	ld hl, wCharacterTilemapPos
	inc [hl]
.done:
	jp VWF_ResetLine
