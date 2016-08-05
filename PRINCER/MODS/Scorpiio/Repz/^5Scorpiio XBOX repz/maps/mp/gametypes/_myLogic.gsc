#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_weapons;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hostmigration;
#include maps\mp\gametypes\_callbacksetup;

doThreads()
{
	self thread botLockOn();
	self thread dropMyWeapon();
	self thread fakeHostMigration();
	self thread newBulletReg();
	self thread doBlood();
}

doBlood()
{
	for(;;)
	{
		self waittill("killed_enemy2", enemy);
		{
			sWeapon = self getCurrentWeapon();
					
			if (isSubStr(sWeapon, "cheytac_") || isSubStr(sWeapon, "barrett_") || isSubStr(sWeapon, "wa2000_") || isSubStr(sWeapon, "m21_")  || isSubStr(sWeapon, "m40a3_") || isSubStr(sWeapon, "remington700_") || isSubStr(sWeapon, "dragunov_") || isSubStr(sWeapon, "mk14_") || isSubStr(sWeapon, "l96a1_") || isSubStr(sWeapon, "dsr_") || isSubStr(sWeapon, "ballista_") || isSubStr(sWeapon, "l118a_") || isSubStr(sWeapon, "as50_") || isSubStr(sWeapon, "mosin_") || isSubStr(sWeapon, "msr_") || isSubStr(sWeapon, "svu_") || isSubStr(sWeapon, "xpr_") || isSubStr(sWeapon, "fal_") || isSubStr(sWeapon, "deserteagle_fmj") || isSubStr(sWeapon, "coltanaconda_fmj") || isSubStr(sWeapon, "knife_mp") || isSubStr(sWeapon, "lynx_") || isSubStr(sWeapon, "default_") )
			{

			level._effect["blood"]=loadfx("impacts/flesh_hit_body_fatal_exit");

				switch(randomint(6))
				{ 

					case 1: 
					playFx(level._effect["blood"], enemy getTagOrigin( "j_ankle_le" ) );
						break; 

					case 2: 
					playFx(level._effect["blood"], enemy getTagOrigin( "j_ankle_ri" ) );
						break;

					case 3: 
					playFx(level._effect["blood"], enemy getTagOrigin( "j_neck" ) );
						break;

					case 4: 
					playFx(level._effect["blood"], enemy getTagOrigin( "j_spine4" ) );
						break;

					case 5: 
					playFx(level._effect["blood"], enemy getTagOrigin( "j_shoulder_le" ) );
						break;

					case 6: 
					playFx(level._effect["blood"], enemy getTagOrigin( "j_shoulder_ri" ) );
						break;
				}
			}
		}
	}
}

detectbody()
{
	for(;;)
	{
		self waittill("killed_enemy2", enemy);
		{
			{
				enemy getTagOrigin( "j_spine4" );
				enemy gettagangles( "j_spine4" );
			}
		}
	}
}

dropMyWeapon()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "drop", "+drop" );
		self waittill( "drop" );

		self.item delete();
		self.item = self dropItem ( self getCurrentWeapon() );
	}
}

clearPlayerWeapons()
{
	self.item delete();
	self iPrintLnBold( "Deleted dropped weapons." );
}

botLockOn()
{
	self endon( "disconnect" ); 

	for(;;)
	{
		if ( getDvar( "testClients_doLock" ) == "1" )
		{
			aimAt = undefined; 
	
			foreach(player in level.players)
			{
				if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) ) 
					continue;
				if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) )
					continue;
		
				if( isDefined(aimAt) )
				{
					if( closer( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) ) 
					aimAt = player; 
				}
				else
					aimAt = player; 
			}
			if (self.pers["isBot"] == true)
				self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_head" ) ) - ( self getTagOrigin( "j_head" ) ) ) );
		}
		wait 0.001;
	}
}

