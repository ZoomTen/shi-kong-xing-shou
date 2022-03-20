_LoadTextFaceExtraSprites::
; GBC only - overlays a sprite over the monochrome
;            facepic to enrich the colors
	ld de, FacePicExtrasPointers
	ld a, [wTextFaceID]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8700
	ld bc, $100
	call CopyBytesVRAM
	call DelayFrame
	ld de, FacePaletteExtrasPointers
	pop hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 1 palettes
	ld c, $88
	call LoadPalettes_OCPD
	ret

Func_020_402b:
	ld bc, wcaf0
	ld hl, 1 palettes
	add hl, bc
	ld c, l
	ld b, h
	ld hl, Palette_20_4040
	push bc
	pop de
	ld bc, 1 palettes
	call CopyBytes3
	ret

Palette_20_4040:
	RGB 21, 21, 21
	RGB 28, 18,  0
	RGB 31, 25, 17
	RGB 18, 24,  0

Func_20_4048:
	ld a, [wd08e]
	cp 3
	jr nz, Func_020_405b
	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, Func_020_405b
	call Func_020_402b
	ret

Func_020_405b:
	ld bc, wcaf0
	ld hl, 1 palettes
	add hl, bc
	ld c, l
	ld b, h
	ld de, FacePaletteExtrasPointers
	ld a, [wd08e]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	pop de
	ld bc, 1 palettes
	call CopyBytes3
	ret

Func_20_407b:
	ld de, FacePicExtrasPointers
	ld a, [wd9dd]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8e00
	ld bc, $100
	call CopyBytesVRAM

	ld bc, wcaf0
	ld hl, 1 palettes
	add hl, bc
	ld c, l
	ld b, h
	ld de, FacePaletteExtrasPointers
	ld a, [wd9dd]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	pop de
	ld bc, 1 palettes
	call CopyBytes3
	ret

FacePaletteExtrasPointers:
	dw unk_020_426e
	dw unk_020_4126
	dw unk_020_412e
	dw unk_020_4136
	dw unk_020_413e
	dw unk_020_4146
	dw unk_020_414e
	dw unk_020_4156
	dw unk_020_415e
	dw unk_020_4166
	dw unk_020_416e
	dw unk_020_4176
	dw unk_020_417e
	dw unk_020_4186
	dw unk_020_418e
	dw unk_020_4196
	dw unk_020_419e
	dw unk_020_41a6
	dw unk_020_41ae
	dw unk_020_41b6
	dw unk_020_41be
	dw unk_020_41c6
	dw unk_020_41ce
	dw unk_020_41d6
	dw unk_020_41de
	dw unk_020_41e6
	dw unk_020_41ee
	dw unk_020_41f6
	dw unk_020_41fe
	dw unk_020_4206
	dw unk_020_420e
	dw unk_020_4216
	dw unk_020_421e
	dw unk_020_4226
	dw unk_020_422e
	dw unk_020_4236
	dw unk_020_423e
	dw unk_020_4246
	dw unk_020_424e
	dw unk_020_4256
	dw unk_020_425e
	dw unk_020_4266
	dw unk_020_426e
	dw unk_020_426e
	dw unk_020_426e
	dw unk_020_426e
	dw unk_020_426e
	dw unk_020_4276
	dw unk_020_427e
	dw unk_020_4286
	dw unk_020_428e
	dw unk_020_4296
	dw unk_020_4296
	dw unk_020_4296
	dw unk_020_4296
	dw unk_020_429e
	dw unk_020_429e
	dw unk_020_429e

unk_020_4126:: dr $80126, $8012e
unk_020_412e:: dr $8012e, $80136
unk_020_4136:: dr $80136, $8013e
unk_020_413e:: dr $8013e, $80146
unk_020_4146:: dr $80146, $8014e
unk_020_414e:: dr $8014e, $80156
unk_020_4156:: dr $80156, $8015e
unk_020_415e:: dr $8015e, $80166
unk_020_4166:: dr $80166, $8016e
unk_020_416e:: dr $8016e, $80176
unk_020_4176:: dr $80176, $8017e
unk_020_417e:: dr $8017e, $80186
unk_020_4186:: dr $80186, $8018e
unk_020_418e:: dr $8018e, $80196
unk_020_4196:: dr $80196, $8019e
unk_020_419e:: dr $8019e, $801a6
unk_020_41a6:: dr $801a6, $801ae
unk_020_41ae:: dr $801ae, $801b6
unk_020_41b6:: dr $801b6, $801be
unk_020_41be:: dr $801be, $801c6
unk_020_41c6:: dr $801c6, $801ce
unk_020_41ce:: dr $801ce, $801d6
unk_020_41d6:: dr $801d6, $801de
unk_020_41de:: dr $801de, $801e6
unk_020_41e6:: dr $801e6, $801ee
unk_020_41ee:: dr $801ee, $801f6
unk_020_41f6:: dr $801f6, $801fe
unk_020_41fe:: dr $801fe, $80206
unk_020_4206:: dr $80206, $8020e
unk_020_420e:: dr $8020e, $80216
unk_020_4216:: dr $80216, $8021e
unk_020_421e:: dr $8021e, $80226
unk_020_4226:: dr $80226, $8022e
unk_020_422e:: dr $8022e, $80236
unk_020_4236:: dr $80236, $8023e
unk_020_423e:: dr $8023e, $80246
unk_020_4246:: dr $80246, $8024e
unk_020_424e:: dr $8024e, $80256
unk_020_4256:: dr $80256, $8025e
unk_020_425e:: dr $8025e, $80266
unk_020_4266:: dr $80266, $8026e
unk_020_426e:: dr $8026e, $80276
unk_020_4276:: dr $80276, $8027e
unk_020_427e:: dr $8027e, $80286
unk_020_4286:: dr $80286, $8028e
unk_020_428e:: dr $8028e, $80296
unk_020_4296:: dr $80296, $8029e
unk_020_429e:: dr $8029e, $802a6

