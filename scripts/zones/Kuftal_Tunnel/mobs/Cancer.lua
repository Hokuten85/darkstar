-----------------------------------
-- Area: Kuftal Tunnel
-- NM: Cancer
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

GetNPCByID(17490251):hideNPC(900);

end;