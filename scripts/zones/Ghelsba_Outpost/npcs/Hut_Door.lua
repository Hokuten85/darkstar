-----------------------------------
-- Area: Ghelsba_Outpost
-- NPC:  Hut Door
-- !pos -165.357 -11.672 77.771 140
-------------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");


function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end

end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.ORCISH_HUT_KEY)) then
        if (player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN)) then
            player:startEvent(3);
        else
            player:startEvent(55);
        end
    else
        if (EventTriggerBCNM(player,npc)) then
            return;
        end
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (csid == 3 or csid == 55) then
        player:delKeyItem(dsp.ki.ORCISH_HUT_KEY);
        player:setVar("MissionStatus",4);
    else
        if (EventFinishBCNM(player,csid,option)) then
            return;
        end
    end

end;