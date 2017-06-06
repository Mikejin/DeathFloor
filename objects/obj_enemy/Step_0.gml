/*
----- Here we set the position of the cast_points for every step of the animation.
-- Is the only way to do a shadow change with every frame of a sprite movement.
*/

if(image_index >= 0 && image_index <= 1) {
    lightblocker.cast_points_x[0] = 9;
    lightblocker.cast_points_y[0] = 13;
     
    lightblocker.cast_points_x[1] = 22;
    lightblocker.cast_points_y[1] = 13;
     
    lightblocker.cast_points_x[2] = 6;
    lightblocker.cast_points_y[2] = 31;
     
    lightblocker.cast_points_x[3] = 23;
    lightblocker.cast_points_y[3] = 29;
} else {
    lightblocker.cast_points_x[0] = 9;
    lightblocker.cast_points_y[0] = 15;
     
    lightblocker.cast_points_x[1] = 22;
    lightblocker.cast_points_y[1] = 15;
     
    lightblocker.cast_points_x[2] = 6;
    lightblocker.cast_points_y[2] = 31;
     
    lightblocker.cast_points_x[3] = 23;
    lightblocker.cast_points_y[3] = 29;
}

/* */
/*  */
