#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

/*************************************** Everything made by Santahunter, Dont remove my Credits! ************************************/

// perk_grenadeDeath remotemissle_projectile_mp // maybe use as a dvar, to change martydom bullet, would be interesting :) 


Init()
{
    logprint("iSnipe Loading...\n");
	logprint("iSnipe Loading..\n");
	logprint("iSnipe Loading.\n");
    printLnConsole("iSnipe loading!...");
	printLnConsole("iSnipe loading!..");
	printLnConsole("iSnipe loading!.");
    level thread onPlayerConnect();
	setObjectiveText( "axis", "Kill all Enemies with a Sniperweapon" );
	setObjectiveText( "allies", "Kill all Enemies with a Sniperweapon" );
	setObjectiveText( "spectators", "Kill all Enemies with a Sniperweapon" );
	precacheShader("cardicon_ghillie");
	precacheShader("cardicon_sniperscope");
	
	
	timelimit = 60;
	scorelimit = 99999;
	level.snipetime = .15; // time till aiming out 
	level.thermalgun = "cheytac_thermal_mp";
	level.secondary = "usp_tactical_mp";
	level.devmode = 0; // 1: spawn bots 
	level.version = 2.2;
	
	setDvar("scr_dm_scorelimit", scorelimit);
    setDvar("scr_dm_timelimit", timelimit);
	setDvar("scr_war_scorelimit", scorelimit);
    setDvar("scr_war_timelimit", timelimit);
	setDvar("scr_ffa_scorelimit", scorelimit);
    setDvar("scr_ffa_timelimit", timelimit);
	setDvar("g_gametype", "iSnipe");
	setDvar("ui_gametype", "iSnipe");
	setDvar("ui_allow_classchange", 0);
	setDvar("party_autoteams", 1);
	setDvar("testClients_watchKillcam", 0);
	
	// level deletePlacedEntity("misc_turret");
	turrets = GetEntArray("misc_turret","classname");
    for(i=0;i<turrets.size;i++)
	    turrets[i] delete();
		
	if(level.devmode == 1)
        level thread bots(16);	
		
	level thread serverHUD();	
	
}

onPlayerConnect()
{
    while(1)
	{
	    level waittill( "connected", player );
		player thread onPlayerSpawned();
        player thread Falldown();	
        player thread StreakHud();		
		player.chosen = 0;
		player setClientDvar("lowAmmoWarningNoAmmoColor2", 0, 0, 0, 0);
	    player setClientDvar("lowAmmoWarningNoAmmoColor1", 0, 0, 0, 0);
		player thread onSpawn();
	}
}
onSpawn()
{
    self endon("disconnect");
    self waittill("spawned_player");
	wait 2;
	self iPrintlnBold("^3W^7,^3S ^7to scroll! ^3Space ^7to select");
}
onPlayerSpawned()
{
    self endon("disconnect");
	for(;;)
	{
	    self waittill("spawned_player");
		self thread noStreaks();
		self freezecontrols(false);
		self thread Loadout();
		self thread EnableAntiHardScope(level.snipetime);
		//self thread Exchange();
		self thread Clear();
		self thread GiveSkills();
		self thread Killsystem();
		self thread Ratio();
		self.radar = 0;
		self.inheli = 0;
		if(level.devmode == 1)
		    self thread spawnbots(1);
		if(self.guid == "01100001000323e5" || self.guid == "0110000100005bf8")
		    self setRank(self.pers["rank"], 11);	
		self maps\mp\perks\_perks::givePerk( "throwingknife_mp" );
		self setWeaponAmmoClip("throwingknife_mp", 1);
		self.moveSpeedScaler = 1.2;
	    self setMoveSpeedScale(1.2);
	}
}

Clear()
{
    self endon("disconnect");
	self endon("death");
	self notifyonplayercommand("clearit", "+smoke");
	self waittill("clearit");
	self.chosen = 0;
	self iPrintlnBold("You can choose your class on next spawn!");
}

Exchange()
{
    self endon("disconnect");
	self endon("death");
	self notifyonplayercommand("Exchange", "+smoke");
	firstchange = 0;
	for(;;)
	{
	    self waittill("Exchange");
		if(self.inheli == 0){
		if(self getCurrentWeapon() == level.thermalgun)
		{
		    self takeWeapon(self.weapon);
			self giveWeapon(self.weapon);
			self switchToWeapon(self.weapon);			
		}
		else
		{
		    self takeWeapon(self getCurrentWeapon());
			self giveWeapon(level.thermalgun);
			if(firstchange == 0)
			{
			    firstchange = 1;
				self giveMaxAmmo(level.thermalgun);
			}
			self switchToWeapon(level.thermalgun);
		}}
	}
}

