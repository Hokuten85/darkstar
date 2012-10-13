﻿/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../common/socket.h"
#include "../common/showmsg.h"
#include "../common/sql.h"
#include "../common/strlib.h"
#include "../common/timer.h"
#include "../common/utils.h"

#include <math.h>
#include <stdio.h>
#include <string.h>

#include "lua/luautils.h"

#include "alliance.h"
#include "packets/automaton_update.h"
#include "packets/char_abilities.h"
#include "packets/char_appearance.h"
#include "packets/char_equip.h"
#include "packets/char_jobs.h"
#include "packets/char_health.h"
#include "packets/char_skills.h"
#include "packets/char_stats.h"
#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/inventory_item.h"
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_modify.h"
#include "packets/key_items.h"
#include "packets/linkshell_equip.h"
#include "packets/menu_merit.h"
#include "packets/message_basic.h"
#include "packets/message_debug.h"
#include "packets/message_standard.h"
#include "packets/quest_mission_log.h"
#include "packets/conquest_map.h"

#include "ability.h"
#include "battleutils.h"
#include "charutils.h"
#include "grades.h"
#include "itemutils.h"
#include "petentity.h"
#include "petutils.h"
#include "map.h"
#include "mobentity.h"
#include "trait.h"
#include "weapon_skill.h"
#include "zoneutils.h"
#include "conquest_system.h"

/************************************************************************
*																		*
*  Таблицы получаемого опыта											*
*																		*
************************************************************************/

uint16 g_ExpTable[50][20];
uint16 g_ExpPerLevel[100];

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

namespace charutils
{

/************************************************************************
*																		*
*  Расчет характеристик персонажей										*
*																		*
************************************************************************/

void CalculateStats(CCharEntity* PChar)
{
	// Объявление переменных, нужных для рассчета.

	float raceStat  = 0;			// конечное число HP для уровня на основе расы.
	float jobStat   = 0;			// конечное число HP для уровня на основе первичной профессии.
	float sJobStat  = 0;			// коенчное число HP для уровня на основе вторичной профессии.
	int32 bonusStat = 0;			// бонусное число HP которое добавляется при соблюдении некоторых условий.

	int32 baseValueColumn   = 0;	// номер колонки с базовым количеством HP
	int32 scaleTo60Column   = 1;	// номер колонки с модификатором до 60 уровня
	int32 scaleOver30Column = 2;	// номер колонки с модификатором после 30 уровня
	int32 scaleOver60Column = 3;	// номер колонки с модификатором после 60 уровня
	int32 scaleOver75Column = 4;	// номер колонки с модификатором после 75 уровня
	int32 scaleOver60 = 2;			// номер колонки с модификатором для расчета MP после 60 уровня
	int32 scaleOver75 = 3;			// номер колонки с модификатором для расчета Статов после 75-го уровня
	
	uint8 grade;
	
	uint8 mlvl = PChar->GetMLevel();
	uint8 slvl = PChar->GetSLevel();
	JOBTYPE mjob = PChar->GetMJob(); 
	JOBTYPE sjob = PChar->GetSJob();

	uint8 race = 0;					//Human
	
	switch (PChar->look.race)
	{
		case 3:
		case 4: race = 1; break;	//Elvaan 
		case 5:
		case 6: race = 2; break;	//Tarutaru
		case 7: race = 3; break;	//Mithra
		case 8: race = 4; break;	//Galka
	}
	
	// Расчет прироста HP от main job

	int32 mainLevelOver30 = dsp_cap(mlvl - 30, 0, 30);			// Расчет условия +1HP каждый лвл после 30 уровня
	int32 mainLevelUpTo60 = (mlvl < 60 ? mlvl - 1 : 59 );		// Первый режим рассчета до 60 уровня (Используется так же и для MP)
	int32 mainLevelOver60To75 = dsp_cap(mlvl - 60, 0, 15);		// Второй режим расчета после 60 уровня
	int32 mainLevelOver75 = (mlvl < 75 ? 0 : mlvl - 75);			// Третий режим расчета после 75 уровня

	//Расчет бонусного количества HP
	
	int32 mainLevelOver10 = (mlvl < 10 ? 0 : mlvl - 10);			// +2HP на каждом уровне после 10
	int32 mainLevelOver50andUnder60 = dsp_cap(mlvl - 50, 0, 10);	// +2HP на каждом уровне в промежутке от 50 до 60 уровня
	int32 mainLevelOver60 = (mlvl < 60 ? 0 : mlvl - 60);

	// Расчет прироста HP от дополнительной профессии

	int32 subLevelOver10 = dsp_cap(slvl - 10, 0, 20);				// +1HP на каждый уровень после 10 (/2)
	int32 subLevelOver30 = (slvl < 30 ? 0 : slvl - 30);				// +1HP на каждый уровень после 30

	// Расчет raceStat jobStat bonusStat sJobStat
	// Расчет по расе

	grade = grade::GetRaceGrades(race,0);
 
	raceStat = grade::GetHPScale(grade,baseValueColumn) + 
		(grade::GetHPScale(grade,scaleTo60Column) * mainLevelUpTo60) + 
		(grade::GetHPScale(grade,scaleOver30Column) * mainLevelOver30) + 
		(grade::GetHPScale(grade,scaleOver60Column) * mainLevelOver60To75) + 
		(grade::GetHPScale(grade,scaleOver75Column) * mainLevelOver75);

	// raceStat = (int32)(statScale[grade][baseValueColumn] + statScale[grade][scaleTo60Column] * (mlvl - 1));

	// Расчет по main job
	grade = grade::GetJobGrade(mjob,0);
	
	jobStat = grade::GetHPScale(grade,baseValueColumn) + 
		(grade::GetHPScale(grade,scaleTo60Column) * mainLevelUpTo60) +
		(grade::GetHPScale(grade,scaleOver30Column) * mainLevelOver30) +
		(grade::GetHPScale(grade,scaleOver60Column) * mainLevelOver60To75) +
		(grade::GetHPScale(grade,scaleOver75Column) * mainLevelOver75);

	// Расчет бонусных HP
	bonusStat = (mainLevelOver10 + mainLevelOver50andUnder60) * 2;

	// Расчет по support job
	if (slvl > 0)
	{
		grade = grade::GetJobGrade(sjob,0);

		sJobStat = grade::GetHPScale(grade,baseValueColumn) + 
			(grade::GetHPScale(grade,scaleTo60Column) * (slvl - 1)) +
			(grade::GetHPScale(grade,scaleOver30Column) * subLevelOver30) +
			subLevelOver30 + subLevelOver10;
		sJobStat = sJobStat / 2;
	}
	
	PChar->health.maxhp = (int16)(raceStat + jobStat + bonusStat + sJobStat);
	
	//Начало расчера MP

	raceStat = 0;
	jobStat  = 0;
	sJobStat = 0;
	
	// Расчет MP расе.
	grade = grade::GetRaceGrades(race,1);

	//Если у main job нет МП рейтинга, расчитиваем расовый бонус на основе уровня subjob уровня(при условии, что у него есть МП рейтинг)
	if (grade::GetJobGrade(mjob,1) == 0)
	{
		if (grade::GetJobGrade(sjob,1) != 0 && slvl > 0)					// В этом выражении ошибка
		{
			raceStat = (grade::GetMPScale(grade,0) + grade::GetMPScale(grade,scaleTo60Column) * (slvl - 1)) / 2; 	// Вот здесь ошибка
		}
	}else{
		//Расчет нормального расового бонуса
		raceStat = grade::GetMPScale(grade,0) +
			grade::GetMPScale(grade,scaleTo60Column) * mainLevelUpTo60 +
			grade::GetMPScale(grade,scaleOver60) * mainLevelOver60;
	}

	//Для главной профессии
	grade = grade::GetJobGrade(mjob,1);
	if (grade > 0)
	{
		jobStat = grade::GetMPScale(grade,0) +
			grade::GetMPScale(grade,scaleTo60Column) * mainLevelUpTo60 +
			grade::GetMPScale(grade,scaleOver60) * mainLevelOver60;
	}

	//Для дополнительной профессии
	if (slvl > 0)
	{
		grade = grade::GetJobGrade(sjob,1);
		sJobStat = (grade::GetMPScale(grade,0) + grade::GetMPScale(grade,scaleTo60Column) * (slvl - 1)) / 2;
	}

	PChar->health.maxmp = (int16)(raceStat + jobStat + sJobStat); // результат расчета MP

	//add in evasion from skill
	int16 evaskill = PChar->GetSkill(SKILL_EVA);

	int16 eva = evaskill;
	if(evaskill>200){ //Evasion skill is 0.9 evasion post-200
		eva = 200 + (evaskill-200)*0.9;
	}
	PChar->setModifier(MOD_EVA,eva);

	//Начало расчета характеристик
	
	uint8 counter = 0;
	
	for (uint8 StatIndex = 2; StatIndex <=8; ++StatIndex)
	{
		// расчет по расе
		grade = grade::GetRaceGrades(race,StatIndex);
		raceStat = grade::GetStatScale(grade,0) + grade::GetStatScale(grade,scaleTo60Column) * mainLevelUpTo60;

		if (mainLevelOver60 > 0)
		{
			raceStat += grade::GetStatScale(grade,scaleOver60) * mainLevelOver60;
			
			if (mainLevelOver75 > 0)
			{
				raceStat += grade::GetStatScale(grade,scaleOver75) * mainLevelOver75  - (mlvl >= 75 ? 0.01f : 0);
			}
		}

		// расчет по профессии
		grade = grade::GetJobGrade(mjob,StatIndex);
		jobStat = grade::GetStatScale(grade,0) + grade::GetStatScale(grade,scaleTo60Column) * mainLevelUpTo60;

		if (mainLevelOver60 > 0)
		{
			jobStat += grade::GetStatScale(grade,scaleOver60) * mainLevelOver60;
			
			if (mainLevelOver75 > 0)
			{
				jobStat += grade::GetStatScale(grade,scaleOver75) * mainLevelOver75  - (mlvl >= 75 ? 0.01f : 0);
			}
		}

		// расчет по дополнительной профессии
		if (slvl > 0)
		{
			grade = grade::GetJobGrade(sjob,StatIndex);
			sJobStat = (grade::GetStatScale(grade,0) + grade::GetStatScale(grade,scaleTo60Column) * (slvl - 1)) / 2;
		}else{
			sJobStat = 0;
		}

		// Вывод значения
		WBUFW(&PChar->stats,counter) = (uint16)(raceStat + jobStat + sJobStat);
		counter += 2;
	}
}

/************************************************************************
*																		*
*  Предварительная версия загрузки персонажа. Функция будет				*
*  оптимизирована после определения всех необходимых данных и таблиц	*
*																		*
************************************************************************/

void LoadChar(CCharEntity* PChar)
{

	const int8* fmtQuery = "SELECT charname, pos_zone, pos_prevzone, pos_rot, pos_x, pos_y, pos_z, boundary, \
								   home_zone, home_rot, home_x, home_y, home_z, nation, quests, keyitems, \
								   spells, titles, zones, inventory, safe, storage, locker, satchel, sack, \
								   missions, rankSandoria, rankBastok, rankWindurst, rankPoints, \
								   fameSandoria, fameBastok, fameWindurst, fameNorg \
							FROM chars \
							WHERE charid = %u;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
        PChar->targid = 0x400;
		PChar->SetName(Sql_GetData(SqlHandle,0));

        PChar->loc.destination = (uint8)Sql_GetIntData(SqlHandle,1);
		PChar->loc.prevzone    = (uint8)Sql_GetIntData(SqlHandle,2);
		PChar->loc.p.rotation  = (uint8)Sql_GetIntData(SqlHandle,3);
		PChar->loc.p.x = Sql_GetFloatData(SqlHandle,4);
		PChar->loc.p.y = Sql_GetFloatData(SqlHandle,5);
		PChar->loc.p.z = Sql_GetFloatData(SqlHandle,6);
		PChar->loc.boundary = (uint16)Sql_GetIntData(SqlHandle,7);

        PChar->profile.home_point.destination = (uint8)Sql_GetIntData(SqlHandle,8);
		PChar->profile.home_point.p.rotation  = (uint8)Sql_GetIntData(SqlHandle,9);
		PChar->profile.home_point.p.x = Sql_GetFloatData(SqlHandle,10);
		PChar->profile.home_point.p.y = Sql_GetFloatData(SqlHandle,11);
		PChar->profile.home_point.p.z = Sql_GetFloatData(SqlHandle,12);

		PChar->profile.nation  = (uint8)Sql_GetIntData(SqlHandle,13);

		size_t length = 0;
		int8* quests = NULL;
		Sql_GetData(SqlHandle,14,&quests,&length);
		memcpy(PChar->m_questLog, quests, (length > sizeof(PChar->m_questLog) ? sizeof(PChar->m_questLog) : length));

		length = 0;
		int8* missions = NULL;
		Sql_GetData(SqlHandle,25,&missions,&length);
		memcpy(PChar->m_missionLog, missions, (length > sizeof(PChar->m_missionLog) ? sizeof(PChar->m_missionLog) : length));

		length = 0;
		int8* keyitems = NULL;
		Sql_GetData(SqlHandle,15,&keyitems,&length);
		memcpy(PChar->keys.keysList, keyitems, (length > sizeof(PChar->keys) ? sizeof(PChar->keys) : length));

		length = 0;
		int8* spells = NULL;
		Sql_GetData(SqlHandle,16,&spells,&length);
		memcpy(PChar->m_SpellList, spells, (length > sizeof(PChar->m_SpellList) ? sizeof(PChar->m_SpellList) : length));

        length = 0;
		int8* titles = NULL;
		Sql_GetData(SqlHandle,17,&titles,&length);
		memcpy(PChar->m_TitleList, titles, (length > sizeof(PChar->m_TitleList) ? sizeof(PChar->m_TitleList) : length));

		length = 0;
		int8* zones = NULL;
		Sql_GetData(SqlHandle,18,&zones,&length);
		memcpy(PChar->m_ZonesList, zones, (length > sizeof(PChar->m_ZonesList) ? sizeof(PChar->m_ZonesList) : length));

		PChar->getStorage(LOC_INVENTORY)->SetSize((uint8)Sql_GetIntData(SqlHandle,19)); 
		PChar->getStorage(LOC_MOGSAFE)->SetSize((uint8)Sql_GetIntData(SqlHandle,20)); 
		PChar->getStorage(LOC_STORAGE)->SetSize((uint8)Sql_GetIntData(SqlHandle,21));
		PChar->getStorage(LOC_TEMPITEMS)->SetSize(18); 
		PChar->getStorage(LOC_MOGLOCKER)->SetSize((uint8)Sql_GetIntData(SqlHandle,22)); 
		PChar->getStorage(LOC_MOGSATCHEL)->SetSize((uint8)Sql_GetIntData(SqlHandle,23)); 
		PChar->getStorage(LOC_MOGSACK)->SetSize((uint8)Sql_GetIntData(SqlHandle,24));

        PChar->profile.rank[0] = (uint8)Sql_GetIntData(SqlHandle,26);
		PChar->profile.rank[1] = (uint8)Sql_GetIntData(SqlHandle,27);
		PChar->profile.rank[2] = (uint8)Sql_GetIntData(SqlHandle,28);
		
		PChar->profile.rankpoints = Sql_GetUIntData(SqlHandle,29);

		PChar->profile.fame[0] =  (uint16)Sql_GetIntData(SqlHandle,30);  //Sandoria
		PChar->profile.fame[1] =  (uint16)Sql_GetIntData(SqlHandle,31);  //Bastok
		PChar->profile.fame[2] =  (uint16)Sql_GetIntData(SqlHandle,32);  //Windurst
		PChar->profile.fame[3] =  (uint16)Sql_GetIntData(SqlHandle,33);  //Norg
	}

