//Swim State

var fluid = instance_place(x, y, object_fluid);                 //The fluid instance id is stored in a variable
                                                                //for future reference.
if(fluid == noone)                                              //If there is no fluid then change back to the
{                                                               //normal state.
    state = PLAYER_STATE.normal;
    exit;
}

if(object_ladder != noone && can_climb)                         //Change to climb state if there is a ladder.
{
    if(input_up || (input_down && !grounded))
    {
        if(place_meeting(x, y, object_ladder))
        {
            state = PLAYER_STATE.climb;
            jump_current = jump_number;
            exit;
        }
    }
}

xspeed = 0;                                                     //Set horizontal speed.
if(input_left)
{
    xspeed -= swim_speed;
}
if(input_right)
{
    xspeed += swim_speed;
}

var mask_width = bbox_right - bbox_left;                        //Here we calculate the buoyancy acting on the
var mask_height = bbox_bottom - bbox_top;                       //player. This is based on the amount of mask
var volume          = mask_width * mask_height;                 //below the top of the fluid object.
var mass            = density * volume;
var displacement    = clamp((bbox_bottom - fluid.bbox_top) /
                        sprite_height, 0, 1) * volume;

yspeed += ((-displacement * grav) / mass) -                     //Apply acceleration due to buoyancy.
            (yspeed * float_damping);

yspeed += grav;                                                 //Apply acceleration due to gravity.

if(yspeed < 0.02 && yspeed > -0.02)                             //Sometimes rounding error will cause the player
{                                                               //to judder when reaching equilibrium. This
    yspeed = 0;                                                 //piece of code is a simple fix which ensures the
}                                                               //yspeed will reach 0.

jump_current = jump_number - 1;                                 //We set this to jump_number - 1 so that the player
if(input_jump)                                                  //can make n - 1 jumps once out of the water since
{                                                               //one jump may not totally clear them from the fluid.
    yspeed = -sqrt(2 * grav * jump_height);                     //Prevents players from getting an extra jump. 
    jump_current--;
}

if(xspeed != 0)
{
    action = PLAYER_ACTION.swim;
}
else
{
    action = PLAYER_ACTION.float;
}
