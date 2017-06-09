	//听觉
if gamepad_button_check(playerNumber,gp_shoulderl) 
	{	
		state = PLAYER_STATE.listening;
		listening = true;
	}
	else
	{
		state = PLAYER_STATE.normal;
		listening = false;		
	}

if listening
{
	if focus > 0
	{
	focus -=1;
	ListenThreshold -= 1/room_speed; //每秒降低1
	}
	else
	{
	listening = false;
	}
}

xspeed = 0;                                                             //Set horizontal speed

	if !(input_left) and !(input_right)
	{
		moving = false;
	}

//重力
yspeed += grav;    

//开关手电
if gamepad_button_check_pressed(playerNumber,butFlashLight)
{
	if lightOn == true
	{
		lightOn = false;
	}
	else
	{
		lightOn = true;
	}
}                                                     

//蹲下和遮蔽层级变化逻辑
if gamepad_button_check_pressed(playerNumber,butCrouch)
{
	if position_meeting(x,y,oCover)
	{
		if crouching = false
		{
		crouching = true
		}
		else if crouching = true
		{
		crouching = false
		}
	}
	else//没有和掩体接触
	{
		if crouching = false
		{
		crouching = true
		depth = PLAYERBEHIND
		}
		else if crouching = true
		{
		crouching = false
		depth = PLAYERFRONT
		}
	}
}

//Apply gravity
if(yspeed > 0)
{
    if(grounded)
    {	
		//判断做什么动作中
		if moving
		{
			if !crouching//站立
			{action = PLAYER_ACTION.run}
			else	
			{action = PLAYER_ACTION.crouchWalk}
		}
		else //idle状态
		{
			if !crouching//站立
			{action = PLAYER_ACTION.idle}
			else
			{action = PLAYER_ACTION.crouchIdle}
		}
	}  
    else
    {action = PLAYER_ACTION.fall;}
	
}


