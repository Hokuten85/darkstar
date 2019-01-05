-----------------------------------
-- Area: Toraimarai Canal
--  NPC: ???
-- Involved In Quest: Wild Card
-- !pos -95 16 -31 169
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/treasure");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    if (player:getVar("***REMOVED***Problem") == 2) then
        if (player:getVar("***REMOVED***ProblemQ2") <= 1) then
            if (player:hasStatusEffect(dsp.effect.MANAFONT) == true) then
                player:startEvent(47);
            else
                player:startEvent(46);
            end
        else
            player:startEvent(42);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

function onEventFinish(player,csid,option)

    if (csid == 47) then
        player:setVar("***REMOVED***ProblemQ2",2);
    end
end;
