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
Adapt accordingly for bc or de.

This usually resolves to:
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

This is usually used to access a part of a struct, where bc is the origin point of said struct.
Setting hl to a low value is usually indicative of such.

## Call to function in xx:yyyy

```
	ld hl, yyyy
	ld b, xx
	rst FarCall
```

xx is the bank, yyyy is the address.

If a function label is available there, replace this with the macro:
```
	farcall SomeFunction
```

If no such function is available yet, create a label for it in the form `Func_xx_yyyy`, and a `dr` shim/placeholder in the correct `bank_xx.asm` file, so that it can be marked for further disassembly. Keep in mind, again, that `dr` addresses are actual ROM addresses, and not Game Boy memory addresses.

If the farcall lands in the middle of a function, split the function it's pointing to in two just so the farcall has a valid target.
