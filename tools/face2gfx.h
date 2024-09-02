#pragma once

#include "lib/miniz/miniz.h"
#include "lib/plum/libplum.h"

#define TILE_PIXELS 8
#define BPP_SIZE 2 /* bytes per tile row */
#define SQUARE_SIZE 4
#define TILE_DATA_SIZE BPP_SIZE * 8
#define PAL_ENTRY_SIZE 2
#define NUM_PALETTES 4

/* size of the final Game Boy gfx data*/
#define SIZE_OF_2BPP_DATA (TILE_DATA_SIZE * SQUARE_SIZE * SQUARE_SIZE)

/* size of the raw colormap indices */
#define SIZE_OF_COLOR_INDICES                                             \
	(SQUARE_SIZE * SQUARE_SIZE * TILE_PIXELS * TILE_PIXELS)

struct ImgBuffers
{
	struct plum_buffer colormap;
	struct plum_buffer base;
	struct plum_buffer sprite;
};

/* data to be exported */
struct Exports
{
	uint8_t bg_pal[PAL_ENTRY_SIZE * NUM_PALETTES];
	uint8_t bg_gfx[SIZE_OF_2BPP_DATA];

	uint8_t obj_pal[PAL_ENTRY_SIZE * NUM_PALETTES];
	uint8_t obj_gfx[SIZE_OF_2BPP_DATA];
};

/* original 32-bit palettes */
struct OGPalInfo
{
	uint32_t bg[NUM_PALETTES];
	uint32_t obj[NUM_PALETTES];
};

enum ExitStatus
{
	SUCCESS = 0,
	INSUFFICIENT_ARGUMENTS,
	CANNOT_LOAD_ZIP,
	INVALID_MIMETYPE,
	CANNOT_EXTRACT_IMAGES,
	CANNOT_CONVERT_IMAGES,
	CANNOT_SAVE_IMAGES,
};

static int check_mimetype(mz_zip_archive *zip);

static int extract_imgs_from_zip(mz_zip_archive *zip,
                                 struct ImgBuffers *img_info);

static int convert_image(struct ImgBuffers *img, struct Exports *baked);

static int indexize(struct plum_image *img, uint32_t palinfo[NUM_PALETTES],
                    uint8_t *target_indices);

static void palettize(uint32_t palinfo[NUM_PALETTES],
                     uint8_t gbcpal[PAL_ENTRY_SIZE * NUM_PALETTES]);

static int gfx_from_index(uint8_t *source_indices, uint8_t *target_bytes,
                          size_t n);

static int save_converted_image(const char *original_name,
                                struct Exports *baked);