FacePicExtrasPointers:
	dw unk_020_441a
	dw unk_020_451a
	dw unk_020_461a
	dw unk_020_471a
	dw unk_020_481a
	dw unk_020_491a
	dw unk_020_4a1a
	dw unk_020_4b1a
	dw unk_020_4c1a
	dw unk_020_4d1a
	dw unk_020_4e1a
	dw unk_020_4f1a
	dw unk_020_501a
	dw unk_020_511a
	dw unk_020_521a
	dw unk_020_531a
	dw unk_020_541a
	dw unk_020_551a
	dw unk_020_561a
	dw unk_020_571a
	dw unk_020_581a
	dw unk_020_591a
	dw unk_020_5a1a
	dw unk_020_5b1a
	dw unk_020_5c1a
	dw unk_020_5d1a
	dw unk_020_5e1a
	dw unk_020_5f1a
	dw unk_020_601a
	dw unk_020_611a
	dw unk_020_621a
	dw unk_020_631a
	dw unk_020_641a
	dw unk_020_651a
	dw unk_020_661a
	dw unk_020_671a
	dw unk_020_681a
	dw unk_020_691a
	dw unk_020_6a1a
	dw unk_020_6b1a
	dw unk_020_6c1a
	dw unk_020_6d1a
	dw unk_020_6e1a
	dw unk_020_6f1a
	dw unk_020_701a
	dw unk_020_711a
	dw unk_020_721a
	dw unk_020_731a
	dw unk_020_741a
	dw unk_020_751a
	dw unk_020_761a
	dw unk_020_771a
	dw unk_020_781a
	dw unk_020_791a
	dw unk_020_7a1a
	dw unk_020_7b1a
	dw unk_020_7c1a
	dw unk_020_7d1a

	; blank for some reason
	ds $100

unk_020_441a:: 	dr $8041a, $8051a
unk_020_451a:: 	dr $8051a, $8061a
unk_020_461a:: 	dr $8061a, $8071a
unk_020_471a:: 	dr $8071a, $8081a
unk_020_481a:: 	dr $8081a, $8091a
unk_020_491a:: 	dr $8091a, $80a1a
unk_020_4a1a:: 	dr $80a1a, $80b1a
unk_020_4b1a:: 	dr $80b1a, $80c1a
unk_020_4c1a:: 	dr $80c1a, $80d1a
unk_020_4d1a:: 	dr $80d1a, $80e1a
unk_020_4e1a:: 	dr $80e1a, $80f1a
unk_020_4f1a:: 	dr $80f1a, $8101a
unk_020_501a:: 	dr $8101a, $8111a
unk_020_511a:: 	dr $8111a, $8121a
unk_020_521a:: 	dr $8121a, $8131a
unk_020_531a:: 	dr $8131a, $8141a
unk_020_541a:: 	dr $8141a, $8151a
unk_020_551a:: 	dr $8151a, $8161a
unk_020_561a:: 	dr $8161a, $8171a
unk_020_571a:: 	dr $8171a, $8181a
unk_020_581a:: 	dr $8181a, $8191a
unk_020_591a:: 	dr $8191a, $81a1a
unk_020_5a1a:: 	dr $81a1a, $81b1a
unk_020_5b1a:: 	dr $81b1a, $81c1a
unk_020_5c1a:: 	dr $81c1a, $81d1a
unk_020_5d1a:: 	dr $81d1a, $81e1a
unk_020_5e1a:: 	dr $81e1a, $81f1a
unk_020_5f1a:: 	dr $81f1a, $8201a
unk_020_601a:: 	dr $8201a, $8211a
unk_020_611a:: 	dr $8211a, $8221a
unk_020_621a:: 	dr $8221a, $8231a
unk_020_631a:: 	dr $8231a, $8241a
unk_020_641a:: 	dr $8241a, $8251a
unk_020_651a:: 	dr $8251a, $8261a
unk_020_661a:: 	dr $8261a, $8271a
unk_020_671a:: 	dr $8271a, $8281a
unk_020_681a:: 	dr $8281a, $8291a
unk_020_691a:: 	dr $8291a, $82a1a
unk_020_6a1a:: 	dr $82a1a, $82b1a
unk_020_6b1a:: 	dr $82b1a, $82c1a
unk_020_6c1a:: 	dr $82c1a, $82d1a
unk_020_6d1a:: 	dr $82d1a, $82e1a
unk_020_6e1a:: 	dr $82e1a, $82f1a
unk_020_6f1a:: 	dr $82f1a, $8301a
unk_020_701a:: 	dr $8301a, $8311a
unk_020_711a:: 	dr $8311a, $8321a
unk_020_721a:: 	dr $8321a, $8331a
unk_020_731a:: 	dr $8331a, $8341a
unk_020_741a:: 	dr $8341a, $8351a
unk_020_751a:: 	dr $8351a, $8361a
unk_020_761a:: 	dr $8361a, $8371a
unk_020_771a:: 	dr $8371a, $8381a
unk_020_781a:: 	dr $8381a, $8391a
unk_020_791a:: 	dr $8391a, $83a1a
unk_020_7a1a:: 	dr $83a1a, $83b1a
unk_020_7b1a:: 	dr $83b1a, $83c1a
unk_020_7c1a:: 	dr $83c1a, $83d1a
unk_020_7d1a:: 	dr $83d1a, $83e1a

SECTION "banknum20", ROMX[$7fff], BANK[$20]
	db $20
