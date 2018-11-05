-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Processionaire
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 724, 1, dsp.regime.type.GROUNDS)
end;