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

//手电与墙的遮挡
var val, lowest, lowest_val;
lowest = noone;
lowest_val = noone;
with (oSomething1) 
{
	if x-other.x > x - other.x - other.facing //判断玩家对着这堵墙
	{
		val = point_distance(x,y,other.x,other.y);
		if (lowest == noone || val < lowest_val) 
		{
	    lowest = id;
	    lowest_val = val;
		}
	}
	else
	{
	lowest = noone;
	lowest_val = noone;
	}
}
//DEBUG
//压缩手电长度
if (lowest != noone) 
{
	if point_distance(x,y,lowest.x,lowest.y) < 130
	{
	clamp(lightLength,0.1,1)
	lightLength = point_distance(x,y,lowest.x,lowest.y)/130
	}
}
else
{
	lightLength = 1;
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

//是否下落
if(place_meeting(x, y + 1, object_solid))
{
    grounded = true;
}
else
{
    grounded = false;
}

//执行状态机
script_execute(state);

//角色朝向
if(xspeed != 0)                                                 //If the xspeed variable is not 0 it means
{                                                               //either the left or right key has been pressed
    facing = sign(xspeed);
	lightFacing = smooth_approach(lightFacing,facing,0.18) ;                                      //and so we can change the facing direction.
}

//Horizontal Collision and Movement
if(place_meeting(x + xspeed, y, object_solid))                  
{                                                               
    while(!place_meeting(x + sign(xspeed), y, object_solid))    
    {                                                           
        x += sign(xspeed);                                      
    }
    xspeed = 0;
}
x += xspeed;

//Vertical Collision and Movement
if(place_meeting(x, y + yspeed, object_solid))
{
    while(!place_meeting(x, y + sign(yspeed), object_solid))
    {
        y += sign(yspeed);
    }
    yspeed = 0;
}
y += yspeed;

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
		run_speed		= 8.9;
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

