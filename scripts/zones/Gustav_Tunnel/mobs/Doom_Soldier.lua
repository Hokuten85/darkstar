-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Doom Soldier
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,765,2);
end;