-----------------------------------
-- Area: Lower Jeuno
-- Starts and Finishes Quest: Your Crystal Ball & Never to return
-- !pos -4 -6 -28 245
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
local ID = require("scripts/zones/Lower_Jeuno/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(JEUNO,YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED and trade:getItemCount() == 1) then
        if (trade:hasItemQty(557,1) == true) then
            player:startEvent(192); -- CS for ahriman lens trade; Trading the lens to Kurou-Morou is optional
        elseif (trade:hasItemQty(556,1) == true) then
            player:startEvent(196); -- Trade divination sphere, finish quest
        end
    elseif (player:getQuestStatus(JEUNO,NEVER_TO_RETURN) == QUEST_ACCEPTED and trade:hasItemQty(12507,1) == true and trade:getItemCount() == 1) then
        player:startEvent(203); -- Finish "Never to return" quest
    end
end;

function onTrigger(player,npc)
    -- printf("Ontrigger completed");
    local YourCrystalBall = player:getQuestStatus(JEUNO,YOUR_CRYSTAL_BALL);
    local SearchingForTheRightWords = player:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS);
    local ACandlelightVigil = player:getQuestStatus(JEUNO,A_CANDLELIGHT_VIGIL);
    local RubbishDay = player:getQuestStatus(JEUNO,RUBBISH_DAY);
    local NeverToReturn = player:getQuestStatus(JEUNO,NEVER_TO_RETURN);
    local JFame = player:getFameLevel(JEUNO);
    local SearchingForWords_prereq = player:getVar("QuestSearchRightWords_prereq");


    if (JFame >= 2 and YourCrystalBall == QUEST_AVAILABLE) then
        player:startEvent(194); -- Start "Your Crystal Ball" quest

    elseif (JFame >= 5 and YourCrystalBall == QUEST_COMPLETED and player:getQuestStatus(JEUNO,NEVER_TO_RETURN) == QUEST_AVAILABLE and player:getVar("QuestNeverToReturn_day") ~= VanadielDayOfTheYear()) then
        prog = player:getVar("QuestNeverToReturn_prog");
        if (prog <= 2) then
            fortune = math.random(1,99);
            player:startEvent(204,fortune); -- Required to get fortune read 3x on 3 diff game days before quest is kicked off
        elseif (prog == 3) then
            player:startEvent(202); -- Start "Never to return" quest
        end

    --if searching for right words *prereq* CS has been activated
    elseif (SearchingForWords_prereq == 1) then
        player:startEvent(38);

    elseif (player:getVar("QuestSearchRightWords_denied") == 1) then
        player:startEvent(36);

    elseif (SearchingForTheRightWords == QUEST_ACCEPTED) then
        player:startEvent(39);

    elseif (player:getVar("SearchingForRightWords_postcs") == -2) then
        player:startEvent(154);

    elseif (SearchingForTheRightWords == QUEST_COMPLETED) then --final state, after all quests complete
        player:startEvent(37);

    --conditions for searching for the right words
    elseif (ACandlelightVigil == QUEST_COMPLETED and RubbishDay == QUEST_COMPLETED and
    NeverToReturn == QUEST_COMPLETED and SearchingForTheRightWords == QUEST_AVAILABLE) then
        player:startEvent(17);

    else
        player:startEvent(193); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 194 and option == 0) then
        player:addQuest(JEUNO,YOUR_CRYSTAL_BALL);
    elseif (csid == 196) then
        player:addTitle(dsp.title.FORTUNETELLER_IN_TRAINING);
        player:addFame(JEUNO, 30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,YOUR_CRYSTAL_BALL);
    elseif (csid == 204 and option == 0) then
        player:addVar("QuestNeverToReturn_prog", 1);  -- Keep track of how many times the players fortune has been read
        player:setVar("QuestNeverToReturn_day", VanadielDayOfTheYear()); -- new vanadiel day
    elseif (csid == 202 and option == 0) then
        player:addQuest(JEUNO,NEVER_TO_RETURN);
        player:setVar("QuestNeverToReturn_prog", 0);
        player:setVar("QuestNeverToReturn_day", 0);
    elseif (csid == 203) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,13477);
        else
            player:addGil(GIL_RATE*1200);
            player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*1200);
            player:addItem(13477);
            player:messageSpecial(ID.text.ITEM_OBTAINED,13477);
            player:addFame(JEUNO, 30);
            player:tradeComplete(trade);
            player:completeQuest(JEUNO,NEVER_TO_RETURN);
        end
    elseif (csid == 17) then
        player:setVar("QuestSearchRightWords_prereq", 1);
    elseif (csid == 154) then
        player:setVar("SearchingForRightWords_postcs", -1);
    end
end;