-----------------------------------
-- Ability: Puppet Roll
-- Enhances pet magic attack and magic accuracy for party members within area of effect
-- Optimal Job: Puppetmaster
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 52
-- Phantom Roll +1 Value: 3
--
-- Die Roll    |No PUP  |With PUP
-- --------    -------  ----------
-- 1           |+4      |+12
-- 2           |+5      |+13
-- 3           |+18     |+26
-- 4           |+7      |+15
-- 5           |+9      |+17
-- 6           |+10     |+18
-- 7           |+2      |+10
-- 8           |+11     |+19
-- 9           |+13     |+21
-- 10          |+15     |+23
-- 11          |+22     |+30
-- Bust        |-8      |-8
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_PUPPET_ROLL;
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
        corsairSetup(caster, ability, action, EFFECT_PUPPET_ROLL, JOBS.PUP);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {4, 5, 18, 7, 9, 10, 2, 11, 13, 15, 22, 8}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 8
    end
-- Check for MOD_PHANTOM_ROLL Value and apply non-stack logic.
    local phantomValue = caster:getMod(MOD_PHANTOM_ROLL);
    local phantombuffValue = 0;
    local phantomBase = 3; -- Base increment buff
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
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_PUPPET_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_PET_MACC) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
