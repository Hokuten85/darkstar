-----------------------------------
-- Ability: Wizard's Roll
-- Enhances magic attack for party members within area of effect
-- Optimal Job: Black Mage
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level 58
-- Phantom Roll +1 Value: 2
--
-- Die Roll    |No BLM  |With BLM
-- --------    -------- -----------
-- 1           |+4      |+14
-- 2           |+6      |+16
-- 3           |+8      |+18
-- 4           |+10     |+20
-- 5           |+25     |+35
-- 6           |+12     |+22
-- 7           |+14     |+24
-- 8           |+17     |+27
-- 9           |+2      |+12
-- 10          |+20     |+10
-- 11          |+30     |+40
-- Bust        |-10     |-10
--
-- If the Corsair is a lower level than the player receiving Wizard's Roll, the +MAB will be reduced
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_WIZARDS_ROLL
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (player:hasStatusEffect(effectID)) then
        return msgBasic.ROLL_ALREADY_ACTIVE,0;
    elseif atMaxCorsairBusts(player) then
        return msgBasic.CANNOT_PERFORM,0;
    else
        return 0,0;
    end
end;

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, EFFECT_WIZARDS_ROLL, JOBS.BLM)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {4, 6, 8, 10, 25, 12, 14, 17, 2, 20, 30, 10};
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 10
    end
-- Check for MOD_PHANTOM_ROLL Value and apply non-stack logic.
    local phantomValue = caster:getMod(MOD_PHANTOM_ROLL);
    local phantombuffValue = 0;
    local phantomBase = 2; -- Base increment buff
    if (phantomValue == 3) then
        phantombuffMultiplier = 3;
    elseif ((phantomValue == 5) or (phantomValue == 8)) then
        phantombuffMultiplier = 5;
    elseif ((phantomValue == 7) or (phantomValue == 10) or (phantomValue == 12) or (phantomValue == 15)) then
        phantombuffMultiplier = 7;
    else
        phantombuffMultiplier = 0;
    end
-- Apply Additional Phantom Roll+ Buff
    local phantombuffValue = phantomBase * phantombuffMultiplier;
    local effectpower = effectpower + phantombuffValue
-- Check if COR Main or Sub
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_WIZARDS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_MATT) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