Loadout()
{
    self takeAllWeapons();
	self _clearPerks();
    if(self.chosen == 0)
	{
	    self thread CreateMenu();
	}
	else
	{
	    //self.weapon = level.primary[randomInt(level.primary.size)];
	    self giveWeapon(self.weapon, randomInt(8), false);
	    self giveMaxAmmo(self.weapon);
	    self giveWeapon(level.secondary);
	    self setWeaponAmmoClip( "usp_tactical_mp", 0 );
	    self setWeaponAmmoStock( "usp_tactical_mp", 0 );
	    self switchToWeapon(self.weapon);	
	}
}

GiveSkills()
{
    self maps\mp\perks\_perks::givePerk("specialty_marathon"); // marathon pro
	self maps\mp\perks\_perks::givePerk("specialty_fastmantle");
	
	self maps\mp\perks\_perks::givePerk("specialty_lightweight"); // lightweight pro
	self maps\mp\perks\_perks::givePerk("specialty_fastsprintrecovery");
	
	self maps\mp\perks\_perks::givePerk("specialty_fastreload"); // fastreload pro
	self maps\mp\perks\_perks::givePerk("specialty_quickdraw");
	
	self maps\mp\perks\_perks::givePerk("specialty_bulletdamage"); // stopping power pro
	self maps\mp\perks\_perks::givePerk("specialty_armorpiercing");
	
	self maps\mp\perks\_perks::givePerk("specialty_bulletaccuracy"); // steady aim pro
	self maps\mp\perks\_perks::givePerk("specialty_holdbreath");
	
	self maps\mp\perks\_perks::givePerk("specialty_selectivehearing"); // u see what it is
}

EnableAntiHardScope(time)
{
	self endon( "disconnect" );
	self endon( "death" );
	if( !isDefined( time ) || time < 0.05 ) 
		time = 3;
	adsTime = 0;
	for( ;; )
	{ 
	    waitFrame();
	    if(self.inheli == 0)
		{
		    if( self playerAds() == 1 )
			    adsTime ++;
		    else
			    adsTime = 0;
		    if( adsTime >= int( time / 0.05 ) )
		    {
			    adsTime = 0;
			    self allowAds( false );
			    while( self playerAds() > 0 ) 
				    wait( 0.05 );
			    self allowAds( true );
		    }
		    waitFrame();	
		}	
    }
}

serverHUD()
{
    info = level createServerFontString("objective", 0.85);
	info setPoint("TOPRIGHT", "TOPRIGHT", -8, 0);
	info.glowalpha = .5;
	info.glowcolor = ( 1, 0, 0 );
	info setText("Welcome to ^1iG ^3iSnipe ^7Server");
	info.hideWhenInMenu = true;
	
	info2 = level createServerFontString("objective", 0.85);
	info2 setPoint("TOPRIGHT", "TOPRIGHT", -8, 15);
	info2.glowalpha = .5;
	info2.glowcolor = ( 1, 0, 0 );
	info2 setText("Press ^3Q ^7to clear your class!");
	info2.hideWhenInMenu = true;
	
	info3 = level createServerFontString("objective", 0.85);
	info3 setPoint("TOPRIGHT", "TOPRIGHT", -8, 30);
	info3.glowalpha = .5;
	info3.glowcolor = ( 1, 0, 0 );
	info3 setText("Made by ^1Santahunter");
	info3.hideWhenInMenu = true;
	
	info4 = level createServerFontString("objective", 0.85);
	info4 setPoint("TOPRIGHT", "TOPRIGHT", -8, 45);
	info4.glowalpha = .5;
	info4.glowcolor = ( 1, 0, 0 );
	info4 setText("Version " + level.version);
	info4.hideWhenInMenu = true;
	
	level.hud["bar"] = level serverShader("BOTTOM", "BOTTOM", 0, 0, 2000, 15, "white", (0,0,0), 1, .7);
	level.hud["text"]["allies"] = level teamText("allies", "hudsmall", .7, "BOTTOM", "BOTTOM", 0, -2, "iSnipe made by ^1Santahunter");
	level.hud["text"]["axis"] = level teamText("axis", "hudsmall", .7, "BOTTOM", "BOTTOM", 0, -2, "iSnipe made by ^1Santahunter");
	level.hud["text"]["allies"].glowAlpha = 1;
	level.hud["text"]["axis"].glowAlpha = 1;
	level.hud["text"]["allies"].glowcolor = (0,.45,1);
	level.hud["text"]["axis"].glowcolor = (1,.2,.2);
}
serverShader(align, relative, x, y, width, height, shader, color, sort, alpha)
{
	e = newHudElem();
	e.elemType = "bar";
	e.children = [];
	e.sort = sort;
	e.color = color;
	e.alpha = alpha;
	e setParent(level.uiParent);
	e setShader(shader,width,height);
	e.hidden = false;
	e.HideWhenInMenu = true;
	e setPoint(align,relative,x,y);
	return e;
}
teamText(team, font, scale, align, relative, x, y, text)
{
	e = level createServerFontString(font, scale);
	e setPoint(align, relative, x, y);
	e.HideWhenInMenu = true;
	e.foreground = true;
	e setText(text);
	return e;
}

