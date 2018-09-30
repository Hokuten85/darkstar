-----------------------------------------
-- ID: 5221
-- Item: pitcher_of_homemade_herbal_tea
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Accuracy +12% (cap 80)
-- Attack +10% (cap 40)
-- Ranged Accuracy +12% (cap 80)
-- Ranged Attack +10% (cap 40)
-- hHP +1
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5221)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_ACCP, 12)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 80)
    target:addMod(dsp.mod.FOOD_ATTP, 10)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 40)
    target:addMod(dsp.mod.FOOD_RACCP, 12)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 80)
    target:addMod(dsp.mod.FOOD_RATTP, 10)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 40)
    target:addMod(dsp.mod.HPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_ACCP, 12)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 80)
    target:delMod(dsp.mod.FOOD_ATTP, 10)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 40)
    target:delMod(dsp.mod.FOOD_RACCP, 12)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 80)
    target:delMod(dsp.mod.FOOD_RATTP, 10)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 40)
    target:delMod(dsp.mod.HPHEAL, 1)
end
