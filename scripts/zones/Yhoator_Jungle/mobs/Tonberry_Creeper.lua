-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Tonberry Creeper
-- Note: PH for Hoar-knuckled Rimberry
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 133, 1, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    phOnDespawn(mob, ID.mob.HOAR_KNUCKLED_RIMBERRY_PH, 10, math.random(5400, 7200)) -- 90 to 120 minutes
end
