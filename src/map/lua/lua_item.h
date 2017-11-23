/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTItem or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _LUAITEM_H
#define _LUAITEM_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CItem;
class CLuaItem
{
    CItem* m_PLuaItem;

public:

    static const char className[];
    static Lunar<CLuaItem>::Register_t methods[];

    CLuaItem(lua_State*);
    CLuaItem(CItem*);

    CItem* GetItem() const
    {
        return m_PLuaItem;
    }

    std::int32_t getID(lua_State*);                // get the item's id
    std::int32_t getSubID(lua_State*);             // get the item's subid

    std::int32_t getFlag(lua_State*);              // get the item flag
    std::int32_t getAHCat(lua_State*);             // get the ah category

    std::int32_t getQuantity(lua_State*);          // get the quantity of item

    std::int32_t getLocationID(lua_State*);        // get the location id (container id)
    std::int32_t getSlotID(lua_State*);            // get the slot id
    std::int32_t getWornItem(lua_State*);          // check if the item has been used

    std::int32_t isType(lua_State*);               // check the item type
    std::int32_t isSubType(lua_State*);            // check the item's sub type

    std::int32_t getName(lua_State*);              // get the item's name

    std::int32_t getMod(lua_State*);               // get the power of a mod
    std::int32_t addMod(lua_State*);               // add mod to item (or add to a mod already applied on item)
    std::int32_t delMod(lua_State*);               // remove power from mod

    std::int32_t getAugment(lua_State*);           // get the augment id and power in slot
    //std::int32_t setAugment(lua_State*);           // set the augment id and power in slot

    std::int32_t getSkillType(lua_State*);         // get skill type
    std::int32_t getWeaponskillPoints(lua_State*); // get current ws points
};

#endif