-----------------------------------
-- Area: Selbina
--  NPC: Wachiwi
-- Type: Weather Reporter
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:startEvent(502,0,0,0,0,0,0,0,VanadielTime())
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end