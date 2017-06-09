//判断是否被其他玩家看到
ds_list_clear(findMe)
for (var i=0;i<instance_number(oPlayer);i++)
{
	var curinst = instance_find(oPlayer,i);
	{
		if curinst.id != id //检查是不是自己
		{
			//检查看见
			var hear = point_distance(x,y,curinst.x,curinst.y) < noiseReach and noiseLevel > curinst.ListenThreshold 
			var see = point_distance(x,0,curinst.x,0) < 300 and lighted = true//不是自己且距离小于半个屏幕 
			var touch = ((sign(x-curinst.x) == sign(curinst.facing)) and point_distance(x,y,curinst.x,curinst.y) < 20)
			
			if 	hear  or touch or see
			{
				ds_list_add(findMe,curinst.id)
			}
		}
	}
}



