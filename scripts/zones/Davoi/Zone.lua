-----------------------------------
-- 
-- Zone: Davoi
-- 
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;
	
	if(player:getCurrentMission(SANDORIA) == INFILTRATE_DAVOI and player:getVar("MissionStatus") == 2) then
		cs = 0x0074;
	end
	
	if(player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_ACCEPTED and GetMobAction(17387644) == 0) then
		SpawnMob(17387644); -- Spawned by Quest: The Crimson Trial upon entering the zone. 
	end
	
	return cs;

end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
	
	if(csid == 0x0074) then
		player:setVar("MissionStatus",3);
	end
	
end;