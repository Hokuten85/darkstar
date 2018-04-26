-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Cradle_of_Rebirth
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Attohwa_Chasm/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Flaxen Pouch
    if (trade:hasItemQty(1777,1) and trade:getItemCount() == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1778); -- Parradamo Stones
        else
            player:tradeComplete();
            player:addItem(1778);
            player:messageSpecial(ITEM_OBTAINED, 1778); -- Parradamo Stones
        end
    end
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.kis.MIMEO_JEWEL) == true) then
        player:delKeyItem(dsp.kis.MIMEO_JEWEL);
        player:messageSpecial(KEYITEM_LOST,dsp.kis.MIMEO_JEWEL);
        player:addKeyItem(dsp.kis.MIMEO_FEATHER);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.kis.MIMEO_FEATHER);
        player:addKeyItem(dsp.kis.SECOND_MIMEO_FEATHER);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.kis.SECOND_MIMEO_FEATHER);
        player:addKeyItem(dsp.kis.THIRD_MIMEO_FEATHER);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.kis.THIRD_MIMEO_FEATHER);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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