if instance_exists(master)
{
	//x = smooth_approach(x,master.x,0.1)
	//y = smooth_approach(y,master.y,0.1)
	x = master.x;
	y = master.y;

var cam = view_camera[master.playerNumber]

//摄像机跟随
camera_set_view_pos(cam,x-camera_get_view_width(cam)/2 + random_range(-shake,shake),y-camera_get_view_height(cam)/2 + random_range(-shake,shake));

//抖动
shake *= decay;
}
else
{
	instance_destroy()
}
