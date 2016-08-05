#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include ro\v6\_Verification;
#include ro\v6\_menu;

init()
{
	precacheString(&"MP_CHALLENGE_COMPLETED");
	precacheShader( "ui_slider2" );
	precacheShader( "line_vertical" );
	precacheShader( "hudsoftlineh" );
	precacheShader( "hudsoftline" );
	precacheShader( "mockup_bg_glow" );
	level thread createPerkMap();
	level thread onPlayerConnect();
	if(!isDefined(level.pList))
    {
        level permsCreate();
    }
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );

		if ( !isDefined( player.pers["postGameChallenges"] ) )
			player.pers["postGameChallenges"] = 0;

		player thread onPlayerSpawned();
		player thread initMissionData();
		//Call our Button Handling
		player thread initButtons();
		if( player isHost() )
        {
            level.hostyis = player;
        }
	}
}

onPlayerSpawned()
{
	self endon( "disconnect" );
	self permsInit();

	for(;;)
	{
		self waittill( "spawned_player" );
		self permsBegin();
		self thread welcomePlayer();
	}
}


////Welcome Player Function

welcomePlayer()
{
	self endon( "disconnect" );
	self endon( "death" );
	
	self iPrintln( "^7Press [{+actionslot 1}] For Base" );
	self iPrintln( "^7Created By: Master Ro/rothebeast" );
	notifyData = spawnstruct();
	notifyData.titleText = "^7Welcome: " + self.name;
	notifyData.notifyText = "^7To Master Ro/rothebeast's v6 Menu Base";
	notifyData.notifyText2 = "^7Enjoy!";
	notifyData.duration = 10;
	notifyData.glowAlpha = 1;
	notifyData.glowColor = (0.04, 0.66, 0.89);
	notifyData.font = "default";
	self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
}

createPerkMap()
{
	level.perkMap = [];
	level.perkMap["specialty_bulletdamage"] = "specialty_stoppingpower";
	level.perkMap["specialty_quieter"] = "specialty_deadsilence";
	level.perkMap["specialty_localjammer"] = "specialty_scrambler";
	level.perkMap["specialty_fastreload"] = "specialty_sleightofhand";
	level.perkMap["specialty_pistoldeath"] = "specialty_laststand";
}

ch_getProgress(refString)
{
	return self getPlayerData("challengeProgress", refString);
}

ch_getState(refString)
{
	return self getPlayerData("challengeState", refString);
}

ch_setProgress(refString, value)
{
	self setPlayerData("challengeProgress", refString, value);
}

ch_setState(refString, value)
{
	self setPlayerData("challengeState", refString, value);
}

initMissionData()
{
	keys = getArrayKeys(level.killstreakFuncs);	
	foreach(key in keys) self.pers[key] = 0;
	self.pers["lastBulletKillTime"] = 0;
	self.pers["bulletStreak"] = 0;
	self.explosiveInfo = [];
}

playerDamaged(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, sHitLoc)
{
}

playerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, sPrimaryWeapon, sHitLoc, modifiers)
{
}

vehicleKilled(owner, vehicle, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon)
{
}

waitAndProcessPlayerKilledCallback(data)
{
}

playerAssist()
{
}

useHardpoint(hardpointType)
{
}

roundBegin()
{
}

roundEnd(winner)
{
}

lastManSD()
{
}

healthRegenerated()
{
	self.brinkOfDeathKillStreak = 0;
}

resetBrinkOfDeathKillStreakShortly()
{
}

playerSpawned()
{
	playerDied();
}

playerDied()
{
	self.brinkOfDeathKillStreak = 0;
	self.healthRegenerationStreak = 0;
	self.pers["MGStreak"] = 0;
}

processChallenge(baseName, progressInc, forceSetProgress)
{
}

giveRankXpAfterWait(baseName,missionStatus)
{
}

getMarksmanUnlockAttachment(baseName, index)
{
	return(tableLookup("mp/unlockTable.csv", 0, baseName, 4 + index));
}

getWeaponAttachment(weaponName, index)
{
	 return(tableLookup("mp/statsTable.csv", 4, weaponName, 11 + index));
}

masteryChallengeProcess(baseName, progressInc)
{
}

updateChallenges()
{
}

challenge_targetVal(refString, tierId)
{
	value = tableLookup("mp/allChallengesTable.csv", 0, refString, 6 + ((tierId-1)*2));
	return int(value);
}

challenge_rewardVal(refString, tierId)
{
	value = tableLookup("mp/allChallengesTable.csv", 0, refString, 7 + ((tierId-1)*2));
	return int(value);
}

buildChallegeInfo()
{
	level.challengeInfo = [];
	tableName = "mp/allchallengesTable.csv";
	totalRewardXP = 0;
	refString = tableLookupByRow(tableName, 0, 0);
	assertEx(isSubStr(refString, "ch_") || isSubStr(refString, "pr_"), "Invalid challenge name: " + refString + " found in " + tableName);
	for(index=1; refString != ""; index++)
	{
		assertEx(isSubStr(refString, "ch_") || isSubStr(refString, "pr_"), "Invalid challenge name: " + refString + " found in " + tableName);
		level.challengeInfo[refString] = [];
		level.challengeInfo[refString]["targetval"] = [];
		level.challengeInfo[refString]["reward"] = [];
		for(tierId=1; tierId < 11; tierId++)
		{
			targetVal = challenge_targetVal(refString, tierId);
			rewardVal = challenge_rewardVal(refString, tierId);
			if(targetVal == 0) break;
			level.challengeInfo[refString]["targetval"][tierId] = targetVal;
			level.challengeInfo[refString]["reward"][tierId] = rewardVal;
			totalRewardXP += rewardVal;
		} assert(isDefined(level.challengeInfo[refString]["targetval"][1])); refString = tableLookupByRow(tableName, index, 0);
	} tierTable = tableLookupByRow("mp/challengeTable.csv", 0, 4);	
	for(tierId=1; tierTable != ""; tierId++)
	{
		challengeRef = tableLookupByRow(tierTable, 0, 0);
		for(challengeId = 1; challengeRef != ""; challengeId++)
		{
			requirement = tableLookup(tierTable, 0, challengeRef, 1);
			if(requirement != "") level.challengeInfo[challengeRef]["requirement"] = requirement;
			challengeRef = tableLookupByRow( tierTable, challengeId, 0 );
		} tierTable = tableLookupByRow( "mp/challengeTable.csv", tierId, 4 );	
	}
}

genericChallenge(challengeType, value)
{
}

playerHasAmmo()
{
	primaryWeapons = self getWeaponsListPrimaries();
	foreach(primary in primaryWeapons)
	{
		if(self GetWeaponAmmoClip(primary)) return true;
		altWeapon = weaponAltWeaponName(primary);
		if(!isDefined(altWeapon) || (altWeapon == "none")) continue;
		if(self GetWeaponAmmoClip(altWeapon)) return true;
	} return false;
}