	fmtQuery = "SELECT face, race, size, head, body, hands, legs, feet, main, sub, ranged \
				FROM char_look \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->look.face = (uint8)Sql_GetIntData(SqlHandle,0);
		PChar->look.race = (uint8)Sql_GetIntData(SqlHandle,1);
		PChar->look.size = (uint8)Sql_GetIntData(SqlHandle,2);

		PChar->look.head 	= (uint16)Sql_GetIntData(SqlHandle,3);
		PChar->look.body 	= (uint16)Sql_GetIntData(SqlHandle,4);
		PChar->look.hands	= (uint16)Sql_GetIntData(SqlHandle,5);
		PChar->look.legs 	= (uint16)Sql_GetIntData(SqlHandle,6);
		PChar->look.feet 	= (uint16)Sql_GetIntData(SqlHandle,7);
		PChar->look.main 	= (uint16)Sql_GetIntData(SqlHandle,8);
		PChar->look.sub		= (uint16)Sql_GetIntData(SqlHandle,9);
		PChar->look.ranged	= (uint16)Sql_GetIntData(SqlHandle,10);
	}

	fmtQuery = "SELECT unlocked, genkai, war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng, sam, nin, drg, smn, blu, cor, pup, dnc, sch \
				FROM char_jobs \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->jobs.unlocked = (uint32)Sql_GetUIntData(SqlHandle,0);
		PChar->jobs.genkai   = (uint8)Sql_GetUIntData(SqlHandle,1);

		PChar->jobs.job[JOB_WAR] = (uint8)Sql_GetIntData(SqlHandle, 2);
		PChar->jobs.job[JOB_MNK] = (uint8)Sql_GetIntData(SqlHandle, 3);
		PChar->jobs.job[JOB_WHM] = (uint8)Sql_GetIntData(SqlHandle, 4);
		PChar->jobs.job[JOB_BLM] = (uint8)Sql_GetIntData(SqlHandle, 5);
		PChar->jobs.job[JOB_RDM] = (uint8)Sql_GetIntData(SqlHandle, 6);
		PChar->jobs.job[JOB_THF] = (uint8)Sql_GetIntData(SqlHandle, 7);
		PChar->jobs.job[JOB_PLD] = (uint8)Sql_GetIntData(SqlHandle, 8);
		PChar->jobs.job[JOB_DRK] = (uint8)Sql_GetIntData(SqlHandle, 9);
		PChar->jobs.job[JOB_BST] = (uint8)Sql_GetIntData(SqlHandle,10);
		PChar->jobs.job[JOB_BRD] = (uint8)Sql_GetIntData(SqlHandle,11);
		PChar->jobs.job[JOB_RNG] = (uint8)Sql_GetIntData(SqlHandle,12);
		PChar->jobs.job[JOB_SAM] = (uint8)Sql_GetIntData(SqlHandle,13);
		PChar->jobs.job[JOB_NIN] = (uint8)Sql_GetIntData(SqlHandle,14);
		PChar->jobs.job[JOB_DRG] = (uint8)Sql_GetIntData(SqlHandle,15);
		PChar->jobs.job[JOB_SMN] = (uint8)Sql_GetIntData(SqlHandle,16);
		PChar->jobs.job[JOB_BLU] = (uint8)Sql_GetIntData(SqlHandle,17);
		PChar->jobs.job[JOB_COR] = (uint8)Sql_GetIntData(SqlHandle,18);
		PChar->jobs.job[JOB_PUP] = (uint8)Sql_GetIntData(SqlHandle,19);
		PChar->jobs.job[JOB_DNC] = (uint8)Sql_GetIntData(SqlHandle,20);
		PChar->jobs.job[JOB_SCH] = (uint8)Sql_GetIntData(SqlHandle,21);
	}

	fmtQuery = "SELECT war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng, sam, nin, drg, smn, blu, cor, pup, dnc, sch, limits \
				FROM char_exp \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->jobs.exp[JOB_WAR] = (uint16)Sql_GetIntData(SqlHandle, 0);
		PChar->jobs.exp[JOB_MNK] = (uint16)Sql_GetIntData(SqlHandle, 1);
		PChar->jobs.exp[JOB_WHM] = (uint16)Sql_GetIntData(SqlHandle, 2);
		PChar->jobs.exp[JOB_BLM] = (uint16)Sql_GetIntData(SqlHandle, 3);
		PChar->jobs.exp[JOB_RDM] = (uint16)Sql_GetIntData(SqlHandle, 4);
		PChar->jobs.exp[JOB_THF] = (uint16)Sql_GetIntData(SqlHandle, 5);
		PChar->jobs.exp[JOB_PLD] = (uint16)Sql_GetIntData(SqlHandle, 6);
		PChar->jobs.exp[JOB_DRK] = (uint16)Sql_GetIntData(SqlHandle, 7);
		PChar->jobs.exp[JOB_BST] = (uint16)Sql_GetIntData(SqlHandle, 8);
		PChar->jobs.exp[JOB_BRD] = (uint16)Sql_GetIntData(SqlHandle, 9);
		PChar->jobs.exp[JOB_RNG] = (uint16)Sql_GetIntData(SqlHandle,10);
		PChar->jobs.exp[JOB_SAM] = (uint16)Sql_GetIntData(SqlHandle,11);
		PChar->jobs.exp[JOB_NIN] = (uint16)Sql_GetIntData(SqlHandle,12);
		PChar->jobs.exp[JOB_DRG] = (uint16)Sql_GetIntData(SqlHandle,13);
		PChar->jobs.exp[JOB_SMN] = (uint16)Sql_GetIntData(SqlHandle,14);
		PChar->jobs.exp[JOB_BLU] = (uint16)Sql_GetIntData(SqlHandle,15);
		PChar->jobs.exp[JOB_COR] = (uint16)Sql_GetIntData(SqlHandle,16);
		PChar->jobs.exp[JOB_PUP] = (uint16)Sql_GetIntData(SqlHandle,17);
		PChar->jobs.exp[JOB_DNC] = (uint16)Sql_GetIntData(SqlHandle,18);
		PChar->jobs.exp[JOB_SCH] = (uint16)Sql_GetIntData(SqlHandle,19);
	}

	fmtQuery = "SELECT nameflags, mjob, sjob, hp, mp, mhflag, title, bazaar_message, 2h \
				FROM char_stats \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->nameflags.flags = (uint32)Sql_GetUIntData(SqlHandle,0);
        
		PChar->SetMJob(Sql_GetUIntData(SqlHandle,1));
		PChar->SetSJob(Sql_GetUIntData(SqlHandle,2));

		PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
		PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

		PChar->health.hp = Sql_GetIntData(SqlHandle,3);
		PChar->health.mp = Sql_GetIntData(SqlHandle,4);

        PChar->profile.mhflag = (uint8) Sql_GetIntData(SqlHandle,5);
		PChar->profile.title  = (uint16)Sql_GetIntData(SqlHandle,6);

        PChar->bazaar.message.insert(0,Sql_GetData(SqlHandle,7)); 

        // 2H recast time

        CAbility* PAbility = ability::GetTwoHourAbility(PChar->GetMJob());

        uint32 RecastTime = (uint32)Sql_GetUIntData(SqlHandle, 8) + PAbility->getRecastTime() * 1000;

        if (RecastTime > gettick())
        {
            PChar->PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), RecastTime - gettick());
        }
	}

	fmtQuery = "SELECT skillid, value, rank \
				FROM char_skills \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			uint8 SkillID = (uint8)Sql_GetUIntData(SqlHandle,0);
			
			if (SkillID < MAX_SKILLTYPE)
			{
				PChar->RealSkills.skill[SkillID] = (uint16)Sql_GetUIntData(SqlHandle,1);
				if (SkillID >= SKILL_FSH)
				{
					PChar->RealSkills.rank[SkillID] = (uint8)Sql_GetUIntData(SqlHandle,2);
				}
			}
		}
	}

	fmtQuery = "SELECT sandoria_cp, bastok_cp, windurst_cp, sandoria_supply, bastok_supply, windurst_supply \
				FROM char_points \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->RegionPoints[0]   = (uint32)Sql_GetUIntData(SqlHandle, 0);
		PChar->RegionPoints[1]   = (uint32)Sql_GetUIntData(SqlHandle, 1);
		PChar->RegionPoints[2]   = (uint32)Sql_GetUIntData(SqlHandle, 2);
		PChar->nationtp.sandoria = (uint32)Sql_GetUIntData(SqlHandle, 3);
		PChar->nationtp.bastok   = (uint32)Sql_GetUIntData(SqlHandle, 4);
		PChar->nationtp.windurst = (uint32)Sql_GetUIntData(SqlHandle, 5);
	}

	BuildingCharSkillsTable(PChar);
	BuildingCharAbilityTable(PChar);
	BuildingCharTraitsTable(PChar);
	CalculateStats(PChar);

	PChar->animation = (PChar->health.hp == 0 ? ANIMATION_DEATH : ANIMATION_NONE);
}

/************************************************************************
*																		*
*  Загружаем инвентарь персонажа										*
*																		*
************************************************************************/

void LoadInventory(CCharEntity* PChar) 
{
	const int8* Query = 
        "SELECT "
          "itemid," 
          "location," 
          "slot,"
          "quantity,"
          "bazaar,"
          "signature,"
          "currCharges,"
          "lastUseTime,"
          "linkshellid,"
          "color "
        "FROM char_inventory "
        "LEFT JOIN linkshells ON signature = name "
        "WHERE charid = %u";

	int32 ret = Sql_Query(SqlHandle, Query, PChar->id);

	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CItem* PItem = itemutils::GetItem(Sql_GetIntData(SqlHandle,0));

			if (PItem != NULL) 
			{ 
				PItem->setLocationID(Sql_GetUIntData(SqlHandle,1));
				PItem->setSlotID(Sql_GetUIntData(SqlHandle,2));
				PItem->setQuantity(Sql_GetUIntData(SqlHandle,3));
				PItem->setCharPrice(Sql_GetUIntData(SqlHandle,4));

				if (PItem->getCharPrice() != 0)
				{
					PItem->setSubType(ITEM_LOCKED);
				}
				if (PItem->getFlag() & ITEM_FLAG_INSCRIBABLE)
				{
					PItem->setSignature(Sql_GetData(SqlHandle,5));
				}
				if ((PItem->getType() & ITEM_USABLE) && (PItem->getSubType() & ITEM_CHARGED))
				{
					((CItemUsable*)PItem)->setCurrentCharges(Sql_GetUIntData(SqlHandle,6));
					((CItemUsable*)PItem)->setLastUseTime(Sql_GetUIntData(SqlHandle,7));
				}
                if (PItem->getType() & ITEM_LINKSHELL)
                {
                    ((CItemLinkshell*)PItem)->SetLSID(Sql_GetUIntData(SqlHandle,8));
                    ((CItemLinkshell*)PItem)->SetLSColor(Sql_GetIntData(SqlHandle,9));
                }
				PChar->getStorage(PItem->getLocationID())->InsertItem(PItem, PItem->getSlotID());
			}
		}
	}

	Query = 
        "SELECT "
          "main,"
          "sub,"
          "ranged,"
          "ammo,"
          "head,"
          "body,"
          "hands,"
          "legs,"
          "feet,"
          "neck,"
          "waist,"
          "ear1,"
          "ear2,"
          "ring1,"
          "ring2,"
          "back,"
          "link "
        "FROM char_equip "
        "WHERE charid = %u;";

	ret = Sql_Query(SqlHandle, Query, PChar->id);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		for (int32 i = 0; i < 16; ++i)
		{
            EquipItem(PChar, (uint8)Sql_GetIntData(SqlHandle, i), i);
		}
        uint8 SlotID = (uint8)Sql_GetIntData(SqlHandle, SLOT_LINK);

		CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

		if ((PItem != NULL) && (PItem->getType() & ITEM_LINKSHELL))
        {
		    PItem->setSubType(ITEM_LOCKED);
            PChar->equip[SLOT_LINK] = SlotID;
            linkshell::AddOnlineMember(PChar, (CItemLinkshell*)PItem);
        }
	}
    else 
    {
		ShowError(CL_RED"Loading error from char_equip\n" CL_RESET);
	}
	PChar->StatusEffectContainer->LoadStatusEffects();
}

/************************************************************************
*																		*
*  Отправляем список текущих/завершенных квестов и миссий				*
*																		*
************************************************************************/

