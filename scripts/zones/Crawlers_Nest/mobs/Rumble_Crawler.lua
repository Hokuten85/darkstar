-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Rumble Crawler
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,691,1);
end;