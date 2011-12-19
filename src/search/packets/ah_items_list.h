/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _CAHITEMSLISTPACKET_H_
#define _CAHITEMSLISTPACKET_H_

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

#define PACKET_DATA_SIZE    268

class CAHItemsListPacket
{
public:

    CAHItemsListPacket(uint16 offset);
   ~CAHItemsListPacket();
    
    void SetKey(int8* key);
    void AddItem(ahItem* item);
    void SetItemCount(uint16 count);

    uint8* GetData();
    uint16 GetSize();

private:

    uint8  m_count;
    uint16 m_offset;

    blowfish_t blowfish;

    int8  m_key[24];

    uint8 m_PData[PACKET_DATA_SIZE];
};

#endif