-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Boggart	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,650,1);
end;	