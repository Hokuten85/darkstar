---------------------------------------------------------------------------------------------------
-- func: !hp <amount> <player>
-- auth: <Unknown>, modified by TeoTwawki
-- desc: Sets the GM or target players health.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, hp, target)
    if (hp == nil or hp == 0) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@hp <amount> <player>" );
        return;
    end

    if (target == nil) then
        if (player:getHP() > 0) then
            player:setHP(hp);
        end
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            if (targ:getHP() > 0) then
                targ:setHP(hp);
            end
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@hp <amount> <player>" );
        end
    end
end