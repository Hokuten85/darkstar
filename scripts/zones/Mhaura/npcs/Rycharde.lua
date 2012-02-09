-----------------------------------
--	Area: Mhaura
--	NPC: Rycharde 
--	Standard Info NPC
-- Starts & Finishes non Repeatable Quest: Rycharde the Chef (100%)
-- quest WAY_OF_THE_COOK (100%)
-- QUEST UNENDING_CHASE (100%)
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");


--   player:startEvent(0x4a); -- first quest completed ok
--   player:startEvent(0x4b); -- nothing to do
--   player:startEvent(0x4c); -- second quest start  --WAY_OF_THE_COOK 

--   player:startEvent(0x4e); -- you have x hours left
--   player:startEvent(0x4f); -- not yet done
--   player:startEvent(0x50); -- second quest completed
--   player:startEvent(0x51); -- too late second quest
--   player:startEvent(0x52);-- third quest 			
--   player:startEvent(0x53);-- third quest completed 
--   player:startEvent(0x54);-- third quest  said no, ask again
--   player:startEvent(0x55);-- third quest  comment no hurry
--   player:startEvent(0x56);-- forth quest   His Name is Valgeir
--   player:startEvent(0x57);-- forth quest   not done yet
--   player:startEvent(0x58);-- forth quest   done!
--   player:startEvent(0x59);-- nothing to do
--   player:startEvent(0x5a);-- fifth quest The Clue
--   player:startEvent(0x5b);-- fifth quest The Clue
--   player:startEvent(0x5c);-- fifth quest completed
--   player:startEvent(0x5d);-- fifth quest not enogh
--   player:startEvent(0x5e);-- sixth quest The Basics
--   player:startEvent(0x5f);-- sixth quest not done yet
--   player:startEvent(0x60);-- sixth quest completed
--   player:startEvent(0x61);-- sixth quest completed commentary
--   player:startEvent(0x62);-- sixth quest completed commentary 2

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

RychardetheChef = player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF);
WayoftheCook = player:getQuestStatus(OTHER_AREAS,WAY_OF_THE_COOK);
Unendingchase = player:getQuestStatus(OTHER_AREAS,UNENDING_CHASE);

if (RychardetheChef == QUEST_ACCEPTED) then
	count = trade:getItemCount();
	DhalmelMeat  = trade:hasItemQty(4359,trade:getItemCount()); --4359 - slice_of_dhalmel_meat
    if (DhalmelMeat  == true and count == 2) then 
		player:startEvent(0x4a); -- completed ok
	elseif(DhalmelMeat  == true and count == 1) then
		player:startEvent(0x49); -- that's not enogh!
	end;
elseif (WayoftheCook == QUEST_ACCEPTED) then
	count = trade:getItemCount();
	DhalmelMeat  = trade:hasItemQty(4359,1); --4359 - slice_of_dhalmel_meat
	BeehiveChip  = trade:hasItemQty(912,1); --4359 - slice_of_dhalmel_meat
    if (DhalmelMeat  == true and BeehiveChip  == true and count == 2) then 
		Dayspassed=VanadielDayOfTheYear()-player:getVar("QuestRychardeTCDayStarted_var");
		TotalHourLeft=72-(VanadielHour()+Dayspassed*24)+player:getVar("QuestWayotcHourStarted_var");
		if(TotalHourLeft>0) then
			player:startEvent(0x50); -- second quest completed
		else
			player:startEvent(0x51); -- too late second quest
		end;
	end;
elseif (Unendingchase == QUEST_ACCEPTED) then
	puffball  = trade:hasItemQty(4448,1); --4448 - puffball
    if (puffball  == true) then 
		player:startEvent(0x53); -- completed quest 3 UNENDING_CHASE
	end;
end;


end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

------------------------------------ QUEST RYCHARDE_THE_CHEF-----------------------------------------
if (player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF)==QUEST_AVAILABLE) then
	QuestStatus = player:getVar("QuestRychardetheChef_var");
	if (QuestStatus == 2 ) then  -- seconnd stage one quest
		player:startEvent(0x46,4359); -- ask if player would do quest
	elseif (QuestStatus == 3 ) then
		player:startEvent(0x47,4359); -- said no, ask again if player would do quest
	else
		player:startEvent(0x45); -- talk about something else
	end;
