/* WIP */

#include "lib/expat/expat.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define UNUSED(x) (void) (x)

enum ExitStatus
{
	SUCCESS = 0,
	NOT_ENOUGH_ARGUMENTS,
	UNABLE_TO_OPEN_FILE,
	UNABLE_TO_CREATE_PARSER,
	IO_ERROR,
	PARSE_ERROR,
};

static _Bool is_in_data = 0;

static void XMLCALL start(void *user, const XML_Char *name,
                          const XML_Char **atts)
{
	if (strncmp(name, "data", sizeof("data")))
	{
		return;
	}
	if (strncmp(atts[0], "encoding", sizeof("encoding")) ||
	    (strncmp(atts[1], "csv", sizeof("csv"))))
	{
		return;
	}
	is_in_data = 1;
}

static void XMLCALL end(void *user, const XML_Char *name)
{
	if (strncmp(name, "data", 4))
	{
		return;
	}
	is_in_data = 0;
}

static void XMLCALL chardata(void *user, const XML_Char *s, int len)
{
	if (!is_in_data)
	{
		return;
	}

	char num_buffer[4] = {0};
	char n;
	size_t i;
	for (i = 0; i < (size_t) len; i++)
	{
		size_t check_extra_nums;
		size_t extra_nums = 0;
		int decoded_number;

		n = s[i];
		switch (n)
		{
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
			{
				num_buffer[0] = n;

				for (check_extra_nums = 1; check_extra_nums < 3;
				     check_extra_nums++)
				{
					char x = s[i + check_extra_nums];
					if (x >= '0' && x <= '9')
					{
						num_buffer[check_extra_nums] = x;
						extra_nums++;
					}
					else
					{
						break;
					}
				}
				i += extra_nums;

				decoded_number = (uint8_t) ((atoi(num_buffer) - 1) & 0xff);
				fwrite(&decoded_number, sizeof(uint8_t), 1, user);

				num_buffer[0] = '\0';
				num_buffer[1] = '\0';
				num_buffer[2] = '\0';
				num_buffer[3] = '\0';
				break;
			}
			default:
				break;
		}
	}
}

static inline enum ExitStatus main_(int argc, char **argv)
{
	if (argc < 3)
	{
		fprintf(stderr, "%s in.tmx out.bin\n", argv[0]);
		return NOT_ENOUGH_ARGUMENTS;
	}

	char *in_file_name = argv[1];
	char *out_file_name = argv[2];

	FILE *in_file = fopen(in_file_name, "rb");
	if (!in_file)
	{
		fprintf(stderr, "cannot open file %s for reading: %m\n",
		        in_file_name);
		return UNABLE_TO_OPEN_FILE;
	}

	FILE *out_file = fopen(out_file_name, "wb");
	if (!out_file)
	{
		fprintf(stderr, "cannot open file %s for writing: %m\n",
		        out_file_name);
		return UNABLE_TO_OPEN_FILE;
	}

	XML_Parser parser = XML_ParserCreate(NULL);
	if (!parser)
	{
		fprintf(stderr, "cannot instantiate parser");
		return UNABLE_TO_CREATE_PARSER;
	}

	XML_SetUserData(parser, out_file);
	XML_SetElementHandler(parser, start, end);
	XML_SetCharacterDataHandler(parser, chardata);

	void *const buffer = XML_GetBuffer(parser, BUFSIZ);
	size_t read_bytes;
	int done = feof(in_file);

	do
	{
		int parse_status;

		read_bytes = fread(buffer, 1, BUFSIZ, in_file);
		if (ferror(in_file))
		{
			fprintf(stderr, "error reading file: %m");
			XML_ParserFree(parser);
			return IO_ERROR;
		}
		done = feof(in_file);

		parse_status = XML_ParseBuffer(parser, (int) read_bytes, done);
		if (parse_status == XML_STATUS_ERROR)
		{
			fprintf(stderr, "error\n");
			fclose(out_file);
			fclose(in_file);
			XML_ParserFree(parser);
			return PARSE_ERROR;
		}
	} while (!done);

	fclose(out_file);
	fclose(in_file);
	XML_ParserFree(parser);
	return SUCCESS;
}

int main(int argc, char **argv) { return main_(argc, argv); }
