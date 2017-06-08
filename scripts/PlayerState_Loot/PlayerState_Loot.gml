//Hide State
xspeed = 0; 
if lootingProgress < looting.lootingTime
{
	lootingProgress ++
}
else	//完成搜索
{
	looting.looted = true;
	looting.looter = noone;
	state = PLAYER_STATE.normal
}



//Set horizontal speed
//重力
yspeed += grav;    
