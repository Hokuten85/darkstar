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

#include "../common/showmsg.h"
#include "../common/utils.h"

#include "battleentity.h"
#include "enmity_container.h"
#include "battleutils.h" 
#include "charentity.h"
#include "alliance.h"


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CEnmityContainer::CEnmityContainer(CBattleEntity* holder)
{
    m_EnmityHolder = holder;
}

CEnmityContainer::~CEnmityContainer()
{
    Clear();
}

/************************************************************************
*                                                                       *
*  Clear Enmity List                                                    *
*                                                                       *
************************************************************************/

void CEnmityContainer::Clear(uint32 EntityID)
{
	if (EntityID == 0)
	{
        for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	    {
            delete it->second;
	    }
		m_EnmityList.clear();
		return; 
	}
    else
    {
	    for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	    {
		    if (it->second->PEnmityOwner->id == EntityID)
		    {
                delete it->second;
                m_EnmityList.erase(it);
                return;
		    }
	    }
    }
}

/************************************************************************
*                                                                       *
*  Минимальное (базовое) значение ненависти                             *
*                                                                       *
************************************************************************/

void CEnmityContainer::AddBaseEnmity(CBattleEntity* PChar)
{
    UpdateEnmity(PChar, 1, 1);
}

/************************************************************************
*                                                                       *
*  Add entity to hate list                                              *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmity(CBattleEntity* PEntity, int16 CE, int16 VE)
{
    EnmityList_t::iterator PEnmity = m_EnmityList.lower_bound(PEntity->id);

    if( PEnmity != m_EnmityList.end() && 
       !m_EnmityList.key_comp()(PEntity->id, PEnmity->first))
	{
		float bonus = (100.0f + dsp_cap(PEntity->getMod(MOD_ENMITY), -50, 100)) / 100.0f;

        PEnmity->second->CE += CE * bonus; 
        PEnmity->second->VE += VE * bonus;

        //Check for cap limit 
        PEnmity->second->CE = dsp_cap(PEnmity->second->CE, 1, 10000);
        PEnmity->second->VE = dsp_cap(PEnmity->second->VE, 1, 10000);
    }
    else 
    {
        EnmityObject_t* PEnmityObject = new EnmityObject_t;

		float bonus = (100.0f + dsp_cap(PEntity->getMod(MOD_ENMITY), -50, 100)) / 100.0f;

        PEnmityObject->CE = CE * bonus;
        PEnmityObject->VE = VE * bonus;
        PEnmityObject->PEnmityOwner = PEntity;

        m_EnmityList.insert(PEnmity, EnmityList_t::value_type(PEntity->id, PEnmityObject));

		//add master to the enmity list
		if(PEntity->objtype == TYPE_PET && PEntity->PMaster!=NULL){ 
			UpdateEnmity(PEntity->PMaster,0,0);
		}

		//add master to the enmity list (charmed mob)
		if(PEntity->objtype == TYPE_MOB && PEntity->PMaster!=NULL && PEntity->PMaster->objtype == TYPE_PC){ 
			UpdateEnmity(PEntity->PMaster,0,0);
		}

    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::AddPartyEnmity(CCharEntity* PChar)
{
    // TODO: добавляемые персонажи уже могут быть в списке enmity, я не уверен, что добавление базового значения здесь актуально

	if (PChar->PParty != NULL)
	{
		if (PChar->PParty->m_PAlliance == NULL)
		{
			for (uint8 i = 0; i < PChar->PParty->members.size(); ++i)
			{
				CBattleEntity* PTarget = (CBattleEntity*)PChar->PParty->members[i];
				if (distance(PChar->loc.p, PTarget->loc.p) <= 40)
				{
					AddBaseEnmity(PTarget);
				}
			}
		}else if (PChar->PParty->m_PAlliance != NULL)
				{
					for (uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
					{
							for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
							{
								CBattleEntity* PTarget = (CBattleEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members[i];
									if (distance(PChar->loc.p, PTarget->loc.p) <= 40)
									{
										AddBaseEnmity(PTarget);
									}
							}
					}
				}	

	}

}

bool CEnmityContainer::HasTargetID(uint16 TargetID){
	EnmityList_t::iterator PEnmity = m_EnmityList.lower_bound(TargetID);

    if( PEnmity != m_EnmityList.end() && 
       !m_EnmityList.key_comp()(TargetID, PEnmity->first))
	{
        return true;
    }
    else 
    {
		return false;
	}
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromCure(CBattleEntity* PEntity, uint16 level, uint16 CureAmount, bool isCureV)
{
	if(isCureV){
		UpdateEnmity(PEntity, 400, 700);
	}
	else{
		CureAmount = (CureAmount < 1 ? 1 : CureAmount);

		uint16 mod = battleutils::GetEnmityMod(level, 0);

		uint16 CE =  40 / mod * CureAmount;
		uint16 VE = 240 / mod * CureAmount;

		UpdateEnmity(PEntity, CE, VE);
	}
}

/************************************************************************
*                                                                       *
*    Lower enmity by percent %                                          *
*                                                                       *
************************************************************************/

