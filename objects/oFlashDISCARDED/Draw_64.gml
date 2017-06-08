draw_set_halign(fa_center); //Set the following to align centeral - horizontally
draw_set_valign(fa_bottom); //And the vertical alignment to the bottom
draw_set_colour(c_white); //Also set the colour to white


//DRAW FPS (frames per second) so we can see how fast the game runs, this is important to check for games with many instances
draw_set_valign(fa_top); //Now the vertical alignment to the top
draw_text(320,250, mouse_x);
draw_text(320,280, mouse_y);
draw_text(320,300, string(oPlayer.x-1*oPlayer.lightFacing));
draw_text(320,320, string(oPlayer.y+oPlayer.flashLightH));
draw_set_colour(c_black); //Reset the colour

