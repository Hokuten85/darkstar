-----------------------------------------
--	ID: 14410
--	Equip: nimbus_doublet
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_BODY) == 14410) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,14410);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,14410);
	end
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	target:addHP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;