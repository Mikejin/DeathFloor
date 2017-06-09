if instance_exists(master)
{
	//x = smooth_approach(x,master.x,0.1)
	//y = smooth_approach(y,master.y,0.1)
	if master.lightOn
	{
	instance_activate_object(id)
	x = master.x;
	y = master.y+master.flashLightH;
	image_xscale = 0.3 *  master.lightFacing * master.brightness *master.lightLength
	image_yscale = 0.25 * master.brightness
	}
	else
	{
	instance_deactivate_object(id)
	}

}
else
{
	instance_destroy()
}
