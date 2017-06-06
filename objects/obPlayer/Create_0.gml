/// @description Initialize Player
playerNumber = 0;

//Enumerations
enum PLAYER_STATE                               //Each state is assigned the index of the corresponding script.
{                                               //This means that to execute the correct state we can use
    normal      = PlayerState_Normal,           //script_execute(state) rather than a switch statement.
    ledge_grab  = PlayerState_LedgeGrab,
    swim        = PlayerState_Swim,
    climb       = PlayerState_Climb,
    wall_jump   = PlayerState_WallJump
}
enum PLAYER_ACTION                              //This is used simply as a way of telling what the player is
{                                               //doing to avoid having to put animation, sound or effects
    stand,                                      //code into the state scripts. This keeps everything tidy.
    run,                                        //It would also allow some more flexability if you need to
    jump,                                       //know what player is doing.
    fall,
    ledge_grab,
    float,
    swim,
    hold,
    climb,
    traverse,
    wall_slide,
    wall_jump
}

//Objects
object_solid        = obSolid;                  //These are all of the environment objects that the player can
object_fluid        = obFluid;                  //interact with.
object_ladder       = obLadder;                 //object_solid is the only required object. The others should
object_wall         = obWall;                   //be assigned the keyword 'noone' if you do not require them.

//Inputs
inputing = false;
input_left          = false;                    //These are the character controls, assigned in the step event
input_right         = false;                    //code and later referenced in the player state scripts.
input_up            = false;                    //To change the control keys you should look at the step event.
input_down          = false;
input_jump          = false;

//Player State Variables
state               = PLAYER_STATE.normal;      //These variables are used to keep track of the player's
action              = PLAYER_ACTION.stand;      //basic control statistics.
facing              = 1;                        //The facing variable determines whether the player is facing
grounded            = false;                    //left or right (-1 or 1). The grounded variable determines
xspeed              = 0;                        //whether the player is on the ground or not (true or false).
yspeed              = 0;

can_ledge_grab      = true;                     //All of these boolean values allow you to switch off specific
can_swim            = true;                     //states. This allows you to easily implement unlockable
can_climb           = true;                     //skills.
can_wall_slide      = true;
can_wall_jump       = true;

//Horizontal Movement
run_speed           = 4;
swim_speed          = 2;
traverse_speed      = 2;    //When moving sideways on a ladder object.
wall_jump_speed     = 4;    //The horizontal speed when jumping off a wall.

//Vertical Movement
grav                = 0.2;
jump_height         = 32;
jump_number         = 2;    //How many times the player can jump (eg 2 = double jump).
jump_current        = 0;    //This is a counter and should be left at 0.
density             = 0.7;  //The density variable affects how deep the player floats in a fluid object.
float_damping       = 0.08; //Effectively water friction. Higher value will simulate thicker fluid.
climb_speed         = 1;
wall_slide_speed    = 2;
wall_jump_height    = 48;

hang_height         = 36;   //How many pixels below the ledge the player will hang.

