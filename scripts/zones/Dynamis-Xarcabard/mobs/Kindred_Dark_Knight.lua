-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Kindred Dark Knight
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Xarcabard/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.DUKE_SCOX_PH, 10, 1200) -- 20 minutes
end
