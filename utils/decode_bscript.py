#!/usr/bin/env python3
"""Decode the battle/screen-script VM (Func_025_424e dispatcher, Jumptable_025_42b3).
Used by bank 24 (battle) and bank 39 (screen) scripts.

Operand counts validated against bank 24 (61/63 linear-exact). Per-opcode operand
semantics drive label resolution:

  Operand roles:
    b        raw byte   (coord / index / count / page)
    w        raw word   (VRAM address $8000-$9fff, tile dimensions, length) -> stays hex
    p:<bank> ROM pointer, dereferenced in <bank>:
       p:self   -> the script's own bank (handler copies via current bank, no switch)
       p:0c     -> hard bank $0c (Func_135a / CopyBytesVRAM)
       p:arg    -> bank given by the immediately-preceding byte operand ($3f farcopy)
       p:rt     -> RUNTIME bank (hFFD4, set by the invoking context) -- NOT statically
                   resolvable; emitted as raw hex + NEEDS_LABEL note. Do NOT guess a bank
                   (a guessed addr lands in unrelated data, e.g. a monster description).

Resolution: an operand whose target has an exact symbol becomes that label; a target that
falls inside a symbol (SYM+N) or has no symbol is left as raw hex with a NEEDS_LABEL note
identifying the role + bank + nearest symbol, so it can be promoted deliberately.

Usage:
  decode_bscript.py BB:AAAA BB:BBBB        decode one range (print)
  decode_bscript.py --apply <bankfile> <label-prefix,...>   rewrite dr blocks in place
"""
import re, sys, os

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# opcode -> (mnemonic, [operand roles])
OPS = {
0x00:('vm_nop',[]), 0x01:('print_text_xy',['p:25','b','b']),
0x02:('place_tile_attr',['w','p:4a','p:4a']), 0x03:('vram_copy3',['w','w','p:0c']),
0x04:('set_sprite_pos',['b','b']), 0x05:('end_script',[]), 0x06:('init_menu_a',[]),
0x07:('end_menu',[]), 0x08:('lcd_off_loadpal',[]), 0x09:('lcd_on_loadpal',[]),
0x0a:('reset_scroll_clr',[]), 0x0b:('load_bgpal_buf',['p:25']), 0x0c:('load_objpal_buf',['p:25']),
0x0d:('load_mon_bgpal',['b']), 0x0e:('load_mon_pic',['w']), 0x0f:('print_mon_name',['b','b']),
0x10:('draw_party_list',[]), 0x11:('clear_oam',[]), 0x12:('print_hp',[]), 0x13:('load_mon_objpal',['b']),
0x14:('load_map_bg',[]), 0x15:('select_menu',['b']), 0x16:('save_palbuf',[]), 0x17:('init_bank4',[]),
0x18:('draw_status_icons',[]), 0x19:('clear_bgbox',['b','b']), 0x1a:('end_script3',[]),
0x1b:('clear_bgbox_at',['b','b','w']), 0x1c:('draw_status_2',[]), 0x1d:('print_all_stats',[]),
0x1e:('set_cursor',[]), 0x1f:('draw_equip_list',[]), 0x20:('print_equip_name',[]), 0x21:('load_menu_entry',[]),
0x22:('copy_sprite_pos',[]), 0x23:('swap_mon_data',[]), 0x24:('load_menu_entry_n',['b']),
0x25:('print_menu_pg_a',['b']), 0x26:('print_menu_pg_b',['b']), 0x27:('draw_item_list',[]),
0x28:('draw_page_arrows',[]), 0x29:('draw_x_47fb',[]), 0x2a:('clear_vram_2',[]), 0x2b:('print_num_d9d3',['w']),
0x2c:('draw_y',[]), 0x2d:('draw_z_434d',['b']), 0x2e:('draw_party_4',[]), 0x2f:('print_equip_n',['b']),
0x30:('draw_w_4745',[]), 0x31:('load_mon_pic_cond',['w']), 0x32:('load_mon_bgpal_2',['b']),
0x33:('draw_8_items',[]), 0x34:('print_two_nums',[]), 0x35:('load_mon_objpal_2',['b']),
0x36:('print_num_indir',['p:25','w','w']), 0x37:('draw_text_53ab',[]), 0x38:('draw_dex_pic',[]),
0x39:('draw_text_5711',[]), 0x3a:('draw_text_50ad',[]), 0x3b:('print_num_full',['b','p:25','w','w']),
0x3c:('draw_clock',[]), 0x3d:('fill_vram',['w','w']), 0x3e:('set_cursor_2',[]),
0x3f:('farcopy_vram',['b','w','w','p:arg']), 0x40:('end_to_menu',[]), 0x41:('draw_item_page',[]),
0x42:('clear_region',[]), 0x43:('draw_item_x',[]), 0x44:('draw_item_arrows',[]), 0x45:('draw_q_4416',[]),
0x46:('draw_r_46af',[]), 0x47:('draw_mon_full',['b','w','b','b']), 0x48:('print_hp_2',[]),
0x49:('print_stats_2',[]), 0x4a:('draw_party_stats',[]), 0x4b:('draw_box_markers',[]),
0x4c:('clear_menu_table',[]), 0x4d:('reset_scroll_2',[]), 0x4e:('count_dex',[]), 0x4f:('vm_nop_2',[]),
0x50:('draw_s_42ba',[]), 0x51:('clear_bgbox_vram1',['b','b']), 0x52:('print_num_full_2',['b','p:25','w','w']),
0x53:('draw_t_45f8',[]), 0x54:('skip_if_empty',['b']), 0x55:('draw_8_party',[]), 0x56:('draw_u_54cc',[]),
0x57:('draw_v_40b7',[]), 0x58:('set_two_sprites',['b','b','b','b']), 0x59:('load_pals_a',[]),
0x5a:('load_menu_option',[]), 0x5b:('load_pals_b',[]), 0x5c:('draw_aa_434d',['b']),
0x5d:('draw_ab_42ba',[]), 0x5e:('print_box_num',[]), 0x5f:('draw_ac_407b',[]),
}
TERMS={0x05,0x07,0x1a,0x40,0x15}

