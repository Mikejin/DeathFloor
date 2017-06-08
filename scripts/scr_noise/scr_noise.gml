/// @description noise making
/// @function noise
/// @param  loudness
/// @param  duration
/// @param  posX
/// @param  posY

loudness = argument0
duration = argument1
xPos = argument2
yPos = argument3

sound = instance_create_depth(xPos,yPos,depth,oNoise)
sound.noiseLevel	= loudness
sound.alarm[0]		= duration;
sound.master		= id;