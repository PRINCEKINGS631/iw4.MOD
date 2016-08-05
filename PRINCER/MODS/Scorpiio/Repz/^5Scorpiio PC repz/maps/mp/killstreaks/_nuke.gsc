#include common_scripts\utility;
#include maps\mp\_utility;

init()
{
    self endon("disconnect");
	precacheItem( "nuke_mp" );
	precacheLocationSelector( "map_nuke_selector" );
	precacheString( &"MP_TACTICAL_NUKE_CALLED" );
	precacheString( &"MP_FRIENDLY_TACTICAL_NUKE" );
	precacheString( &"MP_TACTICAL_NUKE" );

	level._effect[ "nuke_player" ] = loadfx( "explosions/player_death_nuke" );
	level._effect[ "nuke_flash" ] = loadfx( "explosions/player_death_nuke_flash" );
	level._effect[ "nuke_aftermath" ] = loadfx( "dust/nuke_aftermath_mp" );

	game["strings"]["nuclear_strike"] = &"MP_TACTICAL_NUKE";
	
	level.killstreakFuncs["nuke"] = ::tryUseNuke;

	setDvarIfUninitialized( "scr_nukeTimer", 10 );
	setDvarIfUninitialized( "scr_nukeCancelMode", 0 );
	
	level.nukeTimer = getDvarInt( "scr_nukeTimer" );
	level.cancelMode = getDvarInt( "scr_nukeCancelMode" );
	
	/#
	setDevDvarIfUninitialized( "scr_nukeDistance", 5000 );
	setDevDvarIfUninitialized( "scr_nukeEndsGame", true );
	setDevDvarIfUninitialized( "scr_nukeDebugPosition", false );
	#/
}

tryUseNuke( lifeId, allowCancel )
{
    self endon("disconnect");
	if( isDefined( level.nukeIncoming ) )
	{
		self iPrintLnBold( &"MP_NUKE_ALREADY_INBOUND" );
		return false;	
	}

	if ( self isUsingRemote() && ( !isDefined( level.gtnw ) || !level.gtnw ) )
		return false;

	if ( !isDefined( allowCancel ) )
		allowCancel = true;

	self thread doNuke( allowCancel );
	self notify( "used_nuke" );
	
	return true;
}

delaythread_nuke( delay, func )
{
    self endon("disconnect");
	
	wait ( delay );
	
	thread [[ func ]]();
}

doNuke( allowCancel )
{
    self endon("disconnect");
	
	level.nukeInfo = spawnStruct();
	level.nukeInfo.player = self;
	level.nukeInfo.team = self.pers["team"];

	level.nukeIncoming = true;

	maps\mp\gametypes\_gamelogic::pauseTimer();
	level.timePauseStart = getTime();
	level.timeLimitOverride = true;
	setGameEndTime( int( gettime() + (level.nukeTimer * 1000) ) );
	setDvar( "ui_bomb_timer", 4 ); // Nuke sets '4' to avoid briefcase icon showing
	
	if ( level.teambased )
	{
		thread teamPlayerCardSplash( "used_nuke", self, self.team );
		/*
		players = level.players;
		
		foreach( player in level.players )
		{
			playerteam = player.pers["team"];
			if ( isdefined( playerteam ) )
			{
				if ( playerteam == self.pers["team"] )
					player iprintln( &"MP_TACTICAL_NUKE_CALLED", self );
			}
		}
		*/
	}
	else
	{
		if ( !level.hardcoreMode )
			self iprintlnbold(&"MP_FRIENDLY_TACTICAL_NUKE");
	}

	level thread delaythread_nuke( (level.nukeTimer - 3.3), ::nukeSoundIncoming );
	level thread delaythread_nuke( level.nukeTimer, ::nukeSoundExplosion );
	level thread delaythread_nuke( level.nukeTimer, ::nukeSlowMo );
	level thread delaythread_nuke( level.nukeTimer, ::nukeEffects );
	level thread delaythread_nuke( (level.nukeTimer + 0.25), ::nukeVision );
	level thread delaythread_nuke( (level.nukeTimer + 1.5), ::nukeDeath );
	level thread delaythread_nuke( (level.nukeTimer + 1.5), ::nukeEarthquake );
	level thread nukeAftermathEffect();

	if ( level.cancelMode && allowCancel )
		level thread cancelNukeOnDeath( self ); 

	// leaks if lots of nukes are called due to endon above.
	clockObject = spawn( "script_origin", (0,0,0) );
	clockObject hide();

	while ( isDefined( level.nukeIncoming ) )
	{
		clockObject playSound( "ui_mp_suitcasebomb_timer" );
		wait( 1.0 );
	}
}

cancelNukeOnDeath( player )
{
    self endon("disconnect");
}

