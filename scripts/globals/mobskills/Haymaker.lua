---------------------------------------------
--  Haymaker
--
--  Description: Punches the daylights out of all targets in front. Additional effect: Amnesia
--  Type: Physical
--  Utsusemi/Blink absorb: Unknown
--  Range: Front cone
--  Notes: Only used by Gurfurlur the Menacing.
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
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

	local typeEffect = EFFECT_AMNESIA;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,60*resist);--power=1;tic=0;duration=60;
		end
	end

	target:delHP(dmg);
	return dmg;
end;