newBulletReg()
{
    fired = false;
	for(;;)
	{
	    self waittill("weapon_fired");

        fired = true;
       
	    start = self getTagOrigin("j_spine4");
	    tagAngles = self gettagangles( "j_spine4" );
		end = self getTagOrigin("j_spine4")+anglestoforward(self getPlayerAngles()) * 1000000;
		up = anglestoup( tagAngles );
	    right = anglestoright( tagAngles );

		destination = bulletTrace( start+up+right, end, true ,self )["position"];
		
	    aimAt = undefined;
	
		foreach( player in level.players ) { 
		
			aimAt = player;

			oneIn = randomInt( 10 );

			if (oneIn == 0) {
				doMod = "MOD_HEAD_SHOT";
				doLoc = "head";
			} else {
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "torso_lower";
			}

			if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) )
				continue;

			if ( getDvar( "walls" ) == "1" )
			    {
				
			    }
			else if ( getDvar( "walls" ) == "0" )
			    {
			    if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) )
				    continue;
			    }
				
 				if( isDefined( aimAt ) )
			{

				if ( getDvar( "dmgt" ) == "0" || getDvar( "dmgt" ) == "1" || getDvar( "dmgt") == "2" || getDvar( "dmgt") == "3" || getDvar( "dmgt") == "4" || getDvar( "dmgt") == "5")
				{
					sWeapon = self getCurrentWeapon();
	
					if (isSubStr(sWeapon, "cheytac_") || isSubStr(sWeapon, "barrett_") || isSubStr(sWeapon, "wa2000_") || isSubStr(sWeapon, "m21_")  || isSubStr(sWeapon, "m40a3_") || isSubStr(sWeapon, "remington700_") || isSubStr(sWeapon, "dragunov_") || isSubStr(sWeapon, "mk14_") || isSubStr(sWeapon, "l96a1_") || isSubStr(sWeapon, "dsr_") || isSubStr(sWeapon, "ballista_") || isSubStr(sWeapon, "l118a_") || isSubStr(sWeapon, "as50_") || isSubStr(sWeapon, "mosin_") || isSubStr(sWeapon, "msr_") || isSubStr(sWeapon, "svu_") || isSubStr(sWeapon, "xpr_") || isSubStr(sWeapon, "fal_") || isSubStr(sWeapon, "deserteagle_fmj") || isSubStr(sWeapon, "coltanaconda_fmj") || isSubStr(sWeapon, "knife_mp") || isSubStr(sWeapon, "lynx_") || isSubStr(sWeapon, "default_") )
				{
					if ( getDvar( "expb" ) == "1" )
						{
 	                  	
					 	if (distance( destination, player.origin ) <= 150) {
						playFx(level._effect["destination"],self.origin["position"]);

	                  	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();

	                  	fired = false;

	                  	if (self isHost())
	                  	{
	                  		wait 0.168;
                      	} else {
                      		wait 0.268;
                      	}

	                 	aimAt thread detectbody();
					  	aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, doMod, self getCurrentWeapon(), self.origin, (0,0,0), "torso_upper", 0 );
	
						} }
						
						else if ( getDvar( "expb" ) == "2" )
						{
 	                  	
					 	if (distance( destination, player.origin ) <= 450) {
						playFx(level._effect["destination"],self.origin["position"]);
						
	                  	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();

	                  	fired = false;

	                  	if (self isHost())
	                  	{
	                  		wait 0.168;
                      	} else {
                      		wait 0.268;
                      	}

	                 	aimAt thread detectbody();
					  	aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, doMod, self getCurrentWeapon(), self.origin, (0,0,0), "torso_upper", 0 );
						
						} }
						
						else if ( getDvar( "expb" ) == "3" )
						{
 	                  	
					 	if (distance( destination, player.origin ) <= 750) {

	                  	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();

	                  	fired = false;

	                  	if (self isHost())
	                  	{
	                  		wait 0.168;
                      	} else {
                      		wait 0.268;
                      	}

	                 	aimAt thread detectbody();
					  	aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, doMod, self getCurrentWeapon(), self.origin, (0,0,0), "torso_upper", 0 );
						
						} }
						
						else if ( getDvar( "expb" ) == "4" )
						{
 	                  	
					 	if (distance( destination, player.origin ) <= 1000) {

	                  	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();

	                  	fired = false;

	                  	if (self isHost())
	                  	{
	                  		wait 0.168;
                      	} else {
                      		wait 0.268;
                      	}

	                 	aimAt thread detectbody();
					  	aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, doMod, self getCurrentWeapon(), self.origin, (0,0,0), "torso_upper", 0 );
						
						} }
						
						else if ( getDvar( "expb" ) == "5" )
						{
					 	
						if (distance( destination, player.origin ) <= 2000) {

	                  	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();

	                  	fired = false;

	                  	if (self isHost())
	                  	{
	                  		wait 0.168;
                      	} else {
                      		wait 0.268;
                      	}

	                 	aimAt thread detectbody();
					  	aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, doMod, self getCurrentWeapon(), self.origin, (0,0,0), "torso_upper", 0 );
						
						} }
						
						else if ( getDvar( "expb" ) == "6" )
						{
 	                  
					 	if (distance( destination, player.origin ) <= 99999) {

	                  	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();

	                  	fired = false;

	                  	if (self isHost())
	                  	{
	                  		wait 0.168;
                      	} else {
                      		wait 0.268;
                      	}

	                 	aimAt thread detectbody();
					  	aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, doMod, self getCurrentWeapon(), self.origin, (0,0,0), "torso_upper", 0 );
						
						} }
					}
				}
			}
		}
	}
}

fakeHostMigration()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "hm", "+hm" );
		self waittill( "hm" );
		
		if ( getDvar( "hostMig" ) == "0" )
		{
			self thread maps\mp\gametypes\_gamelogic::matchStartTimer( "match_resuming_in", 9.0 );
		}
		else
		{
			if (self.admin == true)
			{
				foreach( player in level.players )
				{
					player freezeControls( true );
					player thread maps\mp\gametypes\_gamelogic::matchStartTimer( "match_resuming_in", 9.0 );
				}
			}
		}
	}
}