# ---- symbol table (rom offset -> name, sorted) ----
def load_syms():
    syms=[]
    p=os.path.join(REPO,'shi_kong_xing_shou.sym')
    if not os.path.exists(p): return syms
    for line in open(p,encoding='utf-8'):
        m=re.match(r'([0-9A-Fa-f]{2}):([0-9A-Fa-f]{4})\s+(\S+)',line)
        if m:
            bank=int(m.group(1),16); addr=int(m.group(2),16)
            off=bank*0x4000 + (addr-0x4000 if addr>=0x4000 else addr)
            syms.append((off,m.group(3)))
    syms.sort()
    return syms
SYMS=load_syms()

def load_ram_syms():
    """addr($8000-$ffff)->name, plus sorted list for nearest. Prefer wram bank 00/01."""
    m={}; lst=[]
    p=os.path.join(REPO,'shi_kong_xing_shou.sym')
    if not os.path.exists(p): return m,lst
    for line in open(p,encoding='utf-8'):
        g=re.match(r'([0-9A-Fa-f]{2}):([0-9A-Fa-f]{4})\s+(\S+)',line)
        if g:
            addr=int(g.group(2),16)
            if addr>=0x8000:
                if addr not in m: m[addr]=g.group(3)
                lst.append((addr,g.group(3)))
    lst.sort()
    return m,lst
RAM_SYMS,RAM_LIST=load_ram_syms()

def gb2off(bank,addr):
    return bank*0x4000 + (addr-0x4000 if addr>=0x4000 else addr)

def resolve_ptr(v, ambient_bank):
    """Region-aware pointer resolution. Return (arg_string, note_or_None)."""
    import bisect
    if 0x8000 <= v <= 0x9fff:
        return '$%04x'%v, None                      # VRAM: raw hardware address
    if v >= 0xa000:                                  # SRAM/WRAM/HRAM
        if v in RAM_SYMS: return RAM_SYMS[v], None
        i=bisect.bisect_right([a for a,_ in RAM_LIST], v)-1
        if i>=0:
            a,n=RAM_LIST[i]
            return ('%s + %d'%(n,v-a)) if v!=a else n, None
        return '$%04x'%v, None
    # ROM: bank0 for the home region, else the opcode's ambient bank
    b = 0 if v < 0x4000 else ambient_bank
    lbl,near=resolve(b,v)
    if lbl: return lbl, None
    if near!='?': return near, None                  # label+offset into known symbol
    return '$%04x'%v, 'NEEDS_LABEL bank%02x'%b

