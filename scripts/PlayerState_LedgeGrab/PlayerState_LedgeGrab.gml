//Ledge Grab State

action = PLAYER_ACTION.ledge_grab;

if(input_down)                                  //If the down key is pressed he will drop straight down.
{
    state = PLAYER_STATE.normal;
    exit;
}

if(input_jump)                                  //If the jump key is pressed he will jump off the ledge.
{
    yspeed = -sqrt(2 * grav * jump_height);
    jump_current--;
    state = PLAYER_STATE.normal;
    exit;
}
