-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Ancient Magical Gizmo #1 (E out of E, F, G, H, I, J)
--  Involved In Mission: The Heart of the Matter
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- Check if we are on Windurst Mission 1-2
    if (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
        local MissionStatus = player:getVar("MissionStatus");

        if (MissionStatus == 2) then
            -- Entered a Dark Orb
            if (player:getVar("MissionStatus_orb1") == 1) then
                player:startEvent(46);
            else
                player:messageSpecial(ID.text.ORB_ALREADY_PLACED);
            end
        elseif (MissionStatus == 4) then
            -- Took out a Glowing Orb
            if (player:getVar("MissionStatus_orb1") == 2) then
                player:startEvent(46);
            else
                player:messageSpecial(ID.text.G_ORB_ALREADY_GOTTEN);
            end
        else
            player:messageSpecial(ID.text.DARK_MANA_ORB_RECHARGER);
        end
    else
        player:messageSpecial(ID.text.DARK_MANA_ORB_RECHARGER);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 46) then
        local orb_value = player:getVar("MissionStatus_orb1");

        if (orb_value == 1) then
            player:setVar("MissionStatus_orb1",2);
            -- Push the text that the player has placed the orb
            player:messageSpecial(ID.text.FIRST_DARK_ORB_IN_PLACE);
            --Delete the key item
            player:delKeyItem(dsp.ki.FIRST_DARK_MANA_ORB);

            -- Check if all orbs have been placed or not
            if (player:getVar("MissionStatus_orb2") == 2 and
               player:getVar("MissionStatus_orb3") == 2 and
               player:getVar("MissionStatus_orb4") == 2 and
               player:getVar("MissionStatus_orb5") == 2 and
               player:getVar("MissionStatus_orb6") == 2) then
                player:messageSpecial(ID.text.ALL_DARK_MANA_ORBS_SET);
                player:setVar("MissionStatus",3);
            end
        elseif (orb_value == 2) then
            player:setVar("MissionStatus_orb1",3);
            -- Time to get the glowing orb out
            player:addKeyItem(dsp.ki.FIRST_GLOWING_MANA_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.FIRST_GLOWING_MANA_ORB);

            -- Check if all orbs have been placed or not
            if (player:getVar("MissionStatus_orb2") == 3 and
               player:getVar("MissionStatus_orb3") == 3 and
               player:getVar("MissionStatus_orb4") == 3 and
               player:getVar("MissionStatus_orb5") == 3 and
               player:getVar("MissionStatus_orb6") == 3) then
                player:messageSpecial(ID.text.RETRIEVED_ALL_G_ORBS);
                player:setVar("MissionStatus",5);
            end
        end
    end

end;