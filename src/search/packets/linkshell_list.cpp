﻿/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "../../common/showmsg.h"
#include "../../common/socket.h"
#include "../../common/utils.h"

#include "../data_loader.h"

#include <string.h>

#include "linkshell_list.h"


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CLinkshellListPacket::CLinkshellListPacket()
{
    memset(m_data, 0, sizeof(m_data));

    WBUFB(m_data,(0x0A)) = 0x80;
	WBUFB(m_data,(0x0B)) = 0x00;                       // packet type

    WBUFB(m_data,(0x0E)) = 0x00;                       // количество персонажей в пакете
}

CLinkshellListPacket::~CLinkshellListPacket()
{
    
}

/************************************************************************
*																		*
*  Добавляем персонажа в пакет                                          *
*																		*
************************************************************************/

void CLinkshellListPacket::AddPlayer(SearchEntity* PPlayer) 
{
    delete PPlayer;
}

/************************************************************************
*																		*
*  Возвращаем собранный пакет                                           *
*																		*
************************************************************************/

uint8* CLinkshellListPacket::GetData()
{
    uint8 packet[] = 
    {
        0x8C, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x8B, 0xC8, 0xC4, 0xF6, 0x1E, 0xD7, 0x81, 0xB1, 
        0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 0x3A, 0x8A, 0x04, 0x17, 0xF9, 0x11, 0x45, 0x4D, 
        0xB2, 0xD4, 0xF4, 0x84, 0xF5, 0xE0, 0x36, 0x76, 0x0C, 0xD4, 0xA2, 0xBB, 0x99, 0x77, 0x4E, 0xA9, 
        0xCB, 0x50, 0xC8, 0xBC, 0xFD, 0x51, 0x3A, 0xDE, 0x61, 0x8F, 0x18, 0x67, 0xD6, 0x21, 0xB2, 0xEF, 
        0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 
        0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 
        0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 
        0x7B, 0x25, 0xC4, 0xEA, 0xD3, 0x31, 0x04, 0x0F, 0xE3, 0x51, 0x55, 0xAC, 0x0A, 0xCE, 0x0C, 0x21, 
        0xDB, 0xEB, 0x8B, 0xF9, 0xD6, 0x1A, 0xFA, 0x87, 0xA1, 0x3D, 0x68, 0x87
    };

    memcpy(m_data, packet, sizeof(packet));

    return m_data;
}

/************************************************************************
*																		*
*  Возвращаем размер отправляемого пакета                               *
*																		*
************************************************************************/

uint16 CLinkshellListPacket::GetSize()
{
    return 140;
}