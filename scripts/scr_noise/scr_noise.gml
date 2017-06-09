/// @description noise making
/// @function noise
/// @param  NoiseLevel
/// @param  Reach
/// @param  posX
/// @param  posY

xPos = argument2
yPos = argument3

sound = instance_create_layer(xPos,yPos,"Instances_2",oNoise)
sound.noiseLevel	= argument0
sound.noiseReach	= argument1;
sound.master		= id;