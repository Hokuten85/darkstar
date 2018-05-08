-----------------------------------
-- Area: Promyvion-Holla
--  MOB: Stray
-----------------------------------
require("scripts/zones/Promyvion-Holla/MobIDs");
require("scripts/globals/status");

function findMother(mob)
    local mobId = mob:getID();
    local mother = 0;
    for k,v in pairs(HOLLA_MEMORY_RECEPTACLES) do
        if (k < mobId and k > mother) then
            mother = k;
        end
    end
    return mother;
end;

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.GIL_MAX, -1);
end;

function onMobSpawn(mob, target)
    local mother = GetMobByID(findMother(mob));
    if (mother ~= nil and mother:isSpawned()) then
        mob:setPos(mother:getXPos(), mother:getYPos()-5, mother:getZPos());
        mother:AnimationSub(1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;
