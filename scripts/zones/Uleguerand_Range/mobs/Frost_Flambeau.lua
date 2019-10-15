-----------------------------------
-- Area: Uleguerand Range
--   NM: Frost Flambeau
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 15)
    mob:setMod(dsp.mod.UFASTCAST, 50)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 2 to 2.5 hours
end
