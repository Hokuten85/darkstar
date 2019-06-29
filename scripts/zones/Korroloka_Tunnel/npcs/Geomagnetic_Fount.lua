-----------------------------------
-- Area: Korroloka Tunnel (173)
--  NPC: Geomagnetic Fount
-- !pos: 0.000 0.000 0.000 -- TODO: Capture me
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs")
require("scripts/globals/geomagnetic_fount")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.geomagneticFount.checkFount(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end