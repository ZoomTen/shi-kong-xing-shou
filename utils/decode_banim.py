#!/usr/bin/env python3
# BattleAnim VM decoder (bank 23). State machine via Mode_StateJumpTable (bank 2e).
# Stream = state, operands, state, ... ; terminator = state 3.
# Block states (15,59,61,67,68) = [state][N][N inline bytes].
import sys
# state -> fixed operand byte count (None = block state)
NB={0:0,1:0,2:5,3:0,4:5,5:4,6:2,7:2,8:2,9:5,10:1,11:4,12:0,13:0,14:3,15:None,
16:0,17:2,18:2,19:0,20:0,21:0,22:0,23:1,24:2,25:1,26:1,27:2,28:7,29:1,30:1,31:0,
32:7,33:0,34:0,35:2,36:0,37:0,38:0,39:0,40:2,41:0,42:0,43:0,44:0,45:0,46:0,47:0,
48:1,49:0,50:0,51:1,52:0,53:0,54:0,55:0,56:1,57:0,58:0,59:None,60:0,61:None,62:2,
63:2,64:0,65:1,66:1,67:None,68:None,69:2,70:2,71:3,72:3,73:0,74:0,75:0,76:0,77:0,
78:0,79:0,80:1}
BLOCK={15,59,61,67,68}
TERM=3

def decode(data):
    """Return (ops, consumed). ops = list of (state, [operand bytes])."""
    i=0; out=[]
    while i < len(data):
        st=data[i]
        if st not in NB: return out, i
        if st in BLOCK:
            if i+1>=len(data): return out, i
            n=data[i+1]
            need=1+n
            if i+1+need>len(data): return out, i
            out.append((st, list(data[i+1:i+1+need]))); i+=1+need
        else:
            n=NB[st]
            if i+1+n>len(data): return out, i
            out.append((st, list(data[i+1:i+1+n]))); i+=1+n
        if st==TERM: return out, i
    return out, i

if __name__=='__main__':
    rom=open('/root/projects/skxs/baserom.gbc','rb').read()
    s=int(sys.argv[1],16); e=int(sys.argv[2],16)
    ops,c=decode(rom[s:e])
    for st,args in ops:
        print('\tanim_%02d%s'%(st, (' '+', '.join('$%02x'%a for a in args)) if args else ''))
    print('; consumed %d / %d  last_state=%s'%(c, e-s, ops[-1][0] if ops else None))
