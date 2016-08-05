#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_cleanScript;

doThreads()
{
	self thread UFOMODE();
	self thread saveLocation();
	self thread loadLocation();
}

UFOMODE()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "gostand", "+gostand" );
		self waittill( "gostand" );

		if (self.menuOpen == 1 && self.menuPos == 1)
		{
		        maps\mp\gametypes\_spectating::setSpectatePermissions();
	
			if (self.ufo == false)
			{
				self.ufo = true;
	       		        self allowSpectateTeam( "freelook", true );
		                self.sessionstate = "spectator";
				self iPrintLnBold( "^1UFO MODE ON" );
			} 
			else if (self.ufo == true)
			{
				self.ufo = false;
		                self allowSpectateTeam( "freelook", false );
		                self.sessionstate = "playing";
				self iPrintLnBold( "^1UFO MODE OFF" );
			}			
			self thread menuClose();
		}
	}
}

saveLocation()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "melee", "+melee" );
		self waittill( "melee" );

		if (self.menuOpen == 1 && self.menuPos == 1)
		{
			self iPrintLnBold( "^5LOCATION ^3SAVED" );
			self.pers["loc"] = true;
			self.pers["savePos"] = self.origin;
			self.pers["saveAng"] = self.angles;
		}
	}
}

loadLocation()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "reload", "+reload" );
		self waittill( "reload" );

		if (self.menuOpen == 1 && self.menuPos == 1 && self.pers["loc"] == true)
		{
			self setOrigin( self.pers["savePos"] );
			self setPlayerAngles( self.pers["saveAng"] );

			self thread menuClose();
		}
	}
}