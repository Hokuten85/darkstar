-----------------------------------
-- Field Manual
-- Area: South Gustaberg
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_SOUTH_GUSTABERG,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
    updateFov(player,csid,option,76,77,78,79,80);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,76,77,78,79,80,FOV_MSG_SOUTH_GUSTABERG);
end;
