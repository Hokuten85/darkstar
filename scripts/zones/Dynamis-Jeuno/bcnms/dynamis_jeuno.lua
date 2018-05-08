-----------------------------------
-- Area: Dynamis Jeuno
-- Name: Dynamis Jeuno
require("scripts/globals/battlefield")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
    
    SetServerVariable("[DynaJeuno]UniqueID",os.time());
    SetServerVariable("[DynaJeuno]Boss_Trigger",0);
    SetServerVariable("[DynaJeuno]Already_Received",0);
    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
    
    player:setVar("DynamisID",GetServerVariable("[DynaJeuno]UniqueID"));
    local realDay = os.time();
    if (DYNA_MIDNIGHT_RESET == true) then
        realDay = getMidnight() - 86400;
    end
    local dynaWaitxDay = player:getVar("dynaWaitxDay");

    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay) then
        player:setVar("dynaWaitxDay",realDay);
    end
    
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBattlefieldLeave(player,battlefield,leavecode)
--print("leave code "..leavecode);
    
    if leavecode == dsp.battlefield.leaveCode.LOST then
        GetNPCByID(17547510):setStatus(2);
        SetServerVariable("[DynaJeuno]UniqueID",0);
    end
    
end;