---------------------------------------------
-- Hastega
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(dsp.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime
    print(bonusTime)
    print(duration)

    -- Garuda's Hastega is a weird exception and uses 153 instead of 15%
    -- That's why it overwrites some things regular haste won't.
    target:addStatusEffect(dsp.effect.HASTE,153,0,duration)
    skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)
    return dsp.effect.HASTE
end