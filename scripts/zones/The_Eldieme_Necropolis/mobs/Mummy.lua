-----------------------------------	
-- Area: The Eldieme Necropolis	
-- MOB:  Mummy
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,671,1);
	checkRegime(killer,mob,675,2);
end;	