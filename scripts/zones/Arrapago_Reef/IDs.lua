-----------------------------------
-- Area: Arrapago_Reef
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ARRAPAGO_REEF] =
{
    text =
    {
        NOTHING_HAPPENS             = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET      = 7048, -- You can't fish here.
        RESPONSE                    = 7328, -- There is no response...
        DOOR_IS_LOCKED              = 7457, -- The door is locked.  You might be able to open it with <item>.
        DOOR_IS_LOCKED2             = 7458, -- The door is locked.  You might be able to open it with <item> or <item>.
        KEY_BREAKS                  = 7459, -- The <item> breaks!
        YOU_UNLOCK_DOOR             = 7462, -- You unlock the door from the inside.
        LOCK_SUCCESS                = 7463, -- <name> successfully opened the lock with the <item>!
        LOCK_FAIL                   = 7464, -- <name> failed to open the lock with the <item>...
        YOU_NO_REQS                 = 7894, -- You do not meet the requirements to enter the battlefield with your party members. Access is denied.
        CANNOT_ENTER                = 8444, -- You cannot enter at this time. Please wait a while before trying again.
        AREA_FULL                   = 8445, -- This area is fully occupied. You were unable to enter.
        MEMBER_NO_REQS              = 8449, -- Not all of your party members meet the requirements for this objective. Unable to enter area.
        MEMBER_TOO_FAR              = 8453, -- One or more party members are too far away from the entrance. Unable to enter area.
        MEDUSA_ENGAGE               = 8555, -- Foolish two-legs... Have you forgotten the terrible power of the gorgons you created? It is time you were reminded...
        MEDUSA_DEATH                = 8556, -- No... I cannot leave my sisters...
    },
    mob =
    {
        MEDUSA                = 16998862,
        LIL_APKALLU           = 16998871,
        VELIONIS              = 16998872,
        ZAREEHKL_THE_JUBILANT = 16998873,
        NUHN                  = 16998874,
    },
    npc =
    {
    },
}

return zones[dsp.zone.ARRAPAGO_REEF]