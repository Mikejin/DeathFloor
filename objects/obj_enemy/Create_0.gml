//set the sprite animation speed
image_speed = 0.05;

/*
How to instantiate a lightblocker:
-- First, set the points. You can set how many do you want.
*/

cast_points_x[0] = 9;
cast_points_y[0] = 13;
 
cast_points_x[1] = 22;
cast_points_y[1] = 13;
 
cast_points_x[2] = 6;
cast_points_y[2] = 31;
 
cast_points_x[3] = 23;
cast_points_y[3] = 29;

/*
Calls lightblock create EXTENDED script, and send the id of the object.
With that, the sprite of the enemy will not be painted dark.
*/
lightblocker = scr_ls_lightblocker_create_ext(x, y, cast_points_x, cast_points_y, id);

/* */
/*  */
