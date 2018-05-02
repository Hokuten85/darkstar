-----------------------------------------
-- Spell: Diaga
-- Lowers an enemy's defense and gradually deals light elemental damage.
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    -- calculate raw damage
    local basedmg = caster:getSkillLevel(dsp.skill.ENF) / 4;
    local params = {};
    params.dmg = basedmg;
    params.multiplier = 1;
    params.skillType = dsp.skill.ENF;
    params.attribute = dsp.mod.INT;
    params.hasMultipleTargetReduction = false;

    local dmg = calculateMagicDamage(caster, target, spell, params);

    dmg = utils.clamp(dmg, 1, 12);

    -- get resist multiplier (1x if no resist)
    local params = {};params.diff = caster:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT);params.attribute = dsp.mod.INT;params.skillType = dsp.skill.ENF;params.bonus = 1.0;resist = applyResistance(caster, target, spell, params);
    -- get the resisted damage
    dmg = dmg*resist;
    -- add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    -- add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());

    -- add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster,target,spell,dmg);

    -- Calculate duration.
    local duration = 60;
    local dotBonus = caster:getMod(dsp.mod.DIA_DOT);  -- Dia Wand

    if (caster:hasStatusEffect(dsp.effect.SABOTEUR)) then
        duration = duration * 2;
        caster:delStatusEffect(dsp.effect.SABOTEUR);
    end

    -- Check for Bio.
    local bio = target:getStatusEffect(dsp.effect.BIO);

    -- Do it!
    if (target:addStatusEffect(dsp.effect.DIA,1+dotBonus,3,duration,FLAG_ERASABLE,5,1)) then
        spell:setMsg(dsp.msg.basic.MAGIC_DMG);
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
    end

    -- Try to kill same tier Bio
    if (BIO_OVERWRITE == 1 and bio ~= nil) then
        if (bio:getPower() == 1) then
            target:delStatusEffect(dsp.effect.BIO);
        end
    end

    return final;

end;
