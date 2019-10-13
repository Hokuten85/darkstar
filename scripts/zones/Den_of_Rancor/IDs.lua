-----------------------------------
-- Area: Den_of_Rancor
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DEN_OF_RANCOR] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        CONQUEST_BASE            = 7049,  -- Tallying conquest results...
        LANTERN_OFFSET           = 7208,  -- The grating will not budge.
        FISHING_MESSAGE_OFFSET   = 7236,  -- You can't fish here.
        CHEST_UNLOCKED           = 7344,  -- You unlock the chest!
        SENSE_OMINOUS_PRESENCE   = 7354,  -- You sense an ominous presence...
        PLAYER_OBTAINS_ITEM      = 7401,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7402,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7403,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7404,  -- You already possess that temporary item.
        NO_COMBINATION           = 7409,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7410,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7411,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7412,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7413,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7414,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7415,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7416,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7417,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7418,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7419,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7420,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7421,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7422,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7424,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9487,  -- New training regime registered!
        HOMEPOINT_SET            = 10537, -- Home point set!
    },
    mob =
    {
        CELESTE_EYED_TOZBERRY_PH =
        {
            [17432622] = 17432624,
        },
        FRIAR_RUSH_PH =
        {
            [17432638] = 17432640,
        },
        CARMINE_TAILED_JANBERRY_PH =
        {
            [17432661] = 17432659,
            [17432662] = 17432659,
        },
        TAWNY_FINGERED_MUGBERRY_PH =
        {
            [17432784] = 17432798,
            [17432785] = 17432798,
            [17432787] = 17432798,
            [17432788] = 17432798,
            [17432793] = 17432798,
            [17432794] = 17432798,
        },
        BISTRE_HEARTED_MALBERRY_PH =
        {
            [17432822] = 17432845,
        },
        OGAMA_PH =
        {
            [17432972] = 17432974,
            [17432978] = 17432974,
            [17432979] = 17432974,
        },
        MIMIC       = 17432583,
        HAKUTAKU    = 17433005,
        MOKUMOKUREN = 17433006,
    },
    npc =
    {
        CASKET_BASE     = 17433024,
        LANTERN_OFFSET  = 17433047,
        DROP_GATE       = 17433051,
        TREASURE_COFFER = 17433077,
    },
}

return zones[dsp.zone.DEN_OF_RANCOR]