// 

function NewTextBox(Message, Background = 1)
{
	var obj = instance_exists(oText) ? oTextQueued : oText;
	
	with (instance_create_layer(0, 0, "Instances", obj))
	{
		textMessage = Message;
		background = Background;
		originInstance = instance_exists(other) ? other.id : noone;
	}
	
	with (oPlayer)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}