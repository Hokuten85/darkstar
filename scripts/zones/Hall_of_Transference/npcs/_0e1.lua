-----------------------------------
-- Area: Hall of Transference
-- NPC:  Cermet Gate
-- @pos -220 -46 -279 14
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Hall_of_Transference/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getCurrentMission(COP) > BELOW_THE_ARKS or hasCompletedMission(COP,THE_LAST_VERSE))then
		player:startEvent(0x0096);
	else
		player:messageSpecial(DOOR_IS_CLOSED);
	end
	
	return 1;
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

	if(csid == 0x0096 and option == 1) then
		player:setPos(185.891, 0, -52.331, 128, 18); -- To Promyvion Dem {R}
	end
end;