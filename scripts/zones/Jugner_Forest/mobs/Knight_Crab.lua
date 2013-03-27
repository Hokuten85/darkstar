-----------------------------------
-- Area: Jugner Forest
-- NPC:  Knight Crab
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	SetServerVariable("[POP]King_Arthro",0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	SetServerVariable("[POP]King_Arthro",GetServerVariable("[POP]King_Arthro") + 1);
	
	if(GetServerVariable("[POP]King_Arthro") == 10) then
		SetServerVariable("[POP]King_Arthro",0);
		SpawnMob(17203216,600,300); -- Pop King Arthro !
	end
	
end;