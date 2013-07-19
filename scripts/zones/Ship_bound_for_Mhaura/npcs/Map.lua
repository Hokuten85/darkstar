
-----------------------------------
-- Area: Ship_bound_for_Mhaura 
-- NPC:  Map
-- @zone 221
-- npcid 17682456
-- @pos 0.278 -14.707 -1.411
-----------------------------------
package.loaded["scripts/zones/Ship_bound_for_Selbina/TextIDs"] = nil;

-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Ship_bound_for_Selbina/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0400);
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
end;