-----------------------------------------
-- Spell: Sprout Smack
-- Additional effect: Slow. Duration of effect varies with TP
-- Spell cost: 6 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 4
-- Casting Time: 0.5 seconds
-- Recast Time: 7.25 seconds
-- Skillchain property: Reverberation (can open Induration or Impaction)
-- Combos: Beast Killer
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
		params.tpmod = TPMOD_DURATION;
		params.dmgtype = DMGTYPE_BLUNT;
		params.scattr = SC_REVERBERATION;
		params.numhits = 1;
		params.multiplier = 1.5;
		params.tp150 = 1.5;
		params.tp300 = 1.5;
		params.azuretp = 1.5;
		params.duppercap = 11;
		params.str_wsc = 0.0;
		params.dex_wsc = 0.0;
		params.vit_wsc = 0.3;
		params.agi_wsc = 0.0;
		params.int_wsc = 0.0;
		params.mnd_wsc = 0.0;
		params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
	if(target:hasStatusEffect(EFFECT_SLOW)) then
		spell:setMsg(75); -- no effect
	else	
		target:addStatusEffect(EFFECT_SLOW,15,0,20);
	end

    return damage;
end;