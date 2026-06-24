; rst vectors

SECTION "rst 8", ROM0
_hl_::
	jp hl

SECTION "rst Bankswitch", ROM0
Bankswitch::
	ld [wLoadedROMBank], a
	ld [rROMB0], a
	ret

SECTION "rst Farcall", ROM0
; Call b:hl.
FarCall::
	ld a, [_BANKNUM]
	push af
	ld a, b
	rst Bankswitch
	rst _hl_
	pop af
; SECTION "rst38"
	rst Bankswitch
	ret

; Game Boy hardware interrupts

SECTION "int Vblank", ROM0
	jp VBlank
	ret

SECTION "int LCD", ROM0
	jp LCD
	ret

SECTION "init", ROM0
Init::
	push af
	di
; "trampoline" jump to some in-RAM code that
; writes a bunch of bytes (maybe multicart-related?)
; and only then actually starts the game.
	ld de, .DoInitWrites
	ld hl, $c000
; this is a little more than how big DoInitWrites actually is
; it's probably guesswork and then some slack
	ld bc, $20
	call .CopyBytes
	jp $c000
.CopyBytes:
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
.DoInitWrites:
	ld a, $aa
	ld [$5180], a
	ld a, $3a
	ld [$7180], a
	ld a, $07
	ld [$7180], a
	pop af
	jp _Start


SECTION "GB header", ROM0
Start::
	jp Init
