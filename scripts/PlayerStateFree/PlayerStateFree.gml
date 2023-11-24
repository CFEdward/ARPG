// 

function PlayerStateFree()
{
	// Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	// Update Sprite Index
	var oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if (oldSprite != sprite_index) localFrame = 0;

	// Update Image Index
	PlayerAnimateSprite();
	
	// Roll
	if (keyRoll)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
	
	// Activate key logic
	if (keyActivate)
	{
		// 1. Check for an entity to activate
		// 2. If there is something and it has a script - Activate
		// 3. If the thing we activate is an NPC - make it face towards us
		
		var activateX = lengthdir_x(8, direction);
		var activateY = lengthdir_y(8, direction);
		activate = instance_position(x + activateX, y + activateY, pEntity);
		
		if (activate != noone && activate.entityActivateScript != -1)
		{
			// Activate the entity
			script_execute_ext(activate.entityActivateScript, activate.entityActivateArgs);
			
			if (activate.entityNPC)
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	}
}