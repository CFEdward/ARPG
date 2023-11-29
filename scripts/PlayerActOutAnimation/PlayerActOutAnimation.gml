/// @desc PlayerActOutAnimation(Sprite, EndScript)
/// @arg Sprite
/// @arg EndScript

// Carry out an animation and optionally carry out a script when the animation ends
function PlayerActOutAnimation(Sprite, EndScript = -1)
{
	state = PlayerStateAct;
	sprite_index = Sprite;
	animationEndScript = EndScript;
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
}