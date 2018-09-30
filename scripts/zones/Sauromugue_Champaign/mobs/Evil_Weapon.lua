-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Evil Weapon
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,100,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.BLIGHTING_BRAND_PH,20,math.random(5400,7200)); -- 90 to 120 minutes
end;
