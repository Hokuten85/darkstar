-----------------------------------------
-- Spell: Teleport-Altep
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
        if (target:hasKeyItem(357) == true) then
                toAltep(target);
        end;

        return 0;
end;