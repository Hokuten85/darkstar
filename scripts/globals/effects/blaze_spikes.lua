-----------------------------------
--
-- dsp.effect.BLAZE_SPIKES
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SPIKES,1);
    target:addMod(dsp.mod.SPIKES_DMG, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(dsp.mod.SPIKES,1);
    target:delMod(dsp.mod.SPIKES_DMG, effect:getPower());
end;
