-----------------------------------
-- Area: Southern San d'Oria
--   NPC: Blendare
-- Type: Standard NPC
--  @zone 230
-- !pos 33.033 0.999 -30.119
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeBlendare") == 0) then
            player:messageSpecial(BLENDARE_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeBlendare",1);
            player:messageSpecial(FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getVar("tradeBlendare") ==1) then
            player:messageSpecial(FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(606)  -- my brother always takes my sweets
--    player:startEvent(598)   --did nothing no speech or text
--    player:startEvent(945)    --black screen and hang
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 606) then
        player:setVar("BrothersCS", 1)
    end
end;

