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
					image_blend = c_red;
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = sPlayer;
}