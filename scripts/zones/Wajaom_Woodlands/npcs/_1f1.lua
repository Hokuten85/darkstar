-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Engraved Tablet
-- !pos -64 -11 -641 51
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:hasKeyItem(SICKLEMOON_SALT)) then
        player:startEvent(514);
    else
        player:startEvent(516);
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

    if (csid == 514 and option == 1) then
        player:delKeyItem(SICKLEMOON_SALT);
    end

end;