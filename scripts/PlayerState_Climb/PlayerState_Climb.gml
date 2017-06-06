//Climb State

if(!place_meeting(x, y, object_ladder))                             //If the player falls off the ladder then
{                                                                   //change back to the normal state.
    state = PLAYER_STATE.normal;
    exit;
}

xspeed = 0;                                                         //If the user doesn't make any key presses
yspeed = 0;                                                         //we don't want to move at all.

if(input_jump)                                                      //If the jump key is pressed, jump off the
{                                                                   //ladder.
    yspeed = -sqrt(2 * grav * jump_height);
    jump_current--;
    state = PLAYER_STATE.normal;
    exit;
}

if(input_up && collision_line(bbox_left, bbox_top - 1,              //Like in the normal state, This collision
    bbox_right, bbox_top -1, object_ladder, false, true) != noone)  //line checks across the top of the player
{                                                                   //mask to ensure he doesnt climb obove the
    yspeed -= climb_speed;                                          //top of the ladder.
}
if(input_down)
{
    yspeed += climb_speed;
    
    if(grounded)                                                    //If climbing down and hitting the ground
    {                                                               //change to normal state.
        state = PLAYER_STATE.normal;
        exit;
    }
}

if(yspeed == 0)                                                     //Only allow horizontal movement when not
{                                                                   //climbing.
    if(input_left)
    {
        xspeed -= traverse_speed;
    }
    if(input_right)
    {
        xspeed += traverse_speed;
    }
}

if(yspeed != 0)
{
    action = PLAYER_ACTION.climb;
}
else if(xspeed != 0)
{
    action = PLAYER_ACTION.traverse;
}
else
{
    action = PLAYER_ACTION.hold;
}
