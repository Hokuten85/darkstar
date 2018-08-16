-----------------------------------
-- Attachment: Stealth Screen II
-----------------------------------
require("scripts/globals/status")

function onEquip(pet)
    pet:addMod(dsp.mod.ENMITY, -20)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.ENMITY, -20)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(dsp.mod.ENMITY, -10)
    elseif (maneuvers == 2) then
        pet:addMod(dsp.mod.ENMITY, -10)
    elseif (maneuvers == 3) then
        pet:addMod(dsp.mod.ENMITY, -10)
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(dsp.mod.ENMITY, -10)
    elseif (maneuvers == 2) then
        pet:delMod(dsp.mod.ENMITY, -10)
    elseif (maneuvers == 3) then
        pet:delMod(dsp.mod.ENMITY, -10)
    end
end