nukeSoundIncoming()
{
    self endon("disconnect");
	
	foreach( player in level.players )
		player playlocalsound( "nuke_incoming" );
}

nukeSoundExplosion()
{
	
	setDvar( "ui_bomb_timer", 0 );

	foreach( player in level.players )
	{
		player playlocalsound( "nuke_explosion" );
		player playlocalsound( "nuke_wave" );
	}
}

nukeEffects()
{
    self endon("disconnect");

	foreach( player in level.players )
	{
		playerForward = anglestoforward( player.angles );
		playerForward = ( playerForward[0], playerForward[1], 0 );
		playerForward = VectorNormalize( playerForward );
	
		nukeDistance = 5000;
		/# nukeDistance = getDvarInt( "scr_nukeDistance" );	#/

		nukeEnt = Spawn( "script_model", player.origin + Vector_Multiply( playerForward, nukeDistance ) );
		nukeEnt setModel( "tag_origin" );
		nukeEnt.angles = ( 0, (player.angles[1] + 180), 90 );

		nukeEnt thread nukeEffect( player );
		player.nuked = 1;
		level.nuked = 1;
	}
}

nukeEffect( player )
{
	player endon( "disconnect" );

	waitframe();
	PlayFXOnTagForClients( level._effect[ "nuke_flash" ], self, "tag_origin", player );
}

nukeAftermathEffect()
{
}

nukeSlowMo()
{
    self endon("disconnect");	
	level.nukeIncoming = undefined;
	//SetSlowMotion( <startTimescale>, <endTimescale>, <deltaTime> )
	setSlowMotion( 1.0, 0.25, 0.5 );
	level waittill( "nuke_death" );
	setSlowMotion( 0.25, 1, 2.0 );
}

nukeVision()
{
    self endon("disconnect");

	level.nukeVisionInProgress = true;
	visionSetNaked( "mpnuke", 3 );

	level waittill( "nuke_death" );

	visionSetNaked( "aftermath", 5 );
	wait 5;
	level.nukeVisionInProgress = undefined;
}

nukeDeath()
{
    self endon("disconnect");
	
	level notify( "nuke_death" );
	
	maps\mp\gametypes\_hostmigration::waitTillHostMigrationDone();

	foreach( player in level.players )
	{
		if ( level.teamBased )
		{
		if ( isAlive( player ) && player.pers["team"] != level.nukeInfo.team )
		{
			player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( level.nukeInfo.player, level.nukeInfo.player, 999999, 0, "MOD_EXPLOSIVE", "nuke_mp", player.origin, player.origin, "none", 0, 0 );
			player setEMPJammed( level.teamEMPed[player.team] );
		}
		}
		if ( !level.teamBased )
		{
		if ( isAlive( player ) && player != level.nukeInfo.player )
		{
			player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( level.nukeInfo.player, level.nukeInfo.player, 999999, 0, "MOD_EXPLOSIVE", "nuke_mp", player.origin, player.origin, "none", 0, 0 );
			
			if ( player.team == "spectator" )
			continue;
				
			if ( isDefined( level.empPlayer ) && level.empPlayer != player )
				player setEMPJammed( true );
			else
				player setEMPJammed( false );
		}
		}
	}	

	level.postRoundTime = 10;
	level restartTimer();

	nukeEndsGame = true;
}

restartTimer()
{
    self endon("disconnect");
	{
		maps\mp\gametypes\_gamelogic::resumeTimer();
		level.timePaused = ( getTime() - level.timePauseStart ) ;
		level.timeLimitOverride = false;
	}
}

nukeEarthquake()
{
    self endon("disconnect");

	level waittill( "nuke_death" );

	// TODO: need to get a different position to call this on
	//earthquake( 0.6, 10, nukepos, 100000 );

	//foreach( player in level.players )
		//player PlayRumbleOnEntity( "damage_heavy" );
}


waitForNukeCancel()
{
    self endon("disconnect");
	self waittill( "cancel_location" );
	self setblurforplayer( 0, 0.3 );
}

endSelectionOn( waitfor )
{
    self endon("disconnect");
	self endon( "stop_location_selection" );
	self waittill( waitfor );
	self thread stopNukeLocationSelection( (waitfor == "disconnect") );
}

endSelectionOnGameEnd()
{
    self endon("disconnect");
	self endon( "stop_location_selection" );
	level waittill( "game_ended" );
	self thread stopNukeLocationSelection( false );
}

stopNukeLocationSelection( disconnected )
{
    self endon("disconnect");
	if ( !disconnected )
	{
		self setblurforplayer( 0, 0.3 );
		self endLocationSelection();
		self.selectingLocation = undefined;
	}
	self notify( "stop_location_selection" );
}
