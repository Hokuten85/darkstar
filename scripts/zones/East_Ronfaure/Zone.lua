-----------------------------------
--
-- Zone: East_Ronfaure (101)
--
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/zone");
require("scripts/globals/quests");
require("scripts/globals/settings");
require( "scripts/globals/icanheararainbow");
require("scripts/zones/East_Ronfaure/TextIDs");

package.loaded["scripts/globals/chocobo_digging"] = nil;
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 4504, 224, DIGREQ_NONE },       
                    { 688, 184, DIGREQ_NONE },
                    { 17396, 276, DIGREQ_NONE },
                    { 698, 69, DIGREQ_NONE },
                    { 840, 63, DIGREQ_NONE },
                    { 691, 144, DIGREQ_NONE },
                    { 4545, 12, DIGREQ_BURROW },
                    { 639, 29, DIGREQ_NONE },
                    { 636, 29, DIGREQ_BURROW },
                    { 4570, 11, DIGREQ_MODIFIER },
                    { 4487, 12, DIGREQ_MODIFIER },
                    { 4409, 10, DIGREQ_MODIFIER },
                    { 1188, 12, DIGREQ_MODIFIER },
                    { 4532, 11, DIGREQ_MODIFIER },
                    { 694, 10, DIGREQ_NONE },
                    { 617, 12, DIGREQ_BORE },
                    { 4386, 11, DIGREQ_NONE },
                    { 918, 10, DIGREQ_NONE },
                    { 574, 37, DIGREQ_NIGHT },
                };

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

-----------------------------------
-- onChocoboDig
-----------------------------------
function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray, zoneWeather);
end;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17191535,17191536};

    SetFieldManual(manuals);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(200.015,-3.187,-536.074,187);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0015;
    end

    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0015) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0015) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;