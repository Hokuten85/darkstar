-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Goblin Furrier
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/fieldsofvalor");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Sauromugue_Champaign/TextIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,97,2);
    checkRegime(player,mob,98,2);

    if (ENABLE_ACP == 1 and (player:hasKeyItem(dsp.kis.CHUNK_OF_SMOKED_GOBLIN_GRUB) == false) and player:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            player:addKeyItem(dsp.kis.CHUNK_OF_SMOKED_GOBLIN_GRUB);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.CHUNK_OF_SMOKED_GOBLIN_GRUB);
        end
    end

end;