/// @description Process Player
if gamepad_is_connected(playerNumber)
{
scr_gamepad_movement(playerNumber);
}

//光
if lightOn = true
{
	if brightness<1
	{
		brightness = smooth_approach(brightness,1,0.15);
	}
}
else 
{
	if brightness >0
	{
		brightness = smooth_approach(brightness,0,0.15);
	}
}

//手电逻辑
scr_flashLight();

//判断是否被其他玩家看到
ds_list_clear(canSeeMe)
for (var i=0;i<instance_number(oPlayer);i++)
{
	var curinst = instance_find(oPlayer,i);
	{
		if curinst.id != id and point_distance(x,0,curinst.x,0) < 120 and lighted = true//不是自己且距离小于半个屏幕 
		{
		ds_list_add(canSeeMe,curinst.id)
		}
	}
}

//是否被照亮
if place_meeting(x,y,oLightSource) || lightOn ==true
{
	lighted = true;
}
else
{
	lighted = false;
}

//DEBUG

//被攻击
//击中的闪光
if hit
{
	//击退
	if !place_meeting(x+fallDir*3,y,oSolid)
	{
	x += 5*fallDir
	}

	if alarm[3] <=0
	{
	y -= 0;
	alarm[3] = 0.05 * room_speed; // Flashes for 0.8 seconds before turning back to normal
	}
}

//进入掩体alpha值下降
if enteringCover
{
	image_alpha = smooth_approach(image_alpha,0.20,0.15)
}
if leavingCover
{
	image_alpha = smooth_approach(image_alpha,1,0.15)
}


//执行状态机
script_execute(state);

//角色朝向
if(xspeed != 0)                                                 //If the xspeed variable is not 0 it means
{                                                               //either the left or right key has been pressed
    facing = sign(xspeed);
	lightFacing = smooth_approach(lightFacing,facing,0.08) ;                                      //and so we can change the facing direction.
}
//碰撞
scr_collision();

//重置手电高度
flashLightH		= smooth_approach(flashLightH,-26,0.25);

//Sprite and Animation
switch(action)                                                  //The switch statement checks the value of
{                                                               //'action' and then will perform the 
    case PLAYER_ACTION.idle:                                   //corresponding case.
        sprite_index    = sPlayerFlashOn;
		image_index		= 10;
        image_speed     = 0;
		run_speed		= 0.9
        break;
		
	case PLAYER_ACTION.crouchWalk:                                   //corresponding case.
        sprite_index    = sPlayerCrouch;
		image_speed		= 0.5;
		flashLightH		= smooth_approach(flashLightH,-16,0.1);
		run_speed		= 0.4
        break;	
		
	case PLAYER_ACTION.crouchIdle:                                   //corresponding case.
        sprite_index    = sPlayerCrouch;
		image_speed		= 0;
		image_index		= 1;
		flashLightH		= smooth_approach(flashLightH,-16,0.1);
		run_speed		= 0.4
        break;
    
    case PLAYER_ACTION.run:
        sprite_index    = sPlayerFlashWalk;
        image_speed     = 0.9;
		run_speed		= 0.9;
        break;
		
    case PLAYER_ACTION.attack:
        sprite_index    = sPlayerAttack;
        image_speed     = 0.9;
        break;
		
    case PLAYER_ACTION.fall:
        sprite_index    = sPlayerIdle;
        image_speed     = 5 / room_speed;
        break;
		
	case PLAYER_ACTION.looting:
        sprite_index    = sPlayerCheck;
        image_speed     = 0.6;
		
        break;
    
    case PLAYER_ACTION.float:
        sprite_index    = sPlayerIdle;
        image_speed     = 5 / room_speed;
        break;
    
    case PLAYER_ACTION.hold:
        sprite_index    = sPlayerClimb;
        image_speed     = 5 / room_speed;
        break;
    
    case PLAYER_ACTION.climb:
        sprite_index    = sPlayerClimb;
        if(yspeed < 0)
        {
            image_speed = 6 / room_speed;
        }
        else
        {
            image_speed = -6 / room_speed;
        }
        break;
    
    case PLAYER_ACTION.traverse:
        sprite_index    = sPlayerFlashWalk;
        image_speed     = 6 / room_speed;
        break;
}

