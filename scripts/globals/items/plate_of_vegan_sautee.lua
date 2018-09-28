-----------------------------------------
-- ID: 5184
-- Item: plate_of_vegan_sautee
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Agility 1
-- Vitality -1
-- Ranged ACC % 7
-- Ranged ACC Cap 20
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5184);
end;

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, 1);
    target:addMod(dsp.mod.VIT, -1);
    target:addMod(dsp.mod.FOOD_RACCP, 7);
    target:addMod(dsp.mod.FOOD_RACC_CAP, 20);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 1);
    target:delMod(dsp.mod.VIT, -1);
    target:delMod(dsp.mod.FOOD_RACCP, 7);
    target:delMod(dsp.mod.FOOD_RACC_CAP, 20);
end;
