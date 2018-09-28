-----------------------------------
-- Area: Rabao
--  NPC: Shiny Teeth
-- Standard Merchant NPC
-- !pos -30 8 99 247
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,SHINY_TEETH_SHOP_DIALOG);

    local stock =
    {
        0x4042,1867,    --Dagger     1867 - 2111
         0x404C,11128,    --Kris     11128 - 12096
         0x4052,2231,    --Knife     2231 - 2522
         0x40A8,4163,    --Scimitar     4163 - 4706
         0x40A9,35308,    --Tulwar     35308
         0x40AE,62560,    --Falchion     62560 - 70720
         0x42A4,2439,    --Rod     2439 - 4680
         0x4011,103803,    --Jamadhars     103803 - 104944
         0x4303,23887,    --Composite Bow     23887 - 24150
         0x4392,294,    --Tathlum     294 - 332
         0x43A8,7,        --Iron Arrow     7 - 10
         0x43BC,92,        --Bullet     92 - 174
         0x43A3,5460,    --Riot Grenade     5460 - 5520
         0x4384,8996}    --Chakram     8996 - 10995

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;