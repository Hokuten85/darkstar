-----------------------------------
-- Area: Bastok Mines
-- NPC: Gumbah
-- Finishes Quest: Blade of Darkness
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local bladeDarkness = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
	local bladeDeath = player:getQuestStatus(BASTOK,BLADE_OF_DEATH)
	
	if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and  bladeDarkness == QUEST_AVAILABLE) then
		--DARK KNIGHT QUEST
		player:startEvent(0x0063);
	elseif(bladeDarkness == QUEST_COMPLETED and bladeDeath == QUEST_AVAILABLE) then	
		player:startEvent(0x0082);
	else 
		--DEFAULT 
		player:startEvent(0x0034);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0063) then
		player:addQuest(BASTOK, BLADE_OF_DARKNESS);
		
	elseif (csid == 0x0082) then
		player:addQuest(BASTOK, BLADE_OF_DEATH);
		player:addKeyItem(LETTER_FROM_ZEID);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_ZEID);
	end
end;