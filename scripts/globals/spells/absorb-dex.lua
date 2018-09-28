--------------------------------------
-- Spell: Absorb-DEX
-- Steals an enemy's dexterity.
--------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    if (target:hasStatusEffect(dsp.effect.DEX_DOWN) or caster:hasStatusEffect(dsp.effect.DEX_BOOST)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT); -- no effect
    else
        local dINT = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT);
        local params = {};
        params.diff = nil;
        params.attribute = dsp.mod.INT;
        params.skillType = 37;
        params.bonus = 0;
        params.effect = nil;
        local resist = applyResistance(caster, target, spell, params);
        if (resist <= 0.125) then
            spell:setMsg(dsp.msg.basic.MAGIC_RESIST);
        else
            spell:setMsg(dsp.msg.basic.MAGIC_ABSORB_DEX);
            caster:addStatusEffect(dsp.effect.DEX_BOOST,ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(dsp.mod.AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains DEX
            target:addStatusEffect(dsp.effect.DEX_DOWN,ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(dsp.mod.AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASABLE);    -- target loses DEX
        end
    end
    return dsp.effect.DEX_DOWN;
end;
