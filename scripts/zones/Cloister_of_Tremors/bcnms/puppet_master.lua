-----------------------------------
-- Area: Cloister of Tremors
-- BCNM: The Puppet Master
-- !pos -539 1 -493 209
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Tremors/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/quests");
require("scripts/zones/Cloister_of_Tremors/TextIDs");
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

    if leavecode == 2 then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),2);
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end

end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

    if (csid == 32001 and player:getVar("ThePuppetMasterProgress") == 2) then
        player:setVar("ThePuppetMasterProgress",3);
    end;
end;
