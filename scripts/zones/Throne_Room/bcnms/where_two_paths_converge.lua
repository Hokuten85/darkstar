------------------------------------
-- Area: Throne Room
-- Name: Mission 9-2
-- !pos -111 -6 0 165
-----------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Throne_Room/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/battlefield")

-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)
    -- print("leave code "..leavecode);

    if leavecode == 2 then
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:getCurrentMission(BASTOK) == WHERE_TWO_PATHS_CONVERGE) then
            player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0);
        else
            player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),1);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
    -- print("bc finish csid "..csid.." and option "..option);
    player:setVar("BASTOK92",2); -- This should be MissionStatus..But all battlefields of same var need updated.
end;
