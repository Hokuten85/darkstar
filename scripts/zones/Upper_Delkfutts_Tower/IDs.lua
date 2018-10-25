-----------------------------------
-- Area: Upper_Delkfutts_Tower
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.UPPER_DELKFUTTS_TOWER] =
{
    text =
    {
        THIS_ELEVATOR_GOES_DOWN = 25, -- This elevator goes down, but it is locked. Perhaps a key is needed to activate it.
        ITEM_CANNOT_BE_OBTAINED = 6416, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6422, -- Obtained: <item>.
        GIL_OBTAINED            = 6423, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6425, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7083, -- You can't fish here.
        CONQUEST_BASE           = 7183, -- Tallying conquest results...
        CHEST_UNLOCKED          = 7349, -- You unlock the chest!
        REGIME_REGISTERED       = 9458, -- New training regime registered!
        HOMEPOINT_SET           = 10514, -- Home point set!
    },
    mob =
    {
        ENKELADOS_PH =
        {
            [17424388] = 17424385, -- -371.586 -144.367 28.244
            [17424426] = 17424423, -- -215.194 -144.099 19.528
        },
        PALLAS       = 17424444,
        ALKYONEUS    = 17424480,
    },
    npc =
    {
        TREASURE_CHEST = 17424563,
    },
}

return zones[dsp.zone.UPPER_DELKFUTTS_TOWER]