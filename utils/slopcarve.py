#!/usr/bin/env python3
# Recursive-descent code/data carver built on slopdis.py.
# Splits a Func_ dr block into code regions (disassembled) + data regions
# (labeled `dr`), collapses ld hl/ld b/rst FarCall triples into `farcall`,
# and resolves in-range data-table refs to labels. Output is byte-exact;
# paste over the dr line(s) and `make compare`.
#
# Usage:
#   utils/slopcarve.py <start> <end> <bank>   (bank:addr or raw offsets + bank)
#   add --spec to also probe post-terminator function entries (RISKY on
#   data-heavy blocks: a $c9/$c3 byte in data can spawn a bogus entry -- always
#   eyeball the segmentation before trusting --spec).
import re, sys
sys.path.insert(0, __file__.rsplit('/', 1)[0])
import slopdis as S

ILLEGAL = {0xd3, 0xdb, 0xdd, 0xe3, 0xe4, 0xeb, 0xec, 0xed, 0xf4, 0xfc, 0xfd}
NOFALL = {0xc9, 0xd9, 0xc3, 0xe9, 0x18}  # ret reti jp jp[hl] jr -- no fall-through

def base_of(bank): return S.addr2offset(bank, 0x4000) - 0x4000 if bank else 0
def _one(a, bank, base):
    o = S.decode(base+a, base+a+3, bank)[0]; return o[3]-(base+a), o[4], o[2]  # len, op, tgt

def reachable(start, end, bank, entries):
    base = base_of(bank); code = {}; work = list(entries)
    while work:
        a = work.pop()
        if a in code or not (start <= a < end): continue
        L, op, tgt = _one(a, bank, base)
        if a+L > end: continue
        code[a] = L
        if op not in NOFALL: work.append(a+L)
        if tgt is not None and start <= tgt < end: work.append(tgt)
    return code

def regions(start, end, bank, entries):
    code = reachable(start, end, bank, entries); addrs = sorted(code)
    regs = []; i = 0
    while i < len(addrs):
        r0 = addrs[i]; r1 = addrs[i]+code[addrs[i]]; j = i+1
        while j < len(addrs) and addrs[j] == r1: r1 = addrs[j]+code[addrs[j]]; j += 1
        regs.append((r0, r1)); i = j
    segs = []; pos = start
    for r0, r1 in regs:
        if pos < r0: segs.append(('data', pos, r0))
        segs.append(('code', r0, r1)); pos = r1
    if pos < end: segs.append(('data', pos, end))
    return segs

def covers_clean(a, b, bank):
    base = base_of(bank); p = a
    while p < b:
        L, op, _ = _one(p, bank, base)
        if op in ILLEGAL or p+L > b: return False
        p += L
    return p == b

def plausible(a, end, bank, limit=700):
    base = base_of(bank); p = a
    while p < min(a+limit, end):
        L, op, _ = _one(p, bank, base)
        if op in ILLEGAL or p+L > end: return False
        if op in NOFALL: return True
        p += L
    return False

def data_refs(segs, start, end, bank):
    base = base_of(bank); refs = set()
    for k, a, b in segs:
        if k != 'code': continue
        for ia, m, tgt, _, op in S.decode(base+a, base+b, bank):
            if isinstance(m, str):
                mm = re.match(r'ld (?:bc|de|hl), \$([0-9a-f]{4})$', m)
                if mm:
                    v = int(mm.group(1), 16)
                    if start <= v < end: refs.add(v)
    return refs

def find_entries(start, end, bank, spec=False):
    entries = {start}
    for _ in range(80):
        segs = regions(start, end, bank, entries)
        refs = data_refs(segs, start, end, bank)
        code = set(reachable(start, end, bank, entries))
        added = False
        for k, a, b in segs:  # jump-table handlers: data that decodes clean & isn't a data table
            if k == 'data' and a not in refs and a not in entries and covers_clean(a, b, bank):
                entries.add(a); added = True
        if spec:  # separate functions starting right after a terminator
            for a in list(code):
                L, op, _ = _one(a, bank, base_of(bank))
                nx = a+L
                if op in NOFALL and start <= nx < end and nx not in code and nx not in entries \
                        and nx not in refs and plausible(nx, end, bank):
                    entries.add(nx); added = True
        if not added: break
    return entries

