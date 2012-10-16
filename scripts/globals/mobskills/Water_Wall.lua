---------------------------------------------------
-- Water Wall
-- Enhances defense.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	skill:setMsg(MSG_BUFF);
	local typeEffect = EFFECT_DEFENSE_BOOST;
	mob:delStatusEffect(typeEffect);
	mob:addStatusEffect(typeEffect,100,0,60);
	return typeEffect;
end;
