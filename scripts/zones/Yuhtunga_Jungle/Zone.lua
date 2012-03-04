-----------------------------------
--
-- Zone: Yuhtunga_Jungle
--
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
require("scripts/zones/Yuhtunga_Jungle/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)		
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(116.825,6.613,100,140);
	end	
	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 1 and player:hasItem(1125)) then	
		colors = player:getVar("ICanHearARainbow");
		r = (tonumber(colors) % 2 >= 1);
		b = (tonumber(colors) % 32 >= 16);	
		cs = 0x000b;	
		if (r == false) then	
			player:setVar("ICanHearARainbow_Weather",4);
			player:setVar("ICanHearARainbow",colors+1);
			elseif (b == false) then
			player:setVar("ICanHearARainbow_Weather",6);
			player:setVar("ICanHearARainbow",colors+16);
			else
			cs = -1;
		end	
	end		
	return cs;		
end;			

-----------------------------------			
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)		
end;		

-----------------------------------		
-- onEventUpdate		
-----------------------------------		

function onEventUpdate(player,csid,menuchoice)		
	--print("CSID: ",csid);	
	--print("RESULT: ",menuchoice);	
	if (csid == 0x000b) then	
		weather = player:getVar("ICanHearARainbow_Weather");
		if (player:getVar("ICanHearARainbow") < 127) then
			player:updateEvent(0,0,weather);
			else
			player:updateEvent(0,0,weather,6);
		end	
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish(player,csid,menuchoice)			
	--print("CSID: ",csid);		
	--print("RESULT: ",menuchoice);		
	if (csid == 0x000b) then		
		player:setVar("ICanHearARainbow_Weather",0);	
	end
end;	