def farcall_target(hl, b, bank):
    off = hl if hl < 0x4000 else S.addr2offset(b, hl)
    lbl = S.GLOBAL_ROM.get(off)
    if not lbl: return None
    want = 0 if hl < 0x4000 else b
    return lbl if S.GLOBAL_ROM.get(hl if hl < 0x4000 else S.addr2offset(want, hl)) == lbl else None

def emit(start, end, bank, spec=False, entries=None):
    if entries is None: entries = find_entries(start, end, bank, spec)
    segs = regions(start, end, bank, entries)
    refs = data_refs(segs, start, end, bank)
    base = base_of(bank)
    segs2 = []
    for k, a, b in segs:
        if k == 'code': segs2.append((k, a, b)); continue
        prev = a
        for c in sorted(x for x in refs if a < x < b): segs2.append(('data', prev, c)); prev = c
        segs2.append(('data', prev, b))
    all_ins = []
    for k, a, b in segs2:
        if k == 'code': all_ins += S.decode(base+a, base+b, bank)
    addrs = {i[0] for i in all_ins}
    locals_ = {}
    for a, m, tgt, _, _ in all_ins:
        if tgt is not None and tgt in addrs and not S.is_code_sym(tgt, bank):
            locals_[tgt] = f".asm_{tgt:04x}"
    for e in entries:
        if e != start and e not in locals_ and not S.is_code_sym(e, bank):
            locals_[e] = f".asm_{e:04x}"
    # data label: global `unk_` if nothing else follows (shareable), else local
    data_lbl = {}
    for idx, (k, a, b) in enumerate(segs2):
        if k != 'data': continue
        code_after = any(kk == 'code' for kk, aa, bb in segs2[idx+1:])
        data_lbl[a] = f".data_{a:04x}" if code_after else f"unk_{bank:03x}_{a:04x}"
    out = []
    for k, a, b in segs2:
        if k == 'data':
            out.append(f"{data_lbl[a]}:"); out.append(f"\tdr ${base+a:x}, ${base+b:x}")
            continue
        ins = S.decode(base+a, base+b, bank); i = 0
        while i < len(ins):
            ia, m, tgt, p, op = ins[i]
            if (op == 0x21 and i+2 < len(ins) and ins[i+1][4] == 0x06 and ins[i+2][4] == 0xF7
                    and ins[i+1][0] not in locals_ and ins[i+2][0] not in locals_):
                hl = S.ROM[base+ia+1] | (S.ROM[base+ia+2] << 8)
                lbl = farcall_target(hl, S.ROM[base+ins[i+1][0]+1], bank)
                if lbl:
                    if ia in locals_: out.append(locals_[ia])
                    out.append(f"\tfarcall {lbl}"); i += 3; continue
            if ia in locals_: out.append(locals_[ia])
            if isinstance(m, tuple):
                mnem, t = m; out.append(f"\t{mnem} {locals_.get(t) or data_lbl.get(t) or S.code_label(t, bank)}")
            elif m == "RST_FARCALL": out.append("\trst FarCall")
            else: out.append("\t" + m)
            i += 1
    s = "\n".join(out)
    for a, lbl in data_lbl.items():
        s = re.sub(rf"(?<![0-9A-Fa-f])\${a:04x}(?![0-9A-Fa-f])", lbl, s)
    return S.upper_hex(s)

if __name__ == "__main__":
    args = [x for x in sys.argv[1:] if x != "--spec"]
    spec = "--spec" in sys.argv
    s, bank = S.parse_arg(args[0], int(args[2], 16) if len(args) > 2 else None)
    e, _ = S.parse_arg(args[1], bank)
    sa, ea = s - base_of(bank), e - base_of(bank)
    print(emit(sa, ea, bank, spec))
