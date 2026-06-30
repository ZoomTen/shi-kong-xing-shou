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
	ld hl, wLCDFunction
	ld [hl], LOW(LCDSplit_A_HW)
	inc hl
	ld [hl], HIGH(LCDSplit_A_HW)
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
	ld hl, wLCDFunction
	ld [hl], LOW(LCDSplit_A_Window)
	inc hl
	ld [hl], HIGH(LCDSplit_A_Window)
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
	ld hl, wLCDFunction
	ld [hl], LOW(LCDSplit_B_HW)
	inc hl
	ld [hl], HIGH(LCDSplit_B_HW)
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
	ld hl, wLCDFunction
	ld [hl], LOW(LCDSplit_B_Window)
	inc hl
	ld [hl], HIGH(LCDSplit_B_Window)
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
	ld hl, wLCDFunction
	ld [hl], LOW(LCDSplit_C_Custom)
	inc hl
	ld [hl], HIGH(LCDSplit_C_Custom)
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
	ld hl, wLCDFunction
	ld [hl], LOW(LCDSplit_C_HW)
	inc hl
	ld [hl], HIGH(LCDSplit_C_HW)
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
	ld hl, wLCDFunction
	ld [hl], LOW(LCDSplit_C_Window)
	inc hl
	ld [hl], HIGH(LCDSplit_C_Window)
	jp Finish_LCD

