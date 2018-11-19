-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Hurricane Wyvern
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 762, 1, dsp.regime.type.GROUNDS)
end;