---------------------------------------------------
-- Spore
-- Emits a cloud of spores that inflict paralysis.
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
-- Duration: 9:00
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,25,0,180*resist); -- 30% ? --power=30;tic=0;duration=540;
		else
			skill:setMsg(MSG_MISS); -- resist !
		end
	else
		skill:setMsg(MSG_NO_EFFECT); -- no effect
	end
	return typeEffect;
end
