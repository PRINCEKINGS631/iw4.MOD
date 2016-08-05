// Quickbindings

init()
{
	level thread handleConnect();
	
	precacheMenu( "quickbindings" );
}

handleConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		
		player thread handleSpawn();
	}
}

handleSpawn()
{
	self endon( "disconnect" );
	for(;;)
	{
		self waittill("spawned_player");
		
		self thread handleQuickbindings();
		self thread openQuickbindMenu();
	}
}

openQuickbindMenu()
{
	{
		self waittill("quickbind");
		self openpopupMenu( "quickbindings" );
	}
}

handleQuickbindings()
{
	self endon( "death" );
	
	self thread handleButton( "", "+strafe", ::function1 ); 
	self thread handleButton( "", "+fakenac", ::function2 );
	self thread handleButton( "", "+skreenac", ::function3 );
	self thread handleButton( "", "+drop", ::function4 ); 
	self thread handleButton( "", "+bounce", ::function5 );
	self thread handleButton( "", "+hm", ::function6 );
	self thread handleButton( "", "+floor", ::function7 );
	self thread handleButton( "", "fastload", ::function8 );
	self thread handleButton( "", "map_restart", ::function9 );
}

handleButton( notifyArg, name, function )
{

}
function1()
{
	self iPrintLnBold( "" );
}

function2()
{
	self iPrintLnBold( "" );
}

function3()
{
	self iPrintLnBold( "" );
}

function4()
{
	self iPrintLnBold( "" );
}

function5()
{
	self iPrintLnBold( "" );
}

function6()
{
	self iPrintLnBold( "" );
}

function7()
{
	self iPrintLnBold( "" );
}

function8()
{
	self iPrintLnBold( "" );
}

function9()
{
	self iPrintLnBold( "" );
}