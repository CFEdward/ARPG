/// @description Initialize & Globals

randomize();

global.gamePaused = false;
global.textSpeed = .75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.playerHealthMax = 1.0;
global.playerHealth = global.playerHealthMax;

global.iLifted = noone;
global.iCamera = instance_create_layer(0, 0, layer, oCamera);
global.iUI = instance_create_layer(0, 0, layer, oUI);

//surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
display_set_gui_size(RESOLUTION_W, RESOLUTION_H)

room_goto(ROOM_START);