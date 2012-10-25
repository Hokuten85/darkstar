-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Asrahd
--  Type: Imperial Gate Guard
--  @pos 0.011 -1 10.587 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
package.loaded["scripts/globals/besieged"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/besieged");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	merc_rank = getMercenaryRank(player);
	
	if(merc_rank == 0) then
		player:startEvent(0x0277,npc);
	else
		maps = getMapBitmask(player);
		if(getAstralCandescence() == 1) then
			maps = maps + 0x80000000;
		end;
		
		x,y,z,w = getImperialDefenseStats();
		player:startEvent(0x0276,player:getPoint(IS),maps,merc_rank,0,x,y,z,w);
	end;
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if(csid == 0x0276 and option >= 1 and option <= 2049) then
		itemid = getISPItem(option);
		player:updateEvent(0,0,0,canEquip(player,itemid));
	end;
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if(csid == 0x276) then
		if(option == 0 or option == 16 or option == 32 or option == 48) then -- player chose sanction.
			if(option ~= 0) then
				player:delPoint(IS,100);
			end;
			
			player:delStatusEffect(EFFECT_SIGIL);
			player:delStatusEffect(EFFECT_SANCTION);
			player:delStatusEffect(EFFECT_SIGNET);
			duration = getSanctionDuration(player);
			
			if(option == 16 or option == 32) then -- refresh and regen sanction
				tick = 3; 
			else
				tick = 0;
			end;
			
			player:addStatusEffect(EFFECT_SANCTION,option / 16,tick,duration); -- effect size 1 = regen, 2 = refresh, 3 = food.
			player:messageSpecial(SANCTION);
			
		elseif(option % 256 == 17) then -- player bought one of the maps
			id = 1862 + (option - 17) / 256;
			player:addKeyItem(id);
			player:messageSpecial(KEYITEM_OBTAINED,id);
			player:delPoint(IS,1000);
		elseif(option <= 2049) then -- player bought item
			item, price = getISPItem(option)
			if(player:getFreeSlotCount(0) > 0) then
				player:delPoint(IS,price);
				player:addItem(item);
				player:messageSpecial(ITEM_OBTAINED,item);
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
			end;
		end;
	end;
	
end;