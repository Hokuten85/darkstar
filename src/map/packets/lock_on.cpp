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

#include "../../common/socket.h"

#include "lock_on.h"

#include "../battleentity.h"
#include "../charentity.h"


CLockOnPacket::CLockOnPacket(CCharEntity* PChar, CBattleEntity* PTarget)
{
	this->type = 0x58;
	this->size = 0x08;

	WBUFL(data,(0x04)-4) = PChar->id;
	WBUFW(data,(0x0C)-4) = PChar->targid;

	if (PTarget != NULL)
	{
		WBUFL(data,(0x08)-4) = PTarget->id;
		WBUFW(data,(0x0E)-4) = PTarget->targid;
	}
}