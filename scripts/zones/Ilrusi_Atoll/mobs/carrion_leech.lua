-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  MOB: Carrion Leech
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;