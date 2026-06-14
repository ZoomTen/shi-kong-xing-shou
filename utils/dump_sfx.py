#!/usr/bin/env python3
# Decodes the bank 3 sound-effect channel streams.
#
# The SFX header table (SoundEngine2_HeaderPointers) gives, for each effect,
# a channel bitmask + priority followed by one `dw` per set bit. The bit
# position selects the virtual channel slot; its hardware channel type
# (1/2 = pulse, 3 = wave, 4 = noise) is (pos % 4) + 1 and determines how the
# sound_init command is decoded. We walk the header table to learn each
# stream pointer's channel type, then disassemble every `dr` block using the
# same command grammar as dump_music.py.
#
# Usage: dump_sfx.py headers.asm blocks.asm [blocks.asm ...]
import re
import sys
from lib.gbtool import *

KNOWN_DUTY = ["DUTY_12", "DUTY_25", "DUTY_50", "DUTY_75"]
KNOWN_NOTES = ["C_", "C#", "D_", "D#", "E_", "F_", "F#", "G_", "G#", "A_", "A#", "B_"]
KNOWN_STEREO = ["STEREO_ALTERNATING", "STEREO_RIGHT", "STEREO_LEFT", "STEREO_CENTER"]


def parse_int(tok):
	tok = tok.strip()
	return int(tok[1:], 16) if tok.startswith("$") else int(tok)


def header_channels(header_path):
	"""Map each stream label -> hardware channel type from the header table."""
	lines = open(header_path).read().splitlines()
	toks = [l.strip() for l in lines if l.strip()]
	ch = {}
	i = 0
	N = len(toks)
	while i < N:
		t = toks[i]
		if t.endswith(":") and not t.startswith(("db", "dw")):
			i += 1
			# one label may hold several concatenated sub-headers
			while i + 1 < N and toks[i].startswith("db"):
				mask = parse_int(toks[i][2:].split(";")[0]); i += 1
				if not toks[i].startswith("db"):
					break
				i += 1  # priority byte
				for pos in [p for p in range(8) if mask & (1 << p)]:
					if i < N and toks[i].startswith("dw"):
						ptr = toks[i][2:].split(";")[0].strip(); i += 1
						if ptr.startswith("unk_") or ptr.startswith("Sfx"):
							ch.setdefault(ptr, (pos % 4) + 1)
				if i < N and toks[i].endswith(":"):
					break
		else:
			i += 1
	return ch


def parse_blocks(paths):
	"""Read (label, gb_start, gb_end) for each dr block; db $ff -> singleton."""
	blocks = []
	for path in paths:
		for l in open(path):
			m = re.match(r"(\w+):\s*dr\s*\$([0-9a-f]+),\s*\$([0-9a-f]+)", l)
			if m:
				st = offset2addr(int(m.group(2), 16))[1]
				en = offset2addr(int(m.group(3), 16))[1]
				blocks.append((m.group(1), st, en))
				continue
			m = re.match(r"(\w+):\s*db\s*\$ff", l)
			if m:
				blocks.append((m.group(1), None, None))
	return blocks


def label_for(addr):
	return "unk_003_%04x" % addr


