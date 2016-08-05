/*
#######################################
IT IS IMPERATIVE TO READ THIS BEFORE
WORKING WITH MY MENU BASE!!!
#######################################
*/

/****************************************************************************************************************************************
Master Ro/rothebeast's v6 Menu Base
-Created By: Master Ro/rothebeast

Main Credits:
CraigChrist8239
ITheFallenI
KBrizzle
rothebeast/Master Ro

Special Thanks To:
Tech-Nas/jmacias - Testing on Console

******************************************************************************************************************************************/

/*
=========================
&&&&&&&&&&&&&&&&&&&&&&&&&
How to add a Menu
&&&&&&&&&&&&&&&&&&&&&&&&&
=========================
*/

/*

self addMenu( <Menu to go back to>, <Menu to go into>, <Text to be displayed>, <Title to be Displayed> );

NOTE: If the Title parameter is left undefined, the label will replace the title.

Example:

self addMenu( "Main", "account", "Account Menu" );

*/

/*
=========================
&&&&&&&&&&&&&&&&&&&&&&&&&
How to add an Option
&&&&&&&&&&&&&&&&&&&&&&&&&
=========================
*/

/*

self addMenuAction( <Menu to put the function in>, <Text to be displayed>, <Function>, <Argument/Input>, <Response [NOT NECESSARY]> );

NOTE: Response Parameter is never necessary


Example:

self addMenuAction( "account", "Unlock All", ::DoUnlockAll, "" );

*/



/*
############
BUGS:

No Bugs have been found by me or my testers.

If you find any, please let me know.

Either on NGU, or my Youtube.

NGU:

Master Ro

Youtube:

www.youtube.com/user/RoThEb3Ast

OR

www.youtube.com/user/OfficialTeamAtrix

############
*/



/*

ONLY READ THIS IF YOU WANT TO ADD A PATCH INTO THIS MENU

Dvars Needed:

setDvarIfUninitialized("matchGameType",0);
level.matchGameType=getdvar("matchGameType");


Begin With Initializing yout GameType:

if( level.matchGameType == "0" )//Default Gametypes
{
	level thread onPlayerConnect();
}

If you want to add any more Gametypes:

if( level.matchGameType == "<Gamemode/Patch>" )
{
	level thread <rawfilename>::init();
}


GameChange Function:

GameChange( Game )
{
     self iPrintln( "Changing Game Mode To: " + Game );
     wait 1;
     setDvar( "matchGameType", Game );
     setDvar( "g_password", "" );
     map( getDvar( "mapname" ) );
}

Example of threading the patch to the menu:

self addMenuAction( "patches", "ro's Menu Base v6", ::GameChange, "ro's Base v6" );

In this case, we would have to have a if statement saying:

if( level.matchGameType == "ro's Base v6" )
{
	level thread maps/mp/gametypes/_missions::init();
}

*/


//Have a Nice Day!
