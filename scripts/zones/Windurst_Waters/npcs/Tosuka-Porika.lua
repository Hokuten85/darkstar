-----------------------------------
--	Area: Windurst Waters
--	NPC:  Tosuka-Porika
--	Involved in Quests: Hat in Hand
--  @zone 238
--  @pos -26 -6 103 
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- cs notes
	-- 0x172 (370) = You have no mission, gtfo
	-- 0x17b (379) = Not sure yet (Adventurer from the other day?)
	-- 0x17c (380) = About the book of gods and "some adventurer"
	-- 0xa0 (160) = 1st cutscene of Windurst Mission 2-1
	-- 0xa1 (161) = More info on 2-1, ifyou talk to him right after the previous cutscene again
	
	bookwormStatus = player:getQuestStatus(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
	glyphStatus = player:getQuestStatus(WINDURST,GLYPH_HANGER);
	chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);
	missionStatus = player:getCurrentMission(WINDURST);
	windurst_mission_2_1 = player:getVar("windurst_mission_2_1");
	Fame = player:getFameLevel(WINDURST)
	
	-- Start Past Reflexion in First -----------
	if(player:needToZone() == false and bookwormStatus == QUEST_AVAILABLE and missionStatus ~= LOST_FOR_WORDS and glyphStatus == QUEST_COMPLETED and Fame >= 2) then
		player:startEvent(0x0183); -- Start Quest "Early Bird Catches the Bookworm"
	elseif(missionStatus == LOST_FOR_WORDS and windurst_mission_2_1 == 1) then
		player:startEvent(0x00a0); -- First CS for Mission 2-1
	elseif(missionStatus == LOST_FOR_WORDS and windurst_mission_2_1 > 1 and windurst_mission_2_1 < 7) then
		player:startEvent(0x00a1); -- During Mission 2-1
	elseif(missionStatus == LOST_FOR_WORDS and windurst_mission_2_1 == 7) then
		player:startEvent(0x00a8); -- Finish Mission 2-1
	elseif(bookwormStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0184); -- During Quest "Early Bird Catches the Bookworm"
	elseif(player:getQuestStatus(WINDURST,HAT_IN_HAND) == QUEST_ACCEPTED or player:getVar("QuestHatInHand_var2") == 1) then
		function testflag(set,flag)
			return (set % (2*flag) >= flag)
		end
		if(testflag(tonumber(player:getVar("QuestHatInHand_var")),32) == false) then
			player:startEvent(0x0037); -- Show Off Hat
		end
	-- Book is A_SONG_OF_LOVE, Keyitem ID = 126
	elseif(chasingStatus  == QUEST_AVAILABLE and bookwormStatus == QUEST_COMPLETED and missionStatus ~= THE_JESTER_WHOD_BE_KING and Fame >= 3 and player:needToZone() == false) then
		player:startEvent(0x0193); --  Add initial cutscene
	elseif(chasingStatus == QUEST_ACCEPTED and player:getVar("CHASING_TALES_TRACK_BOOK") > 0) then
		player:startEvent(0x019c);
	elseif(player:hasKeyItem(149) ==true) then
		player:startEvent(0x019c);
	elseif(chasingStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0196); --  Add folllow up cutscene
	else
		player:startEvent(0x0172); -- Standard Conversation
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
	
	if(csid == 0x0037) then  -- Show Off Hat
		player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+32);
		player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
	elseif(csid == 0x00a0) then -- Windurst Mission 2-1
		player:setVar("windurst_mission_2_1",2);
	elseif(csid == 0x00a8) then -- Windurst Mission 1-2 is over (good end)
		-- Returned with the key item, mission's over
		player:completeMission(WINDURST,LOST_FOR_WORDS);
		-- Add Rank Points (Note: I have no idea how much should be added)
		player:addRankPoints(0);
		-- Remove all variables set for this mission
		player:setVar("windurst_mission_2_1",0);
		player:setVar("wm_2_1_randfoss",0);
    
	elseif(csid == 0x0183 and option == 0) then -- Early Bird Gets The Bookworm
		player:addQuest(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
		
	elseif(csid == 0x0193 and option == 0) then
	    player:addQuest(WINDURST,CHASING_TALES);
		
	end
	
end;