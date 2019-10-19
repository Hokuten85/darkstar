-----------------------------------
-- Area: Labyrinth of Onzozo (213)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.LABYRINTH_OF_ONZOZO] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        GEOMAGNETRON_ATTUNED     = 7010,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        CONQUEST_BASE            = 7049,  -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7208,  -- You can't fish here.
        CHEST_UNLOCKED           = 7316,  -- You unlock the chest!
        SENSE_OMINOUS_PRESENCE   = 7332,  -- You sense an ominous presence...
        REGIME_REGISTERED        = 9388,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 10472, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        PLAYER_OBTAINS_ITEM      = 10440, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 10441, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 10442, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 10443, -- You already possess that temporary item.
    },
    mob =
    {
        LORD_OF_ONZOZO_PH       =
        {
            [17649730] = 17649731, -- -39.356 14.265 -60.406
        },
        OSE_PH                  =
        {
            [17649813] = 17649822, -- -1.758 4.982 153.412
            [17649814] = 17649822, -- 8.113 5.055 159.197
            [17649824] = 17649822, -- 9.000 4.000 176.000
            [17649819] = 17649822, -- -7.000 4.467 184.000
            [17649820] = 17649822, -- -7.233 4.976 204.202
            [17649823] = 17649822, -- 26.971 4.440 216.229
            [17649816] = 17649822, -- 48.440 5.070 174.352
            [17649815] = 17649822, -- 39.858 4.364 164.961
        },
        SOULSTEALER_SKULLNIX_PH =
        {
            [17649838] = 17649818, -- 38.347 5.500 178.050
            [17649834] = 17649818, -- 43.103 5.677 181.977
            [17649843] = 17649818, -- 41.150 5.026 204.483
            [17649825] = 17649818, -- 24.384 5.471 197.938
            [17649829] = 17649818, -- 13.729 4.814 166.295
            [17649831] = 17649818, -- 5.096 3.930 166.865
        },
        NARASIMHA_PH            =
        {
            [17649783] = 17649784, -- -119.897 0.275 127.060
            [17649787] = 17649784, -- -126.841 -0.554 129.681
            [17649790] = 17649784, -- -140.000 -0.955 144.000
        },
        HELLION_PH              =
        {
            [17649797] = 17649795, -- 136.566 14.708 70.077
            [17649810] = 17649795, -- 127.523 14.327 210.258
        },
        PEG_POWLER_PH           =
        {
            [17649755] = 17649761, -- -100.912 4.263 -21.983
            [17649759] = 17649761, -- -128.471 4.952 0.489
            [17649760] = 17649761, -- -104.000 4.000 28.000
            [17649758] = 17649761, -- -111.183 5.357 44.411
            [17649762] = 17649761, -- -81.567 5.013 37.186
            [17649763] = 17649761, -- -72.956 4.943 39.293
            [17649770] = 17649761, -- -33.112 4.735 34.742
            [17649769] = 17649761, -- -51.745 4.288 46.295
            [17649774] = 17649761, -- -54.100 5.462 81.680
            [17649773] = 17649761, -- -65.089 5.386 81.363
            [17649766] = 17649761, -- -64.269 5.441 72.382
        },
        MYSTICMAKER_PROFBLIX    = 17649693,
        UBUME                   = 17649860,
        MEGAPOD_MEGALOPS        = 17649861,
    },
    npc =
    {
        CASKET_BASE    = 17649867,
        TREASURE_CHEST = 17649900,
    },
}

return zones[dsp.zone.LABYRINTH_OF_ONZOZO]