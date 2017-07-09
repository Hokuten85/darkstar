-----------------------------------------
-- Spell: Haste II
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 300;

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local power = 307; -- 307/1024

    if (target:addStatusEffect(EFFECT_HASTE,power,0,duration) == false) then
        spell:setMsg(75);
    end

    return EFFECT_HASTE;
end;
