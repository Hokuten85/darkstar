-----------------------------------------
-- ID: 4408
-- Item: tortilla
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 6
-- Dexterity -1
-- Vitality 4
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,4408);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 6);
	target:addMod(MOD_DEX, -1);
	target:addMod(MOD_VIT, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 6);
	target:delMod(MOD_DEX, -1);
	target:delMod(MOD_VIT, 4);
end;
