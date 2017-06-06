//Normal State

xspeed = 0;                                                             //Set horizontal speed
if(input_left)
{
    xspeed -= run_speed;
}
if(input_right)
{
    xspeed += run_speed;
}

yspeed += grav;                                                         //Apply gravity

if(yspeed <= 0)
{
    action = PLAYER_ACTION.jump;
}
else
{
    if(grounded)
    {
        jump_current = jump_number;
        action = PLAYER_ACTION.stand;
        if(xspeed != 0)
        {
            action = PLAYER_ACTION.run;
        }
    }
    else
    {
        action = PLAYER_ACTION.fall;
    }
    
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
}
