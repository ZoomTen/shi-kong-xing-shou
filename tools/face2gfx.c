#define _POSIX_C_SOURCE 200809L

#include "./face2gfx.h"
#include <string.h>

enum ExitStatus main_(int argc, char **argv)
{
	mz_zip_archive zip = {0};
	struct ImgBuffers img_info;
	struct Exports baked_img_info;
	mz_bool zip_result;
	int mimecheck;
	int extractcheck;
	int convert1check;
	int savecheck;

	if (argc < 2)
	{
		fprintf(stderr, "%s face_XX.ora\n", argv[0]);
		return INSUFFICIENT_ARGUMENTS;
	}

	const char *file_name = argv[1];

	zip_result = mz_zip_reader_init_file(&zip, file_name, 0);
	if (!zip_result)
	{
		fprintf(stderr, "%s\n", mz_zip_get_error_string(zip.m_last_error));
		return CANNOT_LOAD_ZIP;
	}

	mimecheck = check_mimetype(&zip);
	if (mimecheck)
	{
		mz_zip_reader_end(&zip);
		return INVALID_MIMETYPE;
	}

	extractcheck = extract_imgs_from_zip(&zip, &img_info);
	if (extractcheck)
	{
		mz_zip_reader_end(&zip);
		return CANNOT_EXTRACT_IMAGES;
	}

	mz_zip_reader_end(&zip);

	convert1check = convert_image(&img_info, &baked_img_info);
	if (convert1check)
	{
		return CANNOT_CONVERT_IMAGES;
	}

	mz_free(img_info.colormap.data);
	mz_free(img_info.base.data);
	mz_free(img_info.sprite.data);

	savecheck = save_converted_image(file_name, &baked_img_info);
	if (savecheck)
	{
		return CANNOT_SAVE_IMAGES;
	}

	return SUCCESS;
}

int main(int argc, char **argv) { return main_(argc, argv); }

int save_converted_image(const char *original_name, struct Exports *baked)
{
	int len;
	char *base_name;
	char *new_name;
	FILE *f;

	len = strlen(original_name) + 10; /* some room for the new text */
	base_name = strdup(original_name);
	{
		char *i = strstr(base_name, ".ora");
		if (!i)
		{
			free(base_name);
			return 1;
		}
		*i = '\0'; /* cut the string here */
	}

	new_name = (char *) malloc(len + 1);

	{ /* export BG tiles in row-major tile order */
		snprintf(new_name, len + 1, "%s.bg.2bpp", base_name);
		f = fopen(new_name, "wb");
		fwrite(baked->bg_gfx, 1, sizeof(baked->bg_gfx), f);
	}

	{ /* export OBJ tiles in column-major tile order */
		uint8_t *cursor;

		snprintf(new_name, len + 1, "%s.obj.2bpp", base_name);
		f = freopen(new_name, "wb", f);
		cursor = baked->obj_gfx;
		for (size_t k = 0; k < 4; k++)
		{
			fwrite(cursor, 1, TILE_DATA_SIZE, f);
			fwrite(cursor + (TILE_DATA_SIZE * 4), 1, TILE_DATA_SIZE, f);
			cursor += TILE_DATA_SIZE;
		}
		cursor = baked->obj_gfx + 0x80;
		for (size_t k = 0; k < 4; k++)
		{
			fwrite(cursor, 1, TILE_DATA_SIZE, f);
			fwrite(cursor + (TILE_DATA_SIZE * 4), 1, TILE_DATA_SIZE, f);
			cursor += TILE_DATA_SIZE;
		}
	}

	{ /* export BG palette */
		snprintf(new_name, len + 1, "%s.bg.gbcpal", base_name);
		f = freopen(new_name, "wb", f);
		fwrite(baked->bg_pal, 1, sizeof(baked->bg_pal), f);
	}

	{ /* export OBJ palette */
		snprintf(new_name, len + 1, "%s.obj.gbcpal", base_name);
		f = freopen(new_name, "wb", f);
		fwrite(baked->obj_pal, 1, sizeof(baked->obj_pal), f);
	}

	fclose(f);
	free(new_name);
	free(base_name);
	return 0;
}

