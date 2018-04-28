---------------------------------------------
-- Invincible
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(dsp.mobMod.SCRIPTED_2HOUR) == 1) then
        return 0;
    elseif (mob:getHPP() <= mob:getMobMod(dsp.mobMod.PROC_2HOUR)) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.INVINCIBLE;
    local duration = 30;
    if (skill:getParam() ~= 0 and mob:getMobMod(dsp.mobMod.SCRIPTED_2HOUR) == 1) then
        duration = skill:getParam();
    end
    MobBuffMove(mob, typeEffect, 1, 0, duration);

    skill:setMsg(msgBasic.USES);
    return typeEffect;
end;
