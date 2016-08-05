#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

createText()
{
	MyYT = self createFontString("default", 2);	// Main Menu Text
	MyYT setPoint("CENTER", "CENTER", 0, -175);
	Menu1 = self createFontString("default", 2); // Main Menu Text
	Menu1 setPoint("CENTER", "CENTER", 0, -150);
	Menu2 = self createFontString("default", 1.75); // Sub Menu Text
	Menu2 setPoint("CENTER", "CENTER", 0, -125);
	Menu3 = self createFontString("default", 1.75); // Sub Sub Menu Text
	Menu3 setPoint("CENTER", "CENTER", 0, -105);

	subMenu1 = self createFontString("default", 1.5);
	subMenu1 setPoint("CENTER", "CENTER", -200, -150);
	subMenu2 = self createFontString("default", 1.5);
	subMenu2 setPoint("CENTER", "CENTER", 200, -150);

	Text1 = self createFontString("default", 1.5);
	Text1 setPoint("CENTER", "CENTER", 0, -80);
	Text2 = self createFontString("default", 1.5);
	Text2 setPoint("CENTER", "CENTER", 0, -60);
	Text3 = self createFontString("default", 1.5);
	Text3 setPoint("CENTER", "CENTER", 0, -40);
	Text4 = self createFontString("default", 1.5);
	Text4 setPoint("CENTER", "CENTER", 0, -20);
	Text5 = self createFontString("default", 1.5);
	Text5 setPoint("CENTER", "CENTER", 0, 0);
	Text6 = self createFontString("default", 1.5);
	Text6 setPoint("CENTER", "CENTER", 0, 20);
	Text7 = self createFontString("default", 1.5);
	Text7 setPoint("CENTER", "CENTER", 0, 40);
	Text8 = self createFontString("default", 1.5);
	Text8 setPoint("CENTER", "CENTER", 0, 60);
	Text9 = self createFontString("default", 1.5);
	Text9 setPoint("CENTER", "CENTER", 0, 80);
	Text10 = self createFontString("default", 1.5);
	Text10 setPoint("CENTER", "CENTER", 0, 100);
	Text11 = self createFontString("default", 1.5);
	Text11 setPoint("CENTER", "CENTER", 0, 120);
	Text12 = self createFontString("default", 1.5);
	Text12 setPoint("CENTER", "CENTER", 0, 140);

	Left1 = self createFontString("default", 1.5);
	Left1 setPoint("CENTER", "CENTER", -300, -40);

	Right1 = self createFontString("default", 1.5);
	Right1 setPoint("CENTER", "CENTER", 300, -40);

	Close1 = self createFontString("default", 2);
	Close1 setPoint("CENTER", "CENTER", 0, 160);

	for(;;)
	{
		if (self.menuOpen == 0)
		{
			MyYT setText( "" );
			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Text12 setText( "" );
			Left1 setText( "" );
			Right1 setText( "" );
			Close1 setText( "" );

		} else if (self.menuOpen == 1) {

			MyYT setText( "" );
			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Text12 setText( "" );
			Close1 setText( "" );
		
			Close1 setText( "^5Press ^3[{+actionslot 1}] ^5to ^3close the menu" );

			MyYT setText( "^5YouTube.com^3/PerfectScorpiio" );

			if (self.menuOpen == 1)
			{
				if (self.menuPos == 1) // Teleports
				{
					if (self.admin == true)
						subMenu1 setText( "^3Binds" );
					else
						subMenu1 setText( "^3Character Preferences" );
					subMenu2 setText( "^3Equipment" );
				}
				else if (self.menuPos == 2) // Equipment
				{
					subMenu1 setText( "^3Teleports" );
					subMenu2 setText( "^3Weapons" );
				}
				else if (self.menuPos == 3) // Weapons
				{
					subMenu1 setText( "^3Equipment" );
					subMenu2 setText( "^3Killstreaks" );
				}
				else if (self.menuPos == 4) // Killstreaks
				{
					subMenu1 setText( "^3Weapons" );
					subMenu2 setText( "^3Character Preferences" );
				}
				else if (self.menuPos == 5) // Character Prefs.
				{
					subMenu1 setText( "^3Killstreaks" );

					if (self.admin == true)
						subMenu2 setText( "^3Match Settings" );
					else
						subMenu2 setText( "^3Teleports" );
				}
				else if (self.menuPos == 6) // Match Settings
				{
					subMenu1 setText( "^3Character Preferences" );
					subMenu2 setText( "^3Change Map" );
				}
				else if (self.menuPos == 7) // Change Map
				{
					subMenu1 setText( "^3Match Settings" );
					subMenu2 setText( "^3Bot Settings" );
				}
				else if (self.menuPos == 8) // Bot Settings
				{
					subMenu1 setText( "^3Change Map" );
					subMenu2 setText( "^3Kick Players" );
				}
				else if (self.menuPos == 9) // Kick Players
				{
					subMenu1 setText( "^3Bot Settings" );
					subMenu2 setText( "^3Binds" );
				}
				else if (self.menuPos == 10) // Binds
				{
					subMenu1 setText( "^3Kick Players " );
					subMenu2 setText( "^3Teleports" );
				}
			}
			
			// Teleport Menu
			if (self.menuPos == 1) {

				if (self.admin == true) {
					Text1 setText( "^5Press ^3[{+frag}] ^5To ^6Spawn ^51 Enemy Bot" );
					Text2 setText( "^5Press ^3[{+strafe}] ^5To ^6Spawn ^51 Teammate Bot" );
					Text3 setText( "^5Press ^3[{+actionslot 2}] ^5To ^6Move ^5Bots To Crosshair" );
				}

				if (getdvar("mapname") == "mp_afghan") {
					Menu1 setText( "^5Afghan Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of the Wing" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of the Rocks" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Above the Cockpit" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Suicide Spot" );
				} else if (getdvar("mapname") == "mp_derail") {
					Menu1 setText( "^5Derail Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Passage of the Rail" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Roof of NovaStar" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Ladder Spot" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Goods Wagon" );
				} else if (getdvar("mapname") == "mp_estate") {
					Menu1 setText( "^5Estate Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Next to the destroyed Roof" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of the Greenhouse" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Roof of the Fishing Hut" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Above the Power Grid" );
				} else if (getdvar("mapname") == "mp_favela") {
					Menu1 setText( "^5Favela Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Stairs next to Bombsite A" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Next to the Water Tank" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Wood Stairs of the Barbershop" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Elevator Spot" );
				} else if (getdvar("mapname") == "mp_highrise") {
					Menu1 setText( "^5Highrise Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of Highrise" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Crane Suicide Shot" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Top of the Helicopter " );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Above Elevators" );
				} else if (getdvar("mapname") == "mp_nightshift") {
					Menu1 setText( "^5Skidrow Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Sheef Roof" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of the Water Tank" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Containers near the River" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Top of the Map" );
				} else if (getdvar("mapname") == "mp_invasion") {
					Menu1 setText( "^5Invasion Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Next to the American Flag" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Above OpFor Spawn" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Elevator Trickshot Spot" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Highest Building of the Map" );
				} else if (getdvar("mapname") == "mp_checkpoint") {
					Menu1 setText( "^5Karachi Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Platform near Bombsite A" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Next to Hotel Kashmir" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Out of Map near destroyed Roof" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Out of Map next to the Clock Tower" );
				} else if (getdvar("mapname") == "mp_quarry") {
					Menu1 setText( "^5Quarry Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Passage on House 14" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Nearly Edge of the Map" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Above Transportadora" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Highest Latern Spot" );
				} else if (getdvar("mapname") == "mp_rundown") {
					Menu1 setText( "^5Rundown Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Above Barateiro" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Windows Shot Spot" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Wall near Stone Stairs" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Wooden Power Pole near Bombsite B" );
				} else if (getdvar("mapname") == "mp_rust") {
					Menu1 setText( "^5Rust Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of Rust" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Platform at Bombsite B" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Above Box Room" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Oil Pipe near Drilling Rig" );
				} else if (getdvar("mapname") == "mp_boneyard") {
					Menu1 setText( "^5Scrapyard Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Above TF141 Spawn" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Oil Drums near Bombsite A" ); 
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6On Top of the Plane Shell" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Forklift" );
				} else if (getdvar("mapname") == "mp_subbase") {
					Menu1 setText( "^5Sub Base Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Roof near 1st Propeller" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Terrace near Communications Room" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Roof near 2nd Propeller" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Elevator Spot" );
				} else if (getdvar("mapname") == "mp_terminal") {
					Menu1 setText( "^5Terminal Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Roof of Electronic Room" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Ladder above Bombsite A" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Top of Plane" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Top of Latern" );
				} else if (getdvar("mapname") == "mp_underpass") {
					Menu1 setText( "^5Underpass Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Circular Platform" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Roof of the Favela Houses" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Out of Map Bridge" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Roof above Bombsite A" );
				} else if (getdvar("mapname") == "mp_brecourt") {
					Menu1 setText( "^5Wasteland Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of Roofless House" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of Helicopter" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Roof near crashed Cars" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Wooden Power Pole at the Graveyard" );
				} else if (getdvar("mapname") == "mp_fuel2") {
					Menu1 setText( "^5Fuel Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Near the Palm" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Into House near Bombsite B" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Roof near Scrap Box" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Roof of Oildepot" );
				} else if (getdvar("mapname") == "mp_complex") {
					Menu1 setText( "^5Bailout Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Suicide Spot" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Outside Terrace" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Balcony of the Blue House" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Out of Map Roof" );
				} else if (getdvar("mapname") == "mp_overgrown") {
					Menu1 setText( "^5Overgrown Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of Bombsite B House" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6 Destroyed House" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Roof of the River Passage" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Roof of Rectangle House" );
				} else if (getdvar("mapname") == "mp_compact") {
					Menu1 setText( "^5Salvage Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Platform under the Crane" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Roof near the Crane" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Stairs at House 33" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Truck near NovaStar" );
				} else if (getdvar("mapname") == "mp_crash") {
					Menu1 setText( "^5Crash Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Platform near TF141 Spawn" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Roof of a Store" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Pharmacy House" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Roof above Bombsite A" );
				} else if (getdvar("mapname") == "mp_abandon") {
					Menu1 setText( "^5Carnival Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Castle" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6FUNHAUS Balcony" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Roller-Coaster" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6FUNHAUS Window" );
				} else if (getdvar("mapname") == "mp_storm") {
					Menu1 setText( "^5Storm Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Platform near Spetsnaz Spawn" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of the Truck" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Little Office near Bombsite B" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Terrace next to the Dolls " );
				} else if (getdvar("mapname") == "mp_strike") {
					Menu1 setText( "^5Strike Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Balcony near Bombsite B" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Platform near Bombsite B" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Balcony near Army Rangers Spawn" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Out of Map Roof" );
				} else if (getdvar("mapname") == "mp_trailerpark") {
					Menu1 setText( "^5Trailer Park  Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of Tube" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Scrap Box near Bombsite A" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Scrap Box near Bombsite B" );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Car next to the Green Trailer" );
				} else if (getdvar("mapname") == "mp_vacant") {
					Menu1 setText( "^5Vacant Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Outside Truck" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Wood Boxes at Bombsite B" );
					Text6 setText( "^5Press ^3[{+smoke}] ^5To Teleport To: ^6Car at Edge of the Map " );
					Text7 setText( "^5Press ^3[{+activate}] ^5To Teleport To: ^6Oil Drums at Bombsite A" );
				} else if (getdvar("mapname") == "mp_nuked") {
					Menu1 setText( "^5Nuketown Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Balkon Yellow House" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Balkon Green House" );
				} else if (getdvar("mapname") == "mp_cross_fire") {
					Menu1 setText( "^5Crossfire Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Highest Spot" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Out of Map Plateau" );
				} else if (getdvar("mapname") == "mp_bloc") {
					Menu1 setText( "^5Bloc Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of half-destroyed House" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of Stonestairs" );
				} else if (getdvar("mapname") == "mp_cargoship") {
					Menu1 setText( "^5Wet Work Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of Conning Bridge" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of Ship's Mast " );
				} else if (getdvar("mapname") == "mp_killhouse") {
					Menu1 setText( "^5Killhouse Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Top of Midspot" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Top of House 3" );
				} else if (getdvar("mapname") == "mp_bog_sh") {
					Menu1 setText( "^5Bog Menu" );
					Text4 setText( "^5Press ^3[{+actionslot 3}] ^5To Teleport To: ^6Bridge" );
					Text5 setText( "^5Press ^3[{+actionslot 4}] ^5To Teleport To: ^6Out of Map House" );
				} else {
					Menu1 setText( "^1No Locations" );
					Text4 setText( "^1No Locations available" );
				}
				
				Text9 setText( "^5Press ^3[{+melee}] ^5To ^6Save ^5Your Current Location" );

				if (self.ufo == false) {
					Text8 setText( "^5Press ^3[{+gostand}] ^5To ^6Enter ^5Into ^6UFO Mode" );
				} else {
					Text8 setText( "^5Press ^3[{+gostand}] ^5To ^6Exit ^5Out Of ^6UFO Mode" );
				}
				
				if (self.pers["loc"] == false) {
					Text10 setText( "^5You Have To ^6Save ^5A Location ^5To Load It" );
				} else if (self.pers["loc"] == true) {
					Text10 setText( "^5Press ^3[{+reload}] ^5To ^6Load ^5Your Saved Location" );
				}

				if (self.pers["mySpawn"] == 0) {
					Text11 setText( "^5Press ^3[{+forward}] ^5To ^6Set ^5Your Spawn Point (Not Set)" );
				} else {
					Text11 setText( "^5Press ^3[{+forward}] ^5To ^6Set ^5Your Spawn Point (Set)" );
				}

			} else if (self.menuPos == 2) { // Equipment

				Menu1 setText( "^5Equipment Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^3Frag Grenade" );
				} else if (self.curPos != 1) {
					Text1 setText( "^5Frag Grenade" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^3Semtex Grenade" );
				} else if (self.curPos != 2) {
					Text2 setText( "^5Semtex Grenade" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^3Throwing Knife" );
				} else if (self.curPos != 3) {
					Text3 setText( "^5Throwing Knife" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^3Tactical Insertion" );
				} else if (self.curPos != 4) {
					Text4 setText( "^5Tactical Insertion" );
				}

				if (self.curPos == 5) {
					Text5 setText( "^3Blast Shield" );
				} else if (self.curPos != 5) {
					Text5 setText( "^5Blast Shield" );
				}

				if (self.curPos == 6) {
					Text6 setText( "^3Claymore" );
				} else if (self.curPos != 6) {
					Text6 setText( "^5Claymore" );
				}

				if (self.curPos == 7) {
					Text7 setText( "^3C4" );
				} else if (self.curPos != 7) {
					Text7 setText( "^5C4" );
				}

				if (self.curPos == 8) {
					Text8 setText( "^3LightStick" );
				} else if (self.curPos != 8) {
					Text8 setText( "^5LightStick" );
				}

			} else if (self.menuPos == 3) { // Weapons
				
				Menu1 setText( "^5Weapons Menu" );
			
				if (self.weaponStatus == 1) {

					if (self.secIsPrimary == true) {

						if (self.weaponStatus == 1) {
							Menu2 setText( "^5Press ^3[{+reload}] ^5to ^3switch teirs" );

							if (self.secTeir == 1) {
								Menu3 setText( "^3Current Teir: ^3Assualt Rifles" );
							} else if (self.secTeir == 2) {
								Menu3 setText( "^3Current Teir: ^3Sub Machine Guns" );
							} else if (self.secTeir == 3) {
								Menu3 setText( "^3Current Teir: ^3Sniper Rifles" );
							} else if (self.secTeir == 4) {
								Menu3 setText( "^3Current Teir: ^3Light Machine Guns" );
							} else if (self.secTeir == 5) {
								Menu3 setText( "^3Current Teir: ^3Riot Shield" );
							}
						} else {
							Menu2 setText( "" );
							Menu3 setText( "" );
						}
					} else {
						Menu2 setText( "^3Choose a Primary Weapon" );
						Menu3 setText( "" );
					}

					if (self.secIsPrimary == true) {

						if (self.secTeir == 1) {

							if (self.curPos == 1) {
								Text1 setText( "^3M4A1" );
							} else if (self.curPos != 1) {
								Text1 setText( "^5M4A1" );
							}

							if (self.curPos == 2) {
								Text2 setText( "^3Famas" );
							} else if (self.curPos != 2) {
								Text2 setText( "^5Famas" );
							}

							if (self.curPos == 3) {
								Text3 setText( "^3SCAR-H" );
							} else if (self.curPos != 3) {
								Text3 setText( "^5SCAR-H" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^3TAR-21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^5TAR-21" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^3FAL" );
							} else if (self.curPos != 5) {
								Text5 setText( "^5FAL" );
							}
	
							if (self.curPos == 6) {
								Text6 setText( "^3M16A4" );
							} else if (self.curPos != 6) {
								Text6 setText( "^5M16A4" );
							}
	
							if (self.curPos == 7) {
								Text7 setText( "^3ACR" );
							} else if (self.curPos != 7) {
								Text7 setText( "^5ACR" );
							}
	
							if (self.curPos == 8) {
								Text8 setText( "^3F2000" );
							} else if (self.curPos != 8) {
								Text8 setText( "^5F2000" );
							}
	
							if (self.curPos == 9) {
								Text9 setText( "^3AK-47" );
							} else if (self.curPos != 9) {
								Text9 setText( "^5AK-47" );
							}

						} else if (self.secTeir == 2) {

							if (self.curPos == 1) {
								Text1 setText( "^3MP5K" );
							} else if (self.curPos != 1) {
								Text1 setText( "^5MP5K" );
							}
	
							if (self.curPos == 2) {
								Text2 setText( "^3UMP 45" );
							} else if (self.curPos != 2) {
								Text2 setText( "^5UMP 45" );
							}
	
							if (self.curPos == 3) {
								Text3 setText( "^3Vector" );
							} else if (self.curPos != 3) {
								Text3 setText( "^5Vector" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^3P90" );
							} else if (self.curPos != 4) {
								Text4 setText( "^5P90" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^3Mini-Uzi" );
							} else if (self.curPos != 5) {
								Text5 setText( "^5Mini-Uzi" );
							}
	
						} else if (self.secTeir == 3) {

							if (self.curPos == 1) {
								Text1 setText( "^3Intervention" );
							} else if (self.curPos != 1) {
								Text1 setText( "^5Intervention" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^3Barrett .50cal" );
							} else if (self.curPos != 2) {
								Text2 setText( "^5Barrett .50cal" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^3WA2000" );
							} else if (self.curPos != 3) {
								Text3 setText( "^5WA2000" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^3M21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^5M21" );
							}
	
						} else if (self.secTeir == 4) {

							if (self.curPos == 1) {
								Text1 setText( "^3L86 LSW" );
							} else if (self.curPos != 1) {
								Text1 setText( "^5L86 LSW" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^3MG4" );
							} else if (self.curPos != 2) {
								Text2 setText( "^5MG4" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^3RPD" );
							} else if (self.curPos != 3) {
								Text3 setText( "^5RPD" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^3AUG H Bar" );
							} else if (self.curPos != 4) {
								Text4 setText( "^5AUG H Bar" );
							}
		
							if (self.curPos == 5) {
								Text5 setText( "^3M240" );
							} else if (self.curPos != 5) {
								Text5 setText( "^5M240" );
							}
	
						} else if (self.secTeir == 5) {

							Text1 setText( "^3Riotshield" );
						}
					
					} else {
						
						if (self.curPos == 1) {
							Text1 setText( "^3Intervention" );
						} else if (self.curPos != 1) {
							Text1 setText( "^5Intervention" );
						}
							
						if (self.curPos == 2) {
							Text2 setText( "^3Barrett .50cal" );
						} else if (self.curPos != 2) {
							Text2 setText( "^5Barrett .50cal" );
						}
	
						if (self.curPos == 3) {
							Text3 setText( "^3WA2000" );
						} else if (self.curPos != 3) {
							Text3 setText( "^5WA2000" );
						}
	
						if (self.curPos == 4) {
							Text4 setText( "^3M21" );
						} else if (self.curPos != 4) {
							Text4 setText( "^5M21" );
						}
	
						if (self.curPos == 5) {
							Text5 setText( "^3Customized Trickshot Class" );
						} else if (self.curPos != 5) {
							Text5 setText( "^5Customized Trickshot Class" );
						}
	
						if (self.pers["created"] == false)
						{
							if (self.curPos == 6)
								Text6 setText( "^3Create a Class [Load]" );
							else
								Text6 setText( "^5Create a Class [Load]" );
						}
						else
						{
							if (self.curPos == 6)
								Text6 setText( "^3Load Last Saved Class" );
							else
								Text6 setText( "^5Load Last Saved Class" );
						}
						
							if (self.pers["created"] == false)
						{
							if (self.curPos == 7)
								Text7 setText( "^3Create a Class [Spawn]" );
							else
								Text7 setText( "^5Create a Class [Spawn]" );
						}
						else
						{
							if (self.curPos == 7)
								Text7 setText( "^3Spawn with Custom Class[^2ON^3/^1OFF^3]" );
							else
								Text7 setText( "^5Spawn with Custom Class[^2ON^5/^1OFF^5]" );
						}
					}
				
				} else if (self.weaponStatus == 2) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^5None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Silencer" );
					} else if (self.curPos != 2) {
						Text2 setText( "^5Silencer" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3ACOG" );
					} else if (self.curPos != 3) {
						Text3 setText( "^5ACOG" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^5FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3Heartbeat Sensor" );
					} else if (self.curPos != 5) {
						Text5 setText( "^5Heartbeat Sensor" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3Thermal Scope" );
					} else if (self.curPos != 6) {
						Text6 setText( "^5Thermal Scope" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^5Extended Mags" );
					}

				} else if (self.weaponStatus == 3) {
					Menu2 setText( "^3Choose a secondary weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3Machine Pistols" );
						Text2 setText( "^5Handguns" );
						Text3 setText( "^5Shotguns" );
						Text4 setText( "^5Launchers" );
						Text5 setText( "^5Default Weapon" );
						Text6 setText( "^5Second Primary" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5Machine Pistols" );
						Text2 setText( "^3Handguns" );
						Text3 setText( "^5Shotguns" );
						Text4 setText( "^5Launchers" );
						Text5 setText( "^5Default Weapon" );
						Text6 setText( "^5Second Primary" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5Machine Pistols" );
						Text2 setText( "^5Handguns" );
						Text3 setText( "^3Shotguns" );
						Text4 setText( "^5Launchers" );
						Text5 setText( "^5Default Weapon" );
						Text6 setText( "^5Second Primary" );
					} else if (self.curPos == 4) {
						Text1 setText( "^5Machine Pistols" );
						Text2 setText( "^5Handguns" );
						Text3 setText( "^5Shotguns" );
						Text4 setText( "^3Launchers" );
						Text5 setText( "^5Default Weapon" );
						Text6 setText( "^5Second Primary" );
					} else if (self.curPos == 5) {
						Text1 setText( "^5Machine Pistols" );
						Text2 setText( "^5Handguns" );
						Text3 setText( "^5Shotguns" );
						Text4 setText( "^5Launchers" );
						Text5 setText( "^3Default Weapon" );
						Text6 setText( "^5Second Primary" );
					} else if (self.curPos == 6) {
						Text1 setText( "^5Machine Pistols" );
						Text2 setText( "^5Handguns" );
						Text3 setText( "^5Shotguns" );
						Text4 setText( "^5Launchers" );
						Text5 setText( "^5Default Weapon" );
						Text6 setText( "^3Second Primary" );
					}

				} else if (self.weaponStatus == 4) {
					Menu2 setText( "^3Choose a pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^3USP .45" );
						Text2 setText( "^5.44 Magnum" );
						Text3 setText( "^5M9" );
						Text4 setText( "^5Desert Eagle" );
						Text5 setText( "^5Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5USP .45" );
						Text2 setText( "^3.44 Magnum" );
						Text3 setText( "^5M9" );
						Text4 setText( "^5Desert Eagle" );
						Text5 setText( "^5Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5USP .45" );
						Text2 setText( "^5.44 Magnum" );
						Text3 setText( "^3M9" );
						Text4 setText( "^5Desert Eagle" );
						Text5 setText( "^5Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^5USP .45" );
						Text2 setText( "^5.44 Magnum" );
						Text3 setText( "^5M9" );
						Text4 setText( "^3Desert Eagle" );
						Text5 setText( "^5Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^5USP .45" );
						Text2 setText( "^5.44 Magnum" );
						Text3 setText( "^5M9" );
						Text4 setText( "^5Desert Eagle" );
						Text5 setText( "^3Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 5) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Akimbo" );
						Text5 setText( "^5Tactical Knife" );
						Text6 setText( "^5Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5None" );
						Text2 setText( "^3FMJ" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Akimbo" );
						Text5 setText( "^5Tactical Knife" );
						Text6 setText( "^5Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^3Silencer" );
						Text4 setText( "^5Akimbo" );
						Text5 setText( "^5Tactical Knife" );
						Text6 setText( "^5Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^5None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^3Akimbo" );
						Text5 setText( "^5Tactical Knife" );
						Text6 setText( "^5Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^5None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Akimbo" );
						Text5 setText( "^3Tactical Knife" );
						Text6 setText( "^5Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 6) {
						Text1 setText( "^5None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Akimbo" );
						Text5 setText( "^5Tactical Knife" );
						Text6 setText( "^3Extended Mags" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 6) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^5Akimbo" );
						Text4 setText( "^5Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5None" );
						Text2 setText( "^3FMJ" );
						Text3 setText( "^5Akimbo" );
						Text4 setText( "^5Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^3Akimbo" );
						Text4 setText( "^5Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^5None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^5Akimbo" );
						Text4 setText( "^3Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 7) {
					Menu2 setText( "^3Choose a shotgun" );

					if (self.curPos == 1) {
						Text1 setText( "^3Spas12" );
						Text2 setText( "^5AA12" );
						Text3 setText( "^5Striker" );
						Text4 setText( "^5Ranger" );
						Text5 setText( "^5M1014" );
						Text6 setText( "^5Model 1887" );
						Text7 setText( "^5Back" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5Spas12" );
						Text2 setText( "^3AA12" );
						Text3 setText( "^5Striker" );
						Text4 setText( "^5Ranger" );
						Text5 setText( "^5M1014" );
						Text6 setText( "^5Model 1887" );
						Text7 setText( "^5Back" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5Spas12" );
						Text2 setText( "^5AA12" );
						Text3 setText( "^3Striker" );
						Text4 setText( "^5Ranger" );
						Text5 setText( "^5M1014" );
						Text6 setText( "^5Model 1887" );
						Text7 setText( "^5Back" );
					} else if (self.curPos == 4) {
						Text1 setText( "^5Spas12" );
						Text2 setText( "^5AA12" );
						Text3 setText( "^5Striker" );
						Text4 setText( "^3Ranger" );
						Text5 setText( "^5M1014" );
						Text6 setText( "^5Model 1887" );
						Text7 setText( "^5Back" );
					} else if (self.curPos == 5) {
						Text1 setText( "^5Spas12" );
						Text2 setText( "^5AA12" );
						Text3 setText( "^5Striker" );
						Text4 setText( "^5Ranger" );
						Text5 setText( "^3M1014" );
						Text6 setText( "^5Model 1887" );
						Text7 setText( "^5Back" );
					} else if (self.curPos == 6) {
						Text1 setText( "^5Spas12" );
						Text2 setText( "^5AA12" );
						Text3 setText( "^5Striker" );
						Text4 setText( "^5Ranger" );
						Text5 setText( "^5M1014" );
						Text6 setText( "^3Model 1887" );
						Text7 setText( "^5Back" );
					} else if (self.curPos == 7) {
						Text1 setText( "^5Spas12" );
						Text2 setText( "^5AA12" );
						Text3 setText( "^5Striker" );
						Text4 setText( "^5Ranger" );
						Text5 setText( "^5M1014" );
						Text6 setText( "^5Model 1887" );
						Text7 setText( "^3Back" );
					}
				} else if (self.weaponStatus == 8) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^5Red Dot Sight" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Grip" );
						Text5 setText( "^5FMJ" );
						Text6 setText( "^5Holographic Sight" );
						Text7 setText( "^5Extended Mags" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5None" );
						Text2 setText( "^3Red Dot Sight" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Grip" );
						Text5 setText( "^5FMJ" );
						Text6 setText( "^5Holographic Sight" );
						Text7 setText( "^5Extended Mags" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5None" );
						Text2 setText( "^5Red Dot Sight" );
						Text3 setText( "^3Silencer" );
						Text4 setText( "^5Grip" );
						Text5 setText( "^5FMJ" );
						Text6 setText( "^5Holographic Sight" );
						Text7 setText( "^5Extended Mags" );
					} else if (self.curPos == 4) {
						Text1 setText( "^5None" );
						Text2 setText( "^5Red Dot Sight" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^3Grip" );
						Text5 setText( "^5FMJ" );
						Text6 setText( "^5Holographic Sight" );
						Text7 setText( "^5Extended Mags" );
					} else if (self.curPos == 5) {
						Text1 setText( "^5None" );
						Text2 setText( "^5Red Dot Sight" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Grip" );
						Text5 setText( "^3FMJ" );
						Text6 setText( "^5Holographic Sight" );
						Text7 setText( "^5Extended Mags" );
					} else if (self.curPos == 6) {
						Text1 setText( "^5None" );
						Text2 setText( "^5Red Dot Sight" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Grip" );
						Text5 setText( "^5FMJ" );
						Text6 setText( "^3Holographic Sight" );
						Text7 setText( "^5Extended Mags" );
					} else if (self.curPos == 7) {
						Text1 setText( "^5None" );
						Text2 setText( "^5Red Dot Sight" );
						Text3 setText( "^5Silencer" );
						Text4 setText( "^5Grip" );
						Text5 setText( "^5FMJ" );
						Text6 setText( "^5Holographic Sight" );
						Text7 setText( "^3Extended Mags" );
					}
				} else if (self.weaponStatus == 9) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^5Akimbo" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5None" );
						Text2 setText( "^3FMJ" );
						Text3 setText( "^5Akimbo" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5None" );
						Text2 setText( "^5FMJ" );
						Text3 setText( "^3Akimbo" );
					}
				} else if (self.weaponStatus == 10) {
					Menu2 setText( "^3Choose a launcher" );

					if (self.curPos == 1) {
						Text1 setText( "^3AT4-HS" );
						Text2 setText( "^5Thumper" );
						Text3 setText( "^5Stinger" );
						Text4 setText( "^5Javelin" );
						Text5 setText( "^5RPG-7" );
						Text6 setText( "^5Back" );
					} else if (self.curPos == 2) {
						Text1 setText( "^5AT4-HS" );
						Text2 setText( "^3Thumper" );
						Text3 setText( "^5Stinger" );
						Text4 setText( "^5Javelin" );
						Text5 setText( "^5RPG-7" );
						Text6 setText( "^5Back" );
					} else if (self.curPos == 3) {
						Text1 setText( "^5AT4-HS" );
						Text2 setText( "^5Thumper" );
						Text3 setText( "^3Stinger" );
						Text4 setText( "^5Javelin" );
						Text5 setText( "^5RPG-7" );
						Text6 setText( "^5Back" );
					} else if (self.curPos == 4) {
						Text1 setText( "^5AT4-HS" );
						Text2 setText( "^5Thumper" );
						Text3 setText( "^5Stinger" );
						Text4 setText( "^3Javelin" );
						Text5 setText( "^5RPG-7" );
						Text6 setText( "^5Back" );
					} else if (self.curPos == 5) {
						Text1 setText( "^5AT4-HS" );
						Text2 setText( "^5Thumper" );
						Text3 setText( "^5Stinger" );
						Text4 setText( "^5Javelin" );
						Text5 setText( "^3RPG-7" );
						Text6 setText( "^5Back" );
					} else if (self.curPos == 6) {
						Text1 setText( "^5AT4-HS" );
						Text2 setText( "^5Thumper" );
						Text3 setText( "^5Stinger" );
						Text4 setText( "^5Javelin" );
						Text5 setText( "^5RPG-7" );
						Text6 setText( "^3Back" );
					}
				} else if (self.weaponStatus == 11) {
					Menu2 setText( "^3Choose a machine pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^3PP2000" );
					} else if (self.curPos != 1) {
						Text1 setText( "^5PP2000" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3G18" );
					} else if (self.curPos != 2) {
						Text2 setText( "^5G18" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3M93 Raffica" );
					} else if (self.curPos != 3) {
						Text3 setText( "^5M93 Raffica" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3TMP" );
					} else if (self.curPos != 4) {
						Text4 setText( "^5TMP" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3Back" );
					} else if (self.curPos != 5) {
						Text5 setText( "^5Back" );
					}
				} else if (self.weaponStatus == 12) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^5None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 2) {
						Text2 setText( "^5Red Dot Sight" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Silencer" );
					} else if (self.curPos != 3) {
						Text3 setText( "^5Silencer" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^5FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3Akimbo" );
					} else if (self.curPos != 5) {
						Text5 setText( "^5Akimbo" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3Holographic Sight" );
					} else if (self.curPos != 6) {
						Text6 setText( "^5Holographic Sight" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^5Extended Mags" );
					}

				} else if (self.weaponStatus == 13) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^5None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Grenade Launcher" );
					} else if (self.curPos != 2) {
						Text2 setText( "^5Grenade Launcher" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^5Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^5Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^5ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^5FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Shotgun Attachment" );
					} else if (self.curPos != 7) {
						Text7 setText( "^5Shotgun Attachment" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^3Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^5Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3Heartbeat Sensor" );
					} else if (self.curPos != 9) {
						Text9 setText( "^5Heartbeat Sensor" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Thermal Scope" );
					} else if (self.curPos != 10) {
						Text10 setText( "^5Thermal Scope" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^3Extended Mags" );
					} else if (self.curPos != 11) {
						Text11 setText( "^5Extended Mags" );
					}

				} else if (self.weaponStatus == 14) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^5None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Rapid Fire" );
					} else if (self.curPos != 2) {
						Text2 setText( "^5Rapid Fire" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^5Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^5Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^5ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^5FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Akimbo" );
					} else if (self.curPos != 7) {
						Text7 setText( "^5Akimbo" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^3Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^5Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^5Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^5Extended Mags" );
					}
				} else if (self.weaponStatus == 15) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^5None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Grip" );
					} else if (self.curPos != 2) {
						Text2 setText( "^5Grip" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^5Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^5Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^5ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^5FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Holographic Sight" );
					} else if (self.curPos != 7) {
						Text7 setText( "^5Holographic Sight" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^3Heartbeat Sensor" );
					} else if (self.curPos != 8) {
						Text8 setText( "^5Heartbeat Sensor" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^5Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^5Extended Mags" );
					}
				}

			} else if (self.menuPos == 4) { //Killstreaks
				
				Menu1 setText( "^5Killstreak Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^3UAV" );
				} else if (self.curPos != 1) {
					Text1 setText( "^5UAV" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^3Care Package" );
				} else if (self.curPos != 2) {
					Text2 setText( "^5Care Package" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^3Sentry Gun" );
				} else if (self.curPos != 3) {
					Text3 setText( "^5Sentry Gun" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^3Predator Missile" );
				} else if (self.curPos != 4) {
					Text4 setText( "^5Predator Missile" );
				}
				
				if (self.curPos == 5) {
					Text5 setText( "^3EMP" );
				} else if (self.curPos != 5) {
					Text5 setText( "^5EMP" );
				}
				if (self.curPos == 6) {
					Text6 setText( "^3Nuke" );
				} else if (self.curPos != 6) {
					Text6 setText( "^5Nuke" );
				}
			
			} else if (self.menuPos == 5) { // Character Preferences
				
				Menu1 setText( "^5Character Preferences" );

				if (self.curPos == 1) {
					Text1 setText( "^3Set Ammo In Stock To 0" );
				} else if (self.curPos != 1) {
					Text1 setText( "^5Set Ammo In Stock To 0" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^3Set Ammo In Clip To 0" );
				} else if (self.curPos != 2) {
					Text2 setText( "^5Set Ammo In Clip To 0" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^3Refill Everything" );
				} else if (self.curPos != 3) {
					Text3 setText( "^5Refill Everything" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^3Regen. Ammo On Reload: " + self.pers["rAmmo"] );
				} else if (self.curPos != 4) {
					Text4 setText( "^5Regen. Ammo On Reload: " + self.pers["rAmmo"] );
				}

				if (self.curPos == 5) {
					Text5 setText( "^3Regen. Special Grenades: " + self.pers["rSpec"] );
				} else if (self.curPos != 5) {
					Text5 setText( "^5Regen. Special Grenades: " + self.pers["rSpec"] );
				}

				if (self.curPos == 6) {
					Text6 setText( "^3Regen. Equipment: " + self.pers["rEquip"] );
				} else if (self.curPos != 6) {
					Text6 setText( "^5Regen. Equipment: " + self.pers["rEquip"] );
				}

			} else if (self.menuPos == 6) { // Match Settings
				
				Menu1 setText( "^5Match Settings" );
				
				if (self.curPos == 1) {
					Text1 setText( "^3Third Person: ^3" + self.thirdPerson );
				} else if (self.curPos != 1) {
					Text1 setText( "^5Third Person: ^3" + self.thirdPerson );
				}

				if (self.curPos == 2) {
					Text2 setText( "^3Super Jump: ^3" + self.superjump );
				} else if (self.curPos != 2) {
					Text2 setText( "^5Super Jump: ^3" + self.superjump );
				}
				
				if (self.curPos == 3) {
					Text3 setText( "^3Low Gravity: ^3" + self.lowgrav );
				} else if (self.curPos != 3) {
					Text3 setText( "^5Low Gravity: ^3" + self.lowgrav );
				}

				if (self.curPos == 4) {
					Text4 setText( "^3Damage: ^3" + self.damageLevelStatus );
				} else if (self.curPos != 4) {
					Text4 setText( "^5Damage: ^3" + self.damageLevelStatus );
				}

				if (self.curPos == 5) {
					Text5 setText( "^3Explosive Bullets: ^3" + self.kos );
				} else if (self.curPos != 5) {
					Text5 setText( "^5Explosive Bullets: ^3" + self.kos );
				}

				if (self.curPos == 6) {
					Text6 setText( "^3Slow Motion: ^3" + self.slowmoScale );
				} else if (self.curPos != 6) {
					Text6 setText( "^5Slow Motion: ^3" + self.slowmoScale );
				}
				
				if (self.curPos == 7) {
					Menu2 setText( "^5Can't be turned back on, changes will happened in next round" ); 
					Text7 setText( "^3Death Barriers: ^3" + self.dbarriers );
				} else if (self.curPos != 7) {
					Text7 setText( "^5Death Barriers: ^3" + self.dbarriers );
				}
				
				if (self.curPos == 8) {
					Menu2 setText("^5Floaters will be ^2enabled^5 or ^1disabled ^5in the next round");
					Text8 setText( "^3Floaters: ^3" + self.floaters );
				} else if (self.curPos != 8) {
					Text8 setText( "^5Floaters: ^3" + self.floaters );
				}
			
			} else if (self.menuPos == 7) { // Change Map
				
				Menu1 setText( "^5Change Map" );
				Menu2 setText( "^5Press ^3[{+reload}] ^5to ^3swap between DLC ^5Press ^3[{+melee}] ^5to ^3swap pages" );
				
				if (self.mapPack == 0)
					Menu3 setText( "^3Normal Maps: ^5Page " + self.page + "/2" );
				else
					Menu3 setText( "^3DLC Maps: ^5Page " + self.page + "/2" );

				if (self.mapPack == 0) {
					if (self.page == 1) {

						if (self.curPos == 1) {
							Text1 setText( "^3Afghan" );
						} else if (self.curPos != 1) {
							Text1 setText( "^5Afghan" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^3Derail" );
						} else if (self.curPos != 2) {
							Text2 setText( "^5Derail" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^3Estate" );
						} else if (self.curPos != 3) {
							Text3 setText( "^5Estate" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^3Favela" );
						} else if (self.curPos != 4) {
							Text4 setText( "^5Favela" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^3Highrise" );
						} else if (self.curPos != 5) {
							Text5 setText( "^5Highrise" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^3Invasion" );
						} else if (self.curPos != 6) {
							Text6 setText( "^5Invasion" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^3Karachi" );
						} else if (self.curPos != 7) {
							Text7 setText( "^5Karachi" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^3Quarry" );
						} else if (self.curPos != 8) {
							Text8 setText( "^5Quarry" );
						}

					} else if (self.page == 2) {

						if (self.curPos == 1) {
							Text1 setText( "^3Rundown" );
						} else if (self.curPos != 1) {
							Text1 setText( "^5Rundown" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^3Rust" );
						} else if (self.curPos != 2) {
							Text2 setText( "^5Rust" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^3Scrapyard" );
						} else if (self.curPos != 3) {
							Text3 setText( "^5Scrapyard" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^3Skidrow" );
						} else if (self.curPos != 4) {
							Text4 setText( "^5Skidrow" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^3Sub Base" );
						} else if (self.curPos != 5) {
							Text5 setText( "^5Sub Base" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^3Terminal" );
						} else if (self.curPos != 6) {
							Text6 setText( "^5Terminal" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^3Underpass" );
						} else if (self.curPos != 7) {
							Text7 setText( "^5Underpass" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^3Wasteland" );
						} else if (self.curPos != 8) {
							Text8 setText( "^5Wasteland" );
						}
					}
				
				} else if (self.mapPack == 1) {
					if (self.page == 1) {
					
					if (self.curPos == 1) {
						Text1 setText( "^3Bailout" );
					} else if (self.curPos != 1) {
						Text1 setText( "^5Bailout" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Crash" );
					} else if (self.curPos != 2) {
						Text2 setText( "^5Crash" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Overgrown" );
					} else if (self.curPos != 3) {
						Text3 setText( "^5Overgrown" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Salvage" );
					} else if (self.curPos != 4) {
						Text4 setText( "^5Salvage" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3Storm" );
					} else if (self.curPos != 5) {
						Text5 setText( "^5Storm" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3Carnival" );
					} else if (self.curPos != 6) {
						Text6 setText( "^5Carnival" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Fuel" );
					} else if (self.curPos != 7) {
						Text7 setText( "^5Fuel" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^3Strike" );
					} else if (self.curPos != 8) {
						Text8 setText( "^5Strike" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3Trailer Park" );
					} else if (self.curPos != 9) {
						Text9 setText( "^5Trailer Park" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Vacant" );
					} else if (self.curPos != 10) {
						Text10 setText( "^5Vacant" );
					}
			
					}
					else if (self.page == 2) {
					
					if (self.curPos == 1) {
							Text1 setText( "^3Bog" );
						} else if (self.curPos != 1) {
							Text1 setText( "^5Bog" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^3Bloc" );
						} else if (self.curPos != 2) {
							Text2 setText( "^5Bloc" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^3Crossfire" );
						} else if (self.curPos != 3) {
							Text3 setText( "^5Crossfire" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^3Killhouse" );
						} else if (self.curPos != 4) {
							Text4 setText( "^5Killhouse" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^3Nuketown" );
						} else if (self.curPos != 5) {
							Text5 setText( "^5Nuketown" );
						}
						
						if (self.curPos == 6) {
							Text6 setText( "^3Wet Work" );
						} else if (self.curPos != 6) {
							Text6 setText( "^5Wet Work" );
						}
						
						if (self.curPos == 7) {
							Text7 setText( "^3Crash Tropical" );
						} else if (self.curPos != 7) {
							Text7 setText( "^5Crash Tropical" );
						}
						
						if (self.curPos == 8) {
							Text8 setText( "^3Favela Tropical" );
						} else if (self.curPos != 8) {
							Text8 setText( "^5Favela Tropical" );
						}
						
						if (self.curPos == 9) {
							Text9 setText( "^3Estate Tropical" );
						} else if (self.curPos != 9) {
							Text9 setText( "^5Estate Tropical" );
						}
						
						if (self.curPos == 10) {
							Text10 setText( "^3Storm Spring" );
						} else if (self.curPos != 10) {
							Text10 setText( "^5Storm Spring" );
						}
					}
				}

			} else if (self.menuPos == 8) { // Bot Settings

				Menu1 setText( "^5Bot Settings" );
				Menu2 setText( "^5Press ^3[{+reload}] ^5to ^3cycle up" );
				Menu3 setText( "^5Press ^3[{+melee}] ^5to ^3cycle down" );

				moveName = getDvar( "moveName" );

				if (self.curPos == 1) {
					Text1 setText( "^3Controll Bot: ^3" + moveName );
				} else if (self.curPos != 1) {
					Text1 setText( "^5Controll Bot: ^3" + moveName );
				}

				if (self.curPos == 2) {
					Text2 setText( "^3Bots Move: ^3" + self.bMove );
				} else if (self.curPos != 2) {
					Text2 setText( "^5Bots Move: ^3" + self.bMove );
				}

				if (self.curPos == 3) {
					Text3 setText( "^3Bots Shoot: ^3" + self.bShoot );
				} else if (self.curPos != 3) {
					Text3 setText( "^5Bots Shoot: ^3" + self.bShoot );
				}

				if (self.curPos == 4) {
					Text4 setText( "^3Bots Reload: ^3" + self.bReload );
				} else if (self.curPos != 4) {
					Text4 setText( "^5Bots Reload: ^3" + self.bReload );
				}

				if (self.curPos == 5) {
					Text5 setText( "^3Bots Lock On: ^3" + self.bLock );
				} else if (self.curPos != 5) {
					Text5 setText( "^5Bots Lock On: ^3" + self.bLock );
				}
				
			} else if (self.menuPos == 9) { // Kick Menu

				Menu1 setText( "^5Kick Player Menu" );

				if (level.players.size > 9) {
					Menu2 setText( "^5Press ^3[{+reload}] ^5To ^3Switch Pages." );
					Menu3 setText( "^3Page: ^6" + self.kickPage + "/2" );
				} else {
					Menu2 setText( "^3The second page will open up" );
					Menu3 setText( "^3once there's more than 9 players." );
				}

				if (self.kickPage == 1) {
					if (self.curPos == 1)
						Text1 setText( "^3" + level.players[0].name );
					else
						Text1 setText( "^5" + level.players[0].name );

					if (self.curPos == 2)
						Text2 setText( "^3" + level.players[1].name );
					else
						Text2 setText( "^5" + level.players[1].name );

					if (self.curPos == 3)
						Text3 setText( "^3" + level.players[2].name );
					else	
						Text3 setText( "^5" + level.players[2].name );

					if (self.curPos == 4)
						Text4 setText( "^3" + level.players[3].name );
					else
						Text4 setText( "^5" + level.players[3].name );

					if (self.curPos == 5)
						Text5 setText( "^3" + level.players[4].name );
					else
						Text5 setText( "^5" + level.players[4].name );

					if (self.curPos == 6)
						Text6 setText( "^3" + level.players[5].name );
					else
						Text6 setText( "^5" + level.players[5].name );

					if (self.curPos == 7)
						Text7 setText( "^3" + level.players[6].name );
					else
						Text7 setText( "^5" + level.players[6].name );

					if (self.curPos == 8)
						Text8 setText( "^3" + level.players[7].name );
					else
						Text8 setText( "^5" + level.players[7].name );

					if (self.curPos == 9)
						Text9 setText( "^3" + level.players[8].name );
					else
						Text9 setText( "^5" + level.players[8].name );

				} else if (self.kickPage == 2) {

					if (self.curPos == 1)
						Text1 setText( "^3" + level.players[9].name );
					else
						Text1 setText( "^5" + level.players[9].name );

					if (self.curPos == 2)
						Text2 setText( "^3" + level.players[10].name );
					else
						Text2 setText( "^5" + level.players[10].name );

					if (self.curPos == 3)
						Text3 setText( "^3" + level.players[11].name );
					else	
						Text3 setText( "^5" + level.players[11].name );

					if (self.curPos == 4)
						Text4 setText( "^3" + level.players[12].name );
					else
						Text4 setText( "^5" + level.players[12].name );

					if (self.curPos == 5)
						Text5 setText( "^3" + level.players[13].name );
					else
						Text5 setText( "^5" + level.players[13].name );

					if (self.curPos == 6)
						Text6 setText( "^3" + level.players[14].name );
					else
						Text6 setText( "^5" + level.players[14].name );

					if (self.curPos == 7)
						Text7 setText( "^3" + level.players[15].name );
					else
						Text7 setText( "^5" + level.players[15].name );

					if (self.curPos == 8)
						Text8 setText( "^3" + level.players[16].name );
					else
						Text8 setText( "^5" + level.players[16].name );

					if (self.curPos == 9)
						Text9 setText( "^3" + level.players[17].name );
					else
						Text9 setText( "^5" + level.players[17].name );
					}
				
			} else if (self.menuPos == 10) {
				
				Menu1 setText( "^5Binds" );
					
				Text1 setText( "^5Bind Overview" );
				Text2 setText( "^2[^5Press ^3[{+activate}] ^5To ^6Open ^5The ^3Quickbindmenu^2]" );
				Text3 setText( "" );
				Text4 setText( "^2[^5Settings^2]" );
				Text5 setText( "^5Explosive Bullets ^2-> ^3" + self.kos );
				Text6 setText( "^5Damage Status ^2-> ^3" + self.damageLevelStatus );
				Text7 setText( "^5Slow Motion Scale ^2-> ^3" + self.slowmoScale );	
				Text8 setText( "^5Super Jump ^2-> ^3" + self.superjump );
				Text9 setText( "^5Low Gravity ^2-> ^3" + self.lowgrav );
				Text10 setText( "^5Death Barriers ^2-> ^3" + self.dbarriers );
				Text11 setText( "^5Floaters Toggle ^2-> ^3" + self.floaters );	
			}
		}
		wait 0.001;
	}
}