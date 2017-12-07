-----------------------------------
-- Area: Sealion's Den
-- NPC:  Iron Gate
-- !pos 612 132 774 32
-----------------------------------
package.loaded["scripts/zones/Sealions_Den/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/teleports");
require("scripts/zones/Sealions_Den/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == SLANDEROUS_UTTERINGS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(13);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    elseif (player:getCurrentMission(COP) > THE_WARRIOR_S_PATH) then
        player:startEvent(12);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
    if (csid == 12 and option == 1) then
        toPalaceEntrance(player);
    elseif (csid == 13) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,SLANDEROUS_UTTERINGS);
        player:addMission(COP,THE_ENDURING_TUMULT_OF_WAR);
        player:addTitle(THE_LOST_ONE);
    end
end;