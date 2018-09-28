-----------------------------------------
-- ID: 18243
-- Item: Astral Pot
-- Item Effect: Pet Magical Attack +22
-- Duration 5 Minutes
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    local pet = target:getPet()
    if not pet then
        return dsp.msg.basic.REQUIRES_A_PET,0
    elseif (effect ~= nil) then
        if (effect:getSubType() == 18243) then
            target:delStatusEffect(dsp.effect.ENCHANTMENT)
        end
    end
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,300,18243)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,300,18243)
    end
end

function onEffectGain(target,effect)
    local pet = target:getPet()
    pet:addMod(dsp.mod.MATT, 22)
end

function onEffectLose(target, effect)
    local pet = target:getPet()
    pet:delMod(dsp.mod.MATT, 22)
end