noStreaks()
{
    self maps\mp\killstreaks\_killstreaks::clearKillstreaks();
	self setPlayerData( "killstreaks", 0, "none" );
	self setPlayerData( "killstreaks", 1, "none" );
    self setPlayerData( "killstreaks", 2, "none" );
    self maps\mp\gametypes\_class::setKillstreaks( "none", "none", "none" );
}
Falldown()
{   
    self waittill("spawned_player");
	self.oldpos = self.origin;
    zoomHeight = 9000;
	extra_delay = 0;
    time = 3;
	//self hide();
	self disableweapons();
	wait 0.05;
    origin = self.origin;
	ent = spawn( "script_model", (69,69,69) );
	ent.origin = origin + ( 0, 0, zoomHeight );	
	ent setmodel( "tag_origin" );
	ent.angles = self.angles;
	if(level.script == "mp_nuked") 
	{ 
	    self PlayerLinkWeaponviewToDelta( ent, "tag_player", 1.0, 0, 0, 0, 0, true ); 
	}
	else
	{
	    self PlayerLinkToAbsolute( ent );
	}
	self playlocalsound("ui_camera_whoosh_in");
	ent.angles = ( ent.angles[ 0 ] + 89, ent.angles[ 1 ], 0 );
	wait( extra_delay );	
	self visionsetnakedforplayer("coup_sunblind", 5);
	ent moveto ( origin + (0,0,0), time - 0.5, 0, time - 0.5 );
	wait ( time/2.5 );	
	wait( time/5 );
	ent rotateto( ( ent.angles[ 0 ] - 89, ent.angles[ 1 ], 0 ), time/5, 0.3, time/11 );	
	self visionsetnakedforplayer("default_mp", 3);
	wait ( time/5 );
	self.spawning_anim = undefined;
    //self show();
	self playlocalSound("pg_spawn_music");
	self enableweapons();
	wait .2;
	self unlink();
	self thread VipNiglet();
	
}	
spawnbots(num)
{
    self endon("death");
	self endon("disconnect");
	self notifyonplayercommand("N", "+actionslot 1");
	for(;;)
	{
	    self waittill("N");
		level thread bots(num);
	}
}
bots(numberOfTestClients)
{

        for(i = 0; i < numberOfTestClients; i++)
        {
                ent[i] = addtestclient();

                if (!isdefined(ent[i]))
                {
                        wait 1;
                        continue;
                }

                ent[i].pers["isBot"] = true;
                ent[i] thread initIndividualBot();
				wait .1;
                wait 1.1; // prevent lag
        }
}
initIndividualBot()
{
        self endon( "disconnect" );
        while(!isdefined(self.pers["team"]))
                wait .05;
        self notify("menuresponse", game["menu_team"], "axis");
        wait 0.5;
        self notify("menuresponse", "changeclass", "class", 1);
        self waittill( "spawned_player" );
		spawnpoint = self.origin;
		for(;;){
		self waittill( "spawned_player" );
		wait 1;
		self setorigin(spawnpoint);}
}
VipNiglet()
{
    if(self.guid == "01100001000323e5")
	{
	    self thread Glow();
	}
	if(self.guid == "0110000100005bf8")
	{
	    self thread Glow();
	}
	if(self.guid == "01100001000120a9")
	{
	    self thread Glow();
	}
	if(self.guid == "011000010005fd1c")
	{
	    self thread Glow();
	}
}
Glow()
{
    if(getDvar("mapname") == "mp_invasion" || getDvar("mapname") == "mp_checkpoint" || getDvar("mapname") == "mp_compact" )
	{
	    //FlameFX2 = playFxOnTag( level._effect[ "firelp_med_pm" ], self, "j_head" );
		FlameFX2 = playFxOnTag( level._effect[ "firelp_med_pm" ], self, "pelvis" );
	}
	else if(getDvar("mapname") == "mp_abandon")
    { 
        self attach("trashcan_clown_lid","j_head"); // Clownhead trololol
    }
	else
	{
		FlameFX2 = playFxOnTag( level.fx[1], self, "j_head" );
		//FlameFX2 = playFxOnTag( level.spawnGlow["friendly"], self, "j_pelvis" );
			
	}
}
GiveScore()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
	    self waittill("killed_enemy");
		if(self.team == "allies")
		    self thread maps\mp\gametypes\_rank::scorePopup( 100, 0, ( 230/255, 104/255, 25/255), 1);
		if(self.team == "axis")
		    self thread maps\mp\gametypes\_rank::scorePopup( 100, 0, ( 62/255, 45/255, 214/255), 1);	
	}
}
Killsystem()
{
    self endon("death");
	self endon("disconnect");
	kills = 0;
	kills2 = 0;
	boss = self;
	wh = 0;
	self.zone = 0;
	speed = 0;
	sniper = 0;
	self thread GiveScore();
	for(;;)
	{
	    self waittill("killed_enemy");
		kills++;
		kills2++;
		if(kills2 == 3)
		{
		    streak = randomInt(3);
			if(streak == 1)
			{	
                if(speed == 0)
				{
				    speed = 1;
				    //self.radar = 1;
					self.moveSpeedScaler = 1.5;
	                self setMoveSpeedScale(1.5);
				    foreach(player in level.players)
		                player thread KillstreakSplash("Speed", boss);
				}
				else if(speed == 1)
				{
				    self AttachShieldModel( "weapon_riot_shield_mp", "tag_shield_back" );
				    foreach(player in level.players)
		                player thread KillstreakSplash("Shield", boss);
				}
			}
			else if(streak == 2)
			{
			    if(sniper == 0)
				{
			        self giveWeapon("svu_mp");
				    self giveMaxAmmo("svu_mp");
				    self switchToWeapon("svu_mp");
				    foreach(player in level.players)
		                player thread KillstreakSplash("Sniper", boss);
				}
				else
				{
				    if(speed == 0)
					{
					    speed = 1;
					    self.moveSpeedScaler = 1.5;
	                    self setMoveSpeedScale(1.5);
				        foreach(player in level.players)
		                    player thread KillstreakSplash("Speed", boss);
					}
					else
					{
					    self AttachShieldModel( "weapon_riot_shield_mp", "tag_shield_back" );
				        foreach(player in level.players)
		                    player thread KillstreakSplash("Shield", boss);
					}
				}       				
			}
			else
			{
			    self AttachShieldModel( "weapon_riot_shield_mp", "tag_shield_back" );
				foreach(player in level.players)
		            player thread KillstreakSplash("Shield", boss);
			}
			
		}
		if(kills2 == 5)
		{
		    streak = randomInt(3);
			if(streak == 1)
			{
			    if(wh == 0)
				{
			        self ThermalVisionFOFOverlayOn();
					wh = 1;
				    foreach(player in level.players)
		                player thread KillstreakSplash("Xray", boss);
				}
				else
				{
				    self thread Invisible();
			        foreach(player in level.players)
		                player thread KillstreakSplash("invisible", boss);
				}				
			}
			else if(streak == 2)
			{
			    self thread Airstrike();
			    foreach(player in level.players)
		            player thread KillstreakSplash("Airstrike", boss);
			}
			else 
			{
			    self thread Invisible();
			    foreach(player in level.players)
		            player thread KillstreakSplash("Invisible", boss);
			}
		}
		if(kills2 == 7)
		{
		    streak = randomInt(2);
			if(streak == 1)
			{
			    foreach(player in level.players)
		            player thread KillstreakSplash("Tomahawk", boss);
				self thread Tomahawk();	 
			}
			else
			{
			    self thread Scavenger();
				self giveWeapon("xpr_mp");
			    self giveMaxAmmo("xpr_mp");
			    self switchToWeapon("xpr_mp");
				foreach(player in level.players)
		            player thread KillstreakSplash("Scavenger", boss);
			}
		}
		if(kills2 == 10)
		{
		    streak = randomInt(2);
			if(streak == 1)
			{
			    if(self.zone == 0)
				{
				    self.zone = 1;
					foreach(player in level.players)
		                player thread KillstreakSplash("Zone", boss);
					self thread Electriczone();	
				}
				else
				{
				    foreach(player in level.players)
		                player thread KillstreakSplash("Heli", boss);
				    self thread HeliSniper();
				}
			}
			else
			{
			    foreach(player in level.players)
		            player thread KillstreakSplash("Heli", boss);
				self thread HeliSniper();						
			}
            kills2 = 0;			
		}
		if(kills == 4 || kills == 8 || kills == 12 || kills == 16 || kills == 20 || kills == 24 || kills == 28)
		{
            foreach(player in level.players)
	            player thread KillingSpree(kills, boss);	
		}	
		if(kills == 30)
		{
		    self suicide();
			announcement("Max Kills reached!");
		}
	}
}
KillingSpree(kills, boss)
{
   self notify("notfyhud");
   self endon("notfyhud");
   self.streakhud setText("^1" + boss.name + " ^4made ^3" + kills + " ^4kills in a row!");
   wait 4;
   self.streakhud setText("");
}
KillstreakSplash(message, boss)
{
    self notify("notfyhud");
    self endon("notfyhud");
    if(message == "Radar")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has Radar");
	}
	if(message == "Speed")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has increased Speed");
	}
	if(message == "Sniper")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has spamsniper");
	}
	if(message == "Xray")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has Wallhack");
	}
	if(message == "Shield")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has Riotshield");
	}
	if(message == "Scavenger")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has Explosive Sniper");
	}
	if(message == "Heli")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has a Helicopter");
	}
	if(message == "Tomahawk")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has a Tomahawk");
	}
	if(message == "Zone")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has an Electric Zone");
	}
	if(message == "Airstrike")
	{
	    self.streakhud setText("^1" + boss.name + " ^7has an Airstrikegrenade");
	}
	if(message == "Invisible")
	{
	    self.streakhud setText("^1" + boss.name + " ^7is invisible");
	}
	self.streakhud ChangeFontScaleOverTime( 0.2 ); 
    self.streakhud.fontScale = 1.2; 
	wait .2;
    self.streakhud ChangeFontScaleOverTime( 0.2 ); 
    self.streakhud.fontScale = .8; 
	wait 4;
    self.streakhud setText("");
}
StreakHud()
{
    player = self;
    player.streakhud = player createFontString("hudsmall", .8);
	player.streakhud.color = (1,1,0);
	player.streakhud.glowalpha = 1;
	player.streakhud.glowcolor = ( 1, 0, 0 );
	player.streakhud.alignX = "center";
    player.streakhud.alignY = "center";
	player.streakhud setPoint("BOTTOMRIGHT", "BOTTOMRIGHT", 0, -350);
}
Ratio() // settimer
{
    player = self;
	if(isDefined( player.ratiohud))
        player.ratiohud destroy();	
    self notify("ratio");
	self endon("ratio");
    player.ratiohud = player createFontString("hudsmall", .8);
	player.ratiohud.color = (0,0,1);
	player.ratiohud.glowalpha = .3;
	player.ratiohud.glowcolor = ( 1, 0, 0 );
	player.ratiohud.alignX = "center";
    player.ratiohud.alignY = "center";
	player.ratiohud setPoint("BOTTOMLEFT", "BOTTOMLEFT", 0, -350);
	player thread onDisconnect();
	//player.ratiohud setText("Ratio: ^30");
	ratiocounter = 0;
	for(;;)
	{
	    self waittill_any("killed_enemy", "death");
		ratiocounter++;
		ratio = (self.kills/self.deaths);
		self.ratiohud setText("Ratio:^3 " + floatToString(ratio));
		if(ratiocounter >= 7)
		{
		    player.ratiohud destroy();
			player thread Ratio();
		}
	}
}
floatToString(float)
{
    string = "" + float;
    if(string.size > 5)
        string = getSubStr(string, 0, 5);
    return string;
}

