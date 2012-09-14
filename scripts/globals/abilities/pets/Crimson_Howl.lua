---------------------------------------------------
-- Crimson Howl
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill, summoner)
	duration = 30 + summoner:getMod(MOD_SUMMONING);
	target:addStatusEffect(EFFECT_WARCRY,9,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_WARCRY;
end