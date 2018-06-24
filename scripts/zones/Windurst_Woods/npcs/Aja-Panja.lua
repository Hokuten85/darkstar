-----------------------------------
-- Area: Windurst Woods
--   NPC: Aja-Panja
-- Type: Standard NPC
-- @zone 241
-- !pos -7.251 -6.55 -134.127
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(247);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

