/*
                                    __
                                   / _|
  __ _ _   _ _ __ ___  _ __ __ _  | |_ ___  ___ ___
 / _` | | | | '__/ _ \| '__/ _` | |  _/ _ \/ __/ __|
| (_| | |_| | | | (_) | | | (_| | | || (_) \__ \__ \
 \__,_|\__,_|_|  \___/|_|  \__,_| |_| \___/|___/___/

Copyright (C) 2018-2019 Aurora Free Open Source Software.

This file is part of the Aurora Free Open Source Software. This
organization promote free and open source software that you can
redistribute and/or modify under the terms of the GNU Lesser General
Public License Version 3 as published by the Free Software Foundation or
(at your option) any later version approved by the Aurora Free Open Source
Software Organization. The license is available in the package root path
as 'LICENSE' file. Please review the following information to ensure the
GNU Lesser General Public License version 3 requirements will be met:
https://www.gnu.org/licenses/lgpl.html .

Alternatively, this file may be used under the terms of the GNU General
Public License version 3 or later as published by the Free Software
Foundation. Please review the following information to ensure the GNU
General Public License requirements will be met:
http://www.gnu.org/licenses/gpl-3.0.html.

NOTE: All products, services or anything associated to trademarks and
service marks used or referenced on this file are the property of their
respective companies/owners or its subsidiaries. Other names and brands
may be claimed as the property of others.

For more info about intellectual property visit: aurorafoss.org or
directly send an email to: contact (at) aurorafoss.org .
*/

module riverd.sndfile.statfun;

import riverd.sndfile.types;
import core.stdc.stdarg;

extern(C) @nogc nothrow:

	/* Open the specified file for read, write or both. On error, this will
 ** return a NULL pointer. To find the error number, pass a NULL SNDFILE
 ** to sf_strerror ().
 ** All calls to sf_open() should be matched with a call to sf_close().
 */

SNDFILE* 	sf_open		(const char *path, int mode, SF_INFO *sfinfo) ;


/* Use the existing file descriptor to create a SNDFILE object. If close_desc
 ** is TRUE, the file descriptor will be closed when sf_close() is called. If
 ** it is FALSE, the descritor will not be closed.
 ** When passed a descriptor like this, the library will assume that the start
 ** of file header is at the current file offset. This allows sound files within
 ** larger container files to be read and/or written.
 ** On error, this will return a NULL pointer. To find the error number, pass a
 ** NULL SNDFILE to sf_strerror ().
 ** All calls to sf_open_fd() should be matched with a call to sf_close().

 */

SNDFILE* 	sf_open_fd	(int fd, int mode, SF_INFO *sfinfo, int close_desc) ;

SNDFILE* 	sf_open_virtual	(SF_VIRTUAL_IO *sfvirtual, int mode, SF_INFO *sfinfo, void *user_data) ;


/* sf_error () returns a error number which can be translated to a text
 ** string using sf_error_number().
 */

int		sf_error		(SNDFILE *sndfile) ;


/* sf_strerror () returns to the caller a pointer to the current error message for
 ** the given SNDFILE.
 */

const(char)* sf_strerror (SNDFILE *sndfile) ;


/* sf_error_number () allows the retrieval of the error string for each internal
 ** error number.
 **
 */

const(char)*	sf_error_number	(int errnum) ;


/* The following two error functions are deprecated but they will remain in the
 ** library for the forseeable future. The function sf_strerror() should be used
 ** in their place.
 */

int		sf_perror		(SNDFILE *sndfile) ;
int		sf_error_str	(SNDFILE *sndfile, char* str, size_t len) ;


/* Return TRUE if fields of the SF_INFO struct are a valid combination of values. */

int		sf_command	(SNDFILE *sndfile, int command, void *data, int datasize) ;


/* Return TRUE if fields of the SF_INFO struct are a valid combination of values. */

int		sf_format_check	(const SF_INFO *info) ;


/* Seek within the waveform data chunk of the SNDFILE. sf_seek () uses
 ** the same values for whence (SEEK_SET, SEEK_CUR and SEEK_END) as
 ** stdio.h function fseek ().
 ** An offset of zero with whence set to SEEK_SET will position the
 ** read / write pointer to the first data sample.
 ** On success sf_seek returns the current position in (multi-channel)
 ** samples from the start of the file.
 ** Please see the libsndfile documentation for moving the read pointer
 ** separately from the write pointer on files open in mode SFM_RDWR.
 ** On error all of these functions return -1.
 */

