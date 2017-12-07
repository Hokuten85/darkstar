-----------------------------------------
-- ID: 5477
-- Warrior Die
-- Teaches the job ability Fighter's Roll
-----------------------------------------

function onItemCheck(target)
    return target:canLearnAbility(85);
end;

function onItemUse(target)
    target:addLearnedAbility(85);
end;