#include <stdio.h>
#include "lib/miniz/miniz.h"

int main(void)
{
	mz_zip_archive zip = {0};
	mz_zip_archive_file_stat stat;

	mz_bool status =
	    mz_zip_reader_init_file(&zip, "../gfx/faces/face_00.ora", 0);

	for (size_t i = 0; i < (size_t) mz_zip_reader_get_num_files(&zip); i++)
	{
		mz_zip_reader_file_stat(&zip, i, &stat);
		puts(stat.m_filename);
	}
	mz_zip_reader_end(&zip);
	return 0;
}
