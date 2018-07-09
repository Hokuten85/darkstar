-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Capucine
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,CAPUCINE_SHOP_DIALOG);

    local stock =
    {
        12473, 1904,    -- Poet's Circlet
        12608, 1288,    -- Tunic
        12601, 2838,    -- Linen Robe
        12736, 602,     -- Mitts
        12729, 1605,    -- Linen Cuffs
        12864, 860,     -- Slacks
        12857, 2318,    -- Linen Slops
        12992, 556,     -- Solea
        12985, 1495,    -- Holly Clogs
    };

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
