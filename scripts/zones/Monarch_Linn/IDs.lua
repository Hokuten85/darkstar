-----------------------------------
-- Area: Monarch_Linn
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MONARCH_LINN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        GLOWING_MIST            = 7125, -- A glowing mist of ever-changing proportions floats before you...
        CONQUEST_BASE           = 7460, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.MONARCH_LINN]