def resolve(bank,addr):
    """Return (exact_label_or_None, 'sym+N' nearest str)."""
    off=gb2off(bank,addr)
    import bisect
    i=bisect.bisect_right([s[0] for s in SYMS], off)-1
    if i<0: return None,'?'
    soff,name=SYMS[i]
    if soff==off: return name,name
    return None,'%s + %d'%(name, off-soff)

def script_bank_for(bank, rule, argbank):
    if rule=='self': return bank
    if rule=='arg': return argbank
    if rule=='rt': return None  # runtime, unknown
    try: return int(rule,16)   # explicit hex bank, e.g. '25','0c'
    except ValueError: return None

def decode(rom, s, e, scriptbank):
    """Yield rendered macro lines for dr [s,e). Returns (lines, consumed)."""
    data=rom[s:e]; i=0; out=[]
    while i < len(data):
        op=data[i]
        if op not in OPS: return out, i
        name, roles=OPS[op]
        need=sum(2 if (r=='w' or r.startswith('p')) else 1 for r in roles)
        if i+1+need>len(data): return out, i
        args=[]; notes=[]; j=i+1; argbank=None
        for r in roles:
            if r=='b':
                v=data[j]; j+=1; args.append('$%02x'%v); argbank=v
            elif r=='w':
                v=data[j]|(data[j+1]<<8); j+=2; args.append('$%04x'%v)
            else:  # pointer p:rule
                rule=r.split(':')[1]
                v=data[j]|(data[j+1]<<8); j+=2
                tb=script_bank_for(scriptbank, rule, argbank)
                if tb is None:
                    args.append('$%04x'%v)
                    notes.append('NEEDS_LABEL ptr@hFFD4(runtime) $%04x'%v)
                else:
                    arg,note=resolve_ptr(v, tb)
                    args.append(arg)
                    if note: notes.append(note)
        line='\tbs_%s%s'%(name, (' '+', '.join(args)) if args else '')
        if notes: line += '  ; '+'; '.join(notes)
        out.append(line); i=j
    return out, i

def render(rom, s, e, scriptbank):
    lines, c = decode(rom, s, e, scriptbank)
    if c < e-s:
        tail=rom[s+c:e]
        lines.append('\tdb '+', '.join('$%02x'%b for b in tail)+'  ; trailing/branch data')
    return lines

def main():
    rom=open(os.path.join(REPO,'baserom.gbc'),'rb').read()
    if sys.argv[1]=='--apply':
        bankfile=sys.argv[2]; prefixes=tuple(sys.argv[3].split(','))
        scriptbank=int(re.search(r'bank_([0-9a-f]+)',bankfile).group(1),16)
        path=os.path.join(REPO,'banks',bankfile)
        lines=open(path,encoding='utf-8',newline='').read().split('\r\n')
        def label_for(idx):
            for k in range(idx-1,-1,-1):
                t=lines[k].strip()
                if t and not t.startswith(';'): return t.rstrip(':')
            return ''
        out=[]; i=0; n=0
        while i<len(lines):
            if lines[i].strip()=='; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)':
                i+=1; continue
            m=re.match(r'\s*dr \$([0-9a-f]+), \$([0-9a-f]+)$',lines[i])
            if m and label_for(i).startswith(prefixes):
                out.extend(render(rom,int(m.group(1),16),int(m.group(2),16),scriptbank)); n+=1; i+=1; continue
            out.append(lines[i]); i+=1
        open(path,'wb').write('\r\n'.join(out).encode('utf-8'))
        print('rewrote %d dr in %s (script bank $%02x)'%(n,bankfile,scriptbank))
    else:
        def parse(a): b,x=a.split(':'); return int(b,16),int(x,16)
        sb,sa=parse(sys.argv[1]); eb,ea=parse(sys.argv[2])
        for l in render(rom, gb2off(sb,sa), gb2off(eb,ea), sb): print(l)

if __name__=='__main__': main()
