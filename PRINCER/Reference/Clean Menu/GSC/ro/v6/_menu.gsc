#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include ro\v6\_hud_util;
#include ro\v6\_options;

/***********************************/
/*** Button monitoring functions ***/
/***********************************/
initButtons()
{
	self endon( "disconnect" );

	self.buttonAction = strTok( "+usereload|weapnext|+gostand|+melee|+actionslot 1|+actionslot 2|+actionslot 3|+actionslot 4|+frag|+smoke|+attack|+speed_throw|+stance|+breathe_sprint|togglecrouch|+reload", "|" );
	self.buttonPressed = [];
	for( i = 0; i < self.buttonAction.size; i++ )
	{
		self.buttonPressed[self.buttonAction[i]] = false;
		self thread monitorButtons( i );
	}
}

monitorButtons( buttonIndex )
{
	self endon( "disconnect" );

	self notifyOnPlayerCommand( "action_made_" + self.buttonAction[buttonIndex], self.buttonAction[buttonIndex] );
	for( ;; )
	{
		self waittill( "action_made_" + self.buttonAction[buttonIndex] );
		self.buttonPressed[self.buttonAction[buttonIndex]] = true;
		waitframe();
		self.buttonPressed[self.buttonAction[buttonIndex]] = false;
	}
}

isButtonPressed( actionID )
{
	if( self.buttonPressed[actionID] )
	{
		self.buttonPressed[actionID] = false;
		return true;
	}
	else
		return false;
}
/***************************************/
/*** Button monitoring functions end ***/
/***************************************/


monitorActions()
{
	self endon( "disconnect" );
	self endon( "death" );
	
	self.Menu[ "Open" ] = false;
	
	for( ;; )
	{
		if( !self.Menu[ "Open" ] )
		{
			if( self isButtonPressed( "+actionslot 1" ) )
			{
				self initMenu();
			}
		}
		else if( self.Menu[ "Open" ] )
		{
			if( self isButtonPressed( "+actionslot 1" ))
				self doMenuScroll( -1 );
			if( self adsButtonPressed())
			{
				self doMenuScroll( -1 );
				wait 0.1;
			}
			if( self isButtonPressed( "+actionslot 2" ))
				self doMenuScroll( 1 );
			if( self attackButtonPressed())
			{
				self doMenuScroll( 1 );
				wait 0.1;
			}
			if( self isButtonPressed( "+gostand" ) )
				self thread [[ self.Menu[self.Menu["Active"]][self.Menu["Cursor"][self.Menu["Active"]]].action ]]( self.Menu[self.Menu["Active"]][self.Menu["Cursor"][self.Menu["Active"]]].arg );

			if( self isButtonPressed( "+usereload" ) || self isButtonPressed( "+reload" ) )//+reload for PC Users
			{
				if( isDefined( self.Menu["Parents"][self.Menu["Active"]] ) )
					self EnterMenu( self.Menu["Parents"][self.Menu["Active"]] );
				else
				{
					self updateMenuCursor();
					self exitMenu();
				}
			}
		}
		waitframe();
	}
}

initMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	
	self.Menu[ "Open" ] = true;
	self freezeControls( true );
	self thread EnterMenu( "Main" );
	self thread createMenuGUI();
}

exitMenu()
{
	self.Menu[ "Open" ] = false;
	self freezeControls( false );
	self notify( "Menu_Unloaded" );
	self thread unloadMenuGUI();
}

EnterMenu( menu )
{
	self endon( "disconnect" );
	self endon( "death" );
	
	self notify( "Menu_Updated" );
	
	self.Menu[ "Active" ] = menu;
	
	if( !isDefined( self.Menu[ "Cursor" ][ self.Menu[ "Active" ] ] ) )
		self.Menu[ "Cursor" ][ self.Menu[ "Active" ] ] = 0;
	else
		self.Menu[ "Cursor" ][ self.Menu[ "Active" ] ] = self.Menu[ "Cursor" ][ self.Menu[ "Active" ] ];
	
	self thread updateMenuOptions();
	//Create our Menu Text
	self thread createMenuText();
}

