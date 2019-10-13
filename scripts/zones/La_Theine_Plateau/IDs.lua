-----------------------------------
-- Area: La_Theine_Plateau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.LA_THEINE_PLATEAU] =
{
    text =
    {
        NOTHING_HAPPENS              = 119,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED      = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388,  -- Obtained: <item>.
        GIL_OBTAINED                 = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391,  -- Obtained key item: <keyitem>.
        CONQUEST_BASE                = 7049,  -- Tallying conquest results...
        ALREADY_OBTAINED_TELE        = 7208,  -- You already possess the gate crystal for this telepoint.
        FISHING_MESSAGE_OFFSET       = 7212,  -- You can't fish here.
        DIG_THROW_AWAY               = 7225,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                 = 7227,  -- You dig and you dig, but find nothing.
        RESCUE_DRILL                 = 7384,  -- Rescue drills in progress. Try to stay out of the way.
        FAURBELLANT_1                = 7424,  -- Greetings. traveler. Sorry, I've little time to chat. I must focus on my prayer.
        FAURBELLANT_2                = 7425,  -- Ah, the <item>! Thank you for making such a long journey to bring this! May the Gates of Paradise open to all.
        FAURBELLANT_3                = 7426,  -- Please deliver that <item> to the high priest in the San d'Oria Cathedral.
        FAURBELLANT_4                = 7427,  -- My thanks again for your services. May the Gates of Paradise open to all.
        UNLOCK_SUMMONER              = 7573,  -- You can now become a summoner.
        UNLOCK_CARBUNCLE             = 7574,  -- You can now summon Carbuncle.
        CANNOT_REMOVE_FRAG           = 7588,  -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG        = 7589,  -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS       = 7590,  -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS              = 7591,  -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT              = 7592,  -- It is an ancient Zilart monument.
        TELEPOINT_HAS_BEEN_SHATTERED = 7753,  -- The telepoint has been shattered into a thousand pieces...
        BROKEN_EGG                   = 7824,  -- There is a broken egg on the ground here. Perhaps there is a nest in the boughs of this tree.
        CHOCOBO_TRACKS               = 7885,  -- There are chocobo tracks on the ground here.
        PLAYER_OBTAINS_ITEM          = 7904,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM        = 7905,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM     = 7906,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP         = 7907,  -- You already possess that temporary item.
        NO_COMBINATION               = 7912,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS           = 7913,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK          = 7914,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS           = 7915,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK                  = 7916,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD        = 7917,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD         = 7918,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS     = 7919,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN        = 7920,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN     = 7921,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS         = 7922,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS              = 7923,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS               = 7924,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT           = 7925,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST      = 7927,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED            = 10123, -- New training regime registered!
        COMMON_SENSE_SURVIVAL        = 12328  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        TUMBLING_TRUFFLE_PH =
        {
            [17195256] = 17195259, -- 450.472 70.657 238.237
        },
        LUMBERING_LAMBERT_PH =
        {
            [17195143] = 17195317, -- -372 -16 -6
            [17195316] = 17195317, -- -117 -1 -136
            [17195317] = 17195318, -- Lumbering can't spawn if Bloodtear is up
        },
        BLOODTEAR_PH =
        {
            [17195143] = 17195318, -- -372 -16 -6
            [17195316] = 17195318, -- -117 -1 -136
            [17195317] = 17195318, -- -216 -8 -107
            [17195318] = 17195317, -- Bloodtear can't spawn if Lumbering is up
        },
        NIHNIKNOOVI    = 17195475,
    },
    npc =
    {
        FALLEN_EGG  = 17195582,
        RAINBOW     = 17195606,
        CASKET_BASE = 17195583,
    },
}

return zones[dsp.zone.LA_THEINE_PLATEAU]