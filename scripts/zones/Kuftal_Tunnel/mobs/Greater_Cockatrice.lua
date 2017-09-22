-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Greater Cockatrice
-- Note: Place Holder for Pelican
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,741,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Pelican_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Pelican");
        if (ToD <= os.time() and GetMobAction(Pelican) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Pelican);
                GetMobByID(Pelican):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Pelican", mobID);
                AllowRespawn(mobID, true);
            end
        end
    end

end;
