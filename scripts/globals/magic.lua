require("scripts/globals/magicburst")
require("scripts/globals/status")

     DIVINE_MAGIC_SKILL = 32;
    HEALING_MAGIC_SKILL = 33;
  ENHANCING_MAGIC_SKILL = 34;
 ENFEEBLING_MAGIC_SKILL = 35;
  ELEMENTAL_MAGIC_SKILL = 36;
       DARK_MAGIC_SKILL = 37;
         NINJUTSU_SKILL = 39;
          SINGING_SKILL = 40; 


-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- V - The base damage of the spell
-- M - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually MOD_INT , except for things like Banish which is MOD_MND)
-- hasMultipleTargetReduction - true ifdamage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
SOFT_CAP = 60; --guesstimated
HARD_CAP = 120; --guesstimated

function calculateMagicDamage(V,M,player,spell,target,skilltype,atttype,hasMultipleTargetReduction)
    
    dint = player:getStat(atttype) - target:getStat(atttype);
    dmg = V;
    
    if(dint<=0) then --ifdINT penalises, it's always M=1
        dmg = dmg + dint;
    elseif(dint > 0 and dint <= SOFT_CAP) then --The standard calc, most spells hit this
        dmg = dmg + (dint*M);
    elseif(dint > 0 and dint > SOFT_CAP and dint < HARD_CAP) then --After SOFT_CAP, INT is only half effective
        dmg = dmg + SOFT_CAP*M + ((dint-SOFT_CAP)*M)/2;
    elseif(dint > 0 and dint > SOFT_CAP and dint >= HARD_CAP) then --After HARD_CAP, INT has no effect.
        dmg = dmg + HARD_CAP*M;
    end
    
    --TODO: Handle multiple target reduction (no LUA methods exist for this yet)
    
    return dmg;
    
end

function doEnspell(caster,target,spell,effect)
    if(target:getStatusEffect(EFFECT_BLOOD_WEAPON) ~= nil) then
        --no effect!
        if(spell ~= nil) then
            spell:setMsg(75);
        end
        return;
    end
    target:delStatusEffect(EFFECT_ENFIRE);
    target:delStatusEffect(EFFECT_ENSTONE);
    target:delStatusEffect(EFFECT_ENWATER);
    target:delStatusEffect(EFFECT_ENAERO);
    target:delStatusEffect(EFFECT_ENBLIZZARD);
    target:delStatusEffect(EFFECT_ENTHUNDER);
    target:delStatusEffect(EFFECT_ENFIRE_II);
    target:delStatusEffect(EFFECT_ENSTONE_II);
    target:delStatusEffect(EFFECT_ENWATER_II);
    target:delStatusEffect(EFFECT_ENAERO_II);
    target:delStatusEffect(EFFECT_ENBLIZZARD_II);
    target:delStatusEffect(EFFECT_ENTHUNDER_II);
    target:delStatusEffect(EFFECT_ENLIGHT);
    target:delStatusEffect(EFFECT_ENDARK);
    
    if(effect==EFFECT_BLOOD_WEAPON)then
        target:addStatusEffect(EFFECT_BLOOD_WEAPON,1,0,30);
        return;
    end
    
    duration = 180;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end
    --calculate potency
    magicskill = target:getSkillLevel(ENHANCING_MAGIC_SKILL) + target:getMod(79 + ENHANCING_MAGIC_SKILL); 

    potency = 3 + ((6*magicskill)/100);
    if(magicskill>200) then
        potency = 5 + ((5*magicskill)/100);
    end
    target:addStatusEffect(effect,potency,0,duration);
    spell:setMsg(230);
end

-----------------------------------
--    Author: Tenjou
--     Cure Potency Check
--     List of gear which enhances Cure Potency.
-----------------------------------
function curePotency(caster)
c = 0;
main = caster:getEquipID(1);
sub = caster:getEquipID(2);
range = caster:getEquipID(3);
ammo = caster:getEquipID(4);
head = caster:getEquipID(5);
body = caster:getEquipID(6);
hand = caster:getEquipID(7);
leg = caster:getEquipID(8);
foot = caster:getEquipID(9);
neck = caster:getEquipID(10);
waist = caster:getEquipID(11);
ear1 = caster:getEquipID(12);
ear2 = caster:getEquipID(13);
ring1 = caster:getEquipID(14);
ring2 = caster:getEquipID(15);
back = caster:getEquipID(16);

