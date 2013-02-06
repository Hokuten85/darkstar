-----------------------------------
--  Area: Aht Urhgan Whitegate
--   NPC: Rytaal
--  Type: Standard NPC
-- @zone: 50
--  @pos: 112.002 -1.338 -45.038
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--player:setVar("TIME_IMPERIAL_ARMY_ID_TAG",0);

 
 local currentday = tonumber(os.date("%j"));  
 local lastarmyIDtag = player:getVar("TIME_IMPERIAL_ARMY_ID_TAG");
 local currenttagnummber = player:getVar("REMAINING_IMPERIAL_ARMY_ID_TAG");
 local diffday = currentday - lastarmyIDtag ;
 local currentassault;
 local haveimperialIDtag;
 ---------------------------------------------------------------------
   if (lastarmyIDtag == 0 )then -- first time you get the tag
     player:setVar("REMAINING_IMPERIAL_ARMY_ID_TAG",3); currenttagnummber =3;
     player:setVar("TIME_IMPERIAL_ARMY_ID_TAG",currentday);
    elseif ( diffday > 0 )then  
	currenttagnummber = currenttagnummber + diffday ;
	    if (currenttagnummber > 3)then -- store 3 TAG max
	     currenttagnummber = 3;
		end
    player:setVar("REMAINING_IMPERIAL_ARMY_ID_TAG",currenttagnummber);
	player:setVar("TIME_IMPERIAL_ARMY_ID_TAG",currentday);
    end
---------------------------------------------------------------------------
  if (player:getMainLvl() >= 50)then
    if(player:hasKeyItem(IMPERIAL_ARMY_ID_TAG))then
     haveimperialIDtag = 1;
     else
     haveimperialIDtag = 0;
	 end
   player:startEvent(0x010C,IMPERIAL_ARMY_ID_TAG,currenttagnummber,currentassault,haveimperialIDtag);
  else
  player:startEvent(0x010e);
  end
end;






-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
local currenttagnummber =  player:getVar("REMAINING_IMPERIAL_ARMY_ID_TAG");
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if(csid == 0x010C and option == 1 	and player:hasKeyItem(IMPERIAL_ARMY_ID_TAG)==false and currenttagnummber > 0)then
	player:addKeyItem(IMPERIAL_ARMY_ID_TAG);
	player:messageSpecial(KEYITEM_OBTAINED,IMPERIAL_ARMY_ID_TAG);
	player:setVar("REMAINING_IMPERIAL_ARMY_ID_TAG",currenttagnummber - 1);
	end
end;

