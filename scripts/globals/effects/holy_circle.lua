-----------------------------------
--
--     EFFECT_HOLY_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_UNDEAD_KILLER,8);
   target:addMod(MOD_ENMITY,-effect:getSubPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
   target:delMod(MOD_UNDEAD_KILLER,8);
   target:delMod(MOD_ENMITY,-effect:getSubPower());
end;
