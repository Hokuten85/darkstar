---------------------------------------------------
-- Sound Blast
-- 15' Reduces INT of players in area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_INT_DOWN;
    local statmod = MOD_INT;
    local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
    if(resist > 0.2) then
        skill:setMsg(MSG_ENFEEB_IS);
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,10,0,120*resist);
    else
        skill:setMsg(MSG_MISS); -- resist !
    end
    return typeEffect;
end;
