-----------------------------------
-- Area: Windurst Walls
-- NPC:  Koru-Moru
-- Starts & Ends Quest: Star Struck
-- Involved in Quest: Making the Grade, Riding on the Clouds
-- @zone 239
-- @pos -120 -6 124
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);
	local count = trade:getItemCount();
	local ClassReunion = player:getQuestStatus(WINDURST,CLASS_REUNION);
	local ClassReunionProgress = player:getVar("ClassReunionProgress");

	if(player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then

		if(trade:hasItemQty(544,1) and count == 1) then
			if(player:getVar("QuestMakingTheGrade_prog") == 1) then
				player:startEvent(0x011d); -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
			else
				player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
			end
		end
	elseif(qStarStruck ~= QUEST_AVAILABLE) then
		if(count == 1 and trade:hasItemQty(584,1)) then
			player:startEvent(0x00c7);
		end

		if(qStarStruck == QUEST_ACCEPTED) then
			if(count == 1 and trade:hasItemQty(582,1)) then
				player:startEvent(0x00d3);
			end
		end

	elseif(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 4) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_4",0);
			player:tradeComplete();
			player:addKeyItem(SPIRITED_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SPIRITED_STONE);
		end

	elseif(player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED) then
		if(count == 1 and trade:hasItemQty(16511,1)) then
			player:startEvent(0x00e0); -- Complete quest!
		else
			player:startEvent(0x00e1); -- not the shell
		end

	elseif(player:getQuestStatus(WINDURST,THE_ROOT_OF_THE_PROBLEM) == QUEST_ACCEPTED) then
		if (count == 1 and trade:hasItemQty(829,1)) then
			player:startEvent(0x15D);
			player:tradeComplete();
			player:setVar("***REMOVED***Problem",2);
		end

	elseif(ClassReunion == 1 and ClassReunionProgress == 2) then
		if(count == 4 and trade:hasItemQty(17299,4) and trade:getGil() == 0) then
			player:startEvent(0x0197); -- now Koru remembers something that you need to inquire his former students.
		end;
	end;

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);
	local blastFromPast = player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST);
	local blastProg = player:getVar("BlastFromThePast_Prog");
	local ***REMOVED***Problem = player:getQuestStatus(WINDURST,THE_ROOT_OF_THE_PROBLEM);
	local ThePuppetMaster = player:getQuestStatus(WINDURST,THE_PUPPET_MASTER);
	local ThePuppetMasterProgress = player:getVar("ThePuppetMasterProgress");
	local ClassReunion = player:getQuestStatus(WINDURST,CLASS_REUNION);
	local ClassReunionProgress = player:getVar("ClassReunionProgress");
	local talk1 = player:getVar("ClassReunion_TalkedToFupepe");
	local talk2 = player:getVar("ClassReunion_TalkedToFurakku");

	if(blastFromPast == QUEST_AVAILABLE and qStarStruck == QUEST_COMPLETED and player:getQuestStatus(WINDURST,CLASS_REUNION) ~= QUEST_ACCEPTED and player:getFameLevel(WINDURST) >= 3 and player:needToZone() == false) then
		player:startEvent(0x00d6);
	elseif(blastFromPast == QUEST_ACCEPTED and blastProg >= 2) then
		player:startEvent(0x00d7);
	elseif(blastFromPast == QUEST_ACCEPTED) then
		player:startEvent(0x00d8);

	elseif(player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
		local makingGradeProg = player:getVar("QuestMakingTheGrade_prog");
		if(makingGradeProg == 0 and player:hasItem(544)) then
			player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
		elseif(makingGradeProg == 1) then
			player:startEvent(0x011d); -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
		elseif(makingGradeProg >= 2) then
			player:startEvent(0x011e); -- MAKING THE GRADE: Reminder to go away
		else
			player:startEvent(0x00c1);
		end
	elseif(qStarStruck == QUEST_ACCEPTED) then
		player:startEvent(0x00c6);
	elseif(player:hasItem(584) and player:getQuestStatus(WINDURST,CLASS_REUNION) ~= QUEST_ACCEPTED) then
		player:startEvent(0x00c5);
	elseif(qStarStruck == QUEST_COMPLETED) then
		player:startEvent(0x00d5);
	----------------------------------------------------------
	-- Class Reunion
	elseif (ClassReunion == QUEST_ACCEPTED and ClassReunionProgress == 1) then
		player:startEvent(0x019c,0,450,17299,0,0,0,0,0); -- bring Koru 4 astragaloi
	elseif (ClassReunion == QUEST_ACCEPTED and ClassReunionProgress == 2) then
		player:startEvent(0x019e,0,0,17299,0,0,0,0,0); -- reminder to bring 4 astragaloi
	elseif ((ClassReunion == QUEST_ACCEPTED and ClassReunionProgress >= 3) and (talk1 ~= 1 or talk2 ~= 1)) then
		player:startEvent(0x0198); -- reminder to visit the students
	elseif (ClassReunion == QUEST_ACCEPTED and ClassReunionProgress == 6 and talk1 == 1 and talk2 == 1) then
			player:startEvent(0x019a); -- ending cs
	elseif (ThePuppetMaster == QUEST_COMPLETED and ClassReunion == QUEST_COMPLETED) then
		player:startEvent(0x019b); -- new cs after completed AF2
	----------------------------------------------------------
	-- The Puppet Master
	elseif (ThePuppetMaster == QUEST_ACCEPTED and ThePuppetMasterProgress == 4) then
		player:startEvent(0x0194); -- ending cs
	elseif (ThePuppetMaster == QUEST_COMPLETED and ClassReunion ~= 2) then
		player:startEvent(0x0195); -- new cs after completed AF1
	----------------------------------------------------------
	elseif(***REMOVED***Problem == QUEST_ACCEPTED and player:getVar("***REMOVED***Problem") == 1) then
		player:startEvent(0x015C,0,829);
	else
		player:startEvent(0x00c1);
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

	if(csid == 0x011d) then  -- Giving him KI from Principle
		player:tradeComplete();
		player:addKeyItem(TATTERED_TEST_SHEET);
		player:messageSpecial(KEYITEM_OBTAINED,TATTERED_TEST_SHEET);
		player:setVar("QuestMakingTheGrade_prog",2);
	elseif(csid == 0x00d3) then
		player:tradeComplete();
		player:addItem(12502);
		player:messageSpecial(ITEM_OBTAINED,12502);
		player:completeQuest(WINDURST,STAR_STRUCK);
		player:needToZone(true);
		player:addFame(WINDURST,WIN_FAME*20);
	elseif(csid == 0x00c7) then
		player:tradeComplete();
		player:messageSpecial(GIL_OBTAINED,50);
		player:addGil(50);
	elseif(csid == 0x00c5 and option == 0) then
		player:addQuest(WINDURST,STAR_STRUCK);
	elseif(csid == 0x00d6 and option == 0) then
		player:addQuest(WINDURST,BLAST_FROM_THE_PAST);
	elseif(csid == 0x00e0) then
		player:tradeComplete();
		player:setVar("BlastFromThePast_Prog",0);
		player:completeQuest(WINDURST,BLAST_FROM_THE_PAST);
		player:addItem(17030);
		player:messageSpecial(ITEM_OBTAINED,17030);
		player:addTitle(Fossilized_Sea_Farer)
		player:addFame(WINDURST,WIN_FAME*30);
		player:needToZone(true);
	elseif(csid == 0x0194) then
		if (player:getFreeSlotsCount() ~= 0) then
			player:addItem(17532);
			player:messageSpecial(ITEM_OBTAINED,17532);
			player:completeQuest(WINDURST,THE_PUPPET_MASTER);
			player:setVar("ThePuppetMasterProgress",0);
			player:needToZone(true);
			player:addFame(WINDURST,WIN_FAME*AF1_FAME);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17532);
		end;
	elseif(csid == 0x019c) then
		player:delKeyItem(CARBUNCLES_TEAR);
		player:setVar("ClassReunionProgress",2);
	elseif(csid == 0x0197) then
		player:tradeComplete();
		player:setVar("ClassReunionProgress",3);
	elseif(csid == 0x019a) then
		if(player:getFreeSlotsCount() ~= 0) then
			player:addItem(14228);
			player:messageSpecial(ITEM_OBTAINED,14228);
			player:completeQuest(WINDURST,CLASS_REUNION);
			player:setVar("ClassReunionProgress",0);
			player:setVar("ClassReunion_TalkedToFurakku",0);
			player:setVar("ClassReunion_TalkedToFupepe",0);
			player:needToZone(true);
			player:addFame(WINDURST,WIN_FAME*AF2_FAME);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14228);
		end;
	end;

end;
