; rst vectors (called through the rst instruction)

SECTION "rst08", ROM0[$0008]
_hl_::
	jp hl

SECTION "rst20", ROM0[$0020]
Bankswitch::
	ld [wLoadedROMBank], a
	ld [rROMB0], a
	ret

SECTION "rst30", ROM0[$0030]
FarCall::
; Call b:hl.
	ld a, [_BANKNUM]
	push af
	ld a, b
	rst Bankswitch
	rst _hl_
	pop af
; SECTION "rst38", ROM0[$0038]
	rst Bankswitch
	ret


; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank
	ret

SECTION "lcd", ROM0[$0048]
	jp LCD
	ret


SECTION "Header Code", ROM0[$00b0]
Init::
	push af
	di
; "trampoline" jump to some in-RAM code that
; writes a bunch of bytes (maybe multicart-related?)
; and only then actually starts the game.
	ld de, DoInitWrites
	ld hl, $c000
; this is a little more than how big DoInitWrites actually is
; it's probably guesswork and then some slack
	ld bc, $20
	call CopyBytes
	jp $c000

CopyBytes::
; Copy bc bytes from de to hl
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

DoInitWrites::
	ld a, $aa
	ld [$5180], a
	ld a, $3a
	ld [$7180], a
	ld a, $07
	ld [$7180], a
	pop af
	jp _Start


SECTION "Header", ROM0[$0100]

Start::
	jp Init

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00