void SendQuestMissionLog(CCharEntity* PChar)
{
	// в нижележащем цикле загружаются все квесты, текущие и выполненные
	// в одном пакете с текущими квестами Aht Urhgan отправляется информация о текущих миссиях
	// Treasures of Aht Urhgan
	// Wings of the Goddess Missions
	// Assault Missions
	// Campaign Operations
	// пакет с завершенными квестами Aht Urhgan содержит завершенные миссии Assault Missions

	for (uint8 status = 0x01; status <= 0x02; ++status) 
	{
		for (uint8 areaID = 0; areaID < MAX_QUESTAREA ; ++areaID)
		{
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, areaID, status));
		}
	}

	// обновляем статус миссий
	// National Missions
	// Rise of the Zilart and Chains of Promathia Missions
	// Add-on Scenarios
	// так как все эти миссии обновляются вместе,
	// то достаточно выполнить обновление для MISSION_ZILART

	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ZILART, 0x01));
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ZILART, 0x02));
	// Treasures of Aht Urhgan
	// Wings of the Goddess Missions

	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_TOAU, 0x02));

	// Campaign Operations

	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_CAMPAIGN, 0x02));
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_CAMPAIGN2, 0x02));
}

/************************************************************************
*																		*
*  Отправляем списки ключевых предметов персонажа						*
*																		*
************************************************************************/

void SendKeyItems(CCharEntity* PChar)
{
	PChar->pushPacket(new CKeyItemsPacket(PChar,KEYS_TABLE_0));
	PChar->pushPacket(new CKeyItemsPacket(PChar,KEYS_TABLE_1));
	PChar->pushPacket(new CKeyItemsPacket(PChar,KEYS_TABLE_2));
	PChar->pushPacket(new CKeyItemsPacket(PChar,KEYS_TABLE_3));
}

/************************************************************************
*                                                                       *
*  Отправляем персонажу весь его инвентарь                              *
*                                                                       *
************************************************************************/

void SendInventory(CCharEntity* PChar) 
{
	for(uint8 LocationID = 0; LocationID < MAX_CONTAINER_ID; ++LocationID) 
	{
		uint8 size = PChar->getStorage(LocationID)->GetSize();
		for(uint8 slotID = 0; slotID <= size; ++slotID) 
		{
			CItem* PItem = PChar->getStorage(LocationID)->GetItem(slotID);
			if(PItem != NULL) 
			{
				PChar->pushPacket(new CInventoryItemPacket(PItem, LocationID, slotID));
			}
		}
	}

	for(int32 i = 0; i < 16; ++i) 
	{
		if (PChar->equip[i] != 0) 
		{
			CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[i]);
			if(PItem != NULL) 
			{
				PItem->setSubType(ITEM_LOCKED);
				PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NODROP));
			}
		}
	}
    if (PChar->equip[SLOT_LINK] != 0)
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LINK]);
        if (PItem != NULL)
        {
            PItem->setSubType(ITEM_LOCKED);

            PChar->nameflags.flags |= FLAG_LINKSHELL;
            PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, PChar->equip[SLOT_LINK]));
		    PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_LINKSHELL));
            PChar->pushPacket(new CLinkshellEquipPacket(PChar));
        }
    }
	PChar->pushPacket(new CInventoryFinishPacket());
}

/************************************************************************
*																		*
*  Добавляем новый предмет персонажу в выбранный контейнер				*
*																		*
************************************************************************/

// TODO: мне не нравится параметр silens, нужно придумать что-нибудь более элегантное

uint8 AddItem(CCharEntity* PChar, uint8 LocationID, uint16 ItemID, uint32 quantity, bool silence)
{
    if (PChar->getStorage(LocationID)->GetFreeSlotsCount() == 0 || quantity == 0)
    {
        return ERROR_SLOTID;
    }

	CItem* PItem = itemutils::GetItem(ItemID);

	if (PItem != NULL) 
	{
		PItem->setQuantity(quantity);
        return AddItem(PChar, LocationID, PItem);
	}
	ShowWarning(CL_YELLOW"charplugin::AddItem: Item <%i> is not found in a database\n" CL_RESET, ItemID);
	return ERROR_SLOTID;
}

/************************************************************************
*																		*
*  Добавляем новый предмет персонажу в выбранный контейнер				*
*																		*
************************************************************************/

uint8 AddItem(CCharEntity* PChar, uint8 LocationID, CItem* PItem)
{
    if (PItem->getType() & ITEM_CURRENCY)
    {
        UpdateItem(PChar, LocationID, 0, PItem->getQuantity());
        delete PItem;
        return 0;
    }
    if (PItem->getFlag() & ITEM_FLAG_RARE)
    {
        if (HasItem(PChar, PItem->getID()))
        {
            PChar->pushPacket(new CMessageStandardPacket(PChar, PItem->getID(), 0, 220));
            delete PItem;
            return ERROR_SLOTID;
        }
    }

    uint8 SlotID = PChar->getStorage(LocationID)->InsertItem(PItem);

    if (SlotID != ERROR_SLOTID)
    {
        uint8 charges = (PItem->getType() & ITEM_USABLE ? ((CItemUsable*)PItem)->getCurrentCharges() : 0);

        const int8* Query = "INSERT INTO char_inventory(charid, location, slot, itemId, quantity, signature, currCharges) \
                             VALUES(%u,%u,%u,%u,%u,'%s',%u)";

        if( Sql_Query(SqlHandle, Query, PChar->id, LocationID, SlotID, PItem->getID(), PItem->getQuantity(), PItem->getSignature(), charges) == SQL_ERROR )
        {
            ShowError(CL_RED"charplugin::AddItem: Cannot insert item to database\n" CL_RESET);
            PChar->getStorage(LocationID)->InsertItem(NULL, SlotID);
            delete PItem;
            return ERROR_SLOTID;
        }
        PChar->pushPacket(new CInventoryItemPacket(PItem, LocationID, SlotID));
	    PChar->pushPacket(new CInventoryFinishPacket());
    }
    else
    {
        ShowDebug(CL_CYAN"charplugin::AddItem: Location %i is full\n" CL_RESET, LocationID);
        delete PItem;
    }
    return SlotID;
}

/************************************************************************
*                                                                       *
*  Проверяем наличие предмета у персонажа                               *
*                                                                       *
************************************************************************/

bool HasItem(CCharEntity* PChar, uint16 ItemID)
{
    for (uint8 LocID = 0; LocID < MAX_CONTAINER_ID; ++LocID)
	{
		if (PChar->getStorage(LocID)->SearchItem(ItemID) != ERROR_SLOTID)
		{
			return true;
		}
	}
    return false;
}

/************************************************************************
*																		*
*  Обновляем количество предметов в указанных контейнере и ячейке		*
*																		*
************************************************************************/

uint32 UpdateItem(CCharEntity* PChar, uint8 LocationID, uint8 slotID, int32 quantity)
{
	CItem* PItem = PChar->getStorage(LocationID)->GetItem(slotID);
	
	if(PItem == NULL) 
    {
		ShowDebug("UpdateItem: No item in slot %u\n", slotID);
		PChar->pushPacket(new CInventoryItemPacket(NULL, LocationID, slotID));
		return 0;
	}
	if ((int32)PItem->getQuantity() + quantity < 0)
	{
		ShowDebug("UpdateItem: Trying to move too much quantity\n");
		return 0;
	}

	uint32 ItemID = PItem->getID();
	uint32 newQuantity = PItem->getQuantity() + quantity;

	if (newQuantity > PItem->getStackSize()) newQuantity = PItem->getStackSize();

	if (newQuantity > 0 || (PItem->getType() & ITEM_CURRENCY)) 
    {
		const int8* Query = 
            "UPDATE char_inventory "
            "SET quantity = %u "
            "WHERE charid = %u AND location = %u AND slot = %u;";

		if (Sql_Query(SqlHandle, Query, newQuantity, PChar->id, LocationID, slotID) != SQL_ERROR)
		{
			PItem->setQuantity(newQuantity);
			PChar->pushPacket(new CInventoryModifyPacket(LocationID,slotID,newQuantity));
		}
	}
    else if (newQuantity == 0) 
    {
		const int8* Query = "DELETE FROM char_inventory WHERE charid = %u AND location = %u AND slot = %u;";

		if (Sql_Query(SqlHandle, Query, PChar->id, LocationID, slotID) != SQL_ERROR)
		{
			PChar->getStorage(LocationID)->InsertItem(NULL, slotID);
			PChar->pushPacket(new CInventoryItemPacket(NULL, LocationID, slotID));
            delete PItem;
		}
	}
	return ItemID;
}

/************************************************************************
*                                                                       *
*  Проверяем возможность обмена между персонажами                       *
*                                                                       *
************************************************************************/

bool CanTrade(CCharEntity* PChar, CCharEntity* PTarget)
{
    if (PTarget->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() < PChar->UContainer->GetItemsCount())
    {
        return false;
    }
    for (uint8 slotid = 0; slotid <= 8; ++slotid)
    {
        CItem* PItem = PChar->UContainer->GetItem(slotid);
								
	    if (PItem != NULL && PItem->getFlag() & ITEM_FLAG_RARE)
	    {
            if (HasItem(PTarget, PItem->getID()))
		    {
			    return false;							
		    }
	    }
    }
    return true;
}

/************************************************************************
*                                                                       *
*  Совершаем обмен между персонажами                                    *
*                                                                       *
************************************************************************/

void DoTrade(CCharEntity* PChar, CCharEntity* PTarget)
{
    for (uint8 slotid = 0; slotid <= 8; ++slotid)
    {
        CItem* PItem = PChar->UContainer->GetItem(slotid);
								
	    if (PItem != NULL)
        {
            if (PItem->getStackSize() == 1)
            {
                AddItem(PTarget, LOC_INVENTORY, itemutils::GetItem(PItem));
            } else {
                AddItem(PTarget, LOC_INVENTORY, PItem->getID(), PItem->getReserve());
            }
            UpdateItem(PChar, LOC_INVENTORY, PItem->getSlotID(), -PItem->getReserve());
        }
    }
}

/************************************************************************
*																		*
*  Снимаем с персонажа экипированный предмет без обновления внешного	*
*  вида. Используется как вспомогательная функция в связке с другими	*
*																		*
************************************************************************/

void UnequipItem(CCharEntity* PChar, uint8 equipSlotID) // private
{
	CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[equipSlotID]);

	if((PItem != NULL) && (PItem->getType() & ITEM_ARMOR)) 
	{
		switch(((CItemArmor*)PItem)->getRemoveSlotId()) 
		{
			case SLOT_HEAD:  PChar->look.head  = 0; break;
			case SLOT_HANDS: PChar->look.hands = 0; break;
			case SLOT_FEET:  PChar->look.feet  = 0; break;
		}
		
		uint8 slotID = PChar->equip[equipSlotID];
		//todo: issues as item 0 reference is being handled as a real equipment piece
		//      thought to be source of nin bug
		PChar->equip[equipSlotID] = 0;

		if (((CItemArmor*)PItem)->getScriptType() & SCRIPT_EQUIP)
		{
			PChar->m_EquipFlag = 0;
			luautils::OnItemCheck(PChar, PItem);

			for(uint8 i = 0; i < 16; ++i) 
			{
				CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[i]);

				if ((PItem != NULL) && (PItem->getType() & ITEM_ARMOR))
				{
					PChar->m_EquipFlag |= ((CItemArmor*)PItem)->getScriptType();
				}
			}
		}
        if (PItem->getSubType() & ITEM_CHARGED)
		{
            PChar->PRecastContainer->Del(RECAST_ITEM, PItem->getSlotID()); // при снятии предмета с таймером удаляем запись о нем из RecastList
		}
		PItem->setSubType(ITEM_UNLOCKED);
		
		PChar->delModifiers(&((CItemArmor*)PItem)->modList);

		PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NORMAL));
		PChar->pushPacket(new CEquipPacket(0, equipSlotID));

		switch(equipSlotID)
		{
			case SLOT_HEAD:   PChar->look.head  = 0; break;
			case SLOT_BODY:   PChar->look.body  = 0; break;
			case SLOT_HANDS:  PChar->look.hands = 0; break;
			case SLOT_LEGS:   PChar->look.legs  = 0; break;
			case SLOT_FEET:   PChar->look.feet  = 0; break;
			case SLOT_SUB:	  
            {
				PChar->look.sub = 0; 
				PChar->m_Weapons[SLOT_MAIN] = (PChar->GetMJob() == JOB_MNK ? 
                    itemutils::GetUnarmedH2HItem() : 
                    itemutils::GetUnarmedItem());
            }
			break;
			case SLOT_AMMO:
			case SLOT_RANGED:
			{
				if (PChar->equip[SLOT_RANGED] == 0)
				{
					PChar->look.ranged = 0;
				}
				PChar->PBattleAI->SetCurrentAction(ACTION_RANGED_INTERRUPT);
			}
		    break;
			case SLOT_MAIN:
			{
				if (PItem->getType() & ITEM_WEAPON) 
				{
					if (((CItemWeapon*)PItem)->getSkillType() == SKILL_H2H)
					{
						PChar->look.sub = 0;
					}
					PChar->delModifier(MOD_ATT, PChar->GetSkill(((CItemWeapon*)PItem)->getSkillType()));
					PChar->delModifier(MOD_ACC, PChar->GetSkill(((CItemWeapon*)PItem)->getSkillType()));
				}

				PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_SUB]);

				if ((PItem != NULL) && (PItem->getType() & ITEM_WEAPON))
				{
					UnequipItem(PChar, SLOT_SUB);
				}

				if (PChar->PBattleAI->GetCurrentAction() == ACTION_ATTACK)
				{
					PChar->PBattleAI->SetLastActionTime(gettick());
				}

				PChar->look.main = 0;
                PChar->m_Weapons[SLOT_MAIN] = (PChar->GetMJob() == JOB_MNK ? 
                    itemutils::GetUnarmedH2HItem() : 
                    itemutils::GetUnarmedItem());
			}
			break;
		}
	}
}

/************************************************************************
*																		*
*  Пытаемся экипировать предмет с соблюдением всех условий	 			*
*																		*
************************************************************************/

