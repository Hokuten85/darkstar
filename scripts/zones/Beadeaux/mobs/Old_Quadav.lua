-----------------------------------
-- Area: Beadeaux
--  MOB: Old Quadav
-- PH for Ge'Dha Evileye
-----------------------------------
local ID = require("scripts/zones/Beadeaux/IDs.lua");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.GE_DHA_EVILEYE_PH,25,math.random(3600,7200)); -- 1 to 2 hours
end;
