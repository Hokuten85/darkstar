-----------------------------------------
-- ID: 4142
-- Item: Pro-Ether +2
-- Item Effect: Restores 310 MP
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
        if (target:hasStatusEffect(EFFECT_MEDICINE)) then
                result = 111;
        end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
        target:addMP(310*ITEM_POWER);
        target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
	target:messageBasic(25,0,310);
end;