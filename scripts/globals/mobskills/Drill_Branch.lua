---------------------------------------------
--  Drill Branch
--
--  Description: Drills a single target with a branch. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Melee
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,math.random(2,3)*info.hitslanded);

	local typeEffect = EFFECT_BLINDNESS;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 15, 0, 120);

	target:delHP(dmg);
	return dmg;
end;
