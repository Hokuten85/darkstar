-----------------------------------------
-- ID: 4112
-- Item: Potion
-- Item Effect: Restores 50 HP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addHP(50*ITEM_POWER);
	target:messageBasic(24,0,50);
end;