-----------------------------------
-- Ability: Sekkanoki
-- Limits TP cost of next weapon skill to 100.
-- Obtained: Samurai Level 40
-- Recast Time: 0:05:00
-- Duration: 01:00, or until a weapon skill is used
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
    target:delStatusEffect(EFFECT_SEKKANOKI);
    target:addStatusEffect(EFFECT_SEKKANOKI,1,0,60);
end;