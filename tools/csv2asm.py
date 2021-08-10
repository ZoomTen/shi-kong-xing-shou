#!/usr/bin/env python3

import csv
import sys
import re

def wrap(text):
    # https://stackoverflow.com/a/9968290
    return [line.strip() for line in re.findall(r'.{1,13}(?:\s+|$)', text)]

csv_name = sys.argv[1]

with open(csv_name, "r") as csv_file:
    reader = csv.DictReader(csv_file)
    for row in reader:
        if row['label'] == '':
            print(f'text_{row["bank"].zfill(2)}_{row["address"].zfill(4)}::')
        else:
            print(f'{row["label"]}::')
        
        translated = row["translated_string"]
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
                    lc += 1
                    if lc == 1:
                        print(f'\t{begin} "{i}"')
                    elif lc == 2:
                        print(f'\tline  "{i}"')
                    else:
                        print(f'\tcont  "{i}"')
        print('\tdone\n')                
