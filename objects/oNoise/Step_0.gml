currentReach = smooth_approach(currentReach,noiseLevel*20,0.04)

if currentReach >= noiseLevel*20 * 0.90
{
	alpha -= 0.01
}

if currentReach >= noiseLevel*20 -1
{
	instance_destroy();
}