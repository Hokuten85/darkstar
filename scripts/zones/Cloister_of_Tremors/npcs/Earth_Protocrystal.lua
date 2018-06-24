-----------------------------------
-- Area: Cloister of Tremors
-- NPC:  Earth Protocrystal
-- Involved in Quest: Trial by Earth
-- !pos -539 1 -493 209
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Tremors/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Cloister_of_Tremors/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
-----------------------------------

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Amber") == 1) then
        player:startEvent(2);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    else
        player:messageSpecial(PROTOCRYSTAL);
    end

end;

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

function onEventFinish(player,csid,option)
    --printf("onFinish CSID: %u",csid);
    --printf("onFinish RESULT: %u",option);

    if (csid==2) then
        player:delKeyItem(dsp.ki.DOMINAS_AMBER_SEAL);
        player:addKeyItem(dsp.ki.AMBER_COUNTERSEAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.AMBER_COUNTERSEAL);
        player:setVar("ASA4_Amber","2");
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;