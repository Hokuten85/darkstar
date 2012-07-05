-----------------------------------------
-- ID: 11274
-- Item: custom top +1
-- Teleport's user to Purgonorgo Isle
-----------------------------------------

require("scripts/globals/teleports");

function onItemCheck(target)
result = 0;
    if (target:isZoneVisited(4) == false) then
        result = 56;
    end
return result;
end;

function onItemUse(target)
	toPurgonorgo(target);
end;