sf_count_t	sf_seek 		(SNDFILE *sndfile, sf_count_t frames, int whence) ;


/* Functions for retrieving and setting string data within sound files.
 ** Not all file types support this features; AIFF and WAV do. For both
 ** functions, the str_type parameter must be one of the SF_STR_* values
 ** defined above.
 ** On error, sf_set_string() returns non-zero while sf_get_string()
 ** returns NULL.
 */

int sf_set_string (SNDFILE *sndfile, int str_type, const char* str) ;

const(char)* sf_get_string (SNDFILE *sndfile, int str_type) ;


/* Return the library version string. */

const(char)* sf_version_string () ;


/* Functions for reading/writing the waveform data of a sound file.
 */

sf_count_t	sf_read_raw		(SNDFILE *sndfile, void *ptr, sf_count_t bytes) ;
sf_count_t	sf_write_raw 	(SNDFILE *sndfile, const void *ptr, sf_count_t bytes) ;


/* Functions for reading and writing the data chunk in terms of frames.
 ** The number of items actually read/written = frames * number of channels.
 **     sf_xxxx_raw		read/writes the raw data bytes from/to the file
 **     sf_xxxx_short	passes data in the native short format
 **     sf_xxxx_int		passes data in the native int format
 **     sf_xxxx_float	passes data in the native float format
 **     sf_xxxx_double	passes data in the native double format
 ** All of these read/write function return number of frames read/written.
 */

sf_count_t	sf_readf_short	(SNDFILE *sndfile, short *ptr, sf_count_t frames) ;
sf_count_t	sf_writef_short	(SNDFILE *sndfile, const short *ptr, sf_count_t frames) ;

sf_count_t	sf_readf_int	(SNDFILE *sndfile, int *ptr, sf_count_t frames) ;
sf_count_t	sf_writef_int 	(SNDFILE *sndfile, const int *ptr, sf_count_t frames) ;

sf_count_t	sf_readf_float	(SNDFILE *sndfile, float *ptr, sf_count_t frames) ;
sf_count_t	sf_writef_float	(SNDFILE *sndfile, const float *ptr, sf_count_t frames) ;

sf_count_t	sf_readf_double		(SNDFILE *sndfile, double *ptr, sf_count_t frames) ;
sf_count_t	sf_writef_double	(SNDFILE *sndfile, const double *ptr, sf_count_t frames) ;


/* Functions for reading and writing the data chunk in terms of items.
 ** Otherwise similar to above.
 ** All of these read/write function return number of items read/written.
 */

sf_count_t	sf_read_short	(SNDFILE *sndfile, short *ptr, sf_count_t items) ;
sf_count_t	sf_write_short	(SNDFILE *sndfile, const short *ptr, sf_count_t items) ;

sf_count_t	sf_read_int		(SNDFILE *sndfile, int *ptr, sf_count_t items) ;
sf_count_t	sf_write_int 	(SNDFILE *sndfile, const int *ptr, sf_count_t items) ;

sf_count_t	sf_read_float	(SNDFILE *sndfile, float *ptr, sf_count_t items) ;
sf_count_t	sf_write_float	(SNDFILE *sndfile, const float *ptr, sf_count_t items) ;

sf_count_t	sf_read_double	(SNDFILE *sndfile, double *ptr, sf_count_t items) ;
sf_count_t	sf_write_double	(SNDFILE *sndfile, const double *ptr, sf_count_t items) ;


/* Close the SNDFILE and clean up all memory allocations associated with this
 ** file.
 ** Returns 0 on success, or an error number.
 */

int		sf_close		(SNDFILE *sndfile) ;


/* If the file is opened SFM_WRITE or SFM_RDWR, call fsync() on the file
 ** to force the writing of data to disk. If the file is opened SFM_READ
 ** no action is taken.
 */

void	sf_write_sync	(SNDFILE *sndfile) ;



/* The function sf_wchar_open() is Windows Only!
 ** Open a file passing in a Windows Unicode filename. Otherwise, this is
 ** the same as sf_open().
 **
 ** In order for this to work, you need to do the following:
 **
 **		#include <windows.h>
 **		#define ENABLE_SNDFILE_WINDOWS_PROTOTYPES 1
 **		#including <sndfile.h>
 */

version (Windows)
{
	SNDFILE* sf_wchar_open (wchar* wpath, int mode, SF_INFO *sfinfo) ;
}
