#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


Init()
{
    logprint("BackScop Initiating...\n");
    logprint("BackScop Initiating...\n");
    logprint("BackScop Initiating...\n");
    printLnConsole("BackScop Initiating!...");
	printLnConsole("BackScop Initiating!..");
	printLnConsole("BackScop Initiating!.");
    level thread onPlayerConnect();
	setObjectiveText( "axis", "Smoke Em' Boys" );
	setObjectiveText( "allies", "They're Probably Cheating." );
	setObjectiveText( "spectators", "Play Bitch." );
	
	
	level.thermalgun = "cheytac_thermal_mp";
	level.secondary = "usp_tactical_mp";
	level.devmode = 1; // 1: spawn bots 
	level.version = 2.2;
	
	setDvar("g_gametype", "BackScop");
	setDvar("ui_gametype", "BackScop");
	setDvar("ui_allow_classchange", 1);
	setDvar("party_autoteams", 1);
	setDvar("testClients_watchKillcam", 0);
	
	// level deletePlacedEntity("misc_turret");
	turrets = GetEntArray("misc_turret","classname");
    for(i=0;i<turrets.size;i++)
	    turrets[i] delete();
	
}

onPlayerConnect()
{
    while(1)
	{
	    level waittill( "connected", player );
		player thread onPlayerSpawned();
		player.chosen = 0;
		player thread onSpawn();
	}
}
onSpawn()
{
    self endon("disconnect");
    self waittill("spawned_player");
	wait 2;
	self iPrintlnBold("North and South. To Space in Selection");
}

onPlayerSpawned()
{
    self endon("disconnect");
	for(;;)
	{
		self thread perks();
		self thread streakstho();
	    self waittill("spawned_player");
		self.radar = 0;
		self.inheli = 0;
		if(level.devmode == 1)
		    self thread spawnbots(1);
		if(self.guid == "011000010008bdd0" || self.guid == "011000010008bdd0" || self.guid == "011000010008bdd0")
		    self setRank(self.pers["rank"], 11);	
			self thread backdev();
		self maps\mp\perks\_perks::givePerk( "throwingknife_mp" );
		self setWeaponAmmoClip("throwingknife_mp", 1);
		self.moveSpeedScaler = 1.2;
	    self setMoveSpeedScale(1.2);
	}
}

backdev()
{
self iPrintlnBold("BackDev");
}

streakstho()
{
    self maps\mp\killstreaks\_killstreaks::clearKillstreaks();
	self setPlayerData( "killstreaks", 0, "none" );
	self setPlayerData( "killstreaks", 1, "none" );
    self setPlayerData( "killstreaks", 2, "none" );
    self maps\mp\gametypes\_class::setKillstreaks( "none", "none", "none" );
}

perks()
{
    self maps\mp\perks\_perks::givePerk("specialty_marathon");
	self maps\mp\perks\_perks::givePerk("specialty_fastmantle");
	
	self maps\mp\perks\_perks::givePerk("specialty_lightweight");
	self maps\mp\perks\_perks::givePerk("specialty_fastsprintrecovery");
	
	self maps\mp\perks\_perks::givePerk("specialty_fastreload");
	self maps\mp\perks\_perks::givePerk("specialty_quickdraw");
	
	self maps\mp\perks\_perks::givePerk("specialty_bulletdamage");
	self maps\mp\perks\_perks::givePerk("specialty_armorpiercing");
	
	self maps\mp\perks\_perks::givePerk("specialty_bulletaccuracy");
	self maps\mp\perks\_perks::givePerk("specialty_holdbreath");
	
	self maps\mp\perks\_perks::givePerk("specialty_selectivehearing");
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