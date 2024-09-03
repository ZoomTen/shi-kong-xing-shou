Func_009_4000::
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	jr Func_009_4010

Func_009_4008::
; Only run on every other tick
	ldh a, [hFF9D]
	and 1
	ret nz

	ld bc, wcd40

Func_009_4010:
	dr $24010, $24193

unk_009_4193:
	dr $24193, $24330
