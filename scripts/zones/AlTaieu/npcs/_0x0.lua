-----------------------------------
-- Area: Al'Taieu
--  NPC: Crystalline Field
-- !pos .1 -10 -464 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Set the PromathiaStatus to 3 if they did all 3 towers for GARDEN_OF_ANTIQUITY
    if (player:getCharVar("[SEA][AlTieu]SouthTowerCS") == 1 and player:getCharVar("[SEA][AlTieu]WestTowerCS") == 1 and player:getCharVar("[SEA][AlTieu]EastTowerCS") == 1 and player:getCharVar("PromathiaStatus") == 2) then
        player:setVar("[SEA][AlTieu]SouthTowerCS", 0);
        player:setVar("[SEA][AlTieu]WestTowerCS", 0);
        player:setVar("[SEA][AlTieu]EastTowerCS", 0);
        player:setVar("PromathiaStatus", 3);
    end

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.GARDEN_OF_ANTIQUITY and player:getCharVar("PromathiaStatus") == 1) then
        player:startEvent(164);
    elseif (player:getCurrentMission(COP) > dsp.mission.id.cop.GARDEN_OF_ANTIQUITY or (player:getCurrentMission(COP) == dsp.mission.id.cop.GARDEN_OF_ANTIQUITY and player:getCharVar("PromathiaStatus") == 3)) then
        player:startEvent(100); -- Teleport inside
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY); -- Access should be restricted if below requirements. Message is probably wrong, though.
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 100 and option == 1) then
        player:setPos(-20,0.624,-355,191,34); -- {R}
    elseif (csid == 164) then
        player:setVar("PromathiaStatus", 2);
    end
end;