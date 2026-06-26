; Type-effectiveness chart. 9 row-pointers indexed by ATTACKER type (wd8ff, from MoveTypes);
; each row = 9 multipliers in TENTHS ($0a=x1.0, $08=x0.8, $05=x0.5, $0d=x1.3), col by DEFENDER type.
; Applied as the wd9c7 term via ComputeTypeEffectiveness in the damage formula.
TypeMatchupChart::
	dw TypeMatchupChart_42ed
	dw TypeMatchupChart_42ed
	dw TypeMatchupChart_42f6
	dw TypeMatchupChart_42ff
	dw TypeMatchupChart_4308
	dw TypeMatchupChart_4311
	dw TypeMatchupChart_431a
	dw TypeMatchupChart_4323
	dw TypeMatchupChart_432c
TypeMatchupChart_42ed::
	db $0a, $08, $05, $0a, $0a, $0a, $0a, $0d, $0a
TypeMatchupChart_42f6::
	db $0a, $0d, $08, $05, $0a, $0a, $0a, $0a, $0a
TypeMatchupChart_42ff::
	db $0a, $0a, $0d, $08, $0a, $0a, $0a, $05, $0a
TypeMatchupChart_4308::
	db $0a, $0a, $0a, $0a, $08, $05, $0a, $0a, $0d
TypeMatchupChart_4311::
	db $0a, $0a, $0a, $0a, $0d, $08, $05, $0a, $0a
TypeMatchupChart_431a::
	db $0a, $0a, $0a, $0a, $0a, $0d, $08, $0a, $05
TypeMatchupChart_4323::
	db $0a, $05, $0a, $0d, $0a, $0a, $0a, $08, $0a
TypeMatchupChart_432c::
	db $0a, $0a, $0a, $0a, $05, $0a, $0d, $0a, $08