def decode_command(rom, channel):
	"""Decode one command at the current position.

	Returns (lines, call_target, terminates) where call_target is the gb
	address invoked by sound_call/sound_call2 (or None) and terminates is
	True for sound_end / sound_ret / sound_ret2.
	"""
	cmd = get_number(rom, 1)
	out = []
	call = None
	term = False
	if 0xd0 <= cmd <= 0xdf:
		# The init command's argument layout follows .is_dx_command in the
		# command processor and varies by hardware channel. Pulse and wave both
		# end in an "envelope mode" byte that pulls 2 extra bytes when its high
		# bit is set.
		speed = cmd & 0xf
		if channel < 3:
			duty = [(KNOWN_DUTY[int(d, 16)] if int(d, 16) < 4 else "$%x" % int(d, 16))
				for d in "%02x" % get_number(rom, 1)]
			vol = get_number(rom, 1)
			vib = [int(d, 16) for d in "%02x" % get_number(rom, 1)]
			env = get_number(rom, 1)
			out.append("\tsound_init %d, \\ ; speed" % speed)
			out.append("\t           %s, %s, \\ ; duty cycle" % tuple(duty))
			out.append("\t           $%x, \\ ; volume envelope" % vol)
			out.append("\t           %d, %d, \\ ; vibrato" % tuple(vib))
			if env > 0x7f:
				ep = (get_number(rom, 1), get_number(rom, 1))
				out.append("\t           $%x, $%x, $%x ; envelope mode, params" % (env, ep[0], ep[1]))
			else:
				out.append("\t           $%x ; envelope mode" % env)
		elif channel == 3:
			wav = get_number(rom, 1)
			env = get_number(rom, 1)
			out.append("\tsound_init %d, \\ ; speed" % speed)
			if env > 0x7f:
				ep = (get_number(rom, 1), get_number(rom, 1))
				out.append("\t           $%x, $%x, $%x, $%x ; waveform, envelope mode, params" % (wav, env, ep[0], ep[1]))
			else:
				out.append("\t           $%x, $%x ; waveform, envelope mode" % (wav, env))
		else:
			out.append("\tsound_init %d ; speed" % speed)
	elif 0xe0 <= cmd <= 0xe7:
		out.append("\toctave %d" % (cmd & 0xf))
	elif cmd == 0xe8:
		d = ["%s" % (KNOWN_DUTY[int(x, 16)] if int(x, 16) < 4 else int(x, 16))
			for x in "%02x" % get_number(rom, 1)]
		out.append("\tduty_cycle %s, %s" % tuple(d))
	elif cmd == 0xe9:
		out.append("\tvolume_envelope $%x" % get_number(rom, 1))
	elif cmd == 0xea:
		out.append("\tsweep $%x" % get_number(rom, 1))
	elif cmd == 0xeb:
		v = [int(x, 16) for x in "%02x" % get_number(rom, 1)]
		out.append("\tvibrato %d, %d" % tuple(v))
	elif cmd == 0xec:
		a = get_number(rom, 1)
		out.append("\ttranspose %d" % (a - 256 if a > 127 else a))
	elif cmd == 0xed:
		out.append("\twaveform $%x" % get_number(rom, 1))
	elif cmd == 0xee:
		u1 = get_number(rom, 1)
		if u1 > 127:
			u2 = get_number(rom, 1)
			u3 = get_number(rom, 1)
			out.append("\tenvelope_setting $%x, $%x, $%x" % (u1, u2, u3))
		else:
			out.append("\tenvelope_setting $%x" % u1)
	elif cmd == 0xef:
		a = get_number(rom, 1)
		out.append("\tfine_pitch $%x" % (a - 256 if a > 127 else a))
	elif cmd == 0xf0:
		out.append("\tenvelope_mode $%x" % get_number(rom, 1))
	elif cmd == 0xf1:
		out.append("\tenvelope_param1 $%x" % get_number(rom, 1))
	elif cmd == 0xf2:
		out.append("\tenvelope_param2 $%x" % get_number(rom, 1))
	elif cmd == 0xf3:
		a = get_number(rom, 1)
		out.append("\tstereo_panning %s" % (KNOWN_STEREO[a] if a < 4 else "$%x" % a))
	elif cmd == 0xf4:
		out.append("\tretrigger $%x, $%x" % (get_number(rom, 1), get_number(rom, 1)))
	elif cmd == 0xf5:
		out.append("\tsound_nop")
	elif cmd == 0xf6:
		out.append("\tspeed %d" % get_number(rom, 1))
	elif cmd == 0xf7:
		call = get_number(rom, 2)
		out.append("\tsound_call %s" % get_symbol(SYM, addr2offset(3, call)))
	elif cmd == 0xf8:
		call = get_number(rom, 2)
		out.append("\tsound_call2 %s" % get_symbol(SYM, addr2offset(3, call)))
	elif cmd == 0xf9:
		out.append("\tsound_ret")
		term = True
	elif cmd == 0xfa:
		out.append("\tsound_ret2")
		term = True
	elif cmd == 0xfb:
		out.append("\tmark_loop")
	elif cmd == 0xfc:
		out.append("\tmark_loop2")
	elif cmd == 0xfd:
		out.append("\trepeat_loop %d" % get_number(rom, 1))
	elif cmd == 0xfe:
		out.append("\trepeat_loop2 %d" % get_number(rom, 1))
	elif cmd == 0xff:
		out.append("\tsound_end")
		term = True
	else:  # 0x00 - 0xcf
		note = (cmd & 0xf0) >> 4
		length = cmd & 0xf
		if note == 12:
			out.append("\trest %d" % length)
		else:
			out.append("\tnote %s, %d" % (KNOWN_NOTES[note], length))
	return out, call, term


