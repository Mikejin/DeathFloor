/// @description Initialize Player
playerNumber = 0;
randomize();

moving = false;

//创建手电
lightOn = false;		//开手电了吗？
lightLength = 1;	//跟枪碰撞的手电
brightness = 1;		//手电亮度
lightFacing = 1;	//手电朝向

//听觉系统
listening		= true;
focus			= room_speed * 5
focusMax		= room_speed * 5;
ListenThreshold	= 7;
noiseLevel	= 1;
noiseReach	= 0;

temp = false;

noiseRate	= room_speed *2;	//制造声音的冷却时间
alarm[1]	= room_speed *2;	//制造噪音

//lightLayer = instance_create_depth(x,y,depth,obj_control)
//lightLayer.master = id;

//叠层
depth = PLAYERFRONT;
//临时
tem = noone;

//谁能看见我？
findMe = ds_list_create();


//Enumerations
enum PLAYER_STATE                               //Each state is assigned the index of the corresponding script.
{                                               //This means that to execute the correct state we can use
    normal      = PlayerState_Normal,           //script_execute(state) rather than a switch statement.
    swim        = PlayerState_Swim,
    climb       = PlayerState_Climb,
	hide		= PlayerState_Hide,
	check		= PlayerState_Loot,
	listening	= PlayerState_Listening
}
enum PLAYER_ACTION                              //This is used simply as a way of telling what the player is
{                                               //doing to avoid having to put animation, sound or effects
    idle,                                      //code into the state scripts. This keeps everything tidy.
    run,                                        //It would also allow some more flexability if you need to
    jump,                                       //know what player is doing.
    fall,
    float,
    swim,
    hold,
    climb,
    traverse,
	crouchIdle,
	crouchWalk,
	looting,
	attack

}


//Objects
object_solid        = oSolid;                  //These are all of the environment objects that the player can
object_fluid        = oFluid;                  //interact with.
object_ladder       = oLadder;                 //object_solid is the only required object. The others should
object_wall         = oWall;                   //be assigned the keyword 'noone' if you do not require them.
object_cover		= oCover;					

//Inputs
inputing			= false;
input_left          = false;                    //These are the character controls, assigned in the step event
input_right         = false;                    //code and later referenced in the player state scripts.
input_up            = false;                    //To change the control keys you should look at the step event.
input_down          = false;
input_jump          = false;

//Player State Variables
state               = PLAYER_STATE.normal;      //These variables are used to keep track of the player's
action              = PLAYER_ACTION.idle;      //basic control statistics.
facing              = choose(-1,1);                        //The facing variable determines whether the player is facing
grounded            = false;                    //left or right (-1 or 1). The grounded variable determines
xspeed              = 0;                        //whether the player is on the ground or not (true or false).
yspeed              = 0;
flashLightH			= -26;

can_ledge_grab      = true;                     //All of these boolean values allow you to switch off specific
can_swim            = true;                     //states. This allows you to easily implement unlockable
can_climb           = true;                     //skills.
can_wall_slide      = true;
can_wall_jump       = true;
can_hide			= true;

//Horizontal Movement
run_speed           = 1.3;
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

//状态相关

enteringCover		= false;
leavingCover		= false;
inCover				= false;
inOutCoverTime		= 1.7 * room_speed;
lighted				= false;	//被照亮？
crouching			= false;//蹲下？
noiseLevel			= 0;//噪音等级
lootingProgress		= 0;//搜索的进度

//战斗
hit					=false;
canAttack			= true;
attackRate			= 20;
fallDir				= 0;

//按键
butFlashLight		= gp_face4
butCheck			= gp_face1
butCrouch			= gp_face2
butATK				= gp_face3

//噪音
noiseFreq			= 2 * room_speed;
alarm[1]			= 60;

//创建叠色板
blend = instance_create_layer(x,y,"Instances_2",oBlendLayer)
blend.master = id;

//创建手电
flashLight = instance_create_depth(x,y,depth,oPlayerFlashLight)
flashLight.master = id;

//创建ghost
ghost = instance_create_layer(x,y,"Instances_2",oPlayerGhost)
ghost.master = id;

//摄像机
camera = instance_create_depth(x,y-50,depth,oCamera);
camera.master = id;

//进度条
progress = instance_create_depth(x,y-50,depth,oProgressCircle);
progress.master = id;

//Instantiate a light and put the result on the light variable
//light = scr_ls_light_create(x, y, flashLightRange, c_olive, 0.7);