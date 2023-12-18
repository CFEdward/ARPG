// Execute State Machine

if (!global.gamePaused)
{
	if (enemyScript[state] != noone) script_execute(enemyScript[state]);
	depth = -bbox_bottom;
}