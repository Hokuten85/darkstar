-----------------------------------
-- Area: Throne_Room
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THRONE_ROOM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        NO_HIDE_AWAY            = 7696, -- I have not been hiding away from my troubles!
        FEEL_MY_PAIN            = 7697, -- Feel my twenty years of pain!
        YOUR_ANSWER             = 7698, -- Is that your answer!?
        RETURN_TO_THE_DARKNESS  = 7699, -- Return with your soul to the darkness you came from!
        CANT_UNDERSTAND         = 7700, -- You--a man who has never lived bound by the chains of his country--how can you understand my pain!?
        BLADE_ANSWER            = 7701, -- Let my blade be the answer!
    },
    mob =
    {
        SHADOW_LORD_STAGE_2_OFFSET = 17453060,
        ZEID_BCNM_OFFSET           = 17453064,
    },
    npc =
    {
    },
}

return zones[dsp.zone.THRONE_ROOM]