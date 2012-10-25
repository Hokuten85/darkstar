---------------------------------------------------
-- Meteor Strike
-- Ifrit deals fire elemental damage to target. 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	local dmgmod = 2;
	local accmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,accmod,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end