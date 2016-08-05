#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

doThreads()
{
	for(;;)
	{
		// Death Barriers
		if ( getDvar( "dbarriers" ) == "0" )
		{
			ents = getEntArray();
    	for ( index = 0; index < ents.size; index++ )
    	{
        	if(isSubStr(ents[index].classname, "trigger_hurt"))
        	ents[index].origin = (0, 0, 9999999);
    	}
			self.dbarriers = "Disabled";
		}
		else if ( getDvar( "dbarriers" ) == "1" )
		{
			self.dbarriers = "Enabled";
		}
	
		// Slow Motion
		if ( getDvar( "timescale" ) == "1" )
			self.slowmoScale = "Off";
		else if ( getDvar( "timescale" ) == "0.75" )
			self.slowmoScale = "75 Percent";
		else if ( getDvar( "timescale" ) == "0.5" )
			self.slowmoScale = "50 Percent";
		else if ( getDvar( "timescale" ) == "0.25" )
			self.slowmoScale = "25 Percent";

		// Bot Dvars
		if ( getDvar( "testClients_doMove" ) == "0" )
			self.bMove = "false";
		else if ( getDvar( "testClients_doMove" ) == "1" )
			self.bMove = "true";

		if ( getDvar( "testClients_doAttack" ) == "0" )
			self.bShoot = "false";
		else if ( getDvar( "testClients_doAttack" ) == "1" )
			self.bShoot = "true";
		
		if ( getDvar( "testClients_doReload" ) == "0" )
			self.bReload = "false";
		else if ( getDvar( "testClients_doReload" ) == "1" )
			self.bReload = "true";
		
		if ( getDvar( "testClients_doLock" ) == "0" )
			self.bLock = "false";
		else if ( getDvar( "testClients_doLock" ) == "1" )
			self.bLock = "true";
		
		if ( getDvar( "testClients_doRespawn" ) == "0" )
			self.bResp = "false";
		else if ( getDvar( "testClients_doRespawn" ) == "1" )
			self.bResp = "true";

		// Explosive Bullets
		if ( getDvar( "expb" ) == "0" )
			self.kos = "Off";
		else if ( getDvar( "expb" ) == "1" )
			self.kos = "150";
		else if ( getDvar( "expb" ) == "2" )
			self.kos = "450";
		else if ( getDvar( "expb" ) == "3" )
			self.kos = "750";
		else if ( getDvar( "expb" ) == "4" )
			self.kos = "1000";
		else if ( getDvar( "expb" ) == "5" )
			self.kos = "2000";
		else if ( getDvar( "expb" ) == "6" )
			self.kos = "Everywhere";
		
		// Damage Type
		if ( getDvar( "dmgt" ) == "0" )
			self.damageLevelStatus = "Snipers and Hitmarkers";
		else if ( getDvar( "dmgt" ) == "1" )
			self.damageLevelStatus = "Intervention Only";
		else if ( getDvar( "dmgt" ) == "2" )
			self.damageLevelStatus = "Barrett Only";
		else if ( getDvar( "dmgt" ) == "3" )
			self.damageLevelStatus = "WA2000 Only";
		else if ( getDvar( "dmgt" ) == "4" )
			self.damageLevelStatus = "M21 Only ";
		else if ( getDvar( "dmgt" ) == "5" )
			self.damageLevelStatus = "Hitmarkers";

		// Super Jump
		if ( getDvar( "superjump" ) == "0" )
		{
			setDvar( "jump_height", "39" ); 

			self.superjump = "Disabled";
		}
		else if ( getDvar( "superjump" ) == "1" )
		{
			setDvar( "jump_height", "420" );

			self.superjump = "Enabled";
		}
		
		// Low Gravity
		if ( getDvar( "lowgrav" ) == "0" )
		{
			self setClientDvar( "g_gravity", "800" );

			self.lowgrav = "Disabled";
		}
		else if ( getDvar( "lowgrav" ) == "1" )
		{
			self setClientDvar( "g_gravity", "220" );

			self.lowgrav = "Enabled";
		}

		// ThirdPerson
		if ( getDvar( "thirdPerson" ) == "0" )
		{
			self setClientDvar( "cg_thirdperson", "0" );

			self.thirdPerson = "Disabled";
		}
		else if ( getDvar( "thirdPerson" ) == "1" )
		{
			self setClientDvar( "cg_thirdperson", "1" );

			self.thirdPerson = "Enabled";
		}

		// Floaters
		if ( getDvar( "floaters" ) == "0" )
		{

			self setClientDvar( "floaters", 0 );

			self.floaters = "Disabled";
			
		}
		else if ( getDvar( "floaters" ) == "1" )
		{

			self setClientDvar( "floaters", 1 );

			self.floaters = "Enabled";
		}
		wait 0.2;
	}
}