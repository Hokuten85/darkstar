---------------------------------------------------
-- Knockout
---------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    return master:countEffect(EFFECT_WIND_MANEUVER)
end

function onPetAbility(target, automaton, skill, master, action)
    local params = {
        numHits = 1,
        atkmulti = 1,
        accBonus = 50,
        weaponType = SKILL_CLB,
        ftp100 = 4.0,
        ftp200 = 5.0,
        ftp300 = 5.5,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.0,
        dex_wsc = 0.0,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.agi_wsc = 1.0
        params.ftp100 = 6.0
        params.ftp200 = 8.5
        params.ftp300 = 11.0
    end

    local damage = doPhysicalWeaponskill(automaton, target, 0, skill:getTP(), true, action, false, params)

    if damage > 0 then
        if not target:hasStatusEffect(EFFECT_EVASION_DOWN) then
            target:addStatusEffect(EFFECT_EVASION_DOWN, 10, 0, 30)
        end
    end

    return damage
end
