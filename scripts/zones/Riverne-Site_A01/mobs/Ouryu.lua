-----------------------------------
-- Area: 
-- NPC:  Ouryu
-----------------------------------
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:setTitle(OURYU_OVERWHELMER);	

end;