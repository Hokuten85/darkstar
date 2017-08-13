-----------------------------------------
-- Spell: Blind
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    -- Pull base stats.
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_MND)); --blind uses caster INT vs target MND

    -- Base power.  May need more research.
    local power = math.floor(dINT * 9/40) + 23;

    if (power < 5) then
        power = 5;
    end

    if (power > 50) then
        power = 50;
    end


    -- Duration, including resistance.  Unconfirmed.
    local duration = 180 * applyResistanceEffect(caster,spell,target,dINT,35,0,EFFECT_BLINDNESS);

    if (duration >= 60) then --Do it!

        if (target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end
    return EFFECT_BLINDNESS;
end;