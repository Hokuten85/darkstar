-----------------------------------------
-- Spell: Diabolos
-- Summons Diabolos to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_DIABOLOS);

	return 0;
end;