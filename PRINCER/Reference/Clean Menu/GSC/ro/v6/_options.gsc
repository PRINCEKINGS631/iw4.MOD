#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include ro\v6\_menu;
#include ro\v6\_Verification;


updateMenuOptions()
{
	self.Menu[ "Title" ] = [];
	self.Menu[ "Parents" ] = [];
	
	self addMenu( undefined, "Main", "Main Menu" );
	
	if( self isAllowed(1) || self isAllowed(2) || self isAllowed(3) || self isAllowed(4) || self isHost() )
	{
		self addMenuAction( "Main", "Test Option 1", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 2", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 3", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 4", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 5", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 6", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 7", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 8", ::MenuTestOpt, "" );
	}
	if( self isAllowed(2) || self isAllowed(3) || self isAllowed(4) || self isHost() )
	{
		self addMenuAction( "Main", "Test Option 9", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 10", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 11", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 12", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 13", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 14", ::MenuTestOpt, "" );
	}
	if( self isAllowed(3) || self isAllowed(4) || self isHost() )
	{
		self addMenuAction( "Main", "Test Option 15", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 16", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 17", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 18", ::MenuTestOpt, "" );
	}
	if( self isAllowed(4) || self isHost() )
	{
		self addMenuAction( "Main", "Test Option 19", ::MenuTestOpt, "" );
		self addMenuAction( "Main", "Test Option 20", ::MenuTestOpt, "" );
		self addMenu( "Main", "Sub-1", "Sub Menu 1" );
	}
	if( self isHost() )
	{
		self addMenu( "Main", "player", "Players" );
	}
	
	/*Sub Menu 1 Options*/
	self addMenuAction( "Sub-1", "Test Option 1", ::MenuTestOpt, "" );
	self addMenuAction( "Sub-1", "Test Option 2", ::MenuTestOpt, "" );
	self addMenuAction( "Sub-1", "Test Option 3", ::MenuTestOpt, "" );
	self addMenuAction( "Sub-1", "Test Option 4", ::MenuTestOpt, "" );
	self addMenuAction( "Sub-1", "Test Option 5", ::MenuTestOpt, "" );
	
	/*Start of Players*/
	
		F = "player";
	
		foreach( player in level.players )
		{
			VeriStat = "";//Blank String
			
			if(level.p[player.myName]["permission"]==4)
			{
			   VeriStat = "[ADMIN]";
			}
			if(level.p[player.myName]["permission"]==3)
			{
			   VeriStat = "[CO-ADMIN]";
			}
			if(level.p[player.myName]["permission"]==2)
			{
				VeriStat = "[V.I.P]";
			}
			if(level.p[player.myName]["permission"]==1)
			{
				VeriStat = "[VERIFIED]";
			}
			if(level.p[player.myName]["permission"]==0)
			{
				VeriStat = "[USER]";
			}
			if( player isHost() )
			{
				VeriStat = "[HOST]";
			}
			
			self addMenu( "player", "player_" + player getTrueName(), VeriStat + player getTrueName() );
			self addMenuAction("player_" + player getTrueName(),"Kill Player",::KillPlayer,player);
			self addMenuAction("player_" + player getTrueName(),"Kick Player",::kickDaHomo,player);
			self addMenuAction("player_" + player getTrueName(),"Remove Access",::permsRemove,player);
			self addMenuAction("player_" + player getTrueName(),"Verify",::permsVerifySet,player);
			self addMenuAction("player_" + player getTrueName(),"V.I.P",::permsVIPSet,player);
			self addMenuAction("player_" + player getTrueName(),"Co-Admin",::permsCoAdminSet,player);
			self addMenuAction("player_" + player getTrueName(),"Administrator",::permsAdminSet,player);
		}
}

addMenu( parent, child, label, title )
{
	if( !isDefined( title ) )
		title = label;
	else
		title = title;
		
	arrSize = self.Menu[parent].size;
	
	self.Menu[parent][arrSize] = spawnStruct();
	self.Menu[parent][arrSize].response = "SubMenu";
	self.Menu[parent][arrSize].label = label;
	self.Menu[parent][arrSize].child = child;
	self.Menu["Title"][child] = title;
	
	self.Menu[child] = [];
	
	self.Menu["Parents"][child] = parent;
	self.Menu[parent][arrSize].action = ::EnterMenu;
	self.Menu[parent][arrSize].arg = child;
	self.Menu["Cursor"][self.Menu[ "Active"]][child] = 0;
}

addMenuAction( menu, label, action, arg, response )
{
	arrSize = self.Menu[menu].size;
	
	self.Menu[menu][arrSize] = spawnStruct();
	self.Menu[menu][arrSize].label = label;
	self.Menu[menu][arrSize].action = action;
	self.Menu[menu][arrSize].arg = arg;
	if( !isDefined( response ) )
		self.Menu[menu][arrSize].response = "Action";
	else
		self.Menu[menu][arrSize].response = response;
}

MenuTestOpt()
{
	self iPrintLnBold( self.Menu["Cursor"][self.Menu["Active"]] );
}

//For Players Menu
//Credits To: CraigChrist8239
getTrueName(playerName)
{
	if(!isDefined(playerName))
		playerName = self.name;

	if (isSubStr(playerName, "]"))
	{
		name = strTok(playerName, "]");
		return name[name.size - 1];
	}
	else
		return playerName;
}