//Create a new surface if it doesn't exist anymore, for example when you minimize the window the surface gets deleted
if (!surface_exists(surface)) {
    surface = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
}

//The following is the main part, here you can control all the lighting effects

surface_set_target(surface); //Frist we tell Game Maker which surface we want the following code to be assigned

draw_clear(c_black); //This makes the whole surface completely black, you can change it to any colour you want, for example if you want a dark blue, put the following instead of "c_black": make_colour_rgb(5, 5, 22)
draw_set_blend_mode(bm_add); //Now let's change the blend mode to adding stuff

draw_set_alpha(surface_alpha); //Change the alpha to the surface_alpha variable (the one we changed in the step event) so our rectangle we draw in the line below has that alpha
draw_rectangle_colour(__view_get( e__VW.XView, 0 )-__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )-__view_get( e__VW.YView, 0 ), (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ))-__view_get( e__VW.XView, 0 ), (__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))-__view_get( e__VW.YView, 0 ), c_white, c_white, c_white, c_white, false); //Now draw a coloured rectangle as big as the whole view, in this case it's just white, you can of course change it to any colour you want, for exmaple if you want a dawn effect colour it red-ish
draw_set_alpha(1); //Reset the alpha again

//Torch light
with (obj_torch) { //This runs through all the instances of the given object

    //Again, just like the rectangle we drew before, this is going to be subtracted from the surface 
    draw_sprite_ext(light_sprite, 0, x - __view_get( e__VW.XView, 0 ), y - __view_get( e__VW.YView, 0 ), light_size, light_size, 0, light_colour, light_alpha); //Here we draw a sprite that is scaled (the 0.5 for xscale and yscale - just change that if you want it to be bigger/smaller) and we use the sprite, light colour and light alpha that are selected from the torch object itself (in the create event)
    
    //Use the following instead of the line above if you want flickering light:
    //draw_sprite_ext(light_sprite, 0, x - view_xview[0], y - view_yview[0], random_range(0.5,0.55), random_range(0.5,0.55), 0, light_colour, light_alpha);
}

//Player light
with (oPlayer) { //The code in here runs through all the player instances
    draw_sprite_ext(spr_light_circle, 0, x - __view_get( e__VW.XView, 0 ), y - __view_get( e__VW.YView, 0 ), 0.2, 0.2, 0, make_color_rgb(255,159,79), 0.4); //Here we do the same as above, but we use a specific colour, alpha and scale
    //draw_sprite_ext(spr_light_circle, 0, x - __view_get( e__VW.XView, 0 ), y - __view_get( e__VW.YView, 0 ), 0.5, 0.5, 0, make_color_rgb(255,159,79), 0.4); //This is another light, the outer light that follows the player - to show you can "stack" light too
    draw_sprite_ext(spr_light_player, 0, x - __view_get( e__VW.XView, 0 ), y - __view_get( e__VW.YView, 0 ), 0.7, 0.7, 0, make_color_rgb(255,159,79), 0.9); //Now let's draw the flash light whose angle follows the mouse direction (see "light_angle" in obj_player)
}

draw_set_alpha(1); //Just to make sure our drawing alpha will stay at 1 when we're finished

draw_set_blend_mode(bm_normal); //Also reset the blend mode at the end
surface_reset_target(); //And the targeted surface too



/*



//Player light
with (oPlayer) 
{ //The code in here runs through all the player instances
    draw_sprite_ext(spr_light_circle, 0, x-camera_get_view_x(view_camera[playerNumber]), y-camera_get_view_y(view_camera[playerNumber])+flashLightH, 0.05* brightness*lightLength, 0.05* brightness*lightLength, 0, make_color_rgb(255,159,79), 0.4); //Here we do the same as above, but we use a specific colour, alpha and scale
    //draw_sprite_ext(spr_light_circle, 0, x - __view_get( e__VW.XView, 0 ), y - __view_get( e__VW.YView, 0 ), 0.5, 0.5, 0, make_color_rgb(255,159,79), 0.4); //This is another light, the outer light that follows the player - to show you can "stack" light too
    draw_sprite_ext(spr_light_player, 0, x-camera_get_view_x(view_camera[playerNumber])-1*lightFacing, y-camera_get_view_y(view_camera[playerNumber])+flashLightH, 0.3 *lightFacing* brightness*lightLength, 0.25* brightness, 0, make_color_rgb(255,159,79), 0.9); //Now let's draw the flash light whose angle follows the mouse direction (see "light_angle" in obj_player)
}

draw_set_alpha(1); //Just to make sure our drawing alpha will stay at 1 when we're finished

draw_set_blend_mode(bm_normal); //Also reset the blend mode at the end
surface_reset_target(); //And the targeted surface too

depth = TOPLAYER
