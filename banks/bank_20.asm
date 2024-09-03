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
	dw .face_00
	dw .face_01
	dw .face_02
	dw .face_03
	dw .face_04
	dw .face_05
	dw .face_06
	dw .face_07
	dw .face_08
	dw .face_09
	dw .face_10
	dw .face_11
	dw .face_12
	dw .face_13
	dw .face_14
	dw .face_15
	dw .face_16
	dw .face_17
	dw .face_18
	dw .face_19
	dw .face_20
	dw .face_21
	dw .face_22
	dw .face_23
	dw .face_24
	dw .face_25
	dw .face_26
	dw .face_27
	dw .face_28
	dw .face_29
	dw .face_30
	dw .face_31
	dw .face_32
	dw .face_33
	dw .face_34
	dw .face_35
	dw .face_36
	dw .face_37
	dw .face_38
	dw .face_39
	dw .face_40
	dw .face_41
	dw .face_00 ; 42
	dw .face_00 ; 43
	dw .face_00 ; 44
	dw .face_00 ; 45
	dw .face_00 ; 46
	dw .face_47
	dw .face_48
	dw .face_49
	dw .face_50
	dw .face_51
	dw .face_51 ; 52
	dw .face_51 ; 53
	dw .face_51 ; 54
	dw .face_55
	dw .face_55 ; 56
	dw .face_55 ; 57

.face_01:: INCBIN "gfx/faces/face_01.obj.gbcpal"
.face_02:: INCBIN "gfx/faces/face_02.obj.gbcpal"
.face_03:: INCBIN "gfx/faces/face_03.obj.gbcpal"
.face_04:: INCBIN "gfx/faces/face_04.obj.gbcpal"
.face_05:: INCBIN "gfx/faces/face_05.obj.gbcpal"
.face_06:: INCBIN "gfx/faces/face_06.obj.gbcpal"
.face_07:: INCBIN "gfx/faces/face_07.obj.gbcpal"
.face_08:: INCBIN "gfx/faces/face_08.obj.gbcpal"
.face_09:: INCBIN "gfx/faces/face_09.obj.gbcpal"
.face_10:: INCBIN "gfx/faces/face_10.obj.gbcpal"
.face_11:: INCBIN "gfx/faces/face_11.obj.gbcpal"
.face_12:: INCBIN "gfx/faces/face_12.obj.gbcpal"
.face_13:: INCBIN "gfx/faces/face_13.obj.gbcpal"
.face_14:: INCBIN "gfx/faces/face_14.obj.gbcpal"
.face_15:: INCBIN "gfx/faces/face_15.obj.gbcpal"
.face_16:: INCBIN "gfx/faces/face_16.obj.gbcpal"
.face_17:: INCBIN "gfx/faces/face_17.obj.gbcpal"
.face_18:: INCBIN "gfx/faces/face_18.obj.gbcpal"
.face_19:: INCBIN "gfx/faces/face_19.obj.gbcpal"
.face_20:: INCBIN "gfx/faces/face_20.obj.gbcpal"
.face_21:: INCBIN "gfx/faces/face_21.obj.gbcpal"
.face_22:: INCBIN "gfx/faces/face_22.obj.gbcpal"
.face_23:: INCBIN "gfx/faces/face_23.obj.gbcpal"
.face_24:: INCBIN "gfx/faces/face_24.obj.gbcpal"
.face_25:: INCBIN "gfx/faces/face_25.obj.gbcpal"
.face_26:: INCBIN "gfx/faces/face_26.obj.gbcpal"
.face_27:: INCBIN "gfx/faces/face_27.obj.gbcpal"
.face_28:: INCBIN "gfx/faces/face_28.obj.gbcpal"
.face_29:: INCBIN "gfx/faces/face_29.obj.gbcpal"
.face_30:: INCBIN "gfx/faces/face_30.obj.gbcpal"
.face_31:: INCBIN "gfx/faces/face_31.obj.gbcpal"
.face_32:: INCBIN "gfx/faces/face_32.obj.gbcpal"
.face_33:: INCBIN "gfx/faces/face_33.obj.gbcpal"
.face_34:: INCBIN "gfx/faces/face_34.obj.gbcpal"
.face_35:: INCBIN "gfx/faces/face_35.obj.gbcpal"
.face_36:: INCBIN "gfx/faces/face_36.obj.gbcpal"
.face_37:: INCBIN "gfx/faces/face_37.obj.gbcpal"
.face_38:: INCBIN "gfx/faces/face_38.obj.gbcpal"
.face_39:: INCBIN "gfx/faces/face_39.obj.gbcpal"
.face_40:: INCBIN "gfx/faces/face_40.obj.gbcpal"
.face_41:: INCBIN "gfx/faces/face_41.obj.gbcpal"
.face_00:: INCBIN "gfx/faces/face_00.obj.gbcpal"
.face_47:: INCBIN "gfx/faces/face_47.obj.gbcpal"
.face_48:: INCBIN "gfx/faces/face_48.obj.gbcpal"
.face_49:: INCBIN "gfx/faces/face_49.obj.gbcpal"
.face_50:: INCBIN "gfx/faces/face_50.obj.gbcpal"
.face_51:: INCBIN "gfx/faces/face_51.obj.gbcpal"
.face_55:: INCBIN "gfx/faces/face_55.obj.gbcpal"