elseif (player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF)==QUEST_ACCEPTED) then
	player:startEvent(0x48); -- not done yet huh?
--------------------------------------------- quest WAY_OF_THE_COOK
elseif(player:getQuestStatus(OTHER_AREAS,WAY_OF_THE_COOK)==QUEST_AVAILABLE) then	-- quest WAY_OF_THE_COOK
	if((player:getVar("QuestRychardeTCCompDay_var")+8<VanadielDayOfTheYear() or player:getVar("QuestRychardeTCCompYear_var")<VanadielYear())and (player:getFame(WINDURST)>200)) then  --8 days or so after the completition of the last quest ... and required fame
		player:startEvent(0x4c,4359,912);-- second quest WAY_OF_THE_COOK 
	else
		player:startEvent(0x4b); -- nothing to do
	end;
elseif(player:getQuestStatus(OTHER_AREAS,WAY_OF_THE_COOK)==QUEST_ACCEPTED) then
	Dayspassed=VanadielDayOfTheYear()-player:getVar("QuestRychardeTCDayStarted_var");
	TotalHourLeft=72-(VanadielHour()+Dayspassed*24)+player:getVar("QuestWayotcHourStarted_var");
	if(TotalHourLeft>0) then
			player:startEvent(0x4e,TotalHourLeft); -- you have x hours left
		else
			player:startEvent(0x4f); -- not yet done
	end;
---------------------------QUEST UNENDING_CHASE--------------------------------------------------
elseif (player:getQuestStatus(OTHER_AREAS,UNENDING_CHASE)==QUEST_AVAILABLE) then
	if ((player:getVar("QuestWayofTCCompDay_var")+8<VanadielDayOfTheYear() or player:getVar("QuestWayofTCCompYear_var")<VanadielYear()) and player:getFame(WINDURST)>500) then  -- fame requeriment for quest and days between quest
		if(player:getVar("QuestUnendingCAskedAlready_var")==2) then
			player:startEvent(0x54,4448);-- third quest  said no, ask again	
		else
			player:startEvent(0x52,4448);-- third quest UNENDING_CHASE	4448 - puffball
		end;
	else
		player:startEvent(0x4b); -- nothing to do
	end;
elseif (player:getQuestStatus(OTHER_AREAS,UNENDING_CHASE)==QUEST_ACCEPTED) then
    player:startEvent(0x55);-- third quest  comment no hurry
-------------------------QUEST HIS_NAME_IS_VALGEIR--------------------------------------------------
-- elseif (player:getQuestStatus(OTHER_AREAS,HIS_NAME_IS_VALGEIR)==QUEST_AVAILABLE) then
	-- if(player:getFame(WINDURST)>500) then -- required fame
		-- player:startEvent(0x56);-- forth quest   His Name is Valgeir
	-- else
		-- player:startEvent(0x4b); -- nothing to do
	-- end;
-- elseif (player:getQuestStatus(OTHER_AREAS,HIS_NAME_IS_VALGEIR)==QUEST_ACCEPTED) then
	-- player:startEvent(0x57);-- forth quest   not done yet
else
	player:startEvent(0x4b); -- nothing to do standar dialog
end;
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

