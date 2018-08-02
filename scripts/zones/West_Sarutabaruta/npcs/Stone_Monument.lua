-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Stone Monument
--  Involved in quest "An Explorer's Footsteps"
-- !pos -205.593 -23.210 -119.670 115
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs");
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(900);
end;

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1 and trade:hasItemQty(571,1)) then
        player:tradeComplete();
        player:addItem(570);
        player:messageSpecial(ID.text.ITEM_OBTAINED,570);
        player:setVar("anExplorer-CurrentTablet",0x00400);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;