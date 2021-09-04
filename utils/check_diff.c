#include <stdio.h>
#include <stdlib.h>

#define BASEROM_NAME "baserom.gbc"

void print_help(){
	printf("check_diff.exe [ROM to compare]\n");
	printf("\tTo run this, the base ROM must be present as %s\n", BASEROM_NAME);
}

const char* offset2addr(int offset){
	char* addr = malloc(sizeof(char) * 8);
	if (offset < 0x4000)
		sprintf(addr, "%02x:%04x", 0, (int)(offset % 0x4000));
	else
		sprintf(addr, "%02x:%04x", (int)(offset / 0x4000), (int)(offset % 0x4000 + 0x4000));
	return addr;
}

int main(int argc, char* argv[]){
	FILE *base_rom, *compare_rom;
	int base_rom_size;
	char data[2];
	
	if (argc != 2){
		print_help();
		return 0;
	}
	
	// load stuff
	if( !(base_rom = fopen(BASEROM_NAME, "rb")) ){
		printf("Can't open %s! Make sure it is present in the working directory and is readable.\n", BASEROM_NAME);
		return 1;
	}
	if( !(compare_rom = fopen(argv[1], "rb")) ){
		printf("Can't open %s! Make sure it is present in the working directory and is readable.\n", argv[1]);
		return 1;
	}
	
	// get size of base ROM
	fseek(base_rom, 0, SEEK_END);
	base_rom_size = ftell(base_rom);
	rewind(base_rom);
	
	int i = 0;
	do {
		fread(data, 1, 1, base_rom);
		fread(data+1, 1, 1, compare_rom);
		
		if (data[0] != data[1])
			printf("%8x [%s] -> %02x %02x\n", i, offset2addr(i), data[0] & 0xff, data[1] & 0xff);
		i++;
	} while (ftell(base_rom) < base_rom_size);
	
	// done
	fclose(base_rom);
	fclose(compare_rom);
	return 0;
}
