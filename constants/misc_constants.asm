DEF _BANKNUM EQU $7fff

; overworld object array: structs of OBJECT_LENGTH based at wVisibleObjects
; (object 0 = player; +0 Y, +1 X, +2 active, +3 facing, +5 anim, +$d redraw)
DEF OBJECT_LENGTH EQU $20
DEF OBJECT_ACTIVE EQU 2
