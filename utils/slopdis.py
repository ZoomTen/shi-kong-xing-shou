#!/usr/bin/env python3
# Repo-aware SM83 disassembler. Resolves symbols from shi_kong_xing_shou.sym.
#
# Usage:
#   utils/slopdis.py <start> <end> [bank]
#     <start>/<end> as bank:addr  e.g.  slopdis.py 05:576c 05:5900
#     or as raw ROM offsets with an explicit bank  e.g.  slopdis.py 1576c 15900 05
#
# Paste the output over the matching `dr` line, then `make compare`.
import re
import sys

from lib.gbtool import addr2offset, offset2addr, read_symbols, str2addr

ROM = open("baserom.gbc", "rb").read()
SYM = read_symbols(open("shi_kong_xing_shou.sym").read())
# read_symbols keys both tables by ROM offset; 'ram' holds >$7fff (RAM/HRAM).
# It keeps only ONE name per offset, so a `Parent.local` may shadow the global
# at the same address (e.g. CopyBytes3 vs CopyBytes3.loop, both at $0b30).
# Build a global-only ROM map (no `.` names) so call/jp targets resolve to the
# real function label, not its first local.
GLOBAL_ROM = {}
import re as _re
for _line in open("shi_kong_xing_shou.sym"):
    _m = _re.match(r"\s*([0-9a-fA-F]+):([0-9a-fA-F]{4})\s+([\w.]+)", _line)
    if not _m:
        continue
    _name = _m.group(3)
    if "." in _name:
        continue
    _off = addr2offset(int(_m.group(1), 16), int(_m.group(2), 16))
    if int(_m.group(2), 16) < 0x8000:
        GLOBAL_ROM.setdefault(_off, _name)

def ram_label(addr):
    """RAM/HRAM symbol for a GB address, or None. RAM offset == GB address."""
    return SYM["ram"].get(addr)

def mem(addr):
    """Render a [$xxxx] memory operand using a RAM/HRAM symbol if present."""
    return ram_label(addr) or f"${addr:04x}"

def global_code_sym(addr, bank):
    """Global (non-local) code symbol at a GB address, or None.
    Ignores `Parent.local` labels so re-runs regenerate `.asm_` cleanly and
    mid-function entries resolve to the parent function label."""
    off = addr2offset(0 if addr < 0x4000 else bank, addr)
    return GLOBAL_ROM.get(off)

def code_label(addr, bank):
    """jp/call target: in-bank/home label if known, else raw $xxxx."""
    return global_code_sym(addr, bank) or f"${addr:04x}"

def is_code_sym(addr, bank):
    return global_code_sym(addr, bank) is not None

def ld16_label(v, bank):
    """ld rr, nn operand: RAM sym, then global in-bank/home code sym, else raw."""
    return ram_label(v) or global_code_sym(v, bank) or f"${v:04x}"

# --- decode tables --------------------------------------------------------
r8 = ["b", "c", "d", "e", "h", "l", "[hl]", "a"]
r16 = ["bc", "de", "hl", "sp"]
r16s = ["bc", "de", "hl", "af"]
cc = ["nz", "z", "nc", "c"]
# repo convention: ALU ops drop the implicit `a` operand (add c, adc 0, sub $10)
alu = ["add", "adc", "sub", "sbc", "and", "xor", "or", "cp"]

def i8(p):
    v = ROM[p]
    return v - 256 if v >= 128 else v

def u16(p):
    return ROM[p] | (ROM[p + 1] << 8)

def cb(op):
    reg = r8[op & 7]
    idx = (op >> 3) & 7
    if op < 0x40:
        return ["rlc", "rrc", "rl", "rr", "sla", "sra", "swap", "srl"][idx] + " " + reg
    if op < 0x80:
        return f"bit {idx}, {reg}"
    if op < 0xC0:
        return f"res {idx}, {reg}"
    return f"set {idx}, {reg}"

def alu_op(y, operand):
    return f"{alu[y]} {operand}"

