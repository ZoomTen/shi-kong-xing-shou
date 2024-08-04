; party_struct members (see macros/wram.asm)
rsreset
DEF MON_SPECIES            rb   ; $00
DEF MON_LEVEL              rb   ; $01
DEF MON_HP                 rw   ; $02
DEF MON_EXP                rb 3 ; $04

DEF MON_MOVE1ID            rb   ; $07
DEF MON_MOVE1PP            rb   ; $08
DEF MON_MOVE1MAXPP         rb   ; $09
DEF MON_MOVE2ID            rb   ; $0a
DEF MON_MOVE2PP            rb   ; $0b
DEF MON_MOVE2MAXPP         rb   ; $0c
DEF MON_MOVE3ID            rb   ; $0d
DEF MON_MOVE3PP            rb   ; $0e
DEF MON_MOVE3MAXPP         rb   ; $0f
DEF MON_MOVE4ID            rb   ; $10
DEF MON_MOVE4PP            rb   ; $11
DEF MON_MOVE4MAXPP         rb   ; $12

DEF MON_STATUS             rb   ; $13
DEF MON_ITEM               rb   ; $14
DEF MON_UNK22              rb   ; $15
DEF PARTYMON_STRUCT_LENGTH EQU _RS
