-----------------------------------
-- Area: Castle Zvahl Keep
--  MOB: Count_Bifrons
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(HELLSBANE);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