void CEnmityContainer::LowerEnmityByPercent(CBattleEntity* PEntity, uint8 percent, CBattleEntity* HateReceiver)
{

	EnmityList_t::iterator PEnmity = m_EnmityList.lower_bound(PEntity->id);

    if( PEnmity != m_EnmityList.end() && 
       !m_EnmityList.key_comp()(PEntity->id, PEnmity->first))
	{
		float mod = ((float)(percent)/100.0f); 

		int32 CEValue = (float)(PEnmity->second->CE * mod);
        PEnmity->second->CE -= (CEValue < 0 ? 0 : CEValue); 

		int32 VEValue = (float)(PEnmity->second->VE * mod);
		PEnmity->second->VE -= (VEValue < 0 ? 0 : VEValue); 


		// transfer hate if HateReceiver not null
		if (HateReceiver != NULL)
		{
			UpdateEnmity(HateReceiver,0,0);
			EnmityList_t::iterator PEnmityReceiver = m_EnmityList.lower_bound(HateReceiver->id);
			PEnmityReceiver->second->CE += CEValue;
			PEnmityReceiver->second->VE += VEValue;
		}

    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromDamage(CBattleEntity* PEntity, uint16 Damage)
{
	// Crash fix, PEntity was in ACTION_FALL
	if (PEntity->PBattleAI->GetCurrentAction() == ACTION_FALL)
		return;


	Damage = (Damage < 1 ? 1 : Damage);

	uint16 mod = battleutils::GetEnmityMod(PEntity->GetMLevel(), 1); //default fallback

	if(m_EnmityHolder != NULL) {//use the correct mod value
		mod = battleutils::GetEnmityMod(m_EnmityHolder->GetMLevel(), 1);
	}

	uint16 CE =  (80 / mod) * Damage;
	uint16 VE = (240 / mod) * Damage;

	UpdateEnmity(PEntity, CE, VE); 
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromAttack(CBattleEntity* PEntity, uint16 Damage)
{
    UpdateEnmity(PEntity, -(1800 * Damage / PEntity->GetMaxHP()), 0);
}

/************************************************************************
*                                                                       *
*  Decay Enmity, Get Entity with the highest enmity                     *
*                                                                       *
************************************************************************/

CBattleEntity* CEnmityContainer::GetHighestEnmity()
{
	uint32 HighestEnmity = 0;
	
	CBattleEntity* PEntity = NULL;

	for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	{
		EnmityObject_t* PEnmityObject = it->second;
		uint32 Enmity = PEnmityObject->CE + PEnmityObject->VE;
		
		if (Enmity >= HighestEnmity)
		{
			HighestEnmity = Enmity;
			PEntity = PEnmityObject->PEnmityOwner;
		}
	}
    return PEntity;
}

void CEnmityContainer::DecayEnmity()
{
	CBattleEntity* PEntity = NULL;

	for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	{
		EnmityObject_t* PEnmityObject = it->second;

		//Should lose 60/sec, and this is called twice a sec, hence 30.
		PEnmityObject->VE -= PEnmityObject->VE > 30 ? 30 : PEnmityObject->VE;
	}
}