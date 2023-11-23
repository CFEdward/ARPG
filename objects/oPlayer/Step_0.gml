/// @description 

// Get Player Input
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(ord("E"));
keyAttack = mouse_check_button_pressed(mb_left);
keyItem = keyboard_check_pressed(ord("F"));
keyRoll = keyboard_check_pressed(vk_space);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

if (!global.gamePaused) state();