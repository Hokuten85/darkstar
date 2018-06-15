-----------------------------------
-- Area: Bastok Mines
--  NPC: Emaliveulaux
-- Tavnazian Archipelago Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/zones/Bastok_Mines/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    onHalloweenTrade(player, trade, npc)
end

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(dsp.region.TAVNAZIANARCH)
    local MissionProgress = player:getCurrentMission(COP)

    if MissionProgress >= THE_SAVAGE then
        if RegionOwner ~= dsp.nation.BASTOK then
            player:showText(npc, EMALIVEULAUX_CLOSED_DIALOG)
        else
            local stock =
            {
                1523,  290,    -- Apple Mint
                5164, 1945,    -- Ground Wasabi
                17005,  99,    -- Lufaise Fly
                5195,  233     -- Misareaux Parsley
            }

            player:showText(npc, EMALIVEULAUX_OPEN_DIALOG)
            dsp.shop.general(player, stock, BASTOK)
        end
    else
        player:showText(npc, EMALIVEULAUX_COP_NOT_COMPLETED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
