draw_set_halign(fa_center); //Set the following to align centeral - horizontally
draw_set_valign(fa_bottom); //And the vertical alignment to the bottom
draw_set_colour(c_white); //Also set the colour to white

//Let's draw some tutorial text
//draw_text(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-8, string_hash_to_newline("Press 'R' to restart"));
//draw_text(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-26, string_hash_to_newline("Click to place a light source"));
//draw_text(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-44, string_hash_to_newline("Move with 'WASD'"));

//DRAW FPS (frames per second) so we can see how fast the game runs, this is important to check for games with many instances
draw_set_valign(fa_top); //Now the vertical alignment to the top
draw_text(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2), __view_get( e__VW.YView, 0 )+4, string_hash_to_newline("FPS: " + string(round(fps_real))));

draw_set_colour(c_black); //Reset the colour

