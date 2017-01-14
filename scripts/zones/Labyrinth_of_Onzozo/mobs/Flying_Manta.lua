-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Flying Manta
-- Note: Place holder Lord of Onzozo
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,774,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