bool EquipArmor(CCharEntity* PChar, uint8 slotID, uint8 equipSlotID) 
{
	CItemArmor* PItem = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

	if (PItem == NULL) 
	{
		ShowDebug("No item in inventory slot %u\n", slotID);
		return false;
	}

    if ((PChar->m_EquipBlock & (1 << equipSlotID)) ||
       !(PItem->getJobs() & (1 << (PChar->GetMJob() - 1))) || 
        (PItem->getReqLvl() > PChar->GetMLevel()))
		return false;

	UnequipItem(PChar,equipSlotID);

	if (PItem->getEquipSlotId() & (1 << equipSlotID))
	{
		uint8 removeSlotID = PItem->getRemoveSlotId();

		if(removeSlotID > 0) 
		{
			UnequipItem(PChar,removeSlotID);
		}

		switch(equipSlotID) 
		{
			case SLOT_MAIN:
			{
				if (PItem->getType() & ITEM_WEAPON)
				{
					switch (((CItemWeapon*)PItem)->getSkillType()) 
					{
						case SKILL_H2H:
						case SKILL_GSD:
						case SKILL_GAX:
						case SKILL_SYH:
						case SKILL_POL:
						case SKILL_GKT:
						case SKILL_STF:
						{
							CItemArmor* armor = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_SUB]);
							if ((armor != NULL) && (armor->getType() & ITEM_ARMOR))
							{
								UnequipItem(PChar,SLOT_SUB);
							}
							if (((CItemWeapon*)PItem)->getSkillType() == SKILL_H2H)
							{
								PChar->look.sub = PItem->getModelId() + 0x1000;
							}
						}
						break;
					}
					if (PChar->PBattleAI->GetCurrentAction() == ACTION_ATTACK)
					{
						PChar->PBattleAI->SetLastActionTime(gettick());
					}
                    PChar->m_Weapons[SLOT_MAIN] = (CItemWeapon*)PItem;
					
					if (!PChar->m_Weapons[SLOT_MAIN]->isTwoHanded())
                    {
						PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HASSO);
						PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SEIGAN);
					}
					PChar->addModifier(MOD_ATT, PChar->GetSkill(((CItemWeapon*)PItem)->getSkillType()));
					PChar->addModifier(MOD_ACC, PChar->GetSkill(((CItemWeapon*)PItem)->getSkillType()));
				}
				PChar->look.main = PItem->getModelId();
			}
			break;
			case SLOT_SUB:
			{
				CItemWeapon* weapon = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_MAIN]);
				if (weapon == NULL || !(weapon->getType() & ITEM_WEAPON))
				{
					if (PItem->getType() & ITEM_WEAPON)
					{
						return false;
					}
				}
                else
                {
					switch (weapon->getSkillType())
					{
						case SKILL_H2H:
						{
							if (!(PItem->getType() & ITEM_WEAPON))
							{
								UnequipItem(PChar,SLOT_MAIN);
							}
						}
						case SKILL_DAG:
						case SKILL_SWD:
						case SKILL_AXE:
						case SKILL_KAT:
						case SKILL_CLB:
						{
							if (PItem->getType() & ITEM_WEAPON && !charutils::hasTrait(PChar, TRAIT_DUAL_WIELD))
							{
								PChar->pushPacket(new CCharAppearancePacket(PChar));
								return false;
							}
							PChar->m_Weapons[SLOT_SUB] = (CItemWeapon*)PItem;

						}
						break;
						default:
						{
							if (!(PItem->getType() & ITEM_WEAPON))
							{
								UnequipItem(PChar,SLOT_MAIN);
							}
						}
					}
				}
				PChar->look.sub = PItem->getModelId();
			}
			break;
			case SLOT_RANGED:
			{
				if (PItem->getType() & ITEM_WEAPON)
				{
					CItemWeapon* weapon = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);
					if ((weapon != NULL) && (weapon->getType() & ITEM_WEAPON))
					{
						if (((CItemWeapon*)PItem)->getSkillType() != weapon->getSkillType())
						{
							UnequipItem(PChar,SLOT_AMMO);
						}
					}
                    PChar->m_Weapons[SLOT_RANGED] = (CItemWeapon*)PItem;
				}
				PChar->look.ranged = PItem->getModelId();
			}
			break;
			case SLOT_AMMO:
			{
				if (PItem->getType() & ITEM_WEAPON)
				{
					CItemWeapon* weapon = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);
					if ((weapon != NULL) && (weapon->getType() & ITEM_WEAPON))
					{
						if (((CItemWeapon*)PItem)->getSkillType() != weapon->getSkillType())
						{
							UnequipItem(PChar,SLOT_RANGED);
						}
					}
					if (PChar->equip[SLOT_RANGED] == 0)
					{
						PChar->look.ranged = PItem->getModelId();
					}
					PChar->m_Weapons[SLOT_AMMO] = (CItemWeapon*)PItem;
				}
			}
			break;
			case SLOT_HEAD: 
			{
				CItemArmor* armor = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_BODY]);
				if ((armor != NULL) && (armor->getType() & ITEM_ARMOR)) 
				{
					uint8 removeSlotID = armor->getRemoveSlotId();
					if(removeSlotID == SLOT_HEAD) {
						UnequipItem(PChar, SLOT_BODY);
					}
				}
				PChar->look.head = PItem->getModelId();
			}
			break;
			case SLOT_BODY:
			{
				if (PItem->getRemoveSlotId() == SLOT_HANDS)
                {
					PChar->look.hands = 157;
				}
				PChar->look.body = PItem->getModelId();
			}
			break;
			case SLOT_HANDS: 
			{
				CItemArmor* armor = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_BODY]);
				if ((armor != NULL) && (armor->getType() & ITEM_ARMOR))
				{
					uint8 removeSlotID = armor->getRemoveSlotId();
					if(removeSlotID == SLOT_HANDS) 
                    {
						UnequipItem(PChar,SLOT_BODY);
					}
				}
				PChar->look.hands = PItem->getModelId();
			}
			break;
			case SLOT_LEGS:
			{
				if(PItem->getRemoveSlotId() == SLOT_FEET) 
                {
					PChar->look.feet = 157;
				}
				PChar->look.legs = PItem->getModelId();
			}
			break;
			case SLOT_FEET: 
			{
				CItemArmor* armor = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LEGS]);
				if ((armor != NULL) && (armor->getType() & ITEM_ARMOR))
				{
					uint8 removeSlotID = armor->getRemoveSlotId();
					if (removeSlotID == SLOT_FEET) 
                    {
						UnequipItem(PChar, SLOT_LEGS);
					}
				}
				PChar->look.feet = PItem->getModelId();
			}
			break;
		}
		PChar->equip[equipSlotID] = slotID;
	} 
    else 
    {
		ShowWarning(CL_YELLOW"Item %i is not equipable in equip slot %i\n" CL_RESET, PItem->getID(), equipSlotID);
		return false;
	}
	return true;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void EquipItem(CCharEntity* PChar, uint8 slotID, uint8 equipSlotID)
{
	if (slotID == 0)
	{
		UnequipItem(PChar,equipSlotID);

		PChar->status = STATUS_UPDATE;
		PChar->pushPacket(new CCharAppearancePacket(PChar));
		PChar->pushPacket(new CEquipPacket(slotID, equipSlotID));
	} 
	else 
	{
		CItemArmor* PItem = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

		if ((PItem != NULL) && (PItem->getType() & ITEM_ARMOR))
		{
			if (!(PItem->getSubType() & ITEM_LOCKED) && EquipArmor(PChar, slotID, equipSlotID)) 
			{
				if (PItem->getScriptType() & SCRIPT_EQUIP)
				{
					luautils::OnItemCheck(PChar, PItem);
					PChar->m_EquipFlag |= PItem->getScriptType();
				}
                if ((PItem->getType() & ITEM_USABLE) && ((CItemUsable*)PItem)->getCurrentCharges() != 0)
		        {
                    PItem->setAssignTime(CVanaTime::getInstance()->getVanaTime());
                    PChar->PRecastContainer->Add(RECAST_ITEM, slotID, PItem->getReuseTime());

                    // не забываем обновить таймер при экипировке предмета

			        PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, slotID));
	                PChar->pushPacket(new CInventoryFinishPacket());
		        }
				PItem->setSubType(ITEM_LOCKED);

				PChar->addModifiers(&PItem->modList);

				PChar->status = STATUS_UPDATE;
				PChar->pushPacket(new CEquipPacket(slotID, equipSlotID));
				PChar->pushPacket(new CCharAppearancePacket(PChar));
				PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NODROP));
				PChar->pushPacket(new CCharUpdatePacket(PChar));
			}
        }
	}
    if (equipSlotID == SLOT_MAIN || equipSlotID == SLOT_RANGED)
    {
        PChar->health.tp = 0;
        BuildingCharWeaponSkills(PChar);
    }
    PChar->UpdateHealth();
	PChar->pushPacket(new CCharHealthPacket(PChar));
}

/************************************************************************
*																		*
*  Проверяем возможность персонажа носить экипированные на нем предметы	*
*																		*
************************************************************************/

void CheckValidEquipment(CCharEntity* PChar)
{
	CItemArmor* PItem  = NULL;

	for(uint8 slotID = 0; slotID < 16; ++slotID)
	{
		PItem = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[slotID]);
        
		if ((PItem != NULL) && (PItem->getType() & ITEM_ARMOR))
		{
			if ((PItem->getJobs() & (1 << (PChar->GetMJob() - 1))) && 
                (PItem->getReqLvl() <= PChar->GetMLevel()) && 
                (PItem->getEquipSlotId() & (1 << slotID)))
			{
                continue;
			}
            UnequipItem(PChar, slotID);		
        }
        PChar->pushPacket(new CEquipPacket(0, slotID));
	}
	PChar->pushPacket(new CCharAppearancePacket(PChar));

    BuildingCharWeaponSkills(PChar);
	SaveCharEquip(PChar);
}

void RemoveAllEquipment(CCharEntity* PChar)
{
    CItemArmor* PItem  = NULL;

    for(uint8 slotID = 0; slotID < 16; ++slotID)
    {
        PItem = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[slotID]);

        if ((PItem != NULL) && (PItem->getType() & ITEM_ARMOR))
        {
            UnequipItem(PChar, slotID);
        }
        PChar->pushPacket(new CEquipPacket(0, slotID));
    }
    PChar->pushPacket(new CCharAppearancePacket(PChar));

    BuildingCharWeaponSkills(PChar);
    SaveCharEquip(PChar);
}

/************************************************************************
*																		*
*  Проверяем логику всей экипировки персонажа							*
*																		*
************************************************************************/

// позднее нужно будет сделать экипировку в структуре, 
// куда добавить битовое поле, указывающее, в какой ячейке находится экипировка с условием
// для начала это поле избавит нас от проверки ячеек у персонажей без экипировки с условием

void CheckEquipLogic(CCharEntity* PChar, SCRIPTTYPE ScriptType, uint32 param)
{
	if (!(PChar->m_EquipFlag & ScriptType))
		return;

	for(uint8 slotID = 0; slotID < 16; ++slotID) 
	{
		CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[slotID]);

		if ((PItem != NULL) && (PItem->getType() & ITEM_ARMOR))
		{
			if (((CItemArmor*)PItem)->getScriptType() & ScriptType)
			{
				luautils::OnItemCheck(PChar, PItem, param);
			}
		}
	}
}

/************************************************************************
*																		*
*  Load the Characters weapon skill list								*
*																		*
************************************************************************/

void BuildingCharWeaponSkills(CCharEntity* PChar)
{
	memset(& PChar->m_WeaponSkills, 0, sizeof(PChar->m_WeaponSkills)); 

	JOBTYPE curMainJob = PChar->GetMJob();
	JOBTYPE curSubJob  = PChar->GetSJob();

	CItemWeapon* PItem;
	int16 wsIDs[3] = { 0 };
	int16 wsDynIDs[3] = { 0 };

	bool isInDynamis = PChar->isInDynamis();

	for (int i = 0; i < 3; ++i)
	{
		if (PChar->equip[i])
		{
			PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[i]);

			for(std::vector<CModifier*>::iterator it = PItem->modList.begin(); it !=  PItem->modList.end(); ++it)
			{
				if((*it)->getModID() == MOD_ADDS_WEAPONSKILL)
				{
					wsIDs[i] = (*it)->getModAmount();
					break;
				}
				if((*it)->getModID() == MOD_ADDS_WEAPONSKILL_DYN)
				{
					wsDynIDs[i] = (*it)->getModAmount();
					break;
				}
			}
		}
	}

	//add in melee ws
	uint8 skill = PChar->m_Weapons[SLOT_MAIN]->getSkillType();
	std::list<CWeaponSkill*>&& WeaponSkillList = battleutils::GetWeaponSkills(skill);
	for (std::list<CWeaponSkill*>::iterator it = WeaponSkillList.begin(); it != WeaponSkillList.end(); ++it)
	{
		CWeaponSkill* PSkill = *it;

		if (PChar->GetSkill(skill) >=  PSkill->getSkillLevel() && (PSkill->getJob(curMainJob) > 0 || PSkill->getJob(curSubJob) > 0)
			|| PSkill->getID() == wsIDs[SLOT_MAIN] || PSkill->getID() == wsIDs[SLOT_SUB]
			|| isInDynamis && (PSkill->getID() == wsDynIDs[SLOT_MAIN] || PSkill->getID() == wsDynIDs[SLOT_SUB]))
		{
			addWeaponSkill(PChar, PSkill->getID());
		}
	}
	
	//add in ranged ws
	PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);
	if(PItem != NULL && (PItem->getType() & ITEM_WEAPON) && PItem->getSkillType()!=SKILL_THR)
	{ 
		skill = PChar->m_Weapons[SLOT_RANGED]->getSkillType();
		std::list<CWeaponSkill*>&& WeaponSkillList = battleutils::GetWeaponSkills(skill);
		for (std::list<CWeaponSkill*>::iterator it = WeaponSkillList.begin(); it != WeaponSkillList.end(); ++it)
		{
			CWeaponSkill* PSkill = *it;
			if (PChar->GetSkill(skill) >=  PSkill->getSkillLevel() && (PSkill->getJob(curMainJob) > 0 || PSkill->getJob (curSubJob) > 0)
				|| PSkill->getID() == wsIDs[SLOT_RANGED]
				|| isInDynamis && (PSkill->getID() == wsDynIDs[SLOT_MAIN] || PSkill->getID() == wsDynIDs[SLOT_SUB]))
			{
				addWeaponSkill(PChar, PSkill->getID());
			}
		}
	}
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
}

