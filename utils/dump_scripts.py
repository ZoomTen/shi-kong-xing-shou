#!/usr/bin/env python3
import re
import sys
from lib.gbtool import *

if len(sys.argv) < 3:
	print(f'{sys.argv[0]} address count')
	print('\taddress can be in BB:AAAA form or as a hex number')
	exit(0)

addr_str = lambda x: '%03x:%04x' % x

# extract symbols
with open('shi_kong_xing_shou.sym', 'r') as sym:
	string = sym.read()
	symbol = read_symbols(string)
	rom_sym = symbol['rom']
	ram_sym = symbol['ram']

def read_block(path, member):
	val = 0; cur = None; found = None
	for line in open(path, encoding='utf-8'):
		line = line.split(';')[0]
		m = re.match(r'\s*const_def(?:\s+\$([0-9a-fA-F]+))?\s*$', line)
		if m:
			val = int(m.group(1), 16) if m.group(1) else 0; cur = {}; continue
		m = re.match(r'\s*const_skip(?:\s+(\d+))?\s*$', line)
		if m:
			val += int(m.group(1)) if m.group(1) else 1; continue
		m = re.match(r'\s*const\s+(\w+)', line)
		if m:
			if cur is None: cur = {}
			cur[val] = m.group(1)
			if m.group(1) == member: found = cur
			val += 1
	return found or {}

_SC = 'constants/script_constants.asm'
FACE = read_block(_SC, 'FACE_DOWN')
MOVE = read_block(_SC, 'MOVE_DELAY')
EMOTE = read_block(_SC, 'EMOTE_EXCLAMATION')
SOUND = read_block('constants/sound_constants.asm', 'SFX_00')
GAMEMODE = read_block('constants/gamemode_constants.asm', 'GAMEMODE_OVERWORLD')

def movelabel(a):
	off = addr2offset(0xb, a)
	return get_symbol(rom_sym, off) if is_symbol_defined(rom_sym, off) else '$%04x' % a

def flaglabel(addr):
	if 0xdaa0 <= addr <= 0xdab8:
		n = addr - 0xdaa0
		return 'wEventFlags' if n == 0 else 'wEventFlags + %d' % n
	return '$%04x' % addr