int gfx_from_index(uint8_t *source_indices, uint8_t *target_bytes,
                   size_t n)
{
	if (n % 8 != 0)
	{
		fprintf(stderr, "size not divisible by 8\n");
		return 1;
	}

	{ /* Pardon the smell */
		int counter = 0;
		struct idk_anymore_man
		{
			uint8_t pix7l : 1;
			uint8_t pix6l : 1;
			uint8_t pix5l : 1;
			uint8_t pix4l : 1;
			uint8_t pix3l : 1;
			uint8_t pix2l : 1;
			uint8_t pix1l : 1;
			uint8_t pix0l : 1;
			uint8_t pix7h : 1;
			uint8_t pix6h : 1;
			uint8_t pix5h : 1;
			uint8_t pix4h : 1;
			uint8_t pix3h : 1;
			uint8_t pix2h : 1;
			uint8_t pix1h : 1;
			uint8_t pix0h : 1;
		} result;

		for (size_t i = 0; i < n; i += 8)
		{
			result.pix0h = (source_indices[i + 0] >> 1) && 1;
			result.pix0l = source_indices[i + 0] & 1;
			result.pix1h = (source_indices[i + 1] >> 1) && 1;
			result.pix1l = source_indices[i + 1] & 1;
			result.pix2h = (source_indices[i + 2] >> 1) && 1;
			result.pix2l = source_indices[i + 2] & 1;
			result.pix3h = (source_indices[i + 3] >> 1) && 1;
			result.pix3l = source_indices[i + 3] & 1;
			result.pix4h = (source_indices[i + 4] >> 1) && 1;
			result.pix4l = source_indices[i + 4] & 1;
			result.pix5h = (source_indices[i + 5] >> 1) && 1;
			result.pix5l = source_indices[i + 5] & 1;
			result.pix6h = (source_indices[i + 6] >> 1) && 1;
			result.pix6l = source_indices[i + 6] & 1;
			result.pix7h = (source_indices[i + 7] >> 1) && 1;
			result.pix7l = source_indices[i + 7] & 1;
			memcpy(&target_bytes[counter * 2], &result, sizeof(result));
			counter++;
		}
	}

	return 0;
}

void palettize(uint32_t palinfo[NUM_PALETTES],
               uint8_t gbcpal[PAL_ENTRY_SIZE * NUM_PALETTES])
{
	/* Transform to GBC palettes */
	for (size_t i = 0; i < (PAL_ENTRY_SIZE * NUM_PALETTES); i += 2)
	{
		uint32_t cur_entry = palinfo[i >> 1];
		uint32_t b = ((cur_entry >> 16) & 0xff) / 8;
		uint32_t g = ((cur_entry >> 8) & 0xff) / 8;
		uint32_t r = ((cur_entry) &0xff) / 8;
		uint16_t gp = (uint16_t)((r) + (g << 5) + (b << 10));

		gbcpal[i] = (uint8_t)(gp & 0xff);
		gbcpal[i + 1] = (uint8_t)((gp >> 8) & 0xff);
	}
}

/* Also transforms image into planar data */
int indexize(struct plum_image *img, uint32_t palinfo[4],
             uint8_t *target_indices)
{
	int counter = 0;
	int origindex;
	int got_matching_entry = 0;
	uint32_t current_pixel;
	uint32_t w = img->width;
	uint32_t h = img->height;

	for (size_t tcol = 0; tcol < h; tcol += 8) /* tile column */
	{
		for (size_t trow = 0; trow < w; trow += 8) /* tile row */
		{
			/* for one tile */
			for (size_t pcol = 0; pcol < 8; pcol++) /* pixel column */
			{
				for (size_t prow = 0; prow < 8; prow++) /* pixel row */
				{
					origindex = (w * (pcol + tcol)) + (prow + trow);
					current_pixel = img->data32[origindex];
					got_matching_entry = 0;

					/* try to find matching palettes */
					for (size_t found = 0; found < 4; found++)
					{
						if (current_pixel == palinfo[found])
						{
							target_indices[counter] = found;
							got_matching_entry = 1;
							break;
						}
					}
					if (!got_matching_entry)
					{
						fprintf(stderr,
						        "unable to find suitable palette entry at "
						        "index %d\n",
						        origindex);
						return 1;
					}
					counter++;
				}
			}
		}
	}
	return 0;
}

