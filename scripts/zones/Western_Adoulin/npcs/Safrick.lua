-----------------------------------
-- Area: Western Adoulin
--  NPC: Safrick
-- Type: Standard NPC
--  @zone 256
-- !pos 26 0 69
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(551);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
