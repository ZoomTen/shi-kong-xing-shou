LCDSplit_Idle::
	jp Finish_LCD

LCDSplit_SetScroll::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	jp Finish_LCD

LCDSplit_A_Window::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, $80
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $9a
	inc hl
	ld [hl], $10
	jp Finish_LCD

LCDSplit_A_HW::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, $20
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $7f
	inc hl
	ld [hl], $10
	jp Finish_LCD

LCDSplit_B_Window::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, $60
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $d0
	inc hl
	ld [hl], $10
	jp Finish_LCD

LCDSplit_B_HW::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $b5
	inc hl
	ld [hl], $10
	jp Finish_LCD

LCDSplit_C_Window::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, [wd98f]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $07
	inc hl
	ld [hl], $11
	jp Finish_LCD

LCDSplit_C_Custom::
	ld a, [wd9ab]
	ldh [rSCX], a
	ld a, [wd9ac]
	ldh [rSCY], a
	di
	ld a, [wd990]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $23
	inc hl
	ld [hl], $11
	jp Finish_LCD

LCDSplit_C_HW::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, [wd98c]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $eb
	inc hl
	ld [hl], $10
	jp Finish_LCD

