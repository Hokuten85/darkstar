﻿/*
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

#ifndef _CABILITY_H
#define _CABILITY_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "battleentity.h"

#define MAX_ABILITY_ID	256

class CAbility
{
public:

	CAbility(uint16 id);

	uint16		getID();
	JOBTYPE		getJob();
	uint8		getLevel();
	uint8		getAnimationID();
	uint8		getRange();
	uint8		getAOE();
	uint8		getValidTarget();
	uint16		getRecastTime();
	uint8		getRecastId();

	void		setID(uint16 id);
	void		setJob(JOBTYPE Job);
	void		setLevel(uint8 level);
	void		setAnimationID(uint8 animationID);
	void		setRange(uint8 range);
	void		setAOE(uint8 aoe);
	void		setValidTarget(uint8 validTarget);
	void		setRecastTime(uint16 recastTime);
	void		setRecastId(uint8 recastId); 

	const int8* getName();
	void		setName(int8* name);
	
private:

	uint16		m_ID;
	JOBTYPE		m_Job;
	uint8		m_level;
	uint8		m_animationID;
	uint8		m_range;
	uint8		m_aoe;
	uint8		m_validTarget;
	uint16		m_recastTime;
	uint8		m_recastId;
	string_t	m_name;

};

#endif