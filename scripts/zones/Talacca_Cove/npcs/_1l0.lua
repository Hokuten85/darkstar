-----------------------------------
-- Area: Talacca_Cove
-- NPC:  rock slab (corsair job flag quest)
-- !pos -99 -7 -91 57
-----------------------------------
package.loaded["scripts/zones/Talacca_Cove/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/bcnm");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    LuckOfTheDraw = player:getVar("LuckOfTheDraw");

    if (LuckOfTheDraw ==4) then
        player:startEvent(3);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    end

end;

function onEventUpdate(player,csid,option)
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

function onEventFinish(player,csid,option)
    if (csid == 3) then -- complete corsair job flag quest
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,5493);
        else
            player:setVar("LuckOfTheDraw",5); -- var will remain for af quests
            player:addItem(5493);
            player:messageSpecial(ID.text.ITEM_OBTAINED,5493);
            player:delKeyItem(dsp.ki.FORGOTTEN_HEXAGUN);
            player:unlockJob(dsp.job.COR);
            player:messageSpecial(ID.text.YOU_CAN_NOW_BECOME_A_CORSAIR);
            player:completeQuest(AHT_URHGAN,LUCK_OF_THE_DRAW);
        end
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;
