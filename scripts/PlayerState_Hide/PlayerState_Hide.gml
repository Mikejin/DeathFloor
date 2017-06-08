//Hide State
xspeed = 0; 
	if gamepad_button_check_pressed(playerNumber,butHide) 
	{
	leavingCover = true;
	} 
	 
	if leavingCover = true
	{
			if inCover > 0
			{
			inCover --;
			}
			else
			{
			leavingCover = false;
			state = PLAYER_STATE.normal;
			exit;
			}
	}	
	
//Set horizontal speed
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
}                                                     //Apply gravity

