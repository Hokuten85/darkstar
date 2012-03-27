-----------------------------------
--	Author: Kegsay
-- 	Field Manual
-- 	Working, 100%.
-- The differences between Field Manuals in other zones are Event ID, Regime IDs (5x) only. 
-----------------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/fieldsofvalor");
package.loaded["/scripts/globals/fieldsofvalor"]=nil;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	startFov(0x003e,player);
 end;
 
function onTrade(player,npc,trade)
 end; 
 
--------------------------------------
-- onEventSelection
--------------------------------------
function onEventUpdate(player,csid,menuchoice)
	updateFov(player,csid,menuchoice,1,2,3,4,56); --the 5 regime IDs corresponding to the 5 pages in this area
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	finishFov(player,csid,option,1,2,3,4,56);
end;