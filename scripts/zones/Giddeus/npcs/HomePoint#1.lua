-----------------------------------
-- Area: Giddeus
--  NPC: HomePoint#1
-- !pos -132 -3 -303 145
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Giddeus/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 54);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;
