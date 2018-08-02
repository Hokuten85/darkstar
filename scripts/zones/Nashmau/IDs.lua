-----------------------------------
-- Area: Nashmau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.NASHMAU] =
{
    text =
    {
        YOYOROON_SHOP_DIALOG     = 0, -- [UNKNOWN]
        PIPIROON_SHOP_DIALOG     = 0, -- [UNKNOWN]
        ITEM_CANNOT_BE_OBTAINED  = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_CANNOT_BE_OBTAINEDX = 6381, -- You cannot obtain the
        ITEM_OBTAINED            = 6387, -- Obtained: <item>
        GIL_OBTAINED             = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED         = 6390, -- Obtained key item: <keyitem>
        ITEM_OBTAINEDX           = 6396, -- You obtain ?Numeric Parameter 1? ?Possible Special Code: 01??Speaker Name?)??BAD CHAR: 80??BAD CHAR: 80??BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?!?Prompt?
        FISHING_MESSAGE_OFFSET   = 7048, -- You can't fish here
        HOMEPOINT_SET            = 7309, -- Home point set!
        NOMAD_MOOGLE_DIALOG      = 7329, -- I'm a traveling moogle, kupo. I help adventurers in the Outlands access items they have stored in a Mog House elsewhere, kupo.
        JAJAROON_SHOP_DIALOG     = 10478, -- Hellooo. Yooo have caaard? Can do gaaame? Jajaroon have diiice.
        TSUTSUROON_SHOP_DIALOG   = 10488, -- What yooo want? Have katana, katana, and nin-nin...yooo want?
        MAMAROON_SHOP_DIALOG     = 10491, -- Welcome to maaagic shop. Lots of magics for yooo.
        POPOROON_SHOP_DIALOG     = 10493, -- Come, come. Buy aaarmor, looots of armor!
        WATAKHAMAZOM_SHOP_DIALOG = 10494, -- Looking for some bows and bolts to strrrike fear into the hearts of your enemies? You can find 'em here!
        CHICHIROON_SHOP_DIALOG   = 10496, -- Howdy-hooo! I gots soooper rare dice for yooo.
        NENE_DELIVERY_DIALOG     = 10832, -- Yooo want to send gooods? Yooo want to send link clink
        NANA_DELIVERY_DIALOG     = 10833, -- Yooo send gooods. Yooo send link clink.
        RETRIEVE_DIALOG_ID       = 11885, -- You retrieve$ from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.NASHMAU]