FacePicExtrasPointers:
	dw .face_00
	dw .face_01
	dw .face_02
	dw .face_03
	dw .face_04
	dw .face_05
	dw .face_06
	dw .face_07
	dw .face_08
	dw .face_09
	dw .face_10
	dw .face_11
	dw .face_12
	dw .face_13
	dw .face_14
	dw .face_15
	dw .face_16
	dw .face_17
	dw .face_18
	dw .face_19
	dw .face_20
	dw .face_21
	dw .face_22
	dw .face_23
	dw .face_24
	dw .face_25
	dw .face_26
	dw .face_27
	dw .face_28
	dw .face_29
	dw .face_30
	dw .face_31
	dw .face_32
	dw .face_33
	dw .face_34
	dw .face_35
	dw .face_36
	dw .face_37
	dw .face_38
	dw .face_39
	dw .face_40
	dw .face_41
	dw .face_42
	dw .face_43
	dw .face_44
	dw .face_45
	dw .face_46
	dw .face_47
	dw .face_48
	dw .face_49
	dw .face_50
	dw .face_51
	dw .face_52
	dw .face_53
	dw .face_54
	dw .face_55
	dw .face_56
	dw .face_57

	; blank for some reason
	ds $100

.face_00:: 	INCBIN "gfx/faces/face_00.obj.2bpp"
.face_01:: 	INCBIN "gfx/faces/face_01.obj.2bpp"
.face_02:: 	INCBIN "gfx/faces/face_02.obj.2bpp"
.face_03:: 	INCBIN "gfx/faces/face_03.obj.2bpp"
.face_04:: 	INCBIN "gfx/faces/face_04.obj.2bpp"
.face_05:: 	INCBIN "gfx/faces/face_05.obj.2bpp"
.face_06:: 	INCBIN "gfx/faces/face_06.obj.2bpp"
.face_07:: 	INCBIN "gfx/faces/face_07.obj.2bpp"
.face_08:: 	INCBIN "gfx/faces/face_08.obj.2bpp"
.face_09:: 	INCBIN "gfx/faces/face_09.obj.2bpp"
.face_10:: 	INCBIN "gfx/faces/face_10.obj.2bpp"
.face_11:: 	INCBIN "gfx/faces/face_11.obj.2bpp"
.face_12:: 	INCBIN "gfx/faces/face_12.obj.2bpp"
.face_13:: 	INCBIN "gfx/faces/face_13.obj.2bpp"
.face_14:: 	INCBIN "gfx/faces/face_14.obj.2bpp"
.face_15:: 	INCBIN "gfx/faces/face_15.obj.2bpp"
.face_16:: 	INCBIN "gfx/faces/face_16.obj.2bpp"
.face_17:: 	INCBIN "gfx/faces/face_17.obj.2bpp"
.face_18:: 	INCBIN "gfx/faces/face_18.obj.2bpp"
.face_19:: 	INCBIN "gfx/faces/face_19.obj.2bpp"
.face_20:: 	INCBIN "gfx/faces/face_20.obj.2bpp"
.face_21:: 	INCBIN "gfx/faces/face_21.obj.2bpp"
.face_22:: 	INCBIN "gfx/faces/face_22.obj.2bpp"
.face_23:: 	INCBIN "gfx/faces/face_23.obj.2bpp"
.face_24:: 	INCBIN "gfx/faces/face_24.obj.2bpp"
.face_25:: 	INCBIN "gfx/faces/face_25.obj.2bpp"
.face_26:: 	INCBIN "gfx/faces/face_26.obj.2bpp"
.face_27:: 	INCBIN "gfx/faces/face_27.obj.2bpp"
.face_28:: 	INCBIN "gfx/faces/face_28.obj.2bpp"
.face_29:: 	INCBIN "gfx/faces/face_29.obj.2bpp"
.face_30:: 	INCBIN "gfx/faces/face_30.obj.2bpp"
.face_31:: 	INCBIN "gfx/faces/face_31.obj.2bpp"
.face_32:: 	INCBIN "gfx/faces/face_32.obj.2bpp"
.face_33:: 	INCBIN "gfx/faces/face_33.obj.2bpp"
.face_34:: 	INCBIN "gfx/faces/face_34.obj.2bpp"
.face_35:: 	INCBIN "gfx/faces/face_35.obj.2bpp"
.face_36:: 	INCBIN "gfx/faces/face_36.obj.2bpp"
.face_37:: 	INCBIN "gfx/faces/face_37.obj.2bpp"
.face_38:: 	INCBIN "gfx/faces/face_38.obj.2bpp"
.face_39:: 	INCBIN "gfx/faces/face_39.obj.2bpp"
.face_40:: 	INCBIN "gfx/faces/face_40.obj.2bpp"
.face_41:: 	INCBIN "gfx/faces/face_41.obj.2bpp"
.face_42:: 	INCBIN "gfx/faces/face_42.obj.2bpp"
.face_43:: 	INCBIN "gfx/faces/face_43.obj.2bpp"
.face_44:: 	INCBIN "gfx/faces/face_44.obj.2bpp"
.face_45:: 	INCBIN "gfx/faces/face_45.obj.2bpp"
.face_46:: 	INCBIN "gfx/faces/face_46.obj.2bpp"
.face_47:: 	INCBIN "gfx/faces/face_47.obj.2bpp"
.face_48:: 	INCBIN "gfx/faces/face_48.obj.2bpp"
.face_49:: 	INCBIN "gfx/faces/face_49.obj.2bpp"
.face_50:: 	INCBIN "gfx/faces/face_50.obj.2bpp"
.face_51:: 	INCBIN "gfx/faces/face_51.obj.2bpp"
.face_52:: 	INCBIN "gfx/faces/face_52.obj.2bpp"
.face_53:: 	INCBIN "gfx/faces/face_53.obj.2bpp"
.face_54:: 	INCBIN "gfx/faces/face_54.obj.2bpp"
.face_55:: 	INCBIN "gfx/faces/face_55.obj.2bpp"
.face_56:: 	INCBIN "gfx/faces/face_56.obj.2bpp"
.face_57:: 	INCBIN "gfx/faces/face_57.obj.2bpp"

