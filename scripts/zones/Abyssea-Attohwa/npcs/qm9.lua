-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm9 (???)
-- Spawns Berstuk
-- !pos -280.000 -4.000 -38.516 215
-----------------------------------
require("scripts/globals/abyssea");

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade);
end;

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