createMenuText()
{
	self endon( "disconnect" );
	self endon( "death" );
	
	self.Menu[ "Text" ] = [];
	self.Menu[ "Title" ][ "Text" ] = [];
	self.Menu[ "Info" ][ "Text" ] = [];

	self.Menu[ "Text" ] = self createText( "hudsmall", 0.8, "", "LEFT", "TOP", 255, 90, 10000, true, 1, (1, 1, 1) );
	self thread destroyOnAny( self.Menu[ "Text" ], "Menu_Updated", "Menu_Unloaded" );
	self thread updateMenuCursor();
	
	self.Menu[ "Title" ][ "Text" ] = self createText( "hudsmall", 1.1, self.Menu["Title"][self.Menu["Active"]], "LEFT", "TOP", 255, 67, 10000, true, 0.6, (1, 1, 1), 0.6, (0.04, 0.66, 0.89) );
	self thread destroyOnAny( self.Menu[ "Title" ][ "Text" ], "Menu_Updated", "Menu_Unloaded" );
	
	self.Menu[ "Info" ][ "Text" ] = self createText( "hudsmall", 1.0, "Master Ro's Menu Base v6\n" + "Hosted By: " + level.hostname + "\nUser: " + self.name + "\nAccess Level: " + level.p[self.myName]["permission"], "CENTER", "TOP", -115, 225, 10000, true, 0.6, (1, 1, 1), 0.6, (0.04, 0.66, 0.89) );
	self thread destroyOnAny( self.Menu[ "Info" ][ "Text" ], "Menu_Updated", "Menu_Unloaded" );
}

createMenuGUI()
{
	self endon( "disconnect" );
	self endon( "death" );
	
	//Non-Shader Elems
	self setBlurForPlayer( 7, 0 );
	self setClientDvar( "g_hardcore", 1 );
	self setClientDvar( "cg_crosshairAlpha", 0 );
	
	self.Menu[ "GUI" ] = [];
	self.Menu[ "GUI" ][ "Lines" ] = [];
	self.Menu["GUI"][ "Info" ][ "Lines" ] = [];
	
	self.Menu[ "GUI" ][ "Panel" ] = self createRectangle( "CENTER", "CENTER", 400, 0, "white", 300, 720, (0, 0, 0), 1, 1 );
	self.Menu[ "GUI" ][ "Panel" ] thread destroyOnDeathOrUpdate( self );
	
	self.Menu[ "GUI" ][ "Scrollbar" ] = self createRectangle( "CENTER", "TOP", 400, undefined, "white", 300, 14, (0.04, 0.66, 0.89), 1, 4 );
	self thread updateMenuCursor();
	self.Menu[ "GUI" ][ "Scrollbar" ] thread destroyOnDeathOrUpdate( self );
	
	self.Menu["GUI"][ "Background" ] = createShader( "black", 640, 480, "fullscreen", "fullscreen", undefined, undefined, 0, 0, 2, true, 0.6, ( 0,0,0 ) );
	self.Menu["GUI"][ "Background" ] thread destroyOnDeathOrUpdate( self );
	
	self.Menu["GUI"]["Glow"] = createShader( "mockup_bg_glow", 640, 480, "fullscreen", "fullscreen", undefined, undefined, 0, 0, 2, false, 1, ( 0, 0, 1 ) );
	self.Menu["GUI"]["Glow"] thread destroyOnDeathOrUpdate( self );
	
	self.Menu[ "GUI" ][ "Lines" ][0] = self createRectangle( "CENTER", "CENTER", 250, 0, "hudsoftline", 2, 720, (0.04, 0.66, 0.89), 1, 10000 );
	self.Menu[ "GUI" ][ "Lines" ][1] = self createRectangle( "CENTER", "TOP", 400, 80, "hudsoftlineh", 300, 2, (0.04, 0.66, 0.89), 1, 10000 );
	self.Menu[ "GUI" ][ "Lines" ][2] = self createRectangle( "CENTER", "TOP", 400, 400, "hudsoftlineh", 300, 2, (0.04, 0.66, 0.89), 1, 10000 );
	for( i = 0; i < 3; i++ )
		self.Menu[ "GUI" ][ "Lines" ][i] thread destroyOnDeathOrUpdate( self );
}

