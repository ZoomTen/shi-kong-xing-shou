MACRO farcall ; bank, address
	ld hl, \1
	ld b, BANK(\1)
	rst FarCall
ENDM

MACRO homecall
	ld a, [_BANKNUM]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
ENDM
