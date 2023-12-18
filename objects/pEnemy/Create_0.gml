event_inherited();

// Intrinsic variables
state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
aggroCheck = 0;
aggroCheckDuration = 5;
stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWaitDuration = 0;

// Enemy Stats
timePassed = 0;
waitDuration = 60;
wait = 0;

// Enemy Sprites
sprMove = sSlime;

// Enemy Scripts
enemyScript[ENEMYSTATE.IDLE] = noone;
enemyScript[ENEMYSTATE.WANDER] = noone;
enemyScript[ENEMYSTATE.CHASE] = noone;
enemyScript[ENEMYSTATE.ATTACK] = noone;
enemyScript[ENEMYSTATE.HURT] = noone;
enemyScript[ENEMYSTATE.DIE] = noone;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;