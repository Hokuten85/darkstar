-----------------------------------------
-- ID: 14788
-- Item: Gamushara Earring
-- Item Effect: Attack +22
-- Duration: 3 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 14788 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    if target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14788)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14788)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATT, 22)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.ATT, 22)
end