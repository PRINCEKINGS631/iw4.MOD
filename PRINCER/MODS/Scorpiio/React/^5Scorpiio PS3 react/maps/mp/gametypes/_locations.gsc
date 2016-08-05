#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_cleanScript;

doThreads()
{
	self thread doLocation1(); 
	self thread doLocation2(); 
	self thread doLocation3();	
	self thread doLocation4();
}

doLocation1()
{
	for(;;)
	{
		self notifyOnPlayerCommand("as3", "+actionslot 3");
		self waittill("as3");
		
		if (self.menuOpen == 1 && self.menuPos == 1 )
		{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((1160, 1557, 540));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((722, 2647, 437));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((-2649, 748, 12));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((617, -588, 372));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-2745, 6800 - randomInt(800), 3250));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((893, -1723, 235));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((664, -1128, 524));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((-543, -207, 424));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-4270 - randomInt(500), -160, 370));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((938, -502, 250));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((657, 1062, 327));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((-1311, 612, 202));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((639, 190, 372));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((1557, 4097, 364));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((1115, 1135, 724));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((1078, -2377, 296));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((253, -1575, 182));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((426, -4182, 984));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((1072, -2320, 184));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((2370, 1431, 248));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((886, -965, 364));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((854, -1228, 164));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((-1622, 559, 196));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((653, 779, 250));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((-2264, 1294, 92));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((-689, 1500, 59));
			else if (getdvar("mapname") == "mp_nuked")
				self setOrigin((525, 160, 139));
			else if (getdvar("mapname") == "mp_cross_fire")
				self setOrigin((4772, -3663, 1083));
			else if (getdvar("mapname") == "mp_bloc")
				self setOrigin((1006, -5081, 776));
			else if (getdvar("mapname") == "mp_cargoship")
				self setOrigin((-2278, 11, 936));
			else if (getdvar("mapname") == "mp_killhouse")
				self setOrigin((3593, 173, 413));
			else if (getdvar("mapname") == "mp_bog_sh")
				self setOrigin((5810, 2733, 428));
			
			self thread menuClose();
		}
	}
}

doLocation2()
{
	for(;;)
	{
		self notifyOnPlayerCommand("as4", "+actionslot 4");
		self waittill("as4");

		if (self.menuOpen == 1 && self.menuPos == 1 )
		{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((1870, 2663, 433));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((110, -2330, 417));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((-752, -400, 376));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((-651, 578, 392));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-1630, 8476, 3340));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((-260, -39, 452));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((-3000, -2600, 528));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((492, 940, 308));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-1975, -300, 228));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((-721, -227, 244));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((962, 750, 200));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((22, 1211, 92));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((243, -1095, 318));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((2216, 4356, 364));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((34, 1615, 581));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((-2944, 342, 271));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((862, -645, 300));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((-533, -3697, 980));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((-610, -3674, 88));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((2015, 2191, 259));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((77, -672, 337));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((1998, 315, 188));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((531, -1680, 213));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((1399, -1155, 270));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((165, 1223, 164));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((1305, -867, 60));
			else if (getdvar("mapname") == "mp_nuked")
				self setOrigin((-471, 347, 135));
			else if (getdvar("mapname") == "mp_cross_fire")
				self setOrigin((3268, -5043, 707));
			else if (getdvar("mapname") == "mp_bloc")
				self setOrigin((2347, -5272, 1204));
			else if (getdvar("mapname") == "mp_cargoship")
				self setOrigin((1023, 2, 1356));
			else if (getdvar("mapname") == "mp_killhouse")
				self setOrigin((3945, 1399,766));
			else if (getdvar("mapname") == "mp_bog_sh")
				self setOrigin((1210, 429, 518));

			self thread menuClose();
		}
	}
}

doLocation3()
{
	for(;;)
	{
		self notifyOnPlayerCommand("smoke", "+smoke");
		self waittill("smoke");

		if (self.menuOpen == 1 && self.menuPos == 1 )
		{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((1726, 779, 289));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((-725, -918, 272));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((1405, 3800, 360));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((-610, -424, 149));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-1396, 5940, 3193));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((1814, -97, 272));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((-2406, -2100, 1080));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((551, -342, 620));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-4790, 890, 260));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((-866, -995, 177));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((1318, 1390, -46));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((436, 586, 130));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((210, 51, 372));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((618, 2735, 470));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((314, 2454, 1088));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((-2311, -1339, 235));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((-1224, -2902,-24));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((-151, -2292, 908));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((-193, -4041, 74));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((2012, -545, 248));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((337, 1375, 323));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((2667, -839, 360));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((787, 92, 176));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((-148, -1465, 317));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((-1466, 99, 162));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((-64, -1274, 14));
				
			self thread menuClose();
		}
	}
}

doLocation4()
{
	for(;;)
	{
		self notifyOnPlayerCommand("activate", "+activate");
		self waittill("activate");

		if (self.menuOpen == 1 && self.menuPos == 1 )
		{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((-972, 1808, 408));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((847, -525, 335));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((-3134, 3347, -79));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((-1479, 701, 960));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-1369, 7395, 3120));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((109, -1363, 716));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((837, -2909, 1160));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((-1401, 1411, 476));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-5096, 1809, 659));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((1029, -1718, 536));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((-462, 1795, 13));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((-1418, -419, 38));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((1306, -492, 1962));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((1384, 4480, 666));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((-425, 24, 774));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((2094, -3134, 458));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((3794, -492, 110));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((1076, -4191, 1220));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((1705, -1509, 88));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((148, 1986, 254));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((1544, 557, 681));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((2044, 817, 188));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((-1522, -951, 187));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((-2007, 1749, 724));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((-303, -875, 130));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((907, 836, 68));
	
			self thread menuClose();
		}
	}
}