void BuildingCharPetAbilityTable(CCharEntity* PChar, CPetEntity* PPet, uint32 PetID){
	DSP_DEBUG_BREAK_IF(PPet==NULL || PChar==NULL);

	memset(& PChar->m_PetCommands, 0, sizeof(PChar->m_PetCommands));

	if(PetID==0){//technically Fire Spirit but we're using this to null the abilities shown
		PChar->pushPacket(new CCharAbilitiesPacket(PChar));
		return;
	}

	if(PChar->GetMJob() == JOB_SMN || PChar->GetSJob() == JOB_SMN){
		std::vector<CAbility*> AbilitiesList;
		AbilitiesList = ability::GetAbilities(JOB_SMN);
		
        for (int32 i = 0; i < AbilitiesList.size(); ++i)
		{
			CAbility* PAbility = AbilitiesList.at(i);

			if (PPet->GetMLevel() >= PAbility->getLevel() && PetID>=8 && PetID<=15) //carby/fen/ele avatars NOT diabolos
			{
				//16 IDs per avatar starting from 496
				if(PAbility->getID()>= (496+((PetID-8)*16)) && PAbility->getID() < (496+((PetID-7)*16))){ //pet ability
					addPetAbility(PChar,PAbility->getID()-496);
				}
			}
		}
	}
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
}

/************************************************************************
*																		*
*  Собираем рабочую таблицу способностей персонажа. С нулевым уровнем	*
*  должны быть 2h способности. По этому условию отсеиваем их для sjob	*
*																		*
************************************************************************/

void BuildingCharAbilityTable(CCharEntity* PChar)
{
	std::vector<CAbility*> AbilitiesList;

	memset(& PChar->m_Abilities, 0, sizeof(PChar->m_Abilities));

	AbilitiesList = ability::GetAbilities(PChar->GetMJob());

    for (int32 i = 0; i < AbilitiesList.size(); ++i)
	{
		CAbility* PAbility = AbilitiesList.at(i);

		if (PChar->GetMLevel() >= PAbility->getLevel() &&  PAbility->getID() < 496)
		{
			addAbility(PChar, PAbility->getID());
		}else{
			break;
		}
	}

	AbilitiesList = ability::GetAbilities(PChar->GetSJob());

	for (int32 i = 0; i < AbilitiesList.size(); ++i)
	{
		CAbility* PAbility = AbilitiesList.at(i);

		if(PAbility->getID() == ABILITY_CALL_WYVERN && PChar->GetSJob() == JOB_DRG) 
        {
			//DRG Call Wyvern isn't available to /DRG, which is unique among JAs.
			break;
		}

		if (PChar->GetSLevel() >= PAbility->getLevel())
		{
			if (PAbility->getLevel() != 0)
			{
				addAbility(PChar, PAbility->getID());
			}
		}else{
			break;
		}
	}
}

/************************************************************************
*																		*
*  Собираем рабочую таблицу умений персонажа на основе реальной.		*
*  Добавляем ограничения, отмечаем умения основной профессии (rank != 0)*
*																		*
************************************************************************/

void BuildingCharSkillsTable(CCharEntity* PChar)
{
	for (int32 i = 0; i < 48; ++i) 
	{
		uint16 MaxMSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PChar->GetMJob(),PChar->GetMLevel());
		uint16 MaxSSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PChar->GetSJob(),PChar->GetSLevel());

		PChar->WorkingSkills.rank[i] = battleutils::GetSkillRank((SKILLTYPE)i,PChar->GetMJob());

		if (MaxMSkill != 0)
		{
			PChar->WorkingSkills.skill[i] = (PChar->RealSkills.skill[i]/10 > MaxMSkill ? MaxMSkill + 0x8000 : PChar->RealSkills.skill[i]/10);
		}
		else if (MaxSSkill != 0)
		{
			PChar->WorkingSkills.skill[i] = (PChar->RealSkills.skill[i]/10 > MaxSSkill ? MaxSSkill + 0x8000 : PChar->RealSkills.skill[i]/10);
		}
		else
		{		
			PChar->WorkingSkills.skill[i] = 0x8000;
		}
	}

	for (int32 i = 48; i < 58; ++i) 
	{
		PChar->WorkingSkills.skill[i] = (PChar->RealSkills.skill[i]/10) * 0x20 + PChar->RealSkills.rank[i];
		
		if ((PChar->RealSkills.rank[i]+1)*100 <= PChar->RealSkills.skill[i])
		{
			PChar->WorkingSkills.skill[i] += 0x8000;
		}
	}

	for (int32 i = 58; i < 64; ++i) 
	{
		PChar->WorkingSkills.skill[i] = 0xFFFF;
	}
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void BuildingCharTraitsTable(CCharEntity* PChar)
{
    for (uint8 i = 0; i < PChar->TraitList.size(); ++i)
    {
        CTrait* PTrait = PChar->TraitList.at(i);
        PChar->delModifier(PTrait->getMod(), PTrait->getValue());
		PChar->StatusEffectContainer->DelStatusEffect((EFFECT)PTrait->getEffect());
    }
    PChar->TraitList.clear();
	memset(&PChar->m_TraitList, 0, sizeof(PChar->m_TraitList));

    TraitList_t* PTraitsList;

	PTraitsList = traits::GetTraits(PChar->GetMJob());
    for (uint8 i = 0; i <  PTraitsList->size(); ++i)
	{
		CTrait* PTrait = PTraitsList->at(i);
		if (PChar->GetMLevel() >= PTrait->getLevel())
		{
            addTrait(PChar, PTrait->getID());

            PChar->TraitList.push_back(PTrait);
            PChar->addModifier(PTrait->getMod(), PTrait->getValue());
			if (PTrait->getEffect() == 234 || PTrait->getEffect() == 233){
				PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect((EFFECT)PTrait->getEffect(), 0, PTrait->getValue(), 3, 0));
			}
		}
	}

	PTraitsList = traits::GetTraits(PChar->GetSJob());
	for (uint8 i = 0; i <  PTraitsList->size(); ++i)
	{
		CTrait* PTrait = PTraitsList->at(i);
		if (PChar->GetSLevel() >= PTrait->getLevel())
		{
			addTrait(PChar, PTrait->getID());

            PChar->TraitList.push_back(PTrait);
            PChar->addModifier(PTrait->getMod(), PTrait->getValue());
			if (PTrait->getEffect() == 234 || PTrait->getEffect() == 233){
				PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect((EFFECT)PTrait->getEffect(), 0, PTrait->getValue(), 3, 0));
			}
		}
	}
	PChar->addModifier(MOD_MEVA, battleutils::GetMaxSkill(SKILL_ELE, JOB_RDM, PChar->GetMLevel()));
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
}

/************************************************************************
*																		*
*  Пытаемся увеличить значение умения									*
*																		*
************************************************************************/

void TrySkillUP(CCharEntity* PChar, SKILLTYPE SkillID, uint8 lvl)
{
	DSP_DEBUG_BREAK_IF(SkillID >= MAX_SKILLTYPE);	// выход за пределы допустимых умений 

	if ((PChar->WorkingSkills.rank[SkillID] != 0) && !(PChar->WorkingSkills.skill[SkillID] & 0x8000)) 
	{
		uint16 CurSkill = PChar->RealSkills.skill[SkillID];
        uint16 MaxSkill = battleutils::GetMaxSkill(SkillID, PChar->GetMJob(), dsp_min(PChar->GetMLevel(),lvl));

		int16  Diff = MaxSkill - CurSkill/10;
        double SkillUpChance = Diff/5 + map_config.skillup_multiplier * (2.0 - log10(1.0 + CurSkill /100));

		double random = rand() / ((double)RAND_MAX);

		if(Diff > 0 && random < SkillUpChance) 
		{
			double chance = 0;
			uint8  SkillAmount = 1;
			uint8  tier = dsp_min(1 + (Diff/5), 5);
		
			for(uint8 i = 0; i < 4; ++i) // 1 + 4 возможных дополнительных (максимум 5)
			{
				random = rand() / ((double)RAND_MAX);

				switch(tier)
				{
					case 5:  chance = 0.900; break;
					case 4:  chance = 0.700; break;
					case 3:  chance = 0.500; break;
					case 2:  chance = 0.300; break;
					case 1:  chance = 0.100; break;
					default: chance = 0.000; break;
				}
				if (chance < random) break;

				tier -= 1;
				SkillAmount += 1;
			}
            MaxSkill = MaxSkill * 10;

			if (SkillAmount + CurSkill >= MaxSkill)
			{
				SkillAmount = MaxSkill - CurSkill;
                PChar->WorkingSkills.skill[SkillID] |= 0x8000;
			}
            DSP_DEBUG_BREAK_IF(SkillAmount > 5);

			PChar->RealSkills.skill[SkillID] += SkillAmount; 
			PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SkillID, SkillAmount, 38));
	            
			if((CurSkill/10) < (CurSkill + SkillAmount)/10) //if gone up a level
			{
				PChar->WorkingSkills.skill[SkillID] += 1;
				PChar->pushPacket(new CCharSkillsPacket(PChar));
				PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SkillID, (CurSkill + SkillAmount)/10, 53));

				CheckWeaponSkill(PChar, SkillID);

				if (SkillID >= 1 && SkillID <= 12)
				{
					PChar->addModifier(MOD_ATT, 1);
					PChar->addModifier(MOD_ACC, 1);
				}
			}
			SaveCharSkills(PChar, SkillID);
		}
	}
}

/************************************************************************
*																		*
*  When skill level gained check for weapon skill						*
*																		*
************************************************************************/

void CheckWeaponSkill(CCharEntity* PChar, uint8 skill) 
{
	if (PChar->m_Weapons[SLOT_MAIN]->getSkillType() != skill)
	{
		return;
	}
	std::list<CWeaponSkill*> WeaponSkillList; 		
	WeaponSkillList = battleutils::GetWeaponSkills(skill); 
	uint8 curSkill = PChar->RealSkills.skill[skill]/10; 
	JOBTYPE curMainJob = PChar->GetMJob();
	JOBTYPE curSubJob = PChar->GetSJob();

	for (std::list<CWeaponSkill*>::iterator it = WeaponSkillList.begin(); it != WeaponSkillList.end(); ++it)
	{
		CWeaponSkill* PSkill = *it;
			
		if (curSkill == PSkill->getSkillLevel() && (PSkill->getJob(curMainJob) > 0 || PSkill->getJob(curSubJob) > 0))
		{
			addWeaponSkill(PChar,PSkill->getID());
			PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PSkill->getID(), PSkill->getID(), 45));	
			PChar->pushPacket(new CCharAbilitiesPacket(PChar));
		}
	}
}

/************************************************************************
*																		*
*  Методы для работы с ключевыми предметами								*
*																		*
************************************************************************/

int32 hasKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return hasBit(KeyItemID, PChar->keys.keysList, sizeof(PChar->keys.keysList));
}

int32 seenKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return hasBit(KeyItemID, PChar->keys.seenList, sizeof(PChar->keys.seenList));
}

int32 unseenKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return delBit(KeyItemID, PChar->keys.seenList, sizeof(PChar->keys.seenList));
}

int32 addKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return addBit(KeyItemID, PChar->keys.keysList, sizeof(PChar->keys.keysList));
}

int32 delKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return delBit(KeyItemID, PChar->keys.keysList, sizeof(PChar->keys.keysList));
}

/************************************************************************
*																		*
*  Методы для работы с заклинаниями										*
*																		*
************************************************************************/

int32 hasSpell(CCharEntity* PChar, uint16 SpellID)
{
	return hasBit(SpellID, PChar->m_SpellList, sizeof(PChar->m_SpellList));
}

int32 addSpell(CCharEntity* PChar, uint16 SpellID)
{
	return addBit(SpellID, PChar->m_SpellList, sizeof(PChar->m_SpellList));
}

int32 delSpell(CCharEntity* PChar, uint16 SpellID)
{
	return delBit(SpellID, PChar->m_SpellList, sizeof(PChar->m_SpellList));
}

/************************************************************************
*                                                                       *
*  Методы для работы со званиями                                        *
*                                                                       *
************************************************************************/

int32 hasTitle(CCharEntity* PChar, uint16 Title)
{
	return hasBit(Title, PChar->m_TitleList, sizeof(PChar->m_TitleList));
}

int32 addTitle(CCharEntity* PChar, uint16 Title)
{
	return addBit(Title, PChar->m_TitleList, sizeof(PChar->m_TitleList));
}

int32 delTitle(CCharEntity* PChar, uint16 Title)
{
	return delBit(Title, PChar->m_TitleList, sizeof(PChar->m_TitleList));
}

/************************************************************************
*																		*
*  Методы для работы с основными способностями							*
*																		*
************************************************************************/

int32 hasAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return hasBit(AbilityID, PChar->m_Abilities, sizeof(PChar->m_Abilities));
}

int32 addAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return addBit(AbilityID, PChar->m_Abilities, sizeof(PChar->m_Abilities));
}

int32 delAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return delBit(AbilityID, PChar->m_Abilities, sizeof(PChar->m_Abilities));
}

/************************************************************************
*																		*
*  Weapon Skill functions												*
*																		*
************************************************************************/

int32 hasWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID)
{
	return hasBit(WeaponSkillID, PChar->m_WeaponSkills, sizeof(PChar->m_WeaponSkills));
}

int32 addWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID)
{
	return addBit(WeaponSkillID, PChar->m_WeaponSkills, sizeof(PChar->m_WeaponSkills));
}

int32 delWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID)
{
	return delBit(WeaponSkillID, PChar->m_WeaponSkills, sizeof(PChar->m_WeaponSkills));
}

/************************************************************************
*																		*
*  Trait Functions														*
*																		*
************************************************************************/

int32 hasTrait(CCharEntity* PChar, uint8 TraitID)
{
	return hasBit(TraitID, PChar->m_TraitList, sizeof(PChar->m_TraitList));
}

int32 addTrait(CCharEntity* PChar, uint8 TraitID)
{
	return addBit(TraitID, PChar->m_TraitList, sizeof(PChar->m_TraitList));
}