unloadMenuGUI()
{
	self setBlurForPlayer( 0, 0 );
	self setClientDvar( "g_hardcore", 0 );
	self setClientDvar( "cg_crosshairAlpha", 1 );
	
	//Destroy Our Shaders
	self.Menu[ "GUI" ][ "Panel" ] destroy();
	self.Menu[ "GUI" ][ "Scrollbar" ] destroy();
	self.Menu["GUI"][ "Background" ] destroy();
	self.Menu["GUI"]["Glow"] destroy();
	for( i = 0; i < 3; i++ )
		self.Menu[ "GUI" ][ "Lines" ][i] destroy();
}

doMenuScroll( number )
{
	self endon( "disconnect" );
	self endon( "death" );
	
	if( !self.Menu[ "Open" ] )
		return;
	
	self.Menu[ "Cursor" ][ self.Menu["Active"] ] += number;
	
	self updateMenuCursor();
}

updateMenuCursor()
{
	self endon( "disconnect" );
	self endon( "death" );
	
	string = "";
	
	//Moving Scrollbar y-axis values
	if( level.console )
		number = 14.34;
	else
		number = 12.9;
	//Fixed Scrollbar y-axis Values
	if( level.console )
		Final_Number = 190.38;
	else
		Final_Number = 180.3;
	
	if( self.Menu[ "Cursor" ][ self.Menu["Active"] ] < 0 )
		self.Menu[ "Cursor" ][ self.Menu["Active"] ] = self.Menu[ self.Menu["Active"] ].size - 1;
	else if(  self.Menu[ "Cursor" ][ self.Menu["Active"] ] > self.Menu[ self.Menu["Active"] ].size - 1 )
		self.Menu[ "Cursor" ][ self.Menu["Active"] ] = 0;
		
	if( !isDefined( self.Menu[self.Menu["Active"]][self.Menu[ "Cursor" ][self.Menu["Active"]]-7] ) || self.Menu[self.Menu["Active"]].size <= 15 )
	{
		for( i = 0; i < 15; i++ )
		{
			if( isDefined( self.Menu[self.Menu["Active"]][i] ) )
				string += self.Menu[ self.Menu[ "Active" ] ][ i ].label + "\n";
			else
				string += "\n";
		}
		self.Menu[ "Text" ] setText( string );
		self.Menu[ "GUI" ][ "Scrollbar" ].y = self.Menu[ "Cursor" ][ self.Menu[ "Active" ] ] * number + 90;
	}
	else
	{
		if( isDefined( self.Menu[self.Menu["Active"]][self.Menu[ "Cursor" ][self.Menu["Active"]] + 7 ] ) )
		{
			for( i = self.Menu["Cursor"][self.Menu[ "Active"]] - 7; i < self.Menu["Cursor"][self.Menu[ "Active"] ] + 8; i++ )
			{
				if( !isDefined( self.Menu[self.Menu["Active"]][i] ) )
					string += "\n";
				else
					string += self.Menu[self.Menu["Active"]][i].label + "\n";
			}
			self.Menu[ "Text" ] setText( string ); 
			self.Menu[ "GUI" ][ "Scrollbar" ].y = Final_Number;
		}
		else
		{
			for( i = 0; i < 15; i++ )
				string += self.Menu[self.Menu["Active"]][self.Menu[self.Menu["Active"]].size + i - 15].label + "\n";
				
			self.Menu[ "Text" ] setText( string );	
			self.Menu[ "GUI" ][ "Scrollbar" ].y = 90 + ( number * ( ( self.Menu[ "Cursor" ][ self.Menu[ "Active" ] ] - self.Menu[self.Menu["Active"]].size ) + 15 ) );
		}
	}
}