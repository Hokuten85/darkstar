-----------------------------------
-- Area: Davoi
--  NPC: Disused Well
-- Involved in Quest: A Knight's Test
-- !pos -221 2 -293 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Davoi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.kis.KNIGHTS_SOUL) == false and player:hasKeyItem(dsp.kis.BOOK_OF_TASKS) and player:hasKeyItem(dsp.kis.BOOK_OF_THE_WEST) and player:hasKeyItem(dsp.kis.BOOK_OF_THE_EAST)) then
        player:addKeyItem(dsp.kis.KNIGHTS_SOUL);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.kis.KNIGHTS_SOUL);
    else
        player:messageSpecial(A_WELL);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;