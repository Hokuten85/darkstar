-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Goblin Gambler
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,57,2);
end;
