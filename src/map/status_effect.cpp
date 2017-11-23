/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

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

#include "../common/utils.h"

#include "entities/battleentity.h"
#include "status_effect.h"
#include "status_effect_container.h"


CStatusEffect::CStatusEffect(EFFECT id, std::uint16_t icon, std::uint16_t power, std::uint32_t tick, std::uint32_t duration, std::uint32_t subid, std::uint16_t subPower, std::uint16_t tier) :
    m_StatusID(id), m_SubID(subid), m_Icon(icon), m_Power(power), m_SubPower(subPower), m_Tier(tier), m_TickTime(tick * 1000), m_Duration(duration * 1000)
{
    if (m_TickTime < 3000 && m_TickTime != 0)
    {
        ShowWarning("Status Effect tick time less than 3s is no longer supported.  Effect ID: %d\n", id);
    }
}

CStatusEffect::~CStatusEffect()
{
}

const std::int8_t* CStatusEffect::GetName()
{
	return (const std::int8_t*)m_Name.c_str();
}

void CStatusEffect::SetOwner(CBattleEntity* Owner)
{
    m_POwner = Owner;
}

EFFECT CStatusEffect::GetStatusID()
{
	return m_StatusID;
}

CBattleEntity* CStatusEffect::GetOwner()
{
	return m_POwner;
}

std::uint32_t CStatusEffect::GetSubID()
{
	return m_SubID;
}

std::uint16_t CStatusEffect::GetType()
{
    return m_Type;
}

std::uint16_t CStatusEffect::GetIcon()
{
	return m_Icon;
}

std::uint16_t CStatusEffect::GetPower()
{
	return m_Power;
}

std::uint16_t CStatusEffect::GetSubPower()
{
    return m_SubPower;
}

std::uint16_t CStatusEffect::GetTier()
{
    return m_Tier;
}

std::uint32_t CStatusEffect::GetFlag()
{
	return m_Flag;
}

std::uint32_t CStatusEffect::GetTickTime()
{
	return m_TickTime;
}

std::uint32_t CStatusEffect::GetDuration()
{
	return m_Duration;
}

int CStatusEffect::GetElapsedTickCount()
{
    return m_tickCount;
}

time_point CStatusEffect::GetStartTime()
{
	return m_StartTime;
}

void CStatusEffect::SetFlag(std::uint32_t Flag)
{
    m_Flag |= Flag;
}

void CStatusEffect::UnsetFlag(std::uint32_t flag)
{
    m_Flag &= ~flag;
}

void CStatusEffect::SetIcon(std::uint16_t Icon)
{
    DSP_DEBUG_BREAK_IF(m_POwner == nullptr);

	m_Icon = Icon;
    m_POwner->StatusEffectContainer->UpdateStatusIcons();
}

void CStatusEffect::SetType(std::uint16_t Type)
{
    m_Type = Type;
}

void CStatusEffect::SetPower(std::uint16_t Power)
{
	m_Power = Power;
}

void CStatusEffect::SetSubPower(std::uint16_t subPower)
{
    m_SubPower = subPower;
}

void CStatusEffect::SetTier(std::uint16_t tier)
{
    m_Tier = tier;
}

void CStatusEffect::SetDuration(std::uint32_t Duration)
{
	m_Duration = Duration;
}

void CStatusEffect::SetStartTime(time_point StartTime)
{
	m_tickCount  = 0;
	m_StartTime = StartTime;
}

void CStatusEffect::SetTickTime(std::uint32_t tick)
{
	m_TickTime = tick;
}

void CStatusEffect::IncrementElapsedTickCount()
{
    ++m_tickCount;
}

void CStatusEffect::SetName(const std::int8_t* name)
{
	m_Name.clear();
	m_Name.insert(0, (const char*)name);
}

void CStatusEffect::SetName(string_t name)
{
	m_Name = name;
}

void CStatusEffect::addMod(Mod modType, std::int16_t amount)
{
	for (std::uint32_t i = 0; i < modList.size(); ++i)
	{
		if (modList.at(i).getModID() == modType)
		{
			modList.at(i).setModAmount(modList.at(i).getModAmount() + amount);
			return;
		}
	}
	modList.push_back(CModifier(modType, amount));
}