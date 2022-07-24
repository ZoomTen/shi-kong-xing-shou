
### MADE BY MinoMe (Discored: MinoMe#5249)
# Feel free to contact me if you haveany probblems

import json
import math
import zlib # added by Zumi

rom_file = "../baserom.gbc"
scan_start_offset = 0x100000
last_page = 9

#rom_file = "Shi Kong Xing Shou (Unlicensed, Chinese) (Multicart Rip) [Fixed].gbc"
#scan_start_offset = 0x100000
#last_page = 9

#rom_file = "Mu Chang Wu Yu GB 6 (Unl) (Chn) [C] [Raw].gbc"
#scan_start_offset = 0x100000
#last_page = 9

#rom_file = "Feng Kuang Da Fu Weng (Unlicensed, Chinese) (Multicart Rip) [Header Fix].gbc"
#scan_start_offset = 0x24000
#last_page = 5

#rom_file = "Shu Ma Bao Long - Kou Dai Ban (Unl) (Chn) [C] [Raw].gbc"
#scan_start_offset = 0x4c000
#last_page = 6


# f = open('FONT/VF_SUPER-FULL.json')
# font_data = json.load(f)
# f.close()
# --- begin replace ---
with open("VF_SUPER-FULL.json.zlib", "rb") as f:
	font_data = json.loads(
		zlib.decompress(f.read())
	)
# --- end replace ---

f = open(rom_file,"rb")
data = f.read()
f.close()

scan_page_size = 256

char_size = 8*4

char_scan = []


def post_new_char( offset,char ):
    h = data[offset:offset+char_size].hex().zfill(char_size*2)
    print( json.dumps({char:[h]}, ensure_ascii=False, indent=4).replace("{","").replace("\n}","")+"," )
    

#post_new_char( 0x25740,"©")
#exit()




for char in font_data:
    glifs = font_data[char]
    for glif in glifs:
        off = []
        pag = []
        o = scan_start_offset
        letter = bytes.fromhex(glif)
        while o != -1:
            o = data.find(letter,o)
            if o != -1:
                new_off = int((o-scan_start_offset)/char_size)
                new_page = math.floor(new_off/0x100)
                if new_page <= last_page:
                    off.append(int(new_off%0x100))
                    pag.append(new_page)
                o += 1
            
        if len(off) != 0:
            char_scan.append( {
                "OFF": off,
                "PAG": pag,
                "CHR": char,
            } )


PLACEHOLDER_CHAR = "⧳"

f = open(rom_file.replace(".gbc",".txt"), 'w')
for page in range(last_page+1):
    charsheet = [" "]
    for i in range(0xff):
        charsheet.append(PLACEHOLDER_CHAR)
    
    for char in char_scan:
        for i in range(len(char["PAG"])):
            if char["PAG"][i] == page:
                charsheet[char["OFF"][i]] = char["CHR"]


    # remove ending whitespace
    c = 0xff
    b = PLACEHOLDER_CHAR
    while b == PLACEHOLDER_CHAR:
        b = charsheet[c]
        c -= 1
    
    
    
    ## simple printing
    s = ""
    for i in range(c+2):
        s += charsheet[i]
        if i%32 == 31:
            s += "\n"
    
    print("PAGE: "+str(page))
    print(s+"\n\n")
    f.write("PAGE: "+str(page)+"\n"+s+"\n\n")
    

f.close()











