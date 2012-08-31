-----------------------------------------
-- Spell: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 5;
	
	taff = AffinityBonus(caster,spell);
	dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
	resist = applyResistance(caster,spell,target,dINT,37,bonus);
	if(resist <= (1/16)) then
		--TODO: Set resist msg
		return 0;
	end
	
	if(target:hasStatusEffect(EFFECT_STUN)) then
		--TODO: Set no effect
	else
		target:addStatusEffect(EFFECT_STUN,1,0,duration);
	end
	
	return 0;
end;