#define FLAGS PLUM_COLOR_32 | PLUM_PALETTE_NONE | PLUM_ALPHA_REMOVE
int convert_image(struct ImgBuffers *img, struct Exports *baked)
{
	unsigned int e;
	struct OGPalInfo rawpal;
	struct plum_image *pal, *bg, *obj;

	uint8_t bg_idx[SIZE_OF_COLOR_INDICES];
	uint8_t obj_idx[SIZE_OF_COLOR_INDICES];

	bg = plum_load_image(&img->base, PLUM_MODE_BUFFER, FLAGS, &e);
	if (e)
	{
		fprintf(stderr, "error loading base: %s\n",
		        plum_get_error_text(e));
		return e;
	}

	obj = plum_load_image(&img->sprite, PLUM_MODE_BUFFER, FLAGS, &e);
	if (e)
	{
		plum_destroy_image(bg);
		fprintf(stderr, "error loading sprite: %s\n",
		        plum_get_error_text(e));
		return e;
	}

	pal = plum_load_image(&img->colormap, PLUM_MODE_BUFFER, FLAGS, &e);
	if (e)
	{
		plum_destroy_image(bg);
		plum_destroy_image(obj);
		fprintf(stderr, "error loading colormap: %s\n",
		        plum_get_error_text(e));
		return e;
	}

	memcpy(&rawpal.bg, &pal->data32[0], sizeof(rawpal.bg));
	memcpy(&rawpal.obj, &pal->data32[4], sizeof(rawpal.obj));
	plum_destroy_image(pal);

	if (indexize(bg, rawpal.bg, bg_idx) ||
	    indexize(obj, rawpal.obj, obj_idx))
	{
		plum_destroy_image(bg);
		plum_destroy_image(obj);
		return 1;
	}

	plum_destroy_image(pal);
	plum_destroy_image(bg);
	plum_destroy_image(obj);

	palettize(rawpal.bg, baked->bg_pal);
	palettize(rawpal.obj, baked->obj_pal);

	if (gfx_from_index(bg_idx, baked->bg_gfx, sizeof(bg_idx)) ||
	    gfx_from_index(obj_idx, baked->obj_gfx, sizeof(obj_idx)))
	{
		return 1;
	}

	return 0;
}
#undef FLAGS

int extract_imgs_from_zip(mz_zip_archive *zip, struct ImgBuffers *im)
{
	im->colormap.data = mz_zip_reader_extract_file_to_heap(
	    zip, "data/layer0.png", &im->colormap.size, 0);

	if (zip->m_last_error != MZ_ZIP_NO_ERROR)
	{
		fprintf(stderr, "unable to open data/layer0.png: %s\n",
		        mz_zip_get_error_string(zip->m_last_error));
		return zip->m_last_error;
	}

	im->base.data = mz_zip_reader_extract_file_to_heap(
	    zip, "data/layer1.png", &im->base.size, 0);

	if (zip->m_last_error != MZ_ZIP_NO_ERROR)
	{
		fprintf(stderr, "unable to open data/layer1.png: %s\n",
		        mz_zip_get_error_string(zip->m_last_error));
		return zip->m_last_error;
	}

	im->sprite.data = mz_zip_reader_extract_file_to_heap(
	    zip, "data/layer2.png", &im->sprite.size, 0);

	if (zip->m_last_error != MZ_ZIP_NO_ERROR)
	{
		fprintf(stderr, "unable to open data/layer2.png: %s\n",
		        mz_zip_get_error_string(zip->m_last_error));
		return zip->m_last_error;
	}

	return 0;
}

#define ORA_MIMETYPE "image/openraster"
int check_mimetype(mz_zip_archive *zip)
{
	char mimetype_check[sizeof(ORA_MIMETYPE)] = {0};
	mz_bool extract_result;

	extract_result = mz_zip_reader_extract_file_to_mem(
	    zip, "mimetype", mimetype_check, sizeof(ORA_MIMETYPE), 0);

	if (!extract_result)
	{
		fprintf(stderr, "unable to open mimetype: %s\n",
		        mz_zip_get_error_string(zip->m_last_error));
		return zip->m_last_error;
	}

	if (strncmp(ORA_MIMETYPE, mimetype_check, sizeof(ORA_MIMETYPE)))
	{
		fprintf(stderr, "invalid mimetype for this file\n");
		return 1;
	}

	return 0;
}
#undef ORA_MIMETYPE
