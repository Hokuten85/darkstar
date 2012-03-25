-----------------------------------------
-- ID: 4515
-- Item: copper_frog
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity 2
-- Agility 2
-- Mind -4
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:getRace() ~= 7) then
		result = 247;
	elseif (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,300,4515);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DEX, 2);
	target:addMod(MOD_AGI, 2);
	target:addMod(MOD_MND, -4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEX, 2);
	target:delMod(MOD_AGI, 2);
	target:delMod(MOD_MND, -4);
end;
