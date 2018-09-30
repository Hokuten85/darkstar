-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Excavation Point
-----------------------------------
require("scripts/globals/excavation");
local ID = require("scripts/zones/Attohwa_Chasm/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    startExcavation(player,player:getZoneID(),npc,trade,10);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;