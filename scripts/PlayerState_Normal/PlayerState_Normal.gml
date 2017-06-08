//Normal State

xspeed = 0;                                                             //Set horizontal speed
if !enteringCover and !leavingCover
{
	if(input_left) 
	{
	    xspeed -= run_speed;
		moving = true;
	}
	if(input_right)
	{
	    xspeed += run_speed;
		moving = true;
	}
	if !(input_left) and !(input_right)
	{
		moving = false;
	}
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
    
	//爬梯子
    if(object_ladder != noone && can_climb)
    {
        if(input_up || (input_down && !grounded))
        {
            if(place_meeting(x, y, object_ladder) &&                //This collision line checks across the top
                collision_line(bbox_left, bbox_top - 1, bbox_right, //of the player mask to ensure his feet aren't
                bbox_top -1, object_ladder, false, true) != noone)  //just touching a ladder while his body is above
            {                                                       //it.
                jump_current = jump_number;
                state = PLAYER_STATE.climb;
                exit;
            }
        }
    }
	
	//调查
	if gamepad_button_check_pressed(playerNumber,butCheck)
    {
        if place_meeting(x, y, oSomething)                //This collision line checks across the top 
        {    
		action = PLAYER_ACTION.looting;
		state = PLAYER_STATE.check;
		looting = instance_place(x,y,oSomething)
		looting.looter = id;
		exit;
		}
	}	
	
	/*
	//躲避
	if(object_cover != noone && can_hide)
    {
        if gamepad_button_check_pressed(playerNumber,butHide)
        {
            if place_meeting(x, y, object_cover)                //This collision line checks across the top 
            {    
				enteringCover = true;
				xspeed  = 0;		                                              
            }
        }
		if enteringCover = true
		{
			if inCover < inOutCoverTime
			{
				inCover ++
			}
			else
			{
			state = PLAYER_STATE.hide;
			enteringCover = false;
			exit;
			}
		}	
    }
	*/
}