if (main == 0x443a or sub == 0x443a) then
    c = (c+0.01);
    --print("Cure enhanced by Dia Wand.");
end
if (main == 0x442e or sub == 0x442e) then
    c = (c+0.05);
    --print("Cure enhanced by Asklepios.");
end
if (main == 0x4999 or sub == 0x4999) then
    c = (c+0.10);
    --print("Cure enhanced by Templar Mace.");
end
if (main == 17557 or main == 17558 or main == 0x42d4 or main == 0x429b) then
    c = (c+0.10);
    --print("Cure enhanced by Staff.");
end
if (body == 0x313d) then
    c = (c+0.10);
    --print("Cure enhanced by Noble's Tunic.");
elseif (body == 0x35ce) then
    c = (c+0.12);
    --print("Cure enhanced by Aristocrat's Coat.");
end
if (ear1 == 0x39d7 or ear2 == 0x39d7) then
    c = (c+0.05);
    --print("Cure enhanced by Hospitaler Earring.");
end
if (ear1 == 0x3e82 or ear2 == 0x3e82) then
    c = (c+0.05);
    --print("Cure enhanced by Roundel Earring.");
end
if (ring1 == 0x33e8 or ring2 == 0x33e8) then
    hp = caster:getHP();
    maxhp = caster:getMaxHP();
    ratio = (hp/maxhp);
    tp = caster:getTP();
    if (ratio <= 0.75 and tp <= 100) then
        c = (c+0.10);
        --print("Cure enhanced by Medicine Ring.");
    end
end
--print("Total enhancement: " .. (c+1));
return c;
 end;

-----------------------------------
--    Author: ReaperX
--     Returns the staff bonus for the caster and spell. 
-----------------------------------

-- NQ/HQ staves that strengthen/weaken the index element
strong_NQ = { 0x4489, 0x448f, 0x4493, 0x448d, 0x448b, 0x4491, 0x4495, 0x4497 }
strong_HQ = { 0x448A, 0x4490, 0x4494, 0x448e, 0x448c, 0x4492, 0x4496, 0x4498 }

weak_NQ = { 0x4493, 0x448d, 0x4491, 0x448b, 0x4489, 0x448f, 0x4497, 0x4495 }
weak_HQ = { 0x4494, 0x448e, 0x4492, 0x448c, 0x448A, 0x4490, 0x4498, 0x4496 }

function StaffBonus(caster,spell)
    
    staff = caster:getEquipID(0);
    ele   = spell:getElement();

    if(staff == strong_NQ[ele]) then 
        staff = 1.1;
        --print("Element enhanced by staff.");
    elseif(staff == strong_HQ[ele]) then
        staff = 1.15;
        --print("Element enhanced by HQ staff.");
    elseif(staff == weak_NQ[ele]) then
        staff = 0.9;
        --print("Element weakened by staff.");
    elseif(staff == weak_HQ[ele]) then
        staff = 0.85;
        --print("Element weakened by HQ staff.");
    else
        staff = 1.0;
    end

    return staff;

end;

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
-- 
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.

