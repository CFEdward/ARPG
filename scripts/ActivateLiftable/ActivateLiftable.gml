/// @arg Id
function ActivateLiftable(Id)
{
	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(sPlayerLift);
		
		global.iLifted = Id;
		with (global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}