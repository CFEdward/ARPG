/// @desc ScreenShake(Magnitude, Frames)
/// @arg Magnitude sets the strength of the shake (distance range)
/// @arg Frames sets the length of the shake in frames (60 = 1 second)
function ScreenShake(Magnitude, Frames)
{
	with (global.iCamera)
	{
		if (Magnitude > shakeRemain)
		{
			shakeMagnitude = Magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = Frames;
		}
	}
}