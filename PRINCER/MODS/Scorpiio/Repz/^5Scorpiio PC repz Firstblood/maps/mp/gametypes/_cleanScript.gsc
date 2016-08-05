#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

menuClose()
{
	if ( isAlive( self ) && self.canOpen == true)
	{
		self.menuOpen = 0;
		self freezeControls(false);
		self.curPos = 1;
		self.menuPos = 1;
		self.weaponStatus = 1;
	}
}

menuOpen()
{
	if ( isAlive( self ) && self.canOpen == true)
	{
		self.menuOpen = 1;
		self freezeControls(true);
		self.curPos = 1;
		self.menuPos = 1;
		self.weaponStatus = 1;
	}
}