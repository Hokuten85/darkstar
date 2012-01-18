/*
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

#include "../../common/utils.h"

#include "item_usable.h"

CItemUsable::CItemUsable(uint16 id) : CItem(id)
{
	setType(ITEM_USABLE);

	m_UseDelay		 = 0;
	m_CurrCharges	 = 0;
	m_MaxCharges	 = 0;
	m_Animation		 = 0;
	m_AnimationTime	 = 0;
	m_ActivationTime = 0;
	m_ValidTarget	 = 0;
	m_ReuseDelay	 = 0;
	m_LastUseTime	 = 0;
}

CItemUsable::~CItemUsable()
{
}

void CItemUsable::setUseDelay(uint8 UseDelay)
{
	m_UseDelay = UseDelay;
}

uint8 CItemUsable::getUseDelay()
{
	return m_UseDelay;
}

void CItemUsable::setReuseDelay(uint32 ReuseDelay)
{
	m_ReuseDelay = ReuseDelay;
}

uint32 CItemUsable::getReuseDelay()
{
	return m_ReuseDelay;
}

void CItemUsable::setLastUseTime(uint32 LastUseTime)
{
	m_LastUseTime = LastUseTime;
}

uint32 CItemUsable::getLastUseTime()
{
	return m_LastUseTime;
}

void CItemUsable::setCurrentCharges(uint8 CurrCharges)
{
	m_CurrCharges = cap_value(CurrCharges, 0, m_MaxCharges);
}

uint8 CItemUsable::getCurrentCharges()
{
	return m_CurrCharges;
}

void CItemUsable::setMaxCharges(uint8 MaxCharges)
{
	m_MaxCharges = MaxCharges;
}

uint8 CItemUsable::getMaxCharges()
{
	return m_MaxCharges;
}

void CItemUsable::setAnimationID(uint16 Animation)
{
	m_Animation = Animation;
}

uint16 CItemUsable::getAnimationID()
{
	return m_Animation;
}

void CItemUsable::setAnimationTime(uint16 AnimationTime)
{
	m_AnimationTime = AnimationTime;
}

uint16 CItemUsable::getAnimationTime()
{
	return m_AnimationTime;
}

void CItemUsable::setActivationTime(uint16 ActivationTime)
{
	m_ActivationTime = ActivationTime;
}

uint16 CItemUsable::getActivationTime()
{
	return m_ActivationTime;
}

void CItemUsable::setValidTarget(uint8 ValidTarget)
{
	m_ValidTarget = ValidTarget;
}
	
uint8 CItemUsable::getValidTarget() 
{
	return m_ValidTarget;
}