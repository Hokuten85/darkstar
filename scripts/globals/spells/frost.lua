-----------------------------------------
-- Spell: Frost
-- Deals ice damage that lowers an enemy's agility and gradually reduces its HP.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local dINT = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = 36;
    params.bonus = 0;
    params.effect = nil;
	local resist = applyResistance(caster, target, spell, params);

    if (resist <= 0.125) then
        spell:setMsg(85);
    else
        local sINT = caster:getStat(MOD_INT);
        local DOT = getElementalDebuffDOT(sINT);
        local effect = target:getStatusEffect(EFFECT_FROST);
        local noeffect = false;
        if (effect ~= nil) then
            if (effect:getPower() >= DOT) then
                noeffect = true;
            end;
        end;
        if (noeffect) then
            spell:setMsg(75); -- no effect
        else
            if (effect ~= nil) then
                target:delStatusEffect(EFFECT_FROST);
            end;
            spell:setMsg(237);
            local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist);
            target:addStatusEffect(EFFECT_FROST,DOT, 3, ELEMENTAL_DEBUFF_DURATION,FLAG_ERASBLE);
        end;
    end;
    
    return EFFECT_FROST;
end;