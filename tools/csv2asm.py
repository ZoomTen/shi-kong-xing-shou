#!/usr/bin/env python3

import csv
import sys
import re
import importlib

def wrap(text, lang):
    WRAP_LIMIT = 13
    # https://stackoverflow.com/a/9968290
    wrapped = [line.strip() for line in re.findall(r'.{1,'+str(WRAP_LIMIT)+'}(?:\s+|$|-)', text)]
    if (' '.join(wrapped) != text):
        # text is clipped, try another strategy
        if importlib.util.find_spec('pyphen'):
            print('\t; XXX Automatic hyphenation, please check')
            import pyphen
            wrapper = pyphen.Pyphen(lang=pyphen.language_fallback(lang))
            split_txt = [line.strip() for line in re.findall(r'.+?(?:\s+|$|-)', text)]
            num_letters_printed = 0
            num_letters_to_print = 0
            joined_txt = ['']
            for i in range(len(split_txt)):
                cur_word = split_txt[i]
                if i != len(split_txt)-1:
                    if cur_word[-1] != '-':
                        cur_word += ' '
                num_letters_to_print = len(cur_word)
                
                #print(cur_word, num_letters_printed, num_letters_to_print, num_letters_printed + num_letters_to_print)
                if (num_letters_printed + num_letters_to_print) < WRAP_LIMIT:
                    joined_txt[-1] += cur_word
                    num_letters_printed += num_letters_to_print
                elif (num_letters_printed + num_letters_to_print) == WRAP_LIMIT:
                    joined_txt[-1] += cur_word
                    num_letters_printed = 0
                    joined_txt.append('')
                else:
                    hyphenated = wrapper.wrap(cur_word, WRAP_LIMIT - num_letters_printed)
                    if hyphenated:
                       for part in hyphenated:
                           if part != hyphenated[0]:
                               joined_txt.append(part)
                               num_letters_to_print = 1
                               num_letters_printed = len(part)
                           else:
                               joined_txt[-1] += part
                    else: # no hyphenation available, make a new line
                        joined_txt.append(cur_word)
                        num_letters_to_print = 1
                        num_letters_printed = len(cur_word)
            joined_txt = list(
                map(
                    lambda x: x.strip(),
                    filter(lambda x: x.strip() != '', joined_txt)
                )
            )
            wrapped = joined_txt
        else:
        # no pyphen lib, fall back
            print('\t; XXX Unable to automatically hyphenate, text may be clipped!')
    overflows = list(filter(lambda x: len(x) > WRAP_LIMIT, wrapped))
    if len(overflows) > 0:
        print('\t; XXX Text overflows on: %s' % str(overflows))
    return wrapped

if len(sys.argv) < 3:
    print('''csv2asm.py [csv file] [lang code]

[csv file] = name of csv file
[lang code] = ISO 639-1 two-letter lang code (en, fr, ar, de, ..)
              ..or combined with ISO 3166-1 alpha-2 region code (en_GB, en_AU, pt_BR)
''',file=sys.stderr)
    exit(0)

csv_name = sys.argv[1]
lang_code = sys.argv[2]

if re.match(r'[a-z]{2}(_[A-Z]{2})?$', lang_code.strip()) is None:
    print('invalid lang code, use two-letter lang code and two-letter region code e.g. "en_US" or "de"',file=sys.stderr)
    exit(1)

with open(csv_name, "r") as csv_file:
    reader = csv.DictReader(csv_file)
    for row in reader:
        if ('translated[%s]' % lang_code) not in row:
            print("can't find translation entry for %s (must have column named \"translated[%s]\")" % (lang_code, lang_code),file=sys.stderr)
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
            "..." : "⋯"
        }
        for og, fr in contractions.items():
            translated = translated.replace(og, fr)
            translated = translated.replace('"', '\'')  # lovely...
        
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
                for i in wrap(line, lang_code):
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