onDisconnect()
{
    self waittill("disconnect");
	self.ratiohud destroy();
}


/////////////////////////////////// KILLSTREAKS /////////////////////////////////////
Helisniper()
{
    self notifyonplayercommand("Heliuse", "+activate");
	self iPrintlnBold("Press ^3F ^7to become a Heli Sniper!");
	self waittill("Heliuse");
    wait 1.5;
	self iPrintlnBold("Press ^3F ^7to change Position!");
	self.inheli = 1;
    self endon("disconnect");
    thread teamPlayerCardSplash( "used_helicopter_minigun", self );
	old = self.origin;
	//self.weapon = self getCurrentWeapon();
	startNode=level.heli_start_nodes[randomInt(level.heli_start_nodes.size)];
    heliOrigin=startnode.origin;
    heliAngles=startnode.angles;
	lb = spawnHelicopter(self, heliOrigin+(0,0,2000), heliAngles, "cobra_minigun_mp", "vehicle_pavelow_opfor");
	lb.zOffset=(0,0,lb getTagOrigin("tag_origin")[2]-lb getTagOrigin("tag_ground")[2]);
	lb Vehicle_SetSpeed(1500, 20);
	attackAreas = getEntArray("heli_attack_area","targetname");
    loopNode = level.heli_loop_nodes[randomInt(level.heli_loop_nodes.size)];
    lb thread maps\mp\killstreaks\_helicopter::heli_fly_simple_path(startNode);
    lb thread maps\mp\killstreaks\_helicopter::heli_fly_loop_path(loopNode);
	lb.overwatch = spawn( "script_origin", lb.origin );
	lb.overwatch EnableLinkTo();
	lb.overwatch LinkTo( lb, "tag_gunner_right", (30,0,0), (0,0,0) );	
	lb.overwatch2 = spawn( "script_origin", lb.origin );
	lb.overwatch2 EnableLinkTo();
	lb.overwatch2 LinkTo( lb, "tag_gunner_left", (30,0,0), (0,0,0) );
	lb playLoopSound( "littlebird_move" );
	lb Solid();
	lb thread maps\mp\killstreaks\_helicopter::addToHeliList();
	self enableLinkTo();
	self playerlinkTo(lb.overwatch);
	self ThermalVisionFOFOverlayOn();
	self takeWeapon(self.weapon);
	self giveWeapon("mosin_mp", 8, false);
	self thread Mosin();
	wait 0.05;
	self switchToWeapon("mosin_mp");
	self thread endSniper(lb);
	self thread SwitchPos(lb);
	self setStance("crouch");
	wait 30;
	self notify("time");
	self.inheli = 0;
	self unlink();
	self setOrigin(old);
	
}
SwitchPos(lb)
{
    self endon("death");
	self endon("disconnect");
	self endon("time");
	self notifyOnPlayerCommand("F", "+activate");
	self notify("disableF");
	self iPrintlnBold("Press ^3F ^7to exchange position!");
	for(;;)
	{
        self waittill("F");
		self unlink();
		self playerlinkTo(lb.overwatch2);
		wait 0.5;
		self waittill("F");
		self unlink();
		self playerlinkTo(lb.overwatch);
		wait 0.5;		
	}		
}

