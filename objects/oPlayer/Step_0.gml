/// @description Process Player
if gamepad_is_connected(playerNumber)
{
scr_gamepad_movement(playerNumber);
}

//光
if lightOn = true
{
	instance_activate_object(flashLight)//关闭手电筒
	if brightness<1
	{
		brightness = smooth_approach(brightness,1,0.15);
	}
}
else 
{
	instance_deactivate_object(flashLight)
	if brightness >0
	{
		brightness = smooth_approach(brightness,0,0.15);
	}
}

//碰撞
scr_collision();

//手电逻辑
scr_flashLight();

//管理自己被谁发现
scr_expose();

if !listening//不在聆听状态
{
		//才会回复聆听值
	if focus < focusMax
	{
	focus += focusMax/room_speed/18;
	}
}

//是否被照亮
temp = place_meeting(x,y,oLightSource)
if temp || lightOn ==true
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
		noiseLevel		= 1;
		noiseRate		= room_speed*2;
		noiseReach		= 30;
        break;
		
	case PLAYER_ACTION.crouchWalk:                                   //corresponding case.
        sprite_index    = sPlayerCrouch;
		image_speed		= 0.5;
		flashLightH		= smooth_approach(flashLightH,-16,0.1);
		run_speed		= 0.4
		noiseLevel		= 2;
		noiseRate		= room_speed*1.4;
		noiseReach		= 100;
        break;	
		
	case PLAYER_ACTION.crouchIdle:                                   //corresponding case.
        sprite_index    = sPlayerCrouch;
		image_speed		= 0;
		image_index		= 1;
		flashLightH		= smooth_approach(flashLightH,-16,0.1);
		run_speed		= 0.4
		noiseLevel		= 1;
		noiseRate		= room_speed*2;
		noiseReach		= 30;
        break;
    
    case PLAYER_ACTION.run:
        sprite_index    = sPlayerFlashWalk;
        image_speed     = 0.9;
		run_speed		= 0.9;
		noiseLevel		= 5;
		noiseRate		= room_speed*0.6;
		noiseReach		= 280;
        break;
		
    case PLAYER_ACTION.attack:
        sprite_index    = sPlayerAttack;
        image_speed     = 0.9;
		noiseLevel		= 4;
		noiseRate		= room_speed*0.6;
		noiseReach		= 300;
        break;
		
    case PLAYER_ACTION.fall:
        sprite_index    = sPlayerIdle;
        image_speed     = 5 / room_speed;
		
        break;
		
	case PLAYER_ACTION.looting:
        sprite_index    = sPlayerCheck;
        image_speed     = 0.6;
		noiseLevel		= 4;
		noiseRate		= room_speed*1;
		noiseReach		= 300;
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
		noiseLevel		= 3;
        break;
    
    case PLAYER_ACTION.traverse:
        sprite_index    = sPlayerFlashWalk;
        image_speed     = 6 / room_speed;
		noiseLevel		= 3;
        break;
}