def trace(rom, entries, region_start, region_end):
	"""Worklist traversal from each (addr, channel) entry following calls.

	Decodes each routine until a terminator, propagating the caller's channel
	type into callees. Records, per command offset, its decoded lines and the
	channel it was decoded under, plus every discovered entry address.
	"""
	seen_routine = {}     # addr -> channel (routine already traced)
	cmd_lines = {}        # gb addr -> [lines]
	cmd_channel = {}      # gb addr -> channel
	entry_addrs = set()   # addresses needing a label
	work = list(entries)
	for addr, _ in entries:
		entry_addrs.add(addr)
	while work:
		addr, channel = work.pop()
		if addr in seen_routine:
			continue
		seen_routine[addr] = channel
		rom.seek(addr2offset(3, addr))
		while True:
			pos = 0x4000 + (rom.tell() - 3 * 0x4000)
			if pos >= region_end:
				break
			lines, call, term = decode_command(rom, channel)
			cmd_lines.setdefault(pos, lines)
			cmd_channel.setdefault(pos, channel)
			if call is not None and region_start <= call < region_end:
				entry_addrs.add(call)
				if call not in seen_routine:
					work.append((call, channel))
			if term:
				break
	return cmd_lines, cmd_channel, entry_addrs


def main():
	global SYM
	if len(sys.argv) < 3:
		print("%s headers.asm blocks.asm [blocks.asm ...]" % sys.argv[0])
		sys.exit(0)

	SYM = read_symbols(open("shi_kong_xing_shou.sym").read())["rom"]
	channels = header_channels(sys.argv[1])
	rom = open("baserom.gbc", "rb")

	blocks = parse_blocks(sys.argv[2:])
	# region spans from the first block to the end of the last dr block
	region_start = min(b[1] for b in blocks if b[1] is not None)
	region_end = max(b[2] for b in blocks if b[2] is not None)

	# seed entries: each header-referenced stream with its channel type
	entries = []
	for label, gs, ge in blocks:
		if gs is None:
			continue
		entries.append((gs, channels.get(label, 1)))

	cmd_lines, cmd_channel, entry_addrs = trace(rom, entries, region_start, region_end)

	# Some streams are unused: reachable from neither the header table nor any
	# sound_call. Seed each unreached byte as its own pulse-channel entry until
	# the whole region is covered.
	addr = region_start
	while addr < region_end:
		if addr in cmd_lines:
			rom.seek(addr2offset(3, addr))
			before = rom.tell()
			decode_command(rom, cmd_channel[addr])
			addr += rom.tell() - before
			continue
		l, c, e = trace(rom, [(addr, 1)], region_start, region_end)
		for k, v in l.items():
			cmd_lines.setdefault(k, v)
		for k, v in c.items():
			cmd_channel.setdefault(k, v)
		entry_addrs |= e
		entry_addrs.add(addr)

	# walk the region in address order, emitting labels and decoded commands
	addr = region_start
	while addr < region_end:
		if addr in entry_addrs:
			print("\n%s:" % label_for(addr))
		if addr not in cmd_lines:
			raise ValueError("%04x: unreached byte in sfx region" % addr)
		for line in cmd_lines[addr]:
			print(line)
		# advance past this command's bytes by re-decoding its length
		rom.seek(addr2offset(3, addr))
		before = rom.tell()
		decode_command(rom, cmd_channel[addr])
		addr += rom.tell() - before


SYM = None

if __name__ == "__main__":
	main()
