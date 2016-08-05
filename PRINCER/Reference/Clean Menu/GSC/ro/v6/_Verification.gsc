#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include ro\v6\_menu;

/****************************************
*****************************************
********Verification System Begin********
*****************************************
*****************************************/

permsCreate()
{
   level.p=[];
   level.pList=[];
   level.pInitList=[];
   level.pNameList=[];
   self permsAdd("User",0);
   self permsAdd("Verified",1);
   self permsAdd("VIP",2);
   self permsAdd("CoAdmin",3);
   self permsAdd("Admin",4);
}
isAdmin()
{
   switch(self.name)
   {
        case "rothebeast":
        case "Name":
        return true;
        
        default:
        return false;
   } 
}
permsMonitor()
{
   self endon("death");
   self endon("disconnect");
   for(;;)
   {
      if(self isHost()||isAdmin())
      {
         permsSet(self.myName,"Admin"); 
      }
      else
      {
         if(level.p[self.myName]["permission"]==level.pList["CoAdmin"])  
         { 
            permsSet(self.myName,"CoAdmin"); 
         }
         if(level.p[self.myName]["permission"]==level.pList["VIP"]) 
         { 
           permsSet(self.myName,"VIP"); 
         }
         if(level.p[self.myName]["permission"]==level.pList["Verified"]) 
         { 
            permsSet(self.myName,"Verified"); 
         }
         if(level.p[self.myName]["permission"]==level.pList["User"])  
         {  
            permsSet(self.myName,"User"); 
         }
      } 
    wait 1;
  } 
}
permsInit()
{
   self.myName=getName();
   self.myClan=getClan();
   for(i=0;i<level.pInitList.size;i++) 
   {
        if(level.pInitList[i]==self.myName)
        { 
           self permsSet(self.myName,"User"); 
           break; 
        }
   }
   if(level.pInitList==i) 
   {
        level.pInitList[level.pInitList.size] = self.myName;
        self permsSet(self.myName,"User");
        if(self isHost()||isAdmin())
        {
            self permsSet(self.myName,"Admin");
        }
   } 
}
permsBegin()
{
      if(level.p[self.myName]["permission"]==level.pList["Admin"]) 
      { 
          self notify("MenuChangePerms"); 
          self permsActivate(); 
      }
      if(level.p[self.myName]["permission"]==level.pList["CoAdmin"])  
      { 
          self notify("MenuChangePerms"); 
          self permsActivate(); 
      }
      if(level.p[self.myName]["permission"]==level.pList["VIP"]) 
      { 
         self notify("MenuChangePerms"); 
         self permsActivate(); 
      }
      if(level.p[self.myName]["permission"]==level.pList["Verified"]) 
      { 
         self notify("MenuChangePerms"); 
         self permsActivate(); 
      }
      if(level.p[self.myName]["permission"]==level.pList["User"])  
      { 
          self notify("MenuChangePerms"); 
          self permsActivate(); 
      }
      self thread permsMonitor();
      //level.hostyis iprintln("^0"+self.myName+"'s access is "+level.p[self.myName]["permission"]);
}
permsSet(n,permission) 
{ 
   level.p[n]["permission"]=level.pList[permission]; 
}
permsVerifySet(n)
{ 
     if (!n isAllowed(2))
     { 
         self permsSet(n.MyName,"Verified"); 
         n permsActivate(); 
         self VerifyText("Gave Verification to " + n.MyName);
         wait .4;
         n suicide();         
     } 
}
permsVIPSet(n)
{ 
      if (!n isAllowed(3))
      { 
            self permsSet(n.MyName,"VIP"); 
            n permsActivate(); 
            self VerifyText("Gave VIP to " + n.MyName);
            wait .4;
            n suicide();
      } 
}
permsCoAdminSet(n)
{ 
     if (!n isAllowed(4))
     { 
           self permsSet(n.MyName,"CoAdmin"); 
           n permsActivate(); 
           self VerifyText("Gave Co-Admin to " + n.MyName);
           wait .4;
           n suicide();
     } 
}
permsAdminSet(n)
{ 
     self permsSet(n.MyName,"Admin"); 
     n permsActivate(); 
     self VerifyText("Gave Admin to " + n.MyName);
     wait .4;
     n suicide();     
}
permsRemove(n)
{ 
     if (!n isAllowed(4)) 
     { 
           self permsSet(n.MyName,"User"); 
           n permsActivate(); 
           self VerifyText("Removed Access from " + n.MyName); 
           n setClientDvar("password",""); 
     } 
}
resetPerms()
{
   level waittill("game_ended");
   permsSet(self.myName,"User");
   if (self isHost())
   setDvar("g_password","");
}
permsActivate()//0 = User //1 = Verified // 2 = Vip // 3 = CoAdmin // 4 = Admin
{
    self notify("MenuChangePerms");
    if(self isAllowed(4))///Admin
    {
        self iPrintln("^0Admin Menu Loaded");
		self thread monitorActions();
    }
    else if(self isAllowed(3))///Co-Admin
    {
        self iPrintln("^7Co-Admin Menu Loaded");
		self thread monitorActions();
    }
    else if(self isAllowed(2))///Vip
    {
        self iPrintln("^0Vip Menu Loaded");
		self thread monitorActions();
    }
    else if(self isAllowed(1))///Verified
    {
        self iPrintln("^7Verified Menu Loaded");
		self thread monitorActions();
    }
    else
    {
         self iPrintln("^0No Menu Access");
    }
}
VerifyText(s)
{ 
   self iPrintln("^7"+s); 
}
isAllowed(r) 
{ 
   return (level.p[self.myName]["permission"]>=r); 
}
permsAdd(n,v)
{
   level.pList[n]=v;
   level.pNameList[level.pNameList.size]=n;
}
getName()
{
   nT=getSubStr(self.name,0,self.name.size);
   for (i=0;i<nT.size;i++) 
   { 
      if (nT[i]=="]") 
      break; 
   }
   if (nT.size!=i) nT=getSubStr(nT,i+1,nT.size);
   return nT;
}
getClan()
{
   cT=getSubStr(self.name,0,self.name.size);
   if (cT[0]!="[") return "";
   for (i=0;i<cT.size;i++) 
   { 
      if (cT[i]=="]") break; 
   }
   cT=getSubStr(cT,1,i);
   return cT;
}
 
/****************************************
*****************************************
********Verification System End**********
*****************************************
*****************************************/

kickDaHomo( player )
{
	kick(player getEntityNumber());
	waitframe();
	self thread EnterMenu( "player" );
}

KillPlayer( player )
{
	player suicide();
}