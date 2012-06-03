---------------------------------------------
--  Magic Fruit
--
--  Description: Restores HP for the target party member.
--  Type: Magical (Light)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	m = math.random(1,3)+5;
	base = (mob:getMaxHP()/100)* m;
	if(mob:getHP()+base > mob:getMaxHP()) then
		base = mob:getMaxHP() - mob:getHP(); --cap it
	end
	skill:setMsg(MSG_SELF_HEAL);
	mob:addHP(base);
	return base;

end;