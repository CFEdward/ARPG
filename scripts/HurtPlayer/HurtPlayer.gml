// 
function HurtPlayer(Direction, Force, Damage)
{
	if (oPlayer.invulnerable <= 0)
	{
		global.playerHealth = max(0, global.playerHealth - Damage);
		
		if (global.playerHealth > 0)
		{
			with (oPlayer)
			{
				state = PlayerStateBonk;
				direction = Direction - 180;
				moveDistanceRemaining = Force;
				ScreenShake(2, 10);
				flash = 0.7;
				invulnerable = 60;
				flashShader = shRedFlash;
			}
		}
		else
		{
			// Kill the player
			with (oPlayer) state = PlayerStateDead;
		}
	}
}