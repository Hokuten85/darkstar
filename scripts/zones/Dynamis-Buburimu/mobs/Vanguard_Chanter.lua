-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Vanguard Chanter
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Buburimu/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1449)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.REE_NATA_THE_MELOMANIC_PH, 10, 1200) -- 20 minutes
end
