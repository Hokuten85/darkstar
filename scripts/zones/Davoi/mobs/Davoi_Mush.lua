-----------------------------------
-- Area: Davoi
--  MOB: Davoi Mush
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();
    -- Wiki doesn't mention any sort of cooldown, so assuming pure lotto for now.
    if (mobID == 17387919) then -- Making sure is the correct mush.
        if (math.random(0,99) > 15) then -- Guesstimated 15% chance of pop.
            local BlubberyBulge = 17387920;
            AllowRespawn(BlubberyBulge, false);
            GetMobByID(BlubberyBulge):setRespawnTime(GetMobRespawnTime(mobID));
            SetServerVariable("[PH]Blubbery_Bulge", mobID);
            AllowRespawn(mobID, true);
        end
    end
end;