int32 delTrait(CCharEntity* PChar, uint8 TraitID)
{
	return delBit(TraitID, PChar->m_TraitList, sizeof(PChar->m_TraitList));
}

/************************************************************************
*
*		Pet Command Functions		
*
*************************************************************************/
int32 hasPetAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return hasBit(AbilityID, PChar->m_PetCommands, sizeof(PChar->m_PetCommands));
}

int32 addPetAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return addBit(AbilityID, PChar->m_PetCommands, sizeof(PChar->m_PetCommands));
}

int32 delPetAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return delBit(AbilityID, PChar->m_PetCommands, sizeof(PChar->m_PetCommands));
}

/************************************************************************
*                                                                       *
*  Обновляем MP, HP и TP персонажа                                      *
*                                                                       *
************************************************************************/

void UpdateHealth(CCharEntity* PChar)
{
    DSP_DEBUG_BREAK_IF(PChar->objtype != TYPE_PC);

    if (PChar->status == STATUS_NORMAL) PChar->status = STATUS_UPDATE;

	if (PChar->PParty != NULL)
	{
		if (PChar->PParty->m_PAlliance == NULL)
		{
			PChar->PParty->PushPacket(PChar, PChar->getZone(), new CCharHealthPacket(PChar));
		
		}else if (PChar->PParty->m_PAlliance != NULL)
				{
					for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.size(); ++i)
					{
						((CParty*)PChar->PParty->m_PAlliance->partyList.at(i))->PushPacket(PChar, PChar->getZone(), new CCharHealthPacket(PChar));
					}
				}
	}

    PChar->pushPacket(new CCharHealthPacket(PChar));
}

/************************************************************************
*																		*
*  Инициализируем таблицу опыта											*
*																		*
************************************************************************/

void LoadExpTable()
{
	memset(g_ExpTable,0, sizeof(g_ExpTable));
	memset(g_ExpPerLevel,0, sizeof(g_ExpPerLevel));

	const int8* fmtQuery = "SELECT r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20 \
						    FROM exp_table \
							ORDER BY level ASC \
							LIMIT 50";

	int32 ret = Sql_Query(SqlHandle,fmtQuery);
	
	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		for (uint32 x = 0; x < 50 && Sql_NextRow(SqlHandle) == SQL_SUCCESS; ++x)
		{
			for (uint32 y = 0; y < 20; ++y) 
			{
				g_ExpTable[x][y] = (uint16)Sql_GetIntData(SqlHandle,y);
			}
		}
	}

	ret = Sql_Query(SqlHandle,"SELECT level, exp FROM exp_base LIMIT 100;");

	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			uint8 level = (uint8)Sql_GetIntData(SqlHandle,0) - 1;

			if (level < 100)
			{
				g_ExpPerLevel[level] = (uint16)Sql_GetIntData(SqlHandle,1);
			}
		}
	}
}

/************************************************************************
*																		*
*  Узнаем реальное количество опыта, который персонаж получит с цели	*
*																		*
************************************************************************/

uint32 GetRealExp(uint8 charlvl, uint8 moblvl)
{
	int32 levelDif =  moblvl - charlvl + 34;

	if ((charlvl > 0) && (charlvl < 100)) 
	{
		return g_ExpTable[dsp_cap(levelDif,0,49)][(charlvl-1)/5];
	}
	return 0;
}

/************************************************************************
*																		*
*  Узнаем количество опыта, необходимое для получения следующего уровня	*
*																		*
************************************************************************/

uint32 GetExpNEXTLevel(uint8 charlvl)
{
	if ((charlvl > 0) && (charlvl < 100)) 
	{
		return g_ExpPerLevel[charlvl];
	}
	return 0;
}

/************************************************************************
*																		*
*  Distributes gil to party members.                                    *
*																		*
************************************************************************/

// TODO: REALISATION MUST BE IN TREASUREPOOL

void DistributeGil(CCharEntity* PChar, CMobEntity* PMob)
{
	//work out the amount of gil to give (guessed; replace with testing)
    uint32 gil = PMob->GetMLevel() * ((PMob->m_Type & MOBTYPE_NOTORIOUS) ? 10 : 1);

	//distribute to said members (perhaps store pointers to each member in first loop?)
	if (PChar->PParty != NULL) 
	{
        // TODO: плохая реализация - два раза проверяем дистанцию, два раза проверяем один и тот же массив

        uint8 count = 0;
        //work out how many pt members should get the gil
        for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
		{
            CBattleEntity* PMember = PChar->PParty->members[i];
            if (PMember->getZone() == PMob->getZone() && distance(PMember->loc.p, PMob->loc.p) < 100)
			{
                count++;
			}
		}

        uint32 gilperperson = count == 0 ? gil : (gil / count);

		for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
		{
            CCharEntity* PMember = (CCharEntity*)PChar->PParty->members[i];
			if (PMember->getZone() == PMob->getZone() && distance(PMember->loc.p, PMob->loc.p) < 100)
			{
                UpdateItem(PMember, LOC_INVENTORY, 0, gilperperson);
			}
		}
	}
	else if (distance(PChar->loc.p, PMob->loc.p) < 100)
    {
        UpdateItem(PChar, LOC_INVENTORY, 0, gil);
	}
}

/************************************************************************
*																		*
*  Allocate experience points											*
*																		*
************************************************************************/

void DistributeExperiencePoints(CCharEntity* PChar, CMobEntity* PMob)
{
    uint8 pcinzone = 0, minlevel = 0, maxlevel = PChar->GetMLevel();
    uint32 baseexp = 0, exp = 0, dedication = 0;
    float permonstercap, monsterbonus = 1.0f;
    bool chainactive = false;
    if (PChar->PParty != NULL)
    {
        for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
        {
            CBattleEntity* PBattle = PChar->PParty->members[i];
            if (PBattle->getZone() == PMob->getZone() && distance(PBattle->loc.p, PMob->loc.p) < 100)
            {
                if (PBattle->GetMLevel() > maxlevel) maxlevel = PBattle->GetMLevel();
                else if (PBattle->GetMLevel() < minlevel) minlevel = PBattle->GetMLevel();
                pcinzone++;
            }
        }
		if (PMob->m_HiPCLvl > maxlevel) maxlevel = PMob->m_HiPCLvl;
        baseexp = GetRealExp(maxlevel, PMob->GetMLevel());
        if (baseexp != 0)
        {
            for (uint8 i = 0; i < PChar->PParty->members.size(); ++i)
            {
                exp = 0;
                monsterbonus = 1.0f;
                chainactive = false;
                CCharEntity* PMember = (CCharEntity*)PChar->PParty->members[i];
                if(PMember->getZone() == PMob->getZone())
                {
                    if (map_config.exp_party_gap_penalties == 1)
					{
						if (maxlevel > 50 || maxlevel > (PMember->GetMLevel()+7))
						{
							exp = (float)baseexp*(float)((float)(PMember->GetMLevel())/(float)(maxlevel));
						}
						else
						{
							exp = (float)baseexp*(float)((float)(GetExpNEXTLevel(PMember->GetMLevel()))/(float)(GetExpNEXTLevel(maxlevel)));
						}
					}
					else exp = baseexp;
                    if (PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) || PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION))
                    {
                        switch(pcinzone)
                        {
                        case 1: exp *= 1.00f; break;
                        case 2:	exp *= 0.75f; break;
                        case 3: exp *= 0.55f; break;
                        case 4: exp *= 0.45f; break;
                        case 5:	exp *= 0.39f; break;
                        case 6: exp *= 0.35f; break;
                        default: break;
                        }
                    }
                    else
                    {
                        switch(pcinzone)
                        {
                        case 1:	exp *= 1.00f; break;
                        case 2: exp *= 0.60f; break;
                        case 3: exp *= 0.45f; break;
                        case 4: exp *= 0.40f; break;
                        case 5: exp *= 0.37f; break;
                        case 6: exp *= 0.35f; break;
                        default: break;
                        }
                    }
                    if (PMob->m_Family == 58 && PMob->getZone() == 65) monsterbonus = 1.05f;
                    else if (PMob->m_Family == 245 && PMob->getZone() == 51) monsterbonus = 1.05f;
                    else if (PMob->m_Family == 186 && PMob->getZone() == 153) monsterbonus = 1.23f;
                    else if (PMob->m_Family == 179 && PMob->getZone() == 113) monsterbonus = 1.10f;
                    else if (PMob->m_Family == 266 && PMob->getZone() == 174) monsterbonus = 1.23f;
                    else if (PMob->m_Family == 206 && PMob->getZone() == 5) monsterbonus = 1.10f;
                    else if (PMob->m_Family == 208 && PMob->getZone() == 24) monsterbonus = 1.23f;
                    if (monsterbonus > 1.00f) exp *= monsterbonus;
                    permonstercap = ((PMember->PParty != NULL && pcinzone > 1) ? 1.35f : 1.15f);
                    if (PMember->GetMLevel() <= 50) 
                    {
                        if (exp > (200*permonstercap)) exp = 200*permonstercap;
                    } 
                    else if (PMember->GetMLevel() <= 60) 
                    {
                        if (exp > (250*permonstercap)) exp = 250*permonstercap;
                    } 
                    else if (exp > (300*permonstercap)) 
                    {
                        exp = 300*permonstercap;
                    }
                    if (PMember->expChain.chainTime > gettick() || PMember->expChain.chainTime == 0)
                    {
                        chainactive = true;
                        switch(PMember->expChain.chainNumber) 
                        {
                        case 0: exp *= 1.0f; break;
                        case 1: exp *= 1.2f; break;
                        case 2: exp *= 1.25f; break;
                        case 3: exp *= 1.3f; break;
                        case 4: exp *= 1.4f; break;
                        case 5: exp *= 1.5f; break;
                        default: exp *= 1.55f; break;
                        }
                    }
                    else 
                    {
                        if (PMember->GetMLevel() <=10) PMember->expChain.chainTime = gettick()+50000;
                        else if (PMember->GetMLevel() <=20) PMember->expChain.chainTime = gettick()+100000;
                        else if (PMember->GetMLevel() <=30) PMember->expChain.chainTime = gettick()+150000;
                        else if (PMember->GetMLevel() <=40) PMember->expChain.chainTime = gettick()+200000;
                        else if (PMember->GetMLevel() <=50) PMember->expChain.chainTime = gettick()+250000;
                        else if (PMember->GetMLevel() <=60) PMember->expChain.chainTime = gettick()+300000;
                        else PMember->expChain.chainTime = gettick()+360000;
                        chainactive = false;
                        PMember->expChain.chainNumber = 1;
                    }
                    if(chainactive && PMember->GetMLevel() <= 10)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+50000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+40000; break;
                        case 2: PMember->expChain.chainTime = gettick()+30000; break;
                        case 3: PMember->expChain.chainTime = gettick()+20000; break;
                        case 4: PMember->expChain.chainTime = gettick()+10000; break;
                        case 5: PMember->expChain.chainTime = gettick()+6000; break;
                        default: PMember->expChain.chainTime = gettick()+2000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 20)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+100000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+80000; break;
                        case 2: PMember->expChain.chainTime = gettick()+60000; break;
                        case 3: PMember->expChain.chainTime = gettick()+40000; break;
                        case 4: PMember->expChain.chainTime = gettick()+20000; break;
                        case 5: PMember->expChain.chainTime = gettick()+8000; break;
                        default: PMember->expChain.chainTime = gettick()+4000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 30)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+150000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+120000; break;
                        case 2: PMember->expChain.chainTime = gettick()+90000; break;
                        case 3: PMember->expChain.chainTime = gettick()+60000; break;
                        case 4: PMember->expChain.chainTime = gettick()+30000; break;
                        case 5: PMember->expChain.chainTime = gettick()+10000; break;
                        default: PMember->expChain.chainTime = gettick()+5000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 40)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+200000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+160000; break;
                        case 2: PMember->expChain.chainTime = gettick()+120000; break;
                        case 3: PMember->expChain.chainTime = gettick()+80000; break;
                        case 4: PMember->expChain.chainTime = gettick()+40000; break;
                        case 5: PMember->expChain.chainTime = gettick()+40000; break;
                        default: PMember->expChain.chainTime = gettick()+30000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 50)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+250000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+200000; break;
                        case 2: PMember->expChain.chainTime = gettick()+150000; break;
                        case 3: PMember->expChain.chainTime = gettick()+100000; break;
                        case 4: PMember->expChain.chainTime = gettick()+50000; break;
                        case 5: PMember->expChain.chainTime = gettick()+50000; break;
                        default: PMember->expChain.chainTime = gettick()+50000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 60)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+300000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+240000; break;
                        case 2: PMember->expChain.chainTime = gettick()+180000; break;
                        case 3: PMember->expChain.chainTime = gettick()+120000; break;
                        case 4: PMember->expChain.chainTime = gettick()+90000; break;
                        case 5: PMember->expChain.chainTime = gettick()+60000; break;
                        default: PMember->expChain.chainTime = gettick()+60000; break;
                        }
                    } else if (chainactive)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+360000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+300000; break;
                        case 2: PMember->expChain.chainTime = gettick()+240000; break;
                        case 3: PMember->expChain.chainTime = gettick()+165000; break;
                        case 4: PMember->expChain.chainTime = gettick()+105000; break;
                        case 5: PMember->expChain.chainTime = gettick()+60000; break;
                        default: PMember->expChain.chainTime = gettick()+60000; break;
                        }
                    }
                    exp = charutils::AddExpBonus(PMember, exp);

                    // pet or companion exp penalty needs to be added here

                    if (distance(PMember->loc.p, PMob->loc.p) > 100)
                    {
                        PMember->pushPacket(new CMessageBasicPacket(PMember,PMember,0,0,37));
                        continue;
                    }
					uint8 Pzone = PMember->getZone();
                    if (PMob->m_Type == MOBTYPE_NORMAL && ((Pzone > 0 && Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255)))
					{
						if (PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && PMob->m_Element > 0 && rand()%100 < 20 &&
                        PMember->loc.zone == PMob->loc.zone) // Need to move to SIGNET_CHANCE constant
						{
							PMember->PTreasurePool->AddItem(4095 + PMob->m_Element, PMob);
						}
					}
					if (PChar->PParty != NULL && PChar->PParty->m_PAlliance != NULL && PMob->m_Type == MOBTYPE_NORMAL) 
					{
						if ((Pzone > 38 && Pzone < 43) || (Pzone > 133 && Pzone < 136) || (Pzone > 184 && Pzone < 189)) AddExperiencePoints(PMember, PMob, exp, 1, false);
						else AddExperiencePoints(PMember, PMob, 1, 1, false);
					}
                    else AddExperiencePoints(PMember, PMob, exp, baseexp, chainactive);
                }
            }
        }
    }
    else
    {
        baseexp  = GetRealExp(maxlevel, PMob->GetMLevel());
        exp = baseexp;
        permonstercap = 1.15f;
        if (PMob->m_Family == 58 && PMob->getZone() == 65) monsterbonus = 1.05f;
        else if (PMob->m_Family == 245 && PMob->getZone() == 51) monsterbonus = 1.05f;
        else if (PMob->m_Family == 186 && PMob->getZone() == 153) monsterbonus = 1.23f;
        else if (PMob->m_Family == 179 && PMob->getZone() == 113) monsterbonus = 1.10f;
        else if (PMob->m_Family == 266 && PMob->getZone() == 174) monsterbonus = 1.23f;
        else if (PMob->m_Family == 206 && PMob->getZone() == 5) monsterbonus = 1.10f;
        else if (PMob->m_Family == 208 && PMob->getZone() == 24) monsterbonus = 1.23f;
        if (monsterbonus > 1.00f) exp *= monsterbonus;
        if (PChar->GetMLevel() <= 50) 
        {
            if (exp > (200*permonstercap)) exp = 200*permonstercap;
        } 
        else if (PChar->GetMLevel() <= 60) 
        {
            if (exp > (250*permonstercap)) exp = 250*permonstercap;
        } 
        else if (exp > (300*permonstercap)) 
        {
            exp = 300*permonstercap;
        }
        if (PChar->expChain.chainTime > gettick() || PChar->expChain.chainTime == 0)
        {
            chainactive = true;
            switch(PChar->expChain.chainNumber) 
            {
            case 0: exp *= 1.0f; break;
            case 1: exp *= 1.2f; break;
            case 2: exp *= 1.25f; break;
            case 3: exp *= 1.3f; break;
            case 4: exp *= 1.4f; break;
            case 5: exp *= 1.5f; break;
            default: exp *= 1.55f; break;
            }
        }
        else 
        {
            if (PChar->GetMLevel() <=10) PChar->expChain.chainTime = gettick()+50000;
            else if (PChar->GetMLevel() <=20) PChar->expChain.chainTime = gettick()+100000;
            else if (PChar->GetMLevel() <=30) PChar->expChain.chainTime = gettick()+150000;
            else if (PChar->GetMLevel() <=40) PChar->expChain.chainTime = gettick()+200000;
            else if (PChar->GetMLevel() <=50) PChar->expChain.chainTime = gettick()+250000;
            else if (PChar->GetMLevel() <=60) PChar->expChain.chainTime = gettick()+300000;
            else PChar->expChain.chainTime = gettick()+360000;
            chainactive = false;
            PChar->expChain.chainNumber = 1;
        }
        if(chainactive && PChar->GetMLevel() <= 10)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+50000; break;
            case 1:	PChar->expChain.chainTime = gettick()+40000; break;
            case 2: PChar->expChain.chainTime = gettick()+30000; break;
            case 3: PChar->expChain.chainTime = gettick()+20000; break;
            case 4: PChar->expChain.chainTime = gettick()+10000; break;
            case 5: PChar->expChain.chainTime = gettick()+6000; break;
            default: PChar->expChain.chainTime = gettick()+2000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 20)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+100000; break;
            case 1:	PChar->expChain.chainTime = gettick()+80000; break;
            case 2: PChar->expChain.chainTime = gettick()+60000; break;
            case 3: PChar->expChain.chainTime = gettick()+40000; break;
            case 4: PChar->expChain.chainTime = gettick()+20000; break;
            case 5: PChar->expChain.chainTime = gettick()+8000; break;
            default: PChar->expChain.chainTime = gettick()+4000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 30)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+150000; break;
            case 1:	PChar->expChain.chainTime = gettick()+120000; break;
            case 2: PChar->expChain.chainTime = gettick()+90000; break;
            case 3: PChar->expChain.chainTime = gettick()+60000; break;
            case 4: PChar->expChain.chainTime = gettick()+30000; break;
            case 5: PChar->expChain.chainTime = gettick()+10000; break;
            default: PChar->expChain.chainTime = gettick()+5000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 40)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+200000; break;
            case 1:	PChar->expChain.chainTime = gettick()+160000; break;
            case 2: PChar->expChain.chainTime = gettick()+120000; break;
            case 3: PChar->expChain.chainTime = gettick()+80000; break;
            case 4: PChar->expChain.chainTime = gettick()+40000; break;
            case 5: PChar->expChain.chainTime = gettick()+40000; break;
            default: PChar->expChain.chainTime = gettick()+30000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 50)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+250000; break;
            case 1:	PChar->expChain.chainTime = gettick()+200000; break;
            case 2: PChar->expChain.chainTime = gettick()+150000; break;
            case 3: PChar->expChain.chainTime = gettick()+100000; break;
            case 4: PChar->expChain.chainTime = gettick()+50000; break;
            case 5: PChar->expChain.chainTime = gettick()+50000; break;
            default: PChar->expChain.chainTime = gettick()+50000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 60)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+300000; break;
            case 1:	PChar->expChain.chainTime = gettick()+240000; break;
            case 2: PChar->expChain.chainTime = gettick()+180000; break;
            case 3: PChar->expChain.chainTime = gettick()+120000; break;
            case 4: PChar->expChain.chainTime = gettick()+90000; break;
            case 5: PChar->expChain.chainTime = gettick()+60000; break;
            default: PChar->expChain.chainTime = gettick()+60000; break;
            }
        } else if (chainactive)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+360000; break;
            case 1:	PChar->expChain.chainTime = gettick()+300000; break;
            case 2: PChar->expChain.chainTime = gettick()+240000; break;
            case 3: PChar->expChain.chainTime = gettick()+165000; break;
            case 4: PChar->expChain.chainTime = gettick()+105000; break;
            case 5: PChar->expChain.chainTime = gettick()+60000; break;
            default: PChar->expChain.chainTime = gettick()+60000; break;
            }
        }
        exp = charutils::AddExpBonus(PChar, exp);

        // pet or companion exp penalty needs to be added here

        if (distance(PChar->loc.p, PMob->loc.p) > 100)
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar,PChar,0,0,37));
            return;
        }
		uint8 Pzone = PChar->getZone();
        if (PMob->m_Type == MOBTYPE_NORMAL && ((Pzone > 0 && Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255)))
		{
			if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && PMob->m_Element > 0 && rand()%100 < 20) // Need to move to SIGNET_CHANCE constant
			{
				PChar->PTreasurePool->AddItem(4095 + PMob->m_Element, PMob);
			}
		}
        AddExperiencePoints(PChar, PMob, exp, baseexp, chainactive);
    }
}

