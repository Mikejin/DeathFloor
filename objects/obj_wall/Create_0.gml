/*
How to instantiate a lightblocker:
-- First, set the points. You can set how many do you want.
*/

//first point, top left corner
cast_points_x[0] = 0;
cast_points_y[0] = 0;
 
//second point, top right corner
cast_points_x[1] = 32;
cast_points_y[1] = 0;
 
//third point, down right corner
cast_points_x[2] = 32;
cast_points_y[2] = 32;
 
//fourth point, down left corner
cast_points_x[3] = 0;
cast_points_y[3] = 32;

//calls the create script, and puts the result on a lightblocker variable
lightblocker = scr_ls_lightblocker_create(x, y, cast_points_x, cast_points_y);

/* */
/*  */
