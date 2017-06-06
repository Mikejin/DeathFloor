//Wall Jump State

yspeed += grav;

action = PLAYER_ACTION.wall_jump;

if(place_meeting(x + facing, y, object_solid) || yspeed > 0)    //If reaching the top of jump or hitting a wall
{                                                               //change to normal state.
    yspeed  = 0;
    state   = PLAYER_STATE.normal;
    exit;
}
