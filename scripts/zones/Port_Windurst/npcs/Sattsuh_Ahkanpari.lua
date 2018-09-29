-----------------------------------
-- Area: Port Windurst
--  NPC: Sattsuh Ahkanpari
-- Regional Marchant NPC
-- Only sells when Windurst controlls Elshimo Uplands
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(dsp.region.ELSHIMOUPLANDS);
    if (RegionOwner ~= dsp.nation.WINDURST) then
        player:showText(npc,SATTSUHAHKANPARI_CLOSED_DIALOG);
    else
        player:showText(npc,SATTSUHAHKANPARI_OPEN_DIALOG);

        local stock =
        {
            1413,  1656, -- Cattleya
            628,    239, -- Cinnamon
            4468,    73, -- Pamamas
            721,    147  -- Rattan Lumber
        }
        dsp.shop.general(player, stock, WINDURST);

    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
