-----------------------------------
-- Attachment: Strobe
-- http://forum.square-enix.com/ffxi/threads/49065?p=565264#post565264
-- Values are currently PRIOR TO NOVEMBER 2015 UPDATE!
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_ENMITY, 5) -- 10 currently on retail
end

function onUnequip(pet)
    pet:delMod(MOD_ENMITY, 5) -- 10 currently on retail
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_ENMITY, 10); -- 15 currently on retail
    elseif (maneuvers == 2) then
        pet:addMod(MOD_ENMITY, 10); -- 15 currently on retail
    elseif (maneuvers == 3) then
        pet:addMod(MOD_ENMITY, 15); -- 20 currently on retail
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_ENMITY, 10); -- 15 currently on retail
    elseif (maneuvers == 2) then
        pet:delMod(MOD_ENMITY, 10); -- 15 currently on retail
    elseif (maneuvers == 3) then
        pet:delMod(MOD_ENMITY, 15); -- 20 currently on retail
    end
end
