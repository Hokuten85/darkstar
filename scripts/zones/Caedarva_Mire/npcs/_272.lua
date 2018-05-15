-----------------------------------
-- Area: Caedarva Mire
-- Door: Runic Seal
-- !pos 486 -23 -500 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/besieged");
require("scripts/zones/Caedarva_Mire/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS)) then
        local assaultid = player:getCurrentAssault();
        local recommendedLevel = getRecommendedAssaultLevel(assaultid);
        local armband = 0;
        if (player:hasKeyItem(dsp.ki.ASSAULT_ARMBAND)) then
            armband = 1;
        end
        if (assaultid ~= 0) then
            player:startEvent(140, assaultid, -4, 0, recommendedLevel, 0, armband);
        else
            player:messageSpecial(NOTHING_HAPPENS);
        end
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option,target)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    local assaultid = player:getCurrentAssault();

    local cap = bit.band(option, 0x03);
    if (cap == 0) then
        cap = 99;
    elseif (cap == 1) then
        cap = 70;
    elseif (cap == 2) then
        cap = 60;
    else
        cap = 50;
    end

    player:setVar("AssaultCap", cap);

    local party = player:getParty();

    if (party ~= nil) then
        for i,v in ipairs(party) do
            if (not (v:hasKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS) and v:getCurrentAssault() == assaultid)) then
                player:messageText(target,MEMBER_NO_REQS, false);
                player:instanceEntry(target,1);
                return;
            elseif (v:getZone() == player:getZone() and v:checkDistance(player) > 50) then
                player:messageText(target,MEMBER_TOO_FAR, false);
                player:instanceEntry(target,1);
                return;
            end
        end
    end

    player:createInstance(player:getCurrentAssault(), 69);

end;

function onEventFinish(player,csid,option,target)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 130 or (csid == 140 and option == 4)) then
        player:setPos(0,0,0,0,69);
    end
end;

function onInstanceCreated(player,target,instance)
    if (instance) then
        instance:setLevelCap(player:getVar("AssaultCap"));
        player:setVar("AssaultCap", 0);
        player:setInstance(instance);
        player:instanceEntry(target,4);
        player:delKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS);
        player:delKeyItem(dsp.ki.ASSAULT_ARMBAND);
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZone() == player:getZone() then
                    v:setInstance(instance);
                    v:startEvent(130, 0);
                    v:delKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS);
                end
            end
        end
    else
        player:messageText(target,CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;