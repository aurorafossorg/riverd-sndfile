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

module riverd.sndfile.dynfun;

import riverd.sndfile.types;

__gshared {
	da_sf_open sf_open;
	da_sf_open_fd sf_open_fd;
	da_sf_open_virtual sf_open_virtual;
	da_sf_error sf_error;
	da_sf_strerror sf_strerror;
	da_sf_error_number sf_error_number;
	da_sf_perror sf_perror;
	da_sf_error_str sf_error_str;
	da_sf_command sf_command;
	da_sf_format_check sf_format_check;
	da_sf_seek sf_seek;
	da_sf_set_string sf_set_string;
	da_sf_get_string sf_get_string;
	da_sf_version_string sf_version_string;
	da_sf_read_raw sf_read_raw;
	da_sf_write_raw sf_write_raw;
	da_sf_readf_short sf_readf_short;
	da_sf_writef_short sf_writef_short;
	da_sf_readf_int sf_readf_int;
	da_sf_writef_int sf_writef_int;
	da_sf_readf_float sf_readf_float;
	da_sf_writef_float sf_writef_float;
	da_sf_readf_double sf_readf_double;
	da_sf_writef_double sf_writef_double;
	da_sf_read_short sf_read_short;
	da_sf_write_short sf_write_short;
	da_sf_read_int sf_read_int;
	da_sf_write_int sf_write_int;
	da_sf_read_float sf_read_float;
	da_sf_write_float sf_write_float;
	da_sf_read_double sf_read_double;
	da_sf_write_double sf_write_double;
	da_sf_close sf_close;
	da_sf_write_sync sf_write_sync;
	da_sf_wchar_open sf_wchar_open;
}
