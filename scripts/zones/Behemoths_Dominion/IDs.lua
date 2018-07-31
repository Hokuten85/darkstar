-----------------------------------
-- Area: Behemoths_Dominion
-----------------------------------
require("scripts/globals/zones")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BEHEMOTHS_DOMINION] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING     = 6402, -- You are suddenly overcome with a sense of foreboding...
        IRREPRESSIBLE_MIGHT     = 6405, -- An aura of irrepressible might threatens to overwhelm you...
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        SOMETHING_BETTER        = 7314, -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG      = 7317, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...?Prompt?
        ALREADY_OBTAINED_FRAG   = 7318, -- You have already obtained this monument's
        FOUND_ALL_FRAGS         = 7320, -- You have obtained ! You now have all 8 fragments of light!
        ZILART_MONUMENT         = 7321, -- It is an ancient Zilart monument.?Prompt?
    },
    mob =
    {
        BEHEMOTH                = 17297440,
        KING_BEHEMOTH           = 17297441,
        TALEKEEPERS_GIFT_OFFSET = 17297446,
        ANCIENT_WEAPON          = 17297449,
        LEGENDARY_WEAPON        = 17297450,
    },
    npc =
    {
        BEHEMOTH_QM                = 17297459,
        BEHEMOTHS_CERMET_HEADSTONE = 17297493,
    },
}

return zones[dsp.zone.BEHEMOTHS_DOMINION]