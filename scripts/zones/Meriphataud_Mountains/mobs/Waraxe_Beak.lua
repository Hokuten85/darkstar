-----------------------------------
-- Area: Meriphataud Mountains (119)
--  NM:  Waraxe_Beak
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Waraxe_Beak's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
end;

