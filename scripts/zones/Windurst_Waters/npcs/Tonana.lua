-----------------------------------
--	Area: Windurst Waters
--	NPC: Tonana
--	Warps players to Windurst Woods
--	Working 100%
-----------------------------------

package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x23b);
end;

-----------------------------------
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
	if (option == 1) then
		player:setPos(107,-5,-135,64,241);
	end
end;