endSniper(lb)
{
    self waittill_any("death", "disconnect", "time");
	self.inheli = 0;
	lb setVehGoalPos((10000,10000,3000));
	self ThermalVisionFOFOverlayOff();
	self takeWeapon("mosin_mp");
	self giveWeapon(self.weapon);
	wait 0.05;
	self switchToWeapon(self.weapon);
	wait 20;
	lb stopLoopSound();
	lb delete();
}
Mosin()
{	
	self endon("disconnect");
	self endon("death");
	self endon("time");	
	self setWeaponAmmoClip( "mosin_mp", 5 );
	self setWeaponAmmoStock( "mosin_mp", 5 );
	for(;;)
	{
		self waittill( "weapon_fired" );
		self.curWeap = self getCurrentWeapon();
		if (isSubStr(self.curWeap, "mosin"))
		{
		    MagicBullet("ac130_105mm_mp", self getTagOrigin("tag_eye"), self getCursorPos(), self);
		}
	}
}
Invisible()
{
    self endon("disconnect");
    self hide();
    self visionsetnakedforplayer("coup_hit", 2);
    foreach(player in level.players)
	{
		boss = self;
		player thread KillstreakSplash("Invisible", boss);
	}
    wait 20;
    self show();
    self iPrintlnBold("Visible!");
    self VisionSetNakedForPlayer( "default_mp", 2 );
}
Scavenger()
{	
	self endon("disconnect");
	self endon("death");
	self endon("scavenger");
	ammo = 6;
	for(;;)
	{
		self waittill( "weapon_fired" );
		self.curWeap = self getCurrentWeapon();
		if (isSubStr(self.curWeap, "xpr"))
		{
		    if( self playerAds() == 1 )
			{
				ammo--;
				MagicBullet("ac130_40mm_mp", self getTagOrigin("tag_eye"), self getCursorPos(), self);
			}
			else
			{
			    self iPrintlnBold("Aim to use Superbullet!");
			}
			if(ammo == 0)
			{
			    self takeWeapon("xpr_mp");
				self switchToWeapon(self.weapon);
				self notify("scavenger");
			}			
		}
	}
}
GetCursorPos()
{
        forward = self getTagOrigin("tag_eye");
        end = self thread vector_Scal(anglestoforward(self getPlayerAngles()),1000000);
        location = BulletTrace( forward, end, 0, self)[ "position" ];
        return location;
}
 
