-----------------------------------
-- Area: Meriphataud Mountains (119)
--  NM:  Coo_Keja_the_Unseen
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

    -- Set Coo_Keja_the_Unseen's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());

end;

