#!/usr/bin/env python3

import csv
import sys
import re

def wrap(text):
    # https://stackoverflow.com/a/9968290
    wrapped = [line.strip() for line in re.findall(r'.{1,13}(?:\s+|$|-)', text)]
    if (' '.join(wrapped) != text):
        print('\t; XXX Text may be clipped!')
    return wrapped

if len(sys.argv) < 3:
    print('''csv2asm.py [csv file] [lang code]

[csv file] = name of csv file
[lang code] = ISO 639-1 two-letter lang code (en, fr, ar, de, ..)
              ..or combined with ISO 3166-1 alpha-2 region code (en_GB, en_AU, pt_BR)
''')
    exit(0)

csv_name = sys.argv[1]
lang_code = sys.argv[2]

with open(csv_name, "r") as csv_file:
    reader = csv.DictReader(csv_file)
    for row in reader:
        if ('translated[%s]' % lang_code) not in row:
            print("can't find translation entry for %s (must have column named 'translated[%s]')" % (lang_code, lang_code))
            exit(1)
        if ('text_kind' in row) and (row['text_kind'].rfind('repoint_target') != -1):
            print(f'en_', end='')
        if row['label'] == '':
            print(f'text_{row["bank"].zfill(2)}_{row["address"].zfill(4)}::')
        else:
            print(f'{row["label"]}::')
        
        if 'text_kind' in row:
            if (row['text_kind'].rfind('signpost') != -1):
                print('\ttext_sign')
            elif (row['text_kind'].rfind('repoint_extern') != -1):
                print(f'\trepoint en_text_{row["bank"].zfill(2)}_{row["address"].zfill(4)}')
        
        translated = row["translated[%s]" % lang_code]
        
        # substitute contractions for single letters
        contractions = {
            "'d" : "𝖉",
            "'l" : "𝖑",
            "'s" : "𝖘",
            "'t" : "𝖙",
            "'v" : "𝖛",
            "'r" : "𝖗",
            "'m" : "𝖒",
            "'e" : "𝖊",
        }
        for og, fr in contractions.items():
            translated = translated.replace(og, fr)
        
        tc = 0
        for line in translated.split('\n'):
            tc += 1
            if tc > 2:
                begin = 'para '
            else:
                begin = 'text2'
            if line[:8] == '// init ':
                print(f'\ttext_init {line[8:]}')
            else:
                lc = 0
                for i in wrap(line):
                    # substitute back to contractions
                    for og, fr in contractions.items():
                        i = i.replace(fr, og)
                    lc += 1
                    if lc == 1:
                        print(f'\t{begin} "{i}"')
                    elif lc == 2:
                        print(f'\tline  "{i}"')
                    else:
                        print(f'\tcont  "{i}"')
        if ('text_kind' in row) and (row['text_kind'].rfind('choicer') != -1):
            print('\tgetchoice $1cc5\n')
        print('\tdone\n')
