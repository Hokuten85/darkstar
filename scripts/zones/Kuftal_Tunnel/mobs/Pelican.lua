----------------------------------
-- Area: Kuftal Tunnel
--   NM: Pelican
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

    -- Set Pelican's Window Open Time
    local wait = math.random(10800,43200); -- 4-12 hours
    SetServerVariable("[POP]Pelican", os.time() + wait); -- 4-12 hours
    AllowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Pelican");
    SetServerVariable("[PH]Pelican", 0);
    AllowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;