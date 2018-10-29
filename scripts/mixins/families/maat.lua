require("scripts/globals/mixins")
require("scripts/globals/status")


g_mixins = g_mixins or {}

g_mixins.maat = function(mob)
    mob:addListener("ROAM_TICK", "MAAT_RTICK", function(mob)
        if mob:getLocalVar("engaged") == 0 then
            for _, player in pairs(mob:getZone():getPlayers()) do
                if player:checkDistance(mob) < 8 then
                    local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
                    mob:messageText(mob, ID.text.YOU_DECIDED_TO_SHOW_UP)
                    mob:setLocalVar("engaged", player:getID())
                end
            end
        end
    end)

    mob:addListener("ENGAGE", "MAAT_ENGAGE", function(mob, target)
        if mob:getLocalVar("engaged") == 0 then
            local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
            mob:messageText(mob, ID.text.YOU_DECIDED_TO_SHOW_UP)
            mob:setLocalVar("engaged", target:getID())
        end
    end)

    mob:addListener("DISENGAGE", "MAAT_DISENGAGE", function(mob)
        engagedID = mob:getLocalVar("engaged")
        if engagedID ~= 0 then
            player = GetPlayerByID(engagedID)
            if player:getHP() == 0 then
                local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
                mob:showText(mob, ID.text.LOOKS_LIKE_YOU_WERENT_READY)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "MAAT_CTICK", function(mob)
        local defaultAbility = {
            [dsp.job.WAR] = dsp.jsa.MIGHTY_STRIKES_MAAT,
            [dsp.job.MNK] = dsp.jsa.HUNDRED_FISTS_MAAT,
            [dsp.job.WHM] = dsp.jsa.BENEDICTION_MAAT,
            [dsp.job.BLM] = dsp.jsa.MANAFONT_MAAT,
            [dsp.job.RDM] = dsp.jsa.CHAINSPELL_MAAT,
            [dsp.job.THF] = dsp.jsa.PERFECT_DODGE_MAAT,
            [dsp.job.PLD] = dsp.jsa.INVINCIBLE_MAAT,
            [dsp.job.DRK] = dsp.jsa.BLOOD_WEAPON_MAAT,
            [dsp.job.BST] = dsp.jsa.FAMILIAR_MAAT,
            [dsp.job.BRD] = dsp.jsa.SOUL_VOICE_MAAT,
            [dsp.job.RNG] = dsp.jsa.EES_MAAT,
            [dsp.job.SAM] = dsp.jsa.MEIKYO_SHISUI_MAAT,
            [dsp.job.NIN] = dsp.jsa.MIJIN_GAKURE_MAAT,
            [dsp.job.DRG] = dsp.jsa.CALL_WYVERN_MAAT,
            [dsp.job.SMN] = dsp.jsa.ASTRAL_FLOW_MAAT,
        }

        if mob:getLocalVar("used2h") == 0 and mob:getHPP() < 60 then
            local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
            mob:messageText(mob, ID.text.NOW_THAT_IM_WARMED_UP)
            mob:useMobAbility(defaultAbility[mob:getMainJob()])
            mob:setLocalVar("used2h", 1)
        end

        if (mob:getHPP() < 20) or (mob:getMainJob() == dsp.job.WHM and mob:getBattleTime() > 300) then
            local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
            mob:showText(mob, ID.text.YOUVE_COME_A_LONG_WAY)
            mob:getBattlefield():win()
        end

    end)

    mob:addListener("ITEM_STOLEN", "MAAT_ITEM_STOLEN", function(mob, player, itemId)
        local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
        mob:messageText(mob, ID.text.YOUVE_COME_A_LONG_WAY)
        mob:getBattlefield():win()
    end)
    
    mob:addListener("DEATH", "MAAT_DEATH", function(mob, killer)
        local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
        mob:messageText(mob, ID.text.YOUVE_COME_A_LONG_WAY)
    end)

    mob:addListener("WEAPONSKILL_TAKE", "MAAT_WEAPONSKILL_TAKE", function(target, attacker, skillId, tp, action)
        local ID = require("scripts/zones/"..target:getZoneName().."/IDs")
        target:messageText(target, ID.text.THAT_LL_HURT_IN_THE_MORNING)
    end)

    mob:addListener("WEAPONSKILL_USE", "MAAT_WEAPONSKILL_USE", function(mob, target, wsid, tp, action)
        local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
        if (wsid == 1028) then -- Tackle
            mob:messageText(mob, ID.text.TAKE_THAT_YOU_WHIPPERSNAPPER)
        elseif (wsid == 1033) then -- Dragon Kick
            mob:messageText(mob, ID.text.TEACH_YOU_TO_RESPECT_ELDERS)
        elseif (wsid == 1034) then -- Asuran Fists
            mob:messageText(mob, ID.text.LOOKS_LIKE_YOU_WERENT_READY)
        end
    end)

end

return g_mixins.maat