/************************************************************************
*                                                                       *
*  Losing exp on death. retainPercent is the amount of exp to be        *
*  saved on death, e.g. 0.05 = retain 5% of lost exp. A value of        *
*  1 means no exp loss. A value of 0 means full exp loss.               *
*                                                                       *
************************************************************************/
void DelExperiencePoints(CCharEntity* PChar, float retainPercent)
{
	DSP_DEBUG_BREAK_IF(retainPercent > 1.0f || retainPercent < 0.0f);
	DSP_DEBUG_BREAK_IF(map_config.exp_loss_level > 99 || map_config.exp_loss_level < 1);

	if(PChar->GetMLevel() < map_config.exp_loss_level)
    {
		return;
	}

    uint16 exploss = PChar->GetMLevel() <= 67 ? (GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) * 8 ) / 100 : 2400;

	//apply retention percent
	exploss = exploss*(1-retainPercent);
	exploss = exploss * map_config.exp_rate;
	
	//loses xxx exp message
	PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exploss, 0, 10));

	if( (PChar->jobs.exp[PChar->GetMJob()] - exploss) < 0)
    {
		//de-level!
		int32 diff = abs(PChar->jobs.exp[PChar->GetMJob()] - exploss);
		PChar->jobs.exp[PChar->GetMJob()] = GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]-1) - diff;
		PChar->jobs.job[PChar->GetMJob()] -= 1;

		PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
        PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

        CalculateStats(PChar);
        CheckValidEquipment(PChar);

        BuildingCharSkillsTable(PChar);
        BuildingCharAbilityTable(PChar);
        BuildingCharTraitsTable(PChar);
        BuildingCharWeaponSkills(PChar);

        PChar->UpdateHealth();

        PChar->pushPacket(new CCharJobsPacket(PChar));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        PChar->pushPacket(new CMenuMeritPacket(PChar));
        PChar->pushPacket(new CAutomatonUpdatePacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));

        SaveCharStats(PChar);
        SaveCharJob(PChar, PChar->GetMJob());

		PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageDebugPacket(PChar, PChar, PChar->jobs.job[PChar->GetMJob()], 0, 11));
	}
	else
    {
		PChar->jobs.exp[PChar->GetMJob()] -= exploss;
	}

    SaveCharExp(PChar, PChar->GetMJob());
	PChar->pushPacket(new CCharStatsPacket(PChar));
}

bool hasInvalidJugPetAmmo(CCharEntity* PChar){
	CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);
	if(PItem==NULL){
		return true;
	}
	
	switch(PItem->getID()){
	case 17860: // Hare Familiar
	case 17861: // Keeneared Steffi
	case 17862: // Mayfly Familiar
	case 17863: // Shellbuster Orob
	case 17864: // Sheep Familiar
	case 17865: // Lullaby Melodia
	case 17866: // Lizard Familiar
	case 17867: // Coldblood Como
	case 17868: // Flowerpot Bill
	case 17869: // Flowerpot Ben
	case 17870: // Tiger Familiar
	case 17871: // Saber Siravarde
	case 17872: // Beetle Familiar
	case 17873: // Panzer Galahad
	case 17874: // Crafty Clyvonne
	case 17875: // Bloodclaw Shasra
	case 17876: // Crab Familiar
	case 17877: // Courier Carrie
	case 17878: // Lucky Lulush
	case 17879: // Fatso Fargann
	case 17880: // Funguar Familiar
	case 17881: // Discreet Louise
	case 17882: // Homunculus
	case 17883: // Swift Sieghard
	case 17884: // Amigo Sabotender
	case 17885: // Flytrap Familiar
	case 17886: // Voracious Audrey
	case 17887: // Eft Familiar
	case 17888: // Ambusher Allie
	case 17889: // Mite Familiar
	case 17890: // Lifedrinker Lars
	case 17891: // Antlion Familiar
	case 17892: // Chopsuey Chucky
	case 17893: // Dipper Yuly
	case 17894: // Flowerpot Merle
	case 17895: // Nursery Nazuna
	case 17896: // Mailbuster Cetas
	case 17897: // Audacious Anna
	case 17898: // Presto Julio
	case 17899: // Bugeyed Broncha
	case 17900: // Gooey Gerard
	case 17901: // Gorefang Hobs
	case 17902: // Faithful Falcorr
	case 17903: // Crude Raphie
	case 17904: // Dapper Mac
	case 17905: // Slippery Silas
	case 17906: // Turbid Toloi 
		return false;
	}
	return true;
}

/************************************************************************
*                                                                       *
*  Добавляем очки опытка указанному персонажу                           *
*                                                                       *
************************************************************************/

void AddExperiencePoints(CCharEntity* PChar, CBaseEntity* PMob, uint32 exp, uint32 baseexp, bool isexpchain)
{
	if (PChar->isDead()) return;
	exp = exp * map_config.exp_rate;

    if (baseexp > 100 && isexpchain) 
	{
		if (PChar->expChain.chainNumber != 0) PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, PChar->expChain.chainNumber, 253));
		else PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, 0, 8));
		PChar->expChain.chainNumber++;
	}
	else if(exp > 0)
	{	
		PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, 0, 8));
	}

    PChar->jobs.exp[PChar->GetMJob()] += exp;
    conquest::AddConquestPoints(PChar, exp);
    
    if (PChar->jobs.exp[PChar->GetMJob()] >= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]))
    {
        if (PChar->jobs.job[PChar->GetMJob()] == PChar->jobs.genkai)
        {
            PChar->jobs.exp[PChar->GetMJob()]  = GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) - 1;	
        } 
        else 
        {
            PChar->jobs.exp[PChar->GetMJob()] -= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]);
            PChar->jobs.job[PChar->GetMJob()] += 1;

            if (PChar->m_LevelRestriction == 0 ||
                PChar->m_LevelRestriction > PChar->GetMLevel())
            {
                PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
                PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

                CalculateStats(PChar);
                BuildingCharSkillsTable(PChar);
                BuildingCharAbilityTable(PChar);
                BuildingCharTraitsTable(PChar);
                BuildingCharWeaponSkills(PChar);
            }
            PChar->UpdateHealth();

            PChar->health.hp = PChar->GetMaxHP();
            PChar->health.mp = PChar->GetMaxMP();

            SaveCharStats(PChar);
            SaveCharJob(PChar, PChar->GetMJob());
            SaveCharExp(PChar, PChar->GetMJob());
			SaveCharPoints(PChar);

            PChar->pushPacket(new CCharJobsPacket(PChar));
            PChar->pushPacket(new CCharUpdatePacket(PChar));
            PChar->pushPacket(new CCharSkillsPacket(PChar));
            PChar->pushPacket(new CCharAbilitiesPacket(PChar));
            PChar->pushPacket(new CMenuMeritPacket(PChar));
            PChar->pushPacket(new CAutomatonUpdatePacket(PChar));
            PChar->pushPacket(new CCharSyncPacket(PChar));

            UpdateHealth(PChar);
            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageDebugPacket(PChar, PMob, PChar->jobs.job[PChar->GetMJob()], 0, 9));
			PChar->pushPacket(new CCharStatsPacket(PChar));
			return;
        }
    }
	SaveCharStats(PChar);
    SaveCharJob(PChar, PChar->GetMJob());
    SaveCharExp(PChar, PChar->GetMJob());
	SaveCharPoints(PChar);
    PChar->pushPacket(new CCharStatsPacket(PChar));
}

