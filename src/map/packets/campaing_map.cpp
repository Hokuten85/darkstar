/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../../common/socket.h"

#include <string.h>

#include "campaing_map.h"

    uint8 packet0[] = {
							0x02, 0x01, 0xC4, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x63, 0x18, 0x07, 0x00, 0xAA, 0x00, 0x14, 0x04, 0x0A, 0x10, 0x28, 0x08, 0x4A, 0x26, 0x7F, 0xC5, 
	0x4A, 0x26, 0x93, 0xC9, 0x4A, 0x26, 0x83, 0xC7, 0x4A, 0x26, 0x7F, 0xC5, 0x4A, 0x26, 0x93, 0xC9, 
	0x42, 0x12, 0x44, 0x00, 0xFA, 0x00, 0x00, 0x00, 0x2C, 0x91, 0x24, 0x00, 0x33, 0x89, 0x24, 0xC8, 
	0x0A, 0x00, 0x01, 0xF3, 0x98, 0x58, 0x12, 0x80, 0xD8, 0x88, 0x25, 0xC8, 0x03, 0x00, 0x00, 0xFA, 
	0x96, 0x58, 0x12, 0x00, 0xE3, 0x47, 0x22, 0xC8, 0x00, 0x00, 0x00, 0xFA, 0x91, 0x3C, 0x12, 0x80, 
	0x68, 0xC9, 0x1D, 0xC8, 0x07, 0x00, 0x00, 0xFA, 0x96, 0xF8, 0x11, 0x00, 0xC8, 0x12, 0x2D, 0x00, 
	0x00, 0x00, 0x00, 0xFA, 0x2C, 0x1D, 0x33, 0x00, 0x68, 0x89, 0x21, 0xC8, 0x0B, 0x00, 0x00, 0xFA, 
	0x96, 0x58, 0x12, 0x00, 0xE4, 0x50, 0x42, 0x00, 0x00, 0xFA, 0x00, 0x1F, 0x2C, 0xB1, 0x34, 0x00, 
	0x6A, 0x89, 0x1E, 0xC8, 0x00, 0x00, 0x00, 0xFA, 0x96, 0x38, 0x12, 0x00, 0x84, 0x88, 0x22, 0xC8, 
	0x00, 0x2E, 0x00, 0xF2, 0x8C, 0x28, 0x12, 0x00, 0x6B, 0x09, 0x23, 0xC8, 0x00, 0x00, 0x00, 0xFA, 
	0x96, 0x58, 0x12, 0x80, 0x64, 0x09, 0x1D, 0xC8, 0x00, 0x19, 0x00, 0xEE, 0x96, 0x20, 0x12, 0x00, 
	0xCA, 0x12, 0x35, 0x00, 0x00, 0x00, 0x00, 0xFA, 0x2C, 0x05, 0x34, 0x00};

    uint8 packet1[] = {
							0x02, 0x01, 0xC4, 0x00, 0x01, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x63, 0x18, 0x07, 0x00, 0xAA, 0x00, 0x14, 0x04, 0x0A, 0x10, 0x28, 0x08, 0x4A, 0x26, 0x7F, 0xC5, 
	0x4A, 0x26, 0x93, 0xC9, 0x4A, 0x26, 0x83, 0xC7, 0x4A, 0x26, 0x7F, 0xC5, 0x4A, 0x26, 0x93, 0xC9, 
	0x6A, 0xC9, 0x1F, 0xC8, 0x00, 0xD1, 0x00, 0xC8, 0x96, 0x58, 0x12, 0x00, 0xC6, 0x92, 0x44, 0x00, 
	0x00, 0x00, 0xFA, 0x00, 0x2C, 0xB1, 0x34, 0x00, 0x96, 0x49, 0x24, 0xC8, 0x00, 0x00, 0xFA, 0x00, 
	0x99, 0x58, 0x12, 0x00, 0x66, 0x09, 0x1F, 0xC8, 0x00, 0x00, 0xF8, 0xB4, 0x96, 0x58, 0x12, 0x00, 
	0x66, 0x49, 0x0D, 0xC8, 0x00, 0x00, 0xDB, 0xCB, 0x96, 0x58, 0x12, 0x00, 0x16, 0x49, 0x00, 0xC8, 
	0x00, 0x00, 0x26, 0xE2, 0x96, 0x38, 0x12, 0x00, 0xCC, 0x52, 0x24, 0xC8, 0x00, 0x00, 0x00, 0xFA, 
	0x2C, 0xB1, 0x32, 0x00, 0x17, 0x02, 0x00, 0xC8, 0x00, 0x00, 0x00, 0xFA, 0x64, 0x90, 0x11, 0x80, 
	0x8E, 0x8C, 0x22, 0xC8, 0x00, 0x00, 0x00, 0xFA, 0xC8, 0x94, 0x12, 0x00, 0x8E, 0x0C, 0x1E, 0xBB, 
	0x00, 0x00, 0x00, 0xFA, 0xC8, 0x38, 0x12, 0x00, 0xAE, 0x8F, 0x3E, 0xC8, 0x00, 0x00, 0x00, 0xFA, 
	0xFA, 0xE8, 0x13, 0x00, 0xAE, 0x8F, 0x3E, 0xC3, 0x00, 0x00, 0x00, 0xFA, 0xFA, 0xE8, 0x13, 0x00, 
	0x8E, 0x3E, 0xFA, 0x00, 0x00, 0x00, 0x00, 0xFA, 0xE8, 0xA3, 0x3F, 0x00};

CCampaingPacket::CCampaingPacket(CCharEntity * PChar, uint8 number) 
{
	this->type = 0x71; 
	this->size = 0x66; 

	switch (number)
	{
		case 0: memcpy(data+(0x04)-4, &packet0, 200); break;
		case 1: memcpy(data+(0x04)-4, &packet1, 200); break;
	}
}
