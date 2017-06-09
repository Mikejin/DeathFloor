//手电与墙的遮挡
var doorDis, closest, closest_doorDis;
closest = noone;
closest_doorDis = noone;
with (oDoor) 
{
	if sign(x-other.x) = sign(other.facing)  //说明玩家对着这堵墙
	{
		doorDis = point_distance(x,y,other.x,other.y);
		if (closest == noone || doorDis < closest_doorDis) 
		{
	    closest = id;
	    closest_doorDis = doorDis;
		}
	}
	else
	{
	closest = noone;
	closest_doorDis = noone;
	}
}

tem = closest
//压缩手电长度
if (closest != noone) 
{
	if point_distance(x,y,closest.x,closest.y) < 130
	{
	clamp(lightLength,0.1,1)
	lightLength = point_distance(x,y,closest.x,closest.y)/130
	}
}
else
{
	lightLength = 1;
}
