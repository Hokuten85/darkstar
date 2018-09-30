-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Treasure Chest
-- Involved In Quest: The Goblin Tailor
-- !zone 198
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/treasure");
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs");

local TreasureType = "Chest";
local TreasureLvL = 43;
local TreasureMinLvL = 33;

function onTrade(player,npc,trade)
    --trade:hasItemQty(1032,1);         -- Treasure Key
    --trade:hasItemQty(1115,1);            -- Skeleton Key
    --trade:hasItemQty(1023,1);            -- Living Key
    --trade:hasItemQty(1022,1);            -- Thief's Tools
    local questItemNeeded = 0;

    -- Player traded a key.
    if ((trade:hasItemQty(1032,1) or trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1) then
        local zone = player:getZoneID();

        -- IMPORTANT ITEM: The Goblin Tailor Quest -----------
        if (player:getQuestStatus(JEUNO,THE_GOBLIN_TAILOR) >= QUEST_ACCEPTED and VanadielRSELocation() == 2 and VanadielRSERace() == player:getRace() and player:hasKeyItem(dsp.ki.MAGICAL_PATTERN) == false) then
            questItemNeeded = 1;
        end
        --------------------------------------

        local pack = openChance(player,npc,trade,TreasureType,TreasureLvL,TreasureMinLvL,questItemNeeded);
        local success = 0;
        if (pack[2] ~= nil) then
            player:messageSpecial(pack[2]);
            success = pack[1];
        else
            success = pack[1];
        end

        if (success ~= -2) then
            player:tradeComplete();

            if (math.random() <= success) then
                local respawn = false;

                -- Succeded to open the coffer
                player:messageSpecial(ID.text.CHEST_UNLOCKED);

                if (questItemNeeded == 1) then
                    respawn = true;
                    player:addKeyItem(dsp.ki.MAGICAL_PATTERN);
                    player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAGICAL_PATTERN);
                else
                    player:setVar("["..zone.."]".."Treasure_"..TreasureType,os.time() + math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME));

                    local loot = chestLoot(zone,npc);
                    -- print("loot array: "); -- debug
                    -- print("[1]", loot[1]); -- debug
                    -- print("[2]", loot[2]); -- debug

                    if (loot[1]=="gil") then
                        player:addGil(loot[2]*GIL_RATE);
                        player:messageSpecial(ID.text.GIL_OBTAINED,loot[2]*GIL_RATE);
                    else
                        -- Item
                        player:addItem(loot[2]);
                        player:messageSpecial(ID.text.ITEM_OBTAINED,loot[2]);
                    end
                end

                UpdateTreasureSpawnPoint(npc:getID(),respawn);
            end
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.CHEST_LOCKED,1032);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;