-----------------------------------
-- Area: Upper Jeuno
--  NPC: Balkehr
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(39);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

