WaitLCD_STAT::
.wait
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait
; ???
.wait2
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait2
	ret