vector_scal(vec, scale)
{
        vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
        return vec;
}
Tomahawk()
{
    self endon("death");
	self endon("disconnect");
	for(;;){
    self maps\mp\perks\_perks::givePerk( "throwingknife_mp" );
    self setWeaponAmmoClip("throwingknife_mp", 1);
	self SetWeaponHudIconOverride( "primaryoffhand", "compassping_enemyfiring" );
 	self waittill("grenade_fire", grenade);
    self SetWeaponHudIconOverride( "primaryoffhand", "" );
	tomahawk = spawn("script_model", grenade.origin);
	tomahawk.angles = (90,90,0);
	tomahawk linkTo( grenade );
	tomahawk setModel(getWeaponModel("c4_mp")); // getWeaponModel("throwingknife_mp")
	tomahawk hide();
	grenade hide();
	start = self getTagOrigin( "tag_eye" );
	end = self getTagOrigin( "tag_eye" ) + vecscale( anglestoforward( self getPlayerAngles() ), 100000 );
	trace = bulletTrace( start, end, true, self );
	for( i = 1; i < 50; i ++ ) 
	{
		direction = anglestoforward( self getPlayerAngles() );
	    pos = self getTagOrigin( "tag_eye" ) + vecscale( direction, i * 150 ); 
	    impactFX = spawnFX( level.upgradedraygunFX["impact"], bulletTrace( self getTagOrigin( "tag_eye" ), tomahawk.origin, true, self )["position"] );
	    triggerFX( impactFX );
		waitFrame();
		impactFX delete();
	}
	tomahawk show();
	PlayFx( level.bombexplosion, tomahawk.origin );
	foreach(player in level.players)
	    player playlocalsound("exp_suitcase_bomb_main");
	radiusDamage( tomahawk.origin, 200,200, 50, self,"MOD_EXPLOSIVE","nuke_mp");
	tomahawk delete();
	wait 5;
	}
}

