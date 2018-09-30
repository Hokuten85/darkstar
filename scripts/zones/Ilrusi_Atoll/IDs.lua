-----------------------------------
-- Area: Ilrusi_Atoll
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ILRUSI_ATOLL] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        ASSAULT_41_START        = 7456, -- Commencing <assault>! Objective: Rescue the agent
        ASSAULT_42_START        = 7457, -- Commencing <assault>! Objective: Destroy the assassins
        ASSAULT_43_START        = 7458, -- Commencing <assault>! Objective: Defeat Sagelord Molaal Ja
        ASSAULT_44_START        = 7459, -- Commencing <assault>! Objective: Steal the supplies
        ASSAULT_45_START        = 7460, -- Commencing <assault>! Objective: Apprehend the spy
        ASSAULT_46_START        = 7461, -- Commencing <assault>! Objective: Recover the treasure
        ASSAULT_47_START        = 7462, -- Commencing <assault>! Objective: Annihilate the enemy
        ASSAULT_48_START        = 7463, -- Commencing <assault>! Objective: Neutralize the marids
        ASSAULT_49_START        = 7464, -- Commencing <assault>! Objective: Gather pathological data
        ASSAULT_50_START        = 7465, -- Commencing <assault>! Objective: Defeat Orochi
        TIME_TO_COMPLETE        = 7506, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED          = 7507, -- The mission has failed. Leaving area.
        RUNE_UNLOCKED_POS       = 7508, -- ission objective completed. Unlocking Rune of Release ([A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P/Q/R/S/T/U/V/W/X/Y/Z]-#).
        RUNE_UNLOCKED           = 7509, -- ission objective completed. Unlocking Rune of Release.
        ASSAULT_POINTS_OBTAINED = 7510, -- You gain <number> [Assault point/Assault points]!
        TIME_REMAINING_MINUTES  = 7511, -- ime remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS  = 7512, -- ime remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN            = 7514, -- ll party members have fallen in battle. Mission failure in <number> [minute/minutes].
        CHEST                   = 7524, -- The chest contains...
        GOLDEN                  = 7525, -- ...a golden figurehead!
    },
    mob =
    {
        [1] =
        {
            PERCIPIENT_FISH1 = 17002497,
            PERCIPIENT_FISH2 = 17002498,
            PERCIPIENT_FISH3 = 17002499,
            PERCIPIENT_FISH4 = 17002500,
            PERCIPIENT_FISH5 = 17002501,
            PERCIPIENT_FISH6 = 17002502,
            PERCIPIENT_FISH7 = 17002503,
            PERCIPIENT_FISH8 = 17002504,
        },
        [2] =
        {
            CURSED_CHEST1  = 17002505,
            CURSED_CHEST2  = 17002506,
            CURSED_CHEST3  = 17002507,
            CURSED_CHEST4  = 17002508,
            CURSED_CHEST5  = 17002509,
            CURSED_CHEST6  = 17002510,
            CURSED_CHEST7  = 17002511,
            CURSED_CHEST8  = 17002512,
            CURSED_CHEST9  = 17002513,
            CURSED_CHEST10 = 17002514,
            CURSED_CHEST11 = 17002515,
            CURSED_CHEST12 = 17002516,
        },
    },
    npc =
    {
        ILRUSI_CURSED_CHEST_OFFSET = 17002505,
        ANCIENT_LOCKBOX            = 17002654,
        RUNE_OF_RELEASE            = 17002655,
        CURSED_CHEST1              = 17002505,
        CURSED_CHEST2              = 17002506,
        CURSED_CHEST3              = 17002507,
        CURSED_CHEST4              = 17002508,
        CURSED_CHEST5              = 17002509,
        CURSED_CHEST6              = 17002510,
        CURSED_CHEST7              = 17002511,
        CURSED_CHEST8              = 17002512,
        CURSED_CHEST9              = 17002513,
        CURSED_CHEST10             = 17002514,
        CURSED_CHEST11             = 17002515,
        CURSED_CHEST12             = 17002516,
        _1jp                       = 17002731,
        _jja                       = 17002752,
        _jjb                       = 17002753,
    },
}

return zones[dsp.zone.ILRUSI_ATOLL]