function applyResistance(player,spell,target,diff,skill,staff)
   
    resist = 1.0;
    magicaccbonus = 0;
	--get the base acc (just skill plus magic acc mod)
	magicacc = player:getSkillLevel(skill) + player:getMod(79 + skill) + player:getMod(MOD_MACC);
	
	--difference in int/mnd 
	if diff > 10 then
		magicacc = magicacc + 10 + (diff - 10)/2;
	else
		magicacc = magicacc + diff;
	end
	--add acc for ele/dark seal
    if(player:getStatusEffect(EFFECT_ELEMENTAL_SEAL) ~= nil) then
        magicaccbonus = magicaccbonus + 256;
    elseif(player:getStatusEffect(EFFECT_DARK_SEAL) ~= nil and skill == DARK_MAGIC_SKILL) then
        magicaccbonus = magicaccbonus + 256;
    end
	--add acc for staves
	staffBonus = StaffBonus(player, spell);
	magicaccbonus = magicaccbonus + (staffBonus-1) * 200;
	
    local skillchainTier, skillchainCount = FormMagicBurst(spell, target);
    --add acc for skillchains
    if(skillchainTier > 0) then
		magicaccbonus = magicaccbonus + 25;
    end
	
	resistMod = {MOD_FIRERES, MOD_EARTHRES, MOD_WATERRES, MOD_WINDRES, MOD_ICERES, MOD_THUNDERRES, MOD_LIGHTRES, MOD_DARKRES};
	defenseMod = {MOD_FIREDEF, MOD_EARTHDEF, MOD_WATERDEF, MOD_WINDDEF, MOD_ICEDEF, MOD_THUNDERDEF, MOD_LIGHTDEF, MOD_DARKDEF};
	--base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
	magiceva = target:getMod(MOD_MEVA) + target:getMod(resistMod[spell:getElement()]) + target:getMod(defenseMod[spell:getElement()])/10;
	
	--get the difference of acc and eva, scale with level (3.33 at 10 to 0.44 at 75)
	multiplier = 0;
	if player:getMainLvl() < 40 then
		multiplier = 100 / 120;
	else
		multiplier = 100 / (player:getMainLvl() * 3);
	end;
	p = (magicacc * multiplier) - (magiceva * 0.45);
	magicaccbonus = magicaccbonus / 2;
	--add magicacc bonus
	p = p + magicaccbonus;
	print(magicacc);
	print(magiceva);
	print(magicaccbonus);

	
	--double any acc over 50 if it's over 50
	if p > 5 then
		p = 5 + (p - 5) * 2;
	end
	
	--add a flat bonus that won't get doubled in the previous step
	p = p + 45;

	--add a scaling bonus or penalty based on difference of targets level from caster
	leveldiff = player:getMainLvl() - target:getMainLvl();
	if leveldiff < 0 then
		p = p - (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	else
		p = p + (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	end
	--cap accuracy
    if(p > 95) then
        p = 95;
    elseif(p < 5) then
        p = 5;
    end

	p = p / 100;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    half = (1 - p);
    quart = ((1 - p)^2);
    eighth = ((1 - p)^3);
    sixteenth = ((1 - p)^4);
    print("HALF:",half);
    print("QUART:",quart);
    print("EIGHTH:",eighth);
    print("SIXTEENTH:",sixteenth);

    resvar = math.random();
    
    -- Determine final resist based on which thresholds have been crossed.
    if(resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif(resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif(resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif(resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("1.0");
    end
    
    return resist;
    
end;

-----------------------------------
--    Author: Tenjou
--     SKILL LEVEL CALCULATOR
--     Returns a skill level based on level and rating.
--
--    See the translation of aushacho's work by Themanii:
--    http://home.comcast.net/~themanii/skill.html
--
--    The arguments are skill rank (numerical), and level.  1 is A+, 2 is A-, and so on.
-----------------------------------

function getSkillLvl(rank,level)
    
    skill = 0; --Failsafe
    
    if(level <= 50) then --Levels 1-50
        if(rank == 1 or rank == 2) then --A-Rated Skill
            skill = (((level-1)*3)+6);
        elseif(rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
            skill = (((level-1)*2.9)+5);
        elseif(rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
            skill = (((level-1)*2.8)+5);
        elseif(rank == 9) then --D-Rated Skill
            skill = (((level-1)*2.7)+4);
        elseif(rank == 10) then --E-Rated Skill
            skill = (((level-1)*2.5)+4);
        elseif(rank == 11) then --F-Rated Skill
            skill = (((level-1)*2.3)+4);
        end
    elseif(level > 50 and level <= 60) then --Levels 51-60
        if(rank == 1 or rank == 2) then --A-Rated Skill
            skill = (((level-50)*5)+153);
        elseif(rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
            skill = (((level-50)*4.9)+147);
        elseif(rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
            skill = (((level-50)*4.8)+142);
        elseif(rank == 9) then --D-Rated Skill
            skill = (((level-50)*4.7)+136);
        elseif(rank == 10) then --E-Rated Skill
            skill = (((level-50)*4.5)+126);
        elseif(rank == 11) then --F-Rated Skill
            skill = (((level-50)*4.3)+116);
        end
    elseif(level > 60 and level <= 70) then --Levels 61-70
        if(rank == 1) then --A+ Rated Skill
            skill = (((level-60)*4.85)+203);
        elseif(rank == 2) then --A- Rated Skill
            skill = (((level-60)*4.10)+203);
        elseif(rank == 3) then --B+ Rated Skill
            skill = (((level-60)*3.70)+196);
        elseif(rank == 4) then --B Rated Skill
            skill = (((level-60)*3.23)+196);
        elseif(rank == 5) then --B- Rated Skill
            skill = (((level-60)*2.70)+196);
        elseif(rank == 6) then --C+ Rated Skill
            skill = (((level-60)*2.50)+190);
        elseif(rank == 7) then --C Rated Skill
            skill = (((level-60)*2.25)+190);
        elseif(rank == 8) then --C- Rated Skill
            skill = (((level-60)*2.00)+190);
        elseif(rank == 9) then --D Rated Skill
            skill = (((level-60)*1.85)+183);
        elseif(rank == 10) then --E Rated Skill
            skill = (((level-60)*1.95)+171);
        elseif(rank == 11) then --F Rated Skill
            skill = (((level-60)*2.05)+159);
        end
    else --Level 71 and above
        if(rank == 1) then --A+ Rated Skill
            skill = (((level-70)*5)+251);
        elseif(rank == 2) then --A- Rated Skill
            skill = (((level-70)*5)+244);
        elseif(rank == 3) then --B+ Rated Skill
            skill = (((level-70)*3.70)+233);
        elseif(rank == 4) then --B Rated Skill
            skill = (((level-70)*3.23)+228);
        elseif(rank == 5) then --B- Rated Skill
            skill = (((level-70)*2.70)+223);
        elseif(rank == 6) then --C+ Rated Skill
            skill = (((level-70)*3)+215);
        elseif(rank == 7) then --C Rated Skill
            skill = (((level-70)*2.6)+212);
        elseif(rank == 8) then --C- Rated Skill
            skill = (((level-70)*2.00)+210);
        elseif(rank == 9) then --D Rated Skill
            skill = (((level-70)*1.85)+201);
        elseif(rank == 10) then --E Rated Skill
            skill = (((level-70)*1.95)+190);
        elseif(rank == 11) then --F Rated Skill
            skill = (((level-70)*2)+179);
        end    
    end
    
    return skill;
    
 end;
 
 function finalMagicAdjustments(caster,target,spell,dmg)
    if(dmg<0) then
        dmg = 0;
    end
    
    dmg = dmg - target:getMod(MOD_PHALANX);
    if(dmg<0) then
        dmg = 0;
    end
    
    --handling stoneskin
    skin = target:getMod(MOD_STONESKIN);
    if(skin>0) then
        if(skin >= dmg) then --absorb all damage
            target:delMod(MOD_STONESKIN,dmg);
            if(target:getMod(MOD_STONESKIN)==0) then
                target:delStatusEffect(EFFECT_STONESKIN);
            end
            return 0;
        else --absorbs some damage then wear
            target:delMod(MOD_STONESKIN,skin);
            target:delStatusEffect(EFFECT_STONESKIN);
            return dmg - skin;
        end
    end
    
    target:delHP(dmg);
    target:updateEnmityFromDamage(caster,dmg);
    target:addTP(10);
    return dmg;
 end
 
function adjustForTarget(target,dmg)
    --e.g. family % reduction
    return dmg;
end

function calculateMagicBurstAndBonus(caster, spell, target)
    local hand  = caster:getEquipID(7);
    local ear1  = caster:getEquipID(12);
    local ear2  = caster:getEquipID(13);

    local burst = 1.0;
    local burstBonus = 1.0;
    
    local skillchainTier, skillchainCount = FormMagicBurst(spell, target);
    
    if(skillchainTier > 0) then
		if(skillchainCount == 1) then
			burst = 1.3;
		elseif(skillchainCount == 2) then
			burst = 1.35;
		elseif(skillchainCount == 3) then
			 burst = 1.40;
		elseif(skillchainCount == 4) then
			burst = 1.45;
		elseif(skillchainCount == 5) then
			burst = 1.50;
		else
			-- Something strange is going on if this occurs.
			burst = 1.0; 
		end
		
		-- Get burst bonus from gear/spell bonus

        -- Sorcerer's Gloves
        if(hand == 15105 or hand == 14912) then
            burstBonus = burstBonus + 0.05;
        end
        
        if(ear1 == 15962 or ear2 == 15962) then
            burstBonus = burstBonus + 0.05;
        end
        
        -- TODO: This should be getting the spell ID, and checking
        --       if it is an Ancient Magic II spell.  Add 0.03
        --       to burstBonus for each merit the caster has for 
        --       the given spell.
        
        -- AM 2 get magic burst bonuses
        --id = spell:getID(); 
        --if(id == 207 or id == 209 or id == 211 or id == 213 or id == 215 or id == 205) then
        --    if(AM2 Merit 1) then
        --        burstBonus = burstBonus + 0.03;
        --    elseif(AM2 Merit 2) then
        --        burstBonus += 0.06;
        --    elseif(AM2 Merit 3) then
        --        burstBonus += 0.09;
        --    elseif(AM2 Merit 4) then
        --        burstBonus += 0.12;
        --    end
        --end -- if AM2+
    end

    return burst, burstBonus;
end

-- USED FOR DAMAGING MAGICAL SPELLS. Stages 4,5,6,7,8 of Calculating Magic Damage on Wiki
function addBonuses(caster, spell, target, dmg)
    --TODO:
    --Day of the week / Weather bonus
    mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF)) ;
    staff = StaffBonus(caster, spell);
    burst, burstBonus = calculateMagicBurstAndBonus(caster, spell, target);
    
    if(burst > 1.0) then
		spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
	end
	
	--printf("bonuses: %f, %f, %f, %f, %f", dmg, burst, burstBonus, mab, staff);

    return (dmg * burst * burstBonus * mab * staff);
end

---------------------------------------------------------------------
--    Author: ReaperX
--     Elemental Debuff Potency functions
---------------------------------------------------------------------

function getElementalDebuffDOT(INT)
    if (INT<= 39) then
        DOT = 1;
    elseif (INT <= 69) then
        DOT = 2;
    elseif (INT <= 99) then
        DOT = 3;
    elseif (INT <= 149) then
        DOT = 4;
    else 
        DOT = 5;
    end;
    return DOT;
end;

function getElementalDebuffStatDownFromDOT(dot)
    if (dot == 1) then
        stat_down = 5;
    elseif (dot == 2) then
        stat_down = 7;
    elseif (dot == 3) then
        stat_down = 9;
    elseif (dot == 4) then
        stat_down = 11;
    else
        stat_down = 13;
    end;
    return stat_down;
end;

function getHelixDuration(caster, target, spell)
    return math.random(45, 90);
end;

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
	-- Process resitances
	staff = StaffBonus(caster, spell);
	print("staff=" .. staff);
	dCHR = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));
	print("dCHR=" .. dCHR);
	resm = applyResistance(caster, spell, target, dCHR, SINGING_SKILL, staff);
	print("rsem=" .. resm);
	
	if(resm < 0.5) then
		print("resm resist");
		spell:setMsg(85);
		return EFFECT_THRENODY;
	end

	-- Remove previous Threnody
	target:delStatusEffect(EFFECT_THRENODY);

	-- TODO: Check equipment bounses, increase duration/power
	power = basePower;
	duration = baseDuration;

	-- Set spell message and apply status effect
	target:addStatusEffect(EFFECT_THRENODY, power, 0, duration, 0, modifier, 0);

	return EFFECT_THRENODY;
end;

function handleNinjutsuDebuff(caster, target, spell, basePower, baseDuration, modifier)
	-- Remove previous
	target:delStatusEffect(EFFECT_NINJUTSU_ELE_DEBUFF);
	-- Add new
	target:addStatusEffect(EFFECT_NINJUTSU_ELE_DEBUFF, basePower, 0, baseDuration, 0, modifier, 0);
	
	return EFFECT_NINJUTSU_ELE_DEBUFF;
end;
