# Some code patterns to look for

## hl = $XXYY + a

```
	ld a, <somewhere>
	add $YY
	ld l, a
	ld a, $XX
	adc 0
	ld h, a
```
Adapt for bc or de.

Usually resolves to:
```
  ld a, <somewhere>
	add LOW(somewhere else)
	ld l, a
	ld a, HIGH(somewhere else)
	adc 0
	ld h, a
```

## hl = XXYY + maybe a constant

```
	ld bc, <some address>
	; ...
	ld hl, <a low value>
	add hl, bc
```

Usually access part of struct, bc = struct origin. Low hl value indicates this.

## 16-bit pointer stored as two consecutive bytes (lo, hi)

```
	ld a, l
	ld [wFoo], a
	ld a, h
	ld [wFoo + 1], a   ; NOT a separate wBar label
```

Matching load:
```
	ld a, [wFoo]
	ld l, a
	ld a, [wFoo + 1]
	ld h, a
```

`wFoo` declared `ds 2` in `wram.asm`. High byte always `wFoo + 1` — do **not** coin separate `wBar`/`wFooHi` label unless that byte also accessed independently (i.e. not part of paired lo/hi load or store).

## Call to function in xx:yyyy

```
	ld hl, yyyy
	ld b, xx
	rst FarCall
```

xx = bank, yyyy = address.

If function label available there, replace with macro:
```
	farcall SomeFunction
```

No function yet: create label form `Func_xx_yyyy`, plus `dr` shim/placeholder in correct `bank_xx.asm` file, so markable for further disassembly. Note: `dr` addresses = actual ROM addresses, not Game Boy memory addresses.

If farcall lands mid-function, split target function in two so farcall has valid target.