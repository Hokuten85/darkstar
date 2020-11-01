-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Thunderclaw Thuban
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 274)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 90 to 120 minutes
end
