-----------------------------------
-- Area: Korroloka Tunnel
--  NPC: Excavation Point
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs")
require("scripts/globals/excavation")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.excavation.onTrade(player, npc, trade, 0)
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.MINING_IS_POSSIBLE_HERE, 605)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end