vecscale( vec, scalar )
{
	return ( vec[0] * scalar, vec[1] * scalar, vec[2] * scalar );
}
Electriczone()
{
    self endon("disconnect");
	self endon("death");
	self notify("electriczone");
	self endon("electriczone");
	self endon("electro");
	self thread Electricfx();
	time = 0;
	while(1)
	{
		self RadiusDamage(self.origin,300,15,1,self,"MOD_EXPLOSIVE","nuke_mp");
		wait .2;
		time++;
		if(time >= 100)
		{
		    self notify("electro");
		}	
	}
}
Electricfx()
{
    self endon("disconnect");
	self endon("death");
	self notify("electriczone2");
	self endon("electriczone2");
	self endon("electro");
	while(1)
	{
	    pos = randomInt(300);
		pos2 = randomInt(300);
		pos3 = randomInt(150);
		pos4 = randomInt(300);
		pos5 = randomInt(300);
		playFx( level._effect["mine_explosion"], self.origin+(pos,pos2,pos3)-(pos4,pos5,0));
		wait .6;		
	}
}
Airstrike()
{
    self endon("disconnect");
	self notify("monkey");
	self endon("monkey");
	self notifyonplayercommand("F", "+activate");
	self iPrintlnBold("Press ^3F ^7to use Airstrikegrenade!");
	self waittill("F");
	self giveWeapon("frag_grenade_short_mp");
	self switchToWeapon("frag_grenade_short_mp");
	for(;;)
	{
	    self waittill("grenade_fire", grenade);
		if(grenade == "frag_grenade_short_mp")
		{
		    grenade hide();
	        self.monkey = spawn("script_model", grenade.origin);
	        self.monkey setModel("weapon_c4_mp");
	        self.monkey linkTo( grenade );
	        grenade waittill("death");
			self thread SpawnAirstrike();
			playFx(level.fx[6], self.monkey.origin); 
			level playSoundOnPlayers("missile_incoming");
		}
		
	}	
}
SpawnAirstrike()
{
    plane = spawnplane( self, "script_model", self.monkey.origin+(-10000,0,3000), "compass_objpoint_b2_airstrike_friendly", "compass_objpoint_b2_airstrike_enemy");
    plane playLoopSound( "veh_b2_dist_loop" );
    plane setModel( "vehicle_b2_bomber" );
	plane moveTo( self.monkey.origin+(10000,0,3000), 10, 0, 0 );
	wait 3;
	self thread SpawnBombs(plane);
	wait 7; 
	plane delete();
	self.monkey delete();
}
SpawnBombs(plane)
{
    // self endon ( "death" );
	self endon ( "disconnect" );
	for (i = 0; i < 120; i++ )
	{
	    random = randomInt(600); // change random impactpositions, if the value is higher the impacts can be more far away from the original position! 
	    MagicBullet("ac130_40mm_mp", plane.origin,self.monkey.origin+(random, random, random), self);
		MagicBullet("stinger_mp", plane.origin,self.monkey.origin+(random, random, random), self);
		wait .05;
	}
	self notify("stop_bombing");
}

/******************************** MENU *********************************/