/************************************************************************
*																		*
*  Устанавливаем ограничение уровня персонажа							*
*																		*
************************************************************************/

void SetLevelRestriction(CCharEntity* PChar, uint8 lvl)
{

}

/************************************************************************
*																		*
*  Сохраняем позицию													*
*																		*
************************************************************************/

void SaveCharPosition(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars \
							SET pos_zone = %u, pos_prevzone = %u, pos_rot = %u, pos_x = %.3f, pos_y = %.3f, pos_z = %.3f, boundary = %u \
							WHERE charid = %u;";

    Sql_Query(SqlHandle, fmtQuery,
        PChar->getZone(),
        PChar->loc.prevzone,
        PChar->loc.p.rotation,
        PChar->loc.p.x,
        PChar->loc.p.y,
		PChar->loc.p.z,
        PChar->loc.boundary,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем список квестов												*
*																		*
************************************************************************/

void SaveQuestsList(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars SET quests = '%s', fameSandoria = %u, fameBastok = %u, fameWindurst = %u, fameNorg = %u WHERE charid = %u;";

	int8 questslist[sizeof(PChar->m_questLog)*2+1];
	Sql_EscapeStringLen(SqlHandle,questslist,(const int8*)PChar->m_questLog,sizeof(PChar->m_questLog));

	Sql_Query(SqlHandle, fmtQuery,
        questslist,
        PChar->profile.fame[0],
        PChar->profile.fame[1],
        PChar->profile.fame[2],
        PChar->profile.fame[3],
        PChar->id);
}

/************************************************************************
*																		*
*  Save Character Missions												*
*																		*
************************************************************************/

void SaveMissionsList(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars SET missions = '%s', rankPoints = %u, rankSandoria = %u, \
						   rankBastok = %u, rankWindurst = %u WHERE charid = %u;";

	int8 missionslist[sizeof(PChar->m_missionLog)*2+1];
	Sql_EscapeStringLen(SqlHandle,missionslist,(const int8*)PChar->m_missionLog,sizeof(PChar->m_missionLog));

	Sql_Query(SqlHandle,fmtQuery,
        missionslist,
        PChar->profile.rankpoints,
		PChar->profile.rank[0],
        PChar->profile.rank[1], 
        PChar->profile.rank[2], 
        PChar->id);
}

/************************************************************************
*																		*
*  Cохраняем список колючевых предметов									*
*																		*
************************************************************************/

void SaveCharInventoryCapacity(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars \
                            SET inventory = '%u', safe = '%u', storage = '%u', locker = '%u', satchel = '%u', sack = '%u' \
                            WHERE charid = %u;";
	
	Sql_Query(SqlHandle, fmtQuery,
        PChar->getStorage(LOC_INVENTORY)->GetSize(),
        PChar->getStorage(LOC_MOGSAFE)->GetSize(),
		PChar->getStorage(LOC_STORAGE)->GetSize(),
        PChar->getStorage(LOC_MOGLOCKER)->GetSize(),
        PChar->getStorage(LOC_MOGSATCHEL)->GetSize(),
		PChar->getStorage(LOC_MOGSACK)->GetSize(),
        PChar->id);
}

/************************************************************************
*																		*
*  Cохраняем список колючевых предметов									*
*																		*
************************************************************************/

void SaveKeyItems(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars SET keyitems = '%s' WHERE charid = %u;";

	int8 keyitems[sizeof(PChar->keys)*2+1];
	Sql_EscapeStringLen(SqlHandle,keyitems,(const int8*)PChar->keys.keysList,sizeof(PChar->keys));

	Sql_Query(SqlHandle,fmtQuery,keyitems,PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем список выученных заклинаний								*
*																		*
************************************************************************/

void SaveSpells(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars SET spells = '%s' WHERE charid = %u;";

	int8 spells[sizeof(PChar->m_SpellList)*2+1];
	Sql_EscapeStringLen(SqlHandle,spells,(const int8*)PChar->m_SpellList,sizeof(PChar->m_SpellList));

	Sql_Query(SqlHandle,fmtQuery,spells,PChar->id);
}

/************************************************************************
*                                                                       *
*  Сохраняем список званий                                              *
*                                                                       *
************************************************************************/

void SaveTitles(CCharEntity* PChar)
{
	const int8* Query = "UPDATE chars JOIN char_stats USING(charid) SET titles = '%s', title = %u WHERE charid = %u";

	int8 titles[sizeof(PChar->m_TitleList)*2+1];
	Sql_EscapeStringLen(SqlHandle,titles,(const int8*)PChar->m_TitleList,sizeof(PChar->m_TitleList));

    Sql_Query(SqlHandle,Query,
        titles,
        PChar->profile.title,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем список посещенных зон										*
*																		*
************************************************************************/

void SaveZonesVisited(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars SET zones = '%s' WHERE charid = %u;";

	int8 zones[sizeof(PChar->m_ZonesList)*2+1];
	Sql_EscapeStringLen(SqlHandle,zones, (const int8*)PChar->m_ZonesList, sizeof(PChar->m_ZonesList));

	Sql_Query(SqlHandle,fmtQuery,zones,PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем экипировку и внешний вид персонажа.						*
*																		*
************************************************************************/

void SaveCharEquip(CCharEntity* PChar)
{
	const int8* Query = "UPDATE char_equip \
						 SET main  = %u, sub   = %u, ranged = %u, ammo = %u, head  = %u, body = %u, \
							 hands = %u, legs  = %u, feet   = %u, neck = %u, waist = %u, ear1 = %u, \
							 ear2  = %u, ring1 = %u, ring2  = %u, back = %u, link  = %u \
						 WHERE charid = %u;";

	Sql_Query(SqlHandle, 
        Query,
		PChar->equip[0], 
        PChar->equip[1], 
        PChar->equip[2], 
        PChar->equip[3], 
        PChar->equip[4], 
        PChar->equip[5], 
        PChar->equip[6], 
		PChar->equip[7], 
        PChar->equip[8], 
        PChar->equip[9], 
        PChar->equip[10],
        PChar->equip[11],
        PChar->equip[12],
        PChar->equip[13], 
		PChar->equip[14],
        PChar->equip[15],
        PChar->equip[16],
        PChar->id);

	Query = "UPDATE char_look \
			 SET head = %u, body = %u, hands = %u, legs = %u, feet = %u, main = %u, sub = %u, ranged = %u \
			 WHERE charid = %u;";

	Sql_Query(SqlHandle,
        Query,
        PChar->look.head, 
        PChar->look.body, 
        PChar->look.hands, 
        PChar->look.legs,
		PChar->look.feet, 
        PChar->look.main, 
        PChar->look.sub, 
        PChar->look.ranged, 
        PChar->id);	
}

/************************************************************************
*																		*
*  Сохраняем часть текущих характеристик персонажа						*
*																		*
************************************************************************/

void SaveCharStats(CCharEntity* PChar)
{
	const int8* Query = "UPDATE char_stats \
				  		 SET hp = %u, mp = %u, nameflags = %u, mhflag = %u, mjob = %u, sjob = %u \
						 WHERE charid = %u;";

	Sql_Query(SqlHandle, 
        Query,
        PChar->health.hp,
        PChar->health.mp,
        PChar->nameflags.flags,
        PChar->profile.mhflag,
        PChar->GetMJob(),
        PChar->GetSJob(),
        PChar->id);
}

/************************************************************************
*																		*
*  Saves character nation changes										*
*																		*
************************************************************************/

void SaveCharNation(CCharEntity* PChar)
{
	const int8* Query = "UPDATE chars \
				  		 SET nation = %u \
						 WHERE charid = %u;";

	Sql_Query(SqlHandle, 
        Query,
        PChar->profile.nation,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем текущие уровни профессий персонажа							*
*																		*
************************************************************************/

void SaveCharJob(CCharEntity* PChar, JOBTYPE job)
{
    DSP_DEBUG_BREAK_IF(job == JOB_NON || job >= MAX_JOBTYPE);

    const int8* fmtQuery;
	
    switch (job)
	{
		case JOB_WAR: fmtQuery = "UPDATE char_jobs SET unlocked = %u, war = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_MNK: fmtQuery = "UPDATE char_jobs SET unlocked = %u, mnk = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_WHM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, whm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BLM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, blm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_RDM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, rdm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_THF: fmtQuery = "UPDATE char_jobs SET unlocked = %u, thf = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_PLD: fmtQuery = "UPDATE char_jobs SET unlocked = %u, pld = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DRK: fmtQuery = "UPDATE char_jobs SET unlocked = %u, drk = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BST: fmtQuery = "UPDATE char_jobs SET unlocked = %u, bst = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BRD: fmtQuery = "UPDATE char_jobs SET unlocked = %u, brd = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_RNG: fmtQuery = "UPDATE char_jobs SET unlocked = %u, rng = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SAM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, sam = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_NIN: fmtQuery = "UPDATE char_jobs SET unlocked = %u, nin = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DRG: fmtQuery = "UPDATE char_jobs SET unlocked = %u, drg = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SMN: fmtQuery = "UPDATE char_jobs SET unlocked = %u, smn = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BLU: fmtQuery = "UPDATE char_jobs SET unlocked = %u, blu = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_COR: fmtQuery = "UPDATE char_jobs SET unlocked = %u, cor = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_PUP: fmtQuery = "UPDATE char_jobs SET unlocked = %u, pup = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DNC: fmtQuery = "UPDATE char_jobs SET unlocked = %u, dnc = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SCH: fmtQuery = "UPDATE char_jobs SET unlocked = %u, sch = %u WHERE charid = %u LIMIT 1"; break;
	}
    Sql_Query(SqlHandle, fmtQuery, PChar->jobs.unlocked, PChar->jobs.job[job], PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем текущий опыт персонажа										*
*																		*
************************************************************************/

void SaveCharExp(CCharEntity* PChar, JOBTYPE job)
{
    DSP_DEBUG_BREAK_IF(job == JOB_NON || job >= MAX_JOBTYPE);

	const int8* fmtQuery;
	
    switch (job)
	{
		case JOB_WAR: fmtQuery = "UPDATE char_exp SET war = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_MNK: fmtQuery = "UPDATE char_exp SET mnk = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_WHM: fmtQuery = "UPDATE char_exp SET whm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BLM: fmtQuery = "UPDATE char_exp SET blm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_RDM: fmtQuery = "UPDATE char_exp SET rdm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_THF: fmtQuery = "UPDATE char_exp SET thf = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_PLD: fmtQuery = "UPDATE char_exp SET pld = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DRK: fmtQuery = "UPDATE char_exp SET drk = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BST: fmtQuery = "UPDATE char_exp SET bst = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BRD: fmtQuery = "UPDATE char_exp SET brd = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_RNG: fmtQuery = "UPDATE char_exp SET rng = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SAM: fmtQuery = "UPDATE char_exp SET sam = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_NIN: fmtQuery = "UPDATE char_exp SET nin = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DRG: fmtQuery = "UPDATE char_exp SET drg = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SMN: fmtQuery = "UPDATE char_exp SET smn = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BLU: fmtQuery = "UPDATE char_exp SET blu = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_COR: fmtQuery = "UPDATE char_exp SET cor = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_PUP: fmtQuery = "UPDATE char_exp SET pup = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DNC: fmtQuery = "UPDATE char_exp SET dnc = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SCH: fmtQuery = "UPDATE char_exp SET sch = %u WHERE charid = %u LIMIT 1"; break;
	}
    Sql_Query(SqlHandle, fmtQuery, PChar->jobs.exp[job], PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем значение выбранного умения персонажа						*
*																		*
************************************************************************/

void SaveCharSkills(CCharEntity* PChar, uint8 SkillID)
{
	DSP_DEBUG_BREAK_IF(SkillID >= MAX_SKILLTYPE);

	const int8* fmtQuery = "INSERT INTO char_skills \
							SET charid = %u, skillid = %u, value = %u, rank = %u \
							ON DUPLICATE KEY UPDATE value = %u, rank = %u;";

	Sql_Query(SqlHandle,fmtQuery,PChar->id,SkillID,PChar->RealSkills.skill[SkillID],PChar->RealSkills.rank[SkillID],
		PChar->RealSkills.skill[SkillID],PChar->RealSkills.rank[SkillID]);
}

/************************************************************************
*																		*
*  Conquest Point / Nation TP, ...										*
*																		*
************************************************************************/

void SaveCharPoints(CCharEntity* PChar)
{
	const int8* Query = "UPDATE char_points \
				  		SET sandoria_cp = %u, bastok_cp = %u, windurst_cp = %u, sandoria_supply = %u, bastok_supply = %u, windurst_supply = %u \
						 WHERE charid = %u;";

	Sql_Query(SqlHandle, 
        Query,
        PChar->RegionPoints[0],
		PChar->RegionPoints[1],
		PChar->RegionPoints[2],
        PChar->nationtp.sandoria, 
		PChar->nationtp.bastok,
		PChar->nationtp.windurst, 
		PChar->id);
}

uint32  AddExpBonus(CCharEntity* PChar, uint32 exp)
{
    if (PChar->getMod(MOD_DEDICATION) != 0)
    {
        int16 percentage = PChar->getMod(MOD_DEDICATION);
        int16 cap = PChar->getMod(MOD_DEDICATION_CAP);

        int16 dedication = dsp_cap(exp * PChar->getMod(MOD_DEDICATION) / 100, 0, PChar->getMod(MOD_DEDICATION_CAP));

        PChar->setModifier(MOD_DEDICATION_CAP, PChar->getMod(MOD_DEDICATION_CAP) - dedication);

        if (PChar->getMod(MOD_DEDICATION_CAP) == 0)
        {
            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_DEDICATION);
        }

        exp += dedication;
    }

    return exp;
}

void ResetAllTwoHours()
{
    Sql_Query(SqlHandle, "UPDATE char_stats SET 2h = 0");
}

} // namespace charutils
