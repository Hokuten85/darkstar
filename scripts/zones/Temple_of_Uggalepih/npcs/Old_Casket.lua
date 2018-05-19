-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: Old casket
-- Obtaining 'Paintbrush of Souls'
-- !pos 61 0 17 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.OLD_RUSTY_KEY)) then
        player:startEvent(64,dsp.ki.OLD_RUSTY_KEY);
    elseif (player:hasKeyItem(dsp.ki.PAINTBRUSH_OF_SOULS)) then
        player:messageSpecial(NO_REASON_TO_INVESTIGATE);
    else
        player:messageSpecial(THE_BOX_IS_LOCKED);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 64 and option == 1) then
        player:delKeyItem(dsp.ki.OLD_RUSTY_KEY);
        player:addKeyItem(dsp.ki.PAINTBRUSH_OF_SOULS);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.PAINTBRUSH_OF_SOULS);
    end

end;