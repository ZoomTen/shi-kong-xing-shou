#!/usr/bin/env python3
import re
import sys
from lib.gbtool import *

if len(sys.argv) < 3:
	print(f'{sys.argv[0]} address chNum')
	print('\taddress can be in BB:AAAA form or as a hex number')
	print('\tchannel number must be either: 1, 2, 3, 4')
	exit(0)

if not (1 <= int(sys.argv[2]) <= 4):
	print("channel number must be either: 1, 2, 3, 4")
	exit(0)

channel = int(sys.argv[2])

print("Just press ENTER to continue execution, otherwise type in anything then press ENTER to stop.")
print("--------------")
print()

KNOWN_DUTY_VALUES = [
	"DUTY_12",
	"DUTY_25",
	"DUTY_50",
	"DUTY_75"
]

KNOWN_NOTES = [
	"C_", "C#", "D_", "D#", "E_", "F_", "F#", "G_", "G#", "A_", "A#", "B_"
]

addr_str = lambda x: '%03x:%04x' % x

# extract symbols
with open('shi_kong_xing_shou.sym', 'r') as sym:
	string = sym.read()
	symbol = read_symbols(string)
	rom_sym = symbol['rom']
	ram_sym = symbol['ram']

# get rom
with open('baserom.gbc', 'rb') as rom:
	s = sys.argv[1]
	s_= re.match('([0-9a-fA-F]+):([0-9a-fA-F]{4})$', s)
	if s_:
		start = addr2offset(*str2addr(s))
	else:
		start = int(s, 16)
	
	rom.seek(start)

	while not input():
		# add label
		if rom.tell() in rom_sym:
			print(f'{get_symbol(rom_sym, rom.tell())}:')
		
		# process commands
		command = get_number(rom, 1)

		if 0xd0 <= command <= 0xdf:
			# init command
			args = {
				"speed": command & 0xf
			}
			if channel < 3:
				args["speed"] = command & 0xf,
				args["duty"] = [KNOWN_DUTY_VALUES[int(digit, 16)] for digit in hex(get_number(rom, 1))[2:].zfill(2)],
				args["unknown1"] = get_number(rom, 1),
				args["vibrato"] = [int(digit, 16) for digit in hex(get_number(rom, 1))[2:].zfill(2)],
				args["unknown2"] = [
					get_number(rom, 1),
					get_number(rom, 1),
					get_number(rom, 1)
				]
			elif channel == 3:
				args["unknown1"] = get_number(rom, 1)
				args["unknown2"] = get_number(rom, 1)
				args["unknown3"] = get_number(rom, 1)
			
			if channel < 3:
				print(
					"\t",
					("sound_init %d, \\ ; speed" % args["speed"]),
					"\n\t",
					("           %s, %s, \\ ; duty cycle" % tuple(args["duty"])),
					"\n\t",
					("           $%x, \\ ; unknown 1" % args["unknown1"]),
					"\n\t",
					("           %d, %d, \\ ; vibrato" % tuple(args["vibrato"])),
					"\n\t",
					("           $%x, $%x, $%x ; unknown 2" % tuple(args["unknown2"])),
					)
			elif channel == 3:
				print(
					"\t",
					("sound_init %d, \\ ; speed" % args["speed"]),
					"\n\t",
					("           $%x, $%x, $%x ; unknown" % (
						args["unknown1"], args["unknown2"], args["unknown3"]
					))
				)
			elif channel == 4:
				print("\tsound_init %d ; speed" % args["speed"])
		elif 0xe0 <= command <= 0xe7:
			args = {
				"octave": command & 0xf
			}
			print("\toctave %d" % args["octave"])
		elif command == 0xe8:
			args = {
				"duty": [KNOWN_DUTY_VALUES[int(digit, 16)] for digit in hex(get_number(rom, 1))[2:].zfill(2)]
			}
			print("\tduty_cycle %s, %s" % tuple(args["duty"]))
		elif command == 0xe9:
			print("\tunknown_music_e9 $%x" % get_number(rom, 1))
		elif command == 0xea:
			print("\tunknown_music_ea $%x" % get_number(rom, 1))
		elif command == 0xeb:
			args = {
				"vibrato": [int(digit, 16) for digit in hex(get_number(rom, 1))[2:].zfill(2)]
			}
			print("\tvibrato %d, %d" % tuple(args["vibrato"]))
		elif command == 0xec:
			arg = get_number(rom, 1)
			args = {
				"transpose": -(256-arg) if arg > 127 else arg
			}
			print("\ttranspose %d" % args["transpose"])
		elif command == 0xed:
			print("\tunknown_music_ed $%x" % get_number(rom, 1))
		elif command == 0xee:
			args = {
				"unknown1": get_number(rom, 1)
			}
			if args["unknown1"] > 127:
				args["unknown2"] = get_number(rom, 1)
				args["unknown3"] = get_number(rom, 1)
				print("\tunknown_volume $%x, $%x, $%x" % (
					 args["unknown1"],  args["unknown2"],  args["unknown3"]
				))
			else:
				print("\tunknown_volume $%x" % args["unknown1"])
		elif command == 0xef:
			arg = get_number(rom, 1)
			args = {
				"fine_pitch": -(256-arg) if arg > 127 else arg
			}
			print("\tfine_pitch $%x" % args["fine_pitch"])
		elif command == 0xf0:
			print("\tunknown_music_f0 $%x" % get_number(rom, 1))
		elif command == 0xf1:
			print("\tunknown_music_f1 $%x" % get_number(rom, 1))
		elif command == 0xf2:
			print("\tunknown_music_f2 $%x" % get_number(rom, 1))
		elif command == 0xf3:
			# XXX turn this into actual stereo panning values
			print("\tstereo_panning $%x" % get_number(rom, 1))
		elif command == 0xf4:
			print("\tunknown_music_f4 $%x, $%x" % (
				get_number(rom, 1), get_number(rom, 1)
			))
		elif command == 0xf5:
			print("\tsound_nop")
		elif command == 0xf6:
			args = {
				"speed": get_number(rom, 1)
			}
			print("\tspeed %d" % args["speed"])
		elif command == 0xf7:
			args = {
				"call": get_number(rom, 2)
			}
			print("\tsound_call %s" % get_symbol(rom, args["call"]))
		elif command == 0xf8:
			args = {
				"call": get_number(rom, 2)
			}
			print("\tsound_call2 %s" % get_symbol(rom, args["call"]))
		elif command == 0xf9:
			print("\tsound_ret")
		elif command == 0xfa:
			print("\tsound_ret2")
		elif command == 0xfb:
			print("\tmark_loop ;------")
		elif command == 0xfc:
			print("\tmark_loop2 ;------")
		elif command == 0xfd:
			print("\trepeat_loop %d ;------" % get_number(rom, 1))
		elif command == 0xfe:
			print("\trepeat_loop2 %d ;------" % get_number(rom, 1))
		elif command == 0xff:
			print("\tsound_end")
		elif 0x00 <= command <= 0xcf:
			args = {
				"note": (command & 0xf0) >> 4,
				"length": (command & 0xf) + 1
			}
			if args["note"] == 12:
				print("\trest %d" % args["length"])
			else:
				print("\tnote %s, %d" % (
					KNOWN_NOTES[args["note"]],
					args["length"]
				))
		else:
			print("\tdb $%x" % command)