def decode(start, end, bank):
    """First pass: decode to list of [gb_addr, mnemonic, jump_target_or_None].
    start/end are ROM offsets; gb_addr is the Game Boy address."""
    base = addr2offset(bank, 0x4000) - 0x4000 if bank else 0
    out = []
    p = start
    while p < end:
        a = p - base
        op = ROM[p]; p += 1
        x = op >> 6; y = (op >> 3) & 7; z = op & 7
        tgt = None
        if op == 0x00: m = "nop"
        elif op == 0x10: m = "stop"; p += 1
        elif op == 0x76: m = "halt"
        elif op == 0xF3: m = "di"
        elif op == 0xFB: m = "ei"
        elif op == 0xCB: m = cb(ROM[p]); p += 1
        elif op == 0xC9: m = "ret"
        elif op == 0xD9: m = "reti"
        elif op == 0xE9: m = "jp hl"
        elif op == 0xF9: m = "ld sp, hl"
        elif op == 0x08: m = f"ld [{mem(u16(p))}], sp"; p += 2
        elif op == 0x18:
            tgt = (a + 2 + i8(p)) & 0xFFFF; m = ("jr", tgt); p += 1
        elif op in (0x20, 0x28, 0x30, 0x38):
            tgt = (a + 2 + i8(p)) & 0xFFFF; m = (f"jr {cc[(op>>3)&3]},", tgt); p += 1
        elif op == 0xC3:
            tgt = u16(p); m = ("jp", tgt); p += 2
        elif op in (0xC2, 0xCA, 0xD2, 0xDA):
            tgt = u16(p); m = (f"jp {cc[y]},", tgt); p += 2
        elif op == 0xCD:
            tgt = u16(p); m = ("call", tgt); p += 2
        elif op in (0xC4, 0xCC, 0xD4, 0xDC):
            tgt = u16(p); m = (f"call {cc[y]},", tgt); p += 2
        elif op in (0xC0, 0xC8, 0xD0, 0xD8): m = f"ret {cc[y]}"
        elif op in (0xC7, 0xCF, 0xD7, 0xDF, 0xE7, 0xEF, 0xF7, 0xFF):
            m = "RST_FARCALL" if op == 0xF7 else f"rst ${y*8:02x}"
        elif op == 0xE0: m = f"ldh [{mem(0xFF00 | ROM[p])}], a"; p += 1
        elif op == 0xF0: m = f"ldh a, [{mem(0xFF00 | ROM[p])}]"; p += 1
        elif op == 0xE2: m = "ldh [c], a"
        elif op == 0xF2: m = "ldh a, [c]"
        elif op == 0xEA: m = f"ld [{mem(u16(p))}], a"; p += 2
        elif op == 0xFA: m = f"ld a, [{mem(u16(p))}]"; p += 2
        elif op == 0xE8: m = f"add sp, {i8(p)}"; p += 1
        elif op == 0xF8: m = f"ld hl, sp + {i8(p)}"; p += 1
        elif op in (0x01, 0x11, 0x21, 0x31):
            v = u16(p); m = f"ld {r16[y>>1]}, {ld16_label(v, bank)}"; p += 2
        elif op in (0x02, 0x12): m = f"ld [{r16[y>>1]}], a"
        elif op in (0x0A, 0x1A): m = f"ld a, [{r16[y>>1]}]"
        elif op == 0x22: m = "ld [hli], a"
        elif op == 0x32: m = "ld [hld], a"
        elif op == 0x2A: m = "ld a, [hli]"
        elif op == 0x3A: m = "ld a, [hld]"
        elif op in (0x03, 0x13, 0x23, 0x33): m = f"inc {r16[y>>1]}"
        elif op in (0x0B, 0x1B, 0x2B, 0x3B): m = f"dec {r16[y>>1]}"
        elif op in (0x09, 0x19, 0x29, 0x39): m = f"add hl, {r16[y>>1]}"
        elif (op & 0xC7) == 0x04: m = f"inc {r8[y]}"
        elif (op & 0xC7) == 0x05: m = f"dec {r8[y]}"
        elif (op & 0xC7) == 0x06: m = f"ld {r8[y]}, ${ROM[p]:02x}"; p += 1
        elif op == 0x07: m = "rlca"
        elif op == 0x0F: m = "rrca"
        elif op == 0x17: m = "rla"
        elif op == 0x1F: m = "rra"
        elif op == 0x27: m = "daa"
        elif op == 0x2F: m = "cpl"
        elif op == 0x37: m = "scf"
        elif op == 0x3F: m = "ccf"
        elif x == 1: m = f"ld {r8[y]}, {r8[z]}"
        elif x == 2: m = alu_op(y, r8[z])
        elif x == 3 and z == 6: m = alu_op(y, f"${ROM[p]:02x}"); p += 1
        elif op in (0xC1, 0xD1, 0xE1, 0xF1): m = f"pop {r16s[y>>1]}"
        elif op in (0xC5, 0xD5, 0xE5, 0xF5): m = f"push {r16s[y>>1]}"
        else: m = f"db ${op:02x} ; ILLEGAL"
        out.append([a, m, tgt, p, op])  # p = byte after this instr; op = first byte
    return out

