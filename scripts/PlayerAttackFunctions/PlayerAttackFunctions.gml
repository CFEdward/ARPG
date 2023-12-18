// 
function AttackSlash()
{
	// Attack just started
	if (sprite_index != sPlayerAttackSlash)
	{
		// Setup animation
		sprite_index = sPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
		
		// Clear hit list
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}
	
	CalcAttack(sPlayerAttackSlashHB);
	
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
	}
}

function AttackSpin(){}

// Use attack hitbox & check for hits
function CalcAttack(MaskIndex)
{
	mask_index = MaskIndex;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			// If this instance has not yet been hit by this attack, hit it
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					if (object_is_ancestor(object_index, pEnemey))
					{
						HurtEnemy(id, 5, other.id, 10);
					}
					else if (entityHitScript != noone) script_execute(entityHitScript);
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = sPlayer;
}

function HurtEnemy(Enemy, Damage, Source, Knockback)
{
	with (Enemy)
	{
		if (state != ENEMYSTATE.DIE)
		{
			enemyHP -= Damage;
			flash = 1;
			
			// Hurt or dead?
			if (enemyHP <= 0)
			{
				state = ENEMYSTATE.DIE;
			}
			else
			{
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			}
			
			image_index = 0;
			if (Knockback != 0)
			{
				var knockDirection = point_direction(x, y, (Source).x, (Source).y);
				xTo = x - lengthdir_x(Knockback, knockDirection);
				yTo = y - lengthdir_y(Knockback, knockDirection);
			}
		}
	}
}