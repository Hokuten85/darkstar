-----------------------------------
-- Area: Maze of Shakhrami (198)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MAZE_OF_SHAKHRAMI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        GEOMAGNETRON_ATTUNED     = 7010,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        FOSSIL_EXTRACTED         = 7049,  -- A large fossil has been excavated from here.
        NOTHING_FOSSIL           = 7050,  -- It looks like a rock with fossils embedded in it. Nothing out of the ordinary.
        CONQUEST_BASE            = 7077,  -- Tallying conquest results...
        DEVICE_NOT_WORKING       = 7250,  -- The device is not working.
        SYS_OVERLOAD             = 7259,  -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE             = 7264,  -- You lost the <item>.
        CHEST_UNLOCKED           = 7355,  -- You unlock the chest!
        MINING_IS_POSSIBLE_HERE  = 7363,  -- Mining is possible here if you have <item>.
        PLAYER_OBTAINS_ITEM      = 8263,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8264,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8265,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 8266,  -- You already possess that temporary item.
        NO_COMBINATION           = 8271,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 8272,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8273,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 8274,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 8275,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 8276,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 8277,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 8278,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 8279,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 8280,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 8281,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 8282,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 8283,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 8284,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 8286,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 10349, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 11421  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        TREMBLER_TABITHA_PH =
        {
            [17588276] = 17588278,
            [17588277] = 17588278,
        },
        ICHOROUS_IRE        = 17588225,
        ARGUS               = 17588674,
        LEECH_KING          = 17588685,
        WYRMFLY_OFFSET      = 17588701,
        APPARATUS_ELEMENTAL = 17588704,
        LOST_SOUL           = 17588706,
    },
    npc =
    {
        FOSSIL_ROCK_OFFSET = 17588737,
        TREASURE_CHEST     = 17588773,
        CASKET_BASE        = 17588712,
        EXCAVATION =
        {
            17588774,
            17588775,
            17588776,
            17588777,
            17588778,
            17588779,
        },
    },
}

return zones[dsp.zone.MAZE_OF_SHAKHRAMI]