# opcodes a normal function rarely contains; their presence in a fresh `dr`
# usually means the bytes are data being mis-decoded as code
ILLEGAL_OPS = {0xD3, 0xDB, 0xDD, 0xE3, 0xE4, 0xEB, 0xEC, 0xED, 0xF4, 0xFC, 0xFD}
SP_OPS = {0x31, 0xF9, 0xE8, 0xF8}  # ld sp,nn / ld sp,hl / add sp,n / ld hl,sp+n
TERMINATORS = {0xC9, 0xD9, 0xC3, 0xE9, 0x18} | {  # ret reti jp jp[hl] jr
    0xC7, 0xCF, 0xD7, 0xDF, 0xE7, 0xEF, 0xF7, 0xFF}  # rst

def suspicions(ins, run_threshold=6):
    """Heuristics that a decoded `dr` block may actually be data, not code.
    Strong signals fire on their own; the weak no-terminator signal only
    fires alongside a strong one (a code function may legitimately fall
    through into the next, ending on a non-terminator)."""
    warns = []
    ops = [i[4] for i in ins]
    n_illegal = sum(o in ILLEGAL_OPS for o in ops)
    if n_illegal:
        warns.append(f"{n_illegal} illegal/undefined opcode(s)")
    n_sp = sum(o in SP_OPS for o in ops)
    if n_sp:
        warns.append(f"{n_sp} stack-pointer op(s) (ld sp / add sp) — rare in code")
    # longest run of ld r,r (opcodes $40-$7f minus halt $76)
    run = best = 0
    for o in ops:
        if 0x40 <= o <= 0x7F and o != 0x76:
            run += 1; best = max(best, run)
        else:
            run = 0
    if best >= run_threshold:
        warns.append(f"run of {best} consecutive `ld r, r` — looks like raw bytes")
    if warns and ops and ops[-1] not in TERMINATORS:
        warns.append("...and does not end on a terminator (ret/jp/jr/rst)")
    return warns

def disassemble(start, end, bank):
    ins = decode(start, end, bank)
    addrs = {i[0] for i in ins}
    # any in-range jump target on an instruction boundary gets a local label,
    # unless a global symbol already names it
    locals_ = {}
    for a, m, tgt, _, _ in ins:
        if tgt is None:
            continue
        if tgt in addrs and not is_code_sym(tgt, bank):
            locals_[tgt] = f".asm_{tgt:04x}"
    # An unconditional terminator whose following address has no label means
    # the bytes after it are unreachable by fall-through — a likely boundary
    # (next function, or data). Mark it speculatively so it isn't missed.
    # NB: rst is excluded — most rst vectors (e.g. FarCall) return, so control
    # continues past them.
    UNCOND = {0xC9, 0xD9, 0xC3, 0xE9, 0x18}  # ret reti jp jp[hl] jr
    next_addr = {ins[i][0]: ins[i + 1][0] for i in range(len(ins) - 1)}
    lines = []
    for a, m, tgt, _, op in ins:
        if a in locals_:
            lines.append(locals_[a])
        if isinstance(m, tuple):
            mnem, t = m
            label = locals_.get(t) or code_label(t, bank)
            lines.append(f"\t{mnem} {label}")
        elif m == "RST_FARCALL":
            lines.append("\trst FarCall  ; preceding ld hl/ld b set b:hl")
        else:
            lines.append("\t" + m)
        nxt = next_addr.get(a)
        if op in UNCOND and nxt is not None and nxt not in locals_:
            name = global_code_sym(nxt, bank)
            if name:
                lines.append(f"\n{name}:")
            else:
                lines.append(f"\n; speculative boundary — new function or data?")
                lines.append(f"unk_{bank:03x}_{nxt:04x}:")
    return "\n".join(lines), suspicions(ins)

def upper_hex(text):
    # repo style: uppercase hex digits inside $.. literals (symbols untouched)
    return re.sub(r"\$([0-9a-fA-F]+)", lambda m: "$" + m.group(1).upper(), text)

def parse_arg(s, default_bank=None):
    """Accept bank:addr (-> ROM offset, bank) or a raw ROM offset."""
    if ":" in s:
        bank, addr = str2addr(s)
        return addr2offset(bank, addr), bank
    off = int(s, 16)
    bank = default_bank if default_bank is not None else offset2addr(off)[0]
    return off, bank

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(f"{sys.argv[0]} <start> <end> [bank]")
        print("\tstart/end as bank:addr (e.g. 05:576c) or raw ROM offset + bank arg")
        sys.exit(0)
    explicit_bank = int(sys.argv[3], 16) if len(sys.argv) > 3 else None
    s, bank = parse_arg(sys.argv[1], explicit_bank)
    e, _ = parse_arg(sys.argv[2], explicit_bank if explicit_bank is not None else bank)
    asm, warns = disassemble(s, e, bank)
    print(upper_hex(asm))
    if warns:
        # warnings to stderr so stdout stays a clean paste
        print("\n; !! may be DATA, not code:", file=sys.stderr)
        for w in warns:
            print(f";   - {w}", file=sys.stderr)
