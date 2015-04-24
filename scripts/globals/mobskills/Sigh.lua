---------------------------------------------
--  Sigh
--
--  Description: Self Evasion Boost. Extremely potent, but quickly decays over time.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Very sharp evasion increase.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_EVASION_BOOST;

    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 30));
    return typeEffect;
end;