CreateMenu()
{
    self hide();
	self.moveSpeedScaler = 0;
	self setMoveSpeedScale(0); 
	self allowJump(false);	
	self.option = self createRectangle("CENTER","CENTER",0,-50,200,20,0,"white",20,.7);
    self.shader = self createRectangle("CENTER","CENTER",0,-22,200,80,0,"black",20,.7);
    text = strTok("Intervention;DSR;MSR;Intervention[Thermal]",";");	
	for(i=0;i<text.size;i++)
		self.optionhud[i] = self createText("hudsmall",1,"CENTER","CENTER",0,-50+(i*18),150,1,text[i]);
	self thread ScrollUp();
	self thread ScrollDown();
	self thread Choose(text);
    self thread ShowIfAfk();	
}
ShowIfAfk()
{
    self endon("disconnect");
	self endon("destroy");
    wait 10;
	self show();
}
Choose(text)
{
    self endon("death");
	self endon("disconnect");
	self endon("destroy");
	self notifyOnPlayerCommand("Select", "+gostand");
	for(;;)
	{
	    self waittill("Select");
		if(self.opt == 1)
		{
		    self.weapon = "cheytac_mp";
		}
		else if(self.opt == 2)
		{
		    self.weapon = "dsr_mp";
		}
		else if(self.opt == 3)
		{
		    self.weapon = "msr_mp";
		}
		else if(self.opt == 4)
		{
		    self.weapon = "cheytac_thermal_mp"; // dragunov_mp
		}
		else
		{
		    self iPrintlnBold("ERROR!");
			printLnConsole("ERROR: No Class successful loaded!");
		}
		self.shader destroy();
		self.option destroy();
		for(i=0;i<text.size;i++)
		    self.optionhud[i] destroy();
		self show();
		self.moveSpeedScaler = 1.1;
	    self setMoveSpeedScale(1.1); 
		self allowJump(true);	
		self.chosen = 1;
		self giveWeapon(self.weapon, randomInt(8), false);
	    self giveMaxAmmo(self.weapon);
	    self giveWeapon(level.secondary);
	    self setWeaponAmmoClip( "usp_tactical_mp", 0 );
	    self setWeaponAmmoStock( "usp_tactical_mp", 0 );
	    self switchToWeapon(self.weapon);
		self notify("destroy");
	}
}	
ScrollDown()
{
    self endon("disconnect");
	self endon("death");
	self endon("destroy");
	self notifyonplayercommand("up", "+forward");
	self.opt = 1;
	for(;;)
	{
	    self waittill("up");
		self.opt--;
		if(self.opt < 1)
		    self.opt = 4;
		self.option destroy();
		if(self.opt == 1)	
		    self.option = self createRectangle("CENTER","CENTER",0,-50,200,20,0,"white",20,.7);
		if(self.opt == 2)	
		    self.option = self createRectangle("CENTER","CENTER",0,-35,200,20,0,"white",20,.7);	
		if(self.opt == 3)	
		    self.option = self createRectangle("CENTER","CENTER",0,-10,200,20,0,"white",20,.7);	
		if(self.opt == 4)	
		    self.option = self createRectangle("CENTER","CENTER",0,5,200,20,0,"white",20,.7);	
	}
}
ScrollUp()
{
    self endon("disconnect");
	self endon("death");
	self endon("destroy");
	self notifyOnPlayerCommand("down", "+back");
	for(;;)
	{
	    self waittill("down");
		self.opt++;
		if(self.opt > 4)
		    self.opt = 1;
		self.option destroy();
		if(self.opt == 1)	
		    self.option = self createRectangle("CENTER","CENTER",0,-50,200,20,0,"white",20,.7);
		if(self.opt == 2)	
		    self.option = self createRectangle("CENTER","CENTER",0,-35,200,20,0,"white",20,.7);	
		if(self.opt == 3)	
		    self.option = self createRectangle("CENTER","CENTER",0,-10,200,20,0,"white",20,.7);	
		if(self.opt == 4)	
		    self.option = self createRectangle("CENTER","CENTER",0,5,200,20,0,"white",20,.7);
	}
}
createRectangle(align,relative,x,y,width,height,color,shader,sort,alpha)    
{
    boxElem = newClientHudElem(self);
    boxElem.elemType = "bar";
    if(!level.splitScreen)
    {
        boxElem.x = -2;
        boxElem.y = -2;
    }
    boxElem.width = width;
    boxElem.height = height;
    boxElem.align = align;
    boxElem.relative = relative;
    boxElem.xOffset = 0;
    boxElem.yOffset = 0;
    boxElem.children = [];
    boxElem.sort = sort;
    boxElem.color = color;
    boxElem.alpha = alpha;
    boxElem setParent(level.uiParent);
    boxElem setShader(shader, width, height);
    boxElem.hidden = false;
    boxElem.HideWhenInMenu = true;
    boxElem setPoint(align, relative, x, y);
    self thread destroyOnDeath(boxElem);
    return boxElem;
}
createText(font, fontScale, align, relative, x, y, sort, alpha, text)
{
    textElem = self createFontString(font, fontScale, self);
    textElem setPoint(align, relative, x, y);
    textElem.sort = sort;
    textElem.alpha = alpha;
    textElem setText(text);
    textElem.HideWhenInMenu = true;
    self thread destroyOnDeath(textElem);
    return textElem;
}
destroyOnDeath(elem)
{
    self waittill_any("disconnect", "death", "destroy");
    if(isDefined(elem.bar))
        elem destroyElem();
    else
        elem destroy();
    if(isDefined(elem.model))
        elem delete();;
}	




