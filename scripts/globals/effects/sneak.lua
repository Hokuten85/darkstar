-----------------------------------
--
-- 	EFFECT_SNEAK
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	tick = effect:getLastTick();
	if (tick < 4 and tick ~= 0) then
		target:messageBasic(251, effect:getType());
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;