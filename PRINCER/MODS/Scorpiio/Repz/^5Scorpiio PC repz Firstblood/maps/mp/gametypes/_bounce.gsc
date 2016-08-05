#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

doThreads()
{
	self thread doVariables();
	self thread detectVelocity();
	self thread forcePlayerBounce();	
}

doVariables()
{
	self.vel = 0;
	self.newVel = 0;
	self.topVel = 0;
	self.canBounce = true;
}

forcePlayerBounce()
{
	self endon( "death" );

	for(;;)
	{
		self notifyOnPlayerCommand( "bounce", "+bounce" );
		self waittill( "bounce" );

		if (self.vel[2] < 0 && self.canBounce == true) {
			self SetVelocity( self.newVel );
			self.canBounce = false;
			wait 5;
			self.canBounce = true;
		}
	}
}

detectVelocity()
{
	for(;;)
	{
		self.vel = self GetVelocity();

		if (!self isOnGround()) {
			self.newVel = (self.vel[0], self.vel[1], self Negate(self.vel[2]));
		}

		wait 0.001;
	}
}

Negate( vector )
{
	self endon( "death" );
	negative = vector - (vector * 2.125);
	return( negative );
}