-----------------------------------
-- Area: Ifrits_Cauldron
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.IFRITS_CAULDRON] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388, -- Obtained: <item>.
        GIL_OBTAINED               = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6397, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE              = 7049, -- Tallying conquest results...
        ALTAR_COMPLETED            = 7238, -- You have already made an offering today.
        ALTAR_INSPECT              = 7239, -- This looks like the altar where offerings are to be placed.
        ALTAR_OFFERING             = 7240, -- You place your offering of <item> on the altar.
        ALTAR_STANDARD             = 7241, -- It is an altar for offerings.
        CHEST_UNLOCKED             = 7249, -- You unlock the chest!
        MINING_IS_POSSIBLE_HERE    = 7257, -- Mining is possible here if you have <item>.
        EGGSHELLS_LIE_SCATTERED    = 7266, -- Eggshells lie scattered around the place...
        SENSE_OMINOUS_PRESENCE     = 7269, -- You sense an ominous presence...
        REGIME_REGISTERED          = 10421, -- New training regime registered!
        HOMEPOINT_SET              = 11507, -- Home point set!
    },
    mob =
    {
        PIRATES_COVE_NMS = 17616897,
        ASH_DRAGON       = 17617147,
        MIMIC            = 17617157,
        BOMB_QUEEN       = 17617158,
        TARASQUE         = 17617164,
        CAILLEACH_BHEUR  = 17617165,
    },
    npc =
    {
        FLAME_SPOUT_OFFSET = 17617204,
        TREASURE_COFFER    = 17617224,
        MINING =
        {
            17617225,
            17617226,
            17617227,
            17617228,
            17617229,
            17617230,
        },
    },
}

return zones[dsp.zone.IFRITS_CAULDRON]