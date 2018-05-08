-----------------------------------
-- Area: Windurst Woods
--  NPC: Parih Vashai
-- Starts and Finishes Quest: The Fanged One
-- !pos 117 -3 92 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1113,1) and trade:getItemCount() == 1) then -- Trade old earring (complete Rng AF2 quest) -- oldEarring
        local FireAndBrimstoneCS = player:getVar("fireAndBrimstone");

        if (FireAndBrimstoneCS == 5) then
            player:startEvent(537, 0, 13360); -- twinstoneEarring
        end
    end

end;

function onTrigger(player,npc)

    local TheFangedOne = player:getQuestStatus(WINDURST,THE_FANGED_ONE); -- RNG flag quest

    local SinHunting = player:getQuestStatus(WINDURST,SIN_HUNTING);-- RNG AF1
    local SinHuntingCS = player:getVar("sinHunting");

    local FireAndBrimstone = player:getQuestStatus(WINDURST,FIRE_AND_BRIMSTONE);-- RNG AF2
    local FireAndBrimstoneCS = player:getVar("fireAndBrimstone");

    local UnbridledPassion = player:getQuestStatus(WINDURST,UNBRIDLED_PASSION);-- RNG AF3
    local UnbridledPassionCS = player:getVar("unbridledPassion");

    local LvL = player:getMainLvl();
    local Job = player:getMainJob();

    -- COP mission
    if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Louverance_s_Path") == 1) then
            player:startEvent(686);
    -- the fanged one
    elseif (TheFangedOne ~= QUEST_COMPLETED) then
        if (TheFangedOne == QUEST_AVAILABLE and player:getMainLvl() >= ADVANCED_JOB_LEVEL) then
            player:startEvent(351);
        elseif (TheFangedOne == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.OLD_TIGERS_FANG) == false) then
            player:startEvent(352);
        elseif (player:hasKeyItem(dsp.ki.OLD_TIGERS_FANG) and player:getVar("TheFangedOne_Event") ~= 1) then
            player:startEvent(357);
        elseif (player:getVar("TheFangedOne_Event") == 1) then
            player:startEvent(358);
        end

    -- sin hunting
    elseif (SinHunting == QUEST_AVAILABLE and Job == 11 and LvL >= 40 and SinHuntingCS == 0) then
        player:startEvent(523); -- start RNG AF1
    elseif (SinHuntingCS > 0 and SinHuntingCS < 5) then
        player:startEvent(524); -- during quest RNG AF1
    elseif (SinHuntingCS == 5) then
        player:startEvent(527); -- complete quest RNG AF1

    -- fire and brimstone
    elseif (SinHunting == QUEST_COMPLETED and Job == 11 and FireAndBrimstone == QUEST_AVAILABLE and FireAndBrimstoneCS == 0) then
        player:startEvent(531); -- start RNG AF2
    elseif (FireAndBrimstoneCS > 0 and FireAndBrimstoneCS < 4) then
        player:startEvent(532); -- during RNG AF2
    elseif (FireAndBrimstoneCS == 4) then
        player:startEvent(535,0,13360,1113); -- second part RNG AF2
    elseif (FireAndBrimstoneCS == 5) then
        player:startEvent(536,0,13360,1113); -- during second part RNG AF2

    -- Unbridled Passion
    elseif (FireAndBrimstone == QUEST_COMPLETED and Job == 11 and UnbridledPassion == QUEST_AVAILABLE and UnbridledPassion == 0) then
        player:startEvent(541, 0, 13360); -- start RNG AF3
    elseif (UnbridledPassionCS > 0 and UnbridledPassionCS < 3) then
        player:startEvent(542);-- during RNG AF3
    elseif (UnbridledPassionCS >= 3 and UnbridledPassionCS < 7) then
        player:startEvent(542);-- during RNG AF3
    elseif (UnbridledPassionCS == 7) then
        player:startEvent(546, 0, 14099); -- complete RNG AF3

    -- standard dialog
    else
        player:startEvent(338);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 351) then
        player:addQuest(WINDURST,THE_FANGED_ONE);
        player:setVar("TheFangedOneCS", 1);
    elseif (csid == 357 or csid == 358) then
        if (player:getFreeSlotsCount(0) >= 1 and player:hasItem(13117) == false) then
            player:delKeyItem(dsp.ki.OLD_TIGERS_FANG);
            player:setVar("TheFangedOne_Event",0);
            player:setVar("TheFangedOneCS",0);
            player:addTitle(dsp.title.THE_FANGED_ONE);
            player:addItem(13117);
            player:messageSpecial(ITEM_OBTAINED,13117);
            player:unlockJob(dsp.job.RNG);
            player:messageSpecial(PERIH_VASHAI_DIALOG);
            player:addFame(WINDURST, 30);
            player:completeQuest(WINDURST,THE_FANGED_ONE);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13117);
            player:setVar("TheFangedOne_Event",1);
        end
    elseif (csid == 523) then -- start quest RNG AF1
        player:addQuest(WINDURST,SIN_HUNTING);
        player:addKeyItem(dsp.ki.CHIEFTAINNESS_TWINSTONE_EARRING);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CHIEFTAINNESS_TWINSTONE_EARRING);
        player:setVar("sinHunting",1);
    elseif (csid == 527) then -- complete quest RNG AF1
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17188);
        else
            player:addItem(17188);
            player:messageSpecial(ITEM_OBTAINED,17188);
            player:completeQuest(WINDURST,SIN_HUNTING);
            player:delKeyItem(dsp.ki.CHIEFTAINNESS_TWINSTONE_EARRING);
            player:delKeyItem(dsp.ki.PERCHONDS_ENVELOPE);
            player:setVar("sinHunting",0);
        end
    elseif (csid == 531) then -- start RNG AF2
        player:addQuest(WINDURST,FIRE_AND_BRIMSTONE);
        player:setVar("fireAndBrimstone",1);
    elseif (csid == 535) then -- start second part RNG AF2
        player:setVar("fireAndBrimstone",5);
    elseif (csid == 537) then -- complete quest RNG AF2
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12518);
        else
            player:tradeComplete();
            player:addItem(12518);
            player:messageSpecial(ITEM_OBTAINED,12518);
            player:completeQuest(WINDURST,FIRE_AND_BRIMSTONE);
            player:setVar("fireAndBrimstone",0);
        end
    elseif (csid == 541) then -- start RNG AF3
        player:addQuest(WINDURST,UNBRIDLED_PASSION);
        player:setVar("unbridledPassion",1);
    elseif (csid == 546) then -- complete quest RNG AF3
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14099);
        else
            player:addItem(14099);
            player:messageSpecial(ITEM_OBTAINED,14099);
            player:completeQuest(WINDURST,UNBRIDLED_PASSION);
            player:delKeyItem(dsp.ki.KOHS_LETTER);
            player:setVar("unbridledPassion",0);
        end
    elseif (csid == 686) then
        player:setVar("COP_Louverance_s_Path",2);
    end

end;
