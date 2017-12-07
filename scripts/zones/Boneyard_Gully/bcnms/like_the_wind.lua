-----------------------------------
-- Area: Boneyard_Gully
-- Name: like_the_wind
-- BCNM: 673
-- Mask: 1
-----------------------------------
package.loaded["scripts/zones/Boneyard_Gully/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Boneyard_Gully/TextIDs");
require("scripts/globals/battlefield")

-----------------------------------

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
end

function onBattlefieldTick(battlefield, tick)
    g_Battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
    if (player:hasKeyItem(MIASMA_FILTER)) then
        player:delKeyItem(MIASMA_FILTER);
    end;
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)

    if leavecode == 2 then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,0,0);
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end

end;

function onBattlefieldDestroy(player,battlefield)
end;


function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
    if (csid == 32001) then
        player:addExp(2000);
    end
end;