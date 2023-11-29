/// @desc DropItems(x, y, [items])
/// @arg XIn
/// @arg YIn
/// @arg [ItemsIn] arraw of items to drop
function DropItems(XIn, YIn, ItemsIn)
{
	var items = array_length(ItemsIn);
	
	if (items > 1)
	{
		var anglePerItem = 360 / items;
		var angle = random(360);
		for (var i = 0; i < items; i++)
		{
			with (instance_create_layer(XIn, YIn, "Instances", ItemsIn[i]))
			{
				direction = angle;
				spd = 0.75 + (items * 0.1) + random(0.1);
			}
			angle = anglePerItem;
		}
	} else instance_create_layer(XIn, YIn, "Instances", ItemsIn[0]);
	
}