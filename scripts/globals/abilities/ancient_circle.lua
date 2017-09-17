-----------------------------------
-- Ability: Ancient Circle
-- Grants resistance, defense, and attack against dragons to party members within the area of effect.
-- Obtained: Dragoon Level 5
-- Recast Time: 5:00
-- Duration: 03:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
	local duration = 180 + player:getMod(MOD_ANCIENT_CIRCLE_DURATION);

	if (target:getMainJob() ~= JOBS.DRG) then
		local accBonusValue = player:getTraitValue(TRAIT_ACCURACY_BONUS);
		target:addStatusEffect(EFFECT_ANCIENT_CIRCLE,15,0,duration,0,accBonusValue/2);
	else
		target:addStatusEffect(EFFECT_ANCIENT_CIRCLE,15,0,duration);
	end
end;