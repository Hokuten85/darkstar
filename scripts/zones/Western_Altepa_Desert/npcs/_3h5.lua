-----------------------------------
-- Area: Western Altepa Desert
--  NPC: _3h5 (Ruby Column)
-- Notes: Mechanism for Altepa Gate
-- !pos 59 10 -104 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local RubyID = npc:getID();
    local Ruby = npc:getAnimation();
    local Topaz = GetNPCByID(RubyID+1):getAnimation();
    local Emerald = GetNPCByID(RubyID+2):getAnimation();
    local Sapphire = GetNPCByID(RubyID+3):getAnimation();

    if (Ruby ~= 8) then
        npc:setAnimation(8);
        GetNPCByID(RubyID-4):setAnimation(8);
    else
        player:messageSpecial(ID.text.DOES_NOT_RESPOND);
    end

    if (Emerald == 8 and Sapphire == 8 and Topaz == 8) then
        local rand = math.random(15,30);
        local randT = rand * 60;

        -- Add timer for the door
        GetNPCByID(RubyID-5):openDoor(randT);
        -- Add same timer for the 4 center lights
        GetNPCByID(RubyID-4):openDoor(randT);
        GetNPCByID(RubyID-3):openDoor(randT);
        GetNPCByID(RubyID-2):openDoor(randT);
        GetNPCByID(RubyID-1):openDoor(randT);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;