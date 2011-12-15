-----------------------------------
-- Area: Upper Jeuno
-- NPC: Collet
-- Involved in Quests: Save the Clock Tower
-- @zone 244
-- @pos 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:hasItemQty(555,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz1"); -- NPC zone1
		if(a == 0 or (a ~= 2 and a ~= 3 and a ~= 6 and a ~= 10 and a ~= 18 and a ~= 7 and a ~= 26 and a ~= 11 and 
		   a ~= 22 and a ~= 14 and a ~= 19 and a ~= 15 and a ~= 23 and a ~= 27 and a ~= 30 and a ~= 31)) then 
			player:startEvent(0x0073,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end;  

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("saveTheClockTowerVar") >= 1) then 
		player:startEvent(0x00a4);
	elseif(player:getQuestStatus(JEUNO,THE_CLOCKMASTER) == QUEST_COMPLETED) then 
		player:startEvent(0x00a3);
	else
		player:startEvent(0x00BA);
	end
end; 

-----------------------------------0x0070  0x0072  0x00ba  0x00a4  0x00a2  0x0073  0x0071  0x00a3  0x00a5  0x2776
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if(csid == 0x0073) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz1",player:getVar("saveTheClockTowerNPCz1") + 2);
	end
end;



