-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Tahl Mhioguch
-- Type: Standard NPC
-- !pos -64.907 -5.947 81.391 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(438);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

