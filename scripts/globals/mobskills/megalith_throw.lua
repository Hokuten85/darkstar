---------------------------------------------
-- Megalith Throw
-- Titan delivers a ranged attack that slows target.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5
    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded)

    local typeEffect = dsp.effect.SLOW

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1000, 0, 120)

    target:takeDamage(dmg, mob)
    return dmg
end
