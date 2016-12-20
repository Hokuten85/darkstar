require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-- DEF is removed in core as equip swaps can mess this up otherwise!
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_COUNTER,effect:getPower());
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
    target:delMod(MOD_COUNTER,effect:getPower());
end;