# get rom
with open('baserom.gbc', 'rb') as rom:
	s = sys.argv[1]
	s_= re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', s)
	if s_:
		start = addr2offset(*str2addr(s))
	else:
		start = int(s, 16)

	rom.seek(start)

	count = int(sys.argv[2])
	stop = None
	if len(sys.argv) > 3:
		ss = sys.argv[3]
		sm = re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', ss)
		stop = addr2offset(*str2addr(ss)) if sm else int(ss, 16)

	while count != 0:
		count -= 1
		bank, address = offset2addr(rom.tell())
		this_label = get_symbol_or_undefined(
			rom_sym, rom.tell(),
			returns=lambda x:('Script_%03x_%04x' % x)
		)
		print('%s:' % this_label)
		while True:
			if stop is not None and rom.tell() >= stop:
				break
			byte = int.from_bytes(rom.read(1), "little")

			if byte == 0x00:
				print("\tscont")

			elif byte == 0x01:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				if arg2 in FACE:
					print("\tspriteface %2d, %s" % (arg1, FACE[arg2]))
				else:
					print("\tspriteface %2d, $%02x ; TEMP" % (arg1, arg2))

			elif byte == 0x02:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				print("\tdelay $%02x, $%02x ; TEMP" % (arg1, arg2))

			elif byte == 0x03:
				print("\tdelaywait")

			elif byte == 0x04:
				arg = int.from_bytes(rom.read(2), "little")
				sym = get_symbol_or_undefined(
					rom_sym, addr2offset(bank, arg),
					returns=lambda x:("text_%02x_%04x" % x)
				)
				print("\ttextface %s" % sym)

			elif byte == 0x05:
				arg = int.from_bytes(rom.read(1), "little")
				if arg in FACE:
					print("\tface %s" % FACE[arg])
				else:
					print("\tface $%02x ; TEMP" % arg)

			elif byte == 0x06:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				if arg2 in MOVE:
					print("\tspritewalk %2d, %s" % (arg1, MOVE[arg2]))
				else:
					print("\tspritewalk %2d, $%02x ; TEMP" % (arg1, arg2))

			elif byte == 0x07:
				print("\tspritewalkstep")

			elif byte == 0x08:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tsetwalktarget $%02x ; TEMP" % arg)

			elif byte == 0x09:
				print("\tend")
				print("")
				break

			elif byte == 0x0a:
				arg1 = int.from_bytes(rom.read(2), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				arg3 = int.from_bytes(rom.read(2), "little")
				script_label = get_symbol_or_undefined(
					rom_sym, addr2offset(bank, arg3),
					returns=lambda x:("Script_%03x_%04x" % x)
				)
				print("\tcheckbit %s, $%02x, %s" % (
							flaglabel(arg1),
							arg2,
							script_label
					))

			elif byte == 0x0b:
				arg1 = int.from_bytes(rom.read(2), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				print("\tsetbit %s, $%02x" % (flaglabel(arg1), arg2))

			elif byte == 0x0c:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				print("\tsetmap $%02x, $%02x ; TEMP" % (arg1, arg2))

			elif byte == 0x0d:
				# every movement assumed to be in bank $0b
				arg = int.from_bytes(rom.read(2), "little")
				print("\tmovemap %s" %
					movelabel(arg)
				)

			elif byte == 0x0e:
				print("\tmovemapstep")

			elif byte == 0x0f:
				# every movement assumed to be in bank $0b
				arg = int.from_bytes(rom.read(2), "little")
				print("\tmove %s" %
					movelabel(arg)
				)

			elif byte == 0x10:
				print("\tmovestep")

			elif byte == 0x14:
				arg = int.from_bytes(rom.read(2), "little")
				sym = get_symbol_or_undefined(
					rom_sym, addr2offset(bank, arg),
					returns=lambda x:("text_%02x_%04x" % x)
				)
				print("\tstext %s" % sym)

			elif byte == 0x15:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				if arg2 in EMOTE:
					print("\temote %2d, %s" % (arg1, EMOTE[arg2]))
				else:
					print("\temote %2d, $%02x ; TEMP" % (arg1, arg2))

			elif byte == 0x16:
				arg = int.from_bytes(rom.read(2), "little")
				sym = get_symbol_or_undefined(rom_sym, addr2offset(bank, arg), returns=lambda x:("ObjSprite_%02x_%04x" % x))
				print("\tloadobjsprite %s" % sym)

			elif byte == 0x1a:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				arg3 = int.from_bytes(rom.read(1), "little")
				arg4 = int.from_bytes(rom.read(1), "little")
				print("\tsetattach $%02x, $%02x, $%02x, $%02x ; TEMP" % (arg1, arg2, arg3, arg4))

			elif byte == 0x1b:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tclearattach $%02x ; TEMP" % arg)

			elif byte == 0x1c:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tclearobject $%02x ; TEMP" % arg)

			elif byte == 0x1f:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tsetmappredef MAPPREDEF_%02x" % arg)

			elif byte == 0x24:
				print("\twalkpath")

			elif byte == 0x25:
				print("\twalkpathstep")

			elif byte == 0x2a:
				new_bank = int.from_bytes(rom.read(1), "little")
				new_addr = int.from_bytes(rom.read(2), "little")
				print("\tfarjump %s" % get_symbol(rom_sym, addr2offset(new_bank, new_addr)))

			elif byte == 0x2e:
				off = int.from_bytes(rom.read(2), "little")
				tile = int.from_bytes(rom.read(1), "little")
				print("\tsetlayouttile $%04x, $%02x" % (off, tile))

			elif byte == 0x30:
				arg = int.from_bytes(rom.read(2), "little")
				print("\tsetbgcopyplayer %s" % get_symbol_or_undefined(rom_sym, addr2offset(0xb, arg), returns=lambda x:("BGCopyTable_%03x_%04x" % x)))

			elif byte == 0x33:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tfacemove2 $%02x ; TEMP" % (arg))

			elif byte == 0x34:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				arg3 = int.from_bytes(rom.read(1), "little")
				print("\twarpmode %s, $%02x, $%02x" % (GAMEMODE[arg1] if arg1 in GAMEMODE else "$%02x"%arg1, arg2, arg3))

			elif byte == 0x35:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tscr_35 $%02x ; TEMP" % arg)

			elif byte == 0x36:
				print("\ttownmusicanim")

			elif byte == 0x37:
				print("\tscr_37")

			elif byte == 0x3b:
				arg = int.from_bytes(rom.read(2), "little")
				print("\tstartbattle %s" % get_symbol_or_undefined(rom_sym, addr2offset(0x2d, arg), returns=lambda x:("BattleData_%03x_%04x" % x)))

			elif byte == 0x3e: # jump
				arg2 = int.from_bytes(rom.read(2), "little")
				sym = get_symbol_or_undefined(
					rom_sym, addr2offset(bank, arg2),
					returns=lambda x:("Script_%03x_%04x" % x)
				)
				print("\tsjump %s" % (sym))

			elif byte == 0x44:
				print("\tclearplayerpos")

			elif byte == 0x48:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				print("\tscr_48 $%02x, $%02x" % (arg1, arg2))

			elif byte == 0x4a:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tstartsub $%02x ; TEMP" % arg)

			elif byte == 0x4d:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				print("\tlistdec $%02x, $%02x" % (arg1, arg2))

			elif byte == 0x4e:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(2), "little")
				off = addr2offset(bank, arg2)
				sym = get_symbol(rom_sym, off) if is_symbol_defined(rom_sym, off) else '$%04x' % arg2
				print("\tobjmove $%02x, %s" % (arg1, sym))

			elif byte == 0x52:
				print("\tincsteps")

			elif byte == 0x5e:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tsetfollower $%02x ; TEMP" % arg)

			elif byte == 0x5f:
				print("\tdirmovement")

			elif byte == 0x61:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tloadscriptedmon $%02x" % a1)

			elif byte == 0x62:
				arg1 = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(1), "little")
				print("\tscr_62 $%02x, $%02x ; TEMP" % (arg1, arg2))

			elif byte == 0x63: # jump 2
				arg = int.from_bytes(rom.read(1), "little")
				arg2 = int.from_bytes(rom.read(2), "little")
				sym = get_symbol_or_undefined(
					rom_sym, addr2offset(bank, arg2),
					returns=lambda x:("Script_%03x_%04x" % x)
				)
				print("\tifcharindex $%02x, %s" % (arg, sym))

			elif byte == 0x65:
				arg = int.from_bytes(rom.read(1), "little")
				print("\tsetplayerchar $%02x ; TEMP" % arg)

			elif byte == 0x69:
				print("\tend2")
				print("")
				break

			elif byte == 0x21:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tcopyobjfield $%02x, $%02x" % (a1, a2))
			elif byte == 0x22:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tcopyobjy $%02x, $%02x" % (a1, a2))
			elif byte == 0x23:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				print("\tloadspriteat $%02x, $%02x, $%02x" % (a1, a2, a3))
			elif byte == 0x26:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tremoveobj $%02x" % (a1))
			elif byte == 0x27:
				a1 = int.from_bytes(rom.read(2), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tclearbit %s, $%02x" % (flaglabel(a1), a2))
			elif byte == 0x28:
				print("\tfadeout")
			elif byte == 0x29:
				print("\tfadein")
			elif byte == 0x2b:
				a1 = int.from_bytes(rom.read(2), "little")
				print("\tjumpifnotdown %s" % get_symbol_or_undefined(rom_sym, addr2offset(bank, a1), returns=lambda x:("Script_%03x_%04x" % x)))
			elif byte == 0x2c:
				print("\treloadscreen")
			elif byte == 0x2d:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				a4 = int.from_bytes(rom.read(1), "little")
				print("\tcopytilemap $%02x, $%02x, $%02x, $%02x" % (a1, a2, a3, a4))
			elif byte == 0x2f:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				a4 = int.from_bytes(rom.read(1), "little")
				print("\tcopygfx $%02x, $%02x, $%02x, $%02x" % (a1, a2, a3, a4))
			elif byte == 0x31:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tcopytilemapplayer $%02x, $%02x" % (a1, a2))
			elif byte == 0x32:
				print("\tfacemove1")
			elif byte == 0x38:
				print("\tscr_38")
			elif byte == 0x39:
				a1 = int.from_bytes(rom.read(2), "little")
				print("\trunmovement %s" % movelabel(a1))
			elif byte == 0x3a:
				print("\trunmovementstep")
			elif byte == 0x3c:
				a1 = int.from_bytes(rom.read(2), "little")
				print("\tifmoney $%04x" % a1)
			elif byte == 0x3d:
				a1 = int.from_bytes(rom.read(2), "little")
				print("\tifmoney2 $%04x" % a1)
			elif byte == 0x3f:
				print("\tcountflags7")
			elif byte == 0x40:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tgetobjstatus $%02x" % (a1))
			elif byte == 0x41:
				print("\trefreshobjects")
			elif byte == 0x42:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tgetmapobjbyte $%02x" % (a1))
			elif byte == 0x43:
				print("\tclearbgfade")
			elif byte == 0x45:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				a4 = int.from_bytes(rom.read(1), "little")
				a5 = int.from_bytes(rom.read(1), "little")
				a6 = int.from_bytes(rom.read(1), "little")
				a7 = int.from_bytes(rom.read(1), "little")
				print("\tsetup45 $%02x, $%02x, $%02x, $%02x, $%02x, $%02x, $%02x" % (a1, a2, a3, a4, a5, a6, a7))
			elif byte == 0x46:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\taddmoney $%02x, $%02x" % (a1, a2))
			elif byte == 0x47:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				a4 = int.from_bytes(rom.read(1), "little")
				print("\twarpmode2 %s, $%02x, $%02x, $%02x" % (GAMEMODE[a1] if a1 in GAMEMODE else "$%02x"%a1, a2, a3, a4))
			elif byte == 0x49:
				print("\tscr_49")
			elif byte == 0x4b:
				print("\tstopsub")
			elif byte == 0x4c:
				print("\treturnmap")
			elif byte == 0x4f:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tifspecies $%02x" % (a1))
			elif byte == 0x50:
				print("\tclearmon")
			elif byte == 0x51:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tscr_51 $%02x, $%02x" % (a1, a2))
			elif byte == 0x53:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				print("\twarp3 $%02x, $%02x, $%02x" % (a1, a2, a3))
			elif byte == 0x54:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(2), "little")
				print("\tobjmoveb $%02x, $%04x" % (a1, a2))
			elif byte == 0x55:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tobjaccum $%02x, $%02x" % (a1, a2))
			elif byte == 0x56:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tifplayersprite $%02x" % (a1))
			elif byte == 0x57:
				print("\tscr_57")
			elif byte == 0x58:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tsetplayersprite $%02x" % (a1))
			elif byte == 0x59:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				print("\tlistop59 $%02x, $%02x, $%02x" % (a1, a2, a3))
			elif byte == 0x5a:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				print("\tlistop5a $%02x, $%02x, $%02x" % (a1, a2, a3))
			elif byte == 0x5b:
				a1 = int.from_bytes(rom.read(2), "little")
				print("\tjumpifnotright %s" % get_symbol_or_undefined(rom_sym, addr2offset(bank, a1), returns=lambda x:("Script_%03x_%04x" % x)))
			elif byte == 0x5c:
				print("\treviveparty")
			elif byte == 0x5d:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tscanparty $%02x" % (a1))
			elif byte == 0x60:
				print("\tdirmovementstep")
			elif byte == 0x64:
				print("\tloadbufmon")
			elif byte == 0x66:
				addr = int.from_bytes(rom.read(2), "little")
				dest_bank = int.from_bytes(rom.read(1), "little")
				off = addr2offset(dest_bank, addr)
				if is_symbol_defined(rom_sym, off):
					print("\tfarjump2 %s" % get_symbol(rom_sym, off))
				else:
					print("\tfarjump2 $%04x, $%02x" % (addr, dest_bank))
			elif byte == 0x67:
				print("\tswapfollower")
			elif byte == 0x68:
				print("\tupgrademoves")
			elif byte == 0x6a:
				print("\trandomwarp")
			elif byte == 0x6b:
				print("\twarppowerplant")
			elif byte == 0x6c:
				print("\twarp6c")
			elif byte == 0x6d:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				print("\tcountflags10 $%02x, $%02x, $%02x" % (a1, a2, a3))
			elif byte == 0x6e:
				ptrs = [int.from_bytes(rom.read(2), "little") for _ in range(9)]
				lbls = [get_symbol_or_undefined(rom_sym, addr2offset(bank, p), returns=lambda x:("Script_%03x_%04x" % x)) for p in ptrs]
				print("	scr_6e %s" % ", ".join(lbls))
			elif byte == 0x70:
				print("\trestorebank")
			elif byte == 0x71:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tsetmapgroup $%02x" % (a1))
			elif byte == 0x72:
				ptrs = [int.from_bytes(rom.read(2), "little") for _ in range(4)]
				lbls = [get_symbol_or_undefined(rom_sym, addr2offset(bank, p), returns=lambda x:("Script_%03x_%04x" % x)) for p in ptrs]
				print("	facemove3 %s" % ", ".join(lbls))
			elif byte == 0x73:
				print("\tfacemove4")
			elif byte == 0x74:
				print("\tworldmap")
			elif byte == 0x75:
				print("\tendrestore")
			elif byte == 0x76:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tplaysound %s" % (SOUND[a1] if a1 in SOUND else "$%02x ; TEMP" % a1))
			elif byte == 0x11:
				a1 = int.from_bytes(rom.read(2), "little")
				print("\tmove2 %s" % movelabel(a1))
			elif byte == 0x12:
				print("\tmove2step")
			elif byte == 0x13:
				a1 = int.from_bytes(rom.read(2), "little")
				a2 = int.from_bytes(rom.read(2), "little")
				print("\tsetbgcopy $%04x, %s" % (a1, get_symbol_or_undefined(rom_sym, addr2offset(0xb, a2), returns=lambda x:("BGCopyTable_%03x_%04x" % x))))
			elif byte == 0x17:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				a3 = int.from_bytes(rom.read(1), "little")
				print("\toffsetobject $%02x, $%02x, $%02x" % (a1, a2, a3))
			elif byte == 0x18:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(2), "little")
				print("\tobjscript $%02x, %s" % (a1, movelabel(a2)))
			elif byte == 0x19:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tobjscriptstep $%02x, $%02x" % (a1, a2))
			elif byte == 0x1d:
				a1 = int.from_bytes(rom.read(1), "little")
				print("\tobjmapcoords $%02x" % (a1))
			elif byte == 0x1e:
				a1 = int.from_bytes(rom.read(1), "little")
				a2 = int.from_bytes(rom.read(1), "little")
				print("\tsetmapobjbyte $%02x, $%02x" % (a1, a2))
			elif byte == 0x20:
				print("\tspawnanim")
			elif byte == 0x6f:
				print("\tcondtext")
			elif byte == 0x77:
				print("\tifplayerx")
			else:
				print("\tdb $%02x ; TEMP" % byte)

	print('; $%x' % rom.tell())
