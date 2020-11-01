-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Goblin Bounty Hunter
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 57, 2, tpz.regime.type.FIELDS)
end
