/// @description Process Player
if gamepad_is_connected(playerNumber)
{
scr_gamepad_movement(playerNumber);
}

//input_right = keyboard_check_direct(vk_right);                  //controls for your game.

input_jump  = gamepad_button_check_pressed(playerNumber,gp_face1);

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
    facing = sign(xspeed);                                      //and so we can change the facing direction.
}

//Horizontal Collision and Movement
if(place_meeting(x + xspeed, y, object_solid))                  //This collision code was originally written by
{                                                               //Shaun Spalding.
    while(!place_meeting(x + sign(xspeed), y, object_solid))    //He explains how it works in his youtube
    {                                                           //tutorial:
        x += sign(xspeed);                                      //https://www.youtube.com/watch?v=IysShLIaosk
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

//Sprite and Animation
switch(action)                                                  //The switch statement checks the value of
{                                                               //'action' and then will perform the 
    case PLAYER_ACTION.stand:                                   //corresponding case.
        sprite_index    = sPlayerIdle;
        image_speed     = 1;
        break;
    
    case PLAYER_ACTION.run:
        sprite_index    = sPlayerFlashWalk;
        image_speed     = 2;
        break;
    
    case PLAYER_ACTION.jump:
        sprite_index    = spPlayer_Jump;
        image_speed     = 5 / room_speed;
        break;
    
    case PLAYER_ACTION.fall:
        sprite_index    = sPlayerIdle;
        image_speed     = 5 / room_speed;
        break;
    
    case PLAYER_ACTION.ledge_grab:
        sprite_index    = spPlayer_LedgeGrab;
        image_speed     = 5 / room_speed;
        break;
    
    case PLAYER_ACTION.float:
        sprite_index    = spPlayer_Float;
        image_speed     = 5 / room_speed;
        break;
    
    case PLAYER_ACTION.swim:
        sprite_index    = spPlayer_Swim;
        image_speed     = 7 / room_speed;
        break;
    
    case PLAYER_ACTION.hold:
        sprite_index    = spPlayer_Hold;
        image_speed     = 5 / room_speed;
        break;
    
    case PLAYER_ACTION.climb:
        sprite_index    = spPlayer_Climb;
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
        sprite_index    = spPlayer_Traverse;
        image_speed     = 6 / room_speed;
        break;
}

