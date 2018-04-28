-----------------------------------------
-- ID: 16974
-- Item: Dotanuki
-- Additional Effect: Impairs evasion
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 30;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effect.EVASION_BOOST);
        target:addStatusEffect(dsp.effect.EVASION_DOWN, 10, 0, 30);
        return SUBEFFECT_EVASION_DOWN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.EVASION_DOWN;
    end
end;