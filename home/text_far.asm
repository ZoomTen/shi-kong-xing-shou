; Far text jump handlers (English translation only).
;
; A TX_FAR ($fa) byte is followed by a 3-byte operand: address-low,
; address-high, bank (as emitted by the `tfarjump` macro). On reaching it the
; reader is redirected to that bank:address and continues reading there until
; the text's own terminator. This lets translated text be relocated out of an
; overflowing bank while a 4-byte stub stays at the original label (so pointer
; tables and `textface` BANK() assertions are unaffected).
;
; The handlers do NOT restore the ROM bank: the relocated text runs to its own
; terminator, and the caller's bank is restored by the outer wrappers --
; PrintText (home/scripting.asm) for dialogue, and the FarCall epilogue
; (home/header.asm) for menu/item text invoked via `farcall`. Known menu-text
; call sites return immediately after PrintMenuText, so leaving the far bank
; loaded is safe; a caller that read same-bank data after the text would need a
; bank save/restore here (via hFFD4, as MenuText_e7 does).
;
; On entry the dispatch loop has already done `ld a, [hli]` past the TX_FAR
; byte and pushed hl, so the pushed hl points at the operand's first byte.

Text_FarJump::
	pop hl
	ld a, [hli] ; address low
	ld e, a
	ld a, [hli] ; address high
	ld d, a
	ld a, [hli] ; bank
	rst Bankswitch
	ld h, d
	ld l, e
	push hl
	jp CheckCharacter

MenuText_FarJump::
	pop hl
	ld a, [hli] ; address low
	ld e, a
	ld a, [hli] ; address high
	ld d, a
	ld a, [hli] ; bank
	rst Bankswitch
	ld h, d
	ld l, e
	push hl
	jp Menu_CheckCharacter
