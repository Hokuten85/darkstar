-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: qm2 (???)
-- Involved In Quest: 20 in Pirate Years
-- !pos 47.852 -7.808 403.391 114
-----------------------------------
package.loaded["scripts/zones/Eastern_Altepa_Desert/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Eastern_Altepa_Desert/TextIDs")
require("scripts/zones/Eastern_Altepa_Desert/MobIDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local twentyInPirateYearsCS = player:getVar("twentyInPirateYearsCS")
    local tsuchigumoKilled = player:getVar("TsuchigumoKilled")

    if twentyInPirateYearsCS == 3 and tsuchigumoKilled <= 1 and not GetMobByID(TSUCHIGUMO_OFFSET):isSpawned() and not GetMobByID(TSUCHIGUMO_OFFSET + 1):isSpawned() then
        player:messageSpecial(SENSE_OF_FOREBODING)
        SpawnMob(TSUCHIGUMO_OFFSET):updateClaim(player)
        SpawnMob(TSUCHIGUMO_OFFSET + 1):updateClaim(player)
    elseif twentyInPirateYearsCS == 3 and tsuchigumoKilled >= 2 then
        player:addKeyItem(dsp.ki.TRICK_BOX)
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.TRICK_BOX)
        player:setVar("twentyInPirateYearsCS", 4)
        player:setVar("TsuchigumoKilled", 0)
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end