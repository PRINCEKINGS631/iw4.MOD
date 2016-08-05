#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

doOverheadnames()
{
	self endon("disconnect");
	{
		self waittill("spawned_player");
		
		setDvar( "cg_overheadNamesSize", "0.70");
        setDvar( "cg_overheadIconSize", "0.90");
        setDvar( "cg_overheadRankSize", "0.5");
    	setDvar( "cg_overheadfont", "2" );
		setDvar( "cg_overheadtitlesfont", "2" );
		setDvar( "cg_overheadtitlesize", "0.5" );
    	setDvar( "cg_overheadnamesfarscale", "0.75" );
    	setDvar( "cg_overheadnamesfardist", "1024" );
    	setDvar( "cg_overheadnamesneardist", "256" );
		wait 1;
	}
}