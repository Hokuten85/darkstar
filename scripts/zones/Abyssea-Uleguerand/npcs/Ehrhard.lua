-----------------------------------
-- Area: Abyssea_Uleguerand
--  NPC: Ehrhard
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Uleguerand/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(360);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;