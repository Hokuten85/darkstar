-----------------------------------
-- Area: AlTaieu
-- NPC:  Dimensional Portal
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local Dimensional_Offset = 16912910;
    local npcID = npc:getID();
    
    if (npcID == Dimensional_Offset) then
       player:startEvent(151);    
    elseif (npcID == Dimensional_Offset+1) then
       player:startEvent(152);
    elseif (npcID == Dimensional_Offset+2) then
       player:startEvent(153); 
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if ( csid == 151 and option == 1) then 
        player:setPos(420,19,-140,63,102);     -- To La Theine Plateau {R}
    elseif ( csid == 152 and option == 1) then
        player:setPos(220,19,140,64,108);        -- To Konschtat Highlands {R}
    elseif ( csid == 153 and option == 1) then 
        player:setPos(260,35,340,255,117);     -- To Tahrongi Canyon {R}
    end
end;