-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

	if ((csid == 0x46 or csid == 0x47)) then  --accept quest 1
		player:setVar("QuestRychardetheChef_var",3); --
		if (option == 71 or option == 72) then	--70 = answer no  71 answer yes!
			player:addQuest(OTHER_AREAS,RYCHARDE_THE_CHEF);			
		end;	
	elseif (csid == 0x4a) then   -- end quest 1 RYCHARDE_THE_CHEF
		player:tradeComplete();
		player:addFame(WINDURST,WIN_FAME*120);
		player:setTitle(PURVEYOR_IN_TRAINING);
		player:addGil(GIL_RATE*1500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
		player:setVar("QuestRychardetheChef_var",0);
		player:setVar("QuestRychardeTCCompDay_var",VanadielDayOfTheYear());
		player:setVar("QuestRychardeTCCompYear_var",VanadielYear());
		player:completeQuest(OTHER_AREAS,RYCHARDE_THE_CHEF);				
	elseif(csid == 0x4c) then  -- accept quest 2
		if(option == 74 ) then -- answer yes!
				Hour=VanadielHour();
				Day=VanadielDayOfTheYear();
				player:setVar("QuestWayotcHourStarted_var",Hour);
				player:setVar("QuestRychardeTCDayStarted_var",Day);
				player:addQuest(OTHER_AREAS,WAY_OF_THE_COOK);	
		end;
	elseif(csid == 0x50) then  --end quest 2 WAY_OF_THE_COOK
		player:tradeComplete();
		player:addFame(WINDURST,WIN_FAME*120);
		player:setTitle(ONESTAR_PURVEYOR);
		player:addGil(GIL_RATE*1500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
		player:setVar("QuestWayotcHourStarted_var",0);
		player:setVar("QuestRychardeTCDayStarted_var",0);
		player:setVar("QuestRychardeTCCompDay_var",0);
		player:setVar("QuestRychardeTCCompYear_var",0);
		player:setVar("QuestWayofTCCompDay_var",VanadielDayOfTheYear()); -- completition day of WAY_OF_THE_COOK
		player:setVar("QuestWayofTCCompYear_var",VanadielYear());
		player:completeQuest(OTHER_AREAS,WAY_OF_THE_COOK);	
	elseif(csid == 0x51) then  --end quest 2 WAY_OF_THE_COOK
		player:tradeComplete();
		player:addFame(WINDURST,WIN_FAME*120);
		player:setTitle(PURVEYOR_IN_TRAINING);
		player:addGil(GIL_RATE*1000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1000);
		player:setVar("QuestWayotcHourStarted_var",0);
		player:setVar("QuestRychardeTCDayStarted_var",0);
		player:setVar("QuestRychardeTCCompDay_var",0);
		player:setVar("QuestRychardeTCCompYear_var",0);
		player:setVar("QuestWayofTCCompDay_var",VanadielDayOfTheYear()); -- completition day of WAY_OF_THE_COOK
		player:setVar("QuestWayofTCCompYear_var",VanadielYear());
		player:completeQuest(OTHER_AREAS,WAY_OF_THE_COOK);	
	elseif(csid == 0x52) then  -- accept quest 3 UNENDING_CHASE
		player:setVar("QuestUnendingCAskedAlready_var",2);
		if(option == 77 ) then -- answer yes!
			player:addQuest(OTHER_AREAS,UNENDING_CHASE);	
		end;
	elseif(csid == 0x54) then  -- accept quest 3 UNENDING_CHASE
		if(option == 78 ) then -- answer yes!
			player:addQuest(OTHER_AREAS,UNENDING_CHASE);	
		end;
	elseif(csid == 0x53) then  -- end quest 3 UNENDING_CHASE
		player:tradeComplete();
		player:addFame(WINDURST,WIN_FAME*120);
		player:setTitle(TWOSTAR_PURVEYOR);
		player:addGil(GIL_RATE*2100);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*2100);
		player:setVar("QuestUnendingCAskedAlready_var",0);
		player:setVar("QuestWayofTCCompDay_var",0); -- completition day of WAY_OF_THE_COOK delete variable
		player:setVar("QuestWayofTCCompYear_var",0);
		player:completeQuest(OTHER_AREAS,UNENDING_CHASE);	
	elseif(csid == 0x56) then  -- accept quest 4 HIS_NAME_IS_VALGEIR
		if(option == 80 ) then -- answer yes!
			player:setVar("QUEST_HIS_NAME_IS_VALGEIR",1); --fist stance of quest
			player:addQuest(OTHER_AREAS,HIS_NAME_IS_VALGEIR);	
		end;
	end;	
	
end;