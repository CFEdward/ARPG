//

function PlayerThrow()
{
	with (global.iLifted)
	{
		lifted = false;
		persistent = false;
		thrown = true;
		//z = 13;
		throwPeakHeight = z + 10;
		throwDistanceTravelled = 0;
		throwStartPercent = (z / throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}
	
	PlayerActOutAnimation(sPlayerLift);
	global.iLifted = noone;
}